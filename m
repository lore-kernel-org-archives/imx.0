Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8623D7D97
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193951; cv=none; b=dNlzaPyWX9EBkQfedhciR+D/H0Gteq5aKJkLj7hxHvtahpWDhSbcSrHftXV0fqpuzkGAqKQ84GjfE7RH/u8kmTUKeLKZDzI1A/CeO8n0+ZuXBQyJTUNaV/+pYzYW89pxsDCO0DgTQDJIBqXv/p2Mwqk9eTI699bKRyiTDBiIkcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193951; c=relaxed/simple;
	bh=Lz0ymmUdEVJe77A3PNVqtrGX5Yl2D/fY/D/2jPhLKO0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QKQ3gjS6kRmb6JGkkEaI9K2OlNao484FVhL8EJcBcKB0iTzn02SguyGQgPe7fJETSWtBghCyZsEx1H3Ww0CzhZwCGpNFdhiYQSzzZoIC0ml+L4BoiJTDu6OOBS3vLhmS5LR6sY8pOzOI4Ce9EY8k47gK7JBK4htp07pbkaZ3OyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4G3iYIZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4G3iYIZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B5A1F000E9;
	Thu, 16 Jul 2026 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784193950;
	bh=/o7ndbZ+pzdi1XiTkyxY+xRUoJqVRXv7W+PKWUYLSNY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J4G3iYIZJjlF/8ZRcMKekLSd4e6JBJ4/2xswtU8l+Sqz8/MAF1HeDv5IjPxPWnatl
	 G4TpAxs+lL67gLqXq1iZMtvdgU10UBm3uCbf86hByETUONIHzmtuJokrTU9TwlUJkZ
	 UgH6yIDlAQkohgs7wq+mmknxS1ojgjenSIMSYwwOSs6mrYYrFNcCOYzHGGXwzgla1T
	 p49VrYtY6lAJpL4rl3ncF11rLi2HC42EuSU3dOpSwRQFcfIRAPtX2bOx8NVQc/4ua4
	 Xj2xyJtNlY4w7FYqsScmGCKA+GGRD/quB/btCXuW4JZQOvDLMssq0Ylb1Hxp9MzcPl
	 0UsMw8PQ5S3Ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/8] drm/tve200: replace struct
 drm_simple_display_pipe with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org
In-Reply-To: <20260716-drm-simple-kms-removal-v2-7-1133a8fc3785@oss.qualcomm.com>
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
 <20260716-drm-simple-kms-removal-v2-7-1133a8fc3785@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 09:25:49 +0000
Message-Id: <20260716092549.D4B5A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Directly accessing `priv->plane.state` in the CRTC atomic enable c=
allback introduces a Time-of-Check to Time-of-Use (TOCTOU) race condition w=
ith subsequent non-blocking commits.
- [High] Missing `.cleanup_fb` callback in `tve200_plane_helper_funcs` lead=
s to memory and resource leaks of pinned GEM objects and DMA-buf mappings.

Pre-existing issues:
- [High] The CRTC atomic enable and disable callbacks call functions that c=
an sleep (`clk_prepare_enable`, `usleep_range`), violating DRM atomic conte=
xt guidelines.
--

--- Patch [7]: [PATCH v2 7/8] drm/tve200: replace struct drm_simple_display=
_pipe with regular atomic helpers ---
commit 30e007b0736d27ee72ba4a5f39e203c3808e470e
Author: Ze Huang <ze.huang@oss.qualcomm.com>
drm/tve200: replace struct drm_simple_display_pipe with regular atomic help=
ers

Convert TVE200 to explicit plane, CRTC and encoder objects. Keep generic
plane-state validation before TVE200-specific mode, alignment, pitch and
format-change checks, and install GEM framebuffer prepare helper explicitly.

> diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tv=
e200/tve200_display.c
> --- a/drivers/gpu/drm/tve200/tve200_display.c
> +++ b/drivers/gpu/drm/tve200/tve200_display.c
[ ... ]
> @@ -119,16 +140,72 @@ static int tve200_display_check(struct drm_simple_d=
isplay_pipe *pipe,
[ ... ]
> +static const struct drm_plane_helper_funcs tve200_plane_helper_funcs =3D=
 {
> +	.prepare_fb	=3D drm_gem_plane_helper_prepare_fb,
> +	.atomic_check	=3D tve200_plane_helper_atomic_check,
> +	.atomic_update	=3D tve200_plane_helper_atomic_update,
> +};

[Severity: High]
Since .prepare_fb is assigned to drm_gem_plane_helper_prepare_fb, will the
lack of a corresponding .cleanup_fb callback lead to memory and resource
leaks of pinned GEM objects and DMA-buf mappings when the framebuffer is
swapped out?

[ ... ]
> -static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
> -				 struct drm_crtc_state *cstate,
> -				 struct drm_plane_state *plane_state)
> +static void tve200_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					     struct drm_atomic_commit *commit)
>  {
> -	struct drm_crtc *crtc =3D &pipe->crtc;
> -	struct drm_plane *plane =3D &pipe->plane;
>  	struct drm_device *drm =3D crtc->dev;
>  	struct tve200_drm_dev_private *priv =3D drm->dev_private;
> +	struct drm_crtc_state *cstate =3D drm_atomic_get_new_crtc_state(commit,=
 crtc);
>  	const struct drm_display_mode *mode =3D &cstate->mode;
> -	struct drm_framebuffer *fb =3D plane->state->fb;
> +	struct drm_plane_state *plane_state =3D priv->plane.state;
> +	struct drm_framebuffer *fb =3D plane_state->fb;

[Severity: High]
Could this direct access to priv->plane.state introduce a race condition
with subsequent non-blocking commits? A fast sequence of commits might swap
the global state before a previous commit's worker executes this function.

Would it be safer to extract the current commit's plane state using
drm_atomic_get_new_plane_state(commit, &priv->plane) instead to guarantee
it reads the correct snapshot?

[Severity: High]
This is a pre-existing issue, but does tve200_crtc_helper_atomic_enable()
call sleeping functions in an atomic context?

Looking further down in this function, it calls clk_prepare_enable() and
usleep_range(). Similarly, tve200_crtc_helper_atomic_disable() calls
clk_disable_unprepare(). Since atomic commit callbacks can run in an
atomic context where sleeping is forbidden, could this cause system
instability or deadlocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-drm-simple=
-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com?part=3D7
