Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3465377A89
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 20:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785096290; cv=none; b=RpDn7DLedARsdmGEUlwWRw/VVOPJyemTNwsxxGqTV60JBGbxLRXjrV6OHepj69Qm1/rGlLezc6VC38JzJvLVrpW80pR1NiL5nPvbMzMY4hWRQz9lEIpxydA0wIL/tr8mS2BRRa/BhdVKbJEIR+ILOas1rxa4h5wLqkintfQm9hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785096290; c=relaxed/simple;
	bh=gE7pFbfINHuOiOa9qz6h0WzxAg9A8l7yUwGYkzvLhos=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R0GrvJosH4dPw1irf+G/fGWUB1N6AbZ8cC8GiuBIjfW6ck2TkL691KmV58iaT7fmF01JRPkgTTz5f/oVrCdG9mq88g7D/cVdnfb6VW/U0knd6m3/mXxtJDUazPWoN/Hi25FB2VeQO0Ra/dP+kWH2e6/JIKEEFOlyvkmZLl2dImM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FxSmrBcT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FxSmrBcT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2FF1F000E9;
	Sun, 26 Jul 2026 20:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785096288;
	bh=hl+EfH7z5IlsO7tU7WMLyXYySW2iZqaFKPiTKb+d6aY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FxSmrBcTiVfHO90HCPzJnH6C0SoOmhSKXDibXmnTHQSDfIv27rI79M3JDc751ITr0
	 UrKSbcwSXur0qBvjdskUi9uiVo2nh3zrnl6kginphx/GoQRq+5vaFb+M0tXc5NJJ+K
	 9N1eWt1KlUDBcjm+bKqnk7Cm8e4rHO4u93ur+iD1edn6OWnQB1mKkIH+p9xCPdGL47
	 IFM2ATwpIhYCjdOF0L55IzXmb1xXuVrXevV/UvAi51WS5qo8clnf0YbS86+aWYm8AK
	 DIcbA/nYIJYQeuiYQY8AyJhh4scNMKfyXRZjnk9FdiBfJsGEg0QZYbQXak6x6elF8r
	 nKEXzwvZUwC3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/8] drm/repaper: replace struct
 drm_simple_display_pipe with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260727-drm-simple-kms-removal-v3-6-cd5dc89858c6@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-6-cd5dc89858c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 20:04:48 +0000
Message-Id: <20260726200448.9C2FF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Sleeping functions and blocking memory allocations are called from=
 within CRTC and plane atomic callbacks, violating atomic context constrain=
ts.
--

--- Patch [6]: [PATCH v3 6/8] drm/repaper: replace struct drm_simple_displa=
y_pipe with regular atomic helpers ---
commit c95d4b930f0cb70a4eb89a2c19785d09216e66c1
Author: Ze Huang <ze.huang@oss.qualcomm.com>

drm/repaper: replace struct drm_simple_display_pipe with regular atomic hel=
pers

This commit converts the repaper driver to use explicit primary plane, CRTC,
and encoder objects instead of the simple display pipe helpers. It retains
the shadow-plane helpers, framebuffer access handling, and no-scaling
plane-state validation from the simple-KMS path.

> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repape=
r.c
> index c8270591afc7f..f225e38fd4045 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c

[ ... ]

> -static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
> -				struct drm_crtc_state *crtc_state,
> -				struct drm_plane_state *plane_state)
> +static void repaper_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					      struct drm_atomic_commit *commit)
>  {
> -	struct repaper_epd *epd =3D drm_to_epd(pipe->crtc.dev);
> +	struct repaper_epd *epd =3D drm_to_epd(crtc->dev);
>  	struct spi_device *spi =3D epd->spi;
>  	struct device *dev =3D &spi->dev;
>  	bool dc_ok =3D false;
>  	int i, ret, idx;
> =20
> -	if (!drm_dev_enter(pipe->crtc.dev, &idx))
> +	if (!drm_dev_enter(crtc->dev, &idx))
>  		return;

[Severity: High]
This is a pre-existing issue, but does this function sleep in atomic contex=
t?

CRTC atomic enable callbacks execute in atomic context where sleeping is
forbidden. However, looking at the code, this function makes direct calls to
sleeping functions:

    gpiod_set_value_cansleep(epd->reset, 0);
    ...
    usleep_range(5000, 10000);

Could this cause system instability or kernel panics during display state
updates?

[ ... ]

> -static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
> +static void repaper_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +					       struct drm_atomic_commit *commit)
>  {
> -	struct repaper_epd *epd =3D drm_to_epd(pipe->crtc.dev);
> +	struct repaper_epd *epd =3D drm_to_epd(crtc->dev);
>  	struct spi_device *spi =3D epd->spi;
>  	unsigned int line;

[Severity: High]
This is a pre-existing issue, but similar to the enable callback, is it safe
for this atomic disable callback to sleep?

It calls functions that can sleep:

    msleep(25);
    gpiod_set_value_cansleep(epd->border, 0);
    msleep(200);
    ...
    power_off(epd);

[ ... ]

> -static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
> -				struct drm_plane_state *old_state)
> +static void repaper_plane_helper_atomic_update(struct drm_plane *plane,
> +					       struct drm_atomic_commit *commit)
>  {
> -	struct drm_plane_state *state =3D pipe->plane.state;
> -	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_pla=
ne_state(state);
> +	struct drm_plane_state *old_pstate =3D drm_atomic_get_old_plane_state(c=
ommit, plane);
> +	struct drm_plane_state *pstate =3D drm_atomic_get_new_plane_state(commi=
t, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_pla=
ne_state(pstate);
> +	struct drm_crtc_state *cstate =3D NULL;
>  	struct drm_rect rect;
> =20
> -	if (!pipe->crtc.state->active)
> +	if (pstate->crtc)
> +		cstate =3D drm_atomic_get_new_crtc_state(commit, pstate->crtc);
> +
> +	if (!cstate || !cstate->active)
>  		return;
> =20
> -	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
> -		repaper_fb_dirty(state->fb, shadow_plane_state->data,
> +	if (drm_atomic_helper_damage_merged(old_pstate, pstate, &rect))
> +		repaper_fb_dirty(pstate->fb, shadow_plane_state->data,
>  				 &shadow_plane_state->fmtcnv_state);
>  }

[Severity: High]
This is a pre-existing issue, but does repaper_fb_dirty() perform blocking
memory allocations in atomic context?

The plane atomic update callback must not sleep, but repaper_fb_dirty()
uses GFP_KERNEL for memory allocation:

    buf =3D kmalloc(fb->width * fb->height / 8, GFP_KERNEL);

Should this allocation be moved outside of the atomic update path or use a
non-blocking flag?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-drm-simple=
-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com?part=3D6
