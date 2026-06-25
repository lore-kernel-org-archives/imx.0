Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381263AE1B9
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782385742; cv=none; b=O0yIy26AqYgGDMU1+aCtd3fkPEq5UMSapPLBZzxXAQA0X9brUI884a7G8Y9yrkLUQqPOgsVk4AAVwQZZCJEezgY+nFLZ2EQaUj2OPsbR+vzGE8qYnFMcRwmqmsrAK77T7rXb/jeLmeRKclzrcJB9b5RvXkgMViqDcmxaLCptV7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782385742; c=relaxed/simple;
	bh=WHvTvrD79gkjlnCjDTRbtcAuenjxU91VcMPt9n2cIcc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Za4RD5TiSEd9BOn1HPSOA5BVcITRV8p543fYHu8LeZi3CguFvv5Fm7Lr7Bkd5bfqgkSVqyGsH9lWZ++djH5LuYnT0TKmhE2Qtpw6wp1oOjV0AZ5HbWcLDudnYHPz5pvlRFqDo4aceX2lbUGpNWQLw93b1Sj4eGfUrgyOBM6n0dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2palKlq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2palKlq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8681F000E9;
	Thu, 25 Jun 2026 11:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782385740;
	bh=BFH8+NZQDc0teGWwmZVR8ogVK+kvle/f1brMVdNUCSs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d2palKlqjvYwFwhU1dE7O20ETTh6kb7QZcb1RMWEDwu9mN1XsQiejgby0hMnkDE66
	 TfS/85tSohxUNMRXW3jlmcm87fpTpYk6Sc5wnctdVhU+q89hwPVWZJqtcOD/i/zv7j
	 MolvZVB1DPlKDw64evZGNsb+0dQXaZcFHFq6FNabE3N/uMh2L/4QrHu0jTiAPdMnhs
	 Y0gVriIOyrwAsBjvzsopS+puauxu8zKN0F1yForosLb6dWXOPMwncmke02OrY2SeFc
	 l66AZEbrlGM+7u8ezZmY7dPOFH2doK8Sc9lTd4jBim1Kun+XBcdpTtg4g8RwEIMv7E
	 yQglYUF63LoqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] mmc: sdhci-esdhc-imx: fix suspend/resume error
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260625105934.2890635-6-ziniu.wang_1@oss.nxp.com>
References: <20260625105934.2890635-1-ziniu.wang_1@oss.nxp.com>
 <20260625105934.2890635-6-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 11:08:58 +0000
Message-Id: <20260625110859.EE8681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Early return on pm_runtime_force_resume() failure bypasses criti=
cal software state cleanup, causing resource leaks and unbalanced IRQ/wakeu=
p state.
--

commit ed7f6495b612b03d62a8e94345ad954b930909de
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: fix suspend/resume error handling

This commit updates the suspend and resume error handling paths in the
sdhci-esdhc-imx driver. It replaces pm_runtime_get_sync() with
pm_runtime_resume_and_get() in suspend, logs warnings instead of failing
for non-fatal errors, and adds a failure check for
pm_runtime_force_resume() in resume.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
[ ... ]
> @@ -2121,12 +2125,12 @@ static int sdhci_esdhc_resume(struct device *dev)
>  			dev_warn(dev, "Failed to restore pinctrl state\n");
>  	}
> =20
> -	pm_runtime_force_resume(dev);
> -
> -	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);
> +	ret =3D pm_runtime_force_resume(dev);
>  	if (ret)
>  		return ret;

[Severity: Medium]
Does this early return bypass critical cleanup steps that are required later
in the function?

When sdhci_esdhc_suspend() is called, it disables the interrupt using
disable_irq() and increments the runtime PM usage counter via
pm_runtime_resume_and_get().=20

If pm_runtime_force_resume() fails here and we return immediately, the
required enable_irq() and pm_runtime_put_autosuspend() calls at the end of
sdhci_esdhc_resume() are skipped.

Will this leave the interrupt depth unbalanced and leak the runtime PM usage
counter that was acquired during suspend?

> =20
> +	mmc_gpio_set_cd_wake(host->mmc, false);
> +
>  	/* re-initialize hw state in case it's lost in low power mode */
>  	sdhci_esdhc_imx_hwinit(host);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625105934.2890=
635-1-ziniu.wang_1@oss.nxp.com?part=3D5
