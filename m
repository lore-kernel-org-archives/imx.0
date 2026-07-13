Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF152233945
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 04:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783918256; cv=none; b=jD+KdqLlmdUaVFLPJdsj54NlfXnv6mmc9EOFyBR30c5OQgkktV6KSL8Z/iw4MDUhS5UoRufXVGyNAJgBAyshU+Qpw4JIBLhRNtA/voW4rtfaFweblotFo8dfDCIIoYeamY3ECgEiar5HhQGT3Ovxmcu0xUw/uP4IdL/abRp+6LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783918256; c=relaxed/simple;
	bh=7tnRE3fPDIqdjW2FnP9YnvSOVZQJIGLm4ptWXR/ApUY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aHNPxsSqJGoFRI70CcyL+BX8ucQcjVKaMw3m+3YNWZD+DjzRNwe5xaWXKk3x/GC9WFWd8595zDbTG+pSb+bHiBzGudn2VBbyMSfxUr8YeaccbqsaMG6F+4ZbYOYvIOcmMMrAG84Ury/0WcFV7+Rlkx7Tiiz/j4w34bDqbIVpIUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyO2KG9J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyO2KG9J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166F31F000E9;
	Mon, 13 Jul 2026 04:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783918255;
	bh=FRsjLL9shUdj62e6T7LBxP5vGtPUPXIVtIjsEycCV/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LyO2KG9JprWvNOKD338bi8l6aaXmWDZV/ttL+F7veTbjIT3sCj4v2EgQi7BxVGh1m
	 HQYtVkQngL0aM15eVTBW/gK8c54pRAlg/pcdTYgvE/0uN7D0FnB25IpWra5i8G/6ir
	 dPY0VrMBrvzZ0Z0FwkuK50yvzVpuvrjeVyWzjXE7/HMG6bM67Q/ehOIfDuhkb/Ziis
	 1GERKKohcGc89cTVJdIqs12VXSjfl4Dl4f4ImzSKSFu34mqBAO2enqSTGoydnbRGzb
	 13FBelRjvfTe1XMHllfs2Ga0/jFAK80y8geFNZdhx3QEFiaYXmrEBsj8Au5KT3RhA7
	 IhNdHwV4W3zAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 8/8] mmc: sdhci-esdhc-imx: fix resume error handling
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260713043904.4144172-9-ziniu.wang_1@oss.nxp.com>
References: <20260713043904.4144172-1-ziniu.wang_1@oss.nxp.com>
 <20260713043904.4144172-9-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 04:50:54 +0000
Message-Id: <20260713045055.166F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Returning early on resume failure leaks the PM usage counter and d=
esyncs the IRQ depth, causing a permanent device lockup.

Pre-existing issues:
- [High] Missing synchronize_irq() in runtime suspend causes a race conditi=
on with the threaded IRQ handler, leading to a kernel panic.
--

--- Patch [8]: [PATCH v6 8/8] mmc: sdhci-esdhc-imx: fix resume error handli=
ng ---
commit 656597a370f7029432d32936bfe95d2095dee2e6
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: fix resume error handling

This commit adds a return value check for pm_runtime_force_resume() in the
resume path. It returns immediately on failure to prevent accessing hardware
registers on an unclocked device, while skipping enable_irq() and IRQ wakeup
teardown.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2126,12 +2126,12 @@ static int sdhci_esdhc_resume(struct device *dev)
[ ... ]
> -	pm_runtime_force_resume(dev);
> -
> -	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;

[Severity: High]
Will returning early here leak the PM usage counter and leave the IRQ
permanently disabled?

sdhci_esdhc_suspend() increments the PM usage counter via
pm_runtime_resume_and_get() and the IRQ disable depth via disable_irq().

If pm_runtime_force_resume() fails and we return early, we skip the calls
to enable_irq() and pm_runtime_put_autosuspend() at the end of the function.

On subsequent suspend/resume cycles, disable_irq() and
pm_runtime_resume_and_get() would be called again, stacking the counters.
Even if the hardware failure is transient, a subsequent successful resume
would only decrement the counters once, potentially leaving the device IRQ
disabled until reboot.

Is there a way to balance the suspend operations even when resume fails?

[ ... ]
> @@ -2158,7 +2158,7 @@ static int sdhci_esdhc_resume(struct device *dev)
> =20
>  	pm_runtime_put_autosuspend(dev);
> =20
> -	return ret;
> +	return 0;
>  }
> =20
>  static int sdhci_esdhc_runtime_suspend(struct device *dev)
>  {
[ ... ]
>  	sdhci_runtime_suspend_host(host);
> =20
>  	if (host->tuning_mode !=3D SDHCI_TUNING_MODE_3)
>  		mmc_retune_needed(host->mmc);
> =20
>  	imx_data->actual_clock =3D host->mmc->actual_clock;
>  	esdhc_pltfm_set_clock(host, 0);
>  	clk_disable_unprepare(imx_data->clk_per);

[Severity: High]
This is a pre-existing issue, but does this runtime suspend path need to
wait for threaded IRQ handlers to finish before disabling hardware clocks?

The core requests the interrupt with IRQF_SHARED and a threaded handler
(sdhci_thread_irq). sdhci_runtime_suspend_host() masks interrupts at the
controller and calls synchronize_hardirq(), but it does not wait for the
threaded handler to complete.

If a card event triggers the threaded handler just before suspend, it
can run concurrently and read hardware registers (for example via
sdhci_card_event() calling sdhci_get_cd()).=20

Because the clocks are disabled shortly after, a concurrent register read
by the threaded handler could cause a kernel panic.

Should synchronize_irq() be called here before powering down the clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713043904.4144=
172-1-ziniu.wang_1@oss.nxp.com?part=3D8
