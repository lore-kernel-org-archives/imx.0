Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199823B961A
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784187275; cv=none; b=Pr4tQ5IZdMvFhidEpu9CCFsT9nLF/VaiDOl1UK4zi52IwQmVDyNliFjIlXhfY6OrH2xkKjH96M5dILw09KNPjxXI/3ebl9aM08IBY4k7XFHA8RLhh8fnxHhuDQB3xQxMubh6BLepjlSCAafuB9DygrYHkKrTKoRHgccO4q68rWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784187275; c=relaxed/simple;
	bh=nz4VycJkwyklQXwGbEmr/LC4/iwst3GhfM7V3TAJzAE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IYsUm/O9Khdixb9w1PMymJkrMCobqOjwhOqfVzjyUwQYtd6hziSadQhVojuqtMwqM6RHR9Oi6vK0XqRjSnJQ0/8hQfmfEs6RzFoGjGbs3ieNMu3nt4Zt1kBF5iGT1Xq4gebBPq1HB9wNb2L1ODXDJunCp2LWYwnKwEsAGavPUAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSq61ALi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSq61ALi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B641F000E9;
	Thu, 16 Jul 2026 07:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784187273;
	bh=i//A7wxJ2dztrLWGCqXJ9LAB0Tj+RD9+xIib+EDtJ9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PSq61ALiDttICxnm11OQQT20orsgXivj4chmsKVc9YMzQhLFMK6Z93/wcR5oW+AUr
	 0KePfBfxgVT7pFd73nkbKI+CBAkOEAJT7gF9R6pkdmweQIRCVmYoj/pS2O5nkhsN1+
	 OFfDXmNlktn47MnMZTIrt/FRX1Rr23B7f8RDsv9A+EpYAYilvO572xlgb+/cVjrvK/
	 1SPoG+9pl+3/nmWG+bVeD0lHlxsaFGSaxDARQ2TpwWNCdetdWx2OtH0a9qZbDmk9gZ
	 rYz0fLZLfwyl0x5rW38mDr8idHJsq+BwtUNS1SAUaUzxal6MsGCSe8n3w25oVNbe3C
	 /lDT0rKDL4ZXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] i2c: imx-lpi2c: properly unwind resources on
 probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: carlos.song@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260716071957.2670263-2-carlos.song@oss.nxp.com>
References: <20260716071957.2670263-1-carlos.song@oss.nxp.com>
 <20260716071957.2670263-2-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 07:34:32 +0000
Message-Id: <20260716073433.65B641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `lpi2c_imx_remove()` function leaks clock prepare and enable r=
eferences when unbinding the driver.
- [High] NULL pointer dereference when `devm_clk_bulk_get_all()` returns 0.
- [High] Clock references are permanently leaked in the error path of `lpi2=
c_runtime_resume()`.
- [Medium] Unprotected hardware register access in the interrupt handler ca=
uses a bus fault on spurious interrupts.
- [Low] Unconditional `pm` assignment produces dead code when PM is disable=
d.
--

--- Patch [1]: [PATCH v6 1/2] i2c: imx-lpi2c: properly unwind resources on =
probe failure ---
commit 2175c9d5c422256763ff98e4c5aedc0fe0e29c4d
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx-lpi2c: properly unwind resources on probe failure

The commit introduces a new error label to explicitly invoke
clk_bulk_disable_unprepare() on probe failure. It replaces
pm_runtime_put_sync() with pm_runtime_disable(), pm_runtime_set_suspended()
and pm_runtime_put_noidle() to bypass the runtime suspend callback during
error recovery.

> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index e6c24a9d934d7..615d9f7f11471 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -1527,14 +1527,18 @@ static int lpi2c_imx_probe(struct platform_device=
 *pdev)
>  	 * each transfer
>  	 */
>  	ret =3D devm_clk_rate_exclusive_get(&pdev->dev, lpi2c_imx->clks[0].clk);

[Severity: High]
This is a pre-existing issue, but if devm_clk_bulk_get_all() returns 0,
lpi2c_imx->clks remains NULL. Does the array access lpi2c_imx->clks[0].clk
cause a NULL pointer dereference in that case?

> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't lock I2C peripheral clock rate\n");
> +	if (ret) {
> +		ret =3D dev_err_probe(&pdev->dev, ret,
> +				    "can't lock I2C peripheral clock rate\n");
> +		goto clk_disable;
> +	}
> =20
>  	lpi2c_imx->rate_per =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> -	if (!lpi2c_imx->rate_per)
> -		return dev_err_probe(&pdev->dev, -EINVAL,
> -				     "can't get I2C peripheral clock rate\n");
> +	if (!lpi2c_imx->rate_per) {
> +		ret =3D dev_err_probe(&pdev->dev, -EINVAL,
> +				    "can't get I2C peripheral clock rate\n");
> +		goto clk_disable;
> +	}
> =20
>  	if (lpi2c_imx->hwdata->need_prepare_unprepare_clk)
>  		pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_LONG_TIMEOUT_MS);
> @@ -1576,8 +1580,11 @@ static int lpi2c_imx_probe(struct platform_device =
*pdev)
> =20
>  rpm_disable:
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> -	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
> +clk_disable:
> +	clk_bulk_disable_unprepare(lpi2c_imx->num_clks, lpi2c_imx->clks);
> =20
>  	return ret;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does lpi2c_imx_remove() safe=
ly
clean up the prepared clocks?

static void lpi2c_imx_remove(struct platform_device *pdev)
{
	struct lpi2c_imx_struct *lpi2c_imx =3D platform_get_drvdata(pdev);

	i2c_del_adapter(&lpi2c_imx->adapter);

	pm_runtime_disable(&pdev->dev);
	pm_runtime_dont_use_autosuspend(&pdev->dev);
}

Calling pm_runtime_disable() without a prior pm_runtime_get_sync() leaves
the device in its current state. If the device was active, the clocks could=
 be
permanently leaked since lpi2c_runtime_suspend() won't execute, and there is
no fallback clk_bulk_disable_unprepare() call here.

[Severity: High]
This is a pre-existing issue, but could a devm_request_irq() failure in
lpi2c_runtime_resume() cause clock references to be leaked?

	if (need_request_free_irq) {
		ret =3D devm_request_irq(dev, lpi2c_imx->irq, lpi2c_imx_isr, IRQF_NO_SUSP=
END,
				       dev_name(dev), lpi2c_imx);
		if (ret) {
			dev_err(dev, "can't claim irq %d\n", lpi2c_imx->irq);
			return ret;
		}
	}

If the IRQ request fails, it appears the function returns the error without
reverting the prior clk_bulk_prepare_enable() operations. Since the PM core
would mark the device as suspended on failure, would the clocks remain enab=
led
indefinitely?

[Severity: Medium]
This isn't a bug introduced by this patch, but is it possible for the
interrupt handler to access unclocked registers during a spurious interrupt?

static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
{
	struct lpi2c_imx_struct *lpi2c_imx =3D dev_id;

	if (lpi2c_imx->target) {
		u32 scr =3D readl(lpi2c_imx->base + LPI2C_SCR);
		u32 ssr =3D readl(lpi2c_imx->base + LPI2C_SSR);

The handler unconditionally reads hardware registers without verifying the
device PM status is active via pm_runtime_get_if_active(). Could this
trigger a bus fault if the device is currently suspended and its clocks are
disabled?

[Severity: Low]
This is a pre-existing issue, but can the PM callbacks become dead code
when power management is disabled?

static struct platform_driver lpi2c_imx_driver =3D {
	.probe =3D lpi2c_imx_probe,
	.remove =3D lpi2c_imx_remove,
	.driver =3D {
		.name =3D DRIVER_NAME,
		.of_match_table =3D lpi2c_imx_of_match,
		.pm =3D &lpi2c_pm_ops,
	},
};

The .pm assignment does not use the pm_ptr() wrapper, which may prevent the
compiler from safely discarding the PM callbacks when CONFIG_PM is not set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716071957.2670=
263-1-carlos.song@oss.nxp.com?part=3D1
