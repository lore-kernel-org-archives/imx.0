Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A401392
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 04:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735014076; cv=none; b=Vr8qnEHbPd0NZxo5bDMiTLD9I3wSVg08YAyXEOkUIIubi9T/RoEazTc5BgGURRQPbXnMADjJe2cbohA3oQEVCZ49Ne6C/lf/kNIPrECxC0T97Hop/8bZ+un5S120JEP3VcTKl3aY7tUvXHuqAeLQa5K1CaI8QOGqoJRaWRr18U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735014076; c=relaxed/simple;
	bh=mTI/WaM+mE8Y654mcC8CdKqpAh4+bl/Kxuc3cELBTic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iv1w3JOPBlARwBRlgB4a4x9tIVtRTh8+DH9Dzy5E1WzcVhQeiQLu0/++LZIh/09/S/XV+tFjhU8hnob+V5oCYCfRRDdf9vdtKM6U7KMVdu67OH6phhzEVen1/ej9cEf2IrDLsb9T/OlfDNzcuMKKB8CJfPI78bQ7IpllJNrv1nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BZqPsPlO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BZqPsPlO"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53e3a227b82so4439557e87.0
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 20:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735014073; x=1735618873; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrtrBK5bSD0BG4gQ3/HFzyh9uM4A4XrCEOCe7dy4fgk=;
        b=BZqPsPlObqQuApfbdK4TSz6ejfUE1GwrFx2dhOWpL9Kim6sJWmiyQr4KX/cPCvKyHV
         btTqzZBfXNfc+2BoDcPxoyBRIjEVx2RIUwDEcSeZp8mKeQ8tqqfEF2KgxlrteE/AH7Bu
         tKnt26hi5PkqjBCzMGjc5j8rRBefeH8cs0M0hXR9lZI5lrf4Y+nvNDSTNosj+eH9l5zR
         o/GINABk6RMqLxcdAR05q22NueT3094VZ4krTADzzsNMHsREDiAAqfj+x0ppjHjhIsZe
         QjKed6U3Xq/af/RpTGTElFgzyvvbhAiXMm6Rt/DtCyfMKniKAbi7ADPxMihrYlnN77JV
         N7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735014073; x=1735618873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrtrBK5bSD0BG4gQ3/HFzyh9uM4A4XrCEOCe7dy4fgk=;
        b=WYGj1Ew0NCa/5xOP83oL8Uxi+YEIre7xXRi7gtytXa2EH3wvcRMb0bT1avkwywShC6
         HRPwFUkxiTl+eMAjaW/4DMINc156o/Y1pOI/5WWnzJn+0nhtvBV0ZyM/e2vj5I5nIZdt
         fdxVGbV+h42E7EPDU/vrFrHJ7GNWiY84u4QiC0I3SnAsf6VwPZ2bWYEAX7L4MAWR2kEN
         9yok178RfGfU6479rlsZ871ApDQ38x4X/Qp03LklcguVNGaaZCRJjkx44F1CINvbnByA
         waiK2IAcg1L8RnQkYz0xwNUPZgf3svaUxi5X80j9Mgc5aIZ67vDjwWMFM817akWIkaj0
         MHcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3Ilj69FnXU2uyIIc1Tmggua+6Q6QtK8353At85ZHD3ZFj+kedJ2gvwkJma6xFj+Tutaw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxgkEouAtvOLJg5T39oHFUc3T63x6Uqv7U9kU037TZLRM7vY4m
	6Xon559IB7wp+RkQg/zvs2PWzOhkzF4qdPnyjEGgFfX74ki1mJWtaP1eVRQzYCw=
X-Gm-Gg: ASbGncunOWgD6yXdbYQPveyQGl9bqv6NzVpnkHIUdDyuMrVfVm+7YDZcDY1Q7KnZBHq
	hxiDen21lRnwkhi9MG2Hwm2DqvbMskFwzugsNf2Ms67pGrak1uGmQ3X7tn/mhqmbcVEeWGAY+LS
	deV8VgTKk+Uj2QPw/FUVuUXUZjMrtVKLcQ0we0yKPz8ywK2qkhUPx7vCU8z8vAtUVAFpfT4faaF
	yKhe+oNGJRKuarNSiY1dSEPIl2nHppI25LBN5G+X3m9G7WCrLPIx4F1hto5yNj4XP7De37d3mHL
	kTGJIjwkV4Nptj7YNgC8KXNxmSfZf1Q+1rd+
X-Google-Smtp-Source: AGHT+IFnlazk3zp2S6fkLYTj/a/W11Tm8ZQUr/v3AouJ9WApV+dF+AqJMzBzTQnC6rJjgT9VhrQ83Q==
X-Received: by 2002:a05:6512:b22:b0:540:5b5c:c196 with SMTP id 2adb3069b0e04-5422956be94mr4052066e87.56.1735014072611;
        Mon, 23 Dec 2024 20:21:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422360054csm1498117e87.111.2024.12.23.20.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 20:21:11 -0800 (PST)
Date: Tue, 24 Dec 2024 06:21:08 +0200
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
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
References: <20241224014701.253490-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224014701.253490-1-marex@denx.de>

On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> The output_port set to 1 makes the DW HDMI driver core look up the
> next bridge in DT, where the next bridge is often the hdmi-connector .
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
> V2: No change
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

Quoting my feedback to a similar Liu's patch:

This will break compatibility with older DT files, which don't have
output port. I think you need to add output_port_optional flag to
dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
is set, but there is no remote node.

>  
>  	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi->dw_hdmi))
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
