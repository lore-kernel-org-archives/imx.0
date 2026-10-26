Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013481;
	b=re7w+uy/uQBVjTc/JcE4WY6sP9HTjicv74YOA6t5VervELhuPVO47luyTr/e3KXq8yeT
	 OYgE0tzi2psxVwF8ke3r8aO97ZB6Pom79Dz0IoNpVJtRnzU8g53x74zCZ8Fmk/zaCn9sX
	 mjLRs/5TlheXLb1nDfKQ09J/mheJm3N+gEi5dSq+uMZH/QMOWk/BoIEcMClbzfqfcPYol
	 W78WEj9TvKSaLNaIRaQH4sMxGr7Jb2q23QMphjJsWC5yceMKKgJ0JDe38z/SoL3o0IpOl
	 MQXLgHCHismrP8OfUStxXLGoIbDYKBxv3n2m3GyD5uGwvKx/IEU8LL2CMNG5kShkjJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013481;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QYVVxZQfC5PB5hY9QNbYUcMiSX3OZTYMZGz+Pb9nJhE=;
	b=Y2UEiwnhwX7y4MASDwj7ogePTZ9UZZBnemra1+/woCZz0v7yZt2YEtqT3+o1worEYI0A
	 stx4F2cmFJH8V7O2JbGZwjgoxAVdUqi1dhidCNfPVx9tb1ZNFvBmJdRRCWN87COheL/3E
	 WlpJ/6TaQECRtBUeyc1ZxoOpfyxIuGhkdvssCrChCl641SZxHApiiIEHhfA6EwwRmVUma
	 sPmTcfV+TbT2kW+vc6olbaK0VRc5Hv+lkhR5YI7iuqosV/dVD+G2N909efmPwv8Dagt52
	 XlusQfmbNdDqD1rT6ncnjWdz/iouDJqTuZIBOv64d/DTxsm6INnSP6pemFnyZFMG6PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oZr/hfmd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A607606A33B;
	Mon, 26 Oct 2026 11:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oZr/hfmd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30121F01825;
	Mon, 26 Oct 2026 11:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793013481;
	bh=QYVVxZQfC5PB5hY9QNbYUcMiSX3OZTYMZGz+Pb9nJhE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oZr/hfmdksIBQNvxqWVWo90fr3Ck6HXZr5L1RhR1Y/eXr3Bs/jSmcFivSiOsb4lcN
	 xKAZgXnB63EVDstzctOd4NTBJ6DIAdNFUChsp7cotr4EDGnhT4xv6IoUmELj82f56z
	 YAhxqGnWSfXoywmxHz83UPx5ZZhpwPDoQKRLf7bl9TDWuB6IBjRJQRKt9+FECCNths
	 PwXlbbl6Ifu+WiVeLbLl1U5KImpNI8u/zgcxezpOR265ULP2U9TwGzRlniI864fFhX
	 Jj+cQkpWedxuYuQCAq/tit5Dm8qxeqOdjgiGv/xmqqysE/bUEsMSuOzl8nRWnJe6GD
	 l6rZ+USFII4Rg==
Message-ID: <sashiko-outbox-185083@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/15] drm/imx: dc-crtc: Disable at boot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261026-imx8-dc-prefetch-v7-6-a0b50cc4fc65@nxp.com>
References: <20261026-imx8-dc-prefetch-v7-0-a0b50cc4fc65@nxp.com>
 <20261026-imx8-dc-prefetch-v7-6-a0b50cc4fc65@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 11:18:00 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/imx: dc-crtc: missing dc_drv_set_crtc_disable() in dc_crtc_d=
isable_at_boot()
--

commit f302747895df5188605a9ca1ea0bd65af3b6d652
Author: Liu Ying <victor.liu@nxp.com>

drm/imx: dc-crtc: Disable at boot

This commit adds a helper dc_crtc_disable_at_boot() and calls it during
dc_drm_bind() before drm_dev_register() to disable any running display
controller pipes and balance clock enable counts after an unplug and rebind
cycle.

> diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc=
-crtc.c
> index 0d64186a99018..c7dbe5f500b4a 100644
> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
> @@ -287,12 +288,24 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct=
 drm_atomic_commit *state)

[ ... ]

> @@ -318,8 +327,9 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct =
drm_atomic_commit *state)
>  	/* request display engine power-off when CRTC is disabled */
>  	pm_runtime_put(dc_crtc->de->dev);
> =20
> -	drm_dev_exit(idx);
> +	dc_drv_set_crtc_disable(dc_drm, drm_crtc_index(crtc));
> =20
> +	drm_dev_exit(idx);
>  out:
>  	drm_crtc_vblank_off(crtc);
> =20
> @@ -331,6 +341,43 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct=
 drm_atomic_commit *state)
>  	spin_unlock_irq(&crtc->dev->event_lock);
>  }
> =20
> +void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
> +{
> +	struct dc_drm_device *dc_drm =3D to_dc_drm_device(crtc->dev);
> +	struct dc_crtc *dc_crtc =3D to_dc_crtc(crtc);
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dc_crtc->de->dev);
> +	if (ret < 0) {
> +		dc_crtc_err(crtc, "failed to get DC display engine RPM: %d\n",
> +			    ret);
> +		return;
> +	}
> +
> +	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
> +		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
> +		goto out;
> +	}
> +
> +	dc_crtc_dbg(crtc, "disabling FrameGen at boot\n");
> +	__dc_crtc_disable_fg(crtc);
> +
> +	if (!dc_drv_crtc_was_enabled(dc_drm, drm_crtc_index(crtc)))
> +		goto out;
> +
> +	dc_crtc_dbg(crtc, "disabling clocks at boot\n");
> +
> +	dc_fg_disable_clock(dc_crtc->fg);
> +
> +	if (!dc_drm->pe_clk_axi_disabled) {
> +		clk_disable_unprepare(dc_drm->pe->clk_axi);
> +		dc_drm->pe_clk_axi_disabled =3D true;
> +	}

[Severity: Medium]
Should dc_crtc_disable_at_boot() also call dc_drv_set_crtc_disable() after
disabling the clocks here?

When a pipe is enabled via dc_crtc_atomic_enable(), dc_drv_set_crtc_enable()
sets the corresponding bit in priv->gp_regmap:

drivers/gpu/drm/imx/dc/dc-drv.c:dc_drv_set_crtc_enable() {
	...
	regmap_set_bits(priv->gp_regmap, 0, CRTC_ENABLED(crtc_index));
}

If the device is then unplugged via dc_drm_unbind() -> drm_dev_unplug(),
dc_crtc_atomic_disable() returns early at drm_dev_enter() without calling
dc_drv_set_crtc_disable().

On the next bind in dc_drm_bind() -> dc_crtc_disable_at_boot(), the helper
stops the frame generator, sees dc_drv_crtc_was_enabled() return true, and
disables dc_crtc->fg->clk_disp and dc_drm->pe->clk_axi, dropping their clock
enable and prepare counts back to zero. However, because it does not call
dc_drv_set_crtc_disable(dc_drm, drm_crtc_index(crtc)), the enable bit in
priv->gp_regmap remains set.

If dc_crtc_disable_at_boot() runs again while the frame generator is active
without an intervening atomic enable and disable cycle (for instance, across
a warm reboot where the general-purpose register stays set and the
bootloader enables the display, or if __dc_crtc_disable_fg() times out and
bind is retried), wouldn't dc_drv_crtc_was_enabled() still see the stale bit
and call dc_fg_disable_clock() and clk_disable_unprepare() on clocks that
are already disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-imx8-dc-pr=
efetch-v7-0-a0b50cc4fc65@nxp.com?part=3D6
