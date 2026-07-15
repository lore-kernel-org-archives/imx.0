Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981F3389472
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101315; cv=none; b=NjnelnYM1x8ZerbCXoICcdcueYI8ao+yqarmvBlSAPcROmecgCB/yINzxv4Ui7ucWyxMu1oQORUL6Ucb8Z+dj0Y6qeS7Mk9GlnbnjaoY+3E2xeadIw1OkcBCp/6UIKodDEYgemUkSNvdZlY/eBx7Eg0QRY0wJXOYBkXeRLQB5Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101315; c=relaxed/simple;
	bh=jWU4Ozg6lhmJdUNf/TLyGPLJHk1ycyS/+VfiWwuqmyc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YrxaAfowXJI/+fDeiLib0/VWvs5UN9exaOLZcmYmLeO9CVdLHRdgE1zj/lY+sxPxtsFXQkPqma1jxbCBZL8GB7c6WDv+6lRLIezZUOqHPSABWU/OwSg2yme+5McIKMWMlnee/I3c2M2+nayf4SoJrDuK3CrnGVGoxkgGKQzEmUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYmEqnCe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYmEqnCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0C11F000E9;
	Wed, 15 Jul 2026 07:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784101314;
	bh=rcEjxUA/RX/Ze3gB68usx2HUpDgQlizqTBOJr2sbA7s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YYmEqnCeUUkRI+S+2wZJYAG9z7Y+LYF/03sfkXolAzx9hLKwZYZguDFwMdzKZCVX4
	 n5I1j0dNQlj624nqa71yovUWoEVUiGezyZauOmvzixOWWWNNrBliB5nZA2/W7bMWwj
	 7Pewdt54ScYjMy16SU4cxiy975itImN/cxVc9+NT5VWsp/FiEmvY3CTvLKVJERpZsY
	 Iq2vOQelTVj+jxLlYlukwWRxki2Qsrk7LavEDpDogo+XKCgtpYJOP5RoBffL+y2B+x
	 kAfyt4b0IMZyrVjatEcjqFD075lxsIioGBMLY7re089cFn0q/8JU8fNYr4VV/zrw1i
	 W7VM9V5ny7dKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 8/8] mmc: sdhci-esdhc-imx: fix resume error handling
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260715071818.272318-9-ziniu.wang_1@oss.nxp.com>
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
 <20260715071818.272318-9-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:41:53 +0000
Message-Id: <20260715074154.0E0C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Early return on clock enable failure leaks IRQ wake and disable =
depths for the host IRQ.
- [Medium] Unnecessary PM runtime usage counter leak on the error path.

Pre-existing issues:
- [Critical] The fix to prevent a kernel panic on unclocked register access=
es is incomplete, leaving the unclocked device exposed to child MMC accesse=
s.
- [High] Missing return value check for pm_runtime_get_sync() in sdhci_esdh=
c_imx_remove() leads to unclocked hardware register access and a kernel pan=
ic.
--

--- Patch [8]: [PATCH v7 8/8] mmc: sdhci-esdhc-imx: fix resume error handli=
ng ---
commit 2ddb161f38e3bf1f1836d2167b881e211d1fa57f
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: fix resume error handling

This commit adds a return value check for pm_runtime_force_resume() in
sdhci_esdhc_resume() to avoid unclocked hardware register access on failure.
It returns early if clock enablement fails, purposefully skipping IRQ
enablement. Additionally, it removes a redundant return check for
mmc_gpio_set_cd_wake() and explicitly returns 0 on success.

>     The early return intentionally skips enable_irq() and
>     sdhci_disable_irq_wakeups() because the IRQ handler reads
>     SDHCI_INT_STATUS, which would also fault without clocks. The PM runti=
me
>     usage counter leak only affects this already-broken device instance a=
nd
>     is an acceptable tradeoff to preserve system stability.

[Severity: Medium]
Could this usage counter leak be avoided entirely? Since the standard
kernel API pm_runtime_put_noidle() drops the usage counter without invoking
any idle callbacks or accessing hardware, would it be cleaner to use it
here instead of leaking the counter on the error path?

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 0824f598bf598..6ab59d3e346f9 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2123,12 +2123,12 @@ static int sdhci_esdhc_resume(struct device *dev)
>  			dev_warn(dev, "Failed to restore pinctrl state\n");
>  	}
> =20
> -	pm_runtime_force_resume(dev);
> -
> -	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);
> +	ret =3D pm_runtime_force_resume(dev);
>  	if (ret)
>  		return ret;

[Severity: Medium]
Does this early return bypass software-level cleanup of IRQ wake and
disable states? If pm_runtime_force_resume() fails, the function returns
early, bypassing enable_irq(host->irq) and sdhci_disable_irq_wakeups(host).

Because the PM core does not abort system resume on a device resume failure,
a subsequent system suspend will call the suspend callback again.
This unconditionally calls disable_irq() and sdhci_enable_irq_wakeups().

Can this cause the IRQ disable depth and wake depth to accumulate unbounded
on subsequent suspends?

[Severity: Critical]
This isn't a bug introduced by this patch, but does the early return leave
the unclocked device exposed to child MMC accesses?

Returning an error from a parent's system resume callback does not abort
the system resume process for children. The PM core continues and invokes
the resume callback for the child mmc_card device, which unconditionally
triggers sdhci_set_ios() on the host controller and accesses hardware
registers.

Because the SDHCI_DEVICE_DEAD flag is not set before returning early,
sdhci_set_ios() does not abort and accesses the unclocked hardware
registers, potentially triggering the same kernel panic this patch was
intended to fix. Would setting host->flags |=3D SDHCI_DEVICE_DEAD; before
returning prevent this?

[ ... ]

This isn't a bug introduced by this patch, but looking at
sdhci_esdhc_imx_remove() in the same file:

    pm_runtime_get_sync(&pdev->dev);
    dead =3D (readl(host->ioaddr + SDHCI_INT_STATUS) =3D=3D 0xffffffff);

[Severity: High]
Does this code ignore the return value of pm_runtime_get_sync()?

If resuming the device fails, the clocks remain disabled. The immediate
next instruction accesses SDHCI_INT_STATUS. Can this trigger a kernel panic
due to unclocked hardware access, similar to the one being fixed in the
resume path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715071818.2723=
18-1-ziniu.wang_1@oss.nxp.com?part=3D8
