Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D22E3F5BDD
	for <imx@lists.linux.dev>; Tue,  7 Jul 2026 11:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422952; cv=none; b=cxr7yM/6vWmfobfoQJEqlQpIBqBFUdgrTaDskZrdmmJVW3SqLaDjon8TuGhLD0dVYdCAqFOVEqyLnt5YsxD1/BoDwEQv1V+U1I2254PwXYk3ER10Z5q6Ajf9scjOF2fGTkrnY95P82JcpCEoH9rVe7wwOmy2/OEPL3wHwQeioJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422952; c=relaxed/simple;
	bh=AJYYdkoF/I2HnSHP0GVp65gEw0zZLzezj97Y58CZENs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uoisr2LSfHgG/6I7tm8kZ0eovO78cnrkS/16leqn+lYr8vlZv0Qzg3+oCEW/wGB/vx/S1savCTR7brb4my89n6YLu1lvjo04PVeZWI0LbdYt6rC3+1Em2HPtJxUHTgPRq0YR8P08dt/O7o6hRt44Ft0Ln7X7LvXYSCpQOG4MpPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLuPYgDF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLuPYgDF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7F11F000E9;
	Tue,  7 Jul 2026 11:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783422951;
	bh=y0R/UGgkGdbU1ayQum/kueQ7Oo+7PmlE+RXMOFuJ7o0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aLuPYgDFuiNXFyz9ZDPQFTK3dj437MXFhrSKuCwHmG1FjeGAnaU7bfy+aLStJ4ouR
	 akMgAxfne5Q63SrToUZoyfZUa77rHDf9BOoK4j5YY5kUYdE3cmiSn9xe+x0EjfVTvS
	 SqDokk9RHEDgOjbKs6zJ/QzqHE6gVUtJg4G+r6dXAJJSvf9D1ad1/wGiDdinX4Sd7k
	 Zido4cE51XVgQAVOidzl3spi3DG/RtLPS0wQtWMnQkPMlAI1aiG+j9F81pT3y9GswL
	 VZxYmdghL9BuhFMytrEY5lHyY/8e0enjjqrEufsdaaaFuF6gmd0JV1V5VtWm+c2Gpu
	 ZLKDccLWHgbxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/8] mmc: sdhci-esdhc-imx: restore DLL override for
 DDR modes on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260707110303.3779799-3-ziniu.wang_1@oss.nxp.com>
References: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
 <20260707110303.3779799-3-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 11:15:50 +0000
Message-Id: <20260707111551.2B7F11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced `disable_irq()` on system resume if `sdhci_enable_irq_w=
akeups()` fails or returns false.
--

--- Patch [2]: [PATCH v5 2/8] mmc: sdhci-esdhc-imx: restore DLL override fo=
r DDR modes on resume ---
commit 61cde7a0a044133654432ad08827554658f6a4b1
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: restore DLL override for DDR modes on resume

This commit extracts the DLL override setup into a helper function and
calls it during the resume path for SDIO devices operating in DDR timing
modes that keep power.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 6526d65538de5..7230d70e02ae1 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c

[ ... ]

> @@ -2123,9 +2131,18 @@ static int sdhci_esdhc_resume(struct device *dev)

[Severity: High]
This is a pre-existing issue, but could this code lead to an unbalanced
disable_irq() on system resume?

Looking at sdhci_esdhc_suspend(), the IRQ is unconditionally disabled
if device_may_wakeup(dev) is true:

    disable_irq(host->irq);
    ret =3D sdhci_enable_irq_wakeups(host);

However, if sdhci_enable_irq_wakeups() fails or returns false (for example,
if no wake-capable SDIO card is present and CD IRQ wakeup is disabled),
host->irq_wake_enabled remains false.

During sdhci_esdhc_resume(), enable_irq() appears to be executed conditiona=
lly
based on host->irq_wake_enabled:

    if (host->irq_wake_enabled) {
        sdhci_disable_irq_wakeups(host);
        enable_irq(host->irq);
    }

If host->irq_wake_enabled is false, would the re-enablement be skipped?
Could this permanently disable the SDHCI controller's main interrupt after a
system suspend/resume cycle, rendering the MMC controller unusable and
potentially leading to a system crash if it is the rootfs device?

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707110303.3779=
799-1-ziniu.wang_1@oss.nxp.com?part=3D2
