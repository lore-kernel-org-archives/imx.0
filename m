Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF042903F
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 21:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988504; cv=none; b=TpaVN14Rb68v30/5QxoZqyJsxL0iemGOQ+wbtFoHoTolgiscHBuX7DKzqhS8lWEprkNHODGp4XbPAdPNncy6PfzbmcBfRxdGy8HTNN6NdEuTEYJTg0v5s45O4uSO63BTHra/1jA5NXTs1mdlm+4pKhvOnMrecuUM5i8RSnJ90D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988504; c=relaxed/simple;
	bh=0wGRCgoIoY87TbQ5KvJwulROMIkPxeYwt0319qKBgVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dX+Kfrax2/EK1w67eb+b3kM7ggEaHQNAIBALM5RpZA6q2b1DpV2RageJIxpVag1jkMSn/B0W+4PL5Bss4jQDrNThxYaTgpicaCU3dGrrmzO60HcoRM3kpirR3Z+XBGlDoh1h2RIZo8/6Ry1KUb8W+1FjuVDdRYOG+v+8r1eFsW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPzmB6R7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPzmB6R7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAF21F00893;
	Wed,  9 Sep 2026 21:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788988496;
	bh=ASjALnlFNmENHxUj62/PYXs6J8TCqZKdXDOELEbvsVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PPzmB6R7vU+GSI33AKU2fGqrqc4urs87QFJZZMAlOew6nhddTW2xKIeL1Ifko0AcN
	 QU6LijlA6I8QJ0oufCrv+b49nN4qgY3RL1o3Ug/ZKBlAw83BblVR9d99fTaCuz+VAL
	 uabK9gUVWdNktW6H8+c/l7f+X0RVCr6hzMoME2RXh6DIeSk5BieQRwU+vMTen6nBWK
	 a3B2Ob1CLGcWNJc6uH2CXF90o21PeOdaborQ974mWqyN2sAHM+LB/Cv86uu+7QK772
	 PyxVCGUvWDnuyE9P2nUcvcjeimQAp3TMEHmVaFpln7QBxI7qGIfShpfvSBRY+EVFzy
	 6k5RERuzeHHIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/mxsfb: lcdif: Fix use-after-free on unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org
In-Reply-To: <20260909210213.946159-1-festevam@gmail.com>
References: <20260909210213.946159-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 21:14:55 +0000
Message-Id: <20260909211456.0DAF21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unmapped MMIO Access (Hot-unplug protection)
- [High] Missing Error Handling for pm_runtime_get_sync
--

commit 66de576415540b0c76cf173d95116edc4c840ef4
Author: Fabio Estevam <festevam@gmail.com>

drm/mxsfb: lcdif: Fix use-after-free on unbind
   =20
This patch fixes a use-after-free issue during LCDIF unbind by allocating
the DRM private data and encoders using drmm APIs instead of devres. This
ensures the DRM objects remain alive until mode config cleanup completes.

> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index e2173c4d6fc28..7e9f3b205a458 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c

[ ... ]

While reviewing this patch, I noticed a couple of related pre-existing issu=
es
in drivers/gpu/drm/mxsfb/lcdif_kms.c:

> drivers/gpu/drm/mxsfb/lcdif_kms.c:lcdif_crtc_atomic_enable() {
> 	...
> 	clk_set_rate(lcdif->clk, m->clock * 1000);
>=20
> 	pm_runtime_get_sync(drm->dev);
>=20
> 	lcdif_crtc_mode_set_nofb(new_cstate, new_pstate);
> 	...
> }

[Severity: High]
This is a pre-existing issue, but the return value of pm_runtime_get_sync()
is ignored here.

If this call fails (due to a hardware fault or intermediate PM state), the
driver unconditionally proceeds to execute lcdif_crtc_mode_set_nofb(), which
writes to hardware registers. Can this lead to a kernel panic (Synchronous
External Abort) by accessing unpowered hardware registers?


> drivers/gpu/drm/mxsfb/lcdif_kms.c:lcdif_plane_primary_atomic_update() {
> 	...
> 	paddr =3D drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
> 	if (paddr) {
> 		writel(lower_32_bits(paddr),
> 		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
> 		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
> 		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
> 	}
> }

[Severity: High]
This is a pre-existing issue, but could this access the lcdif->base MMIO
region after it has been unmapped by devres?

If a privileged user unbinds the driver via sysfs but a userspace process
keeps the DRM device open, drm_dev_unregister() is called but
drm_dev_unplug() is not. Because drm_dev_is_unplugged() would return false,
an ioctl like DRM_IOCTL_MODE_ATOMIC could still execute and trigger
lcdif_plane_primary_atomic_update(). Would this result in a synchronous
abort/kernel panic when accessing the unmapped memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909210213.9461=
59-1-festevam@gmail.com?part=3D1
