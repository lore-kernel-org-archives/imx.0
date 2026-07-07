Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0487081AA8
	for <imx@lists.linux.dev>; Tue,  7 Jul 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423027; cv=none; b=ABMCX9ikBFxalqjLC0LmTrNKBXK0bdvrlQu77pDmYziGPBhUItTn++LaKuTkFgCoSFGh+Ro/1anquh3F3tMkwzAyyOpOcdEQbCAkLoHf0d2+lfsfuJTL/P3wIpNj+wdaWBA/hH+mT0/zIHLwnF6iAhNlKcE8lgwCw5wiQAE8eFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423027; c=relaxed/simple;
	bh=ynxjIFvBPFwWmFsOZRA8frYn8xbiNiC5OMGP5NZiWC0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XQPyTNK1Al4QfYeAAgF1uCPRONO6GD1wzYPhUwbmIUph6uQYfTYq72Ji4QiDduNuhYgZBMBNWjWeOgOOOXH3rAzeXF9a4Ez0POGLOYFqWRS48ur+BwGiflH6rvpfYER95D3jxCk526nzUHf6BFa+Kyenz88xXokctbLT3/v7kpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyHCTj30; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyHCTj30"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD8F1F000E9;
	Tue,  7 Jul 2026 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783423025;
	bh=93D1TyY1k2vAOD4N2iLJ2wX1SNSalyPvpcGvGDFXMf4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FyHCTj30B9hsln4I/r037FE2fXecP2bzrPfH2z0PLmhQC/neo7mXo1knMzbHoWpz1
	 kFJYD2uIUu/4VQ/Flh8LVxmcIj1yUPCiZvvTUQ29Wi2F2Aq3hpeJ9nYmSWY1lT6x9r
	 tLRhMW3wV5zwe7W8gmdhG3Y6W6qnm9QJWZRIoPsbQdzn51NbaKgae68WH9ZpC1eVry
	 /Hm9Udnbl0f5EM0ZrY6q899DmTiq2518jXtptGk4N82oBJl6l9IVT+/sbty7JQMy0h
	 Ypnau/3+tO3Afw1d3b5DTJf0N3FHel0g2m0WjYXct4bc4EjvflU8id16DAD5I8iQpt
	 3VedETbpeif9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/8] mmc: sdhci-esdhc-imx: fix
 esdhc_change_pinstate() to allow default state restore
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260707110303.3779799-4-ziniu.wang_1@oss.nxp.com>
References: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
 <20260707110303.3779799-4-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 11:17:04 +0000
Message-Id: <20260707111705.4FD8F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing NULL pointer dereference in `esdhc_change_pinstate()`=
 due to insufficient pointer validation.
--

--- Patch [3]: [PATCH v5 3/8] mmc: sdhci-esdhc-imx: fix esdhc_change_pinsta=
te() to allow default state restore ---
commit a74e8c023dfc4c92edd0793b792f39383f06ef13
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: fix esdhc_change_pinstate() to allow default state re=
store

This commit moves the IS_ERR checks for pins_100mhz and pins_200mhz into
their respective switch cases. This allows devices with a sleep pinctrl
state but without high-speed pin states to restore their default pin
configuration.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1326,19 +1326,21 @@ static int esdhc_change_pinstate(struct sdhci_hos=
t *host,
> =20
>  	dev_dbg(mmc_dev(host->mmc), "change pinctrl state for uhs %d\n", uhs);
> =20
> -	if (IS_ERR(imx_data->pinctrl) ||
> -		IS_ERR(imx_data->pins_100mhz) ||
> -		IS_ERR(imx_data->pins_200mhz))
> +	if (IS_ERR(imx_data->pinctrl))
>  		return -EINVAL;
> =20
>  	switch (uhs) {
>  	case MMC_TIMING_UHS_SDR50:
>  	case MMC_TIMING_UHS_DDR50:
> +		if (IS_ERR(imx_data->pins_100mhz))

[Severity: High]
This is a pre-existing issue, but could this lead to a NULL pointer
dereference?

On non-USDHC platforms where the device tree incorrectly advertises UHS
capabilities, pins_100mhz might be uninitialized and left as NULL. Since
IS_ERR() evaluates to false for a NULL pointer, this check will pass,
allowing the NULL pointer to be assigned to pinctrl and later passed to
pinctrl_select_state(), which will panic in pinctrl_commit_state().

Would it be safer to use IS_ERR_OR_NULL() here instead?

> +			return -EINVAL;
>  		pinctrl =3D imx_data->pins_100mhz;
>  		break;
>  	case MMC_TIMING_UHS_SDR104:
>  	case MMC_TIMING_MMC_HS200:
>  	case MMC_TIMING_MMC_HS400:
> +		if (IS_ERR(imx_data->pins_200mhz))

[Severity: High]
This is also a pre-existing issue, but could the same NULL pointer
dereference happen here?

If pins_200mhz is NULL due to the same misconfigured device tree scenario
mentioned above, this check will also pass, resulting in a panic when NULL
is passed to pinctrl_select_state().

Should this check also be updated to IS_ERR_OR_NULL()?

> +			return -EINVAL;
>  		pinctrl =3D imx_data->pins_200mhz;
>  		break;
>  	default:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707110303.3779=
799-1-ziniu.wang_1@oss.nxp.com?part=3D3
