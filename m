Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678045;
	b=M+2451/W3UIrJtTINN9ZuWx1WSxSGfrdlqyDvJakpjIu2BkTDahIDIosoK+8hD3mdDTy
	 l3J9eEoN3JLJAjytaC0Wfy8YCkWl0imwtVii57ndZJlsxNR6blQOmJlFCBt3daeZEi4TV
	 z+iZz/hi8OQ8suan9Q5WOZJEPTMbpZTQI6Q1+rA/ERDmTd4i01QHVQfRVjPc401LiUayO
	 HvhiZVmWHuQwY7n/NVaxPXmpLTU1uSd+3HinMqsh6ZLxrdkaS/8zabm8pd5x5c/KqNfH4
	 5HhxWv/uX6jbZhnY9E0KYy5kj3+krlyE4Pb/RPSuEe/upGOboCmSuvO6EAUfVjZsR7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678045;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yZwJyJmVqd2Mosyi3avlWDhDjjzcOVllfyisjfC451Q=;
	b=kyj8VvB67IERCIwEcge2QTpVikiw/9md8OafGufMzljKVQHUvYRve71ATBSm+kTCh+Mm
	 6HNuG66LXJY9E4tO9kMKEF/t1SlZLGtZC+Xlcg2/AbX4lnCssT/J8x8UO00NN+McBWUjE
	 4am9Eo/nrHZ8VqMHH1lZPTJ19f8EDVIaVh+pug+ZS6ScdKE5u7aJrfJuMzA7Eu7K8fTBq
	 lEPdkT4CtcVd6e5wcq1WZo0DsBvf5zvVx0MVUjEjkcvkWQDklDOKkGDQnFq3U1D361/9k
	 DWG0bfE7dxcLcLcWYg1s0hTvzqMA3e6BzAyGFljiBO3u7bXttz+6uck2TE75MUrH/Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dfxZLm/I";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AD3606A31E;
	Thu, 26 Nov 2026 07:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dfxZLm/I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0906F1F000C4;
	Thu, 26 Nov 2026 07:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795678045;
	bh=yZwJyJmVqd2Mosyi3avlWDhDjjzcOVllfyisjfC451Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dfxZLm/IFOfRo3Q43QNR7vIm8DoAKNrOEcShHlpDhkOd+6kWtlMRgUPVrY9p4o11h
	 i0lGsgLI8QS+PWSOBJP40p82vGqfEBZwEZW2TmoxFoZR93fvQgIKHSD1OijBkcmVWW
	 6CdORKcqOwfk+0soJ2cCdHNO8wtC9CX71CwW6bvuwa0C7J7YhuZcO1wdewdABzDYVE
	 yDycOJezbSliKwmvKMKbT/uFOZk8+E+IYIYfpaKehoxBzimTPjdZl9VymeLmcDoOyl
	 JLmIfJV/l7JNebxqtKSu2z+tzhyQzYi/hIgjaHLMa1uQBBD2bMikIugL+Y89XLvBi/
	 XBsERRQXsV63A==
Message-ID: <sashiko-outbox-234954@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFT v4 4/5] drm/imx/dc: plane: Switch to
 drm_fb_dma_get_gem_clipped_addr()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: linux-sunxi@lists.linux.dev, imx@lists.linux.dev, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org
In-Reply-To: <20261126071314.253890-5-wenst@chromium.org>
References: <20261126071314.253890-1-wenst@chromium.org>
 <20261126071314.253890-5-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:27:24 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/imx/dc: off-screen plane programs out-of-bounds DMA
  address and 0 size
--

commit cf4b0408a88e14e3a67afb3b4cd1719d2796a174
Author: Chen-Yu Tsai <wenst@chromium.org>

drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

This commit switches dc_plane_check_fb() and dc_plane_atomic_update() to
drm_fb_dma_get_gem_clipped_addr() so the framebuffer DMA base address uses
clipped source coordinates.

> diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/d=
c-plane.c
> index 62dd0576fadcb..35eb5039f5acf 100644
> --- a/drivers/gpu/drm/imx/dc/dc-plane.c
> +++ b/drivers/gpu/drm/imx/dc/dc-plane.c
> @@ -65,7 +65,7 @@ static int dc_plane_check_max_source_resolution(struct =
drm_plane_state *state)
>  static int dc_plane_check_fb(struct drm_plane_state *state)
>  {
>  	struct drm_framebuffer *fb =3D state->fb;
> -	dma_addr_t baseaddr =3D drm_fb_dma_get_gem_addr(fb, state, 0);
> +	dma_addr_t baseaddr =3D drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
> =20
>  	/* base address alignment */
>  	if (baseaddr & 0x3) {
> @@ -146,7 +146,7 @@ dc_plane_atomic_update(struct drm_plane *plane, struc=
t drm_atomic_commit *state)
>  	src_w =3D drm_rect_width(&new_state->src) >> 16;
>  	src_h =3D drm_rect_height(&new_state->src) >> 16;
> =20
> -	baseaddr =3D drm_fb_dma_get_gem_addr(fb, new_state, 0);
> +	baseaddr =3D drm_fb_dma_get_gem_clipped_addr(fb, new_state, 0);

[Severity: Medium]
Can drm_fb_dma_get_gem_clipped_addr() compute an out-of-bounds DMA address
when the plane is positioned completely off-screen?

dc_plane_atomic_check() calls drm_atomic_helper_check_plane_state() with
can_position =3D true.  When a plane is moved completely outside the CRTC
bounds, drm_rect_clip_scaled() sets plane_state->visible =3D false and clips
src.x1 =3D=3D src.x2 (up to fb->width << 16) or src.y1 =3D=3D src.y2 (up to
fb->height << 16), while drm_atomic_helper_check_plane_state() still
returns 0.

Because neither dc_plane_atomic_check() nor dc_plane_atomic_update() checks
plane_state->visible, drm_fb_dma_get_gem_clipped_addr() computes baseaddr
at (src.x1 >> 16, src.y1 >> 16), which can point past the end of the
framebuffer GEM object, and dc_plane_atomic_update() programs that address
along with zero src_w or src_h into the FetchUnit while enabling the source
buffer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126071314.2538=
90-1-wenst@chromium.org?part=3D4
