Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BE3E573
	for <imx@lists.linux.dev>; Fri, 18 Oct 2024 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729253709; cv=none; b=cHRA/xIW7vgSe5KiytFjarV6UlCEEaqWsjT1+Is7XvJZClyRsTtluFrD32yPTYORzD8RGmImfNPs+oKcg4ZsBtx2Mndog+/g8nxqjRFQY1ui2A5M8l7SzSSvlDUcNDX65iZmPGUc15+JWzrwEth5Dri6ZA1TEPWx+IBVHVQTTkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729253709; c=relaxed/simple;
	bh=now3J6G/3UbZHE/WU7lQXQuwfG3tyrUmFgArj673/oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4/sFMdeCsG1oJI7IAK9kE63Lb/tExkaWPTFZUOlMrLPfN6DOrcUroVxGbzbhFh7sPuM9nalsxxv2usiP/+rn4edS6FSRhpmD+AtXFcnzxT/TiockySrZ2yRA/sTl9EYzmEZibrSatTwY+PtzzNxExwl47xVdrac1K5+EGt0a2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CXFKe8kl; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CXFKe8kl"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so21401331fa.0
        for <imx@lists.linux.dev>; Fri, 18 Oct 2024 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729253706; x=1729858506; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QjL3pHhlawZmked9cDer2cCqaq7RfeznftLlGVpNcgU=;
        b=CXFKe8klltNQHxdrjWq1taZRw+obuily6AqV7oJqpiI2jADm4zfle2Rc4OTHYc2sW2
         oKxFedqilkYQZJnlXPeleGYLdnz8IkuqreiSqXKqdK+RRThU2wLmFYZBc4JktsVvr6f4
         KwvUkKPWYR02as5a7EPvp+C60iyHFpxPV/vhB7Fbt7+kzBFmTwY20vCuZ3T77XHIhOdy
         q2MQxCtP4f3Xx3CeaHgSdDqN3duD5A+ScW5BJXD3UMvzSY004a+nIoq6GSt2/nA2U3Gi
         LMIZy9fYsofWkUcuzlxZWLEbaiRFzdpuSuQlm2Ln4pS+dsSaohwvwjZSeXVW2NMX4UVN
         Y90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729253706; x=1729858506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjL3pHhlawZmked9cDer2cCqaq7RfeznftLlGVpNcgU=;
        b=T1e/S8+NfAsREoSh6WE6f0zWNFY6a20X4cMcMZWvNEm1hoH9Yom2PdbGPmMuSA7ngs
         HYJTsTpU/3OQ8qvogdLICDqYa1vZaVaGpICo829KaIQeP28Dr365m4xaeJEZqIpWgB+U
         MXYnxQLbiTMr0pJFzcvY0aRkAUcYFOhLwAMIw0Laqv4naQ4OPLGYvZ1wuXf2Av2LQVqI
         OspMH5ZgGNpHVoMFGqEAz9q8bI8P6RduNPrmTPyU89FIAtvxriz57k7vIs/Vmi2ORbOY
         ThsLmGE8+oekcPrPMoZ3R1Z8OzNbdLCKmNFohBjLxbv6lJy/WUWTAn0rGreYVU6A/+dc
         SR2w==
X-Forwarded-Encrypted: i=1; AJvYcCW4KG+gx5DE8i1Vf2RO9GwnaMAGxgMP6TNvhNfviDh392185WOQHckRQhQUPms/BZs93Ks=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYt4uaJ26fSMZnmW7VTVMLvVM0wvwaiheaFQFcSBakBsd7YRCa
	l6yGDIBLSXNmvfjvWhggPy8tTkiz1O2xjjnGGSyvsT+TvYTZDW2fmn6WIUsfjdQ=
X-Google-Smtp-Source: AGHT+IF5eDKvPUdoitD+7fdWywacF4U/7oQTrEfnwaNWZvVwt8eJAqa0dkV02VzR/63JN4AWDeU6JA==
X-Received: by 2002:a05:651c:b13:b0:2fb:569a:553d with SMTP id 38308e7fff4ca-2fb8323b1fdmr11544041fa.42.1729253705640;
        Fri, 18 Oct 2024 05:15:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809f9b62sm2015311fa.96.2024.10.18.05.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 05:15:04 -0700 (PDT)
Date: Fri, 18 Oct 2024 15:15:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, marex@denx.de, stefan@agner.ch
Subject: Re: [PATCH 5/5] drm: lcdif: Use drm_bridge_connector
Message-ID: <7isauhmti3vtyseanqveizlhrwmg2iade6kixhhx27edfk4bbm@yj4mekgbvpj4>
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-6-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018064813.2750016-6-victor.liu@nxp.com>

On Fri, Oct 18, 2024 at 02:48:13PM +0800, Liu Ying wrote:
> Initialize a connector by calling drm_bridge_connector_init() for
> each encoder so that down stream bridge drivers don't need to create
> connectors any more.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 17 ++++++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 264e74f45554..06c95e556380 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -27,6 +27,7 @@ config DRM_IMX_LCDIF
>  	depends on DRM && OF
>  	depends on COMMON_CLK
>  	depends on ARCH_MXC || COMPILE_TEST
> +	select DRM_BRIDGE_CONNECTOR
>  	select DRM_CLIENT_SELECTION

Missing `select DRM_DISPLAY_HELPER`. LGTM otherwise.

>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index 58ccad9c425d..d4521da6675e 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -16,7 +16,9 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_client_setup.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fbdev_dma.h>
> @@ -56,6 +58,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  		struct device_node *remote;
>  		struct of_endpoint of_ep;
>  		struct drm_encoder *encoder;
> +		struct drm_connector *connector;
>  
>  		remote = of_graph_get_remote_port_parent(ep);
>  		if (!of_device_is_available(remote)) {
> @@ -97,13 +100,25 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
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
> +		connector = drm_bridge_connector_init(lcdif->drm, encoder);
> +		if (IS_ERR(connector)) {
> +			ret = PTR_ERR(connector);
> +			dev_err(dev, "Failed to initialize bridge connector: %d\n",
> +				ret);
> +			of_node_put(ep);
> +			return ret;
> +		}
> +
> +		drm_connector_attach_encoder(connector, encoder);
>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
