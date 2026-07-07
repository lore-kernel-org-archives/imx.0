Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DF93E7141
	for <imx@lists.linux.dev>; Tue,  7 Jul 2026 11:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422975; cv=none; b=OWsZIz5osRg+a4AnR/oErW5h1XOoM8mEtqN88nMS617lTSEpwK7FB7SrPmMwiaZXIiqTg7rMz4jmSyX7lU4i2RVbuJT+XJb7OQ2FXaCoJQiXVxoGBDZw+hqWZh8Ds6IZr7RQMjpjrrFoLrLI2UMzgTKsnxGPaAxmUoTCkJ5w4vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422975; c=relaxed/simple;
	bh=r9RzAMX6+Kl+OJv/jqnERGotUl/DxXRNEsT1LsnUIHY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X/kLX9FwpUNKRFic0as4nfc8RUl45yzk6FgYze/mLYDnxNlgMIqJbocC+eU+e3NZUx4eEXH83pr68+HvuSCCsJMa2h9ggqPnxi3DHYGoD24IjxWu+xVwjyx1ghKrZ0MkyO5i94DvRL69V8aSTlmHjlnpTse7z7W8BGVSMudkE1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGc4qT0C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGc4qT0C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88AD1F000E9;
	Tue,  7 Jul 2026 11:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783422974;
	bh=8Qv4H65cQ5wRck/lUSRNsytV2HwtwlMT32ouqWeAOHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OGc4qT0CgH7oB66uOT9C6A+4Guazbc8UuyPTVrHnlv9jJRyUx0kTPDD+JtqKh9G4R
	 UAXxUPbJmjU3B0OOPdZmQgCwY2FBrPALV/+WKOdl/SF/j0D5uZ0r+83Jrh9ApQZTS9
	 TVeUtSWJla3HiycRT/s/RHukMr2t7jg5T1vCJUsK4urW14UcgH3W6jlCDaTtKN91Vd
	 CJb3+MZNAoeovlYL6EAgKqhrcGIoOAj8fuSxqkXUvWKyip65ASerBr8Z+h+11jokV4
	 4NF0X/brnNXOHKOM/wZN8HFoopF+fN7EJHRCmt/xIxTJGJufyGd8Gk6b2tRg8hcoZM
	 8JgHO8+GMuiWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/8] mmc: sdhci-esdhc-imx: fix resume error handling
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260707110303.3779799-9-ziniu.wang_1@oss.nxp.com>
References: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
 <20260707110303.3779799-9-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 11:16:13 +0000
Message-Id: <20260707111613.D88AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The early return delays a kernel panic because the MMC core is not=
 notified that the device is dead, leading to subsequent unclocked hardware=
 accesses.
- [Medium] The card detect GPIO IRQ is incorrectly left configured as a sys=
tem wake source on the error path.

Pre-existing issues:
- [High] The driver ignores the return value of `pm_runtime_get_sync()` in =
the unbind/remove path, leading to a kernel panic.
--

--- Patch [8]: [PATCH v5 8/8] mmc: sdhci-esdhc-imx: fix resume error handli=
ng ---
commit eb59f1a91caafc261d97666e5d0b0450cef19279
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: fix resume error handling

This commit adds a return value check for pm_runtime_force_resume() in
sdhci_esdhc_resume(). If it fails, it returns early to prevent unclocked
hardware accesses. It also simplifies the return value handling on success.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 6cb84690fde4e..f4bfb14423e4d 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2126,12 +2126,12 @@ static int sdhci_esdhc_resume(struct device *dev)
>  			dev_warn(dev, "Failed to restore pinctrl state\n");
>  	}
> =20
> -	pm_runtime_force_resume(dev);
> -
> -	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);
> +	ret =3D pm_runtime_force_resume(dev);
>  	if (ret)
>  		return ret;

[Severity: High]
If we return early here without setting host->flags |=3D SDHCI_DEVICE_DEAD,
will the MMC core still attempt to access unclocked hardware?

The PM core will continue system resume and eventually invoke
mmc_resume_host() on the child MMC device. The MMC core would then call host
operations like sdhci_set_ios(), which attempt to read and write SDHCI
hardware registers on an unclocked controller. Could this trigger a
synchronous external abort and result in a kernel panic?

[Severity: Medium]
Does this early return skip the GPIO CD wake IRQ cleanup, leaving the
wake source configured?

During sdhci_esdhc_suspend(), the card detect IRQ is configured as a wake
source via mmc_gpio_set_cd_wake(..., true). Because the card detect
configuration interacts with the GPIO controller and has no dependency on
SDHCI clocks, should it be executed on the error path to avoid leaking the
wake source configuration?

> =20
> +	mmc_gpio_set_cd_wake(host->mmc, false);
> +
>  	/* re-initialize hw state in case it's lost in low power mode */
>  	sdhci_esdhc_imx_hwinit(host);

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does ignoring the return
value of pm_runtime_get_sync() in sdhci_esdhc_imx_remove() lead to the same
kernel panic on unclocked hardware access?

In drivers/mmc/host/sdhci-esdhc-imx.c:sdhci_esdhc_imx_remove():

	pm_runtime_get_sync(&pdev->dev);
	dead =3D (readl(host->ioaddr + SDHCI_INT_STATUS) =3D=3D 0xffffffff);

If the device is in an error state and clocks fail to enable,
pm_runtime_get_sync() returns a negative error. By immediately executing
readl(host->ioaddr + SDHCI_INT_STATUS) on an unclocked device, could this
trigger a synchronous external abort when the device is unbound?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707110303.3779=
799-1-ziniu.wang_1@oss.nxp.com?part=3D8
