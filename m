Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A803C3C16
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193305; cv=none; b=SgFltR8jzbYLJOGwR9eIEY5qThs5+mac94MuIlWwSOM/kMaDdABl/pnYxOVxfeUEkrE227PWOkVX4yOyhvHogyHT0O8RUbrNF1DrwF1qF63jAhBimd6LrT7zKst4CUM4KFVffpkyAFqnJI1SgydGS6UOsnbf57Qr0QfZ1tXG3Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193305; c=relaxed/simple;
	bh=QgAV174uLnRg8um6dG3FZsbpExkM6xz9MHLqIbmSvq0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=be867Yx7Xg0KvIUpHhuaXKutCujx3ziL/NdVGTlcdLGAoJ+xUwZxyAckrISBSbwOobgqOl6OdSqZwd40yw/Un9KEtNjLid5t2FVtK0q/8Fgus7HYrW9RfJqhopMcVYT1O1lo8rhpO4UJYgw2BW4sdPuX6Rgm25TIT3HImtZSM2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEVNTCPt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEVNTCPt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8101F000E9;
	Thu, 16 Jul 2026 09:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784193299;
	bh=rWb4XEj1sh3w/34EyK1JcKUA4j+zOy0/zjtIiTemCXk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AEVNTCPtpWugFfHvl00Vsg3lJhK5nJRE3oWjRKID4TOAtbBgA5xAYnRucUfiacI8K
	 zYA02jMmB+kfUyhzWzFtZMbRbXhpCfTI1nuDBdkQIHj73Pxvyv58WcVuSMTZNtXwoj
	 g2bIvt2+kHtHmuwRg3MORhHyh7mcAGIohsQKiZymHtir2O48uUKlfFmMUfoGeuCE/F
	 DOY8V89EkeYgjJ3LKb8/b0lDvQpPY6fDk61QJcA1IdYCMs5JMSinLdBx44oKXsLrBQ
	 wJgMXYpHnpNULyR3EBjY1vcn8kXSMHJap/zXvDdoNhHPKM//JrERqBgmvGiMP6CNJ0
	 5ejvVOaHOS7Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com>
References: <20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 09:14:58 +0000
Message-Id: <20260716091459.1D8101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Missing framebuffer validation in atomic paths leads to an uncondi=
tional NULL pointer dereference when a plane is configured without a frameb=
uffer.
- [High] `imx_lcdc_plane_helper_atomic_check` fetches a potentially NULL CR=
TC state, causing a kernel panic in core helpers.
- [High] Redundant clock enable calls cause a persistent reference count le=
ak for `clk_per` on every display modeset.

Pre-existing issues:
- [Critical] The driver accesses peripheral MMIO registers and leaves inter=
rupts unmasked while the AHB and IPG bus clocks are disabled.
- [High] The CRTC atomic check unconditionally overwrites the `mode_changed=
` flag, potentially discarding modeset requests initiated by the DRM core.
- [High] VBLANK completion events are signaled prematurely during display d=
isable/modeset sequences.
--

--- Patch [1]: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe w=
ith regular atomic helpers ---
commit 78bda5593353310f7405860b2b4d7ea3060e0afa
Author: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: drm/imx: replace struct drm_simple_display_pipe with regular atomi=
c helpers

This commit converts the i.MX LCDC driver to explicit primary plane, CRTC,=
=20
and encoder objects, removing the dependency on the simple-KMS framework.=20
It preserves most of the previous callbacks by rewiring them into the=20
standard atomic helper paths.

Link: https://patch.msgid.link/20260705-drm-simple-kms-removal-v1-0-b4e1ca0=
53623@oss.qualcomm.com

> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lc=
dc/imx-lcdc.c
> index c67fe80b8115e..5c858fc81a78c 100644
> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c

[ ... ]

> -static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
> -				 struct drm_crtc_state *crtc_state,
> -				 struct drm_plane_state *plane_state)
> +static void imx_lcdc_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					       struct drm_atomic_commit *commit)
>  {
>  	int ret;
>  	int clk_div;
>  	int bpp;
> -	struct imx_lcdc *lcdc =3D imx_lcdc_from_drmdev(pipe->crtc.dev);
> -	struct drm_display_mode *mode =3D &pipe->crtc.mode;
> +	struct imx_lcdc *lcdc =3D imx_lcdc_from_drmdev(crtc->dev);
> +	struct drm_crtc_state *cstate =3D drm_atomic_get_new_crtc_state(commit,=
 crtc);
> +	struct drm_plane_state *plane_state =3D lcdc->plane.state;

[Severity: High]
Does this code result in a NULL pointer dereference when a primary plane is
configured without a framebuffer?

If userspace submits an atomic commit that enables the CRTC but sets the
primary plane's FB_ID to 0, plane_state->fb will be NULL.

Since drm_atomic_helper_check_crtc_primary_plane only verifies that the
primary plane is present in the plane mask, it does not prevent a NULL
framebuffer. This causes an unconditional dereference shortly after this li=
ne
when extracting the format via imx_lcdc_get_format(), as well as inside=20
imx_lcdc_update_hw_registers() when calling drm_fb_dma_get_gem_addr().

> +	struct drm_display_mode *mode =3D &cstate->mode;
>  	struct drm_display_info *disp_info =3D &lcdc->connector->display_info;
>  	const int hsync_pol =3D (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : 1;
>  	const int vsync_pol =3D (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : 1;

[ ... ]

> @@ -230,40 +232,46 @@ static void imx_lcdc_pipe_enable(struct drm_simple_=
display_pipe *pipe,
> =20
>  	ret =3D clk_prepare_enable(lcdc->clk_ipg);
>  	if (ret) {
> -		dev_err(pipe->crtc.dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR=
(ret));
> +		dev_err(crtc->dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret)=
);
>  		return;
>  	}

[Severity: Critical]
This is a pre-existing issue, but does this perform memory-mapped writes to
peripheral registers before the IPG and AHB bus clocks are enabled?

Just prior to enabling the IPG clock here, the driver performs multiple
writel() configuration writes to the LPCR and LCPR registers. Accessing
registers of an unclocked IP block on i.MX platforms can hang the bus and
trigger a synchronous external abort. Could we ensure the clocks are
prepared and enabled before doing configuration writes?

>  	ret =3D clk_prepare_enable(lcdc->clk_ahb);
>  	if (ret) {
> -		dev_err(pipe->crtc.dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR=
(ret));
> +		dev_err(crtc->dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret)=
);
> =20
>  		clk_disable_unprepare(lcdc->clk_ipg);
> =20
>  		return;
>  	}
> =20
> -	imx_lcdc_update_hw_registers(pipe, NULL, true);
> +	imx_lcdc_update_hw_registers(crtc, NULL, true);
> =20
>  	/* Enable VBLANK Interrupt */
>  	writel(INTR_EOF, lcdc->base + IMX21LCDC_LIER);
> +
> +	drm_crtc_vblank_on(crtc);
>  }
> =20
> -static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
> +static void imx_lcdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +						struct drm_atomic_commit *commit)
>  {
> -	struct imx_lcdc *lcdc =3D imx_lcdc_from_drmdev(pipe->crtc.dev);
> -	struct drm_crtc *crtc =3D &lcdc->pipe.crtc;
> +	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_state=
(commit, crtc);
> +	struct drm_crtc_state *new_crtc_state =3D drm_atomic_get_new_crtc_state=
(commit, crtc);
> +	struct imx_lcdc *lcdc =3D imx_lcdc_from_drmdev(crtc->dev);
>  	struct drm_pending_vblank_event *event;
> =20
> +	drm_crtc_vblank_off(crtc);
> +
>  	clk_disable_unprepare(lcdc->clk_ahb);
>  	clk_disable_unprepare(lcdc->clk_ipg);
> =20
> -	if (pipe->crtc.enabled)
> +	if (old_crtc_state->enable)
>  		clk_disable_unprepare(lcdc->clk_per);
> =20
>  	spin_lock_irq(&lcdc->drm.event_lock);
> -	event =3D crtc->state->event;
> +	event =3D new_crtc_state->event;
>  	if (event) {
> -		crtc->state->event =3D NULL;
> +		new_crtc_state->event =3D NULL;
>  		drm_crtc_send_vblank_event(crtc, event);
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does consuming the event
during the disable phase signal completion to userspace prematurely?

Sending the event here signals to the compositor that the modeset is comple=
te
before the new mode is programmed and flushed, which could lead to frame
submission races or compositor stalls.

>  	spin_unlock_irq(&lcdc->drm.event_lock);
> @@ -272,17 +280,20 @@ static void imx_lcdc_pipe_disable(struct drm_simple=
_display_pipe *pipe)
>  	writel(0, lcdc->base + IMX21LCDC_LIER);

[Severity: Critical]
This is a pre-existing issue, but are the bus clocks disabled before cleari=
ng
the VBLANK interrupt?

Similar to the enable path, writing to the LIER register while the IPG and
AHB clocks are disabled can trigger a bus fault. Furthermore, since the
interrupt is unmasked before the clocks are disabled, an incoming IRQ could
cause the handler to read the LISR register while clocks are off.

>  }
> =20
> -static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
> -			       struct drm_plane_state *plane_state,
> -			       struct drm_crtc_state *crtc_state)
> +static int imx_lcdc_crtc_helper_atomic_check(struct drm_crtc *crtc,
> +					     struct drm_atomic_commit *commit)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(com=
mit, crtc);
> +	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_state=
(commit, crtc);
>  	const struct drm_display_mode *mode =3D &crtc_state->mode;
> -	const struct drm_display_mode *old_mode =3D &pipe->crtc.state->mode;
> +	const struct drm_display_mode *old_mode =3D &old_crtc_state->mode;
> +	int ret;
> =20
> -	if (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES ||
> -	    mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES ||
> -	    mode->hdisplay % 0x10) { /* must be multiple of 16 */
> -		drm_err(pipe->crtc.dev, "unsupported display mode (%u x %u)\n",
> +	if (crtc_state->enable &&
> +	    (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES ||
> +	     mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES ||
> +	     mode->hdisplay % 0x10)) { /* must be multiple of 16 */
> +		drm_err(crtc->dev, "unsupported display mode (%u x %u)\n",
>  			mode->hdisplay, mode->vdisplay);
>  		return -EINVAL;
>  	}
> @@ -291,46 +302,116 @@ static int imx_lcdc_pipe_check(struct drm_simple_d=
isplay_pipe *pipe,
>  		old_mode->hdisplay !=3D mode->hdisplay ||
>  		old_mode->vdisplay !=3D mode->vdisplay;

[Severity: High]
This is a pre-existing issue, but does this direct assignment to
mode_changed discard modeset requests initiated by the DRM core?

The core drm_atomic_helper_check_modeset() function may have already set
mode_changed to true due to connector routing changes or userspace forcing a
modeset. Using a direct assignment instead of a bitwise OR (|=3D) silently
clears that flag if the spatial dimensions haven't changed.

> -	return 0;
> +	if (crtc_state->enable) {
> +		ret =3D drm_atomic_helper_check_crtc_primary_plane(crtc_state);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return drm_atomic_add_affected_planes(commit, crtc);
>  }
> =20
> -static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
> -				 struct drm_plane_state *old_state)
> +static void imx_lcdc_plane_helper_atomic_update(struct drm_plane *plane,
> +						struct drm_atomic_commit *commit)
>  {
> -	struct drm_crtc *crtc =3D &pipe->crtc;
> -	struct drm_pending_vblank_event *event =3D crtc->state->event;
> -	struct drm_plane_state *new_state =3D pipe->plane.state;
> +	struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_state(co=
mmit, plane);
> +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(co=
mmit, plane);
> +	struct drm_crtc *crtc =3D new_state->crtc ?: old_state->crtc;
>  	struct drm_framebuffer *fb =3D new_state->fb;
>  	struct drm_framebuffer *old_fb =3D old_state->fb;
>  	struct drm_crtc *old_crtc =3D old_state->crtc;
>  	bool mode_changed =3D false;
> =20
> +	if (!fb)
> +		return;
> +
>  	if (old_fb && old_fb->format !=3D fb->format)
>  		mode_changed =3D true;
>  	else if (old_crtc !=3D crtc)
>  		mode_changed =3D true;
> =20
> -	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
> +	imx_lcdc_update_hw_registers(crtc, old_state, mode_changed);
> +}

[Severity: High]
Does calling imx_lcdc_update_hw_registers() here cause a persistent referen=
ce
count leak for clk_per?

During a modeset, imx_lcdc_crtc_helper_atomic_enable() already calls
imx_lcdc_update_hw_registers() which increments the clock reference count
when the CRTC is enabled.

When the plane helper subsequently calls it again here, the clock prepare
enable block is hit a second time. However, during display disable, the
plane update returns early due to a NULL fb, meaning the clock is only
disabled once in the CRTC disable path.

> =20
> -	if (event) {
> -		crtc->state->event =3D NULL;
> +static int imx_lcdc_plane_helper_atomic_check(struct drm_plane *plane,
> +					      struct drm_atomic_commit *commit)
> +{
> +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state(=
commit, plane);
> +	struct drm_crtc *crtc =3D plane_state->crtc;
> +	struct drm_crtc_state *crtc_state =3D NULL;
> =20
> -		spin_lock_irq(&crtc->dev->event_lock);
> +	if (crtc)
> +		crtc_state =3D drm_atomic_get_new_crtc_state(commit, crtc);
> =20
> -		if (crtc->state->active && drm_crtc_vblank_get(crtc) =3D=3D 0)
> -			drm_crtc_arm_vblank_event(crtc, event);
> -		else
> -			drm_crtc_send_vblank_event(crtc, event);
> +	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,

[Severity: High]
Can fetching the CRTC state this way cause a kernel panic in the core atomic
helpers?

If userspace submits a commit that modifies only plane properties without
affecting the CRTC, the CRTC is not implicitly added to the atomic commit
state.

In this scenario, drm_atomic_get_new_crtc_state() returns NULL. Passing this
NULL pointer directly to drm_atomic_helper_check_plane_state() causes a cra=
sh
when it dereferences crtc_state->enable.

Could this use drm_atomic_get_crtc_state() instead to ensure the state is
brought into the commit if it is missing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-drm-simple=
-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com?part=3D1
