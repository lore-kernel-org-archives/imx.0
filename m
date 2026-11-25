Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631429;
	b=n10CwG4GdiCsyDEnS77xZHhj1Db2GNFseO01WtMOyucRlycWwMOaLRVSGnR3aB0j9uwo
	 CNP7J/uFzqICrE2lhQk8fgHgTJTu+/2751TNzJ5SJm7NMrit+mZVnR2y4EIZDvHMCoB+c
	 /2tiF3qitvfXU3Dta/3XqnvGRH0cEqCPOH1YPUtDCXpAdXtLOOMAAq56G8LhEUPeHtlCJ
	 ohi4j35SF/sdHxH7+wPRD0IS/nism0kH5sUaibdZdu9ruWTGORDnDghuHnpiejpQdhLod
	 gxeP5646Hf9rqZyWe4Sr6jEaPi/PWzNrmVFNnFjtnzmZKHmiCc+hkE6Xn/nqKf+tJ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631429;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=46pMcVt426JErUEmjzWVfut1e7CryNKTTLYGlbDiuPw=;
	b=Hun+PMgGHJX0YUMqkqP6rvMcpMW1/TXqeaBfrjGqUCu4lLYlTwdSzXGlnOoU1JAjqn6O
	 GThNG78jnbHittTX/ard1muzEko2MHfy4PVSt3w6Hjp60bmbBjm3sl50NsHkrht/lnDZL
	 YHiIK1qvnBvlzKY/olX0aMnnqljcVk2w761CTD5I2CqVditdvv8Mpak2zA0ifQaiPtN4v
	 4yDHko6XHZtABbI8aH2SaPSwsbnduFcuagSipX640SzBnEtqUxvlHECx2EZGVgQNz1L7+
	 BjU4bA0925iHVGlKE8oz16Qpjxn6Rtui4893Eq2sqnNQ1DM1PJXehriodXv1++bkIFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HWYwGGn2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF66606A31E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HWYwGGn2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AB91F000C6;
	Wed, 25 Nov 2026 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631429;
	bh=46pMcVt426JErUEmjzWVfut1e7CryNKTTLYGlbDiuPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HWYwGGn2g0UvXjIqS4O5cKMYDw4G3rFWonAizuLys7/tsIY8i4X4od1BsWrx5OTh3
	 9ZnaaD7A0HD/0OSEEfx2GU7qBHzsFOoYquDR/VuRSSDJwEYF2mbm/fknkWw0AqHFCh
	 p3ctfgQ7iFMyuT+GK3hiQSdysQEI7BWz+caIqSZCgzxPSC3TQudOJyYxg/FMmkmvE1
	 D1So4qXWiLHbFFTqjCC3/1lTTVpv8lPAUwY5sofbM79jkouazTXxyQwegdnjLADPWn
	 LP+IhFpz7ecLkdqRrHgbijGPnPrxgx5wYux2NfesQit8Xt1+D6tK+LjwBAcXEGfnUh
	 bE9HCEByYTrXg==
Message-ID: <sashiko-outbox-233995@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 31/32] drm: drm_hotplug_helper: new helper to
 implement bridge hotplug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261125-drm-bridge-hotplug-v4-31-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
 <20261125-drm-bridge-hotplug-v4-31-822722850492@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:30:28 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] drm: invalid direct attach() call in
  drm_hotplug_helper_try_complete()
- [Medium] drm: drmm_hotplug_helper_init() returns NULL on success
- [Medium] drm: race with bridge detach in
  drm_hotplug_helper_try_complete()
- [Low] drm: missing forward declarations and broken kdoc in
  drm_hotplug_helper.h
- [Low] drm: MAINTAINERS hotplug helper entry claims all bridge DT
  bindings
--

commit 965c3e7b932068825241acd70d8d77673075709c
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm: drm_hotplug_helper: new helper to implement bridge hotplug

This commit adds drmm_hotplug_helper_init() to listen for DRM bridge hotplug
events, attach the encoder's bridge chain, and dynamically add or remove a
drm_bridge_connector as the pipeline completes or breaks.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index a5e2bf15e59f2..18ecb7bb39f40 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8219,6 +8219,14 @@ F:	Documentation/devicetree/bindings/npu/rockchip,=
rk3588-rknn-core.yaml
>  F:	drivers/accel/rocket/
>  F:	include/uapi/drm/rocket_accel.h
> =20
> +DRM BRIDGE HOTPLUG HELPER
> +M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/bridge/
> +F:	drivers/gpu/drm/display/drm_hotplug_helper.c
> +F:	include/drm/drm_hotplug_helper.h
> +
>  DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
>  M:	Oded Gabbay <ogabbay@kernel.org>
>  L:	dri-devel@lists.freedesktop.org

[Severity: Low]
Should the Documentation/devicetree/bindings/display/bridge/ line be dropped
here?  That path covers all bridge chip bindings (already listed under DRM
DRIVERS FOR BRIDGE CHIPS), whereas drm_hotplug_helper is an in-kernel helper
with no devicetree bindings of its own.

> diff --git a/drivers/gpu/drm/display/drm_hotplug_helper.c b/drivers/gpu/d=
rm/display/drm_hotplug_helper.c
> new file mode 100644
> index 0000000000000..ea32bdb0af8f3
> --- /dev/null
> +++ b/drivers/gpu/drm/display/drm_hotplug_helper.c

[ ... ]

> +static void drm_hotplug_helper_try_complete(struct drm_hotplug_helper *h=
otplug_helper)
> +{
> +	struct device *dev =3D hotplug_helper->encoder->dev->dev;
> +	int err;
> +
> +	WARN_ON(!mutex_is_locked(&hotplug_helper->event_mutex));
> +
> +	/*
> +	 * drm_connector already present, the new bridge must be for
> +	 * another card
> +	 *
> +	 */
> +	if (hotplug_helper->connector)
> +		return;
> +
> +	struct drm_bridge *last_bridge __free(drm_bridge_put) =3D
> +		drm_bridge_chain_get_last_bridge(hotplug_helper->encoder);

[Severity: Medium]
Can drm_bridge_chain_get_last_bridge() race with concurrent bridge removal =
in
drm_bridge_detach_from()?

drm_hotplug_helper_try_complete() (and
drm_hotplug_helper_bridge_chain_is_complete()) reads encoder->bridge_chain
under hotplug_helper->event_mutex without holding
encoder->bridge_chain_mutex.  Meanwhile, drm_bridge_remove() detaches
bridges before notifying DRM_BRIDGE_DETACHED:

CPU0                                  CPU1
drm_bridge_remove(last_bridge)
  drm_bridge_detach_from()
    lock(&encoder->bridge_chain_mutex)
                                      drm_hotplug_helper_try_complete()
                                        drm_bridge_chain_get_last_bridge()
                                          list_last_entry_or_null(...)
    list_move_tail(..., &tmplist)
    unlock(&encoder->bridge_chain_mutex)
    drm_bridge_detach(last_bridge)
      list_del_init(&chain_node)
                                        last_bridge->funcs->attach(...)
                                          drm_bridge_attach(..., last_bridg=
e)
                                            list_add(&new->chain_node,
                                                     &last_bridge->chain_no=
de)
                                                     <-- attaches to detach=
ed
                                                         bridge / corrupts
                                                         tmplist
      drm_hotplug_event_notifier_notify()
      last_bridge->dev =3D NULL
      last_bridge->encoder =3D NULL

Because drm_bridge_detach() only clears bridge->dev and bridge->encoder aft=
er
the DRM_BRIDGE_DETACHED notification returns, drm_bridge_attach() with
previous =3D last_bridge passes its validation checks and links the new bri=
dge
onto last_bridge->chain_node while last_bridge is on tmplist or already
detached from encoder->bridge_chain.

> +
> +	if (last_bridge) {
> +		/*
> +		 * Some bridge(s) already in the chain, propagate the
> +		 * attach call chain from the current chain tail to newly
> +		 * hotplugged bridge(s)
> +		 */
> +		dev_dbg(dev, "propagate attach after %ps\n", last_bridge->funcs);
> +
> +		err =3D last_bridge->funcs->attach(last_bridge, hotplug_helper->encode=
r,
> +						 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +		if (err)
> +			return;

[Severity: High]
Is it valid to call last_bridge->funcs->attach() directly on a bridge that =
is
already attached?

First, drm_bridge_funcs.attach is optional (drm_bridge_attach() checks
if (bridge->funcs->attach)), so dereferencing last_bridge->funcs->attach
unconditionally will cause a NULL pointer dereference if the tail bridge
does not implement .attach.

Second, last_bridge is already attached to encoder->bridge_chain and has not
been detached.  Re-invoking its .attach callback on subsequent
DRM_BRIDGE_ADDED or DRM_MIPI_DSI_ATTACHED notifications violates the 1:1
attach/detach lifecycle and re-runs per-bridge attach initialization on an
already-initialized bridge.  For example, ti_sn_bridge_attach() in
drivers/gpu/drm/bridge/ti-sn65dsi86.c calls drm_dp_aux_register(&pdata->aux)
before attaching pdata->next_bridge and unwinds with
drm_dp_aux_unregister(&pdata->aux) if attaching next_bridge fails, so
calling .attach() again attempts to re-register an already-registered DP AUX
device and unregisters it on failure while the bridge remains attached.

[ ... ]

> +struct drm_hotplug_helper *drmm_hotplug_helper_init(struct drm_encoder *=
encoder,
> +						    drm_hotplug_helper_event_cb event_cb,
> +						    struct device_node *first_bridge_ep)
> +{

[ ... ]

> +	guard(mutex)(&hotplug_helper->event_mutex);
> +	drm_hotplug_helper_try_complete(hotplug_helper);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drmm_hotplug_helper_init);

[Severity: Medium]
Should drmm_hotplug_helper_init() return hotplug_helper instead of 0?
Returning NULL on success contradicts the documented ERR_PTR() contract and
causes callers checking !ret or IS_ERR_OR_NULL() to treat every successful
initialization as a failure.

> diff --git a/include/drm/drm_hotplug_helper.h b/include/drm/drm_hotplug_h=
elper.h
> new file mode 100644
> index 0000000000000..ba14d547f8ff8
> --- /dev/null
> +++ b/include/drm/drm_hotplug_helper.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2026 GE HealthCare
> + * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> + */
> +
> +#ifndef __DRM_HOTPLUG_HELPER_H__
> +#define __DRM_HOTPLUG_HELPER_H__
> +
> +/**
> + * enum drm_hotplug_helper_event - DRM hotplug helper connector events
> + */
> +enum drm_hotplug_helper_event {
> +	/** @DRM_HOTPLUG_HELPER_CONNECTOR_ADDED: A drm_connector has just been =
added */
> +	DRM_HOTPLUG_HELPER_CONNECTOR_ADDED,
> +	/** @DRM_HOTPLUG_HELPER_CONNECTOR_REMOVING: A drm_connector is about to=
 be removed */
> +	DRM_HOTPLUG_HELPER_CONNECTOR_REMOVING,
> +};
> +
> +/**
> + * drm_hotplug_helper_event_cb - Callback to report connector addition a=
nd removal.
> + */
> +typedef void (*drm_hotplug_helper_event_cb)(enum drm_hotplug_helper_even=
t event,
> +					    struct drm_connector *connector);
> +
> +struct drm_hotplug_helper *drmm_hotplug_helper_init(struct drm_encoder *=
encoder,
> +						    drm_hotplug_helper_event_cb event_cb,
> +						    struct device_node *next_bridge_ep);
> +
> +#endif /* __DRM_HOTPLUG_HELPER_H__ */

[Severity: Low]
Does include/drm/drm_hotplug_helper.h build cleanly under
CONFIG_DRM_HEADER_TEST=3Dy?

struct drm_connector, struct drm_encoder, and struct device_node are used in
the parameter lists without forward declarations, causing -Wvisibility
warnings when the header is compiled standalone.  In addition, the kernel-d=
oc
comment for drm_hotplug_helper_event_cb is missing the typedef prefix
("typedef drm_hotplug_helper_event_cb - ...") and @event / @connector
descriptions required by scripts/kernel-doc, and the third parameter of
drmm_hotplug_helper_init() is named next_bridge_ep here instead of
first_bridge_ep as in the definition.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-drm-bridge=
-hotplug-v4-0-822722850492@bootlin.com?part=3D31
