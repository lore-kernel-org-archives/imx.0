Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D3718D
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 01:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735003392; cv=none; b=knO152hXjGwwMsT9/tQIT5SF9L+7CY6g1ONpTOe2QzpBxPPA0P9mlY8FJ4acibuNdugaJzPNaoiQ/h1MLAeniM2Rfmgek8PfFeQyEAU4ElTOpgjVzFZDHQQvXomEsguRr8IM4zpp6+v+9+wkoknmODuZXj/4ztpuC3wwxdQxC7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735003392; c=relaxed/simple;
	bh=PWfejXsNDl3J6Ox3FlvBCCshZIdMJkgj4uPxS3sIoyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNyDli+VbuU00D0Ct4pbVt9GxzAA/YmlQyxzUGidGdli2TUJBHZWJin6Mi8yKGDBwQ8nIRBzKaaWupdqMLmVPfWRQoynoLWwjc8CjnDGzd2CChio55lIVgFCMBGf7VHIYiQ5sheklrv0hfnWhvvCCcg4QRRkNP4YvLGlXgZYdpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGBcr3VU; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGBcr3VU"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54024aa9febso5126017e87.1
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 17:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735003388; x=1735608188; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BgxtTWwZUgiZR43yGPEWTTCFUTYez4EW86BjjsdTbVM=;
        b=zGBcr3VUzp31+spcu9nNEwUQ/4kcygEAdNO4QLSUm/QwQvCSLbZRXYkwVLqA11JCIl
         exbshASfDtcHy8dGaZFxPsHmYus60c9IycSpUHE5I+zyaSODL4nS7BJ29Fz9zL7QSNjm
         fmLWsJt87QVuP6YWD6puSIUzKJk4xZ8THFcpL3L2nrzyKns+IcigV3XTRZ1jsDYnvu91
         4bNADmw/AFGG88nKmQwoF4kPwCxEr5n4FLgcqCTw69tlQ5zmU/nrmN9F6UyxN7K0bBE8
         FwOKKrTiutMyGtxooM+cwZfPb0Vxvdn85LIUlZILNzbncgCHyyZO6rS5jH+8FoTTio7w
         RwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735003388; x=1735608188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgxtTWwZUgiZR43yGPEWTTCFUTYez4EW86BjjsdTbVM=;
        b=ini6Kx3C+SE4cev0a1qlSiGAp9U23Gzo4i9OMLx4wbfwozIGKgnzG3UEREwOZirazV
         E72OqyxfralrsAXE9mnPc98jECgx/LW7G8ZKieOmYSENJcCBrVaN3AaKNQsAlBBcvDvJ
         jFCPhFbHfN4oSc846a3LU6KkNvL+RkgKrGlrhaLI86yJOO2UWq6+md7ejLPrDLf9f3E7
         2KxON8w0rPrMjpdy9FMLRr2IHyP50QMbKCGbf7G/aQGlKfvsc0C7QZMjKE/uiBKXdkAF
         PjuuU3N7kYnF6NveOpTEb8nn1AzdqpcEqCQgYYMkC6gbw6MU8tozVbFiK2KVx1gC1sFq
         1bEA==
X-Forwarded-Encrypted: i=1; AJvYcCW+WhELnj71dFyL8dIp1/i+dFoyIhUQfGKUAl2R6erltZaTQlEE98rGoTAL1PW06jWCQXI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLV42hpOTqTV0KBSMZX9s05tLBUlOi9vLrYftXoO/wAXKOYPvJ
	ktz3FmALu726HdkPDfvNJdcfcdRramTDKaD7P+HOvZvz4mDpoP1NpoZcxxbh5r8=
X-Gm-Gg: ASbGncueBcgICJ4S2Gq1SbEUlsFBxNgQH8bMiNO3XlSkbCXMGNBF+FoIlf25KOdyTih
	yMK3XcTebn6g9sm8op6gvx1bCGJjUBQfm4FFMWnemar9kp0LQ7vyTejIqO10j1LS+8a59Xzxgki
	UH91uQlIRObqzSnL4bVFYYvMXfukBN/UQJtw8LcWxP0JtNXjRhriBqMNP527GZZcVsgpssEmBXV
	uiyE5Sa1XOUa9NNz3Q8VJDd2ic4xmQC54N5r45/mU/n/3LaEYDhqkkGI/fjsshCrqZOghO0CYOZ
	hMp3gS2Gljh9Q0BHU3sMySeul33SL++5fnL9
X-Google-Smtp-Source: AGHT+IE0cj501KVsxr5E+oOy+kYCAVFozA0mjr9ON0hVv1bfayb8BvzJJWWAMM6IBPiWdzjgftxlSw==
X-Received: by 2002:a05:6512:acc:b0:540:1dca:52d3 with SMTP id 2adb3069b0e04-54229540670mr4513495e87.29.1735003388265;
        Mon, 23 Dec 2024 17:23:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813692sm1417891e87.125.2024.12.23.17.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:23:06 -0800 (PST)
Date: Tue, 24 Dec 2024 03:23:04 +0200
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
Subject: Re: [PATCH 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <ovbuijd2kyq7c2ypjv6f4ttnpom53o5sagvafwf7ddvemq4orw@zi3hr22p4zjh>
References: <20241224004439.239880-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224004439.239880-1-marex@denx.de>

On Tue, Dec 24, 2024 at 01:42:47AM +0100, Marek Vasut wrote:
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> The output_port set to 1 makes the DW HDMI driver core look up the
> next bridge in DT, where the next bridge is often the hdmi-connector .

Just to note: currently this will prevent one from using CEC with that
HDMI connector. I have a WIP series which provides generic CEC helpers
similar to HDMI Connector and HDMI Audio, but to make it work with
dw-hdmi would require one to convert the bridge into using
DRM_BRIDGE_OP_HDMI.

> 
> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
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
>  drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb856..d8e9fbf75edbb 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  config DRM_IMX8MP_HDMI_PVI
>  	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>  	depends on OF
> +	select DRM_DISPLAY_CONNECTOR
>  	help
>  	  Choose this to enable support for the internal HDMI TX Parallel
>  	  Video Interface found on the Freescale i.MX8MP SoC.
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 1e7a789ec2890..4ebae5ad072ad 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>  	plat_data->priv_data = hdmi;
>  	plat_data->phy_force_vendor = true;
> +	plat_data->output_port = 1;
>  
>  	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi->dw_hdmi))
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
