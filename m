Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2762377EB2
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095875; cv=none; b=d2PcQIKSDhmj7Yy8a4da5qfSzvZKQ1SWEYCu5NKTYsL/9S5XYm0W23JQdQ5Cvu2hBUDosLJTsg+WunQ41jga9Lkbc7CJuRB/9SvmsgtTGRvWO1Jit7oQfl6mCTKGYR7tlof2nmUKRwtXHUpGAVJ0Pln5CXBP09B2Ev5KFCczbxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095875; c=relaxed/simple;
	bh=ik2XEMOfBpGWZtmZuK1egQ749qOYLqdR7681nNqTXrM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dMz7M0/61RnCIyY1XEXS3euA7TJV7itNXPuSFcsSTMW9BMyVVcyzyzHTMiawlRJ16P5E4RKrolNGfqUOrQzgPlj8tih1J8u60dTG8IiYrKOy/sn8oC6fbbmUTq9y5ZYiePe9Uti0l0y5zFn2g/ObY7H8LKt3oFQuQ16TIA4Wj1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OoGEK7WY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OoGEK7WY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C951F000E9;
	Sun, 26 Jul 2026 19:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785095873;
	bh=48REdzdUOPOuhBW+tJpLoGURrMlZdR8K5k8UuJ0dBHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OoGEK7WY5ITyJp1t98Hjk2Y2AD/PGbH1ReSk8X56iRnHJ/pbqPmkacuqKiXE9tCLx
	 0mO/CfdQdFjj333AYdTedciZknweFmNrY1i/6LdHIy7zAloLxzwzVADnpl6pI5Qtru
	 j1NnnY3L/fCH1kecNNP9KXdxOEsD7pM5xrWJv3/9ZgCvzZDmMu1x0n2kaPQtkcjauB
	 THaZU9BLvpOIMHJWHJkcsiDWnRJlmp0Nm/sBc6uca2RlTzb8ATAJL3C75UtJH+T8MK
	 xIpGo3yKjfXwm/r7iO4Q4c2dAKVCdy6yyMexLp9tKlAzrvIII6rIyuG6R/gTHAX/Wh
	 D8LW4lmFWYoIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/8] drm/mcde: replace struct drm_simple_display_pipe
 with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260727-drm-simple-kms-removal-v3-3-cd5dc89858c6@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-3-cd5dc89858c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 19:57:52 +0000
Message-Id: <20260726195753.39C951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Sleeping functions called from atomic context in CRTC callbacks
--

--- Patch [3]: [PATCH v3 3/8] drm/mcde: replace struct drm_simple_display_p=
ipe with regular atomic helpers ---
commit ba616a75cb8eb47f91848c4e4530a9f09433e557
Author: Ze Huang <ze.huang@oss.qualcomm.com>

drm/mcde: replace struct drm_simple_display_pipe with regular atomic helpers
   =20
Convert MCDE to explicit plane, CRTC and encoder objects.
   =20
Handle pending page-flip events from the CRTC atomic flush path using the
commit-local CRTC state, and avoid manual connector/encoder attachment
before the connector has been created by the bridge path.

> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/m=
cde_display.c
> index 257a6e84dd583..50c90cf84a9a3 100644
> --- a/drivers/gpu/drm/mcde/mcde_display.c
> +++ b/drivers/gpu/drm/mcde/mcde_display.c
[ ... ]
> @@ -1149,16 +1168,15 @@ static void mcde_setup_dsi(struct mcde *mcde, con=
st struct drm_display_mode *mod
>  	*dsi_formatter_frame =3D formatter_frame;
>  }
> =20
> -static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
> -				struct drm_crtc_state *cstate,
> -				struct drm_plane_state *plane_state)
> +static void mcde_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					   struct drm_atomic_commit *commit)

[Severity: High]
This is a pre-existing issue and not a regression introduced by this patch,
but does this function call sleeping APIs from an atomic context?

During non-blocking commits, CRTC atomic callbacks execute in an atomic
context where sleeping is not allowed. Looking at the implementation of
mcde_crtc_helper_atomic_enable() in the wider context, it eventually calls
regulator_enable() and clk_prepare_enable(), which can sleep.

Can this lead to kernel warnings or deadlocks when this path is invoked?

>  {
> -	struct drm_crtc *crtc =3D &pipe->crtc;
> -	struct drm_plane *plane =3D &pipe->plane;
>  	struct drm_device *drm =3D crtc->dev;
>  	struct mcde *mcde =3D to_mcde(drm);
[ ... ]
> @@ -1298,9 +1316,10 @@ static void mcde_display_enable(struct drm_simple_=
display_pipe *pipe,
>  	dev_info(drm->dev, "MCDE display is enabled\n");
>  }
> =20
> -static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
> +static void mcde_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +					    struct drm_atomic_commit *commit)

[Severity: High]
This isn't a bug introduced by this patch, but does the disable callback al=
so
sleep in an atomic context?

Similar to the enable path, mcde_crtc_helper_atomic_disable() runs in an
atomic context during non-blocking commits. However, it calls
regulator_disable(), clk_disable_unprepare(), and directly invokes
usleep_range().=20

Could these sleeping functions cause system instability when called from th=
is
atomic callback?

>  {
> -	struct drm_crtc *crtc =3D &pipe->crtc;
> +	struct drm_crtc_state *cstate =3D drm_atomic_get_new_crtc_state(commit,=
 crtc);
>  	struct drm_device *drm =3D crtc->dev;
>  	struct mcde *mcde =3D to_mcde(drm);
[ ... ]
> +static void mcde_crtc_helper_atomic_flush(struct drm_crtc *crtc,
> +					  struct drm_atomic_commit *commit)
> +{
> +	struct mcde *mcde =3D to_mcde(crtc->dev);
> +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state(=
commit, &mcde->plane);
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(com=
mit, crtc);
> +	struct drm_pending_vblank_event *event =3D crtc_state->event;
[ ... ]
> -	/*
> -	 * We do not start sending framebuffer updates before the
> -	 * display is enabled. Update events will however be dispatched
> -	 * from the DRM core before the display is enabled.
> -	 */
> -	if (fb) {
> -		mcde_set_extsrc(mcde, drm_fb_dma_get_gem_addr(fb, pstate, 0));
> -		dev_info_once(mcde->dev, "first update of display contents\n");
> -		/*
> -		 * Usually the flow is already active, unless we are in
> -		 * oneshot mode, then we need to kick the flow right here.
> -		 */
> -		if (mcde->flow_active =3D=3D 0)
> -			mcde_start_flow(mcde);
> -	} else {
> -		/*
> -		 * If an update is receieved before the MCDE is enabled
> -		 * (before mcde_display_enable() is called) we can't really
> -		 * do much with that buffer.
> -		 */
> -		dev_info(mcde->dev, "ignored a display update\n");
> -	}
> +	if (crtc_state->active && plane_state && plane_state->fb && mcde->flow_=
active =3D=3D 0)
> +		mcde_start_flow(mcde);

[Severity: High]
This is also a pre-existing issue, but does mcde_start_flow() ultimately
sleep?

Inside mcde_crtc_helper_atomic_flush(), the code calls mcde_start_flow().
If mcde_start_flow() disables the FIFO via mcde_disable_fifo(), it appears
to use usleep_range() to wait for the FIFO to drain. Since atomic_flush()
runs in an atomic context during non-blocking commits, can this sleeping
function cause issues here as well?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-drm-simple=
-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com?part=3D3
