Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B70DDBE
	for <imx@lists.linux.dev>; Tue, 31 Dec 2024 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735677108; cv=none; b=f0Dzrp7oo8wRO/zmnOyfFGpg+HFtN7NZOolS5VFuf19iPGmIpc7x8jZgK09J6iqeytXCpzyva7wBNiH2Tx4JD9zg80RnacasWJFdnoSim++q+pHGclzfW/BhYn8MU/h55Q/yzbbig9XpBFIHWr6AhsVWLaurqn8iJGd/At/n85Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735677108; c=relaxed/simple;
	bh=kG+D/lnDclS7q11yLFrQ3G5z3SUsllmGGc3CrYLCNI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lATipN6WP8qiLZnaIo1JZgfn1quqgjm4onRhpFd2ujCbPS2ALRvenxOK7aIFT6hZ/fkcUOKHlT+jRQciSugBXpC4NWXan9Nka6kqceeDdlXu7Xm8ux/eAdg0qUPXf2dm/wG2Rm6FOFdFGtUI4AjMYB1rfGUv7WNz1SnuxkwqFqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I+QQXNix; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I+QQXNix"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42A5A1E6;
	Tue, 31 Dec 2024 21:30:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735677050;
	bh=kG+D/lnDclS7q11yLFrQ3G5z3SUsllmGGc3CrYLCNI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+QQXNixBkbtrHbpWlJmbDiCWN8gRN4e9e+EKWvPe+cAW2/Y6RPCWzCHrXT7Re4II
	 ou6MGteZhP8EJfuaKN3cypfznt2DJ6pM+wFJrm9ZOCIzvXItmtxro36aS5P4BFszc9
	 NAsEIJPtmawdQj2k40RjuRUHSMZvaRGLjuLzXABI=
Date: Tue, 31 Dec 2024 22:31:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <20241231203136.GD31768@pendragon.ideasonboard.com>
References: <20241231192925.97614-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241231192925.97614-1-marex@denx.de>

Hi Marek,

Thank you for the patch.

On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> HDMI but do not contain the HDMI connector node. This flag allows such
> DTs to work by creating the connector in the HDMI bridge driver. Do not
> use this flag, do not proliferate this flag, please fix your DTs.

What's the rationale for this, what prevents fixing DT instead of using
this flag ? Adding such a flag will most likely open the door to
proliferation.

If you can't fix the DT on particular boards, patching it could be an
option. We had a similar problem on Renesas boards, which we fixed with
a DT overlay, see commit 81c0e3dd82927064 ("drm: rcar-du: Fix legacy DT
to create LVDS encoder nodes"). This made the workaround self-contained,
and allowed dropping it several kernel versions later (in commit
841281fe52a769fe, "drm: rcar-du: Drop LVDS device tree backward
compatibility").

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V3: New patch
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++++----
>  include/drm/bridge/dw_hdmi.h              |  2 ++
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 996733ed2c004..852e73c0f686f 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2893,9 +2893,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> -		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> -					 bridge, flags);
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +		if (hdmi->plat_data->output_port_optional && !hdmi->next_bridge)
> +			return dw_hdmi_connector_create(hdmi);
> +		else
> +			return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> +						 bridge, flags);
> +	}
>  
>  	return dw_hdmi_connector_create(hdmi);
>  }
> @@ -3298,7 +3302,7 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
>  					  hdmi->plat_data->output_port,
>  					  -1);
>  	if (!remote)
> -		return -ENODEV;
> +		return hdmi->plat_data->output_port_optional ? 0 : -ENODEV;
>  
>  	hdmi->next_bridge = of_drm_find_bridge(remote);
>  	of_node_put(remote);
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 6a46baa0737cd..3bb6e633424a8 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -127,6 +127,8 @@ struct dw_hdmi_plat_data {
>  	struct regmap *regm;
>  
>  	unsigned int output_port;
> +	/* Used purely by MX8MP HDMI to work around broken DTs without HDMI connector node. */
> +	bool output_port_optional;
>  
>  	unsigned long input_bus_encoding;
>  	bool use_drm_infoframe;

-- 
Regards,

Laurent Pinchart
