Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226663C0A08
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 15:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374113; cv=none; b=HK4ahO2KmmIP/xaCa0YdoRy/U4QePK/bVHD2Mt3WetAYViUrMtUDL+WxY6J2D4IezPjJxc+96bpOov3T/mhHu0lk05tSTYbTuK2opUzjoYWoWhXfD1dzx7PGsAvOvPOFKr6H71B0agx+YNZDaSwUtoZa9hMGFZzoedVi3VP3Vx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374113; c=relaxed/simple;
	bh=k470MilQ+jzENu9ouAgut3D2jkQy0ifgrcJM+MitaIU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MmsyUqW2cn6NjnOJuyJgpnjUVykM2BNt8bPJaC3Hc56Wu1QwryzuNac3gp1qCPO43WnAmbT8s8c4q1G3gqDAk3ZseehgOjeHaDk5+PhOuMfsbIJDIGblztaN3Ynfa1/sNprk0RxMrd7XdTVkz1XJz9Jbz23y8AXAQJJNtxYuLm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKmyUTUl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKmyUTUl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0131F000E9;
	Mon, 10 Aug 2026 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786374111;
	bh=YShLWpcwCs6MJSLzKT73D+ZIPEOHNOp2B3e9gM9+pgE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mKmyUTUl5Vi9dUS2PwSCTwhNjkjeHCdZG326Ojxea/DFBX3QETG7EM9Jhtyym5Wdi
	 8R2SLBk6lxlbcnUe9efyvTqcVyxwcad9x8wU6YdYsWjB+1o1TY8sKcBygzsUDcylUl
	 gSDDgSgun1MudarEs+0UKF3WIHggRdXYrEP78WqoHC8eswlhK2dW9j0pMa5G6b4aYk
	 37EQno4Axa9blVjXqSjyknUYrVzQtrlixUcM18PJQZQZ+J8sYnhqH7tvwC+2Lh7gfq
	 EZ1Z9rqxW8loSSLIzdx7dgYqvxPyYMqDQzVc9sfruyyjdjUZcyZ5H3O+JCLvUQ1Mz+
	 pY6qISD1pXxrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] drm/imx: imx-tve: probe DDC before claiming the
 connector is connected
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260810-imx53-fix-hdmi-v1-3-fff9b1b17f25@oss.qualcomm.com>
References: <20260810-imx53-fix-hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com>
 <20260810-imx53-fix-hdmi-v1-3-fff9b1b17f25@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:01:50 +0000
Message-Id: <20260810150151.7E0131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Missing polling configuration for dynamic hotplug detection.

Pre-existing issues:
- [High] Missing -EPROBE_DEFER handling undermines the intended fix under n=
ormal probe ordering.
--

--- Patch [3]: [PATCH 3/4] drm/imx: imx-tve: probe DDC before claiming the =
connector is connected ---
commit 496cfa19c398d86d2f77e8a07cbe96a51f14ca0a
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/imx: imx-tve: probe DDC before claiming the connector is connected

This commit adds a detect_ctx hook to the TVE connector using the DDC bus to
detect whether a monitor is attached. It aims to fix a CRTC timeout issue
caused by unconditionally lighting up the VGA output when nothing is
connected.

> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ip=
uv3/imx-tve.c
> index e861b8b9d8fa8..11ac69561eb81 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> @@ -322,6 +322,7 @@ static const struct drm_connector_funcs imx_tve_conne=
ctor_funcs =3D {
>  static const struct drm_connector_helper_funcs imx_tve_connector_helper_=
funcs =3D {
>  	.get_modes =3D imx_tve_connector_get_modes,
>  	.mode_valid =3D imx_tve_connector_mode_valid,
> +	.detect_ctx =3D drm_connector_helper_detect_from_ddc,

[Severity: Medium]
Since this adds dynamic detection through the detect_ctx callback, shouldn't
we also configure the connector polling flags in imx_tve_bind()?

It looks like the connector is initialized here:

imx_tve_bind() {
    ...
    ret =3D drm_connector_init_with_ddc(drm, connector,
                                      &imx_tve_connector_funcs,
                                      DRM_MODE_CONNECTOR_VGA, tve->ddc);
    ...
}

Without setting connector->polled =3D DRM_CONNECTOR_POLL_CONNECT |
DRM_CONNECTOR_POLL_DISCONNECT, the DRM core's periodic poll worker will
ignore this connector. Will this prevent dynamic detection if a user plugs
in a monitor after boot?

[Severity: High]
This is a pre-existing issue, but could probe ordering undermine this fix?

The patch relies on tve->ddc being initialized to accurately report the
connector status. However, imx_tve_probe() does not currently handle probe
deferral:

imx_tve_probe() {
    ...
    tve->ddc =3D of_find_i2c_adapter_by_node(ddc_node);
    of_node_put(ddc_node);
    if (tve->ddc) {
    ...
}

If the I2C driver hasn't probed yet, tve->ddc will be left as NULL instead
of returning -EPROBE_DEFER.

If detect_ctx is later called with a NULL DDC adapter,
drm_connector_helper_detect_from_ddc() will return connector_status_unknown.
Because the DRM core treats unknown as connected when fallback modes are
involved, does this mean the CRTC timeout bug will reoccur whenever the I2C
driver probes after imx-tve?

>  };
> =20
>  static const struct drm_encoder_helper_funcs imx_tve_encoder_helper_func=
s =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-imx53-fix-=
hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com?part=3D3
