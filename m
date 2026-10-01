Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD32E3F3265
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859363; cv=none; b=NyqE06WUhHd9u/GuyTlzXE9rjOmuhQOkZWqjJkIUW7cas6+0yqufY40cJKhzEZPt3pjtRFup4mhGl/9q0YmegYXyHgYP2YObF9KnK8m1jeBW4w7LQtvzDrcEmaBlzlrG5ORY9uwJheAKRb9UH92c5Gz9wb+2ZeBAIMuzgdI4zcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859363; c=relaxed/simple;
	bh=XbidRgS/+ocEKW2o84p1zPew/GG1wMgbMcvMtI3zm1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JaWADN7DI27dqlKJPmaSHlLD2ucthirVCHLMD4JBKpQCeZLD/ji7z+IoRSVNnxJD3BHXE9pykkqDp/m8aATjdjgrSlfofY5RldrCZ+jeFR5IT3Rhcz+ChhtZ/mCNtRZ+b9JffHrIYBVRrzNzKR3+wZc7LVMLro6OT6kzHAMpGvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fcTprC6n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fcTprC6n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E07C1F000FF;
	Thu,  1 Oct 2026 12:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859361;
	bh=R1ksKiyF6A0GD2P1n76mqJ8HdjISxDDGz8gZgqVlGNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fcTprC6nlML/WgwMhpLLb8K2rwTNfJHDe8148cWwyMBC91n7s4dQYu0evtOy5umUv
	 Ok0oQ5pNfFiqTHkqqxvBfLfWoa4bSPuBY+QHkHegDJpgkNeWSiGshtPLv8a0sTFv1k
	 v/iNuX9OOejFfZ09Pf53wd9DB6z4ZwrDoWUyx8GOZWzzQEcIX5UO/Cpx3MBk/UVPNn
	 GCihld9heHWDW0Pwtm6zeaQ5JU1F1ZyceMaCRz16riW8ibxqkGsTEStNvDS9bWmwam
	 2iKcbEKCmrI68hqSv6sUtevvx4M/7tcgoh0I4rgDHn+wr5gT/g8j7byBRjgcnItsL5
	 vZsgSQrGL0VTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 05/24] drm/display: bridge-connector: use a
 dynamic connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261001-drm-bridge-hotplug-v2-5-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
 <20261001-drm-bridge-hotplug-v2-5-8e34986dcb68@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 12:56:00 +0000
Message-Id: <20261001125601.2E07C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm: NULL pointer dereference due to inverted drmm cleanup order
- [Medium] drm: memory leak on connector initialization error paths
- [Medium] drm: missing IS_ERR check causes invalid pointer dereference
--

commit a2cbdd2f3a09967f7b7cc240d15ab5e45033083e
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/display: bridge-connector: use a dynamic connector

This commit switches the DRM bridge connector initialization from
drmm-managed functions to dynamic variants. This prepares the driver for
bridge hotplugging, allowing connectors to be removed without removing the
entire card.

> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index 2aff745f01478..1c222e27767d4 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
[ ... ]
> @@ -1113,6 +1120,9 @@ drm_bridge_connector_initialize(struct drm_bridge_c=
onnector *bridge_connector,
> =20
>  	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
> =20
> +	if (!connector->state)
> +		connector->state =3D drm_bridge_connector_create_state(connector);
> +

[Severity: Medium]
Does this code assign an error pointer directly to connector->state?

If drm_bridge_connector_create_state() returns ERR_PTR(-ENOMEM), this
will poison the state pointer without validation, potentially leading to an
invalid pointer dereference later.

>  	if (bridge_connector->bridge_hpd)
>  		connector->polled =3D DRM_CONNECTOR_POLL_HPD;
>  	else if (bridge_connector->bridge_detect)
[ ... ]
> @@ -1130,9 +1140,26 @@ drm_bridge_connector_initialize(struct drm_bridge_=
connector *bridge_connector,
>  	if (ret)
>  		return ERR_PTR(ret);
> =20
> +	ret =3D drm_connector_dynamic_register(connector);
> +	if (ret)
> +		return ERR_PTR(ret);
> +

[Severity: Medium]
Does this code skip manual cleanup on this error path?

Since the switch to dynamic initialization, the connector is referenced and
has to be put if initialization fails (as noted in an earlier comment: "From
now on the connector is referenced and has to be put"). Returning
ERR_PTR(ret) directly skips drm_connector_put() and bridge cleanup,
leaking the initialized dynamic connector and bridge references.

This also seems to occur on earlier error paths in this function, such as
after drm_connector_hdmi_audio_init().

>  	return connector;
>  }
[ ... ]
> @@ -1155,6 +1182,7 @@ struct drm_connector *drm_bridge_connector_init(str=
uct drm_device *drm,
>  {
>  	struct drm_bridge_connector *bridge_connector;
>  	struct drm_connector *connector;
> +	int ret;
> =20
>  	bridge_connector =3D drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_K=
ERNEL);
>  	if (!bridge_connector)
> @@ -1164,6 +1192,10 @@ struct drm_connector *drm_bridge_connector_init(st=
ruct drm_device *drm,
>  	if (IS_ERR(connector))
>  		return connector;
> =20
> +	ret =3D drmm_add_action_or_reset(drm, drmm_bridge_connector_fini, bridg=
e_connector);
> +	if (ret)
> +		return ERR_PTR(ret);
> +

[Severity: High]
Does this inverted drmm cleanup order cause a NULL pointer dereference?

This drmm action is registered after the CEC drmm action (which happens
inside drm_bridge_connector_initialize()). Since drmm actions run in
LIFO order, the connector is destroyed and zeroed out before the CEC
adapter unregisters. The CEC unregister action would then dereference
connector->cec.data, which is already NULL, leading to a crash.

>  	return connector;
>  }

While reviewing this patch, I noticed a pre-existing issue in the HDMI
dynamic initialization path that this patch calls into:

drivers/gpu/drm/drm_connector.c:drm_connector_hdmi_dynamic_init()
{
	...
	ret =3D drm_connector_dynamic_init(dev, connector, funcs, connector_type, =
ddc);
	if (ret)
		return ret;

	if (ret)
		drm_connector_cleanup(connector);

	return drm_connector_hdmi_initialize(dev, connector, hdmi_funcs);
}

[Severity: Medium]
This is a pre-existing issue, but does this code contain a dead cleanup pat=
h?

The code evaluates if (ret) return ret; followed immediately by
if (ret) drm_connector_cleanup(connector);. The cleanup is dead code.
If the subsequent drm_connector_hdmi_initialize() fails, the successfully
initialized connector is leaked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-drm-bridge=
-hotplug-v2-0-8e34986dcb68@bootlin.com?part=3D5
