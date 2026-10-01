Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A025049E151
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858937; cv=none; b=Szkgz9Sw5bujxQx0rL5+t2ms5U/W9rlP0aCLFCT9+8LdmKg8Il3X6i12qRSsJX/crqRd7zQ0ZTR0NBKiUYKRyqFyMOTzext9HnmU1k7L8JPSLJWB5mPspEJj4X5tHSVX4MxCGAckljaCiN6olw1YfHV/0M134l2Acuni+pgLiFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858937; c=relaxed/simple;
	bh=VTdr5RZWidFfPpw853q0fDtUSPF30tP2i0Slr5CW1nM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jn9OnawD2hldfS4h/6dxomwOxVKDCaBTss5hOb9GAvBIWnW4ze4ibjgSl+C5aLrqhojhfEnMnt9f4lIRajqG+ibQhUQlG19R11YMLCQxYE6Ywe3ClzpfXaXca5kDhZS3gtfHocq0WGq6T7SUlh1mknFv3lAu3MLjyjtUK0PZSPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpjDlQ2p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpjDlQ2p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2345E1F000FF;
	Thu,  1 Oct 2026 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790858936;
	bh=sl6TR850Fo0xRCMRojc9x6eqxqa/0pVRptThyRAvxPk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gpjDlQ2pc+kU/Y6A1BMMvL9DnwwJmfuWsNJVv2Q86M2pHOZE3cpfz/htu612ckddE
	 c3k4+onuC64J/F/Y3AuFU0YNiEGUAcz0dQT3ZKdE1lrRQZhZjPfCvp70Abk2llnZWf
	 aYKZ8WTzTnWwew3piTB/fP44hsEVZpfCuqqln364dsxHfjDXZZo+BAqrBX2vOJ/MoO
	 uDCIQ2TrQzKDKIChU/nwjP/SGdRYYvW0jXE0iCnu2jHkis5Nb0r6XkP1Q8GcPXPKGI
	 X5ax9NvBW/+0ezuRD+Dr61GQtNs41SYueWvEO/b36aD9Mf5d5vtJqMlB6MDs5KsXIG
	 5wBUTGpxCGXcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 02/24] drm/connector: add
 drm_connector_hdmi_dynamic_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261001-drm-bridge-hotplug-v2-2-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
 <20261001-drm-bridge-hotplug-v2-2-8e34986dcb68@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 12:48:55 +0000
Message-Id: <20261001124856.2345E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] drm/connector: resource leak on dynamic HDMI init failure due to=
 dead code
- [Low] drm/connector: incorrect kernel-doc function name for drm_connector=
_hdmi_dynamic_init
--

commit 7682dffb42f83d7a2155ddd8d9ec5ae0bcb7425d
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/connector: add drm_connector_hdmi_dynamic_init()

In preparation for adding hotpluggable bridges into the
drm_bridge_connector, we need connectors to be created dynamically, both
regular connectors and HDMI ones. drm_connector_init() already has a
dynamic variant, add one for HDMI connectors too.

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index f5bd08640d251..f264cab0d184e 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -708,6 +708,48 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drmm_connector_hdmi_init);
> =20
> +/**
> + * drmm_connector_hdmi_init - Init a preallocated dynamic HDMI connector

[Severity: Low]
This isn't a bug, but the kernel-doc header lists the function name as
drmm_connector_hdmi_init instead of drm_connector_hdmi_dynamic_init. Could
this cause kernel-doc validation warnings?

> + * @dev: DRM device
> + * @connector: A pointer to the HDMI connector to init

[ ... ]

> +int drm_connector_hdmi_dynamic_init(struct drm_device *dev,
> +				    struct drm_connector *connector,
> +				    const struct drm_connector_funcs *funcs,
> +				    const struct drm_connector_hdmi_funcs *hdmi_funcs,
> +				    int connector_type,
> +				    struct i2c_adapter *ddc)
> +{
> +	int ret;
> +
> +	ret =3D drm_connector_hdmi_sanity_checks(dev, connector, hdmi_funcs, co=
nnector_type);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D drm_connector_dynamic_init(dev, connector, funcs, connector_typ=
e, ddc);
> +	if (ret)
> +		return ret;
> +
> +	if (ret)
> +		drm_connector_cleanup(connector);

[Severity: Medium]
Is this second if (ret) check dead code?

Since ret would have caused an early return in the previous check, this
drm_connector_cleanup(connector) will never run.=20

Does this leak resources (like the IDA allocation and connector name) if
drm_connector_hdmi_initialize() fails on the next line? Should the cleanup
instead happen on the return path if drm_connector_hdmi_initialize()=20
encounters a failure?

> +
> +	return drm_connector_hdmi_initialize(dev, connector, hdmi_funcs);
> +}
> +EXPORT_SYMBOL(drm_connector_hdmi_dynamic_init);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-drm-bridge=
-hotplug-v2-0-8e34986dcb68@bootlin.com?part=3D2
