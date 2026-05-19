Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B643A963C
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188652; cv=none; b=u1GlgN99uIiSZERYk4oHNPXTlHFaeJfJgLlGG3c7OutAdBc8y+uAzSkIFH4doM49xKk2C4vJXYf2LKdr/JbZNqIhjJNHWkWP1QMaROKA6DfYvQVEx4TUKCM1MUl2t9Vpi7XLVHq2gWP3EAo5iO1ovY9n2VSLXQEpD9NJldFGTvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188652; c=relaxed/simple;
	bh=FpQNtM4mzkJPsjmovXoz/ZlEcUWkiWWTxznWMcuZN0s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=arZXkmqVGp2nAHGE7rSJhqd/NHgNYtGVnw1aINidgLTpMFd1GjPZhFYvWBU4RNft8hR8yke7CfV3aFqkj4XtzdrMK4uHwcDrjBgpUcnXoTbwT+stemcDML6mkDmIBK9mhau13JTrropjMD1TzchjCCCZh9rUvWZaEBlKfRy3+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r4alDiC+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4alDiC+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D89CC2BCB3;
	Tue, 19 May 2026 11:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188652;
	bh=FpQNtM4mzkJPsjmovXoz/ZlEcUWkiWWTxznWMcuZN0s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=r4alDiC+UM4WqGixrCGfVY552KtrVOiFNp7idNO/4jcjiPX7yOXuxLgDn7fudjzhh
	 7cU0yHM0deT9xpcWKcMwg+xCr+iIGpgNogxASc6020D6yXTYK1Jmo+t1JsnBxKwjKn
	 TnQNldTBbfXBZgFDe554PL9IY/c1JG5Uk5Z7hkm2TdrxFadbIzcaHh7rGEduNj5P5z
	 AEqbS/u1XKziQaO46ElSEgvZ308lzEOBVtR172aD6V55WpGFIXngjD/indR97U0nna
	 1+1XnWHu0987ZlKmiTiWLDvuyTuyygy8y4VriLhC6POIukehBoFN8xe39+YRbdepL4
	 EZeMwfJhcwKPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/37] drm/connector: add
 drm_connector_hdmi_dynamic_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260519-drm-bridge-hotplug-v1-2-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-2-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:04:11 +0000
Message-Id: <20260519110412.3D89CC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional dereference of connector->state if the reset callbac=
k fails to allocate memory.
--

commit 7cc84b3b3fd13ae7b12a391a46d924249c29ae3d
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/connector: add drm_connector_hdmi_dynamic_init()

This commit introduces a dynamic initialization variant for HDMI connectors
to support hotpluggable bridges.

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 37ed73300a181..5e7a3a438e5db 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c

[ ... ]

> @@ -658,6 +658,56 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> +int drm_connector_hdmi_dynamic_init(struct drm_device *dev,
> +				    struct drm_connector *connector,
> +				    const char *vendor, const char *product,
> +				    const struct drm_connector_funcs *funcs,
> +				    const struct drm_connector_hdmi_funcs *hdmi_funcs,
> +				    int connector_type,
> +				    struct i2c_adapter *ddc,
> +				    unsigned long supported_formats,
> +				    unsigned int max_bpc)
> +{
> +	int ret;
> +
> +	ret =3D drm_connector_hdmi_sanity_checks(connector, vendor, product, hd=
mi_funcs,
> +					       connector_type, supported_formats, max_bpc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D drm_connector_dynamic_init(dev, connector, funcs, connector_typ=
e, ddc);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_hdmi_init(connector, vendor, product,
> +				hdmi_funcs, supported_formats, max_bpc);

Could this lead to a NULL pointer dereference under memory pressure? I
realize this behavior pre-exists in drmm_connector_hdmi_init(), but the new
dynamic variant exposes the same pattern.

Looking at drm_connector_hdmi_init():

static void drm_connector_hdmi_init(...)
{
	...
	if (connector->funcs->reset)
		connector->funcs->reset(connector);

	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
}

For atomic drivers, the reset callback allocates connector->state, but since
it returns void, allocation failures are silent and connector->state remains
NULL.

The subsequent call to drm_connector_attach_max_bpc_property() then
unconditionally dereferences it:

	connector->state->max_requested_bpc =3D max;

Would it be safer to verify connector->state is allocated after the reset
callback before continuing?

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_hdmi_dynamic_init);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D2
