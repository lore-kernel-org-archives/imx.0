Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3E214A604
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 06:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735022655; cv=none; b=TpAik84RJNSbsu57NZKkvAMTPlg3rZPnS6GuW2KpGF9eqhikawkqloF46/4wh58RcTK8jT7YNryedVLlJmK0QASm+uMSk3UBBvuGq32T03RTLXh/ohu1v2nlarjta7Y0oONFLX+HNCAdCA2uqviKuBQ9Os0eTUH9Lv6qAMq1gX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735022655; c=relaxed/simple;
	bh=LUabrqiPrCSZAufAxRrURBhdoqMXBCHPWlROHCIC/ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MTAE5UtkUEvC1rTRV9fd1NX6vbI9seeRakmMYQd5XEoy7Ww3MEGhjp9KkAud/LiyqdY07axICItanFAmrvpgQnG6RESfTAU5pM9TxGeoCn6PfRYnjF5tiQOwNrloLGCM/PNEgSjjWyenU5QY2xvJKRItkoXPT8WM4mIvdWsRDNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yYPXdmqM; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yYPXdmqM"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e39841c8fd6so4293822276.3
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 22:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735022652; x=1735627452; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NZ/Zn/msJw83LpGcMMqNF9uWvU5YMyMm9vbqQhCTzPk=;
        b=yYPXdmqM79jI2PzWtOkZ/iRuSMnHgMBtO4tNBwu8NmNi8FjT8hSTzU7hWRA0/3I8Ev
         ZbK5cAe/qg2Zy73VGrIjlSWm/tmoKiZX/UJU2F4Zpk+byllm5cxBeRALpFoQLROmMdDK
         hDJXzvqWoTxftqdZWYuZJDFvdMrsbxhyYIXX7YHkapRVy3dFmFSm+JKbjP2mG6CiAJS4
         zYrHtpR+l/yqt55Xxy1piJJ/g+aeKhkdbNuC7PTXrWnNib6wfR7T8w7RuWiFeL1xccnZ
         RJKxJAse+ZeAdiIPJ5GagWg/e3dIax4fPEZtkfUXo+7RfQJhXS1MTlvGKEucy09pYA8h
         EGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735022652; x=1735627452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZ/Zn/msJw83LpGcMMqNF9uWvU5YMyMm9vbqQhCTzPk=;
        b=StDk1Yu3lRmp7Ov7/wN6Mq6KeYU/qsIpjuAH1iI1y6exJu9ssGsoKDDExYKUuckKJq
         xLQx3K1Bznw5Sx+SGwGu5j2NDRdFDiYUGeVlJC9hdDxdFPOwrqgaHyFkaPd3h3N2+iCl
         eLKL8jOaYCCYim8ykLoIDf4ZbmXUyuvbqRMEfGSpLnU0pT7PEBEckqaOwlvkNjuupJV8
         jEliBr/h8q9ZFV1FImPsSRexpjqZJkce/1jogzTT6REdkFvv74QH4z73tBzh9Yi8axK4
         zGr1PVt9G+uSXrkayBzHMlvLs9v+sjP0hBuO56ToqasV/LLBrfRYgfrr+S+GRYld7LDc
         RmEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlj+hgLDKbP6OdprZQpgJMquRf7OC78s1u/LaXhRl4DkTMZEcq/I/lUIJcEskySUZpYb0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxriLOCDAwum5wWX6+6rCfT06A8maId7/oWBI0vGddvmfnfzdIz
	Uuwrag5bvZ9Bg3YKzq5y3DeJANCRwpGDRESu6kieJ4LUXQPcw9TZ2hYLGrZpR6rPWgFherr+rI8
	sdh/u25j0992d2YXhDrqmvz04LMb7I/MmldDrXA==
X-Gm-Gg: ASbGncswSCfDZSim5joCnzrIQnlD1XxmX/tc6HAsCW6nl6SZLhilwb5K/ePFVH6g/zv
	OSR/F1rBCyebCZE77gTPJFx9SFSl144bWxPbgjLI2l0z3JbG3d8Kd
X-Google-Smtp-Source: AGHT+IH+tUx3wsKXoRccfhQ9sC/ui1pPyLa1/HDfJqJRr5j8UEnntJ1fSPiiiZze29cEu6LVIRZLDndyqvIvmsnlI1A=
X-Received: by 2002:a05:690c:6182:b0:6ef:5fee:1ca6 with SMTP id
 00721157ae682-6f3f8110472mr107964417b3.18.1735022652292; Mon, 23 Dec 2024
 22:44:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241223064147.3961652-1-victor.liu@nxp.com> <20241223064147.3961652-10-victor.liu@nxp.com>
 <6mhlb26vdfc7v3jmb7y3tlcuo336x7vkblbkzd5sosd6urirou@bbfalnfisdij> <b2d78f9f-014d-475b-86f1-9916ad6a3126@nxp.com>
In-Reply-To: <b2d78f9f-014d-475b-86f1-9916ad6a3126@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 08:44:01 +0200
Message-ID: <CAA8EJpom94QfZm5es7i1eVpzeL0svQYDEcGzd0atbgNYCv1osA@mail.gmail.com>
Subject: Re: [PATCH v7 09/19] drm/imx: Add i.MX8qxp Display Controller display engine
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, aisheng.dong@nxp.com, 
	agx@sigxcpu.org, u.kleine-koenig@baylibre.com, francesco@dolcini.it, 
	frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Dec 2024 at 08:21, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 12/23/2024, Dmitry Baryshkov wrote:
> > On Mon, Dec 23, 2024 at 02:41:37PM +0800, Liu Ying wrote:
> >> i.MX8qxp Display Controller display engine consists of all processing
> >> units that operate in a display clock domain.  Add minimal feature
> >> support with FrameGen and TCon so that the engine can output display
> >> timings.  The FrameGen driver, TCon driver and display engine driver
> >> are components to be aggregated by a master registered in the upcoming
> >> DRM driver.
> >>
> >> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >> v7:
> >> * Add kernel doc for struct dc_drm_device. (Dmitry)
> >> * Fix regmap_config definitions by correcting name field, correcting read
> >>   ranges and setting max_register field.
> >> * Get instance numbers from device data(compatible strings) instead of OF
> >>   aliases.
> >
> > Unfortunately no. Your instances are compatible on the hardware level
> > (at least they were with the previous versions, I don't think that
> > there was a silicon change).
>
> v5/v6 use OF aliases to the instance numbers, but in v6 Rob said it's
> abusing aliases because the aliases contain display controller instance
> number, like "dc0-display-engine0"(i.MX8QM SoC has two display controllers).
> Or, use OF graph to describe all connections between the display controller's
> internal devices, but it's too complex. So, I choose to add the instance
> numbers to compatible strings.
>
> >
> >> * Collect Maxime's R-b tag.
> >> * Trivial tweaks.
> >>
> >> v6:
> >> * No change.
> >>
> >> v5:
> >> * Replace .remove_new with .remove in dc-{de,fg,tc}.c. (Uwe)
> >> * Select REGMAP and REGMAP_MMIO Kconfig options.
> >> * Fix commit message to state that display engine driver is a component driver
> >>   instead of a master/aggregate driver.
> >>
> >> v4:
> >> * Use regmap to define register map for all registers. (Dmitry)
> >> * Use regmap APIs to access registers. (Dmitry)
> >> * Inline some small functions. (Dmitry)
> >> * Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
> >>   KMS routine to initialization stage. (Dmitry)
> >> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> >> * Drop unnecessary private struct dc_*_priv.
> >> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
> >>   interfaces to bind/unbind the drivers.
> >>
> >> v3:
> >> * No change.
> >>
> >> v2:
> >> * Use OF alias id to get instance id.
> >> * Add dev member to struct dc_tc.
> >>
> >>  drivers/gpu/drm/imx/Kconfig     |   1 +
> >>  drivers/gpu/drm/imx/Makefile    |   1 +
> >>  drivers/gpu/drm/imx/dc/Kconfig  |   7 +
> >>  drivers/gpu/drm/imx/dc/Makefile |   5 +
> >>  drivers/gpu/drm/imx/dc/dc-de.c  | 153 +++++++++++++
> >>  drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
> >>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
> >>  drivers/gpu/drm/imx/dc/dc-drv.h |  29 +++
> >>  drivers/gpu/drm/imx/dc/dc-fg.c  | 378 ++++++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/imx/dc/dc-tc.c  | 142 ++++++++++++
> >>  10 files changed, 810 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
> >>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
> >>
> >
> > [...]
> >
> >> +
> >> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
> >> +{
> >> +    struct platform_device *pdev = to_platform_device(dev);
> >> +    struct dc_drm_device *dc_drm = data;
> >> +    void __iomem *base_top;
> >> +    struct dc_de *de;
> >> +    int ret;
> >> +
> >> +    de = devm_kzalloc(dev, sizeof(*de), GFP_KERNEL);
> >> +    if (!de)
> >> +            return -ENOMEM;
> >> +
> >> +    de->id = (enum dc_de_id)(uintptr_t)device_get_match_data(dev);
> >> +
> >> +    base_top = devm_platform_ioremap_resource_byname(pdev, "top");
> >> +    if (IS_ERR(base_top))
> >> +            return PTR_ERR(base_top);
> >> +
> >> +    de->reg_top = devm_regmap_init_mmio(dev, base_top,
> >> +                                        &dc_de_top_regmap_config);
> >> +    if (IS_ERR(de->reg_top))
> >> +            return PTR_ERR(de->reg_top);
> >> +
> >> +    de->irq_shdld = platform_get_irq_byname(pdev, "shdload");
> >
> > Nit: shdload or shdld? Which one is used in the documentation?
> >
> >> +    if (de->irq_shdld < 0)
> >> +            return de->irq_shdld;
> >> +
> >> +    de->irq_framecomplete = platform_get_irq_byname(pdev, "framecomplete");
> >> +    if (de->irq_framecomplete < 0)
> >> +            return de->irq_framecomplete;
> >> +
> >> +    de->irq_seqcomplete = platform_get_irq_byname(pdev, "seqcomplete");
> >> +    if (de->irq_seqcomplete < 0)
> >> +            return de->irq_seqcomplete;
> >> +
> >> +    de->dev = dev;
> >> +
> >> +    dev_set_drvdata(dev, de);
> >> +
> >> +    ret = devm_pm_runtime_enable(dev);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    dc_drm->de[de->id] = de;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >
> > [...]
> >
> >> +
> >> +struct dc_de {
> >> +    struct device *dev;
> >> +    struct regmap *reg_top;
> >> +    struct dc_fg *fg;
> >> +    struct dc_tc *tc;
> >> +    int irq_shdld;
> >> +    int irq_framecomplete;
> >> +    int irq_seqcomplete;
> >> +    enum dc_de_id id;
> >
> > Why do you need to store it? This patch makes use of it just for the
> > registration.
>
> dc-crtc.c added in patch 12 would reference de->id. If no strong opinions,
> I'd keep this as-is.

Patch 12 uses de->id for two purposes: to assign dc_drm->de[ID] and to
include ID into error messages. It might be better to use the DE
device in dev_err instead of using generic DRM device and de->id.

>
> >
> >> +};
> >> +
> >
> > [...]
> >
> >> +static int dc_fg_bind(struct device *dev, struct device *master, void *data)
> >> +{
> >> +    struct platform_device *pdev = to_platform_device(dev);
> >> +    struct dc_drm_device *dc_drm = data;
> >> +    void __iomem *base;
> >> +    enum dc_fg_id id;
> >> +    struct dc_fg *fg;
> >> +    struct dc_de *de;
> >> +
> >> +    fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
> >> +    if (!fg)
> >> +            return -ENOMEM;
> >> +
> >> +    id = (enum dc_fg_id)(uintptr_t)device_get_match_data(dev);
> >> +
> >> +    base = devm_platform_ioremap_resource(pdev, 0);
> >> +    if (IS_ERR(base))
> >> +            return PTR_ERR(base);
> >> +
> >> +    fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
> >> +    if (IS_ERR(fg->reg))
> >> +            return PTR_ERR(fg->reg);
> >> +
> >> +    fg->clk_disp = devm_clk_get(dev, NULL);
> >> +    if (IS_ERR(fg->clk_disp))
> >> +            return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
> >> +                                 "failed to get display clock\n");
> >> +
> >> +    fg->dev = dev;
> >> +
> >> +    de = dc_drm->de[id];
> >
> > This depends on a particular order of component's being bound. If the
> > order changes for whatever reason (e.g. due to component.c
> > implementation being changed) then your driver might crash here.
>
> Nope. There is no chance to crash here, because
> 1) dc_drm is not NULL here
> dc_drm is allocated in dc_drm_bind() and before component_bind_all() is
> called.  dc_fg_bind() is called by component_bind_all().
>
> 2) dc_drm->de[id] is not NULL here
> It's already set by dc_de_bind(), because component_bind_all() binds
> components in match order and the component match for DE is added before
> the one for FG(DE is a child device of display controller and FG is a
> _grandchild_ of display controller).
>
> component_bind_all():
>         /* Bind components in match order */
>         for (i = 0; i < adev->match->num; i++)
>                 if (!adev->match->compare[i].duplicate) {
>                         c = adev->match->compare[i].component;
>                         ret = component_bind(c, adev, data);

Yes, this depends on the particular behaviour of both
component_bind_all() (which is not documented this way, so somebody
might decide to optimise things somehow) and of your component
management. While you have control on the latter, you don't have
control on the former code.

Please, don't depend on the undocumented behaviour!

>
> dc_add_components():
>         for_each_available_child_of_node(dev->of_node, child) {
>                 ...
>
>                 drm_of_component_match_add(dev, matchptr, component_compare_of,
>                                            child);
>
>                 for_each_available_child_of_node(child, grandchild)
>                         drm_of_component_match_add(dev, matchptr,
>                                                    component_compare_of,
>                                                    grandchild);
>         }
>
> >
> > This applies to several other places in the driver.
>
> I don't see any other potential crash caused by the binding order of the
> components.
>
> >
> >> +    de->fg = fg;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >
>
> --
> Regards,
> Liu Ying



-- 
With best wishes
Dmitry
