Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DB4246BC0
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934150; cv=none; b=I/C5/K+oPli96NJdAezJOYExMK7BlKHXcArUeysiT4NrD9zUZHGuDka1uJ9/IXjDAuiZ/6wQeVD1OzJHNjKDgZ770RP7EWwuU7R+JMAKeI3NuunOmEQngdCobMkSpnEtyb5TSxCIpX7ROXTHcEy9ldgWwfHZEvuF3P8EOTbWTaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934150; c=relaxed/simple;
	bh=mEuvEwmgUNOU0UOfd7k/35s7HVowQDXGhL1BxZXuw6g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aRHLRm1CEqMRtzx3w5ouUsBhSZL3pP3eCltHElU18XfEdI7039KfGHVNH73VnEdV5wDlfctjtdzidYu8MfVH522jxKPjTDBMGmLYXh41GYs4505ORLiKMxZYHNe7zpl2BQ0iOK3CEj9osukePcmUoH99UISijRSGbjEZ03Ve8ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lh4+DOMD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lh4+DOMD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A13A1F00893;
	Mon,  8 Jun 2026 15:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780934148;
	bh=q5AcAgusixY92tU6UrTFZ1miHb8rm4PUxkoUxPOPvLU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lh4+DOMD2r7ZJ/Pc0/Ew32zmwUW55Pgs4cwQvtPQm8vXTuVFKXAr8rxaZPgU/msZl
	 SkmdyiLNkxB62VQuoENdUq6dW3l2mpf8NFZTwaDg7ZTMR9SFEPG26JFMa1kCHZaRCN
	 KHQ6ExhASJOZZjCHuZfYO9hUG4rxAHofZpBh9XDmJSbqEbnplXXAM7c+FXN41Q6K67
	 5+d9aIQX110C+g7OC8xldJE6fJ4F0v3UQe8xl1t7luUG8O4eZ0q9Flt47QjNI4rmmG
	 BKFmSwvOq53EKlG1RBbxlpxtt+7ppbUQ8FBJKT/uukyKKUPaqD4xp097Qs36A0S6Jm
	 ema9migLfnP5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 17/78] drm/bridge: imx8qxp-pixel-combiner: Switch to
 atomic_create_state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-17-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-17-0a91018bf886@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 15:55:47 +0000
Message-Id: <20260608155548.9A13A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Data race on shared register `PC_CTRL_REG` during concurrent `mode=
_set` calls can cause hardware state corruption.
- [High] Incomplete cleanup in the probe error path leads to Use-After-Free=
 of devm-allocated DRM bridge.
- [High] Unconditional hardware register access and unbalanced clock disabl=
e in `imx8qxp_pc_runtime_suspend()` when the clock fails to enable.
- [High] Unconditional hardware register accesses and unbalanced clock disa=
ble in `imx8qxp_pc_bridge_mode_set()` if power management or clock enableme=
nt fails.
--

commit 10038747477552d55e11391e7ea8feb1269ccfa4
Author: Maxime Ripard <mripard@kernel.org>

drm/bridge: imx8qxp-pixel-combiner: Switch to atomic_create_state
   =20
The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated. Switch to the
atomic_create_state callback and its counterpart.

> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/driver=
s/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> index e0ee51a9ca7f8..941ce2f91e9e5 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> @@ -251,7 +251,7 @@ imx8qxp_pc_bridge_atomic_get_output_bus_fmts(struct d=
rm_bridge *bridge,
>  static const struct drm_bridge_funcs imx8qxp_pc_bridge_funcs =3D {
>  	.atomic_duplicate_state	=3D drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state	=3D drm_atomic_helper_bridge_destroy_state,
> -	.atomic_reset		=3D drm_atomic_helper_bridge_reset,
> +	.atomic_create_state		=3D drm_atomic_helper_bridge_create_state,
>  	.mode_valid		=3D imx8qxp_pc_bridge_mode_valid,
>  	.attach			=3D imx8qxp_pc_bridge_attach,
>  	.mode_set		=3D imx8qxp_pc_bridge_mode_set,

[Severity: High]
This isn't a bug introduced by this patch, but looking at
imx8qxp_pc_bridge_mode_set(), the format configuration uses a software
read-modify-write (RMW) sequence on PC_CTRL_REG:

	val =3D imx8qxp_pc_read(pc, PC_CTRL_REG);
	if (ch->stream_id =3D=3D 0) {
		val &=3D ~PC_DISP0_PIX_DATA_FORMAT_MASK;
		val |=3D PC_DISP0_PIX_DATA_FORMAT(RGB);
	} else {
		val &=3D ~PC_DISP1_PIX_DATA_FORMAT_MASK;
		val |=3D PC_DISP1_PIX_DATA_FORMAT(RGB);
	}
	imx8qxp_pc_write(pc, PC_CTRL_REG, val);

Because the driver supports parallel, non-blocking atomic commits, this
function can run concurrently on multiple CPUs for different channels. Does
this concurrent unprotected RMW cause one of the channel's format
configurations to be overwritten, leading to incorrect display colors or
format?

[Severity: High]
This is a pre-existing issue, but also in imx8qxp_pc_bridge_mode_set(), the=
re
appears to be an unconditional hardware register access if power management=
 or
clock enablement fails:

	ret =3D clk_prepare_enable(pc->clk_apb);
	if (ret)
		DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
			      __func__,  ret);

	/* HSYNC to pixel link is active low. */
	imx8qxp_pc_write_clr(pc, PC_CTRL_REG,
			     PC_DISP_HSYNC_POLARITY(ch->stream_id));

If pm_runtime_get_sync() or clk_prepare_enable() fails, the function prints
an error but continues to execute hardware register writes. On this platfor=
m,
could accessing unclocked or unpowered registers cause an external abort and
kernel panic?

Furthermore, does it lead to a clock imbalance by calling
clk_disable_unprepare() at the end when the clock failed to enable?

[Severity: High]
This isn't a bug introduced by this patch, but looking at
imx8qxp_pc_runtime_suspend(), there is a similar pattern:

	ret =3D clk_prepare_enable(pc->clk_apb);
	if (ret)
		DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
			      __func__,  ret);

	/* Disable pixel combiner by full reset. */
	imx8qxp_pc_write_clr(pc, PC_SW_RESET_REG, PC_FULL_RESET_N);

If clk_prepare_enable() fails, the function proceeds to access PC_SW_RESET_=
REG.
Does this cause a bus lockup or asynchronous external abort due to accessing
registers when their clock domain is gated?

Also, does it unconditionally call clk_disable_unprepare() later, resulting
in a clock imbalance?

[Severity: High]
This is a pre-existing issue, but the imx8qxp_pc_bridge_probe() function
seems to have a fragile error path:

	free_child:
		of_node_put(child);

		if (i =3D=3D 1 && pc->ch[0] && pc->ch[0]->bridge.next_bridge)
			drm_bridge_remove(&pc->ch[0]->bridge);

It hardcodes the check to unregister only the first channel. If the second
channel lacks a valid reg property, of_property_read_u32() fails without
updating i, leaving i =3D=3D 0. Will the error path then skip unregistering=
 ch[0]?

Furthermore, if the first channel processed is reg =3D <1>, could an error =
on
the second channel (reg =3D <0>) fail to unregister ch[1]?

Because the bridge structures are allocated with devm_drm_bridge_alloc(),
they will be freed by devres on probe failure. Does this leave dangling
pointers in the DRM subsystem's global bridge list, causing a use-after-free
when the list is subsequently traversed?

>  	.atomic_disable		=3D imx8qxp_pc_bridge_atomic_disable,
>  	.atomic_get_input_bus_fmts =3D
>  				imx8qxp_pc_bridge_atomic_get_input_bus_fmts,
>  	.atomic_get_output_bus_fmts =3D
>  				imx8qxp_pc_bridge_atomic_get_output_bus_fmts,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-drm-no-mor=
e-bridge-reset-v2-0-0a91018bf886@kernel.org?part=3D17
