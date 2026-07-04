Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2233749FB
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 18:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783190710; cv=none; b=bx736o6bDu9fffGogWs5H4a+CkIDdDf3jCFstFbH/jQuXODYeJBKrinakzBiUGMqyKtsi0vyLMH1c8zf2QN14BWnTdMcm4nu1t638wEcjidDUTJCBZ37mblPrvjp3Sv7Gf2DwJy0j9Kj41fzmyrevFC3sNwoO0rGGtWcbgL+SJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783190710; c=relaxed/simple;
	bh=Ey4au5JCYRjiVFf5En7H0lRfzecWDbgwHMvxqOt9+dc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C9Cz8tQvqJEsolvXbJQlMOs2v6RxdgvmTg2zSYS50IdXCwinyUENBhj6Dhk3aaCsGBQO0ZSnt5GfXZh8Uzr7bqtxMV/uHBl0EcJXCuUpKTtfQqXrRn8RyVKcWKdWyTKIYlmmxRAl2vuhjoZJJSiHSuOrmc08ScPDgdbipLlOgbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLbzoYOq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLbzoYOq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F981F000E9;
	Sat,  4 Jul 2026 18:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783190708;
	bh=qGgeGqyCy3yDcfolZVrqpoXvk3cq7+rAccZ2PSxyyKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aLbzoYOqt0L5i2zlgazXUB/PjqrGgJpQ4yKPj5+zP0Q6r3fG80FPqlQ40GwGMfhey
	 4fn2U2k6dzxayo6+rYU+mUGmcYw6VReth3iHai5+tSkflrH0klVu38iQwKxCtwQN9o
	 5qSWKn9daLJVwDKZZorAAuyKz4z5cjcwKJMzpz5jVzhsf6DoTrAB7lk8eKh4Rh9jy1
	 6lwgXzL6dD8ut4dO13My0I/HpDkujnqWXONPwE7XZlTRLcb6ElXvDoP5jcDYPQQVnB
	 OXGhHBiEWkDsySiqE9HVl8TU2tMWEuPlMrGVHYnPc53FDW18SXAUP9MBSMJP7DhW2r
	 bYx9Pa2j+Pxnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/9] drm/pl111: replace struct drm_simple_display_pipe
 with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260705-drm-simple-kms-removal-v1-5-b4e1ca053623@oss.qualcomm.com>
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
 <20260705-drm-simple-kms-removal-v1-5-b4e1ca053623@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 18:45:07 +0000
Message-Id: <20260704184507.B1F981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconsumed CRTC VBLANK event when disabling the CRTC causes a memo=
ry leak and userspace hang.
--

commit f35a0721a36bbf78ed41d1be8bb186efb88c9092
Author: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: drm/pl111: replace struct drm_simple_display_pipe with regular ato=
mic helpers

This commit replaces the PL111 simple display pipe with explicit plane, CRT=
C,=20
and encoder objects. It preserves existing hardware programming and vblank=
=20
behavior while using the GEM framebuffer prepare helper.

> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl11=
1/pl111_display.c
> index 5d10bc5fdf1f6..b1bdd4c9dbe68 100644
> --- a/drivers/gpu/drm/pl111/pl111_display.c
> +++ b/drivers/gpu/drm/pl111/pl111_display.c
[ ... ]
> -static void pl111_display_disable(struct drm_simple_display_pipe *pipe)
> +static void pl111_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +					     struct drm_atomic_commit *state)
>  {
> -	struct drm_crtc *crtc =3D &pipe->crtc;
>  	struct drm_device *drm =3D crtc->dev;
>  	struct pl111_drm_dev_private *priv =3D drm->dev_private;
>  	u32 cntl;
[ ... ]
> -static void pl111_display_update(struct drm_simple_display_pipe *pipe,
> -				 struct drm_plane_state *old_pstate)
> +static void pl111_plane_helper_atomic_update(struct drm_plane *plane,
> +					     struct drm_atomic_commit *state)
>  {
> -	struct drm_crtc *crtc =3D &pipe->crtc;
> -	struct drm_device *drm =3D crtc->dev;
> -	struct pl111_drm_dev_private *priv =3D drm->dev_private;
> -	struct drm_pending_vblank_event *event =3D crtc->state->event;
> -	struct drm_plane *plane =3D &pipe->plane;
> +	struct drm_crtc *crtc =3D plane->state->crtc;
> +	struct drm_device *drm;
> +	struct pl111_drm_dev_private *priv;
> +	struct drm_pending_vblank_event *event;
>  	struct drm_plane_state *pstate =3D plane->state;
>  	struct drm_framebuffer *fb =3D pstate->fb;
> =20
> +	if (!crtc)
> +		return;
> +

[Severity: High]
When disabling the CRTC, does this code leak the vblank event?

If an atomic commit disables the CRTC and requests a completion event, this
early return in pl111_plane_helper_atomic_update() triggers because=20
plane->state->crtc is NULL when the plane is disabled.

Since the event consumption logic previously provided by the=20
drm_simple_display_pipe framework has been removed, and=20
pl111_crtc_helper_atomic_disable() also lacks logic to consume=20
crtc->state->event, won't the event remain attached and unconsumed?

This can trigger a kernel warning in drm_atomic_helper_commit_hw_done()=20
(which warns if the event is still attached) and cause userspace=20
compositors to hang indefinitely waiting for the page flip event.

> +	drm =3D crtc->dev;
> +	priv =3D drm->dev_private;
> +	event =3D crtc->state->event;
> +
>  	if (fb) {
>  		u32 addr =3D drm_fb_dma_get_gem_addr(fb, pstate, 0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-drm-simple=
-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com?part=3D5
