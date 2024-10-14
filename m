Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0289145B2D
	for <imx@lists.linux.dev>; Mon, 14 Oct 2024 07:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728889827; cv=none; b=IGzdhMpPugwEStrQJoOC8JCFRb1OLkXK4l+sPThEuJ0bsJoyNpDd1pHyPUYb2Lov0Yw+Ph2tZ5ZPp/ikxG+iYxTdHamcQg2lv1TxNpbgHwFAG2G/sVBaLKgHi7nnVqd+lORh0xVQQKB42xYQaxamCCYTL1XrIuQoultkRFyuIsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728889827; c=relaxed/simple;
	bh=zlUcn/AjQMBhE2mjFPqYAlKColqDLt9MD/frGVn3oJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQgv5xbVgNEUQLQU/oSHCaNy52zs3/TZLHHhmhfguogK8wLNiKRzHj8xnMejwoKM7BrKc11KjzLjrK0l5Z1Ak15x42MBs0mffsf4hpvibdeg4MfSfk0rbAopHRc7qj/viL4TES2gLzU9XVOhvdKg16FB9CeKc+Y+PniXp3V6Mqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mnQcQuos; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mnQcQuos"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so35867811fa.3
        for <imx@lists.linux.dev>; Mon, 14 Oct 2024 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728889824; x=1729494624; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vaSk6MvJTraXtkEXPaCgc+gi7dKimM6BaWMyPcB8SXg=;
        b=mnQcQuos+DjGUrVH3AbpNTWMh62a8c8b5rGATrMqjoDbRZO/GExMyMuQKy31WBM8DD
         9Mi9/zWAvsy46JN7IP76K2BrIWG8vJJrnD1wfwtN2qGH5XOv/jP+OOprIOsLhoiRxw42
         eDAHtZX4eNRdH4hTQCEIRdIrTPMcpGZCqbrH3T/biipmk90BK+hr66yoRlxNGKHqd3Bd
         KzTh1+BGMuPX0lFE90teq00dQmMmBmzjJa7S7iUBk9Bx9a05JKC+2Rj/aXkAzHph7PGX
         pEwxpOVM2XMXMc30gZxL5Ro1UTnyFolo8SInIBocn+fSvERHWT/fy3jpAV6o3a4kZeSe
         zRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728889824; x=1729494624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaSk6MvJTraXtkEXPaCgc+gi7dKimM6BaWMyPcB8SXg=;
        b=b0y+ljHCQrdQFQ+dtcvmgl+o9y1QrWR6F86ygjO95fVcCxb+LSudLJ641vOPQVzI9/
         Qy3M+iXddzsp63Lz3bDf+2gkIbNiQVtEleP3KD1TpijgL6wk+kysKKsZKyfZUiat5xha
         ny/08Rj+uHE14rkNvgKa27qjnNyCrB+Z9hY/CtQmJV8VCet0IXNEhqpUxu2sE/iM2a6L
         euj+hG0glHzKaGFxEjQ+PNKpXVwQsoc90IOE5eiiI8eGzDvtPC7W0sE1tNo4StN/NxFz
         wfvFSd3+WMPBBdpNKSRk8ngTvyv+far8LGNERO7tYG1CkFn4SZiiNZMzPxSr3Tmg7PXI
         SkDw==
X-Forwarded-Encrypted: i=1; AJvYcCXZh0GEy5E5W1Co/BjVBPRfqsj35R+hta9T5ybSjj1yp9fO8rJJfX2jkr+K8mkGLzlOHrk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzMxO78sp5klTz/OX/QoD+FZlMEgghL8uiWY6ArDaxjJQAR0Yj
	bPUu2YGeE4puQravPew7S+DSZsXT4Nrzpe4RvWwMXde9uIQ58QoOwjb4nwr1F0I=
X-Google-Smtp-Source: AGHT+IGAd9UjWxXud+NWbfMZgYsAU4lizOECIK9dLoFGOaFd9MGxBfs40mqKeTPH0r6byj/NCWRwuQ==
X-Received: by 2002:a2e:4e19:0:b0:2f7:ad6b:a31e with SMTP id 38308e7fff4ca-2fb327a672emr38410631fa.31.1728889823683;
        Mon, 14 Oct 2024 00:10:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb4aa297f7sm4681891fa.15.2024.10.14.00.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 00:10:22 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:10:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de, isaac.scott@ideasonboard.com, 
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Message-ID: <dtloyyghjep5rm34qjjinvhvrar5jzj3n24czvpdmnkfesntjq@t2uijuez7myj>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-7-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012073543.1388069-7-victor.liu@nxp.com>

On Sat, Oct 12, 2024 at 03:35:40PM +0800, Liu Ying wrote:
> Add basic HDMI video output support. Currently, only RGB888 output
> pixel format is supported.  At the LVDS input side, the driver
> supports single LVDS link and dual LVDS links with "jeida-24" LVDS
> mapping.
> 
> Product link:
> https://www.ite.com.tw/en/product/cate1/IT6263
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * Add AVI inforframe support.  (Maxime)
> * Add DRM_MODE_CONNECTOR_HDMIA.  (Biju)
> * Rename it6263_reset() to it6263_hw_reset().  (Biju)
> * Check number of LVDS link data lanes.  (Biju)
> 
>  drivers/gpu/drm/bridge/Kconfig      |   8 +
>  drivers/gpu/drm/bridge/Makefile     |   1 +
>  drivers/gpu/drm/bridge/ite-it6263.c | 919 ++++++++++++++++++++++++++++
>  3 files changed, 928 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c
> 

[...]

> +static int it6263_parse_dt(struct it6263 *it)
> +{
> +	struct device *dev = it->dev;
> +	struct device_node *port0, *port1;
> +	int ret;
> +
> +	ret = of_property_read_u8(dev->of_node, "ite,lvds-link-num-data-lanes",
> +				  &it->lvds_link_num_dlanes);
> +	if (ret) {
> +		dev_err(dev, "failed to get LVDS link number of data lanes: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	it->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
> +	if (IS_ERR(it->next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(it->next_bridge),
> +				     "failed to get next bridge\n");
> +
> +	port0 = of_graph_get_port_by_id(dev->of_node, 0);
> +	port1 = of_graph_get_port_by_id(dev->of_node, 1);
> +	if (port0 && port1) {
> +		if (of_property_read_bool(port0, "dual-lvds-even-pixels") &&
> +		    of_property_read_bool(port1, "dual-lvds-odd-pixels")) {
> +			it->lvds_dual_link = true;
> +			it->lvds_link12_swap = true;
> +		} else if (of_property_read_bool(port0, "dual-lvds-odd-pixels") &&
> +			   of_property_read_bool(port1, "dual-lvds-even-pixels")) {
> +			it->lvds_dual_link = true;
> +		}
> +
> +		if (!it->lvds_dual_link) {
> +			dev_err(dev,
> +				"failed to get LVDS dual link pixel order\n");
> +			ret = -EINVAL;
> +		}

Please use drm_of_lvds_get_dual_link_pixel_order(), it validates that
the DT definition is sound: one port for odd pixels, one port for even
pixels.

> +	} else if (port1) {
> +		ret = -EINVAL;
> +		dev_err(dev, "single input LVDS port1 is not supported\n");
> +	} else if (!port0) {
> +		ret = -EINVAL;
> +		dev_err(dev, "no input LVDS port\n");
> +	}
> +
> +	of_node_put(port0);
> +	of_node_put(port1);
> +
> +	return ret;
> +}
> +

-- 
With best wishes
Dmitry
