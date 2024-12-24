Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F748442C
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 04:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735013379; cv=none; b=HjaJAuXEbmzXqcwo8EfvRBDfamKCNJ3Sy8yaVXhf70qX9Iw/qIQFIRz1GGh9/cufSM0JNs/+mg0nIvgFID/IEPfMJdqA/1Xs7FL8Cz0LKwp5kHQhKEAJqSO/JXgY5sLGF4ihHI8N/bXu52q5OxqPJ2rM2LB62TdEEQrYt4STmzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735013379; c=relaxed/simple;
	bh=vSpZZHdTbmXDCxJ6/d0kTl2NEIZg5eVzIImbdMUjHns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNlrbtDkKrZsWYQIaE9VgmKNl1fZwN3oA3vO0qcPXC1+NpWUweBZoXb5Wp5C89azQuX3VpqXc194irNWe486D2XzNFCqVSmIV0r9ziCZZxe2nkzJtfO+mxTvdoiRshtpPpO4Y1BSHJrPBpLh5d3b0fOyHIjZe5L+6M4y4+1cXCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zDSTauAa; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zDSTauAa"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401ab97206so4946342e87.3
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 20:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735013375; x=1735618175; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8on0ZbRPpfYPOhsA0CTtKSQk3XChh59DoR/C8XX6ZpQ=;
        b=zDSTauAaSAakzM3G6cSemGSs0v2VKBKuVTdf3DiTeOGkLLRUNOMbDfAjQ+35Qoidvb
         y1JcIVeU124t1ssEBJ9Ce/u0uphHQAz/Zz/94K8177+7ZElHXD7sMJmh2S+7IAQ+tCo7
         N88Inul0iVrG6tFpPf/zObWeLSsjix93vnte1kzewPXPWhfbQ1Nmp+4ycnoxVMNCAlmC
         RUfXYgHtSKGjHtB5gs1kVrFbaBg8VY/3t8S3+eYN08UpRZ1UukNycqiFTFNN24UJtJBI
         Vv8Ok3Ws2GZX9A59xNTPxoCjO3ApJRZWZ5Y0+S/cFAcouVxJg01JhvTs8cvoyRNe7cDq
         vSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735013375; x=1735618175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8on0ZbRPpfYPOhsA0CTtKSQk3XChh59DoR/C8XX6ZpQ=;
        b=lLrRQp82nGppcyIO4DilKJhal4FyqQ34gLDAvVqX768+QZB8EA4c1VH0tlCGMdZKjn
         YoADCfVVEjIPR22rFGpqegLFJOCUsi/6wa5Ii4WGFnfLku5K4Jd7qiyJbDvRPn9lzVyj
         J60kNnD+8EiGgRyqPd7d1SV04o9fpuEDZabuFFL5e2sJhUgc0sQXUp978c3dL5dBsv6W
         EIm5NwA0naLLL6PMnrWJrT9CtY78fvB3TRh5V6Jrxcq31sEXyCBfMn+u+elyHO+4k7ya
         PGX7TjSQH+qwDi/OZ8Xjikk2mCPufE+4hv2z7Hb5t4f5+f17mwD7nDsFnndU79FkBu0I
         MAUA==
X-Forwarded-Encrypted: i=1; AJvYcCVQO4UvdTd1xB2jxYKi1tiMk7d/8yjN5OTH2Fz4oOdqcFGlzqzu7uRd0lM8JY4AcjmoZMQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx//7d8ORd923pHwlB9uu22FNsDwY+IohmxcbMadN4gBcfllrEQ
	0Yt1ptyukbmj8xgpaKD3a5WsTMAsqvg5xHai1iAXOUlTxeKtA1Si2HCF/K2tjP8=
X-Gm-Gg: ASbGncuSfz5CjtEBW3kCfxlQhDGCP00SaHtGQg5jmFv33jx86IvtcNZsldvooCJrtmi
	kEGqbzlb9APYUIl+j0C6TV3YnExjeDZD8//YUrI/TRSQy1VrXYk/Zpfp5UuNVOi+zaV5FE2ScFF
	7PFnMYkhbeJOHSHZ7DXGFtC4ZIbci/y+RyRox0USUuxSI+GUiTfIFIHrkSyTJ9nX5gjPVcNt82n
	xdn1WjX1t9mmtKCZX5jyNTNTSYqHTLTBHsFNr6BEh1HPhE2vi3gom/qAKd9lv3zlc2kg9IeFJfj
	QyTM5hRhDJKYX4i3eH08j09WLLQMKptU41hZ
X-Google-Smtp-Source: AGHT+IFywzjt+YUMxB9ndT32dpSascSP1hmk767MuEP9vd7WzaJ7hUJym7qgGXttXA0sSFsZgZdAmw==
X-Received: by 2002:a05:6512:318e:b0:540:1fb5:3f9f with SMTP id 2adb3069b0e04-54229597f4dmr4305510e87.47.1735013375119;
        Mon, 23 Dec 2024 20:09:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422382faa1sm1450458e87.238.2024.12.23.20.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 20:09:33 -0800 (PST)
Date: Tue, 24 Dec 2024 06:09:31 +0200
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
Subject: Re: [PATCH v2 3/3] drm/mxsfb: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
 flag to drm_bridge_attach
Message-ID: <qqd3xztq2drkdbjrybzwa5an37lpb236ur4iqjaaydncwewltx@o3zjqaat22tw>
References: <20241224014701.253490-1-marex@denx.de>
 <20241224014701.253490-3-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224014701.253490-3-marex@denx.de>

On Tue, Dec 24, 2024 at 02:46:16AM +0100, Marek Vasut wrote:
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
> V2: Cache connector from drm_bridge_connector_init()
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 37 ++++++++++++++++++++++---------
>  2 files changed, 27 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
