Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C423769EC
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 20:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785096008; cv=none; b=i9hw51qqS4Rq1o2FhU54qxwA0AnS2w4HvoBPQrtWmCQyzpidZC4/ellbF64rg67hQNmPm50VeYpowN2vCB9137ZFQIgF2+iJoBeIYD/9lv0y16KKi6j96m/EpTz8pG+3S0uMyYWPM4AxJX5ZrfcVotQvpIqE2PhXiXyxnnzEkkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785096008; c=relaxed/simple;
	bh=CYEFZawcujUCGT1mX5OaggGYUqDZ03dS3Wza6l81+J8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qKnBf2P07M0IHutxL6JKepNccbjY4RGXI8LV+YinO9edVFp2LXTk4Rep+peAX/RqZvtAGoFdA9lvKx04lRdj9Hmldh+MRTHO85mQFYsVpMN+9KeBvb8EogMdNn24Qt+SRtX7NL4iUZAQSJ1/FtjG59+QR9XLtVY9jEned2LIeEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIPPNXBp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIPPNXBp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687F21F00A3A;
	Sun, 26 Jul 2026 20:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785096006;
	bh=EUCVQTHiD6Y9AGYT93hTthya+FuLJpD7dlHgIWpTMmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RIPPNXBprUHbAzdecm62Tra76VN8IATARj41M14JcHYZZis5BrtszdS79mcsmKp2q
	 NAvCVAf3fPDar9W2s6YsOxuI5e86CU8avJSlIcUktAmdI6qIEkB7MvINYwj16oifjX
	 XZ8VrGePS9xo762bEvpdCWPIuzZBQWycSRHkaK8FE5W7Taiqx1MzExrjrEX3Sm8l7Z
	 RiSrN/6P9dYZ7OxWmVDPohf2Sxp/1aVGoqvvL9CksknUy0aZgN+BIx7wxP+6MuVQv0
	 t9Lsl510xwxcFKbuSeJKry0Jta4IDMa+NaGmxMZjhJ95SK2p135Hfd5rnJmUO4Kebd
	 9521FG0PGohdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/8] drm/tve200: replace struct
 drm_simple_display_pipe with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260727-drm-simple-kms-removal-v3-7-cd5dc89858c6@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-7-cd5dc89858c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 20:00:05 +0000
Message-Id: <20260726200006.687F21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling sleeping functions from CRTC atomic enable and disable cal=
lbacks violates atomic context constraints.
- [High] Setting `cstate->mode_changed =3D true` inside the plane's `atomic=
_check` callback bypasses downstream modeset routing, leaving bridges activ=
e during CRTC resets.
--

--- Patch [7]: [PATCH v3 7/8] drm/tve200: replace struct drm_simple_display=
_pipe with regular atomic helpers ---
commit c9e2ab55e3b69f124e64f349a1ced762885b2aea
Author: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: drm/tve200: replace struct drm_simple_display_pipe with regular at=
omic helpers

Convert TVE200 to explicit plane, CRTC and encoder objects. Keep generic
plane-state validation before TVE200-specific mode, alignment, pitch and
format-change checks.

> diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tv=
e200/tve200_display.c
> index 26b6c65ef6fd0..beb3a5a63b5d5 100644
> --- a/drivers/gpu/drm/tve200/tve200_display.c
> +++ b/drivers/gpu/drm/tve200/tve200_display.c
[ ... ]
> @@ -69,13 +71,34 @@ irqreturn_t tve200_irq(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
> =20
> -static int tve200_display_check(struct drm_simple_display_pipe *pipe,
> -			       struct drm_plane_state *pstate,
> -			       struct drm_crtc_state *cstate)
> +static int tve200_plane_helper_atomic_check(struct drm_plane *plane,
> +					    struct drm_atomic_commit *commit)
>  {

[Severity: High]
This is a pre-existing issue, but does setting cstate->mode_changed =3D true
inside the plane check hook bypass downstream modeset routing?

In tve200_plane_helper_atomic_check(), the code raises a mode change if the
framebuffer format changes:

    if (old_fb && old_fb->format !=3D fb->format)
            cstate->mode_changed =3D true;

In the default DRM state check sequence, plane checks are executed after the
modeset checks. Because mode_changed is raised late and the driver does not
explicitly loop back to recalculate modeset routing, the downstream
encoders and bridges may miss their disable/enable hooks. Could this leave
bridges active during a CRTC reset?

[ ... ]
> @@ -119,16 +142,72 @@ static int tve200_display_check(struct drm_simple_d=
isplay_pipe *pipe,
>  	return 0;
>  }
> =20
[ ... ]
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

[Severity: High]
This is a pre-existing issue, but does this code sleep in atomic context?

The DRM core invokes CRTC atomic enable callbacks during display commits,
which run in atomic context. However, tve200_crtc_helper_atomic_enable()
calls sleeping functions:

    clk_prepare_enable(priv->clk);
    ...
    usleep_range(30000, 50000);

I see this logic was carried over directly from the old
drm_simple_display_pipe hooks. Since sleeping in atomic context can cause
kernel warnings and potential deadlocks, is there a safe way to handle this
enable sequence?

[ ... ]
> @@ -240,9 +319,9 @@ static void tve200_display_enable(struct drm_simple_d=
isplay_pipe *pipe,
>  	drm_crtc_vblank_on(crtc);
>  }
> =20
> -static void tve200_display_disable(struct drm_simple_display_pipe *pipe)
> +static void tve200_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +					      struct drm_atomic_commit *commit)
>  {
> -	struct drm_crtc *crtc =3D &pipe->crtc;
>  	struct drm_device *drm =3D crtc->dev;
>  	struct tve200_drm_dev_private *priv =3D drm->dev_private;

[Severity: High]
This is a pre-existing issue, but similar to the enable path above, does the
disable callback also sleep in atomic context?

tve200_crtc_helper_atomic_disable() eventually calls clk_disable_unprepare(=
),
which can sleep:

    clk_disable_unprepare(priv->clk);

Since this runs in the atomic disable path, could this lead to a deadlock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-drm-simple=
-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com?part=3D7
