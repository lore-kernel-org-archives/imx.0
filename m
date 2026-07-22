Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F55447D936
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 08:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708644; cv=none; b=Va4cXno7KUSU4qV+42SgUkTsZ7zFDYUgFiG3p8O0xhVYoiDwUPePKOCnzEZvX6Ba8PgLeuiPBv3PluJq7bQGe1c4HYIv0lzhhfZ1mHPxNzLA7chEscrvCYmYkuurtdbEyKVXvz7ITAoqFOa6vScE7hqztcZpOqcB4GOPsHaPtC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708644; c=relaxed/simple;
	bh=3Eosz3HsPo5+KCYIi3tyJm/AjU4pfyrX3Zb6PT406HA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ANp9wfVwEu8dWnOBEbJptVH+y4LK7t/KEfE4dbX4/7FHBNSSTAypRYPIdwfD3P0q3TKks5LKRyms1L9Y9As8DEAZBWHeL5sgJfSHyCCnFJEZG5IdmuY6pqycsYL5+HrUa0OWbk+lETA+ai8M9kgdfam7YwMAr+57PEcTQX3sniE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/8DXBxq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/8DXBxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14521F000E9;
	Wed, 22 Jul 2026 08:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784708640;
	bh=4YoR4eG531M64SIUL//MyCVfMELuCpCScGnZFES8z2U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j/8DXBxqZmPK7KX4E6q3ks0T3O0psF4mpeuAoq99J9E/FMGPNtp0UcgA1mMREwxiV
	 mYRDNxxeUZ3O3bRomC3mpXcubOEIXX3Ftn8DtlqoDnId89TY0m1xabf+9k/YsmvlnD
	 rsOYe3GIlym/CS9K+gwmvzRX+epG8TW3ZHHMs/+PxuNgZIUCuigJQ5jN8RFtP6mEiS
	 wpLrkyGZ4c3NJZEBZwBVEl/RJojv/CpRQeLCaBae8n6Hk4ILPGPefiz4UHjtD55Yg4
	 2pazrur7hMk/gyqn2dW9EBKdBOdc/bjPvIfNJ4SKW8bP7On12Ur+EvOoUZzB/CIUlC
	 RMG4jsGpQ+www==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260722-v6-18-topic-imx93-parallel-display-v12-1-a59dbb4dbc13@nxp.com>
References: <20260722-v6-18-topic-imx93-parallel-display-v12-1-a59dbb4dbc13@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 08:23:59 +0000
Message-Id: <20260722082359.E14521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Returning a fallback format for unsupported output formats breaks =
DRM bridge format negotiation.
--

--- Patch [1]: [PATCH v12] drm/bridge: imx: Add i.MX93 parallel display for=
mat configuration support ---
commit 62def9c6e85686d63c6204b71b54383955f8f9d1
Author: Liu Ying <victor.liu@nxp.com>
drm/bridge: imx: Add i.MX93 parallel display format configuration support

This commit introduces a new DRM bridge driver to support parallel display
format configuration on the NXP i.MX93 and i.MX91 SoCs. It handles format
conversions for the MEDIAMIX BLK-CTRL DISPLAY_MUX register.

> diff --git a/drivers/gpu/drm/bridge/imx/imx93-pdfc.c b/drivers/gpu/drm/br=
idge/imx/imx93-pdfc.c
> new file mode 100644
> index 0000000000000..b084409d22ef2
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
[ ... ]
> +static u32 *
> +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *bridge_state,
> +					    struct drm_crtc_state *crtc_state,
> +					    struct drm_connector_state *conn_state,
> +					    u32 output_fmt,
> +					    unsigned int *num_input_fmts)
> +{
> +	struct imx93_pdfc *pdfc =3D bridge_to_imx93_pdfc(bridge);
> +	u32 *input_fmts;
> +
> +	*num_input_fmts =3D 0;
> +
> +	input_fmts =3D kmalloc_obj(*input_fmts);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	*num_input_fmts =3D 1;
> +
> +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
> +		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDI=
A_BUS_FMT_RGB888_1X24\n");
> +		input_fmts[0] =3D MEDIA_BUS_FMT_RGB888_1X24;
> +		return input_fmts;
> +	}

[Severity: High]
Does returning a fallback format here break DRM bridge format negotiation?

When the downstream bridge requests an unsupported output format first,
drm_atomic_bridge_chain_select_bus_fmts() queries atomic_get_input_bus_fmts=
()
to check if the format is supported. By returning MEDIA_BUS_FMT_RGB888_1X24
instead of 0 formats, this driver falsely claims it can support the request=
ed
output_fmt.

The core then proceeds with the unsupported format, which is correctly
rejected by imx93_pdfc_bridge_atomic_check(), aborting the modeset with
-EINVAL instead of gracefully negotiating a fallback.

Should this instead set *num_input_fmts =3D 0, free the array, and return N=
ULL
when the output format is unsupported?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-v6-18-topi=
c-imx93-parallel-display-v12-1-a59dbb4dbc13@nxp.com?part=3D1
