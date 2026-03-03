Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A523845C0
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 08:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525167; cv=none; b=rAUIkZ8UTfHLNlfUtpdBUJFcjgF7YQK5HxgxMK+r+d7bKKgR3Tia9gBgI5bYLLSbubCGgVTEnx643IMwF7gKCRxhhFjQdT3UldZwhAUNjMKDUzI+6WZfWsWC7QF0/o3DxKX9V/2cfgmc1FMb1gtassIZe3UdmthvlMIY0agGJXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525167; c=relaxed/simple;
	bh=0GdfgMDV4ebHY8MXT4f/HTProAYyiFFJtMvorgsnlds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lB5CKOnKLLvvse0K2sO5McpWYHpTwKK01eZhCQRtlI9S1TPfVoYA8ClvcybuM2fyZwnBk1kAUNif01cyZGJ8qLR7SsPSdCSiL89WDtqcoupzf0pNZuBdsl2y9zPU4YsyypQYljqS6+kylc7GYoez3Fn6rKY6HcPAKpB4PFILr1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxKlG-0005ew-HV; Tue, 03 Mar 2026 09:05:46 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxKlB-003Vqs-2g;
	Tue, 03 Mar 2026 09:05:43 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxKlD-0000000FzWF-07cc;
	Tue, 03 Mar 2026 09:05:43 +0100
Date: Tue, 3 Mar 2026 09:05:43 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, luca.ceresoli@bootlin.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, frank.li@nxp.com
Subject: Re: [PATCH v10 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Message-ID: <jyawx2cllg2jecdvx6bdfv4qiinfiwb6cuuwdhditpr2g2evee@qiox37ahgczd>
References: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
 <20260302-v6-18-topic-imx93-parallel-display-v10-2-634fe2778c7a@pengutronix.de>
 <d97a9c0c-bdda-466a-8131-73799cdb20cd@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d97a9c0c-bdda-466a-8131-73799cdb20cd@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 26-03-03, Liu Ying wrote:
> On Mon, Mar 02, 2026 at 05:10:41PM +0100, Marco Felsch wrote:
> > From: Liu Ying <victor.liu@nxp.com>
> > 
> > NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> > field. Add a DRM bridge driver to support the display format configuration.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > [m.felsch@pengutronix.de: port to v7.0-rc1]
> > [m.felsch@pengutronix.de: add review feedback (Alexander)]
> > [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)]
> > [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
> > [m.felsch@pengutronix.de: add bus-width support]
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/gpu/drm/bridge/imx/Kconfig      |  11 ++
> >  drivers/gpu/drm/bridge/imx/Makefile     |   1 +
> >  drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 225 ++++++++++++++++++++++++++++++++
> >  3 files changed, 237 insertions(+)
> > 
> 
> [...]
> 
> > +static bool imx93_pdfc_bus_output_fmt_supported(const  u32 fmt)
> 
> As I mentioned in v9, can you drop const?
> I don't think const is needed.

It makes sense to spot failures early. Albeit this function is very
small, the fmt shouldn't be changed and therefore needs to be const.

I forgot to add the double space fix though, thanks.

> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
> > +		if (imx93_pdfc_bus_output_fmts[i] == fmt)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
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
> > +	input_fmts = kmalloc_obj(*input_fmts, GFP_KERNEL);
> 
> With the below two commits in v7.0-rc1, I believe that GFP_KERNEL can be
> dropped.
> 
> bf4afc53b77a Convert 'alloc_obj' family to use the new default GFP_KERNEL argument
> e19e1b480ac7 add default_gfp() helper macro and use it in the new *alloc_obj() helpers

Will drop the GFP_KERNEL.

> > +	if (!input_fmts)
> > +		return NULL;
> > +
> > +	*num_input_fmts = 1;
> > +
> > +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
> > +		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDIA_BUS_FMT_RGB888_1X24\n");
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
> > +
> > +	return input_fmts;
> > +}
> > +
> > +static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
> > +					  struct drm_bridge_state *bridge_state,
> > +					  struct drm_crtc_state *crtc_state,
> > +					  struct drm_connector_state *conn_state)
> > +{
> > +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> > +	const u32 format = bridge_state->output_bus_cfg.format;
> 
> Can you drop const?

No because this function is not supposed to change the format. The
function documentation says: this function can alter the bus_cfg.flags
bit _not_ the format.

Regards,
  Marco



> 
> -- 
> Regards,
> Liu Ying
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
