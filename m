Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56419992D
	for <imx@lists.linux.dev>; Mon, 23 Dec 2024 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734951106; cv=none; b=oBFga4YgpX1FUmxgfnWSlOD3qnPnkGbtkAo51G2WM8jnKl+lEzJyY5dSxUoGmyFC9q1pj3RVsRXzmwrqardQBYMUqOLeJmA2UuIXqGM6vyUoeArmsdEF3GusvPF4gjIAaI09qv5y3HHWvVBwoSWI6AkmHMP22sf2STVJfyAco9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734951106; c=relaxed/simple;
	bh=WI7HhcfpjcBt5fd7xwBht5+u2wyeHlcBV3wwBiN6ADY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZhYxyuaYwMQQhl8ZJnT1krwQAVSBPuOB/cz0jVpAN0f62sgRPxoDJb2JRx8MFFlS/MJmh2088EVG6Fil+q5hE78vRFTXLiTL66ld8NKIyqhufLUXsHCMA+uykpl/s1pCnbhm/FqYnBHxAgitTUi1CuSkUYMVbS9SkGr3T8k6T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OSG7EvYT; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OSG7EvYT"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so4603385e87.2
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 02:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734951103; x=1735555903; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PysGQXFhFIaY82I36Y7kVr5DOhB1P1lEm8vqt8odrR0=;
        b=OSG7EvYTo1W8v1u1euTuijjDILx/OQMJCPmzYwBzxhME2WZ/I0MXgDDau3Le+RJpSt
         DRrrSBNDpnDJHOomuBWVqftjt8oZlQ3Syyt5ZmqJ/XRZ7k6Y8CALm6S4MUMTONanEjF4
         EQS7IC07mcbCrocDfdHcof2sByBOaUJE3s5tM+6WWQV8Yqm6OsHk5VqrLqdiU6HnG/4W
         t39gdsltBqk/LooA4KzBGELwJLguIdO/mjYTD+OTNZQsskrCOQm1Y86N/Tpp4Mqdo91S
         rqDhHCgnrME6iSibT1nul4fLwV536PaC6lln6RjTKPedWSRBpgyZJEtpdfQ79X1SzUvH
         2CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734951103; x=1735555903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PysGQXFhFIaY82I36Y7kVr5DOhB1P1lEm8vqt8odrR0=;
        b=MKiJkgAzAQMizDcA1MCDb56OilqHnaaFac9MDORwQw1etZfTFKYKyXPyxZ7FFqfpDC
         ltvKjk9IItp2tIIZ/3cfZ5oqVyAnTx3c4s62RCGnTjQ6zxSzaUA9OcBUqYebZAb1oQnX
         ss1JwLIrwc7EEeoMKm2/RQmSxDIjhXatfLQc4ZtkIHMAQdvt08IzaLSXGfscFEfVgYnK
         LDJ2dfTq9P0oSCrDt9dURlMKe3+yhLWI6RmqVWwZnkXOCsib5P4tDeZD2lb2iS+cdiOa
         rfwYPnma01lG/+yv7hpCxJqHpcqC5GkT79KQIC2DmbdLgROHRQOT8wbWD0Tx3E4pOb4N
         9Hug==
X-Forwarded-Encrypted: i=1; AJvYcCVYoZvIs9OBhtVFvYHkHbOhvcaGTEwY6dKF7x7SfXVmd4BwYSx8ZXCkNf9lDJXXEBwo0Pw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3Rs109UrT47+JAXGmZRIZd9vjzzD5/sZzMPPSPfsq2u9SBSdc
	4kFu73ev5wiy9Fk4ye6eHRaq66DetbQ9SUBzM2BgUbWcJd3dykiewUZK7q9n+VQ=
X-Gm-Gg: ASbGncvoYY7Icy5qz/uQaaBbd2oGBxwcf5UYuTi2S+UtZE+lTBkyuxke9rxLmwMOE02
	jvXNHGBjK+genXzxyY+n6ggyfDGhFwaC+xo/mWIrt+1SpoGevChn/mpOahKyb4fGask3KiyaZBL
	eVMRlvac7kFP7s3SJMGVtIVcD7UgcZSs2L3uR9m7oaHeI68rv0Hl72ENXiwkRMShR2Glf4OB0CB
	p6+pb6eGiMiF1vL9nerVRMnwADWt7VFhbS4WItUXCeHONrBjupuXBrZJINeCrZU3T/vk4j32DIF
	OiIE0LczYbOLzS5dTLnluLhycvBt0fZSllSe
X-Google-Smtp-Source: AGHT+IG+15flgGLqsMrZ5BL4gMnDHWQG9KiSz+F4gPV4kBjlj5dHbyvd5yf8E3fFs/QR/3iviG06Bg==
X-Received: by 2002:a05:6512:1150:b0:541:cdef:7ca3 with SMTP id 2adb3069b0e04-5422953c1a8mr3075505e87.27.1734951102906;
        Mon, 23 Dec 2024 02:51:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238216c0sm1231593e87.218.2024.12.23.02.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:51:42 -0800 (PST)
Date: Mon, 23 Dec 2024 12:51:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, 
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, 
	u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v7 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
Message-ID: <6mhlb26vdfc7v3jmb7y3tlcuo336x7vkblbkzd5sosd6urirou@bbfalnfisdij>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-10-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-10-victor.liu@nxp.com>

On Mon, Dec 23, 2024 at 02:41:37PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing
> units that operate in a display clock domain.  Add minimal feature
> support with FrameGen and TCon so that the engine can output display
> timings.  The FrameGen driver, TCon driver and display engine driver
> are components to be aggregated by a master registered in the upcoming
> DRM driver.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7:
> * Add kernel doc for struct dc_drm_device. (Dmitry)
> * Fix regmap_config definitions by correcting name field, correcting read
>   ranges and setting max_register field.
> * Get instance numbers from device data(compatible strings) instead of OF
>   aliases.

Unfortunately no. Your instances are compatible on the hardware level
(at least they were with the previous versions, I don't think that
there was a silicon change).

> * Collect Maxime's R-b tag.
> * Trivial tweaks.
> 
> v6:
> * No change.
> 
> v5:
> * Replace .remove_new with .remove in dc-{de,fg,tc}.c. (Uwe)
> * Select REGMAP and REGMAP_MMIO Kconfig options.
> * Fix commit message to state that display engine driver is a component driver
>   instead of a master/aggregate driver.
> 
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Inline some small functions. (Dmitry)
> * Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
>   KMS routine to initialization stage. (Dmitry)
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> * Drop unnecessary private struct dc_*_priv.
> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>   interfaces to bind/unbind the drivers.
> 
> v3:
> * No change.
> 
> v2:
> * Use OF alias id to get instance id.
> * Add dev member to struct dc_tc.
> 
>  drivers/gpu/drm/imx/Kconfig     |   1 +
>  drivers/gpu/drm/imx/Makefile    |   1 +
>  drivers/gpu/drm/imx/dc/Kconfig  |   7 +
>  drivers/gpu/drm/imx/dc/Makefile |   5 +
>  drivers/gpu/drm/imx/dc/dc-de.c  | 153 +++++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>  drivers/gpu/drm/imx/dc/dc-drv.h |  29 +++
>  drivers/gpu/drm/imx/dc/dc-fg.c  | 378 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-tc.c  | 142 ++++++++++++
>  10 files changed, 810 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
> 

[...]

> +
> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dc_drm_device *dc_drm = data;
> +	void __iomem *base_top;
> +	struct dc_de *de;
> +	int ret;
> +
> +	de = devm_kzalloc(dev, sizeof(*de), GFP_KERNEL);
> +	if (!de)
> +		return -ENOMEM;
> +
> +	de->id = (enum dc_de_id)(uintptr_t)device_get_match_data(dev);
> +
> +	base_top = devm_platform_ioremap_resource_byname(pdev, "top");
> +	if (IS_ERR(base_top))
> +		return PTR_ERR(base_top);
> +
> +	de->reg_top = devm_regmap_init_mmio(dev, base_top,
> +					    &dc_de_top_regmap_config);
> +	if (IS_ERR(de->reg_top))
> +		return PTR_ERR(de->reg_top);
> +
> +	de->irq_shdld = platform_get_irq_byname(pdev, "shdload");

Nit: shdload or shdld? Which one is used in the documentation?

> +	if (de->irq_shdld < 0)
> +		return de->irq_shdld;
> +
> +	de->irq_framecomplete = platform_get_irq_byname(pdev, "framecomplete");
> +	if (de->irq_framecomplete < 0)
> +		return de->irq_framecomplete;
> +
> +	de->irq_seqcomplete = platform_get_irq_byname(pdev, "seqcomplete");
> +	if (de->irq_seqcomplete < 0)
> +		return de->irq_seqcomplete;
> +
> +	de->dev = dev;
> +
> +	dev_set_drvdata(dev, de);
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	dc_drm->de[de->id] = de;
> +
> +	return 0;
> +}
> +

[...]

> +
> +struct dc_de {
> +	struct device *dev;
> +	struct regmap *reg_top;
> +	struct dc_fg *fg;
> +	struct dc_tc *tc;
> +	int irq_shdld;
> +	int irq_framecomplete;
> +	int irq_seqcomplete;
> +	enum dc_de_id id;

Why do you need to store it? This patch makes use of it just for the
registration.

> +};
> +

[...]

> +static int dc_fg_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dc_drm_device *dc_drm = data;
> +	void __iomem *base;
> +	enum dc_fg_id id;
> +	struct dc_fg *fg;
> +	struct dc_de *de;
> +
> +	fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
> +	if (!fg)
> +		return -ENOMEM;
> +
> +	id = (enum dc_fg_id)(uintptr_t)device_get_match_data(dev);
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
> +	if (IS_ERR(fg->reg))
> +		return PTR_ERR(fg->reg);
> +
> +	fg->clk_disp = devm_clk_get(dev, NULL);
> +	if (IS_ERR(fg->clk_disp))
> +		return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
> +				     "failed to get display clock\n");
> +
> +	fg->dev = dev;
> +
> +	de = dc_drm->de[id];

This depends on a particular order of component's being bound. If the
order changes for whatever reason (e.g. due to component.c
implementation being changed) then your driver might crash here.

This applies to several other places in the driver.

> +	de->fg = fg;
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry
