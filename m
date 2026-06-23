Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F213BA253
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 07:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200722; cv=none; b=qycDac8UN0IGS2UnbJIKA8CYdVIpTxNtj6mpgrxdaSHOvN7kqtSzIF5fbhZyZeUc3wRIm7fVkCp/bBEbY3okp9WUpkUtMLCq4v0J6i335KIHNsVZHESYyziEkkN5RJG7mtBwTIWRoN5fRm91QLQIj+ZNWbZyrb3EBfmUMJaY4fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200722; c=relaxed/simple;
	bh=RTT4427FFQuwlwHZM3Q1pphpjfcL6NZFpSPJwdLmd2M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HUA8A7lCkKz7BQoKv7pi/0bL63S+TQ6Eaqd/WjErzfWyJkrdhwmMhfeJgrFN+HdBC1wndygHUd5ZRENrR8mrqhIbK1Uo5PeeVY4RcIrm1hzuzZ5AtoHpcbRehcDSXV/sRGCOBQtk/5if+HktGP1zl9iwYpiEuABxiTZ9g563u0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cfs4sQQg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cfs4sQQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4A71F000E9;
	Tue, 23 Jun 2026 07:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782200721;
	bh=v0SvNdW6v4Od7vrF3fWlYS9zxsLqIewnjmDsRW0wISA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cfs4sQQgJWyGA09+XrxycCZk/AqSG/xe4dG4QiNc+rdeUDcUydl4hlUbvpftFI2Ph
	 ww6hdV9Bj8WAMI4I1PNlQ7QTbPtOfFRqpgrclUIap5q7a05OyN5cisToonuTqEQmaY
	 HL+TI1v0keHqAvhJG+ZaDR0+1BQ5roBKBDAsbyklpNLm8nlVWmnWpcSr7+3Ok1IP8r
	 DRChzQbRtyFNMIfTy1OU9lZ5GpaNLE3xyS2NUgA6aDE9d9gnSyIDI9PXc/y/n4gU/7
	 ZZtj77hhO+4iQ5QLHURqtRwe5qDFlA2PVOQZ0TO3Ql+pgd1zmGzdHuVJUa0uLhlDGS
	 GlBthPOb4k0uA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] mmc: sdhci-esdhc-imx: remove unnecessary
 mmc_card_wake_sdio_irq check for tuning save/restore
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260623073515.2658205-2-ziniu.wang_1@oss.nxp.com>
References: <20260623073515.2658205-1-ziniu.wang_1@oss.nxp.com>
 <20260623073515.2658205-2-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 07:45:20 +0000
Message-Id: <20260623074520.EE4A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked return values from `pm_runtime_get_sync()` and `pm_runti=
me_force_resume()` can lead to kernel panics via unclocked hardware registe=
r accesses.
- [High] Error paths in system suspend and resume callbacks leak PM runtime=
 usage counters, bypass PM state changes, and leave the host IRQ permanentl=
y disabled.
--

commit 3bcc9d5490c53923eb1abbde361cd46732c4aeb4
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check for t=
uning save/restore

This commit removes the mmc_card_wake_sdio_irq() check from the suspend and
resume paths, as tuning values should be preserved when the card keeps power
regardless of the SDIO IRQ wake flag.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2064,8 +2064,7 @@ static int sdhci_esdhc_suspend(struct device *dev)
>  	 * to save the tuning delay value just in case the usdhc
>  	 * lost power during system PM.
>  	 */
> -	if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc)=
 &&
> -	    esdhc_is_usdhc(imx_data))
> +	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
>  		sdhc_esdhc_tuning_save(host);

[Severity: High]
This is a pre-existing issue, but does the earlier call to
pm_runtime_get_sync() in sdhci_esdhc_suspend() need its return value checke=
d?

If pm_runtime_get_sync() fails, for example due to a clock enable failure, =
it
returns a negative error code but leaves the device unclocked. When the code
reaches this point and calls sdhc_esdhc_tuning_save(), it will blindly acce=
ss
hardware registers. On i.MX platforms, accessing an unclocked peripheral
triggers an asynchronous external abort, resulting in a kernel panic.

Additionally, returning early further down in sdhci_esdhc_suspend() if
pinctrl_pm_select_sleep_state() fails:

	ret =3D pinctrl_pm_select_sleep_state(dev);
	if (ret)
		return ret;

bypasses decrementing the usage counter, leaking the runtime PM reference. =
It
also leaves the host IRQ permanently disabled because it skips
pm_runtime_force_suspend() and the PM core aborts system suspend, bypassing
the resume callback.

Also, later in this function:

	ret =3D mmc_gpio_set_cd_wake(host->mmc, true);
	pm_runtime_force_suspend(dev);
	return ret;

If mmc_gpio_set_cd_wake() fails, returning an error here after calling
pm_runtime_force_suspend() seems to break the PM core's state tracking,
confusing the PM core into skipping the resume callback while the device is
fully suspended.

> =20
>  	if (device_may_wakeup(dev)) {

[ ... ]

> @@ -2124,8 +2123,7 @@ static int sdhci_esdhc_resume(struct device *dev)
>  	 * restore the saved tuning delay value for the device which keep
>  	 * power during system PM.
>  	 */
> -	if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc)=
 &&
> -	    esdhc_is_usdhc(imx_data))
> +	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
>  		sdhc_esdhc_tuning_restore(host);

[Severity: High]
This is a pre-existing issue, but similar to the suspend path, should we
check the return value of pm_runtime_force_resume() called earlier in
sdhci_esdhc_resume()?

If pm_runtime_force_resume() fails, the subsequent calls to
sdhci_esdhc_imx_hwinit() and sdhc_esdhc_tuning_restore() here will blindly
access hardware registers on an unclocked device, which can trigger a kernel
panic.

Also, earlier in this function:

	ret =3D pinctrl_pm_select_default_state(dev);
	if (ret)
		return ret;

and later:

	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);
	if (ret)
		return ret;

Returning early on these failures skips enable_irq() and
pm_runtime_put_autosuspend(), which leaves the IRQ permanently disabled and
leaks the PM usage counter.

> =20
>  	pm_runtime_put_autosuspend(dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623073515.2658=
205-1-ziniu.wang_1@oss.nxp.com?part=3D1
