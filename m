Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46972360EC3
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 05:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783918874; cv=none; b=WsAS5VRmqovYQx5ZB2jCz1AkX5ydkRy9YFy4iTBdv3hN3otHhK4L5CdvBNbvjOIgy46H6B5gRqGkeEH2zlWa6dzqQu3Sngmee8+kcROrSRlXu7KnD7N2dIgM3NL4yB9LODUXJMkHzVSQLSZTkFJs70d/wANlPCYCTwl75bA8lFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783918874; c=relaxed/simple;
	bh=GvmaJd6XRSdotoS2dgmRq70LfM0PkUiqoFsbWJJkP7U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b45ei9aEeqwT93ezPRRIDu9KJsNecvGr8GlCxeC2y4S464m1l9abF79fDZo17wyUUmerd0OrrNoWqrDyPn3EOeoCsmLroHq/1w2Qq8wphBs8XLyUe9dbgLyeqWgtvRs96toAoxWkpIqy0u/AfZr5fsqmBMNDZo7xRsw/zHcVeP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liCSR7mg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liCSR7mg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED4D1F00A3D;
	Mon, 13 Jul 2026 05:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783918872;
	bh=9h54uiwc94FfYs84sF7ZA/wwpRoumv1uR1N+5Qi7YAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=liCSR7mgVNZ1NxdjZ9icq2R+T8dafXKxR9O9qbvMnwWxNjJw8Eh0lrZMCFZSuICcG
	 ZswVP4cS0rqaa0ZH9CMmxy862Zk8GYvSbvV4ulObvtRFRIJZijhSi+5mECGobIse69
	 OgGcC5E1gupXZ5UL76+mCKG69fzjQmDsWL2w9jc/FpydzvD9+fty4h0codWOtZg/lC
	 ilG/DFxXDqSGhaQjbNat24jWmesP0dlSR8hKGRMMnpzZmd1Rb5Bb6DbizjrEHQGd3o
	 wChuFL5ALB9JgsEhhmHhzxK69D32EKRPKUNlU5MaizmcLK9hM1V+fhh0/DYOu4o+mN
	 4fsPi3H6qMcoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/8] mmc: sdhci-esdhc-imx: restore DLL override for
 DDR modes on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260713043904.4144172-3-ziniu.wang_1@oss.nxp.com>
References: <20260713043904.4144172-1-ziniu.wang_1@oss.nxp.com>
 <20260713043904.4144172-3-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 05:01:12 +0000
Message-Id: <20260713050112.AED4D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced IRQ disable/enable during system suspend/resume when SD=
IO wakeup fails to enable or is not applicable.
- [Medium] Missing `pm_runtime_put` on error paths in `sdhci_esdhc_suspend(=
)` leads to permanent runtime PM usage count leaks.
--

--- Patch [2]: [PATCH v6 2/8] mmc: sdhci-esdhc-imx: restore DLL override fo=
r DDR modes on resume ---
commit 4b48b54434ffc2d8ee1f13e793a63d33908babc8
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: restore DLL override for DDR modes on resume
   =20
Extract the DLL override setup from esdhc_set_uhs_signaling() into
a helper esdhc_set_dll_override(), and call it on the resume path
when the card kept power and is using a DDR timing mode.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 6e06b3eeacce9..685e508c61279 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
[ ... ]
> @@ -2123,9 +2131,18 @@ static int sdhci_esdhc_resume(struct device *dev)
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
This is a pre-existing issue, but I noticed a potential IRQ unbalance during
suspend/resume.

If device_may_wakeup(dev) is true but the controller doesn't support or
successfully enable in-band IRQ wakeups (for example, standard SD cards
using GPIO CD), sdhci_enable_irq_wakeups() returns false and
host->irq_wake_enabled is set to false.

In sdhci_esdhc_suspend(), the device IRQ is unconditionally disabled:

sdhci_esdhc_suspend() {
    ...
    disable_irq(host->irq);
    ret =3D sdhci_enable_irq_wakeups(host);
    ...
}

If host->irq_wake_enabled is false, will the IRQ remain disabled on resume?
Looking at sdhci_esdhc_resume(), it appears enable_irq() is bypassed if the
wakeup enablement failed:

sdhci_esdhc_resume() {
    ...
    if (host->irq_wake_enabled) {
        sdhci_disable_irq_wakeups(host);
        enable_irq(host->irq);
    }
    ...
}

Could this leave the SDHCI controller's main interrupt permanently disabled
after a suspend/resume cycle, stalling all future MMC/SD card transactions?

[Severity: Medium]
This is another pre-existing issue, but does sdhci_esdhc_suspend() leak the
runtime PM usage counter on error paths?

sdhci_esdhc_suspend() starts by incrementing the PM usage counter:

sdhci_esdhc_suspend() {
    ...
    pm_runtime_get_sync(dev);
    ...

Later, it can return early without dropping the acquired PM reference:

    ...
    ret =3D pinctrl_pm_select_sleep_state(dev);
    if (ret)
        return ret;
    ...
}

If operations like pinctrl_pm_select_sleep_state() or
mmc_gpio_set_cd_wake() fail, the function returns an error code and system
suspend is aborted. Since the PM core skips the resume callback for devices
whose suspend failed, wouldn't the matching pm_runtime_put_autosuspend() be
skipped, leaving the PM usage counter permanently leaked and preventing the
controller from entering runtime suspend again?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713043904.4144=
172-1-ziniu.wang_1@oss.nxp.com?part=3D2
