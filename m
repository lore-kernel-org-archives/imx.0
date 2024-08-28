Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA26E16BE06
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 12:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849314; cv=none; b=QXH3iZ+XtfC9nvH2zjiMAlwtY4lPdgIM6L1hY9ZrYZprzYqYYUiTzbaeX5kM1N/xjxeUoiGL8ViVzEb3qD1nlsBweE9JatE3V1kfPtzXyYLQsYxinjfO2oAyDAQxR/7GHTYe5kHVrOBhmUP9LiQT5q2OXuK9UKBV/gU3T7/F1RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849314; c=relaxed/simple;
	bh=IctKhAc5WUmvx+TSHAMibrTRmhcVxLR8NEiasyDMvAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1tn3K+DQVORSJbgvyPk4K1OYQU+svR+Povez5/3k8iJnY0Eh3PCUZqYDYXCh38eowKvPCXuTNXzXWhgPSTHKDq1L/tecJkv0zV5Jpo5WzV+E9bDZnP8uyza8gl6sTbiq4wkPWGXs/1/2VaKcZ2brUIQfnTRDM0D5e89KrS057M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=aNkA4X/k; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="aNkA4X/k"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42819654737so57162995e9.1
        for <imx@lists.linux.dev>; Wed, 28 Aug 2024 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1724849311; x=1725454111; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EFqVGeHJhN7wq7x4S1yeJZ6zpXfyurzID6BfMG7GKt8=;
        b=aNkA4X/kCBZxyKfw3v7mw988O3tBjrD/eqe56WLIuvCI6onq+VRJuNrL5t1u90lOU8
         A74K5dqofxozUjK+Daf3+RX/Sxk+s3MQ23kX/XtftFH4xpTAr++sX3dZHGj+y5D0VNb/
         RI+xWqKpDCuCsjA/hS/dNbMHAl6esFh0G2wwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724849311; x=1725454111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFqVGeHJhN7wq7x4S1yeJZ6zpXfyurzID6BfMG7GKt8=;
        b=lQ2HxQUo+ouqq/kI/UmBaA20UeLVzrf/rxyhsFwIeF/AxYq+kvq376DCO5EADI8q+B
         sykVJ4PKDk2M8DYwlCcsnIQfcrCJKUqkcWJ9TQQB0DbA8MFRZ0pOV0ZtxNMZlR6EPZ2R
         pOsbQmhlqO4+W0JO/vFROsPT+qao3hirsZUU091jswK7hL92W/o33NEqyPwGpYGqWNs6
         o6SDwAiPvmt2KgYymb98MzLrN9c6hLLbUHU5PaurtVtbNpp6VA+EMogi8pCqmc79qcTn
         nltsQUWzWgLQnJrgdLEqAJmUuXMVWjCCFpzeA7m1o1n+pBZbFD6q+8rWSnxxNsM8aA8d
         ft/A==
X-Forwarded-Encrypted: i=1; AJvYcCWOD0h2xhPhGxaUSk4hgttI0AoLNcY4K+3nWNgBDJu3XVXw4tOCUET0VvhF+g0qD5dCwcw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtOlgEiIh3yqZfDfj2VnLpipQvhDxXUc3V2HzoQoKHs3KXWuhP
	jY6pmS6/obEmZhDZAwzSw69gDgz6jGb0PthePPIiVkUTBWkUiKZN/Rf6tgf8AOs=
X-Google-Smtp-Source: AGHT+IGwJ6gk8liZgMOYtWuY6fVH82jdYY1IsW2X0cvvs14wPbFWW/L6yjXhPtffKOBhX6Xha0Vt3A==
X-Received: by 2002:a05:600c:3b94:b0:429:e6bb:a436 with SMTP id 5b1f17b1804b1-42acd55654fmr124825975e9.9.1724849311092;
        Wed, 28 Aug 2024 05:48:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba640402asm20863755e9.41.2024.08.28.05.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:48:30 -0700 (PDT)
Date: Wed, 28 Aug 2024 14:48:28 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/6] drm/ipuv3/parallel: convert to struct drm_edid
Message-ID: <Zs8cnGinrFTq7Nqo@phenom.ffwll.local>
References: <cover.1724348429.git.jani.nikula@intel.com>
 <a1698044d556072e79041d69b8702099fd17bd90.1724348429.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1698044d556072e79041d69b8702099fd17bd90.1724348429.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 

On Thu, Aug 22, 2024 at 08:42:51PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for storing the EDID and
> updating the connector.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> index 55dedd73f528..91d7808a2d8d 100644
> --- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> +++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> @@ -34,7 +34,7 @@ struct imx_parallel_display_encoder {
>  
>  struct imx_parallel_display {
>  	struct device *dev;
> -	void *edid;
> +	const struct drm_edid *drm_edid;
>  	u32 bus_format;
>  	u32 bus_flags;
>  	struct drm_display_mode mode;
> @@ -62,9 +62,9 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
>  	if (num_modes > 0)
>  		return num_modes;
>  
> -	if (imxpd->edid) {
> -		drm_connector_update_edid_property(connector, imxpd->edid);
> -		num_modes = drm_add_edid_modes(connector, imxpd->edid);
> +	if (imxpd->drm_edid) {
> +		drm_edid_connector_update(connector, imxpd->drm_edid);
> +		num_modes = drm_edid_connector_add_modes(connector);
>  	}
>  
>  	if (np) {
> @@ -331,7 +331,7 @@ static int imx_pd_probe(struct platform_device *pdev)
>  
>  	edidp = of_get_property(np, "edid", &edid_len);
>  	if (edidp)
> -		imxpd->edid = devm_kmemdup(dev, edidp, edid_len, GFP_KERNEL);
> +		imxpd->drm_edid = drm_edid_alloc(edidp, edid_len);

Randomly wondering whether drm_edid_alloc should at least sanity check the
edid size ... but for another time. On this:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
>  	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
>  	if (!ret) {
> @@ -355,7 +355,11 @@ static int imx_pd_probe(struct platform_device *pdev)
>  
>  static void imx_pd_remove(struct platform_device *pdev)
>  {
> +	struct imx_parallel_display *imxpd = platform_get_drvdata(pdev);
> +
>  	component_del(&pdev->dev, &imx_pd_ops);
> +
> +	drm_edid_free(imxpd->drm_edid);
>  }
>  
>  static const struct of_device_id imx_pd_dt_ids[] = {
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
