Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBFC3C108D
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 16:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887812; cv=none; b=TbbF7DlbL0RzOHC+l+x+IxnVoANb4gfeVfExhokBXvxsGcYVXOH0imzai69KrhZU66PzM/msCAyPPmbCJbuD8wtY7B6aJP0K3zUBjYY5Ha98o8a+VjlHnS+KYQqxWLbN31n7ajOcL6U1nbT0FK9v5+MUqLIWxHXQX29cl2EsynM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887812; c=relaxed/simple;
	bh=xzCr9VAHfI0nI0VFzhN4Yu/Ccs8Fx7xX5RGCf59H2TE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=jrG3YgrRjWKiH2NqNZyHVLvx9pD89lJR81LsJeFdOHl9DqJDTy004QhDvNy22OPYOdERabHalSHsYC7npV3GP9lCiIpRwbXn+xYXmdjBaeGcnPt8XJpvJ+hAK66JHcXVApStP+RbpHBOJ55AOtweqav0v5cCmyxE5OpSem9w6JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RWpWVqLP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RWpWVqLP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 237284E42FCF;
	Fri, 19 Jun 2026 16:50:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBFFF601AD;
	Fri, 19 Jun 2026 16:50:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06C93106C81BC;
	Fri, 19 Jun 2026 18:49:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781887803; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=euNd1sOD6N/DSEzKHx8mlfur3iC+PrQ2XOovLbDh1rY=;
	b=RWpWVqLPScqSVOAlJsvo8KGfxYXGrUxZTzslMe54AQ88hESLWfyi5Z6Mr9jw+lojIu+MRH
	v74eHwelGnoBlvSWgkm21KCA+Z5FQX5NahoFLRHAA3D91ViUud67VxPPnOprrsYjrBIyJS
	llFKxyD98aky4269+QvAjBpBtmSVN1v3tNQA9ZzKoEJZJPJWs6HSbPIXdLWeclfWCN9xfX
	J07lxb82LMwNzLAWlrRux+MNvla6KupL5c+S0ZQAWbcu2b3+E4eLCXaitFsGD3VGCJysS1
	aQl7A3RfU+T7ep6jtmG2ylgCp4Ai9bHSybXSi1jlh9UHPGp/A57ieZcF3LpYow==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Jun 2026 18:49:55 +0200
Message-Id: <DJD6I8NMLN3W.3LVT4L17HT5TU@bootlin.com>
Subject: Re: [PATCH v3] drm/bridge: imx93-mipi-dsi: Fix mode validation
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Luca Ceresoli" <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260515-imx93-mipi-dsi-fix-mode-validation-v3-1-91f7d22b2fe4@nxp.com>
In-Reply-To: <20260515-imx93-mipi-dsi-fix-mode-validation-v3-1-91f7d22b2fe4@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Liu,

On Fri May 15, 2026 at 8:54 AM CEST, Liu Ying wrote:
> i.MX93 MIPI DPHY PLL has limitation for matching with some pixel clock
> rates, e.g., the best DPHY PLL frequency is 445.333333MHz for a typical
> 1920x1080p@60Hz CEA/DMT display mode with a pixel clock rate running
> at 148.5MHz with 4 data lanes + RGB888 pixel in MIPI DSI sync pulse mode,
> while the expected PLL frequency is (148.5 * 24) / 4 / 2 MHz =3D 445.5MHz=
.
> Fortunately, VESA Display Monitor Timing Standard allows +/-0.5% pixel
> clock rate deviation for timings.  So, for those display modes read
> from EDID through a bridge with DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_ED=
ID
> operation bit masks set, pixel clock rate could be adjusted to match
> with the PLL frequency(for the above example, the pixel clock rate is
> adjusted to be 148.444444MHz with about -0.03% deviation from the 148.5MH=
z
> nominal rate so that the adjusted rate matches with the 445.333333MHz PLL
> frequency).
>
> Instead of checking the last bridge's operation bit masks against
> DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_EDID to determine if allowing
> +/-0.5% pixel clock rate deviation, check any bridge after this bridge,
> because the last bridge is usually a display connector bridge without
> any operation bit mask when the clock rate deviation is allowed.
>
> Fixes: ce62f8ea7e3f ("drm/bridge: imx: Add i.MX93 MIPI DSI support")
> Fixes: 5849eff7f067 ("drm/bridge: imx93-mipi-dsi: use drm_bridge_chain_ge=
t_last_bridge()")
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

I'm perhaps not the most qualified to review this change, but let me try.

> --- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> @@ -489,25 +489,43 @@ static int imx93_dsi_get_phy_configure_opts(struct =
imx93_dsi *dsi,
>  	return 0;
>  }
>
> +static inline struct drm_bridge *
> +imx93_dsi_get_next_bridge_in_chain(struct drm_bridge *bridge)
> +{
> +	struct drm_bridge *next =3D drm_bridge_get_next_bridge(bridge);
> +
> +	drm_bridge_put(bridge);
> +
> +	return next;
> +}
> +
>  static enum drm_mode_status
>  imx93_dsi_validate_mode(struct imx93_dsi *dsi, const struct drm_display_=
mode *mode)
>  {
>  	struct drm_bridge *dmd_bridge =3D dw_mipi_dsi_get_bridge(dsi->dmd);
> -	struct drm_bridge *last_bridge __free(drm_bridge_put) =3D
> -		drm_bridge_chain_get_last_bridge(dmd_bridge->encoder);
> +	struct drm_bridge *bridge;
>
> -	if ((last_bridge->ops & DRM_BRIDGE_OP_DETECT) &&
> -	    (last_bridge->ops & DRM_BRIDGE_OP_EDID)) {
> -		unsigned long pixel_clock_rate =3D mode->clock * 1000;
> -		unsigned long rounded_rate;
> +	for (bridge =3D drm_bridge_get_next_bridge(dmd_bridge);
> +	     bridge;
> +	     bridge =3D imx93_dsi_get_next_bridge_in_chain(bridge)) {
> +		if ((bridge->ops & DRM_BRIDGE_OP_DETECT) &&
> +		    (bridge->ops & DRM_BRIDGE_OP_EDID)) {
> +			unsigned long pixel_clock_rate =3D mode->clock * 1000;
> +			unsigned long rounded_rate;
>
> -		/* Allow +/-0.5% pixel clock rate deviation */
> -		rounded_rate =3D clk_round_rate(dsi->clk_pixel, pixel_clock_rate);
> -		if (rounded_rate < pixel_clock_rate * 995 / 1000 ||
> -		    rounded_rate > pixel_clock_rate * 1005 / 1000) {
> -			dev_dbg(dsi->dev, "failed to round clock for mode " DRM_MODE_FMT "\n"=
,
> -				DRM_MODE_ARG(mode));
> -			return MODE_NOCLOCK;
> +			/* Allow +/-0.5% pixel clock rate deviation */
> +			rounded_rate =3D clk_round_rate(dsi->clk_pixel, pixel_clock_rate);
> +			if (rounded_rate < pixel_clock_rate * 995 / 1000 ||
> +			    rounded_rate > pixel_clock_rate * 1005 / 1000) {
> +				dev_dbg(dsi->dev,
> +					"failed to round clock for mode " DRM_MODE_FMT "\n",
> +					DRM_MODE_ARG(mode));
> +				drm_bridge_put(bridge);
> +				return MODE_NOCLOCK;
> +			}
> +
> +			drm_bridge_put(bridge);
> +			break;
>  		}
>  	}

Is this logic specific to the imx93 MIPI DSI host only? Or should it be
made generic for all dw-hdmi users, or even every DSI host?

Also, iterating over the bridge chain is not very clean. I'm working on
bridge hotplug (not upstream yet) and bad things would happen if a bridge
were hot-unplugged during this loop. If the core did this sort of algorithm
it would be able to be more robust.

Finally, out of my utter ignorance on the subject, is the VESA +/-0.5%
margin generic enough that this driver can always rely on it?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
