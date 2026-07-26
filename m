Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09171F03DE
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095818; cv=none; b=tITmFxe6ei1T9reE9AGiKxutKERLrZBeSDflRH+1AkGvQCBn41SyWqs6p5uSWWl+Ht3K40dHRwXZCBX/fgGNo3m1NxARhmkWMSp7f9K5E3+6mffCiJHmM3aKsYmrJj/OBRqtU4LVcFQJiJukg5onUbY+A7eyeAo3J1oRHcxBhNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095818; c=relaxed/simple;
	bh=YqzvALOHXz9iDoGqMjk+Z7VMKwtYvTalVqId38rGg3g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E8/jfhbUZThaNhfXF9cqpXn5BC2Dbt2b41bnX5WMoZQrif9kmyyyu341jNGEegNV2x3Lpe7IVHXzuAJDE8fVRXyakNKmiZNAULYEBVYT9tWkpaXbialqCRwfNo1a2ps0kes8o3zIXyDeKRaaDuJCYEbzUB4K8TIcyA6KB4nKmb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSDcB9+T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSDcB9+T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5221F000E9;
	Sun, 26 Jul 2026 19:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785095817;
	bh=5dy8jNvOD/cBGvAT7XW1mK/6Ala3xgegdA6+03XCn18=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XSDcB9+TsZLGWDDs5lmtebWfa392QUnjLo9qLKlntx3HhYUAzP+owWYBU0BN2a6Xo
	 PUC/7zOQfRGXaL7VqoZYwHPJoitBy5J2vX8E4RjLvlawSfZZzxEfZU4rML8z1EXY0J
	 Q+1Ql73pht/9ejfroeV8FX7ROaPhN0Fe37pPNEb/ZNzuKYGn9FmO4e8P3+cC8DXbND
	 hX1er+mRL2LIhoTP2RooD9DBxHO1NJy+mRXvDY8fLX35CmqxjdhJeNVHBvJ5OBHqsR
	 bNK0J8vwprz/rVb0NXXPFs0EyI0J+LPWsBpmIsnviAEofMUOyIXXTq7RjOksgByyJa
	 94gDmOkLBzXcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/8] drm/xen: replace struct drm_simple_display_pipe
 with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org
In-Reply-To: <20260727-drm-simple-kms-removal-v3-8-cd5dc89858c6@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-8-cd5dc89858c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 19:56:56 +0000
Message-Id: <20260726195657.4C5221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect coordinates passed to xen_drm_front_mode_set: uses desti=
nation screen coordinates instead of source framebuffer offsets.
--

--- Patch [8]: [PATCH v3 8/8] drm/xen: replace struct drm_simple_display_pi=
pe with regular atomic helpers ---
commit c7c607527ef2df6f1f1c3266167b6754066820c2
Author: Ze Huang <ze.huang@oss.qualcomm.com>

drm/xen: replace struct drm_simple_display_pipe with regular atomic helpers

This commit replaces the Xen frontend simple display pipe with explicit
plane, CRTC, and encoder objects. It retains generic plane-state validation
and uses commit-local plane state in the CRTC enable path.

> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xe=
n/xen_drm_front_kms.c
> index 48772b5fe71cf..9896ea35b7439 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c

[ ... ]

> -static void display_enable(struct drm_simple_display_pipe *pipe,
> -			   struct drm_crtc_state *crtc_state,
> -			   struct drm_plane_state *plane_state)
> +static void xen_drm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					      struct drm_atomic_commit *commit)
>  {
> -	struct xen_drm_front_drm_pipeline *pipeline =3D
> -			to_xen_drm_pipeline(pipe);
> -	struct drm_crtc *crtc =3D &pipe->crtc;
> -	struct drm_framebuffer *fb =3D plane_state->fb;
> +	struct xen_drm_front_drm_pipeline *pipeline =3D xen_drm_pipeline_from_c=
rtc(crtc);
> +	struct drm_plane_state *pstate =3D drm_atomic_get_new_plane_state(commi=
t, &pipeline->plane);
> +	struct drm_framebuffer *fb =3D pstate->fb;
>  	int ret, idx;
> =20
> -	if (!drm_dev_enter(pipe->crtc.dev, &idx))
> +	if (!drm_dev_enter(crtc->dev, &idx))
>  		return;
> =20
> -	ret =3D xen_drm_front_mode_set(pipeline, crtc->x, crtc->y,
> +	ret =3D xen_drm_front_mode_set(pipeline, pstate->crtc_x, pstate->crtc_y,
>  				     fb->width, fb->height,
>  				     fb->format->cpp[0] * 8,
>  				     xen_drm_front_fb_to_cookie(fb));

[Severity: High]
The commit message mentions passing the new plane source position, but does=
=20
this pass the destination screen coordinates instead?=20

It looks like pstate->crtc_x and pstate->crtc_y represent the destination
coordinates on the CRTC. Should this use the source coordinates instead=20
(e.g., from pstate->src) to prevent breaking viewport offsets or causing=20
out-of-bounds framebuffer reads by the backend?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-drm-simple=
-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com?part=3D8
