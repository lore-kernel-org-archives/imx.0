Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8E68F66
	for <imx@lists.linux.dev>; Thu,  2 Jan 2025 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735840721; cv=none; b=VVh1HJ8teaHgGNuHVruwWvet+U7O/tjQPqkQrbmf7fGO5Wn55a8B0QiuqMbTNyznB3kz7w8hktxYNrtwsNbXKd5QQ6BP8ou9jkPex2OZ3fOqNZRoa0iK6dsd3ZGZtMOHe3l1lp8SPgBPb0IKa2b8Q3q/cFEbuKzN+0mEzwDfZ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735840721; c=relaxed/simple;
	bh=itmK9ohSHKoe9E/N2dCo9eQeD+Zqsdlc3qLg/X828AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaLhmy8xjk/O60eOpCyXLYOQnC977RPD/zShL0a7OZV22K+J8Xs+Box3Y3EugUAIn4ht3DFVoL8cku8tR+SVYtdUnIoFvKCLX+LJGy+tZJ+Ve7hmyyOt3OZiJ12aMgT5GbybpnRXbGGUG4hF5WfmFpFmRXk5KFmN6NXvfJGDx9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u01bKuQa; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u01bKuQa"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54252789365so4801286e87.0
        for <imx@lists.linux.dev>; Thu, 02 Jan 2025 09:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735840717; x=1736445517; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GJLTtYt8skTkQa/ayBcA5QTG5BimU4mHUK/+qBWt6To=;
        b=u01bKuQaEAAkmNrS2Mlb5LW1xhw63nCwsDcFn3trdoGlySrjSIC0c8XntIXVDczbUU
         eySnpxyAxtU0tYsR5LT7jUAKHacR01XY/6AWGXe9fcSAnJp5Lo9N6qJPCBjQ3SmlSmib
         SOMPMArwjIyXPoffoVtd3GMkQHrKqWMsEsqXIOa3eOtzbh4eHDIiRxK/+LRtoOFhiXYM
         HmYMTI8X731AaJfaL2/4tczUpnqtUoS1RHRpwLMNBBuJtOvmKgBhKXITPlROdl0HH59R
         S77i0CX96Hbcwskb3bG2PWvQGzZ8pNAIywbWnMq0Q6xXG0vo/4xqeEVOh/VXSh/GeA6z
         KfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735840717; x=1736445517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJLTtYt8skTkQa/ayBcA5QTG5BimU4mHUK/+qBWt6To=;
        b=M0060khuDJR8t7v+EfohLtLwycf7f/ZslY6AIPqvQhmuskzysk3Q/YVHy0tTnvrVyl
         9vhcv7lRIeprpNihMErjdmYWys6GqbTci8gsiTzgWhlYOGF4Wtq6r8+K59TizDLxt4Bj
         vyI2fVHWpM3yVQTUMt/ZzIVCf6B2d1xSk9yxBM1Fevn7ZmW1lvort/woE44Ywu+Z4AU3
         pQnU7oCgEYLaHLuRuagVam2PKvCk6O+d/QN+Ia5AmXspMrfTVMx6UvbW1cNcXBt/Oykm
         RgwvjVmwbUMjVeDxu/2VF56Kmdq21eDNApMqSE5N9x7JwidKlRY20aN+n8ow/6BoS86n
         M0ww==
X-Forwarded-Encrypted: i=1; AJvYcCWIfn/g5VAPimvx8A1Pkc67YEE3Jz2vaoeqsJ7WqeG7xnEuxWFHDPuXwBNLehnVXA0tgyw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwonmO4+tp3hZ/R2e3d6BqFPZKW50/w9dm5baMc+2zZqek6jNkt
	IB1uUvpay1SOltuCLFlcUTGF11YubaNIJduo2u5g3Jir/1OVrenZlPvTjrh6UGc=
X-Gm-Gg: ASbGncsUeFW9d9HSyeE9VDHe82TX8mOjOjLI5WbH1Pzfx/KHU5Bxp452LEsxOPgRQYh
	YRsVqGn3zEO2lIR/DBUjwZndRcYPkVH9vogn+JLHHriq9SKCGnewoLHctwhl0lZ65Z/KbU7NF1x
	fAUPeBghd8PvOitb/7LhkduSDjp05Da3ypgbnUmPMJwnDnqvF99wkZZC/hzAuOmtFk63+OCGE4E
	V+bmVwsP8KQb6hbbFiEyfAZRykuBGpfM4Ug2GIL7403BI/xv3wq6S8QpNpZO7BodKdSyYhZsDon
	seEzHN89r6hbRiVHQ01cYIdPIEefmaqfKOFk
X-Google-Smtp-Source: AGHT+IGsMD2AJtN8AO7P8Gm6p46pCYxJlOrHtLA9sNt/dLBZQv2u2yZ/9NF4quLmhSUrRcYhu3IfXg==
X-Received: by 2002:a05:6512:39d0:b0:542:2a20:e69a with SMTP id 2adb3069b0e04-5422a20e779mr13437754e87.11.1735840717312;
        Thu, 02 Jan 2025 09:58:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238138c3sm3880439e87.140.2025.01.02.09.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 09:58:35 -0800 (PST)
Date: Thu, 2 Jan 2025 19:58:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/4] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
 flag to drm_bridge_attach
Message-ID: <u4hjoteybchte2fdmxle5rsu5jbohm7hjjoejrxiqa6lszqm56@6facok3v55kg>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-3-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231192925.97614-3-marex@denx.de>

On Tue, Dec 31, 2024 at 08:28:50PM +0100, Marek Vasut wrote:
> Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
> added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
> this flag in some way since then.
> Newly added bridge drivers must no longer contain the connector creation and
> will fail probing if this flag isn't set.
> 
> In order to be able to connect to those newly added bridges as well,
> make use of drm_bridge_connector API and have the connector initialized
> by the display controller.
> 
> Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")
> 
> This makes LT9611 work with i.MX8M Plus.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
> V2: Add RB from Dmitry
> V3: - Select DRM_DISPLAY_HELPER
>     - Use return dev_err_probe() directly
>     - Add missing of_node_put(ep)
>     - Add test using drm_bridge_get_next_bridge() to try and determine
>       if the HDMI connector was missing in DT or not, and if it was
>       missing, if it was created by the HDMI bridge driver.
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  2 ++
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 30 ++++++++++++++++++++++++++++--
>  2 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 264e74f455547..fe98674d5a298 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -12,6 +12,7 @@ config DRM_MXSFB
>  	select DRM_CLIENT_SELECTION
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> +	select DRM_BRIDGE_CONNECTOR

Shouldn't this chunk go to another patch?

>  	select DRM_GEM_DMA_HELPER
>  	select DRM_PANEL
>  	select DRM_PANEL_BRIDGE
> @@ -28,6 +29,7 @@ config DRM_IMX_LCDIF
>  	depends on COMMON_CLK
>  	depends on ARCH_MXC || COMPILE_TEST
>  	select DRM_CLIENT_SELECTION
> +	select DRM_DISPLAY_HELPER
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index 8ee00f59ca821..dc39adabb3cd9 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -17,6 +17,7 @@
>  #include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fbdev_dma.h>
> @@ -48,8 +49,10 @@ static const struct drm_encoder_funcs lcdif_encoder_funcs = {
>  static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  {
>  	struct device *dev = lcdif->drm->dev;
> +	struct drm_device *drm = lcdif->drm;
> +	struct drm_connector *connector;
>  	struct device_node *ep;
> -	struct drm_bridge *bridge;
> +	struct drm_bridge *bridge, *nextbridge;
>  	int ret;
>  
>  	for_each_endpoint_of_node(dev->of_node, ep) {
> @@ -97,13 +100,36 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  			return ret;
>  		}
>  
> -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> +		ret = drm_bridge_attach(encoder, bridge, NULL,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  		if (ret) {
>  			of_node_put(ep);
>  			return dev_err_probe(dev, ret,
>  					     "Failed to attach bridge for endpoint%u\n",
>  					     of_ep.id);
>  		}
> +
> +		nextbridge = drm_bridge_get_next_bridge(bridge);
> +		nextbridge = drm_bridge_get_next_bridge(nextbridge);
> +		/* Test if connector node in DT, if not, it was created already */

By whom? And why? There is no display-connector bridge, but there is a
normal bridge chain, you have passed DRM_BRIDGE_ATTACH_NO_CONNECTOR, so
now it's a proper time to create drm_bridge_connector. You have added
the next_bridge_optional flag, but it should just prevent the dw driver
from returning the error if there is no next_bridge.

> +		if (!nextbridge)
> +			continue;
> +
> +		connector = drm_bridge_connector_init(drm, encoder);
> +		if (IS_ERR(connector)) {
> +			of_node_put(ep);
> +			return dev_err_probe(drm->dev, PTR_ERR(connector),
> +					     "Failed to initialize bridge connector: %pe\n",
> +					     connector);
> +		}
> +
> +		ret = drm_connector_attach_encoder(connector, encoder);
> +		if (ret < 0) {
> +			of_node_put(ep);
> +			drm_connector_cleanup(connector);
> +			return dev_err_probe(drm->dev, ret,
> +					     "Failed to attach encoder.\n");
> +		}
>  	}
>  
>  	return 0;
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
