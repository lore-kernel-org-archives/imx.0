Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B91F29A309
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 20:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785096822; cv=none; b=f4Z8xmOhTrjcXluKovvZfVt+zHuhjIBJGOQagrj8afTr+nUYoBzjntkJC6xt7QqrlR0b+vWJs107KAFs3TzJsgObE9+mBwclVNnYV5vyAKG8zXgHWW3L16LxZTAcAJnSn2tTJLvmH1zICCiwvq8eKwRiTQGt/VhBZQofjeDvGOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785096822; c=relaxed/simple;
	bh=jT8mjobxvvlrGqEjwAnhRcuHGEt5gkxHbtML36z9EMc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F5ljTAQ58g9Q6xl3VwMTiYs7xplBTigfoRAk6vb+Hgi5mCZTqzQ2knhERMJSR/57d0UUAZOmlv7ppwnr/mqbvgR21bOZ3EHp2aYIzdkdhITpp+7jwwZhEHQ/yRuIY2XwJ2bAkRFoK0CaYSONhYruE1pQdIB0kCCScj/wjkB9hSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOH8QuZP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOH8QuZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5601F000E9;
	Sun, 26 Jul 2026 20:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785096821;
	bh=74TEkv8tAAVnMmq6v32AzTKrFjLJcDOnduVO6nJsNb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SOH8QuZPB8pPBWXGdCx+qM3NXRMCTVAQ9HgJCf3yTFlEUUL9ykE2AbMq0/0xbm6bC
	 KmBfCIDwEQNZ/c4NMPwOLO7gxXprNL/+FVX1Y+NH0dFc1KTtivK/PXL8kIKaAESPt9
	 5ctDTatEd6QDFCC6+cR+lBOOwk4X0d/q5CsUFYoQX+ClG1dOjqZlpvlJtq7ejxhfIw
	 zCTj+27tRIjJSzBXVBxTFsTyXIMidok+5HEt2e4GhiJ6n3AAxT6BzR+Rd5pGY8s9tS
	 tgsMbYrPFJ5lTJ4TNF6MI/aM32bwuttR9ptmQI5PqZkkEAxBC7dW9pdBgIqHL9mgBO
	 yqDFROciBzJxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] drm/gm12u320: replace struct
 drm_simple_display_pipe with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260727-drm-simple-kms-removal-v3-5-cd5dc89858c6@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-5-cd5dc89858c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 20:13:40 +0000
Message-Id: <20260726201340.DA5601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver will crash in `gm12u320_stop_fb_update` due to a NULL p=
ointer dereference when dropping a framebuffer reference. The asynchronous =
worker `gm12u320_fb_update_work` drops its reference to the framebuffer and=
 sets `gm12u320->fb_update.fb =3D NULL` after copying the first frame. When=
 the CRTC is later disabled (e.g., via device unplug or KMS disable), `gm12=
u320_stop_fb_update` reads this NULL pointer into `old_fb` and unconditiona=
lly calls `drm_framebuffer_put(old_fb)`. Because `drm_framebuffer_put` comp=
utes the address of `&fb->base` before passing it to `drm_mode_object_put()=
`, a NULL `fb` results in a non-NULL offset pointer, bypassing any potentia=
l NULL checks in the core and causing a fatal page fault when dereferenced.
- [High] The driver calls sleeping functions (`mutex_lock` and `cancel_dela=
yed_work_sync`) from atomic context paths, violating DRM subsystem architec=
tural guidelines. The patch converts the driver to use standard CRTC and pl=
ane atomic helpers (`gm12u320_crtc_helper_atomic_enable`, `gm12u320_crtc_he=
lper_atomic_disable`, and `gm12u320_plane_helper_atomic_update`). These cal=
lbacks are explicitly classified by DRM guidelines as atomic context where =
sleeping is forbidden, yet they call functions that block.
--

--- Patch [5]: [PATCH v3 5/8] drm/gm12u320: replace struct drm_simple_displ=
ay_pipe with regular atomic helpers ---
commit 0dd628ecb0a7395ec2d8faaa3a751862640afcb7
Author: Ze Huang <ze.huang@oss.qualcomm.com>

drm/gm12u320: replace struct drm_simple_display_pipe with regular atomic he=
lpers
   =20
Convert gm12u320 to direct primary plane, CRTC and encoder setup.
   =20
Keep shadow-plane helper state, framebuffer access helpers and
no-scaling plane-state check from simple-KMS path.

> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u=
320.c
> index 4ad074337af07..754617722a0db 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c

[ ... ]

> @@ -555,43 +560,106 @@ static int gm12u320_conn_init(struct gm12u320_devi=
ce *gm12u320)
>  }
> =20
>  /* ------------------------------------------------------------------ */
> -/* gm12u320 (simple) display pipe				      */
> +/* gm12u320 display pipe					      */
> =20
> -static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
> -				 struct drm_crtc_state *crtc_state,
> -				 struct drm_plane_state *plane_state)
> +static void gm12u320_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					       struct drm_atomic_commit *commit)
>  {
>  	struct drm_rect rect =3D { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT };
> -	struct gm12u320_device *gm12u320 =3D to_gm12u320(pipe->crtc.dev);
> -	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_pla=
ne_state(plane_state);
> +	struct gm12u320_device *gm12u320 =3D to_gm12u320(crtc->dev);
> +	struct drm_plane_state *pstate =3D drm_atomic_get_new_plane_state(commi=
t, &gm12u320->plane);
> +	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_pla=
ne_state(pstate);
> =20
>  	gm12u320->fb_update.draw_status_timeout =3D FIRST_FRAME_TIMEOUT;
> -	gm12u320_fb_mark_dirty(plane_state->fb, &shadow_plane_state->data[0], &=
rect);
> +	gm12u320_fb_mark_dirty(pstate->fb, &shadow_plane_state->data[0], &rect);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does calling
gm12u320_fb_mark_dirty() here violate DRM subsystem architectural guideline=
s by
sleeping in an atomic context?

gm12u320_crtc_helper_atomic_enable() runs in an atomic context during
non-blocking commits where sleeping is forbidden. However,
gm12u320_fb_mark_dirty() unconditionally acquires a mutex:

	mutex_lock(&gm12u320->fb_update.lock);

Could this lead to kernel warnings like 'scheduling while atomic' or deadlo=
cks
during display modesets? (The same applies to
gm12u320_plane_helper_atomic_update below).

> -static void gm12u320_pipe_disable(struct drm_simple_display_pipe *pipe)
> +static void gm12u320_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +						struct drm_atomic_commit *commit)
>  {
> -	struct gm12u320_device *gm12u320 =3D to_gm12u320(pipe->crtc.dev);
> +	struct gm12u320_device *gm12u320 =3D to_gm12u320(crtc->dev);
> =20
>  	gm12u320_stop_fb_update(gm12u320);
>  }

[Severity: High]
This is also a pre-existing issue, but does gm12u320_stop_fb_update() sleep=
 in
an atomic context, and could it cause a NULL pointer dereference?

First, like the enable path above, gm12u320_crtc_helper_atomic_disable() ru=
ns
in an atomic context where sleeping is forbidden. But gm12u320_stop_fb_upda=
te()
calls cancel_delayed_work_sync() and acquires a mutex.

Second, can old_fb be NULL when passed to drm_framebuffer_put() inside
gm12u320_stop_fb_update()?

The asynchronous worker gm12u320_fb_update_work() drops its reference to the
framebuffer and sets gm12u320->fb_update.fb =3D NULL after copying the first
frame. If the CRTC is later disabled (e.g., via device unplug or KMS disabl=
e),
gm12u320_stop_fb_update() reads this NULL pointer into old_fb and passes it=
 to
drm_framebuffer_put(old_fb):

static void gm12u320_stop_fb_update(struct gm12u320_device *gm12u320)
{
	struct drm_framebuffer *old_fb;
	...
	old_fb =3D gm12u320->fb_update.fb;
	...
	drm_framebuffer_put(old_fb);
}

Because drm_framebuffer_put() computes the address of &fb->base before pass=
ing
it to drm_mode_object_put(), passing a NULL fb results in a non-NULL offset
pointer. This bypasses any NULL checks in the core and causes a fatal page
fault when dereferenced.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-drm-simple=
-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com?part=3D5
