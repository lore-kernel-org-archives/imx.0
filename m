Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CF82F39C7
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623962; cv=none; b=EMmGcikKuON/lcyEcXlQHivhaZ2vx7usdrdpUmtsMFh71JdHrFqGYzt6Y2Scb/L3dCRnJ5i3jQFHUlwVvjAwcKwAd5x4H1arNZ/EnZLo/VAD+yg7MUGxm2qUhA0y+ea3sNyTAaxUxDcFluCrnY34JeTsQ0EAqBvv7xx5OA6OqX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623962; c=relaxed/simple;
	bh=r+7q98y7ClXPiyCy4RtnVYlqkcO4bR4r88c00/VVHhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AchvNqc7/doYCzbO+qp0LsP1DX1GxbyG542YntBwH7AcPA1ltoErmpRAv4QqGqHBHRTy71sXaMSTWfs1kOCcjeRFJymcX+l4yB4QdYWgIz9kfc7tgmA5TlxP9lQo95e6B5Lg4diJFDySMSUBAVBtjWSw43PLCAnhUGtPmjI/W/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 711AF20268C;
	Tue, 21 Jul 2026 10:52:37 +0200 (CEST)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wm6DN-000Xk5-1B;
	Tue, 21 Jul 2026 10:52:37 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wm6DN-00000009YGz-0wQ6;
	Tue, 21 Jul 2026 10:52:37 +0200
Date: Tue, 21 Jul 2026 10:52:37 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/4] drm: mxsfb: Allow optional LCDIF interface format
 override
Message-ID: <bfhx5yyyyqxa6aty4ybdmwp7t7q6kyh5jacotlugf6cyhohmwt@ygi7jioxbyt4>
References: <20260717121847.488148-1-francesco@dolcini.it>
 <20260717121847.488148-3-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717121847.488148-3-francesco@dolcini.it>

Hi Francesco,

On 26-07-17, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. The
> format reported by the downstream panel or bridge describes the display
> input, but it does not describe how the LCDIF data pins are physically
> wired on the board.
> 
> These can differ. For example, a 16-bit LCDIF bus can be connected to a
> 24-bit display by wiring the available color bits to the corresponding
> display inputs. In that case, using the display's 24-bit format to
> configure LCDIF selects the wrong data-bus mode and changes the assignment
> of color bits on the LCD_DATA pins.
> 
> Read the optional interface-pix-fmt property from the LCDIF node and use
> it to select the media bus format used to configure LCDIF. This allows
> the LCDIF bus mode to describe the physical interface independently of
> the downstream display format.
> 
> When the optional property is absent, continue using the format reported
> by the downstream display device, preserving the existing behavior.
> 
> This follows the same approach already implemented in
> drivers/gpu/drm/imx/ipuv3/parallel-display.c.

According the driver comment, this is a legacy property. If you just
want to limit the physical bus width you could use the common of-graph
endpoint bus-width property.

Regards,
  Marco

> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 16 ++++++++++++++++
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c |  8 ++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 9b8fbda85d28..edf347968fd2 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -12,7 +12,9 @@
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/pm_runtime.h>
> @@ -209,7 +211,10 @@ static int mxsfb_load(struct drm_device *drm,
>  		      const struct mxsfb_devdata *devdata)
>  {
>  	struct platform_device *pdev = to_platform_device(drm->dev);
> +	struct device_node *np = pdev->dev.of_node;
>  	struct mxsfb_drm_private *mxsfb;
> +	u32 bus_format = 0;
> +	const char *fmt;
>  	int ret;
>  
>  	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
> @@ -236,6 +241,17 @@ static int mxsfb_load(struct drm_device *drm,
>  	if (IS_ERR(mxsfb->clk_disp_axi))
>  		mxsfb->clk_disp_axi = NULL;
>  
> +	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
> +	if (!ret) {
> +		if (!strcmp(fmt, "rgb24"))
> +			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +		else if (!strcmp(fmt, "rgb565"))
> +			bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> +		else if (!strcmp(fmt, "rgb666"))
> +			bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> +	}
> +	mxsfb->bus_format = bus_format;
> +
>  	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> index d160d921b25f..f64800f06a69 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -46,6 +46,8 @@ struct mxsfb_drm_private {
>  	struct drm_connector		*connector;
>  	struct drm_bridge		*bridge;
>  
> +	u32 bus_format;
> +
>  	bool				crc_active;
>  };
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index d8ebebc5314b..8b482727aed5 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -386,6 +386,14 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	if (!bus_format)
>  		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>  
> +	/*
> +	 * Prefer bus format set via optional "interface-pix-fmt" DT property,
> +	 * over panel or next bridge bus format. This is necessary to support
> +	 * 24bit DPI panels connected to a 18bit interface, for example.
> +	 */
> +	if (mxsfb->bus_format)
> +		bus_format = mxsfb->bus_format;
> +
>  	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
>  
>  	/* Write cur_buf as well to avoid an initial corrupt frame */
> -- 
> 2.47.3
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
