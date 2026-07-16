Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73253CE495
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193307; cv=none; b=SVu7iK7OO/RIi4Gxba/hsi9RsXV2eLOLS6+HzHNM4mkZXSDFNLW3YDfOpS57b6C/fKQ9xzRUTs6DxdMVkfOR8qA8VT3lpfVI6JmwkKkSva3mvjAsBfHZ2FaOKLlzCEAANgB2QFYonaJ8LR4ayZobO0WSwgSIGRnkS5cgqeqBO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193307; c=relaxed/simple;
	bh=vu4CNdLm/zuBFoTD6WUE887fB8+cXMVjY/v1qjkj4ho=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TLf2e3esjk4vN14Ev2jqy96M8Csp7rWew7EmFGlCaWbYG2/ja6SNh/Tt+5Wof35jmmDhlLv41ky7s0lm6leX80WNfs/cf658TkPkM/jxnRqEpSPyW0ipYag5eTG2L9ULXnjNoLKI0N54Kbd77gcNc2MDip/aM5TbU4GFqYw8dI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkxR4kr1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkxR4kr1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55091F00A3A;
	Thu, 16 Jul 2026 09:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784193300;
	bh=beDs4q6LIP/ICO3PEO+bqt4Qyqd6MpXFAZiNd6b6t/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mkxR4kr166Ksbc5iS8CmyorZnmGNJcr37iSb0vlGnoVkxrLVZ1XCTx3t6qIxhYZTD
	 w4ndDTBYrgsBGagyLOKONz/b4ilIFurICWidObcKsSezM3PEM/jVP3OZMYIPJZ/UdK
	 fAmciQVIMA7wKl/TjQyDoMU9hkXN+AciFoyx3Lb2tj+Bcd4kdslvseJLYYhiAY2sld
	 sAT3YbHYxk77hu7ZiLLWhzvrWsxXRIWYn8uUX9QtvMtK8O/p+olbkT3q4p8gMDZSEs
	 +tAl+1Ty+xCdQbZkx60gJksWtTsW04lbXgoeFbfqHZjyWx2HMHTq5cmGnXGa/W1Ku7
	 DIMaFXW8LmCLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/8] drm/gm12u320: replace struct
 drm_simple_display_pipe with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org
In-Reply-To: <20260716-drm-simple-kms-removal-v2-5-1133a8fc3785@oss.qualcomm.com>
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
 <20260716-drm-simple-kms-removal-v2-5-1133a8fc3785@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 09:14:59 +0000
Message-Id: <20260716091459.E55091F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Time-of-Check to Time-of-Use (TOCTOU) race condition causing a NUL=
L pointer dereference when accessing the global `plane.state`.
--

--- Patch [5]: [PATCH v2 5/8] drm/gm12u320: replace struct drm_simple_displ=
ay_pipe with regular atomic helpers ---
commit cb5be3218f14cd65e9bd1d82ce85f0bd23c4cc07
Author: Ze Huang <ze.huang@oss.qualcomm.com>

drm/gm12u320: replace struct drm_simple_display_pipe with regular atomic he=
lpers

Convert gm12u320 to direct primary plane, CRTC and encoder setup, while
keeping shadow-plane helper state and framebuffer access helpers.

> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u=
320.c
> index 4ad074337af07..0fc251f07e247 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c

[ ... ]

> @@ -555,43 +560,104 @@ static int gm12u320_conn_init(struct gm12u320_devi=
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
> +	struct gm12u320_device *gm12u320 =3D to_gm12u320(crtc->dev);
> +	struct drm_plane_state *plane_state =3D gm12u320->plane.state;

[Severity: High]
Could this lead to a NULL pointer dereference if a concurrent atomic commit
modifies the state?

When gm12u320_crtc_helper_atomic_enable() reads the global
gm12u320->plane.state directly instead of extracting the stable plane state
from the atomic commit context (such as by using
drm_atomic_get_new_plane_state(commit, &gm12u320->plane)), it appears to
expose a race condition.

If a non-blocking commit is immediately followed by a blocking disable
commit, the plane's fb pointer might become NULL before this worker
has a chance to execute.=20

Passing this NULL fb into gm12u320_fb_mark_dirty() would then cause a panic
when the function unconditionally dereferences fb->dev.

> +	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_pla=
ne_state(plane_state);
> =20
>  	gm12u320->fb_update.draw_status_timeout =3D FIRST_FRAME_TIMEOUT;
>  	gm12u320_fb_mark_dirty(plane_state->fb, &shadow_plane_state->data[0], &=
rect);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-drm-simple=
-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com?part=3D5
