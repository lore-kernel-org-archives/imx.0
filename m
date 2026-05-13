Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3E6360ED7
	for <imx@lists.linux.dev>; Wed, 13 May 2026 20:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778703436; cv=none; b=O5pWXRx0zKf6YpzMkuw3Cx1kXlZ7aYRs0sf3F0Lm0b3NYQvZo3k9X0u/RtHaEQdq8mzojpWDAwn5MT4Pn4WYLgVM3ZKRdO/1l/D3evTgbLAwiHqxVpi9zAulqexRGpM2LWWqmP+z5+3Oyrlzmt99yxcjxVIvYt+ggkoolhzOu9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778703436; c=relaxed/simple;
	bh=n6Av5+It/dq13L65BHaA9DNbn8LYCOkzVdckl9DgXds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lJ0BK+WcxISTWtFrE37/IhQLvq7R5RwlZyT/u8Zb4mpl2fq0c56fsrLr64uUBfjFeHz1ptLlOpne5FBy0K4POkPV1v8DYNm67E1vWaJWLQlJ8r5UIveQqg2hThCF26RN1ql12pfcpw/cIxLpFdgXi7bFFQLKdAuDbxY/zHzsy4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nA0fQSkE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nA0fQSkE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACA2C19425;
	Wed, 13 May 2026 20:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778703435;
	bh=n6Av5+It/dq13L65BHaA9DNbn8LYCOkzVdckl9DgXds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nA0fQSkEx10a50AlP4PhHng0sSNy1KP4Q6nKQ3/Z0rA958I6tERU01IJjT+KoHySQ
	 5yX4FA6UeGcJBhKytYyc4yVg/QiLeeTWqwVk3dw1FkdLZ7ckeQa/BpD/Gidc3q4Mbp
	 sP22ALd7syEMOkTuxqqenRVAdwGBjIMdV4zz/rpSFgMLjVXskLLY+tPEUpYbgGC6yB
	 paYWe+xHlGzKMfMQiW2gdoP6KgCRZ+lzXppvO3SE+lWVE2ealBsyHwfTRZW2rQB0q4
	 h0k7qPxLfAq6Sow8ejGh8jZvAn2yYn/WL/vr64SYqxPJD2/wwxgFKYTfqmWtU2pf/F
	 9FhgLEskdNA4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/bridge: imx93-mipi-dsi: Fix mode validation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260512-imx93-mipi-dsi-fix-mode-validation-v2-1-7aec3be5da2c@nxp.com>
References: <20260512-imx93-mipi-dsi-fix-mode-validation-v2-1-7aec3be5da2c@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 20:17:15 +0000
Message-Id: <20260513201715.AACA2C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Self-deadlock due to recursive acquisition of the non-recursive br=
idge_chain_mutex.
--

commit 6ef22e8ad4391e28924570bebb26f8dec0d5af77
Author: Liu Ying <victor.liu@nxp.com>

drm/bridge: imx93-mipi-dsi: Fix mode validation

This commit changes mode validation to iterate over all bridges after
the current bridge to check for DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_EDID
flags, instead of only checking the last bridge.

> diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/dr=
m/bridge/imx/imx93-mipi-dsi.c
> index 8f312f9edf974..6d65df9ed9701 100644
> --- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> @@ -493,21 +493,24 @@ static enum drm_mode_status
>  imx93_dsi_validate_mode(struct imx93_dsi *dsi, const struct drm_display_=
mode *mode)
>  {
>  	struct drm_bridge *dmd_bridge =3D dw_mipi_dsi_get_bridge(dsi->dmd);
> -	struct drm_bridge *last_bridge __free(drm_bridge_put) =3D
> -		drm_bridge_chain_get_last_bridge(dmd_bridge->encoder);
> -
> -	if ((last_bridge->ops & DRM_BRIDGE_OP_DETECT) &&
> -	    (last_bridge->ops & DRM_BRIDGE_OP_EDID)) {
> -		unsigned long pixel_clock_rate =3D mode->clock * 1000;
> -		unsigned long rounded_rate;
> -
> -		/* Allow +/-0.5% pixel clock rate deviation */
> -		rounded_rate =3D clk_round_rate(dsi->clk_pixel, pixel_clock_rate);
> -		if (rounded_rate < pixel_clock_rate * 995 / 1000 ||
> -		    rounded_rate > pixel_clock_rate * 1005 / 1000) {
> -			dev_dbg(dsi->dev, "failed to round clock for mode " DRM_MODE_FMT "\n",
> -				DRM_MODE_ARG(mode));
> -			return MODE_NOCLOCK;
> +
> +	drm_for_each_bridge_in_chain_from(dmd_bridge, bridge) {

Can this cause a self-deadlock?

imx93_dsi_validate_mode() acts as the .mode_valid callback for the bridge,
which is invoked by drm_bridge_chain_mode_valid(). The DRM core iterates ov=
er
the bridge chain using the drm_for_each_bridge_in_chain_from() macro, which
acquires and holds the non-recursive bridge->encoder->bridge_chain_mutex for
the duration of the loop.

By calling drm_for_each_bridge_in_chain_from() again inside the callback,
does it attempt to acquire the exact same bridge_chain_mutex? Since standard
mutexes are not recursive, this could result in an immediate deadlock.

> +		if ((bridge->ops & DRM_BRIDGE_OP_DETECT) &&
> +		    (bridge->ops & DRM_BRIDGE_OP_EDID)) {
> +			unsigned long pixel_clock_rate =3D mode->clock * 1000;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-imx93-mipi=
-dsi-fix-mode-validation-v2-1-7aec3be5da2c@nxp.com?part=3D1
