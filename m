Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4522919E968
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 14:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768486345; cv=none; b=Inzu/sTCwEWsra7TsGsO0WNjckVrSrG1frJyERsys+DJJ3vfdWKmbPAa/Wvtui7AcBgJA+O3C55AzCfWHYxC3eKLogTDZxWrwgVz3cmh+cQ0veb2/SnxzDzBWJIz+D4No0VUa5egX8BOsxCfmmGRzX6nAqmjHR8PgS148/PAJZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768486345; c=relaxed/simple;
	bh=eggpPxTN7RjoQpqxP9jBcHBsnHBk/37W4iSE2x3kKgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yqly+8PYqXU3NIUmXvSazwXyLO+1YVf8UkbEqtpRzmVxjX2/EAKg/93OdhQP97EMqdwQDZmaa3gbXeMfw+PlXefH3fPrT7vqE/3MiQ8adEeYR7wT5LIPTE1vExRaYapmXb4bNxN4AZEB8U8AbvSgqaRegX5DxXvytLG/WUbc8dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vgO4v-0007fo-B1; Thu, 15 Jan 2026 15:12:01 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vgO4u-000lR8-2N;
	Thu, 15 Jan 2026 15:12:00 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vgO4t-00DdOA-2k;
	Thu, 15 Jan 2026 15:11:59 +0100
Date: Thu, 15 Jan 2026 15:11:59 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Message-ID: <20260115141159.7wepnmnvnhd4la3s@pengutronix.de>
References: <20260113-v6-18-topic-imx93-parallel-display-v8-0-4abccdc473a5@pengutronix.de>
 <20260113-v6-18-topic-imx93-parallel-display-v8-2-4abccdc473a5@pengutronix.de>
 <DFO5LHWDD7S2.19P595M4CWIPI@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFO5LHWDD7S2.19P595M4CWIPI@bootlin.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Luca,

On 26-01-14, Luca Ceresoli wrote:
> Hello Marco, Liu,
> 
> On Tue Jan 13, 2026 at 8:07 PM CET, Marco Felsch wrote:
> > From: Liu Ying <victor.liu@nxp.com>
> >
> > NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> > field. Add a DRM bridge driver to support the display format configuration.
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > [m.felsch@pengutronix.de: port to v6.19-rc1]
> > [m.felsch@pengutronix.de: add review feedback (Alexander)]
> > [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)]
> > [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
> > [m.felsch@pengutronix.de: add bus-width support]
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> I'm sorry to be reviewing at v8 only, I hadn't noticed this series before.
> 
> > ---
> >  drivers/gpu/drm/bridge/imx/Kconfig      |  11 ++
> >  drivers/gpu/drm/bridge/imx/Makefile     |   1 +
> >  drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 221 ++++++++++++++++++++++++++++++++
> >  3 files changed, 233 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> > index b9028a5e5a065c3237b404111d8df57e8e017f9d..181ee87bc0f9f65ee0b6e5edbb48ba808dfbb71f 100644
> > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -99,4 +99,15 @@ config DRM_IMX93_MIPI_DSI
> >  	  Choose this to enable MIPI DSI controller found in Freescale i.MX93
> >  	  processor.
> >
> > +config DRM_IMX93_PARALLEL_DISP_FMT_CONFIG
> > +	tristate "NXP i.MX91/i.MX93 parallel display format configuration"
> 
> Minor nit: this is a driver for a device, so calling it "configuration"
> seems weird. From the code it looks like a device converting the color
> format, so what about "NXP i.MX91/i.MX93 parallel display format
> converter"?

works for me.

> 
> [...]
> 
> > +static int imx93_pdfc_bridge_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct imx93_pdfc *pdfc;
> > +	struct device_node *ep;
> > +	int err;
> > +
> > +	pdfc = devm_drm_bridge_alloc(dev, struct imx93_pdfc, bridge, &funcs);
> > +	if (IS_ERR(pdfc))
> > +		return PTR_ERR(pdfc);
> > +
> > +	pdfc->regmap = syscon_node_to_regmap(dev->of_node->parent);
> > +	if (IS_ERR(pdfc->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(pdfc->regmap),
> > +				     "failed to get regmap\n");
> > +
> > +	/* No limits per default */
> > +	pdfc->phy_bus_width = 24;
> > +
> > +	/* Get output ep (port1/endpoint) */
> > +	ep = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
> > +	if (ep) {
> > +		err = of_property_read_u32(ep, "bus-width", &pdfc->phy_bus_width);
> > +		of_node_put(ep);
> > +
> > +		/* bus-width is optional but it must have valid data if present */
> > +		if (err && err != -EINVAL)
> > +			return dev_err_probe(dev, err,
> > +					     "failed to query bus-width\n");
> > +	}
> > +
> > +	pdfc->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> > +	if (IS_ERR(pdfc->next_bridge))
> > +		return dev_err_probe(dev, PTR_ERR(pdfc->next_bridge),
> > +				     "failed to get next bridge\n");
> > +
> > +	pdfc->dev = dev;
> > +	pdfc->bridge.driver_private = pdfc;
> 
> pdfc embeds the struct drm_bridge, which is the mandatory design since
> devm_drm_bridge_alloc() got added, so driver_private shouldn't be needed
> anymore. Most drivers have a bridge_to_foo() inline function using
> component_of() to get the private struct from the drm_bridge pointer,
> e.g. [0] and [1].
> 
> [0] https://elixir.bootlin.com/linux/v6.18.5/source/drivers/gpu/drm/bridge/simple-bridge.c#L39-L43
> [1] https://elixir.bootlin.com/linux/v6.18.5/source/drivers/gpu/drm/bridge/ti-sn65dsi83.c#L287-L290
> 
> A short discussion took place a few months ago about driver_private, kind
> of suggesting it might be removed after all drivers have switched to
> devm_drm_bridge_alloc(). I think we should at least not introduce new users
> of driver_private at least.

Sure, I wasn't aware that driver_private is going to be removed.

Regards,
  Marco

> 
> Best regards,
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
