Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE0D381AF
	for <imx@lists.linux.dev>; Sun,  5 Jan 2025 23:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736119345; cv=none; b=C81f9XtEa16GOiLmgG6fuv3FnUn64b1mcMdTcd3yNCvisYQ/k20woGFMQnlWVgL9GoHd6fNf9Iad6ABoYcTUzxRr4Q1GumiLye7m8lMJUQlnSwiZziWvz68bL1Y+J4ztFTfPztWCkFwTDyi6eKEXcIJyKWLI9ttTrKin1liEonk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736119345; c=relaxed/simple;
	bh=i+mmSnetEJ2wYr6KUP6A42oOjaPOpfLk2IUU7cgmPXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQHrUKPAjriuUBXMiYmBTMpjkeGP5AJPpCtXkNMKn3iZVk7y3hzyTnV+Fk4L6ZwQ1L8c4kTTGBVuoL4qj7yLxtRmDNz2NtkGExy2YvBVfk660zZsShJMLhxlC/odLMzSvvDv2Q2z8iFB88W2sZktxNP25pKRhfuVLU5uaavHgMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S360THjp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S360THjp"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A7B4594;
	Mon,  6 Jan 2025 00:21:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736119290;
	bh=i+mmSnetEJ2wYr6KUP6A42oOjaPOpfLk2IUU7cgmPXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S360THjpWADamVJ+TSvowC9wx3ORxzsxua0OpNpA++42F7LO4tcQB02GrAC66qFug
	 tHQe06v7ywUgUVfV3jm6bewxqJbemV/r4pPjUlc5lM1W3OJ0OqFIlkP5qE9XQkDmvC
	 YfJc0cGPo9NHdtVpyxYGdLm6NvuT5V1KqhTKx+Mo=
Date: Mon, 6 Jan 2025 01:22:19 +0200
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
Subject: Re: [PATCH v4 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <20250105232219.GC21164@pendragon.ideasonboard.com>
References: <20250105190659.99941-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105190659.99941-1-marex@denx.de>

Hi Marek,

Thank you for the patch.

On Sun, Jan 05, 2025 at 08:06:03PM +0100, Marek Vasut wrote:
> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> HDMI but do not contain the HDMI connector node. This flag allows such
> DTs to work by creating the connector in the HDMI bridge driver. Do not
> use this flag, do not proliferate this flag, please fix your DTs and add
> the connector node this way:
> 
> ```
> / {
>     hdmi-connector {
>         compatible = "hdmi-connector";
>         label = "FIXME-Board-Specific-Connector-Label"; // Modify this
>         type = "a";
> 
>         port {
>             hdmi_connector_in: endpoint {
>                 remote-endpoint = <&hdmi_tx_out>;
>             };
>         };
>     };
> };
> 
> &hdmi_tx {
>     ...
> 
>     ports {
>         port@1 {
>             hdmi_tx_out: endpoint {
>                 remote-endpoint = <&hdmi_connector_in>;
>             };
>         };
>     };
> };
> ```

Are there any in-tree DT sources that use the old bindings ?

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
> V4: - Add HDMI connector node addition example into commit message
>     - Bail from dw_hdmi_bridge_attach() if DRM_BRIDGE_ATTACH_NO_CONNECTOR
>       is set and there is no hdmi->next_bridge , so the connector can
>       be created in scanout driver.
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 8 ++++++--
>  include/drm/bridge/dw_hdmi.h              | 2 ++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 996733ed2c004..e84693faf46dc 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2893,9 +2893,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +		if (!hdmi->next_bridge)
> +			return 0;
> +
>  		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
>  					 bridge, flags);
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

Let's complain loudly with a WARN_ON if output_port_optional is set.

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
