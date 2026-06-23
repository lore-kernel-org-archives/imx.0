Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5279C311C38
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 07:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200864; cv=none; b=uUtwMQDW9TSVZYBKeYUsgog7ofUPEGz7GFo3aaSZp2sNt+osIFSnRpfY1QkFxSK89LkazozUpNh8s9d5l2GckIK8/Rv+9/Cnm78T3f56Wt6UEX+m91r5VjlOlw85DLMBeJjbqdyxhL/MoRhs12bjLPposRkpvH5oqmuGEye37NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200864; c=relaxed/simple;
	bh=S6QYJ/I5uFCpbyOUcAsAQfuwlngh9FnNTqCBQaKsYaI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=doLBaV4aPHjOWLioba53XxRQrcMtmjIE0tpiORE6/mfsZgkj7HJk3/Y9bcyqcgEFER9FIzpmljKLEaHShXAde9S/7KDOEvTV8iuLebUcY/Z0KL9HmYg22HAa/ZIUzp/8VEIDN9u0/XqWUkn0tqkUm8hWrKx6aBt2iX7YO1Sw9/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsj1U13i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsj1U13i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E691F000E9;
	Tue, 23 Jun 2026 07:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782200863;
	bh=vggJVGt5nhQ0KzzAX4OpNIls9UcdFdpnG0FMzvTIZRA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bsj1U13ih0JiygdDremoftNdj3tvhrIYKmynavEISZYr7LiWA6zcmc+60eEf/wk3E
	 T6lfeJJ2amo3ynPVGDabvtLaMhVe/zFk446OwMJEJE29aNkjkou0qNyS5a77q/NEDV
	 1QYfpdjjJkhX4uSIiL1G6XnC+N2lYG4Fi/IqNJbg5vMzGGx7FffjePABtBeNf4vyeR
	 3lKtCuYWze2UiQ1hcZaKkqhDudjE+jVEZFJUrCGOf6IO22mYSurnFhuvtZib6Pnpwz
	 yp0NYvIbtBQZVBM/cVMISd83wmyWtd7f4HGKLiqLgfEzcABtmpN3YN8WSNfSBCZkRC
	 LZcFIsSVfLKhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] mmc: sdhci-esdhc-imx: restore pinctrl before
 restoring ios timing on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260623073515.2658205-4-ziniu.wang_1@oss.nxp.com>
References: <20260623073515.2658205-1-ziniu.wang_1@oss.nxp.com>
 <20260623073515.2658205-4-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 07:47:42 +0000
Message-Id: <20260623074742.C3E691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The newly added early return on `pinctrl_pm_select_default_state()=
` failure skips critical PM state restoration, IRQ re-enablement, and leaks=
 the runtime PM usage counter.
- [Medium] Unconditional transition to default pinctrl state on resume over=
rides the active pin state retained for wakeup-enabled SDIO devices.

Pre-existing issues:
- [High] Preexisting early returns in both the suspend and resume paths lea=
k the runtime PM usage counter and leave the device's IRQ permanently disab=
led.
--

commit 36afd1c0e24c2aa82ce799711cc1629a34958ef4
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on resume

SDIO devices such as WiFi may keep power during suspend, so the MMC core sk=
ips
full card re-initialization on resume. When DDR_EN is set during
pm_runtime_force_resume() without the default pinctrl state, the loopback
clock is invalid and causes read CRC errors. This patch restores the default
pinctrl state before pm_runtime_force_resume() to fix this issue.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index a944351dbcdff..a3688c94cf580 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2114,6 +2114,10 @@ static int sdhci_esdhc_resume(struct device *dev)
>  	struct pltfm_imx_data *imx_data =3D sdhci_pltfm_priv(pltfm_host);
>  	int ret;
> =20
> +	ret =3D pinctrl_pm_select_default_state(dev);

[Severity: Medium]
Does this unconditional transition to the default pinctrl state override the
active pin state retained for wakeup-enabled SDIO devices?

During suspend, if a device is a wakeup source, it intentionally avoids cha=
nging
the pinctrl state to sleep, retaining its active high-speed state.

If we unconditionally select the default state here, could it glitch the SD
bus pins for powered SDIO cards by forcing them out of the retained state
before switching back to high-speed later?

> +	if (ret)
> +		return ret;

[Severity: High]
If pinctrl_pm_select_default_state() fails and we return early, does this s=
kip
important PM state restoration?

It looks like returning here bypasses pm_runtime_force_resume(), enable_irq=
(),
and the final pm_runtime_put_autosuspend(). Could this permanently leave the
device with its hardware unresumed, its runtime PM usage count elevated, and
its interrupt disabled?

> +
>  	pm_runtime_force_resume(dev);
> =20
>  	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);
>  	if (ret)
>  		return ret;

[Severity: High]
This is a pre-existing issue, but does this early return leak the PM usage
counter and leave the IRQ disabled?

If mmc_gpio_set_cd_wake() fails, we return early without calling enable_irq=
()
or pm_runtime_put_autosuspend(), potentially rendering the device unusable.

There appears to be a similar pre-existing early return on pinctrl failure =
in
sdhci_esdhc_suspend() that skips balancing pm_runtime_get_sync() and
disable_irq().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623073515.2658=
205-1-ziniu.wang_1@oss.nxp.com?part=3D3
