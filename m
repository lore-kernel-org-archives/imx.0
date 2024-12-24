Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5A7372
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 01:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735002383; cv=none; b=P92IdGHzhwBQIvU7EiDURqUZwR2raHc+O/Z7d5J0IsKEGFIvwm+b7R20udJG2d6G+k/iBrDn8LjfNLknvfu3AKvTA8bVXw5jfqTLb89lrRe/xF9wL32LXdUspnFfO6FURYBjcDePTTCyTbC+QUIM2pSSFnEYE0HtofWXZuRGyX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735002383; c=relaxed/simple;
	bh=zHqY4xQsca3lJphxze85EA1jO5sfFX5TJDlULOHuGbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwR0oEm9ib6S6sBlXtan4SWdYS9/QoO7oNZL2qCN1GzbeEIhCq9wSPn0tZ909qcLu8cAmTvDu3wEwVTxxQ8ypcAC/YYocL89ZDnKsxcJFO44M1p4LitMIzhmmLcyydHfQ+RhBUvytESfXOW64C8JQ8m4rx3hBj1zUDZk6YhqjLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ejSoWnye; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ejSoWnye"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so54560901fa.1
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 17:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735002378; x=1735607178; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/3CvzPcAkLXjsb0Utu5Ntg8+0IyMGFyxJmACpHhJ2L8=;
        b=ejSoWnye7X7U0+86YZPMwkVY04Ea9k2zXnBR40SagJl4le51v+d8fqfRdQCVkSbxIV
         EQNx0+hl7eqvKiCIlwh9032+r+01LUuhb/5iZuZqHKRZWiz/MNyu6QckS1HBzm1FICC6
         uG6xNavznnmdc7ipkQ9ecqJpvVv8gVpsX4kxX+C99N4chr2GAiuLQdyzcO+ugCzIv55P
         5uHYBvfax4sZ3lxxl+gCTXdbGi9LOkG5s8kkpEmb0Nm9z4w4/nCxxYfaJ++eVFVPMDLo
         jf9Cp/Wfu8teWBVobPv9BKFbHBcsYWrEfU8FvYJ5lybpUEiRpff3vfIzSIWJn22/P+av
         IGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735002378; x=1735607178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3CvzPcAkLXjsb0Utu5Ntg8+0IyMGFyxJmACpHhJ2L8=;
        b=Vr8y009cWfd/YTMgKxtkPdIWzWyu74dtIiB3/7sEp095Iq0Zh6nfemxReF+N9LRgzT
         UlIJbCw1Zbznf12A3G1UsMPdv17onSNCQ8yR4YMvAW99edUlPtIg5SV46s94mk8Cvvm9
         JWMWddboNvN/+hpEju02w9OVUNF/Ac8kKy45DVcFX6VDodORG9ugYgpCFhvL6KL/3XSM
         pSKTOhqZi5dwLHzmHxYHtbDvvYAUL86wdA2vj0r7kR5ZXeYnZmmjQOk66n5NqM8RsYm+
         oOolzTPF0AFmYpgcbEXLp6iw0Mng0ANLNWLL0JxqNgKuSfphhHo/P6+NNsL7zOWmubQR
         AOlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxSYxLJ39iJN3suT/U8ksHylFrEYKy1k4KDciWsJwgJzVYu5DxZ5EtKSIY7ASN6Ks5ksI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9XBHMHJAT7hzLrCwgGnBA2RdiUaF3+RRxWcTLM80Qn1Y3bdL9
	R4kuYWXW7gqc3uA8H00/B8RIXRsx2N/8oEYD9DQEzRIc5aCYqN9oZ9ClhRNu+xw=
X-Gm-Gg: ASbGncv+tvihIWlu8tgNvJZIWO4XwTMJDJwKXlDDO6LbttuTftq+f/XWSpYQFP6EE1a
	q1IQd7l6NKzvW9hcPiTs9xzAk6A1r5tSEDGIQnyPZXw7BYLvjwLmjW4OPYeLnIP41WMWsEmUEsT
	NYO/QFfP1nFxPnHJ2yyN0MyIu/1BeulfcYHpsTGDDGXRGdC6dnCWjVc3Ze9L9BaS5EFRYenbKmf
	K/Y6pDwm1FBS4gtiQ4E5dkxBdqty8d8pURBUmx2eupdWnJ5tgUYkxZqcmqgAXsjJ9t26ctaWhgv
	vseMAQd2o2Urg0KyYc08h4Z9Wjj/XjV7qCYT
X-Google-Smtp-Source: AGHT+IFB9DIkvfAI7cjpDzasCEmR4TU1CXKXT3DFKiXSsCrTKBANpHD1zxLbg90VBtOFOdmeLLerQQ==
X-Received: by 2002:a2e:a991:0:b0:300:8ff:d93f with SMTP id 38308e7fff4ca-30468577a7fmr49728481fa.22.1735002378148;
        Mon, 23 Dec 2024 17:06:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cccasm15083871fa.1.2024.12.23.17.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:06:16 -0800 (PST)
Date: Tue, 24 Dec 2024 03:06:14 +0200
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
Subject: Re: [PATCH 3/3] drm/mxsfb: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
Message-ID: <mqvhpdofvtuiewzkfn7qghwwmpf6o5d6ru6yq7lif6znvcva3a@piu42vpzofzk>
References: <20241224004439.239880-1-marex@denx.de>
 <20241224004439.239880-3-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224004439.239880-3-marex@denx.de>

On Tue, Dec 24, 2024 at 01:42:49AM +0100, Marek Vasut wrote:
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
> This makes LT9611 work with i.MX8M Mini.
> 
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
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 36 +++++++++++++++++++++----------
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c |  6 +++---
>  4 files changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 07fb6901996ae..e67de148955b2 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -12,6 +12,7 @@ config DRM_MXSFB
>  	select DRM_CLIENT_SELECTION
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> +	select DRM_BRIDGE_CONNECTOR
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_PANEL
>  	select DRM_PANEL_BRIDGE
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 59020862cf65e..d034c21e186a4 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -20,6 +20,7 @@
>  #include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_dma.h>
> @@ -118,10 +119,10 @@ static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
>  
>  static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
>  {
> +	struct drm_connector *connector = &mxsfb->connector;

Drop the initialisation, it is useless.

>  	struct drm_device *drm = mxsfb->drm;
> -	struct drm_connector_list_iter iter;
> -	struct drm_panel *panel;
>  	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
>  	int ret;
>  
>  	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
> @@ -139,21 +140,34 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
>  	if (!bridge)
>  		return -ENODEV;
>  
> -	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
> +	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  	if (ret)
>  		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
>  
> -	mxsfb->bridge = bridge;
> +	connector = drm_bridge_connector_init(drm, &mxsfb->encoder);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		dev_err_probe(drm->dev, ret,
> +			      "Failed to initialize bridge connector: %pe\n",
> +			      connector);
> +		return ret;
> +	}
>  
> -	/*
> -	 * Get hold of the connector. This is a bit of a hack, until the bridge
> -	 * API gives us bus flags and formats.
> -	 */
> -	drm_connector_list_iter_begin(drm, &iter);
> -	mxsfb->connector = drm_connector_list_iter_next(&iter);
> -	drm_connector_list_iter_end(&iter);
> +	ret = drm_connector_attach_encoder(connector, &mxsfb->encoder);
> +	if (ret < 0) {
> +		dev_err_probe(drm->dev, ret,
> +			      "Failed to attach encoder.\n");
> +		goto err_cleanup_connector;
> +	}
> +
> +	mxsfb->bridge = bridge;
>  
>  	return 0;
> +
> +err_cleanup_connector:
> +	drm_connector_cleanup(connector);
> +	return ret;
>  }
>  
>  static irqreturn_t mxsfb_irq_handler(int irq, void *data)
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> index d160d921b25fc..7a24e96ab4263 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -43,7 +43,7 @@ struct mxsfb_drm_private {
>  	} planes;
>  	struct drm_crtc			crtc;
>  	struct drm_encoder		encoder;
> -	struct drm_connector		*connector;
> +	struct drm_connector		connector;

This connector isn't getting used. How is this supposed to work? Store
the connector that you got from drm_bridge_connector_init() here
instead.

>  	struct drm_bridge		*bridge;
>  
>  	bool				crc_active;
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 7ed2516b6de05..30584091e2aa8 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -281,7 +281,7 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
>  {
>  	struct drm_device *drm = mxsfb->crtc.dev;
>  	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
> -	u32 bus_flags = mxsfb->connector->display_info.bus_flags;
> +	u32 bus_flags = mxsfb->connector.display_info.bus_flags;
>  	int err;
>  
>  	if (mxsfb->bridge && mxsfb->bridge->timings)
> @@ -378,8 +378,8 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	}
>  
>  	/* If there is no bridge, use bus format from connector */
> -	if (!bus_format && mxsfb->connector->display_info.num_bus_formats)
> -		bus_format = mxsfb->connector->display_info.bus_formats[0];
> +	if (!bus_format && mxsfb->connector.display_info.num_bus_formats)
> +		bus_format = mxsfb->connector.display_info.bus_formats[0];
>  
>  	/* If all else fails, default to RGB888_1X24 */
>  	if (!bus_format)
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
