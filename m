Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2EA26F2BE
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804408; cv=none; b=MrSDitzCwCU/loPucaFIaNZRnpCrBmBKlp5/V2IRNvx7bY6iZAsTh833Zc9iyEsJlbchw5XzayOR/8UlsDMabqB37OV0uIrdHpKPYexQdipCZa38WjpTeL9YWpcBiS6aAFxOiLx9rXYNQ4r8fI8WCmFg0CXPUPvJ5hTHMEofE8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804408; c=relaxed/simple;
	bh=/P9ElN84lNEbcjOFE55hMXlYEmA1bI4K0SQfX/ffM/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VJAckop37auJikZQ5m/BWOiqBqNTP/eww47Nr7O0cifQ+dCRUczW+xEcDW4i4aeZdNuT8KKUT404pkH/KoAC6v7bvFchsc5jZXQK9govJjd7qo0v4+nZ2wCmAwQW3VN4Y7542aldWvi2UT03exRK7DM5N6bFBSlPfwOmi51FbC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62281F00A3A;
	Thu, 23 Jul 2026 11:00:04 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpci: pass correct rx_type to
 tcpm_pd_receive()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260723104614.3717623-1-xu.yang_2@oss.nxp.com>
References: <20260723104614.3717623-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:00:00 +0000
Message-Id: <20260723110004.A62281F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Returning a negative error code from `regmap_read()` directly in a=
n IRQ thread function skips the interrupt acknowledgment, causing an interr=
upt storm.
- [High] Flawed 1:1 enum and bit mapping misclassifies Cable Reset messages=
 as Hard Reset messages.
- [Medium] Data race on `tcpci->rx_type_mask` between workqueue and IRQ con=
text.
- [Low] Passing an enum pointer to `regmap_read()` violates strict typing a=
nd breaks the build.

Pre-existing issues:
- [High] Uninitialized stack variables are used after potentially failed I2=
C reads.
--

--- Patch [1]: [PATCH v2] usb: typec: tcpci: pass correct rx_type to tcpm_p=
d_receive() ---
commit f5e85aadc576c9a21ace1e250d65e3ad2d0b7a00
Author: Xu Yang <xu.yang_2@nxp.com>
usb: typec: tcpci: pass correct rx_type to tcpm_pd_receive()

This patch updates the TCPCI driver to dynamically determine the RX frame t=
ype
instead of hardcoding it to TCPC_TX_SOP. It caches the TCPC_RX_DETECT regis=
ter
and verifies incoming messages against this mask before passing them to the
TCPM core.

> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpc=
i.c
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -488,6 +489,8 @@ static int tcpci_set_pd_rx(struct tcpc_dev *tcpc, boo=
l enable)
>  		if (tcpci->data->cable_comm_capable)
>  			reg |=3D TCPC_RX_DETECT_SOP1;
>  	}
> +
> +	tcpci->rx_type_mask =3D reg;

[Severity: Medium]
Could this assignment to tcpci->rx_type_mask race with the read in tcpci_ir=
q()?
This variable is written in process context here and read in interrupt cont=
ext,
but lacks locking or READ_ONCE/WRITE_ONCE annotations, which might allow
compiler optimizations to reorder or cache the variable unexpectedly.

>  	ret =3D regmap_write(tcpci->regmap, TCPC_RX_DETECT, reg);

[ ... ]

> @@ -749,6 +752,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  	if (status & TCPC_ALERT_RX_STATUS) {
>  		struct pd_message msg;
>  		unsigned int cnt, payload_cnt;
> +		enum tcpm_transmit_type rx_type;
>  		u16 header;
> =20
>  		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);

[Severity: High]
This is a pre-existing issue, but is it safe to use cnt unconditionally?
If the I2C read fails here, cnt remains uninitialized. Could this lead to
processing garbage data as USB PD messages and corrupting the state machine?

>  		/*
>  		 * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.4.14
>  		 * of the TCPCI spec [Rev 2.0 Ver 1.0 October 2017] and is

[ ... ]

> @@ -773,10 +777,16 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  			regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
>  					&msg.payload, payload_cnt);
> =20
> +		ret =3D regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE, &rx_type);

[Severity: Low]
Does passing an enum pointer to regmap_read() violate strict typing?
regmap_read() expects an unsigned int *, but &rx_type is of type
enum tcpm_transmit_type *. Would this trigger -Wincompatible-pointer-types
warnings and fail the build on modern kernels?

> +		if (ret)
> +			return ret;

[Severity: High]
Does returning a negative error code directly from this IRQ thread function
skip the interrupt acknowledgment?

tcpci_irq()
    if (ret)
        return ret;
    ...
    tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);

Since the TCPC alert pin is level-triggered, would leaving the alert bit
unacknowledged cause the interrupt to remain asserted and result in an
infinite IRQ storm? Also, is returning a negative integer a valid irqreturn=
_t
value?

> +
>  		/* Read complete, clear RX status alert bit */
>  		tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
> =20
> -		tcpm_pd_receive(tcpci->port, &msg, TCPC_TX_SOP);
> +		rx_type &=3D TCPC_RX_BUF_FRAME_TYPE_MASK;
> +		if (tcpci->rx_type_mask & BIT(rx_type))
> +			tcpm_pd_receive(tcpci->port, &msg, rx_type);

[Severity: High]
Does the 1:1 mapping between TCPC_RX_BUF_FRAME_TYPE and enum tcpm_transmit_=
type
hold true?

The TCPCI spec maps TCPC_RX_BUF_FRAME_TYPE value 5 to 'Cable Reset', but
TCPC_RX_DETECT bit 5 is 'Hard Reset'. Because the driver enables bit 5 for =
Hard
Resets, receiving a Cable Reset would evaluate as allowed, and pass rx_type=
 5
to TCPM.

In enum tcpm_transmit_type, 5 is TCPC_TX_HARD_RESET. Would the TCPM state
machine then process a 0-byte hardware packet as an invalid Hard Reset RX
message instead of a Cable Reset, corrupting the protocol state?

>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723104614.3717=
623-1-xu.yang_2@oss.nxp.com?part=3D1
