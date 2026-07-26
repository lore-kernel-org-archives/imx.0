Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407A32F12A5
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095707; cv=none; b=T+E4S90kaSydu54kRYM09cvsBybdV0kLGjK/WhoJB/D+fhsNFB7/d30YEBSfOcaosdyYqQIh6qpL7lFs5ereumPgEVo1LVgLe5B9arbJDq+WId1w8PfMtntTjx59qgOVCGA6ChdL2/bm0H4WuSiarsPkYKmDkUKJnHC1JUY6OWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095707; c=relaxed/simple;
	bh=+ibuRq49mzHaq6LCCTkRvMUsPtnjrouRPuEoZxUlhcY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XTqYYN/D+Y1cbD8N5HgXuqzM/NFpjH4Zps7vQPRzkst7Xsz0bFrldRoYVn2E1kloKqvbFvnpnFcHE445qsuIZrUgy+As+MZcL3pMMaU3+qYHAqqjvo18e0Oeh0vyQt4MxTBXEtC1H4SEGSHIYqbpFFGXHjnAs9ztBv7p+d1u5x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ysz6kMkz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ysz6kMkz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7B21F000E9;
	Sun, 26 Jul 2026 19:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785095705;
	bh=Qg3yyAO08xvzs5a/ep7UfAiridacUTna5Ji4syxr81Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ysz6kMkzmXNH+j9u9y+xp53bW8iMbhCiXU1X9i9p7nV9d9O5L12q+PtVzglVJW+BA
	 RVMfIi0cxiU6iQnETbYn7ZGW9+x2ZbqXXq0xheJW63v9308QYcwPp73McCnk027949
	 ZSH+8ySjQvrAAoyG/v6u8kdqwKrO2ZSaPIzr7yFbX8L8giJ4sTCiWogk+YeWx8iMQr
	 PHvSvKM9WNUsVEJrFqcQ8eFkN+mi2nIgpIeHDJd9q+NuzOvbOAtjj4RnN26P37BaAD
	 JJgacWEVdjyi2FIoYEld2q48ieFQmaqBwFRQdzUkcDzYMLWGXMFP/4Ikndlb1NdpYk
	 q27UKrZ38cA5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 19:55:05 +0000
Message-Id: <20260726195505.7A7B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] NULL pointer dereference in `imx_lcdc_crtc_helper_atomic_enabl=
e` and `imx_lcdc_update_hw_registers` when the primary plane has no framebu=
ffer.

Pre-existing issues:
- [High] Sleeping in atomic context by calling clock manipulation functions=
 from the plane `atomic_update` callback.
--

--- Patch [2]: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pi=
pe with regular atomic helpers ---
commit e5bb94188c05e612166e809c2f562025fecbb70c
Author: Ze Huang <ze.huang@oss.qualcomm.com>

drm/imx: replace struct drm_simple_display_pipe with regular atomic helpers

Convert i.MX LCDC to explicit primary plane, CRTC and encoder objects. Keep
no-scaling plane check and GEM framebuffer prepare callback from simple-KMS
path.

> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lc=
dc/imx-lcdc.c
> index e00e52c1c46ec..e0784ce0125b7 100644
> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
[ ... ]
> @@ -206,7 +211,7 @@ static void imx_lcdc_pipe_enable(struct drm_simple_di=
splay_pipe *pipe,
> =20
>  	clk_div =3D DIV_ROUND_CLOSEST_ULL(clk_get_rate(lcdc->clk_per),
>  					mode->clock * 1000);
> -	bpp =3D imx_lcdc_get_format(plane_state->fb->format->format);
> +	bpp =3D imx_lcdc_get_format(pstate->fb->format->format);

[Severity: Critical]
Can this dereference a NULL pointer if the primary plane has no framebuffer?

If a userspace process issues an atomic modeset commit that enables the CRTC
but leaves the primary plane with no framebuffer, pstate->fb would be NULL.
The drm_atomic_helper_check_crtc_primary_plane() helper checks if the
primary plane is attached, but doesn't guarantee a visible framebuffer.

Could this lead to a crash when querying the format here, or when passing
the fb to drm_fb_dma_get_gem_addr() inside imx_lcdc_update_hw_registers()
just below?

[ ... ]
> @@ -272,66 +283,151 @@ static void imx_lcdc_pipe_disable(struct drm_simpl=
e_display_pipe *pipe)
[ ... ]
> +	if (old_fb && old_fb->format !=3D fb->format)
> +		mode_changed =3D true;
> +	else if (old_crtc !=3D crtc)
> +		mode_changed =3D true;
> +
> -	if (!drm_atomic_crtc_needs_modeset(crtc->state))
> -		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
> +	if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
> +		imx_lcdc_update_hw_registers(crtc, old_crtc_state, new_crtc_state,
> +					     new_state, mode_changed);

[Severity: High]
This is a pre-existing issue, but does this sleep in an atomic context?

When userspace requests a plane update that changes the pixel format but
does not alter the display resolution, drm_atomic_crtc_needs_modeset()
evaluates to false, but mode_changed is set to true.=20

This causes imx_lcdc_update_hw_registers() to be called with mode_set=3Dtru=
e:

imx_lcdc_plane_helper_atomic_update()
  imx_lcdc_update_hw_registers(..., mode_changed);
    clk_disable_unprepare(lcdc->clk_per);

Since clk_disable_unprepare() acquires a mutex and sleeps, is it safe to
call this from the plane's atomic_update callback, which executes in
atomic context where sleeping is forbidden?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-drm-simple=
-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com?part=3D2
