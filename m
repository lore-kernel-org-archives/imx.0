Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D352C49218D
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 21:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572962; cv=none; b=B/L8HiqRRQEsWBK6KfaIWtGFM0aw7ajd7dhjxPOQhEbAdO+nFMhCEiqt+vUEjkZ3slEs3zqSTLXj9gDLsnt8e57aiH+D4l/DxWQOeccu+v7BZ2jXbHLoM2C2l+4PA67crtBx1j9yjLQqlCegumqvmcuYURbaygzZTJew0IwAO+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572962; c=relaxed/simple;
	bh=s5KsJEnDIZDKyvDOkFuYgw4SVvoVaal7mtVJSjN28ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFQ434FYg1Om7GazT+LNvyucqc74Z1ieaZD7lvf4U7PQIxu8GrrkbPweANG6Z+/uRaJzU7CGQpSYlxqyFjnZa7e3mWYhvQP+gmpay2lCYA+rbeRPdi9e17CVXEi0nw1n14R8PjvCDzbc5Vwjya9Uawv5gWmfp5g6FJ24d00d/FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxXBs-0000S8-Bq; Tue, 03 Mar 2026 22:22:04 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxXBo-003bpC-2q;
	Tue, 03 Mar 2026 22:22:02 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxXBq-0000000G9tJ-0Owv;
	Tue, 03 Mar 2026 22:22:02 +0100
Date: Tue, 3 Mar 2026 22:22:02 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, luca.ceresoli@bootlin.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Message-ID: <3dyb7wc7tg6hc4o4qocn4nft7bu3hbdpxcnv7cln2q6vkxo7bw@dtnswwyou5sp>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
 <20260303210131.2966214-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303210131.2966214-2-Frank.Li@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 26-03-03, Frank Li wrote:
> From: Frank Li (AI-BOT) <frank.li@nxp.com>
> 
> AI bot review and may be useless.

Hi Frank,

albeit I'm very open to new technology, I would appreciate it if your
AI-BOT is used internally first till you're convinced that it reports
real issues instead of false-positives.

Regards,
  Marco

> > +static u32 *
> > +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +					    struct drm_bridge_state *bridge_state,
> > +					    struct drm_crtc_state *crtc_state,
> > +					    struct drm_connector_state *conn_state,
> > +					    u32 output_fmt,
> > +					    unsigned int *num_input_fmts)
> > +{
> > +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> > +	u32 *input_fmts;
> > +
> > +	*num_input_fmts = 0;
> > +
> > +	input_fmts = kmalloc_obj(*input_fmts);
> > +	if (!input_fmts)
> > +		return NULL;
> 
> Missing kfree(input_fmts) in error path if the switch statement
> or subsequent logic fails. Consider allocating a fixed-size array
> or using devm_kzalloc() instead.
> 
> > +	*num_input_fmts = 1;
> > +
> > +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
> > +		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDIA_BUS_FMT_RGB888_1X24\n");
> 
> Line exceeds 80 characters (97 chars). Break into two lines.
> 
> > +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> > +		return input_fmts;
> > +	}
> > +
> > +	switch (output_fmt) {
> > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > +	case MEDIA_BUS_FMT_RGB565_1X16:
> > +		input_fmts[0] = output_fmt;
> > +		break;
> > +	case MEDIA_BUS_FMT_RGB666_1X18:
> > +	case MEDIA_BUS_FMT_FIXED:
> > +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> > +		break;
> > +	}
> 
> Switch statement lacks default case. Add default case to handle
> unexpected format values explicitly.
> 
> > +static int imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
> > +					    struct drm_atomic_state *state)
> > +{
> > +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> > +	const struct drm_bridge_state *bridge_state;
> > +	unsigned int mask = PARALLEL_DISP_FORMAT;
> > +	unsigned int val;
> > +
> > +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> > +
> > +	switch (bridge_state->output_bus_cfg.format) {
> > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > +	case MEDIA_BUS_FMT_FIXED:
> > +		val = FORMAT_RGB888_TO_RGB888;
> > +		if (pdfc->phy_bus_width == 18) {
> > +			/*
> > +			 * Can be valid if physical bus limitation exists,
> > +			 * therefore use dev_dbg().
> > +			 */
> > +			dev_dbg(pdfc->dev, "Truncate two LSBs from each color\n");
> > +			val = FORMAT_RGB888_TO_RGB666;
> > +		}
> > +		break;
> > +	case MEDIA_BUS_FMT_RGB666_1X18:
> > +		val = FORMAT_RGB888_TO_RGB666;
> > +		
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
