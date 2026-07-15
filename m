Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB22388E4E
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100589; cv=none; b=dULiOSxQW/ALVIfR24qFf1OjWHQaD+7wY/aqoYN43ZBwkhsYnkF9HDbBWHPbcbfd4HyUi/2NbCrSmCWn7DERtT7ot5oubUuGtnKdNIwQ2Jj0qUiJyUEOhq46QruHQDKoh09NefBcnDEwIuoYdEL6dq0djsTx3oi/V89YrfvoGCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100589; c=relaxed/simple;
	bh=1Cjy7h9NI5wKKdxUXpfBBunoKbteu3mma70xOEYWk8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H/aqQi2sWC4qLKabpFFuKc6UnpMhN0dsZ49ZdDboUGJj1E81ChozCekXiWbE8WeiBg4LCyBjh0SJ5uxLa+5ocyi2go07/GTVXMHG7qE7dcN/pggrRU2Qq5s/h/pG7jUU53euMH3EzkHqGqhKNiwOgM66nxGgRHUU4EPCIyiKk/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlFGYzPM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlFGYzPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFA51F000E9;
	Wed, 15 Jul 2026 07:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784100587;
	bh=peqx7RUp3PVaHOuklDNRT/QimqGSHBzm6JgpV/jDUJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jlFGYzPM9jpCZ09jaKhjYCwmwdkU5Uu6YlG6hsaKQczjdI78qWKN+Xh25XwfWL7jE
	 m3+63O5BjqjYtVboUtsecymE0CVx1jbZKVtPYtXVYVEMQ3hAjNOsGz/yyxJf8Zo9s8
	 zOqZ16pFnLJbUHwlZe1InC/5OmUzW0sjBNbN0Sboe9xOYjoG/kgBm1okKZX5a0DYyw
	 A14WX/fTCH9hx5lIXpBFK0v1n4zFfxXS4NYmmtogIILfZLnYNUjr+BDSzcK0biuoTb
	 G6qQaxzDLLCS643c6aI3imabmpWXQ32WTl7lRCyfqAUdWAVt6ijvyAiTjYD3r5qMeW
	 3G79n+yqHvJWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/8] mmc: sdhci-esdhc-imx: remove unnecessary
 mmc_card_wake_sdio_irq check for tuning save/restore
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260715071818.272318-2-ziniu.wang_1@oss.nxp.com>
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
 <20260715071818.272318-2-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:29:47 +0000
Message-Id: <20260715072947.ABFA51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced `disable_irq()` and `enable_irq()` during suspend/resum=
e for devices with out-of-band wakeup, causing the SDHCI IRQ to remain perm=
anently disabled after system resume.
- [High] The system suspend callback `sdhci_esdhc_suspend()` ignores the re=
turn value of `pm_runtime_force_suspend()`, leading to an unbalanced `pm_ru=
ntime_enable()` and PM state machine corruption on failure.
- [High] The runtime resume callback `sdhci_esdhc_runtime_resume()` leaks h=
ardware clocks and PM QoS requests if `cqhci_resume()` fails.
--

--- Patch [1]: [PATCH v7 1/8] mmc: sdhci-esdhc-imx: remove unnecessary mmc_=
card_wake_sdio_irq check for tuning save/restore ---
commit e08eb8101cb72edc4b3a76b418077811fe74beba
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check for t=
uning save/restore

This commit removes the mmc_card_wake_sdio_irq() check from the tuning
delay save and restore paths during system PM. The check is removed
because tuning values need to be preserved based on whether the card keeps
power, regardless of if it sets the SDIO IRQ wake flag.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index d0fa83f67a806..6e06b3eeacce9 100644
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
> =20
>  	if (device_may_wakeup(dev)) {

[Severity: High]
This isn't a bug introduced by this patch, but can the host IRQ remain
permanently disabled after a system resume for devices with out-of-band wak=
eup?

In sdhci_esdhc_suspend(), the irq is unconditionally disabled and wakeups a=
re
enabled if the device may wake up:

    disable_irq(host->irq);
    if (device_may_wakeup(dev)) {
        if (!sdhci_enable_irq_wakeups(host))
            ...

For SDIO devices using out-of-band GPIO wakeup, mmc_card_wake_sdio_irq()
evaluates to false. This causes sdhci_enable_irq_wakeups() to return false
immediately without setting host->irq_wake_enabled =3D true.

If enable_irq() in sdhci_esdhc_resume() is explicitly gated behind=20
host->irq_wake_enabled, does this leave the IRQ permanently disabled after
the first suspend/resume cycle, requiring a system reboot or unbinding to
recover?


[Severity: High]
This is a pre-existing issue, but does sdhci_esdhc_suspend() ignore the ret=
urn
value of pm_runtime_force_suspend()?

If pm_runtime_force_suspend() fails, it handles cleanup by calling
pm_runtime_enable(dev) and returns an error code. Since sdhci_esdhc_suspend=
()
ignores this return value, the PM core considers the device successfully
suspended.

Upon system resume, sdhci_esdhc_resume() calls pm_runtime_force_resume(dev).
Since the device failed to suspend and never set needs_force_resume, this s=
kips
the active resume step and executes its out path, which unconditionally cal=
ls
pm_runtime_enable(dev).=20

Does this second pm_runtime_enable() drive dev->power.disable_depth below 0,
triggering an unbalanced pm_runtime_enable kernel warning and corrupting the
runtime PM state machine?

> @@ -2124,8 +2123,7 @@ static int sdhci_esdhc_resume(struct device *dev)
>  	 * restore the saved tuning delay value for the device which keep
>  	 * power during system PM.
>  	 */
> -	if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc)=
 &&
> -	    esdhc_is_usdhc(imx_data))
> +	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
>  		sdhc_esdhc_tuning_restore(host);
> =20
>  	pm_runtime_put_autosuspend(dev);

[Severity: High]
This isn't a bug introduced by this patch, but does sdhci_esdhc_runtime_res=
ume()
leak hardware clocks and PM QoS requests if cqhci_resume() fails?

If the device supports Command Queuing Engine (CQE), the function calls
cqhci_resume():

    if (host->mmc->caps2 & MMC_CAP2_CQE)
        err =3D cqhci_resume(host->mmc);

    return err;

If cqhci_resume() returns an error, the function returns directly instead of
jumping to the disable_per_clk labels to call clk_disable_unprepare() for t=
he
three clocks and cpu_latency_qos_remove_request().=20

Does this leave the hardware resources permanently active while the PM core
treats the device as runtime suspended or in an error state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715071818.2723=
18-1-ziniu.wang_1@oss.nxp.com?part=3D1
