Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205AE33FE02
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 15:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822019; cv=none; b=McZ3b1anTEbN/u/gpsH+qhYLdd0THeMFc5cdot6PTOZ+ZBO0ZqYPiJarGoRXXWQCJjBzeOIZk8GW0hhHrw2JDNekVXtSFXOJlX1kaG6rtrwbYxcAhYGyuDbRjeY4H/yoz4MuGzL9QJTWGjVOcN7881jtz2iuY3QT8RGEDngbhEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822019; c=relaxed/simple;
	bh=vj3aE85hDbw7uCURSaP7IQSnQ+S1YI+vBlGTt2ixjNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6HP10t5EIUYmu9VEOeKwvTQ65+zgHGqMSRBbTlKhlwBeij+wXh0GvrAnw+y0IEsLm6hwFlhEHhBRWBVZjwqCt2WQuX0fpxrbXMh1qgyOhQ53QUCViXcIMIIJRBUTx4xoEWu2BeslFyShZt5cdqVVJmVFdWQM7D9/1bYosm6Zug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=SnRBk3Rl; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="SnRBk3Rl"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3177F1F967;
	Thu, 23 Jul 2026 17:53:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784822014;
	bh=YhpAS7Om2Wra7yiqumfKj7cTlrvtZmIj2tUBITAsZvk=; h=From:To:Subject;
	b=SnRBk3RlpWy7u4WPPOyFWREbUvUtiNbNhbllHu76fVTCIMuhI7O6uU7+mlMU9CekF
	 nfDCEkZ0oZBRhROcj4OM6DB9ADCV6ZZkO9Jg9uXtqB0Ap4GNgAoQqQeFLA1JxrHxvf
	 jG0qx1gh8NPyNoygqfQsrNEsJut0n2F2TR8/m52Yt2DpUO9Bp1j7UeGLfjDKDJ+APY
	 LTtejBGO1ZmhFIG0XocNaxlCtXQPVe3uzmxO7HG4AhLjseyoOMPFcSUNeaEYHzNvkP
	 EO1j9FJBvmfTCRGGLlKkFjVSD8NUj/atnNkj7C9AgzF6QguBKvrkgRGRjkueFA7yPV
	 /BXTp5/IWtbtg==
Date: Thu, 23 Jul 2026 17:53:32 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
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
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] drm: mxsfb: Add optional DPI output bus-width
 configuration
Message-ID: <20260723155332.GB4453@francesco-nb>
References: <20260723093813.180089-1-francesco@dolcini.it>
 <20260723093813.180089-3-francesco@dolcini.it>
 <amI3mPBVXe0zj_tC@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amI3mPBVXe0zj_tC@SMW015318>

On Thu, Jul 23, 2026 at 10:47:36AM -0500, Frank Li wrote:
> On Thu, Jul 23, 2026 at 11:38:09AM +0200, Francesco Dolcini wrote:
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
> > When the optional property is absent, continue using the format reported
> > by the downstream display device, preserving the existing behavior.
> >
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> > v2: use the common bus-width property instead of the legacy interface-pix-fmt
> > ---
> >  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 24 ++++++++++++++++++++++++
> >  drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
> >  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 12 ++++++++++++
> >  3 files changed, 38 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > index 9b8fbda85d28..0545718a4b65 100644
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
> > @@ -209,7 +212,10 @@ static int mxsfb_load(struct drm_device *drm,
> >  		      const struct mxsfb_devdata *devdata)
> >  {
> >  	struct platform_device *pdev = to_platform_device(drm->dev);
> > +	struct device_node *np = pdev->dev.of_node;
> >  	struct mxsfb_drm_private *mxsfb;
> > +	struct device_node *ep;
> > +	u32 bus_width = 0;
> >  	int ret;
> >
> >  	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
> > @@ -236,6 +242,24 @@ static int mxsfb_load(struct drm_device *drm,
> >  	if (IS_ERR(mxsfb->clk_disp_axi))
> >  		mxsfb->clk_disp_axi = NULL;
> >
> > +	ep = of_graph_get_next_endpoint(np, NULL);
> 
> use auto cleanup
> 
> 	struct device_node *ep __free(device_node) = of_graph_get_next_endpoint(np, NULL);

Does it makes the code more read-able or better in this specific case? I
would say no, to me it is more compact and clear the way it is.


