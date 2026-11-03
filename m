Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687957;
	b=BFxhoAXv2KlJUqmcBkc6Cz57T20z7vzFoVOfpEwGTz5qClFb+Hqp6l0s37mims7sQCyY
	 VrVWBk3ii1WHs7DXcR0qmcbKUcyll1TsMRrZ6BiunTfUyktBHMQ9UX6JUHcRbZRzI5tzv
	 HBB3F8ybYedwpob32v3V0RsMVs3H8xRPKqNISaOyijCEqdk/hrV5XF2dVPKB78eWv+LXq
	 VQx9DV6Q9thb5czCmwhAJMTyFLy2b3qdvKgOpuYybmNctSWuWdBy4Gjuoi/GIzf3eWIRL
	 5kfmQVzO8vuMA+yPlo7ilONyTIj5ql7GFOOxhBbrXcZAUwwuK+I4J/ayMllXaOrLKZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687957;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lSYvc//2evcuVvvfbgkvtGMf4hbeH9dEG3g0YeldfH8=;
	b=zApoxyMDOvntR8T15LhmzOuSQcwK8u5mnvqjsiRzRE1nrGvtAsvq665XZWFfFmxgTlZl
	 j7LVW00CawotJovjQAPixDjVMjGp75FCoGbGpBcfAiVxTHXytlOQBXSjRpH6tGlD5Tkud
	 f4Sis3J/wj2I9gSe6bbKDt/Zjpsj/Nb/piFxx1Zc92jkWOjs/j+vtWYcPefz4inVS9z1J
	 sWM/bWbQlyCim1maElacIBb+g+GJGaGiv6YIChulxXHG/lX2LMfF1JrkRQIJ/wzpe5iC6
	 QDty1Y3hz+IfHlhrHA+RyQoMb9PsGQXLMNKL2S4h+B35UTrgLQ384dI2NlFScn8KJQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JYuuwOrB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32288606A324;
	Tue,  3 Nov 2026 06:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JYuuwOrB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AE61F000C1;
	Tue,  3 Nov 2026 06:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793687956;
	bh=lSYvc//2evcuVvvfbgkvtGMf4hbeH9dEG3g0YeldfH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JYuuwOrBIzz7fLQ67ZBuvME0tdnr7gVl0ZNb/E3fXqyFJGWYDAxE4SnCyIcTga8c1
	 nKplLFcvCvy3Ah247q5rQrSoN9uOaoQX7UqIbyMpIuDycmsELciHNX4NJCq7WsVsyd
	 miMIdtWz606jBZyrkZTrQSxEx5ZdiKjsBQo0OvxBVJ6W27ymZ5jNQ0vnzODm0qtlox
	 75ySdzoh9D3EqdcDzSQERO5aTQBZvQWfSzSeMO+nq+a7vd6oqZgoU2sSWV2ageKFzf
	 8yJ+h1nQHVT8xfDtJNVoo9sqeg4OE5dgvRDKDhuN67dTmgb473x24cxUFOGc5ncv0s
	 embgxrFlB27xg==
Message-ID: <sashiko-outbox-194651@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 04/16] drm/imx: dc-kms: Use driver specific
 .atomic_commit_tail callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103-imx8-dc-prefetch-v9-4-3b985e7636e2@nxp.com>
References: <20261103-imx8-dc-prefetch-v9-0-3b985e7636e2@nxp.com>
 <20261103-imx8-dc-prefetch-v9-4-3b985e7636e2@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:39:15 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/imx: dc: plane disable skipped on modeset in dc_drm_atomic_com=
mit_tail()
--

commit ff022f683849ca82589cd00028c8fb7c412423dc
Author: Liu Ying <victor.liu@nxp.com>

drm/imx: dc-kms: Use driver specific .atomic_commit_tail callback

This commit introduces a custom atomic_commit_tail callback for the i.MX8qxp
Display Controller KMS driver that passes DRM_PLANE_COMMIT_ACTIVE_ONLY and
DRM_PLANE_COMMIT_NO_DISABLE_AFTER_MODESET to drm_atomic_helper_commit_plane=
s()
to avoid accessing plane registers while clocks are disabled.

> diff --git a/drivers/gpu/drm/imx/dc/dc-kms.c b/drivers/gpu/drm/imx/dc/dc-=
kms.c
> index 0e2ce6a425487..9ffa15ac43a25 100644
> --- a/drivers/gpu/drm/imx/dc/dc-kms.c
> +++ b/drivers/gpu/drm/imx/dc/dc-kms.c
[ ... ]
> @@ -30,6 +31,29 @@ static const struct drm_mode_config_funcs dc_drm_mode_=
config_funcs =3D {
>  	.atomic_commit =3D drm_atomic_helper_commit,
>  };
> =20
> +static void dc_drm_atomic_commit_tail(struct drm_atomic_commit *state)
> +{
> +	struct drm_device *dev =3D state->dev;
> +
> +	drm_atomic_helper_commit_modeset_disables(dev, state);
> +
> +	drm_atomic_helper_commit_planes(dev, state,
> +					DRM_PLANE_COMMIT_ACTIVE_ONLY |
> +					DRM_PLANE_COMMIT_NO_DISABLE_AFTER_MODESET);

[Severity: High]
Could passing DRM_PLANE_COMMIT_NO_DISABLE_AFTER_MODESET (and
DRM_PLANE_COMMIT_ACTIVE_ONLY) here leave the plane's FetchUnit source buffer
and LayerBlend enabled in hardware after the old framebuffer is cleaned up?

In drm_atomic_helper_commit_planes(), DRM_PLANE_COMMIT_NO_DISABLE_AFTER_MOD=
ESET
skips calling funcs->atomic_disable() when the CRTC needs a modeset:

    if (disabling && funcs->atomic_disable) {
        struct drm_crtc_state *crtc_state;

        crtc_state =3D old_plane_state->crtc->state;

        if (drm_atomic_crtc_needs_modeset(crtc_state) &&
            no_disable)
            continue;

        funcs->atomic_disable(plane, state);
    }

That flag is meant for drivers where the CRTC atomic_disable callback also
disables the CRTC's planes. However, in drivers/gpu/drm/imx/dc/dc-crtc.c,
dc_crtc_atomic_disable() only disables FrameGen and calls pm_runtime_put() =
on
the Display Engine and the shared Pixel Engine without disabling the planes:

    enable_irq(dc_crtc->irq_dec_seqcomplete);
    dc_fg_disable(dc_crtc->fg);
    DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
    disable_irq(dc_crtc->irq_dec_seqcomplete);

    dc_fg_disable_clock(dc_crtc->fg);

    /* request pixel engine power-off as plane is off too */
    pm_runtime_put(dc_drm->pe->dev);

And in drivers/gpu/drm/imx/dc/dc-plane.c, __dc_plane_atomic_disable() is wh=
at
actually disables the FetchUnit source buffer and LayerBlend:

    /* disable fetchunit in shadow */
    fu_ops =3D dc_fu_get_ops(dplane->fu);
    fu_ops->disable_src_buf(dplane->fu, DC_FETCHUNIT_FRAC0);

    /* set ExtDst's source to ConstFrame */
    dc_ed_pec_src_sel(dplane->ed, dc_cf_get_link_id(dplane->cf));

When dc_crtc_atomic_enable() runs with new_crtc_state->plane_mask =3D=3D 0,=
 it
switches ed_cont's source selection to cf_cont, but it does not call
fu_ops->disable_src_buf():

    /* show CRTC background if no plane is enabled */
    if (new_crtc_state->plane_mask =3D=3D 0) {
        /* constframe in content stream shows black frame */
        dc_cf_constantcolor_black(dc_crtc->cf_cont);

        cf_link =3D dc_cf_get_link_id(dc_crtc->cf_cont);
        dc_ed_pec_src_sel(dc_crtc->ed_cont, cf_link);
    }

If an active CRTC with an enabled primary plane undergoes a modeset while
remaining active and disables its plane in the same commit,
dc_crtc_atomic_disable() calls asynchronous pm_runtime_put(dc_drm->pe->dev)
and dc_crtc_atomic_begin() immediately calls
pm_runtime_resume_and_get(dc_drm->pe->dev) before runtime suspend runs (or =
the
second CRTC on the shared Pixel Engine keeps dc_drm->pe->dev active), so
dc_pe_runtime_resume() does not reset the Pixel Engine hardware. Because
drm_atomic_crtc_needs_modeset() is true, DRM_PLANE_COMMIT_NO_DISABLE_AFTER_=
MODESET
skips dc_plane_atomic_disable(), leaving SOURCEBUFFERENABLE and LayerBlend
enabled after drm_atomic_helper_cleanup_planes() cleans up the framebuffer.

Similarly, because drm_atomic_helper_swap_state() swaps crtc->state before
dc_drm_atomic_commit_tail() runs, plane_crtc_active(old_plane_state) evalua=
tes
to false whenever a CRTC is being disabled (new_crtc_state->active =3D=3D f=
alse).
With DRM_PLANE_COMMIT_ACTIVE_ONLY, disabling a CRTC and its plane while the
second CRTC keeps the shared dc_drm->pe->dev powered on, followed by
re-enabling the first CRTC with plane_mask =3D=3D 0, also skips
dc_plane_atomic_disable() without ever calling fu_ops->disable_src_buf().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-imx8-dc-pr=
efetch-v9-0-3b985e7636e2@nxp.com?part=3D4
