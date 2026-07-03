Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137F531F989
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 11:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077155; cv=none; b=t88s+VIbs1x+Ja56EbzNJAGSkAuJX5HG54i36B8TjmnN3gln+TYYGDSUqQkY/xI0lgyqilCRdjoYB00zvjiWSawva/28KYd3qQANyam59PxW3Wa599Vcz5tgVsAg5bfRJBwNYAnO4Tn+jvJlHzxQ7J/X2sK9XkaHcNoyF1ILXJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077155; c=relaxed/simple;
	bh=5AyxhlaUeX6Udb2U4StdDK2YWldMvY9rhexZ/BN4vFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W5DZR9NtRClolkkkfpI6efaDtOTTuxp19U4fH/pnKhInLutlJn4whK0VUUJnVRuBrsf/0tqE5zOvx40I6pdJxEEcZ6aphj8czd+p+I9vm94g4C7aFLnj3hJAc4OJGJ7VDvj7IChN71G3Vmj3zXqFmkN4sV87CABa1IdKcFvCK8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiwDd8Px; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiwDd8Px"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845A31F000E9;
	Fri,  3 Jul 2026 11:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783077153;
	bh=qiIVHJIyjdrlqTG3FQTde4s7annBpqDKorUEyzY+PG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UiwDd8PxDRoJq1ZiwqsnkYs9KTaNJs3/RGtHUM0fNLp9EFG8mqltUZBdP94fazUOO
	 fAMd2kcbaXZWvI4w2qPxvaxyj21d/B+Cajuvz3aq+Yf4jPWZYBnllqGZvKpU80Pr4X
	 rMQQ19OTkyjwMwbNuHYSb0kA2uzb9okeoWWWj70oFCnQxGPuH9JCRKctFM5QklNJbw
	 QJT/5Q60u2JbO/EmclSIfv4+pqDtag49hGzPuY9pGtJDvB/o7J61vDMk4Xt4SjVJDq
	 mtrSx3fY1kGCdCxNz5YSl11Px0yHPuZ8CK8Pj1sYDjvh8Mbb6MmA2PavcZiKIVJLTN
	 Ky+l2zdnJ8mWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] mmc: sdhci-esdhc-imx: restore pinctrl before
 restoring ios timing on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260703104208.3426374-4-ziniu.wang_1@oss.nxp.com>
References: <20260703104208.3426374-1-ziniu.wang_1@oss.nxp.com>
 <20260703104208.3426374-4-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 11:12:32 +0000
Message-Id: <20260703111233.845A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The patch introduces unconditional kernel log spam ('Failed to r=
estore pinctrl state') on every system resume for devices lacking high-spee=
d pinctrl states.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but devices with a '=
sleep' pinctrl state but lacking high-speed states ('100mhz'/'200mhz') fail=
 to exit sleep state on resume.
--

commit 831a40635a59ef0e713e681b7fa2933e80e52391
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on resume

SDIO devices such as WiFi may keep power during suspend, so the MMC
core skips full card re-initialization on resume and directly restores
the host controller's ios timing to match the card. For DDR mode,
pm_runtime_force_resume() sets DDR_EN before the pin configuration is
restored from sleep state.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 7230d70e02ae1..3b1e63425a193 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2113,6 +2113,12 @@ static int sdhci_esdhc_resume(struct device *dev)
>  	struct pltfm_imx_data *imx_data =3D sdhci_pltfm_priv(pltfm_host);
>  	int ret;
> =20
> +	if (!device_may_wakeup(dev)) {
> +		ret =3D esdhc_change_pinstate(host, host->timing);
> +		if (ret)
> +			dev_warn(dev, "Failed to restore pinctrl state\n");

[Severity: Medium]
Does this new dev_warn() cause log spam on every system resume for devices
without high-speed pinctrl states?

If a board doesn't define the optional pins_100mhz or pins_200mhz states,
esdhc_change_pinstate() returns -EINVAL:

drivers/mmc/host/sdhci-esdhc-imx.c:esdhc_change_pinstate() {
	...
	if (IS_ERR(imx_data->pinctrl) ||
		IS_ERR(imx_data->pins_100mhz) ||
		IS_ERR(imx_data->pins_200mhz))
		return -EINVAL;
	...
}

This means standard SD setups without UHS pins will unconditionally see this
warning on every system resume.

[Severity: High]
This is a pre-existing issue, but does this early return in
esdhc_change_pinstate() prevent restoring the default pin state when high-s=
peed
pins are not defined?

If esdhc_change_pinstate() returns early with -EINVAL, the default pin state
is never restored for legacy timings:

drivers/mmc/host/sdhci-esdhc-imx.c:esdhc_change_pinstate() {
	...
	switch (uhs) {
	...
	default:
		/* back to default state for other legacy timing */
		return pinctrl_select_default_state(mmc_dev(host->mmc));
	}
	...
}

For devices with a sleep pinctrl state but lacking high-speed states,
they would fail to exit the sleep state on resume, leaving the pins in a
low-power configuration and potentially making the device unusable.

> +	}
> +
>  	pm_runtime_force_resume(dev);
> =20
>  	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703104208.3426=
374-1-ziniu.wang_1@oss.nxp.com?part=3D3
