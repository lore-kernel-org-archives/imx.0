Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F43836494F
	for <imx@lists.linux.dev>; Wed, 20 May 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270433; cv=none; b=J6ZZhcTZqtW1/26Ki8F10WOmHgQ3GeYoWhC0H9MZvzNo8N1HAPxL+InNTInxUG7PrK6CBzgDTf2hX5tPKz/a2DQs8eU3rQlhu3mh87x7Rbb+4MdPaefNfc4PxmAtDQ5qjMxnzzkkPmuQ3dT8HbflQQ1WPGiYrC7qpZVax0Bsg7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270433; c=relaxed/simple;
	bh=X7BW7D861hv39ykQLFRhXTQJi3myg20TO6jLy1ItELg=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KNS2HpH1PQflLAmkdvgORFDJq8D5HqshPwdpXv8+mz8eGS0k/bbMyMyDeeJYrYS5donl1bKIV/AH5gLcsr2X0zvtdMlIvA62QWhyG2BEvlrBLALEEINz2DatfGG76K/7zYRROpQYeipTuK7kuEWDDNPBEZ4A5OX2J6vX8MG578E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5DH5mQ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5DH5mQ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1461F000E9;
	Wed, 20 May 2026 09:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779270431;
	bh=gH/m+j/Gk/MK9tXm9gys/18jYH1BF48k+XfPxdB4phk=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=V5DH5mQ+aCj+8WHerUmaDmdhdzQ5FTzvOGpwxu2nCv6xJ8Gr6PIQfkluPJ3Lta7N/
	 Mty2EBI0tB/7NDm30B4jhQOWVBH6Ld5WAdbH8DkBtBbbx5JTazLwabR+V88o0pc3ue
	 UaEEE2VrK/cOFTmyVdNDClqEsHK64PZrNWrR/0EStIeDMRfHfBJN9Tf4iuQ5L/NEi5
	 hnXM469CFZmDVzogDeoOwJ6M3vWwK/oseairQrfMPDzr1jz+LLR/sFNucSf2V4ARJU
	 S8/nr8QaTOKYZYgCVTmrZqoA3IsCgd/5qIuOLqhZHdlLgBEfHojY/58p3LnTJYq3jH
	 fXDIt2wqx18zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] i2c: imx-lpi2c: reset controller in probe stage
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260520091658.2879993-1-carlos.song@oss.nxp.com>
References: <20260520091658.2879993-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 09:47:11 +0000
Message-Id: <20260520094711.AF1461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Failure of devm_request_irq() triggers a devres WARN_ON due to an =
invalid devm_free_irq() call in the error path.
- [Low] Discarded return value of dev_err_probe().

Pre-existing issues:
- [High] Clocks and device power may be left enabled indefinitely after dri=
ver removal.
- [High] The software reset only resets the Master logic, leaving the drive=
r vulnerable to an interrupt storm if Target (Slave) logic was left active =
by previous stages.
--

commit 593975fdf4a4ccf02192ff29b2ef1c36d90b2a3d
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx-lpi2c: reset controller in probe stage

Reset I2C controller in probe stage to avoid unexpected LPI2C controller
state left from previous stages and hang system boot.

> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index a01c236964819..16b6a1cf177bb 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
[ ... ]
> @@ -1535,10 +1530,25 @@ static int lpi2c_imx_probe(struct platform_device=
 *pdev)
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> =20
> +	/*
> +	 * Reset all internal controller logic and registers to avoid effects o=
f previous status
> +	 * The reset takes effect immediately and there is no minimum delay req=
uired before
> +	 * clearing the software reset.
> +	 */
> +	writel(MCR_RST, lpi2c_imx->base + LPI2C_MCR);
> +	writel(0, lpi2c_imx->base + LPI2C_MCR);

[Severity: High]
This is a pre-existing issue, but does this software reset only reset the
Master logic?

The LPI2C_MCR register controls the Master logic, but the Target (Slave) lo=
gic
has its own independent reset in the LPI2C_SCR register (SCR_RST).

If a bootloader left the Target logic active with interrupts enabled, the
hardware IRQ line would remain asserted. When devm_request_irq() is called,
the ISR lpi2c_imx_isr() will fire. Because lpi2c_imx->target is NULL, the
ISR falls through to lpi2c_imx_master_isr(), reads 0 from MIER, and returns
IRQ_NONE without acknowledging the Target interrupt.

Could this result in an unacknowledged level-triggered interrupt, causing an
interrupt storm and system hang?

> =20
>  	temp =3D readl(lpi2c_imx->base + LPI2C_PARAM);
>  	lpi2c_imx->txfifosize =3D 1 << (temp & 0x0f);
>  	lpi2c_imx->rxfifosize =3D 1 << ((temp >> 8) & 0x0f);
> =20
> +	ret =3D devm_request_irq(&pdev->dev, lpi2c_imx->irq, lpi2c_imx_isr, IRQ=
F_NO_SUSPEND,
> +			       pdev->name, lpi2c_imx);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", lpi2c_imx->irq);

[Severity: Low]
Is the return value of dev_err_probe() intended to be discarded here?

The error code is already stored in ret, but dev_err_probe() is usually
assigned back to the return variable.

> +		goto rpm_disable;

[Severity: High]
Could this error path trigger multiple kernel warnings?

When devm_request_irq() fails, we jump to rpm_disable, which calls
pm_runtime_put_sync(&pdev->dev). This drops the runtime PM usage count to 0
and synchronously invokes the lpi2c_runtime_suspend() callback.

On platforms where need_request_free_irq is true (like imx8qxp), this
callback unconditionally executes devm_free_irq(). Since
devm_request_irq() failed, the IRQ was never added to devres.

Will devm_free_irq() fail to find the devres entry, triggering a WARN_ON in
devres_release(), and then call free_irq() on an unallocated IRQ, triggering
another WARN_ON?

> +	}

[Severity: High]
This is a pre-existing issue, but can clocks and device power be left enabl=
ed
indefinitely after driver removal?

In lpi2c_imx_remove(), the driver calls pm_runtime_disable() and
pm_runtime_dont_use_autosuspend() without first ensuring the device is
suspended.

If the device was active at the time of removal (for example, if an async
autosuspend timer was still ticking), pm_runtime_disable() cancels the pend=
ing
suspend work and leaves the device permanently in the RPM_ACTIVE state.

Because the driver relies exclusively on lpi2c_runtime_suspend() to disable
the clocks, leaving the device active means the runtime suspend callback is
never invoked and the clocks are leaked indefinitely. Should the device be
suspended before disabling runtime PM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520091658.2879=
993-1-carlos.song@oss.nxp.com?part=3D1
