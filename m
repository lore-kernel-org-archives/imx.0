Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F336631159C
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 02:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292159; cv=none; b=n6D1hPjTQU0Mz32kRMR9CfycPT7m7LnF/K5Aexfz5Z6Ic98Nvuw9x6CcjoiYgy9mfN4Ff4fQsmBNnJcYngcHYG32Empymg5BP9g0LaNaUVMqMeW3yvDr0RH8ZzvlSQaI2OVBaPoTaywelHZ95+4/P+mGpn2TFzGAQ42YuXcmmuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292159; c=relaxed/simple;
	bh=LwsQpkEEDNAEWYxI/yma1j6f4IG3pKJzoJ1BYd8sZPs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LbN0yC9wyINSrLRHJ89CtRjS8NA07CCW90nAYIdgoXgEDhSD/VW7ADyteb+kYWDnpvWJZT3Yn8R30tQc9v32BUkxteRnet/SxlaTHGNUgauxPbPMdSxgiPx8Hfz6k42pjLacVnXPjlrxA72wV+sIUDaWgERrqYNjIsgS/V1UJCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwBFmgS+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwBFmgS+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395E21F00A3A;
	Wed, 29 Jul 2026 02:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785292157;
	bh=DLC7h3Nn1Eq5ExoIRw/JuS9kpnA1XEp5W/9GDs0NFCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hwBFmgS+BHmL4XaHvfk2dALd2fPYC9IrQ+qWV3SqrOfaLvNLz73j6Cmt4rsCLlW6R
	 RNbqaLNdq1vPLuMt093QuhCrzOEA9Zm2maAaE+OEsT3efoZNztiqgEwB6vsJqxtpHp
	 BqtGVT9CEAKKDMh15oqc7vrwJ10wGKr8Ni0VDVC1QflBMn7YDXvlIOtOQt+Qfy4RhV
	 QrfRPHvxbBIzR4SBeT3eVGvWcTW+dk+qDkJSvnjWbyLyR1W903Oy8dee4pnUFtSZfw
	 iKY0EJ680banJ6fehCqSIg8UbwVHuVFZ80pFSwLTY6jbvo6GHYF/Xn7b9ojkhlimMg
	 N3dIq9/rxzdWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 1/2] net: enetc: restore RX ring congestion mode
 after ring reconfiguration
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260728023217.2499420-2-wei.fang@oss.nxp.com>
References: <20260728023217.2499420-1-wei.fang@oss.nxp.com>
 <20260728023217.2499420-2-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 02:29:16 +0000
Message-Id: <20260729022917.395E21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Lockless race between phylink's mac_link_up and driver reconfi=
guration corrupts hardware registers and newly introduced software state, l=
eading to DMA use-after-free and loss of flow control.
--

--- Patch [1]: [PATCH net 1/2] net: enetc: restore RX ring congestion mode =
after ring reconfiguration ---
commit 299f421076cc1f539a88e83a486105279c6c0395
Author: Wei Fang <wei.fang@nxp.com>
Subject: net: enetc: restore RX ring congestion mode after ring reconfigura=
tion

This commit addresses an issue where the RX ring congestion mode is lost
during runtime ring reconfiguration. It introduces a software flag to
track the congestion mode state and restores it when the RX ring is rebuilt,
ensuring flow control continues working.

> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> @@ -633,6 +633,8 @@ static void enetc_pl_mac_link_up(struct phylink_confi=
g *config,
>  	}
> =20
>  	if (tx_pause) {
> +		set_bit(ENETC_RXBDR_CM, &priv->flags);
> +

[Severity: Critical]
This is a pre-existing issue, but can this lockless read-modify-write on
the ENETC_RBMR register race with driver reconfiguration?

Looking at enetc_pl_mac_link_up() in enetc_pf.c, there is an unsynchronized
read-modify-write loop on ENETC_RBMR just before this flag update:

	for (idx =3D 0; idx < priv->num_rx_rings; idx++) {
		rbmr =3D enetc_rxbdr_rd(hw, idx, ENETC_RBMR);
		...
		enetc_rxbdr_wr(hw, idx, ENETC_RBMR, rbmr);
	}

If phylink's mac_link_up executes asynchronously in the phylink_resolve
workqueue, could it run concurrently with a user triggering a driver
reconfiguration under rtnl_lock (like attaching an XDP program)?

If so, enetc_reconfigure() might call enetc_disable_rxbdr(), which clears
the ENETC_RBMR register to disable the ring:

	/* disable EN bit on ring */
	enetc_rxbdr_wr(hw, idx, ENETC_RBMR, 0);

If mac_link_up() reads the ENETC_RBMR register before it is cleared by
reconfiguration, and writes it back after it is cleared, it will write
back the stale ENETC_RBMR_EN (enable) bit.

Since enetc_reconfigure() proceeds to call enetc_free_rxtx_rings() to free
the DMA memory, re-enabling the hardware RX ring at this moment would cause
the hardware to DMA incoming network packets into freed kernel memory.

Additionally, because the new ENETC_RXBDR_CM software flag is set here after
the hardware read-modify-write loop, concurrent readers like
enetc_setup_rxbdr() could observe a stale flag state and permanently lose
flow control.

>  		/* When the port first enters congestion, send a PAUSE request
>  		 * with the maximum number of quanta. When the port exits
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728023217.2499=
420-1-wei.fang@oss.nxp.com?part=3D1
