Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329A310785
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 18:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783190698; cv=none; b=MAUkyHQvzkD7tQzImvhnjv8XP23iQiZh/P+ttWx20I/D7v8W//1Vj2HG5ccaByreWjp5BKvBaV8aCGNamstonbPnHg8L54DqdtMA4FIc9P7FAXfT0fqPOXKYlCKUjhoETwsdhVDxO9j6S85HuaaE0VtKYdiV5Ne199xIknGAvAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783190698; c=relaxed/simple;
	bh=JegZhY/fhj4sOg+hvjhIdAeei2IFuBsxTXtOuld7bK4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YjRJ9BoVGz/E35OzAO4RqqpVANFuokDK+8Y7DusqZgsLHxmsJLRrebAH97X6wTMrlizXViDiUntiYoUoUK0VyPU4l5laXLiBsttWX0oinB2yLJ7Xsyk4DR4J/rZpJDKDI0qiheJmGfNgDmktk5LdNCU/bcusZwhh6ATpZgJgPCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCr7elIw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCr7elIw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1571F000E9;
	Sat,  4 Jul 2026 18:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783190696;
	bh=I5Vu61LKKFfbTTQae4kiyjhSdddb7fSe0IGAeHuVz2E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hCr7elIwj9lXTt3wNgjS4R9ShYaVLXl4exsrB6ek56hQuGxvgx/HHdNKfpaF/jZF3
	 RLgFlba3p8VL2jkAtKMFfrkpbUAMI6oEfmoavwsp/kjWnhYqfnD7sQJ4Wht33KfOic
	 xIVczENgo/vYCoIesJsdMAjgQ/S6K4RNwAN2I+OhzaF9FklhNsjD8rw5p7Fe6Yd5X2
	 TKH3XhSgmh8Yil7IhvRGb7Omq3onLvQN+SJNBpoaFMsteujgsuaBd7uthDu3nO0xUQ
	 8yMI6laeVDTrMFnbfmxwj1k9IWurwZMVcmf1gjONTBGUAS6wnFP6GNP5baKayMTtTP
	 WQi6PD/grnkOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] drm/mcde: replace struct drm_simple_display_pipe
 with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260705-drm-simple-kms-removal-v1-4-b4e1ca053623@oss.qualcomm.com>
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
 <20260705-drm-simple-kms-removal-v1-4-b4e1ca053623@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 18:44:56 +0000
Message-Id: <20260704184456.8C1571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Uninitialized NULL pointer dereference when attaching encoder =
to connector.

Pre-existing issues:
- [High] Atomic callbacks directly access global `obj->state` pointers inst=
ead of using the state passed in the `drm_atomic_commit` parameter.
--

commit 098f44a54758ae5b340970e3384cc9330909fb06
Author: Ze Huang <ze.huang@oss.qualcomm.com>

drm/mcde: replace struct drm_simple_display_pipe with regular atomic helpers
   =20
Convert MCDE to explicit plane, CRTC and encoder objects.
   =20
Keep FIFO, event and framebuffer update sequencing intact, and install
GEM framebuffer prepare callback explicitly.

> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/m=
cde_display.c
> index 257a6e84dd583..4d86fa5030ebf 100644
> --- a/drivers/gpu/drm/mcde/mcde_display.c
> +++ b/drivers/gpu/drm/mcde/mcde_display.c

[ ... ]

> @@ -1149,16 +1171,14 @@ static void mcde_setup_dsi(struct mcde *mcde, con=
st struct drm_display_mode *mod
>  	*dsi_formatter_frame =3D formatter_frame;
>  }
> =20
> -static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
> -				struct drm_crtc_state *cstate,
> -				struct drm_plane_state *plane_state)
> +static void mcde_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					   struct drm_atomic_commit *state)
>  {
> -	struct drm_crtc *crtc =3D &pipe->crtc;
> -	struct drm_plane *plane =3D &pipe->plane;
>  	struct drm_device *drm =3D crtc->dev;
>  	struct mcde *mcde =3D to_mcde(drm);
> +	struct drm_crtc_state *cstate =3D crtc->state;

[Severity: High]
This isn't a bug introduced by this patch, as it was inherited from the
simple-kms implementation, but does this newly added line introduce a data
race?

In non-blocking commits, the DRM core asynchronously executes the worker
thread while simultaneously swapping the global state pointers. Reading the
global crtc->state here instead of fetching the new state from the state
parameter (e.g. using drm_atomic_get_new_crtc_state()) can race with
subsequent commits, potentially programming the hardware with mismatched
states.

[ ... ]

> -static void mcde_display_update(struct drm_simple_display_pipe *pipe,
> -				struct drm_plane_state *old_pstate)
> +static void mcde_plane_helper_atomic_update(struct drm_plane *plane,
> +					    struct drm_atomic_commit *state)
>  {
> -	struct drm_crtc *crtc =3D &pipe->crtc;
> -	struct drm_device *drm =3D crtc->dev;
> -	struct mcde *mcde =3D to_mcde(drm);
> -	struct drm_pending_vblank_event *event =3D crtc->state->event;
> -	struct drm_plane *plane =3D &pipe->plane;
> +	struct drm_crtc *crtc =3D plane->state->crtc;
> +	struct drm_device *drm;
> +	struct mcde *mcde;
> +	struct drm_pending_vblank_event *event;
>  	struct drm_plane_state *pstate =3D plane->state;
>  	struct drm_framebuffer *fb =3D pstate->fb;
> =20
> +	if (!crtc)
> +		return;
> +
> +	drm =3D crtc->dev;
> +	mcde =3D to_mcde(drm);
> +	event =3D crtc->state->event;

[Severity: High]
This is a pre-existing issue, but does accessing crtc->state->event here
continue to expose a time-of-check to time-of-use race?

If a compositor queues multiple rapid non-blocking commits, reading the eve=
nt
from the global state might clear the event belonging to a subsequent commi=
t,
leaving the later commit's worker with a NULL event and hanging the composi=
tor
waiting for a page flip.

[ ... ]

> @@ -1510,11 +1577,30 @@ int mcde_display_init(struct drm_device *drm)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D drm_simple_display_pipe_init(drm, &mcde->pipe,
> -					   &mcde_display_funcs,
> -					   formats, ARRAY_SIZE(formats),
> -					   NULL,
> -					   mcde->connector);
> +	ret =3D drm_universal_plane_init(drm, &mcde->plane, 0,
> +				       &mcde_plane_funcs,
> +				       formats, ARRAY_SIZE(formats),
> +				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_plane_helper_add(&mcde->plane, &mcde_plane_helper_funcs);
> +
> +	ret =3D drm_crtc_init_with_planes(drm, &mcde->crtc, &mcde->plane,
> +					NULL, &mcde_crtc_funcs, NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_crtc_helper_add(&mcde->crtc, &mcde_crtc_helper_funcs);
> +
> +	ret =3D drm_encoder_init(drm, &mcde->encoder, &mcde_encoder_funcs,
> +			       DRM_MODE_ENCODER_NONE, NULL);
> +	if (ret)
> +		return ret;
> +
> +	mcde->encoder.possible_crtcs =3D drm_crtc_mask(&mcde->crtc);
> +
> +	ret =3D drm_connector_attach_encoder(mcde->connector, &mcde->encoder);

[Severity: Critical]
Will this lead to a NULL pointer dereference during probe?

mcde->connector appears to be a zero-initialized struct member that is not
allocated or populated prior to this call. Because
drm_connector_attach_encoder() unconditionally dereferences the connector
argument, passing it a NULL pointer will lead to an immediate kernel oops.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-drm-simple=
-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com?part=3D4
