Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415972CA9
	for <imx@lists.linux.dev>; Thu,  2 Jan 2025 04:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735793514; cv=none; b=DuAkCZlLXZu7ErnRkQ/pUjfW1zdzTed/uT8PHX23jFtWIZ+GPgvndH15K7BefFTT9e/23z/BtE/mIAQ9fqmLFwahr0ewxn8RVNkoTqs/jiuZWvRGV6hzu9heoPQOrQdXYT/2Vc69H9sKX3QMA1eMXMqF+HtY1o0CgV2bg1oYEAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735793514; c=relaxed/simple;
	bh=+n6smjA+QHsHQJ9ZlvhpO2rg8iozYCrVTjt6DWZy5WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GczCGlAdZnhaXgVFpONMIw8BrQM2whaDBbnwlRZf3mH9O91sG1V6ssc9vNYHTPSL8iBmVJWtmts5XdwyFfY0Dch6CHdBhM9PHmqirxVyqge7dQhr0q4AsM4IzN9n3HL6vj+0dAkkAesVEfwMTYq6BcQkYIMw/4TP9he7VaSWUZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x1ajvuIa; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x1ajvuIa"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30036310158so105275451fa.0
        for <imx@lists.linux.dev>; Wed, 01 Jan 2025 20:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735793510; x=1736398310; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MRbuq/vJhOHDwWZyIZVQ1UR8FeorGGJoKh1JNDZST1k=;
        b=x1ajvuIaKtXKlKMZ+rTv0jn3F81YRcThCTTGsQX2lAGQ+G2bJ0CCmwiZNJmCn8anTu
         S6xmZukIBr9in3jcugnzfFtQDJ8XGzq/hyiKAm+cjPaUx7MVcOcCkoygZyFJ5MiEbWpm
         bGHIYibMYq2m4SOL6HOFyBzLeApjRgyaa4TuWE15Gj698NJ8FOaBEH9iQZmOfb0XKHzs
         PeDf6cyqt4yxL6bywCVE0txIP1FYRHLB9pSUVh9eOk7uZBDMxN5mpOWxZuq/TlcmL4mg
         V/9h4d5ksHMgcUQIDp7sk3YrZH31ZQNo1gQ42QA34I+nthv6+OoaElSfI0BS7NNpHibG
         HC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735793510; x=1736398310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRbuq/vJhOHDwWZyIZVQ1UR8FeorGGJoKh1JNDZST1k=;
        b=lW8f1mmYXv2RVA50m4XfAZfKFgM7yWphfemUjMt6kLsFNi1+6GdyLCmRXOvCOYR5rF
         HHBV0TRxl0hT0RSxJOCsDgkhUJObiNdprzq6RRhI1Z2DQlaoDn9qLCbz3GtamGt+aLi8
         JMJ4G8oxEHL/8spJn/asehCFhySa8iK8zP6je2/fHNYiEM/fKcTCwEgPYqJMPHI/E9h5
         LJsuuPM6njxbj7CfFYkkD/LlWvqEQQbjDpfmk+bDBLeBsaeF0vYs1VY9dIEJwxaEW8PN
         QJNI1hlGc3me0zfofwcx6QveGTlEa2CUdezFeDsqNiTufT1BSi6pp9wmEtuR6Kg9Y7xN
         UQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5z6ShazYjk7Jx1M0dYuWUfjYHCI1DT/krea2wmCBbqKgRvEBcuCRIVbJR3Q+bEKS81EM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQOdTKw6hPn4GIkBbI41FF3ulTGkrtgPbLOgZ0R1ulpGulxah9
	yT0W6oK7ao+eJxLf/ta+09ReD86PLTTROUUHHOjDFWdszi3wHAs9xwNLYwywoHw=
X-Gm-Gg: ASbGncvKuM8TLkqvb3jdkqqWxnPi1wSxnaMlDbJsQnsCQGo25K/NHWKB3E9vxKfxZGj
	lDFBx/pr8R0z9gOdAmaHO1NRYn5nAVq5vC/yzbfRrKY2yA7bdLccH+t8ZnoduvXT+K0EDxCnHbC
	aEKhAEzylJl8bpVH0UK8aZFIAaUK2OHKd6D/0JACiSeSxkwMgTqG1l/oME0c5nVgBcAnEnMqAhX
	IoC1U7bzO37ka6q5EfK8MsOO5TnFK7KHEGsCs+X8jZGymyB0OfT2vZAwEXwEgxM2vIgAviMWpL8
	aFB6fl9DprPb4F1kyP30g6CQuCoNcauKdlZ9
X-Google-Smtp-Source: AGHT+IGE2Szq9qm9GN+rsyVm5RLYM6Bq9PLVSw4z6os4ljvKgQu4XGWjU61plLVc+yzsVHeip+HlRw==
X-Received: by 2002:a2e:a588:0:b0:2ff:c349:8d08 with SMTP id 38308e7fff4ca-3046851e529mr158851661fa.8.1735793510280;
        Wed, 01 Jan 2025 20:51:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c632sm42017411fa.21.2025.01.01.20.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 20:51:49 -0800 (PST)
Date: Thu, 2 Jan 2025 06:51:47 +0200
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
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <xqu2zjrefp2rgp2hyjqhi3nxypcxa7zpypct553upbxdsx64jr@wfn3dzzk3jxe>
References: <20241231192925.97614-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231192925.97614-1-marex@denx.de>

On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> HDMI but do not contain the HDMI connector node. This flag allows such
> DTs to work by creating the connector in the HDMI bridge driver. Do not
> use this flag, do not proliferate this flag, please fix your DTs.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Please describe that it is required for backwards compatibility with the
existing DTs. I think it is a good idea unless Shawn, Sascha or Fabio
tell that we should ignore backwards compatibility.

With that in mind:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

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
> V3: New patch
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++++----
>  include/drm/bridge/dw_hdmi.h              |  2 ++
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 996733ed2c004..852e73c0f686f 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2893,9 +2893,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> -		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> -					 bridge, flags);
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +		if (hdmi->plat_data->output_port_optional && !hdmi->next_bridge)
> +			return dw_hdmi_connector_create(hdmi);
> +		else
> +			return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> +						 bridge, flags);
> +	}
>  
>  	return dw_hdmi_connector_create(hdmi);
>  }
> @@ -3298,7 +3302,7 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
>  					  hdmi->plat_data->output_port,
>  					  -1);
>  	if (!remote)
> -		return -ENODEV;
> +		return hdmi->plat_data->output_port_optional ? 0 : -ENODEV;
>  
>  	hdmi->next_bridge = of_drm_find_bridge(remote);
>  	of_node_put(remote);
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 6a46baa0737cd..3bb6e633424a8 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -127,6 +127,8 @@ struct dw_hdmi_plat_data {
>  	struct regmap *regm;
>  
>  	unsigned int output_port;
> +	/* Used purely by MX8MP HDMI to work around broken DTs without HDMI connector node. */
> +	bool output_port_optional;
>  
>  	unsigned long input_bus_encoding;
>  	bool use_drm_infoframe;
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
