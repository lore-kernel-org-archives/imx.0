Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA822C08CF
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547281; cv=none; b=T0c8Bhxo8GoB9lDJFLdb2jI+pTJQ9BWvZvxcvOkv6FyVPIEQjzXmEjTIpdIH5hj6Eb2RTiRhYoF0u8xqs4MWDi+S+nZ17bOUJhdZ33QxXwxP1xMXyKEIZ8w/KHiz7vhyzkNmc/s2BKegXdSx2uu8BYWlBxPktpAoryfRJlW+jlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547281; c=relaxed/simple;
	bh=8yV6pOWCoCJi07eW/i43HtEMzdW9ZRAutYhSzBOVDyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6n3zNMp8xg7WIkXk6xtZwxo28lgfameiZw27EvzyYQ/IdzF58KG8Eu++vyuWHYtScotmOHJ4+Bu5fnhVI6dsr1xND19aEuaRttaBkdcXtDV3r71OTkrFPJJpeLFoMtwDcVlTjsLSiIRgtdz4JKPpV1VLPVSQTR/ptwAJO58+pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=yJjYXpSU; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="yJjYXpSU"
Received: from francesco-nb (93-33-22-216.ip42.fastwebnet.it [93.33.22.216])
	by mail11.truemail.it (Postfix) with ESMTPA id 8F5771FA72;
	Wed, 12 Aug 2026 17:07:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786547269;
	bh=QIfjX2+FT4/MfQrfD5uaOld2GWanjnVeBmCHbsRzOlg=; h=From:To:Subject;
	b=yJjYXpSUCLRCa5pojNpDgw1JjcG7rickEEAdul+edWkEhr8iaBia58o474wZ6lYs3
	 v9h+gO8qj/IVaR3xKZ6WPSyrGXMgguHGYG8KXZ7r650LVD+0pMX+djyAuQoOYgjJKi
	 TrgSSWlcDqubnPsSZTqSUI2T3XkoX1T/oLvoGlwr9lWBr1WT5Y+2lNsElIC0x368aH
	 /GZ/cD851KKG7fxZJOTyFLGyW5fVmRqF03XmcrS7VfFVrdLzAv8xPqoYYECbMm/Qi8
	 wqx4vp/11u4BZldR0KRlHKpiktmN89lLCT0cAsvFKpPbrjE+bJYvHf+7x6JQlMBtFU
	 dW0g+fkJkKAVA==
Date: Wed, 12 Aug 2026 17:07:43 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Francesco Dolcini <francesco@dolcini.it>, Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] drm: mxsfb: Add optional DPI output bus-width
 configuration
Message-ID: <20260812150743.GA169597@francesco-nb>
References: <20260812132954.148571-1-francesco@dolcini.it>
 <20260812132954.148571-3-francesco@dolcini.it>
 <sn6xydbjkkz5b5okgnenp3zspj4ivr6gjpxow26kjknl7i2ihh@a55eb3vhby4i>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sn6xydbjkkz5b5okgnenp3zspj4ivr6gjpxow26kjknl7i2ihh@a55eb3vhby4i>

On Wed, Aug 12, 2026 at 05:02:51PM +0200, Marco Felsch wrote:
> Hi Francesco,
> 
> On 26-08-12, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. The
> > format reported by the downstream panel or bridge describes the display
> > input, but it does not describe how the LCDIF data pins are physically
> > wired on the board.
> > 
> > These can differ. For example, a 16-bit LCDIF bus can be connected to a
> > 24-bit display by wiring the available color bits to the corresponding
> > display inputs. In that case, using the display's 24-bit format to
> > configure LCDIF selects the wrong data-bus mode and changes the assignment
> > of color bits on the LCD_DATA pins.
> > 
> > Read the optional bus-width endpoint property from the LCDIF output port
> > and use it to select the media bus format used to configure LCDIF. This
> > allows the LCDIF bus mode to describe the physical interface
> > independently of the downstream display format.
> > 
> > When the optional property is absent, or it has an invalid value, continue
> > using the format reported by the downstream display device, preserving
> > the existing behavior. The code is not validating the DT for
> > correctness and just fall back to the previous behavior in case of
> > errors.
> > 
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> > v3: improve commit message and make it clear that the code assumes that
> >     the DT is correct, when the DT contains an invalid property value,
> >     the code safely fall-back to the previous behavior
> > v2: use the common bus-width property instead of the legacy interface-pix-fmt
> > ---
> >  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 24 ++++++++++++++++++++++++
> >  drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
> >  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 12 ++++++++++++
> >  3 files changed, 38 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > index 8b4a500347fb..f8ecc8bbd63c 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > @@ -12,7 +12,10 @@
> >  #include <linux/clk.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/io.h>
> > +#include <linux/media-bus-format.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/property.h>
> >  #include <linux/pm_runtime.h>
> > @@ -211,7 +214,10 @@ static int mxsfb_load(struct drm_device *drm,
> >  		      const struct mxsfb_devdata *devdata)
> >  {
> >  	struct platform_device *pdev = to_platform_device(drm->dev);
> > +	struct device_node *np = pdev->dev.of_node;
> >  	struct mxsfb_drm_private *mxsfb;
> > +	struct device_node *ep;
> > +	u32 bus_width = 0;
> 
> IMHO this default value makes no sense with..
> 
> >  	int ret;
> >  
> >  	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
> > @@ -238,6 +244,24 @@ static int mxsfb_load(struct drm_device *drm,
> >  	if (IS_ERR(mxsfb->clk_disp_axi))
> >  		mxsfb->clk_disp_axi = NULL;
> >  
> > +	ep = of_graph_get_next_endpoint(np, NULL);
> > +	if (ep) {
> > +		of_property_read_u32(ep, "bus-width", &bus_width);
> > +		of_node_put(ep);
> > +	}
> > +
> > +	switch (bus_width) {
> > +	case 16:
> > +		mxsfb->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> > +		break;
> > +	case 18:
> > +		mxsfb->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> > +		break;
> > +	case 24:
> > +		mxsfb->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> > +		break;
> 
> these cases in case no bus-width was specified without the knowledge of
> the mxsfb_kms.c since the '0' value is not covered. However, I'm not the
> maintainer of this driver. Thanks for making use of the bus-width
> property :)

I think it's needed, otherwise the variable might be non-initialized if
the bus-width property is not present.

And I need it to be 0, by default, so that we do leave bus_format to 0,
and with that we maintain the previous existing behavior.

Francesco

