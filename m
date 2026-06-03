Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B04385530
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496388; cv=none; b=WPd5u1yZk4SbJ+Pf/hCFkHOIF6FlrUz68dDRfQKcCz3eZ6tpvXjNPIPfMlPKy63SHIQfxILpV3AyUrevaPalwZfZFORPbBtiUjINXTuv+mF/WNbkVk/UEmJ12xu5S68YA3/EHED42qbBt1t7XgV8sDi48rWcsGtYrCeKmevN+ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496388; c=relaxed/simple;
	bh=q1a18Ap+SWl4lFqJoyMyOFtcTKT8UQhV1N7UmJKn0eU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dC0XHg11qyxbLfuMgDrzGSKPQ9Ve6q3RMtySeynu9yCUAGL+ebyqBkPUodJ2fulXj/oToCKfyImfoMARXLJdwl1uAt4D+WCm8zINm2lUaLKmCse+nbzNuUlpa9htHAc2lUtNZTfrrCW/8srKOT/aNXfwKZQT+ytkWoBPw1bAcnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3qcDClr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3qcDClr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CD01F00893;
	Wed,  3 Jun 2026 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780496387;
	bh=/wCp8m3RZdE/vPdunDVNH4Z6pWiEc9iFxIvXMzdWyKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B3qcDClrSi11GjqyZWv3sLok/vfVAp5fzabsoTk5OEm2gqvGWBrC46y6rwkkPb8PA
	 Cj2d1Z9qQkvDJJwNjbA05H9c+PafSOZmcp5gpXz+XZ8S7xSrpodhlY2dwck4ZFaFpQ
	 pF4oge5vCWHj4/nlquCd6DGpTIrjZZ5cedxChdu0WQ/+gIHOgAadXepN9DNfPrhzIc
	 1qCA2WUL3pPj1RDbbZxugy+aEyNrEngYUkr6J31JrP1ixu/TwJJqZS8dBMjq5ukW7y
	 /NJOgLvYMmVaGaDTQkUIvSjtspV+dCsIw9QCdy3AK35R2zerz1Yyv4JqBdPEkhKWKg
	 qpCNEqbFM7sZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/9] mailbox: imx: Move the RXDB part of the mailbox
 into the threaded handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260603-imx_mbox_rproc-v2-7-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-7-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:19:47 +0000
Message-Id: <20260603141947.65CD01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Error paths in `imx_mu_seco_rxdb` fail to clear the hardware inter=
rupt status (`GIPn`), leading to an infinite IRQ storm because the threaded=
 handler unconditionally unmasks the interrupt.
--

commit fc70fc114c374d42412c37d5886dc2cfe0a507bb
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: mailbox: imx: Move the RXDB part of the mailbox into the threaded =
handler

This commit moves the RXDB callback handling from the hardirq to the thread=
ed
interrupt handler. It also changes the behavior to unconditionally unmask
the RXDB interrupt after the callback returns.

> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c

[ ... ]

> @@ -559,6 +559,12 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
>  			imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->=
type, cp->idx));
>  		break;
> =20
> +	case IMX_MU_TYPE_RXDB:
> +		cp->pending =3D false;
> +		priv->dcfg->rxdb(priv, cp);
> +		imx_mu_xcr_set_act(priv, cp, IMX_MU_GIER, IMX_MU_xCR_GIEn(priv->dcfg->=
type, cp->idx));

[Severity: High]
This is a pre-existing issue, but since this handler now unconditionally
unmasks the interrupt, could this lead to an infinite interrupt storm if an
error occurs in the callback?

Looking at imx_mu_seco_rxdb(), if the received message size is invalid or a
read timeout occurs, the function jumps to the error path:

drivers/mailbox/imx-mailbox.c:imx_mu_seco_rxdb() {
    ...
        goto error;
    ...
error:
    mbox_chan_received_data(cp->chan, ERR_PTR(err));

exit:
    return err;
}

This error path skips writing to the GSR register to clear the GIPn hardware
interrupt pending bit. Since imx_mu_isr_th() ignores the return value of
rxdb() and unconditionally unmasks the interrupt via imx_mu_xcr_set_act(),
won't the uncleared hardware status bit immediately re-trigger the hardirq
and cause a livelock?

> +		break;
> +
>  	default:
>  		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-imx_mbox_r=
proc-v2-0-a0059dc3b69a@linutronix.de?part=3D7
