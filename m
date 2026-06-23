Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DAD3B6347
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200870; cv=none; b=RdIwiTYxVp+dr9iTh44VSsuVWBfe1a1D8AGL4Qv0+61w6FSYt6fV3IFRv2lwY/J98yp9iuWlbFQeEE+VDof5x7KMfHluVbGBEfTfenavtotwo+SD7ivm6unSk2x0jf0rKl29Cb7sDX+1o1PL7CRbUqECaNBJFsA+c+58blJJ3JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200870; c=relaxed/simple;
	bh=Ug4tNj/5zbw61Omj/PwVMc62Cc2etiwmP/o7Xg6GUhw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uXZYVm5c6wS+sX/um9L5myZNAg52WQyqFejr+FOs/HNKeDEjaKStPsHoEvAImLQCgwq5Q/hVXe1gddD3P/gesoRPABNape3LBRkOFDmOKHJw+wQ3Sv2qDc5cM0+d+3OczPcN+qrJQ0S8lbpNengbbMSsmnsDXeoRwQ1xj3jBu6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6Eslx8G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6Eslx8G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8671F00ADE;
	Tue, 23 Jun 2026 07:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782200868;
	bh=dA74as/YZdUI/zkLWPIllXOSCuMX+ijd3pF6Cvoqhnk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n6Eslx8Gm+iufEQnxY74RUJkFqMbCI4S9d89dpIBohs11E+9/SYh6gJP13xvFqadp
	 Vu3fKBnd5MtFbKeGTyzVOM83LYX/PdlXFVivg7DOrwnW2T4aju0XfokJ8tzZoHqnA8
	 wY/AgfxpC1hgAPQ2kJ9pF9+zSOaxN+sOOkaPFGEPNToGHDNyDM49+jKrMT1WCKL0mq
	 rxVpDjkz4MEGdEEsX7yoZorIsXlLKS5SgxBqyvZKlmer+mYzyzaEigMhsgEYFeEeXW
	 kc2s083A/MySjRg1p8pEIPk/v/yX1mciS0EpJ53Q+nT6iG5dk8KH/QVSsZpaG2p7XL
	 kzTVSAT/kMfpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] mmc: sdhci-esdhc-imx: restore DLL override for DDR
 modes on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260623073515.2658205-3-ziniu.wang_1@oss.nxp.com>
References: <20260623073515.2658205-1-ziniu.wang_1@oss.nxp.com>
 <20260623073515.2658205-3-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 07:47:48 +0000
Message-Id: <20260623074748.5F8671F00ADE@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Early error returns in suspend/resume paths bypass mandatory resou=
rce cleanup, PM usage counter balancing, and hardware state restoration.
--

commit 10711dfe4cc676e64053bf9eecc1ce9d4fa7a61e
Author: Luke Wang <ziniu.wang_1@nxp.com>
Subject: mmc: sdhci-esdhc-imx: restore DLL override for DDR modes on resume

This commit restores the DLL override configuration on the resume path for
SDIO devices operating in DDR mode that keep power during system suspend.
It extracts the DLL override setup into a helper function and calls it
during resume to ensure the configuration is not lost.

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
> =20
>  	return ret;

[Severity: High]
This is a pre-existing issue, but do the suspend and resume error paths
bypass mandatory resource cleanup?

Looking at the start of sdhci_esdhc_resume():

sdhci_esdhc_resume() {
    ...
    ret =3D pinctrl_pm_select_default_state(dev);
    if (ret)
        return ret;
    ...

If this fails, it returns early and bypasses pm_runtime_force_resume() and
pm_runtime_put_autosuspend() at the end of the function, leaving the
device runtime-suspended and its IRQ disabled.

A similar issue appears to exist in sdhci_esdhc_suspend():

sdhci_esdhc_suspend() {
    ...
    /* The irqs of imx are not shared. It is safe to disable */
    disable_irq(host->irq);

    if (device_may_wakeup(dev)) {
        ...
    } else {
        ret =3D pinctrl_pm_select_sleep_state(dev);
        if (ret)
            return ret;
    }
    ...

If pinctrl_pm_select_sleep_state() fails, it returns early without
re-enabling the IRQ that was just disabled or reverting the PM runtime
usage counter.

Could these error paths permanently hang the SDHCI controller until the
next reboot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623073515.2658=
205-1-ziniu.wang_1@oss.nxp.com?part=3D2
