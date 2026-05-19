Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E886948BD5E
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189447; cv=none; b=ZGpv+pJi4KMHKUa1786RU+KPb0lzEMhO0OLI/8ZjKTfxZTIuRlqikbc6vTl38xfXtbxFVdoZPACJ2GPHjNFGcxmLnYisWB/udN8jYQJNy5SfvpfkP/Ak2cRHehpZAna/X1neDqZGAEDk3y628JwbNsvaYJBb36rTuUeF0SpbWYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189447; c=relaxed/simple;
	bh=PVhhGN92SO22O6HOGcaavlNlH9O25zoSn79RlAjShTY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RXR0FIXhvZe0C27b+ApbYFU0P1UKwteJoUzIu8nQH0xRXkRLNhHSV+guttGd1oxSDQbdFBi4QA2RELUdvFiYETyHqYtll+ipV8pV0fY+6VdMpHCADeklGgP3g4MIrpjxI6AUJELbbt019eVFyUl5qlbzyC1zohuke2ztvwI9DhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDm2mPrz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDm2mPrz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5ADC2BCB8;
	Tue, 19 May 2026 11:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189446;
	bh=PVhhGN92SO22O6HOGcaavlNlH9O25zoSn79RlAjShTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TDm2mPrzVHtTtc2MoN6Llq1VTOaZy2ZCCzXHTaTXmHKuQbXicsVhxBN3dYnZJkJ0S
	 liRJqCNAFTTtT5/Bv2fGP3I1iJGOp5UOuDln9Mo7Wgb9BozI0/kmQrIidpTEjTdW5q
	 nEaR1Djoa1v+13jo8zb6P2Wqh6KWonxvOMhv3IhqMbXuXROX2igoRbdSKkAkbncK4/
	 ZG88kUcCQKZDuQ5E3CulrapQur63E5TA5eDQk4hquYCXw1hOdug8Jsfrp3Uqt5uqrZ
	 gMmfZ9sCwZdtewUAP1I/ab445NxWn8CoZztyg+WCAOPUABQ0VFxuNJrTkbAwDOnVRH
	 sFI65jylDa+wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/37] drm/display: bridge-connector: move per-connector
 fields to the dynamic connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260519-drm-bridge-hotplug-v1-16-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-16-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:17:26 +0000
Message-Id: <20260519111726.AB5ADC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] HPD and OOB hotplug events are misrouted to the newest dynamic con=
nector and can cause a NULL pointer dereference.
- [High] Use-After-Free due to drmm_ CEC registration for dynamically freed=
 connectors.
- [Medium] Memory leak of bridge references on error path in drm_bridge_con=
nector_add_connector().
--

commit 2da47a06a9f55cba5481389b325a75953c4b3912
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/display: bridge-connector: move per-connector fields to the dynamic con=
nector

This commit moves various bridge pointers and the hdmi_funcs pointer from
struct drm_bridge_connector to struct drm_bridge_connector_dynconn. This
ensures these fields share the same allocation and lifetime as the
dynamically-created connector they reference, in preparation for bridge
hotplugging support.

> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -225,7 +228,9 @@ static void drm_bridge_connector_enable_hpd(struct dr=
m_connector *connector)
>  {
>  	struct drm_bridge_connector *bridge_connector =3D
>  		to_drm_bridge_connector(connector);
> -	struct drm_bridge *hpd =3D bridge_connector->bridge_hpd;
> +	struct drm_bridge_connector_dynconn *dynconn =3D
> +		to_drm_bridge_connector_dynconn(connector);
> +	struct drm_bridge *hpd =3D dynconn->bridge_hpd;
> =20
>  	if (hpd)
>  		drm_bridge_hpd_enable(hpd, drm_bridge_connector_hpd_cb,
>  				      bridge_connector);
>  }

Does registering bridge_connector as the callback data here cause hotplug
detection events to be misrouted?=20

When an event fires, the handler resolves the target via
&bridge_connector->dynconn->connector. If multiple dynamic connectors are
created concurrently, bridge_connector->dynconn will point to the most
recently created one, potentially corrupting the state of a newer connector.

Additionally, if bridge_connector->dynconn has been set to NULL (such as
after a hot-unplug), could this path trigger a NULL pointer dereference when
the callback accesses connector->status?

[ ... ]

> @@ -320,7 +325,7 @@ static void drm_bridge_connector_dynconn_destroy(stru=
ct drm_connector *connector
>  		container_of(connector, struct drm_bridge_connector_dynconn, connector=
);
> =20
>  	drm_connector_cleanup(connector);
> -	drm_bridge_connector_put_bridges(dynconn->bridge_connector);
> +	drm_bridge_connector_put_bridges(dynconn);
>  	kfree(dynconn);
>  }

Since drm_bridge_connector_init_hdmi_audio_cec() registers components using
drmm_connector_hdmi_cec_notifier_register() and
drmm_connector_hdmi_cec_register(), the cleanup actions are deferred and
bound to the global drm_device (connector->dev).=20

Because the connector is explicitly freed here via kfree(dynconn), will
the delayed drmm_ actions dereference the freed connector pointer when the
drm_device is eventually torn down, leading to a use-after-free regression?

[ ... ]

> @@ -841,26 +845,26 @@ static int drm_bridge_connector_get_bridges(struct =
drm_bridge_connector_dynconn
>  		 * Ensure the last bridge declares OP_EDID or OP_MODES or both.
>  		 */
>  		if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MO=
DES) {
> -			drm_bridge_put(bridge_connector->bridge_edid);
> -			bridge_connector->bridge_edid =3D NULL;
> -			drm_bridge_put(bridge_connector->bridge_modes);
> -			bridge_connector->bridge_modes =3D NULL;
> +			drm_bridge_put(dynconn->bridge_edid);
> +			dynconn->bridge_edid =3D NULL;
> +			drm_bridge_put(dynconn->bridge_modes);
> +			dynconn->bridge_modes =3D NULL;
> =20
>  			if (bridge->ops & DRM_BRIDGE_OP_EDID)
> -				bridge_connector->bridge_edid =3D drm_bridge_get(bridge);
> +				dynconn->bridge_edid =3D drm_bridge_get(bridge);

When this function populates these bridge references in dynconn, if it later
encounters an error (like returning -EINVAL for missing callbacks), the
caller drm_bridge_connector_add_connector() will free dynconn without calli=
ng
drm_bridge_connector_put_bridges().=20

Could this regression result in leaking these newly acquired bridge referen=
ces
on the error path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D16
