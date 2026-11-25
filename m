Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631481;
	b=jCSI40DQnNaNqa8Wo+EnpWS9wtXu2DfTOJUpWeOYfylmZU+Ela+9yjBfAfuiS8q/Ur0x
	 PlzyCwhmsdLOgUsp5+MUBT4GTlnqqi30Cj5/anuZmeSXg5FwuUIUZHBli21Z8HYuthK2F
	 WcXftCuB1SXISSdKpwmmB2HCmfm7VXM8nL3cgv5gk8KY5j7DlZLE0PBWEKKtVfpT2GX2M
	 maMMfBhPT2VmG2ldiWKfnRYG2D9Hb6Xd7JFkyNGPQ/AbMteAHtvvlPsBTeItkVKq71SnF
	 n96SrS6J73ewo9MHYB1Bw+t9BuDMwlspAm1m91JylvVgIkdHANP5tTy1MKWvwtBZgiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631481;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zKNz1bQSEnr4sBwByG9H6ufQYsWHlahzdhSrhSe+2ys=;
	b=uCkxhPtchHrc7InFn6hqF9BQms24gj62e2ekBFOrGW4LG3MKUzicTv+aSz/4SvF51gtE
	 Uv5P4VmoVyX9zwe2kUqArvcv4Fj91+hc5EOQdL6AWfUDzdi0n01LwfP1p/ChzoTgR1bwv
	 weGmYw1GRgU1ecji1LpwVAnbT31XpabXXKsBi++nWB2252AsrzZuE/3he56biNyAmjupq
	 uA/z7N/WM4Unnzg1xgfhogFtOzA26Ndrtu8cYxXq7u1qMCPjmGN72JtBtpynH/hHgnBQD
	 qdH0ZXxcQH6Grr0qI+OWlidgwDTfy5sxs2AMKA6pePrxoSGvB/QBRyUQ3wqirnVvz7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ka0YnnNy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A1E606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ka0YnnNy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477411F000C0;
	Wed, 25 Nov 2026 18:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631481;
	bh=zKNz1bQSEnr4sBwByG9H6ufQYsWHlahzdhSrhSe+2ys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ka0YnnNy05t3dMAdSLki1Ink/74uS0DyRVMVqc355j66p7dbRZFAjp3cqe0KxKWTJ
	 O352EDkmTNMmGlpajacHjpGnJ1ZaJy4Xz0/5FgT8p1Cldvrdsw3bfdGTHuiQgPNYxW
	 N1z24p5DgPtuWYlzmSjOxTYR59OAq4U/DYThMMVQqqS1UXFzeWiLB0F9UF7B1wenuf
	 l8TIDN9AoZxK06N1HLR8k4ISSgGU4IQtzjnoc6AZhplLpaToJ2J47d+BP8Uvm0W3P1
	 xjvvy/M5nn4gi7boyNAMSOGVSChSOLHo8J7AjAIxFhoixLyO+08rOv3NXPA760q0bc
	 I/rKQRAOhv6cQ==
Message-ID: <sashiko-outbox-233998@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 32/32] drm/mxsfb/lcdif: enable bridge hotplug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261125-drm-bridge-hotplug-v4-32-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
 <20261125-drm-bridge-hotplug-v4-32-822722850492@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:31:20 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] drm/mxsfb/lcdif: missing connector when last bridge lacks
  get_next_bridge()
- [High] drm/mxsfb/lcdif: missing client hotplug notification in
  lcdif_hotplug_event()
- [High] drm: double bridge attach in drm_hotplug_helper_try_complete()
- [Medium] drm/mxsfb/lcdif: poll_init and drmm_hotplug_helper_init
  lifetime mismatch
--

commit d0177b7f727becda395d8ff3eb1f0fa798651116
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/mxsfb/lcdif: enable bridge hotplug

This commit switches the i.MX LCDIF driver to drmm_hotplug_helper_init() to
manage bridge attachment and dynamic connector creation, and moves
drm_kms_helper_poll_init() earlier in lcdif_load() so per-connector HPD
polling can be toggled from the hotplug callback.

> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index 2be5a76e936f6..591653b39310c 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
[ ... ]
> @@ -44,6 +44,19 @@ static const struct drm_mode_config_helper_funcs lcdif=
_mode_config_helpers =3D {
>  	.atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
>  };
> =20
> +static void lcdif_hotplug_event(enum drm_hotplug_helper_event event,
> +				struct drm_connector *connector)
> +{
> +	switch (event) {
> +	case DRM_HOTPLUG_HELPER_CONNECTOR_ADDED:
> +		drm_kms_helper_poll_enable_connector(connector);
> +	break;
> +	case DRM_HOTPLUG_HELPER_CONNECTOR_REMOVING:
> +		drm_kms_helper_poll_disable_connector(connector);
> +		break;
> +	}
> +}

[Severity: High]
Does lcdif_hotplug_event() miss notifying in-kernel DRM clients and running
initial HPD detection when a connector is added after lcdif_load()?

With drmm_hotplug_helper_init(), lcdif_attach_bridge() no longer defers
probe while waiting for downstream bridges, so drm_helper_hpd_irq_event()
and drm_client_setup() can run before any connector exists.  When the
bridge chain completes later, drm_bridge_connector_dynamic_add() registers
the connector (emitting a sysfs uevent without calling
drm_client_dev_hotplug()), and drm_kms_helper_poll_enable_connector() does
not schedule output_poll_work for fixed panels (polled =3D=3D 0) or HPD-IRQ
connectors (polled =3D=3D DRM_CONNECTOR_POLL_HPD).  As a result, fbdev/fbcon
is never set up and HPD-IRQ connectors stay in connector_status_unknown.

[ ... ]
> @@ -80,16 +86,10 @@ static int lcdif_attach_bridge(struct lcdif_drm_priva=
te *lcdif)
> =20
>  		encoder->possible_crtcs =3D drm_crtc_mask(&lcdif->crtc);
> =20
> -		ret =3D drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_=
CONNECTOR);
> -		if (ret)
> -			return dev_err_probe(dev, ret,
> -					     "Failed to attach bridge for endpoint%u\n",
> -					     of_ep.id);
> -
> -		connector =3D drm_bridge_connector_init(lcdif->drm, encoder);
> -		if (IS_ERR(connector))
> -			return dev_err_probe(dev, PTR_ERR(connector),
> -					     "Failed to init bridge_connector for endpoint%u\n",
> +		hotplug_helper =3D drmm_hotplug_helper_init(encoder, lcdif_hotplug_eve=
nt, ep);
> +		if (IS_ERR(hotplug_helper))
> +			return dev_err_probe(dev, PTR_ERR(hotplug_helper),
> +					     "Failed to init hotplug_helper for endpoint%u\n",
>  					     of_ep.id);
>  	}

[Severity: High]
Will drmm_hotplug_helper_init() fail to create a connector on LCDIF
pipelines whose last bridge does not implement DRM_BRIDGE_OP_GET_NEXT_BRIDG=
E?

Previously, lcdif_attach_bridge() unconditionally created the connector
with drm_bridge_connector_init() after drm_bridge_attach().  Now connector
creation in drm_hotplug_helper_try_complete() is gated on
drm_hotplug_helper_bridge_chain_is_complete(), which calls
drm_bridge_get_next() on the last bridge and only returns true when that
returns NULL.  On i.MX8MP boards using tc358767 as a DisplayPort terminal
bridge (such as imx8mp-dhcom-pdk3-overlay-732-100-x36.dtso), tc358767 does
not set DRM_BRIDGE_OP_GET_NEXT_BRIDGE, so drm_bridge_get_next() warns and
returns ERR_PTR(-ENOENT) and the connector is never created.

[Severity: High]
Can switching to drmm_hotplug_helper_init() cause last_bridge->funcs->attac=
h()
to be called a second time on an already-attached bridge?

When a downstream bridge in a multi-bridge chain is removed (or when the
terminal bridge lacks DRM_BRIDGE_OP_GET_NEXT_BRIDGE so
hotplug_helper->connector stays NULL), the upstream bridge remains attached
as last_bridge in encoder->bridge_chain.  On the next DRM_BRIDGE_ADDED or
DRM_MIPI_DSI_ATTACHED notification, drm_hotplug_helper_try_complete() hits
the if (last_bridge) branch:

drivers/gpu/drm/display/drm_hotplug_helper.c:drm_hotplug_helper_try_complet=
e() {
    ...
	if (last_bridge) {
		dev_dbg(dev, "propagate attach after %ps\n", last_bridge->funcs);

		err =3D last_bridge->funcs->attach(last_bridge, hotplug_helper->encoder,
						 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
    ...
}

Besides dereferencing last_bridge->funcs->attach without a NULL check,
re-invoking funcs->attach() on an already-attached bridge (such as
ti-sn65dsi86 or tc358767, which call drm_dp_aux_register() in their attach
callbacks before attaching the next bridge) re-registers an initialized
drm_dp_aux i2c adapter kobject and unregisters the active DP AUX channel if
downstream attachment fails.

> @@ -176,6 +176,8 @@ static int lcdif_load(struct drm_device *drm)
>  	/* Start with vertical blanking interrupt reporting disabled. */
>  	drm_crtc_vblank_off(&lcdif->crtc);
> =20
> +	drm_kms_helper_poll_init(drm);
> +
>  	ret =3D lcdif_attach_bridge(lcdif);
>  	if (ret)
>  		return ret;

[Severity: Medium]
Does pairing unmanaged drm_kms_helper_poll_init() with
drmm_hotplug_helper_init() leave polling uncleaned on probe failure and
out of order with hotplug teardown on unbind?

If lcdif_attach_bridge(), drm_mode_config_create_initial_state() or IRQ
setup fails in lcdif_load(), lcdif_probe() jumps to err_free without
calling lcdif_unload() or drm_kms_helper_poll_fini().  On driver unbind,
lcdif_unload() runs drm_kms_helper_poll_fini() (setting poll_enabled =3D fa=
lse)
before final drm_dev_put() releases drmm_hotplug_helper_init(); if
userspace holds an open DRM fd across unbind, a bridge hotplug event before
the fd closes will call lcdif_hotplug_event() ->
drm_kms_helper_poll_enable_connector() and hit
drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled).  Using
drmm_kms_helper_poll_init() before lcdif_attach_bridge() and dropping
drm_kms_helper_poll_fini() from lcdif_unload() would align both lifetimes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-drm-bridge=
-hotplug-v4-0-822722850492@bootlin.com?part=3D32
