Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509981850B3
	for <imx@lists.linux.dev>; Sat, 27 Jul 2024 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722096699; cv=none; b=qnHwrEvc7vb6ynyO6qoMkPWVegDBoQh7lgERkZF04InKe/t9q+zwoZt9BjFp5UrJrSe4hzcxJs+ybYswv2viGT2jqc8unAL4JubhYMsbaE6mBDO6W7W+aCQwrvFWCc4fTUhB434x3m+l1a/c3VHDWIMzFV9DsKeBwWajucNSnEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722096699; c=relaxed/simple;
	bh=EsBhvQlOZK7H48/dvn9boK4pxLvMBa1HsD15rOYYEF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMDf+YDG6I9aYNa2B1vMYIyoOEjThz3pUoZj+hl/5bqVPIRSctpBqham4Yd8Ux9wfDmf1a9rfminXe9b5eCkjytSjIO1EjFYzbf9WhFWM5OzW0QGliNADVIEaBI8XTpSTPUpWo1qXTs3+aaoVm+Oqe3iarN96kxaMpmqto9v9Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LzieiZm2; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzieiZm2"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52f01ec08d6so3339654e87.2
        for <imx@lists.linux.dev>; Sat, 27 Jul 2024 09:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722096694; x=1722701494; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UBusllycXeOxRmMQscoyIs5AgPJe93SHCpBqt0L+kPU=;
        b=LzieiZm2ZnAp/10uvTHzZuAcRSebH0o6vfasRwx/Vvna3VLmWw3+otkWm/70DH70vk
         Gh/cGYqLUfNRcmBs/6he8+2801usNH6rm0nceU4CapjPwCwEtZX1rPkg/OdyIFpBmOhC
         RKKvN1Gj0xsVIpPLfNtJRvxClaFtgCC5aH0uFsY+NrHVrQL3kT/dY03E13xZZf2LQ3e1
         raaaTmIjFeTKV/svjU9ewayhxFgUBDytH4f4+4+tGJD8AW3gejaabAeOCBdG8VIwOK3f
         qYHrkfVH8gIwgWMsAOYCz5O8LgXmbivRP4sUoacOzF4B9+B47YarYu8OIOqqLwGWV7vy
         JJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722096694; x=1722701494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBusllycXeOxRmMQscoyIs5AgPJe93SHCpBqt0L+kPU=;
        b=G5rHLJ1lZ3/w8TL9O06jfRqbIFTh/7bizp3OJsbN2+fQJBiJ1ogP8luubIbJZBFeiA
         UTeaZH2VmCTGPCxty+NeSiI1/nYWJGj22/Imqc+A9KigOQ5c9ioD2UF7tzrw7CgzojYI
         9arYO3eD2Qd3NVCkYYRBDAjxQpbDrMfagvjB6meSW8ww8rFJMA7iEhRVkg8PKWu+TsL7
         YI/i4rXAztz/iuW+NAkn3owROnR1GzQA6Kk7ChQXg9FtN02m2jbLqs4FKcOlBObJ3+lr
         o0N5WAvq24grLPfoYqtnN/q5Hqtjdz9OQUlAl7ghdK2bjhX6gTg3br5paTuq9AysVuhU
         wcqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGq5bqnECJ+N+QuuCYPwHaJdDrPmf0l43/uPDc6Zmvbb/hQUfIGa7Yc85Rph9iiQT7+2BLVZqSMkTZQuttDYJn56MO
X-Gm-Message-State: AOJu0YyWJCbvApjS+QneI3cdtfqx2qlnLhHz5lPGX6UIKqctxQyaGqoM
	Gw1AqVauRPylar7UwQOSfWRG45+9SNoJyzPw3wja9UpoSHLM61Dz70uHINqDCCU=
X-Google-Smtp-Source: AGHT+IGE/jZAAc2Nvw2MwerHR0yM2Y7j8htLQh1i+XFzPdpbP2zrSjL7bEwU58lE0zhsp1lfp1yK8Q==
X-Received: by 2002:a2e:b710:0:b0:2ef:2c86:4d43 with SMTP id 38308e7fff4ca-2f12edf9e66mr19092791fa.3.1722096694188;
        Sat, 27 Jul 2024 09:11:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d074b19sm7153491fa.110.2024.07.27.09.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 09:11:33 -0700 (PDT)
Date: Sat, 27 Jul 2024 19:11:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, 
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, 
	frank.li@nxp.com
Subject: Re: [PATCH v2 06/16] drm/imx: Add i.MX8qxp Display Controller
 display engine
Message-ID: <ib6brwxeai3wkgzglihfbqx7jakjslnftydbzo32xthijkd4u6@y4ebhgk5o3ec>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-7-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712093243.2108456-7-victor.liu@nxp.com>

On Fri, Jul 12, 2024 at 05:32:33PM GMT, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing
> units that operate in a display clock domain.  Add minimal feature
> support with FrameGen and TCon so that the engine can output display
> timings.  The display engine driver as a master binds FrameGen and
> TCon drivers as components.  While at it, the display engine driver
> is a component to be bound with the upcoming DRM driver.

Generic question: why do you need so many small subdrivers? Are they
used to represent the flexibility of the pipeline? Can you instantiate
these units directly from the de(?) driver and reference created
structures without the need to create subdevices?

> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * Use OF alias id to get instance id.
> * Add dev member to struct dc_tc.
> 
>  drivers/gpu/drm/imx/Kconfig     |   1 +
>  drivers/gpu/drm/imx/Makefile    |   1 +
>  drivers/gpu/drm/imx/dc/Kconfig  |   5 +
>  drivers/gpu/drm/imx/dc/Makefile |   5 +
>  drivers/gpu/drm/imx/dc/dc-de.c  | 151 +++++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>  drivers/gpu/drm/imx/dc/dc-drv.h |  24 +++
>  drivers/gpu/drm/imx/dc/dc-fg.c  | 366 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-tc.c  | 137 ++++++++++++
>  10 files changed, 784 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
> 
> diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
> index 03535a15dd8f..3e8c6edbc17c 100644
> --- a/drivers/gpu/drm/imx/Kconfig
> +++ b/drivers/gpu/drm/imx/Kconfig
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> +source "drivers/gpu/drm/imx/dc/Kconfig"
>  source "drivers/gpu/drm/imx/dcss/Kconfig"
>  source "drivers/gpu/drm/imx/ipuv3/Kconfig"
>  source "drivers/gpu/drm/imx/lcdc/Kconfig"
> diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
> index 86f38e7c7422..c7b317640d71 100644
> --- a/drivers/gpu/drm/imx/Makefile
> +++ b/drivers/gpu/drm/imx/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> +obj-$(CONFIG_DRM_IMX8_DC) += dc/
>  obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
>  obj-$(CONFIG_DRM_IMX) += ipuv3/
>  obj-$(CONFIG_DRM_IMX_LCDC) += lcdc/
> diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
> new file mode 100644
> index 000000000000..32d7471c49d0
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dc/Kconfig
> @@ -0,0 +1,5 @@
> +config DRM_IMX8_DC
> +	tristate "Freescale i.MX8 Display Controller Graphics"
> +	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
> +	help
> +	  enable Freescale i.MX8 Display Controller(DC) graphics support
> diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
> new file mode 100644
> index 000000000000..56de82d53d4d
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dc/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +imx8-dc-drm-objs := dc-de.o dc-drv.o dc-fg.o dc-tc.o
> +
> +obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
> diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
> new file mode 100644
> index 000000000000..2c8268b76b08
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dc/dc-de.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include <linux/component.h>
> +#include <linux/container_of.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "dc-de.h"
> +#include "dc-drv.h"
> +
> +#define POLARITYCTRL		0xc
> +#define  POLEN_HIGH		BIT(2)
> +
> +struct dc_de_priv {
> +	struct dc_de engine;
> +	void __iomem *reg_top;
> +};
> +
> +static inline struct dc_de_priv *to_de_priv(struct dc_de *de)
> +{
> +	return container_of(de, struct dc_de_priv, engine);
> +}
> +
> +static inline void
> +dc_dec_write(struct dc_de *de, unsigned int offset, u32 value)
> +{
> +	struct dc_de_priv *priv = to_de_priv(de);
> +
> +	writel(value, priv->reg_top + offset);

Is there a point in this wrapper? Can you call writel directly? This
question generally applies to the driver. I see a lot of small functions
which can be inlined without losing the clarity.

> +}
> +
> +static void dc_dec_init(struct dc_de *de)
> +{
> +	dc_dec_write(de, POLARITYCTRL, POLEN_HIGH);
> +}
> +
> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dc_drm_device *dc_drm = data;
> +	struct dc_de_priv *priv;
> +	int ret;
> +
> +	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->reg_top = devm_platform_ioremap_resource_byname(pdev, "top");
> +	if (IS_ERR(priv->reg_top))
> +		return PTR_ERR(priv->reg_top);
> +
> +	priv->engine.irq_shdld = platform_get_irq_byname(pdev, "shdload");
> +	if (priv->engine.irq_shdld < 0)
> +		return priv->engine.irq_shdld;
> +
> +	priv->engine.irq_framecomplete =
> +				platform_get_irq_byname(pdev, "framecomplete");
> +	if (priv->engine.irq_framecomplete < 0)
> +		return priv->engine.irq_framecomplete;
> +
> +	priv->engine.irq_seqcomplete =
> +				platform_get_irq_byname(pdev, "seqcomplete");
> +	if (priv->engine.irq_seqcomplete < 0)
> +		return priv->engine.irq_seqcomplete;
> +
> +	priv->engine.id = of_alias_get_id(dev->of_node, "dc0-display-engine");

Is this alias documented somewhere? Is it Acked by DT maintainers?

> +	if (priv->engine.id < 0) {
> +		dev_err(dev, "failed to get alias id: %d\n", priv->engine.id);
> +		return priv->engine.id;
> +	}
> +
> +	priv->engine.dev = dev;
> +
> +	dev_set_drvdata(dev, priv);
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	dc_drm->de[priv->engine.id] = &priv->engine;
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry
