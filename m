Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3175C380FDF
	for <imx@lists.linux.dev>; Fri, 29 May 2026 17:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780075597; cv=none; b=eVkB6taJiqoUCKeoe1cDOCnguqpvRmEi12K6nc42H4OqbhinCiphlFHIzyAcpFV8jpsCrD3Uc59fnQUzYfjwU9VUXz3zLNyGHYTCul5gJTb2hBDVPYQ/Gfja+2cJeDchpipZ5ECTKTbDwHstvS9RiPW8njrTFmc2J1FOGFttMDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780075597; c=relaxed/simple;
	bh=1sLcEf4dv1UwLMzctu/xEbGNOJ253MQ6KV7QNA5uc8Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZTxJfI0C+VlyAesevVnu4XBOxpXYeUeFcCM3sF35IfpRo7quIVYVni3Mh0LHj+p0w18pXDlsiQEK6K1pRwne8Pyd1m9kaEWRamwQ7HLX0ZELtWBg0LQw+lrcW/uJKU/zCuHaIqpPWo8R810CvLSPVLRBFkaxYTIxww04FM6Kb4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtbF0sCH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtbF0sCH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EDB1F00893;
	Fri, 29 May 2026 17:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780075595;
	bh=Z7rX2ZxA6MAWmTvex5PWIFZ7n+JgAReXcT98Je5kc7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UtbF0sCHa4jLOXLc7trhwdYoChKrCwpGsdUgrmYSCbGddE3gILyMljrQffwfrTzgK
	 ei3xSerdLKPoHJJQk6PunsvK3niFfiVHVvatteOAivOWDqSMWCH9ZeJgcCunBCvKPI
	 WOIc8xh7vbhvMo95a+yrE0Zlmb6y7JVsksIDUFxXM0bgQXBgyz8IgbiNN2gpUWp4nl
	 B2AnIxyF8C5YFtCWEjoxu53UZKwSzUpjAhK+TUZ1OmJEXoXbujSFHPvMiuE10UvnPR
	 26iCKP4dif7on1GU2fYwCxJAB4UiACZTzPNKczpiq4duLamDTL2Q9AI4x4QNRJaKMt
	 N+VxcaZR7w92g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] mailbox: imx: Move the RX part of the mailbox into
 the threaded handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260529-imx_mbox_rproc-v1-2-b8ffc36e11e5@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-2-b8ffc36e11e5@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 17:26:35 +0000
Message-Id: <20260529172635.A1EDB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Unconditional unmasking of the RX interrupt in the threaded IRQ ha=
ndler races with `imx_mu_shutdown()`, potentially leaving the hardware inte=
rrupt permanently enabled after the IRQ handler is freed.

Pre-existing issues:
- [High] Permanent denial of service (DoS) on the RX channel due to missing=
 interrupt unmasking on error paths.
--

commit 7ab3fb54b60e0decf23b64d1d78df0e2b4409f2a
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

mailbox: imx: Move the RX part of the mailbox into the threaded handler

This commit moves the RX mailbox callback handling into the threaded
interrupt handler. It updates the driver to mask the RX interrupt in the
primary handler and unmask it in the threaded handler upon success.

> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c

[ ... ]

> @@ -524,6 +522,12 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
>  		mbox_chan_txdone(chan, 0);
>  		return IRQ_HANDLED;
> =20
> +	case IMX_MU_TYPE_RX:
> +		cp->pending =3D 0;
> +		if (!priv->dcfg->rx(priv, cp))
> +			imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp=
->idx), 0);

[Severity: High]
This is a pre-existing issue, but does bypassing the unmasking step on
error permanently disable the channel?

If imx_mu_specific_rx() encounters an error, such as a read timeout or
receiving a message that exceeds the maximum size, it returns a negative
error code. When this happens, the condition evaluates to false and the
interrupt remains masked.

Since there does not seem to be a mechanism to automatically reset the
channel after these errors, could a buggy remote processor trigger this
to cause a permanent denial of service for the RX channel?

[Severity: High]
Can this unmasking step also race with channel shutdown?

If mbox_free_channel() is called concurrently, imx_mu_shutdown() masks the
interrupt and invokes free_irq(). The free_irq() function synchronizes
with the threaded handler and will block until imx_mu_isr_th() finishes
processing.

Because imx_mu_isr_th() proceeds to unmask the interrupt here after
processing, the hardware interrupt will be left enabled after the kernel
IRQ handler is fully unregistered. If a new message arrives afterward,
won't this cause an interrupt storm and prompt the genirq core to disable
the shared IRQ line entirely?

> +		return IRQ_HANDLED;
> +
>  	default:
>  		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-imx_mbox_r=
proc-v1-0-b8ffc36e11e5@linutronix.de?part=3D2
