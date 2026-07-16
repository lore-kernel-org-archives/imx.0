Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDC43C1992
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193672; cv=none; b=HAZEnql66YEEHdIfTIHZbHlTk1DxxAk1tZdsH0csZV8dNzEQwA1gTNhtsJGrU2nEl4yG+j00jsBXhCxl9TecMw64ExZRUmD8tlKUx94vyavp/8cC27gbGveotWznQ0Ey/K5rVhAejhs1bHdZyt8rXVZVBah3JnNwdnf8G190wcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193672; c=relaxed/simple;
	bh=pck5s4TiD3CDWPUHpWMftsWHYfpEM7tlNctFLle0wwI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cxtj6RxIwcXgcUX5owBb4YHG4XeGJ7k/YOtF7Qxqr7+xc7oumIIVPy6FIhJtFiBBPS5BszM5fHC5b+Fre8MYrLI3LGvoKETDRHX6asTuZ1m1BwDhjDtcoWd8Grasu1dlFP6acWCMyBUErNIEP16baYfTd/U+m2h8TWPIgNvSppg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjLLtH8Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjLLtH8Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A755F1F00A3A;
	Thu, 16 Jul 2026 09:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784193670;
	bh=B58Km/DKdFbZCCahpnlAGIeIC6FNei/VJUvEQJSabnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DjLLtH8QsivXomVKqQ9naBL1H9/XJ8lTfls07i0Bg/nu2dz+gwejiqolUCGIlD5cR
	 iCk5pqpTQgzazZhO4ZyqPcei0nUE3Pw4QmGYWiWXBJ4U/A+iIVNo4aaXhODZfxN+lp
	 +xNkW2dVi40iCBQwR/DVbPcAoMcVjrliUViAXSk3+e4R7NxNWk7HsKKwjVmTqB+agQ
	 XEhDxSiOCST8m1vFJ0FvBFHVODuORPip/2vQN56rCom35QjkfK/wSIbMJQrkOjd+zf
	 F09RGk10JKSEKVBZhswGhowe93gLkecZu7N6mB3GwsKrAs48CBY07Dgqs7qR8Rw37q
	 I4Ffv2SY7iJRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/8] drm/mcde: replace struct drm_simple_display_pipe
 with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org
In-Reply-To: <20260716-drm-simple-kms-removal-v2-3-1133a8fc3785@oss.qualcomm.com>
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
 <20260716-drm-simple-kms-removal-v2-3-1133a8fc3785@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 09:21:09 +0000
Message-Id: <20260716092109.A755F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Race condition in atomic commit causing display hang in oneshot mo=
de due to premature hardware start.
--

--- Patch [3]: [PATCH v2 3/8] drm/mcde: replace struct drm_simple_display_p=
ipe with regular atomic helpers ---
commit 24a767bb6a2c4adfefe9e0a5de7e9c8bbe7b2a64
Author: Ze Huang <ze.huang@oss.qualcomm.com>

drm/mcde: replace struct drm_simple_display_pipe with regular atomic helpers

Convert MCDE to explicit plane, CRTC and encoder objects. Handle pending
page-flip events from the CRTC atomic flush path using the commit-local
CRTC state.

> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/m=
cde_display.c
> index 257a6e84dd583..86edf94c52372 100644
> --- a/drivers/gpu/drm/mcde/mcde_display.c
> +++ b/drivers/gpu/drm/mcde/mcde_display.c
[ ... ]
> @@ -1381,44 +1398,13 @@ static void mcde_set_extsrc(struct mcde *mcde, u3=
2 buffer_address)
> -static void mcde_display_update(struct drm_simple_display_pipe *pipe,
> -				struct drm_plane_state *old_pstate)
> +static void mcde_plane_helper_atomic_update(struct drm_plane *plane,
> +					    struct drm_atomic_commit *commit)
>  {
> -	struct drm_crtc *crtc =3D &pipe->crtc;
> -	struct drm_device *drm =3D crtc->dev;
> -	struct mcde *mcde =3D to_mcde(drm);
> -	struct drm_pending_vblank_event *event =3D crtc->state->event;
> -	struct drm_plane *plane =3D &pipe->plane;
> -	struct drm_plane_state *pstate =3D plane->state;
> +	struct drm_plane_state *pstate =3D drm_atomic_get_new_plane_state(commi=
t, plane);
> +	struct mcde *mcde =3D to_mcde(plane->dev);
>  	struct drm_framebuffer *fb =3D pstate->fb;
> =20
> -	/*
> -	 * Handle any pending event first, we need to arm the vblank
> -	 * interrupt before sending any update to the display so we don't
> -	 * miss the interrupt.
> -	 */
> -	if (event) {
[ ... ]
> -		spin_unlock_irq(&crtc->dev->event_lock);
> -	}
> -
>  	/*
>  	 * We do not start sending framebuffer updates before the
>  	 * display is enabled. Update events will however be dispatched
[ ... ]
> -static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pi=
pe)
> +static void mcde_crtc_helper_atomic_flush(struct drm_crtc *crtc,
> +					  struct drm_atomic_commit *commit)
> +{
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(com=
mit, crtc);
> +	struct drm_pending_vblank_event *event =3D crtc_state->event;
> +
> +	/*
> +	 * Handle any pending event first, we need to arm the vblank
> +	 * interrupt before sending any update to the display so we don't
> +	 * miss the interrupt.
> +	 */
> +	if (!event)
> +		return;

[Severity: High]
Does this split introduce a race condition that could hang the pipeline in
oneshot mode?

Because the DRM core executes the plane's atomic_update callback before the
CRTC's atomic_flush callback, the hardware flow is now started before the
vblank event is armed.

If mcde_start_flow() is triggered during mcde_plane_helper_atomic_update()
(which happens just below the quoted block), it could complete the hardware
transfer and fire its interrupt before the vblank event gets armed later in
mcde_crtc_helper_atomic_flush().

The relocated comment in atomic_flush still notes this exact requirement:
"we need to arm the vblank interrupt before sending any update to the
display so we don't miss the interrupt."

If the interrupt fires early in oneshot mode, it will be missed, and the
atomic commit could wait indefinitely for an event that will never complete.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-drm-simple=
-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com?part=3D3
