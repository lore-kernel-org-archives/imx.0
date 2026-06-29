Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A203F99E9
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725454; cv=none; b=teMQtIN9rYwgOtc/bIMc+DMvlvw67p9ukhu58RcAt5GbSSLMiXz71uoA/YE/Pz4Uk7ZlGA/rNBFKHFWBim+4woOoX+ubDuttMVupMxMeGuVS/joS7bof56hTJ8+6zZwghSng9sCR5ahkj+mDl2VyDvgdbgWx1pIwXEGrUnowC1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725454; c=relaxed/simple;
	bh=HqWD8WTRzHSbFwofDlnhyaI6FSTEG9s9QUmStr2kufk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wz7y35Ft2+++gcuVfzhZJXcOSU38dwcv5Z/DO0pqcomrgAGSGcJJLhyH1c9p4MxakyIMdjTTz+ai0bOlu2uDtPV7RYsXLtcMF+7eSWxE9R4qFXFbmJhjbNvjlN0bU7iNlDfFQELpuI+yOJV/hWeqH1t1fNKkiVvq1LrBhSWFlSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mh3khieK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mh3khieK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92BE1F000E9;
	Mon, 29 Jun 2026 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782725453;
	bh=DpYFvghBXVhL+xnb/LZbqFnFASAA5CezakErXN5e0Go=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mh3khieKSkuVUW4h3wZibZmpL+1SCGPkxv7vMHa3f3Wp9tRpQkhwnRG58vf83S/n/
	 rl4mi06Vol0SbHsdXZ6JiBNwGyQalLb7pHfdvrwDM1Uq16vO6S54wfyzsfI+varWfv
	 q3tDQhbIPtrKdShYPQeVZV4PoRAAHw5xqmelPPeHRnzCjL0yEU13Wxsf5AAqgzRYn4
	 +XbvtJDqTLQkvoe8Bcu60lxqZPfd2qAScvM3EtzwK5PFffnM3835hd1ZgfVe+JvjM4
	 99xb0/Qpo7yPizpvpJcDtBXYBAB4klPDeVIhQ1UggZjeIp+O/YWiOVYAN9XbVnUiFA
	 vVmbuvRQD0a6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] mmc: sdhci-esdhc-imx: restore DLL override for
 DDR modes on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260629091954.3227151-3-ziniu.wang_1@oss.nxp.com>
References: <20260629091954.3227151-1-ziniu.wang_1@oss.nxp.com>
 <20260629091954.3227151-3-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 09:30:52 +0000
Message-Id: <20260629093052.E92BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Runtime PM usage counter leak on the error path of `sdhci_esdhc_=
resume()`. While other commits in this series fixed pre-existing leaks in `=
sdhci_esdhc_suspend()` and `sdhci_esdhc_resume()`, the final patch in the s=
eries (commit "mmc: sdhci-esdhc-imx: fix resume error handling") newly intr=
oduced an early return if `pm_runtime_force_resume(dev)` fails. This bypass=
es the balancing `pm_runtime_put_autosuspend(dev)` call, permanently leakin=
g the usage counter acquired during suspend.
--

commit 685c5877490d2d6169aac7e7a9adb332302c0a39
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: restore DLL override for DDR modes on resume

This commit extracts the DLL override setup into a helper function and
calls it during the resume path. This ensures that SDIO devices operating
in DDR mode retain their DLL override configuration if they keep power
during system suspend.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 6526d65538de5..a944351dbcdff 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c

[ ... ]

> @@ -2123,9 +2132,18 @@ static int sdhci_esdhc_resume(struct device *dev)
>  	 * restore the saved tuning delay value for the device which keep
>  	 * power during system PM.
>  	 */
> -	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
> +	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data)) {
>  		sdhc_esdhc_tuning_restore(host);
> =20
> +		/*
> +		 * Restore DLL override for DDR modes. hwinit unconditionally
> +		 * clears ESDHC_DLL_CTRL, but the card is still in DDR mode.
> +		 */
> +		if (host->timing =3D=3D MMC_TIMING_UHS_DDR50 ||
> +		    host->timing =3D=3D MMC_TIMING_MMC_DDR52)
> +			esdhc_set_dll_override(host);
> +	}
> +
>  	pm_runtime_put_autosuspend(dev);

[Severity: Medium]
Does this error path leak the runtime PM usage counter?

Looking at the beginning of sdhci_esdhc_resume():

	ret =3D pm_runtime_force_resume(dev);
	if (ret)
		return ret;

If pm_runtime_force_resume() fails, the function returns early and bypasses
this pm_runtime_put_autosuspend() call. Could this leave the usage counter
unbalanced and prevent the eSDHC controller from entering runtime suspend?

> =20
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629091954.3227=
151-1-ziniu.wang_1@oss.nxp.com?part=3D2
