Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE3B3A4526
	for <imx@lists.linux.dev>; Thu, 21 May 2026 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779361654; cv=none; b=jHx2vFq1mL39q/nKCjXD4zkDaNEfest7gPDy7ejTRtpkPfDNd+DU9hnVg71N1mIjN8rwNeiFA6kRnqrimr3XNxHRM3xs8WZzw7+C5T5Ia1PeC4QMHe/AoToBjEi3TiphLwsCy9KA2A0u10JQ3YmnKKFnD0s/hOVD+G8W49mPGXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779361654; c=relaxed/simple;
	bh=dMTJGMdS9Tgwl9u0qKqtjlNnN5ZOpAhEFHrNZKFXtB8=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R5NxhGDt8FLsVAQReT39ZA6QXAx4rP1DUYwVretY+H7auWR1273sFFOxsrA8YB2sm1t0jmv44D8jghDzPV5h51dseHxkoom9b5Y/6K76Hqhc7h98PQcCgb1U+/wUIKW3Gm+QfWAsJrOD3xnVzmPRwsJMiioF2M77O8AxiqmA7UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOde2sRA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOde2sRA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F2D1F000E9;
	Thu, 21 May 2026 11:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779361653;
	bh=L5sje9At4TPa3Z3CdfWbb4uj6gtspivM9JhOqMYbo8w=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=oOde2sRAK4agm1QHi9yD5oM/nvP3FNs2w1MIdMdYyVzKR+0Thx1O6XNS+lxHbupBW
	 clg1lcbgv2PasMCUR+Qb6BqgZlNemx8TgpDDB57xw0SjDrK19X1a6tYbHdXE4VNBlf
	 U+hxZLAPg0s/UUS4sFCGRTz421EET55MZ49wa8p3/v+LycHGfp0U4iMc7f7tjn2jvK
	 Qpn1kreVf2LQtk9yuk2YvxdCN+Nazjkk9FaKPPQ/uC93bImRrvRTjX7HA0UYPoTF4r
	 dw1yzQdazVTCVfVXuc3NVpo/XA7GyrcXfErzZerMCn9ETE3ofrSGHLrVTzgMN4NJNk
	 XOiZiJRzDIxrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] i2c: imx-lpi2c: reset controller in probe stage
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260521103530.2988866-1-carlos.song@oss.nxp.com>
References: <20260521103530.2988866-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 11:07:30 +0000
Message-Id: <20260521110732.56F2D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The device removal function disables runtime PM without synchronou=
sly suspending the device, leading to a permanent clock leak if the device =
is active.
- [High] DMA channels allocated during probe are not released if `i2c_add_a=
dapter()` fails or when the driver is unbound.
- [High] The driver crashes with a NULL pointer dereference in probe if the=
 device tree contains no clocks.
- [High] The interrupt handler accesses hardware registers without verifyin=
g the device's PM runtime state, potentially causing a system hang.
--

commit 6f45ad7dd45f6c5ef9c62f41c8f632056610f99d
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx-lpi2c: reset controller in probe stage

This commit resets the I2C controller during the probe stage to avoid
unexpected LPI2C controller states left from previous stages. It writes
to the MCR and SCR registers immediately after asserting the RST bit.

> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index a01c236964819..c3d76429ee210 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c

[ ... ]

> @@ -1516,14 +1511,18 @@ static int lpi2c_imx_probe(struct platform_device=
 *pdev)
>  	 * each transfer
>  	 */
>  	ret =3D devm_clk_rate_exclusive_get(&pdev->dev, lpi2c_imx->clks[0].clk);

[Severity: High]
This is a pre-existing issue, but is it possible for the device tree to
contain no clocks?

If devm_clk_bulk_get_all() returns 0 because no clocks are found, it leaves
the clks array as NULL.

Since the driver checks if (ret < 0) earlier instead of if (ret <=3D 0), do=
es
this unconditionally access lpi2c_imx->clks[0].clk and cause a NULL pointer
dereference during probe?

> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't lock I2C peripheral clock rate\n");
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret,
> +			      "can't lock I2C peripheral clock rate\n");
> +		goto clk_disable;
> +	}

[ ... ]

> @@ -1535,27 +1534,43 @@ static int lpi2c_imx_probe(struct platform_device=
 *pdev)
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> =20
> +	/*
> +	 * Reset all internal controller logic and registers to avoid effects o=
f previous status
> +	 * Reset both Master and Target logic to prevent interrupt storms
> +	 */
> +	writel(MCR_RST, lpi2c_imx->base + LPI2C_MCR);
> +	writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
> +	writel(0, lpi2c_imx->base + LPI2C_MCR);
> +	writel(0, lpi2c_imx->base + LPI2C_SCR);
> +
>  	temp =3D readl(lpi2c_imx->base + LPI2C_PARAM);
>  	lpi2c_imx->txfifosize =3D 1 << (temp & 0x0f);
>  	lpi2c_imx->rxfifosize =3D 1 << ((temp >> 8) & 0x0f);
> =20
> +	ret =3D devm_request_irq(&pdev->dev, lpi2c_imx->irq, lpi2c_imx_isr, IRQ=
F_NO_SUSPEND,
> +			       pdev->name, lpi2c_imx);

[Severity: High]
This isn't a bug introduced by this patch, but could this interrupt handler
access unclocked hardware registers?

The IRQ is requested with IRQF_NO_SUSPEND, meaning it remains active
during system suspend to act as a wakeup source.

If a wakeup event or spurious interrupt triggers lpi2c_imx_isr() while
the device is suspended and its clocks are disabled, would reading the
hardware registers without first calling pm_runtime_get_if_active() result
in a bus fault and system crash?

> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", lpi2c_imx->irq);
> +		goto rpm_disable;
> +	}

[ ... ]

>  	/* Init DMA */
>  	ret =3D lpi2c_dma_init(&pdev->dev, phy_addr);
>  	if (ret) {
>  		if (ret =3D=3D -EPROBE_DEFER)
> -			goto rpm_disable;
> +			goto free_irq;
>  		dev_info(&pdev->dev, "use pio mode\n");
>  	}
> =20
>  	ret =3D i2c_add_adapter(&lpi2c_imx->adapter);
>  	if (ret)
> -		goto rpm_disable;
> +		goto free_irq;

[Severity: High]
This is a pre-existing issue, but does this error path leak the DMA channel=
s?

Earlier in probe, lpi2c_dma_init() requests DMA channels using
dma_request_chan(), which are not managed by devres and require explicit
cleanup via dma_release_channel().

If i2c_add_adapter() fails, the free_irq error path is taken, which does
not release the channels. Are these channels permanently leaked, and should
they be cleaned up here and during driver unbind?

> =20
>  	pm_runtime_put_autosuspend(&pdev->dev);
> =20
> @@ -1563,10 +1578,17 @@ static int lpi2c_imx_probe(struct platform_device=
 *pdev)
> =20
>  	return 0;
> =20
> +free_irq:
> +	devm_free_irq(&pdev->dev, lpi2c_imx->irq, lpi2c_imx);
> +
>  rpm_disable:
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> -	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);

[Severity: High]
This isn't a bug introduced by this patch, but does the driver's teardown
pattern cause a permanent clock leak during device removal?

In lpi2c_imx_probe(), clocks are prepared and enabled manually.
However, during driver unbind in lpi2c_imx_remove(), pm_runtime_disable()
is called without a preceding pm_runtime_put_sync() or explicit hardware
suspend.

If the device is active or an autosuspend timer is pending,
pm_runtime_disable() cancels the pending suspend and leaves the device
actively powered.

Since lpi2c_imx_remove() lacks a clk_bulk_disable_unprepare() call to
clean up the manually enabled clocks, do the clocks remain enabled
indefinitely, leaking reference counts and power?

> +	pm_runtime_set_suspended(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
> +
> +clk_disable:
> +	clk_bulk_disable_unprepare(lpi2c_imx->num_clks, lpi2c_imx->clks);
> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521103530.2988=
866-1-carlos.song@oss.nxp.com?part=3D1
