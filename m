Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B163112DA
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100780; cv=none; b=DhGyd0hm5rebP40aYmcPqbgp4gkA90pW13qxNlrHxqHN7hpCavlG7l2UFlQaihTGemtb1z2Hz9iKVAeERGn0kUwTcw5bGInxi/3PqjTvGXlYTarWy4M+Eu6Pm3l4FTG9jb4X4timZlUyTbusyShggIiKhvj3r4ktvUeRmhwyGe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100780; c=relaxed/simple;
	bh=LShaISEZ31fDYxk3jlDP80SbQOYLdzNVjeUVLhw9AQk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MTjPHzX5GQr5YzJY6PjqBkgUAQQ/9AW73YXdZ17daopi7tKJl6AZBXIFENkNsR2mmes/3K7vPAuyc1HuskglvpaODgUDnIBHc/PSVFiyZucHpCsoh8y8x7vK5LO9QRMh1UiyY5EQyGRDfZZY7q7h9fQeHW8WO2+S3JCnOrTA4jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eb0kBnAy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eb0kBnAy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846921F000E9;
	Wed, 15 Jul 2026 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784100778;
	bh=fzPjpdLjZSqWVypuSvX29rHX6uZZ0ycYZwSKxTJxu5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eb0kBnAyB/YpdcRVrlUiWZbVZ0f/iu6xwGW9Hxm+r+plMwvIIDFnO8aRCALU3z2CX
	 aQl+dKXSnL2by8jcEwp58iY0mKWHIEx+fHkdPnQPBxUku/ZdLDCdJLNTAyIFzSPoc+
	 vjdnbiu42Zr6XRGcVm+MKL/heBvr9bwZQD14B3SvEc83noWDqE/w+JbRe8N4l9+c9j
	 I9PjgcMcyyhKdPgaumw6JmyyS1Zlrrx/EXDVFCNBqSBF9mmUveYgiXB4miMdOWSfwx
	 rBo3DpAVmDYbg50kog4fAOVuIyUEct4OgGFyYzVTSH+GTrfaYHexsVHfRmuRSFuO3W
	 AMBcsqmiD2nPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/8] mmc: sdhci-esdhc-imx: restore pinctrl before
 restoring ios timing on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260715071818.272318-5-ziniu.wang_1@oss.nxp.com>
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
 <20260715071818.272318-5-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:32:58 +0000
Message-Id: <20260715073258.846921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return value of `pm_runtime_get_sync()` is ignored in `sdhci_e=
sdhc_suspend()`, which can lead to a synchronous external abort (kernel pan=
ic) if it fails.
- [High] The return value of `pm_runtime_force_resume(dev)` is ignored. If =
it fails, subsequent register accesses will cause a system crash.
- [High] Runtime PM usage count is leaked on the error paths of `sdhci_esdh=
c_suspend()` and `sdhci_esdhc_resume()`.
- [High] The IRQ remains permanently disabled if `sdhci_enable_irq_wakeups(=
)` fails during system suspend.
--

--- Patch [4]: [PATCH v7 4/8] mmc: sdhci-esdhc-imx: restore pinctrl before =
restoring ios timing on resume ---
commit fff04de9eca73d5e5d595f7bfc0d534292f22cd5
Author: Luke Wang <ziniu.wang_1@nxp.com>
mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on resume

This commit fixes persistent read CRC errors on SDIO devices resuming in DDR
mode. It ensures the pinctrl state is correctly restored for the current ti=
ming
before enabling DDR mode during resume. Wakeup devices are skipped as they
keep their active pin state during suspend.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 2da5c8ab3e622..bc0864cb22b49 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2115,6 +2115,12 @@ static int sdhci_esdhc_resume(struct device *dev)
>  	struct pltfm_imx_data *imx_data =3D sdhci_pltfm_priv(pltfm_host);
>  	int ret;
> =20
> +	if (!device_may_wakeup(dev)) {
> +		ret =3D esdhc_change_pinstate(host, host->timing);
> +		if (ret)
> +			dev_warn(dev, "Failed to restore pinctrl state\n");
> +	}
> +
>  	pm_runtime_force_resume(dev);

[Severity: High]
This is a pre-existing issue, but the return value of pm_runtime_force_resu=
me()
is ignored here. If it fails, could the subsequent unclocked hardware regis=
ter
accesses in sdhci_esdhc_imx_hwinit() cause a synchronous external abort?

> =20
>  	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);

[Severity: High]
This is a pre-existing issue, but if mmc_gpio_set_cd_wake() fails, the early
return skips the required pm_runtime_put_autosuspend() at the end of the
function:

drivers/mmc/host/sdhci-esdhc-imx.c:sdhci_esdhc_resume() {
    ...
	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);
	if (ret)
		return ret;
    ...
	pm_runtime_put_autosuspend(dev);
	return 0;
}

Could this leak the runtime PM usage count and prevent the device from ever
entering runtime suspend again?


[Severity: High]
This is a pre-existing issue, but could a similar leak happen in the suspend
path if pinctrl_pm_select_sleep_state() fails?

drivers/mmc/host/sdhci-esdhc-imx.c:sdhci_esdhc_suspend() {
	...
	pm_runtime_get_sync(dev);
	...
	} else {
		ret =3D pinctrl_pm_select_sleep_state(dev);
		if (ret)
			return ret;
	}
	...
}

Does the early return here leak the PM reference acquired by
pm_runtime_get_sync()?


[Severity: High]
This is a pre-existing issue, but the return value of pm_runtime_get_sync()
in sdhci_esdhc_suspend() is completely ignored:

drivers/mmc/host/sdhci-esdhc-imx.c:sdhci_esdhc_suspend() {
    ...
	pm_runtime_get_sync(dev);

	if ((imx_data->socdata->flags & ESDHC_FLAG_STATE_LOST_IN_LPMODE) &&
    ...
}

If pm_runtime_get_sync() fails to enable the clocks, could the subsequent
hardware register accesses via sdhc_esdhc_tuning_save() cause a kernel pani=
c?


[Severity: High]
This is a pre-existing issue, but could the IRQ remain permanently disabled=
 if
sdhci_enable_irq_wakeups() fails during suspend?

In sdhci_esdhc_suspend(), the IRQ is disabled unconditionally when the devi=
ce
may wake up:

drivers/mmc/host/sdhci-esdhc-imx.c:sdhci_esdhc_suspend() {
    ...
	if (device_may_wakeup(dev)) {
		disable_irq(host->irq);
		ret =3D sdhci_enable_irq_wakeups(host);
    ...
}

But in sdhci_esdhc_resume(), it is only re-enabled if host->irq_wake_enable=
d is
true, which requires sdhci_enable_irq_wakeups() to have succeeded:

drivers/mmc/host/sdhci-esdhc-imx.c:sdhci_esdhc_resume() {
    ...
	if (host->irq_wake_enabled) {
		sdhci_disable_irq_wakeups(host);
		enable_irq(host->irq);
	}
    ...
}

If sdhci_enable_irq_wakeups() fails in the suspend path, will the device be=
come
completely unresponsive to interrupts after system resume?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715071818.2723=
18-1-ziniu.wang_1@oss.nxp.com?part=3D4
