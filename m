Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ED73164C7
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100774; cv=none; b=Ok1YHt2BWRvT88m6O9hOO+0RO4g3oXO4tIyk17HLkaS72RPFNsaKEv+chaH5KjTA7OEsu0ymF3y1jTc5PF+l8VfCDSrkj5ffa9RI+8lb89VkKIS4oCPJicV8MBf66UN2BH4YU3lQvJi88EH9FrD+hlvhk0ROD/db1MoVCOq76SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100774; c=relaxed/simple;
	bh=3eGT2M6pyFKDTrv/tr+ix0qdq1vkGb/JIU94tgHqWX0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FUuR3BHKOoniXMjGcEd8DX2e04k3wfnjLh5ZrK7ipf7IzpX06kpXVnS5H11Dgv7hzU+LL7iJgTUQasiGoCkWM4WZlnby8NWVNVRzJDXqwQWADGrmGFPX2CTNiRHv28yuS0lVs+JdIxp4ZDi2GrDEC3ELN2G1WQgJG5zdSuzWti0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1RciIMH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1RciIMH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CAE1F000E9;
	Wed, 15 Jul 2026 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784100772;
	bh=Q0MKB8btsXuSVM6xWxJFl9WhLk/5TYMKog9w+wPikV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W1RciIMHPLbqRKWLFE07xAWNpAq1QW1M5sR+vC4gVBWTAYf2trYzFFvFcRwm5iLh4
	 X99yV1VCPCWqOfNdd199x3Sklgn1t+pETM5Me14Erv4TfEi5bER5WyjMVsTdpWVGN7
	 iH11sl9fhyneVZL2sCGUGQRFgvdA5KAdUBdAsdckQn2LZEkojnTBkq4KmbwloE04Z9
	 T9n/bACiQG0Qi1VJrFkIShhp+VThNJSyiba6CzAjeUNHj4ewxdissSuQWjDIHnurLZ
	 EZgW0XjKkXUqS1Qro9y7j2dw40hd0Y6hECB2k6leORdA6nMZWPz26Qdh6Sg9fq7VnI
	 lUsWG3XwBZMow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/8] mmc: sdhci-esdhc-imx: restore DLL override for
 DDR modes on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260715071818.272318-3-ziniu.wang_1@oss.nxp.com>
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
 <20260715071818.272318-3-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:32:52 +0000
Message-Id: <20260715073252.A6CAE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] PM Runtime usage counter leak on system suspend error path.
--

--- Patch [2]: [PATCH v7 2/8] mmc: sdhci-esdhc-imx: restore DLL override fo=
r DDR modes on resume ---
commit 6d9ae84daab041f83a8a4ceef937b796f9b804f4
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: restore DLL override for DDR modes on resume

sdhci_esdhc_imx_hwinit() unconditionally clears ESDHC_DLL_CTRL by
writing zero. For SDIO devices that keep power during system suspend
and operate in DDR mode, the card remains in DDR timing while the host
DLL override configuration is lost.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 6e06b3eeacce9..685e508c61279 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
[ ... ]
> @@ -2123,9 +2131,18 @@ static int sdhci_esdhc_resume(struct device *dev)

[Severity: High]
This is a pre-existing issue, but while reviewing the system PM logic here,
I noticed a PM runtime usage counter leak in the suspend error path.

In sdhci_esdhc_suspend(), pm_runtime_get_sync() increments the usage counter
early in the function, but the error path for pinctrl_pm_select_sleep_state=
()
returns without balancing it:

drivers/mmc/host/sdhci-esdhc-imx.c:sdhci_esdhc_suspend() {
    ...
	pm_runtime_get_sync(dev);
    ...
	if (device_may_wakeup(dev)) {
    ...
	} else {
    ...
		ret =3D pinctrl_pm_select_sleep_state(dev);
		if (ret)
			return ret;
    ...
}

If pinctrl_pm_select_sleep_state(dev) fails, does this permanently leak the
PM runtime usage counter, since the system suspend is aborted and the
corresponding resume callback will not run?

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
> =20
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715071818.2723=
18-1-ziniu.wang_1@oss.nxp.com?part=3D2
