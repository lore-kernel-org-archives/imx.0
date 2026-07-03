Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4C4381EB9
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 06:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783060791; cv=none; b=p6eZvyGhcqGozCboj4THMp1BBv15e1HwziqNUBwaxzD/tfMTz9jUnnee+SvP+uiFN4EPhisWIOq2Iynk/gOb0HetDRFtBKQFDtGXmgQI9DCdAwnLwewSlqAO+NrjOnU6hPbIIFlW5hoBw0OcOGagiCiwctOaj14yBm6Ij976jjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783060791; c=relaxed/simple;
	bh=bG6FaFUeVd2aZ+Kbku79/TZASTa2zOEkduitCpPP7Eo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JrgKRE13rveKFBu4aeUqQzI4hQEJtkmF7WKd1UuLmV+O/rJ+CyKnEZW3JTRLJt1V9xjiFKiJ4BGsVyCzNYt2PFxyx1YLTU8npdRrzJwWkVLgIX1hXq08NFRw3g8ekyzEm+saWJjUvAkunvDWeo/sLnWhjCoQmlYKWzYl9WiYKDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDiTfRiG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDiTfRiG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6701F000E9;
	Fri,  3 Jul 2026 06:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783060789;
	bh=Ln0pDcbhrju25AffId07B/nCCcK64WGRj2lgwwSh16M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oDiTfRiGnJ8cOf6aFmhDj/W//Wo7AuUZLKlSWVGjVLcT4AMDeVavU7ekaet6H8XLx
	 3rFQmKNkjAu/m/L1mO7rj5ExKmPW5R7/uPX4YT6BqOw8eRVVh79rNO74Vvoab9pYic
	 35fbWQU7OWJjytzF3fns95XjslR4mj+mJd/EJr5a1sBJYpUVMx8o3JMmfzK2GJfn82
	 Q0T6fN1oW6DI/OU3f06KrpdypDKEQZ50Q58I2+DXUMJGunMABjMpmEKB6emmM+pc3n
	 hrbateWfn5ViX3zb/mL2yDUDje+wuXlHfTwAEE3ovTtpsNydjFOs/OtiyE1T6CSFwI
	 JnOpsJyoHsfQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tcpci: pass correct rx_type to
 tcpm_pd_receive()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260703063247.2521524-1-xu.yang_2@oss.nxp.com>
References: <20260703063247.2521524-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 06:39:48 +0000
Message-Id: <20260703063949.0E6701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The newly added regmap_read() for TCPC_RX_BUF_FRAME_TYPE ignores i=
ts return value, leading to the use of an uninitialized stack variable.

Pre-existing issues:
- [High] Unchecked I2C read failure at the end of the IRQ handler causes an=
 infinite loop and CPU hang.
- [High] Incorrect endianness conversion for 16-bit registers on Big Endian=
 architectures corrupts message headers and status flags.
- [Medium] Missing I2C read error checks lead to the use of uninitialized s=
tack variables for `cnt` and `header`.
--

commit 81a7c680e2fcddf86dbe13e10560745c1e22e61c
Author: Xu Yang <xu.yang_2@nxp.com>

usb: typec: tcpci: pass correct rx_type to tcpm_pd_receive()

This commit reads the frame type from the TCPC_RX_BUF_FRAME_TYPE register
after receiving a PD message. It maps the read value to the appropriate
transmit type and passes it to tcpm_pd_receive() to correctly distinguish
SOP from SOP' messages.

> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpc=
i.c
> index 7ac7000b2d139..c19413f41bcb6 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
[ ... ]
> @@ -748,7 +748,8 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> =20
>  	if (status & TCPC_ALERT_RX_STATUS) {
>  		struct pd_message msg;
> -		unsigned int cnt, payload_cnt;
> +		unsigned int cnt, type, payload_cnt;
> +		enum tcpm_transmit_type rx_type;
>  		u16 header;
> =20
>  		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);

[Severity: Medium]
This is a pre-existing issue, but what happens if the I2C read for
TCPC_RX_BYTE_CNT fails?

If regmap_read() returns an error, the local stack variable `cnt` remains
uninitialized. This random stack data would then be used for calculating
`payload_cnt` further down.

>  		/*
>  		 * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.4.14
[ ... ]
>  		if (cnt > 3)
>  			payload_cnt =3D cnt - (1 + sizeof(msg.header));
>  		else
>  			payload_cnt =3D 0;
> =20
> +		regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE, &type);
> +		switch (type) {

[Severity: High]
Does this code use an uninitialized value if the I2C read fails?

If regmap_read() returns an error code due to an I2C failure, `type` will be
left uninitialized and contain random stack memory. This garbage value is
then evaluated in the switch statement, which could incorrectly map a normal
SOP message as an SOP' message and disrupt Power Delivery negotiations.

> +		case TCPC_RX_BUF_FRAME_TYPE_SOP1:
> +			rx_type =3D TCPC_TX_SOP_PRIME;
> +			break;
> +		case TCPC_RX_BUF_FRAME_TYPE_SOP:
> +		default:
> +			rx_type =3D TCPC_TX_SOP;
> +			break;
> +		}
> +
>  		tcpci_read16(tcpci, TCPC_RX_HDR, &header);

[Severity: Medium]
This is a pre-existing issue, but similar to the TCPC_RX_BYTE_CNT read,
should the return value of tcpci_read16() be checked here?

If the read fails, `header` remains uninitialized before being evaluated
on the next line.

>  		msg.header =3D cpu_to_le16(header);

[Severity: High]
This is a pre-existing issue, but could this byte swap result in corrupted
message headers on Big Endian architectures?

Looking at tcpci_read16(), it uses regmap_raw_read() to read a 16-bit
register into a host u16 variable. regmap_raw_read() bypasses endianness
formatting, meaning the buffer gets the raw little-endian bytes from the
device.

On a Big Endian CPU, reading this u16 produces a byte-swapped value. When
cpu_to_le16() is then applied, it byte-swaps the value again, resulting in
an incorrect big-endian byte sequence in memory. This breaks the
interpretation of the header in the TCPM core.

> =20
[ ... ]
>  		/* Read complete, clear RX status alert bit */
>  		tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
> =20
> -		tcpm_pd_receive(tcpci->port, &msg, TCPC_TX_SOP);
> +		tcpm_pd_receive(tcpci->port, &msg, rx_type);
>  	}
> =20
>  	if (tcpci->data->vbus_vsafe0v && (status & TCPC_ALERT_EXTENDED_STATUS))=
 {

[Severity: High]
This is a pre-existing issue, but further down in tcpci_irq(), does the
unchecked I2C read at the end of the IRQ handler cause an infinite loop?

drivers/usb/typec/tcpm/tcpci.c:tcpci_irq() {
    ...
    process_status:
    ...
    tcpci_read16(tcpci, TCPC_ALERT, &status);

    if (status & tcpci->alert_mask)
        goto process_status;
}

If this final I2C read fails, the local `status` variable is unmodified and
retains its previous value. Because the previous value triggered the loop,
this causes an unconditional `goto process_status;`, potentially hanging
the CPU if the I2C bus is wedged.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703063247.2521=
524-1-xu.yang_2@oss.nxp.com?part=3D1
