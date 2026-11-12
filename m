Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497030;
	b=E1iXN8wVxGivXz77VJ7NkXFp6u6N7TLZSQgNF/zzivDE/cm9+ANVmN2rwzE9e/z2HgKT
	 RWV+xt/iKlt9Xh7LEZfRByXsTypNwpi9fotbCpyVXyvhGoBQFfSpFex7hoceP1Dvab3fq
	 J545HtNuKyCfT5ilnx/mk84fmnKs+6MBVEmbAPeSb22YaGwfC9w3+M+HiiDolresFvBZ0
	 slxG3FVuMlmuAlVwbm6SfVxpLBObO/sQiXbkVx6STd0wiDPYTklzr0hBzfi4BikvU4dzh
	 JDzXQnVDprZggJh0Q9IZE7/hdbtKdzbuOUyUEYW3/UFCX+ctojZcn/BSSlQvuaD8z4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497030;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=4cdhS9H/Scvqwuce1Cg7h8YKsQsIO3wekg4L5Z7bkvw=;
	b=0Ue6nO1kHymquoK4LpqjX8ZYsVbq1HgRDmfbdt3wwO8UpLqyTjRvOEATkGvxPlaMqEPx
	 S6KalYWjmfl7Vah6NrkPULtiqOfI+Y4ROMi29/RJyquNUr+0QBcCU0jKhQ0gDNCsi5rKi
	 3xHUV9N1eW05QdMMBsFpkvelCVrs4G7lzbuL4MMIM6yCb9cL8u7XE8No2wjtW0afEaX45
	 fbO6FSFyFxO1m52dAmulA8PEdUEAwsPovpLvMV1E89nlf+yvln+WJP93aG2aJonX/KZle
	 YPaT9GpCZDgVgc2XcDuWyMRB1NGnS/ESGoL8AahUvXEjzPVHnoTFLYu1erSUku32QUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=f+HhI8VP;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E1460A382B
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 15:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72E1460A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=f+HhI8VP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 936B84E41593;
	Thu, 12 Nov 2026 15:23:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6058B5FF85;
	Thu, 12 Nov 2026 15:23:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C6CD11BC07CF;
	Thu, 12 Nov 2026 16:23:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794497025; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4cdhS9H/Scvqwuce1Cg7h8YKsQsIO3wekg4L5Z7bkvw=;
	b=f+HhI8VPkOBIjANjnGDhGowwywBgE+KjjI34rpXWHGwPYpj3DVKYp4PPKjSmy1ajfDFpNC
	rVI5E2XPc8Vs3eu1qNaBXU1Ox6qME9KJX/zN+oMkYWCzqJMFnQn84CguQAdUyqNU8A+eeH
	UznEayOaNkXiVUZAplZffPzN5tHuIQgO2D5Q7H7xAD2H3AIeYC+D7X3NUVPpRBfGRCXlPn
	oAL3ae+pj/4I8HPAP54uKyiR7QuXYgMWmNvS66Z1y7UWNi0FUOkW1BC1M6EyBptInvgLZ1
	n7l1GXatBWVjwgds9I8PEmjCVUMRm5KKx7WK5kMxpj+uvWU1IJu7i2D0AoCguA==
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v11 4/7] drm/imx: Add support for i.MX94 DCIF
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261110-dcif-upstreaming-v11-4-9e13c85ae0d8@oss.nxp.com>
References: <20261110-dcif-upstreaming-v11-0-9e13c85ae0d8@oss.nxp.com>
 <20261110-dcif-upstreaming-v11-4-9e13c85ae0d8@oss.nxp.com>
Date: Thu, 12 Nov 2026 16:23:36 +0100
Message-Id: <179449701677.2030221.6593749298448668349.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Hello Laurentiu,

> The i.MX94 Display Control Interface features:
>  * Up to maximum 3 layers of alpha blending:
>     - 1 background layer(Layer 0);
>     - 1 foreground layer(Layer 1);
>     - A programmable constant color behind the background layer;
>  * Each layer supports:
>     - programmable plane size;
>     - programmable background color;
>     - embedded alpha and global alpha;
>  * Data output with CRC checksum for 4 programmable regions;
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # bridge refcounting
> Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
> Co-developed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Looks OK, I just have a small remark and a few minor nitpicks, see below.

> +++ b/drivers/gpu/drm/imx/dcif/Kconfig
> @@ -0,0 +1,16 @@
> +config DRM_IMX_DCIF
> +	tristate "DRM support for NXP i.MX94 DCIF"
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_DMA_HELPER
> +	select DRM_DISPLAY_HELPER
> +	select DRM_PANEL_BRIDGE

This should be unneeded now. As o fnow it is basically a complicated way to
say 'select DRM_PANEL'. And you are (rightfully) not using the panel API,
so this line should probably just be removed. Please double check by
building multiple configs, including an allmodconfig.

> +++ b/drivers/gpu/drm/imx/dcif/dcif-crc.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright 2025 NXP

2026 I guess... v11, a long journey, hopefully it won't slip to 2027! :)

> +++ b/drivers/gpu/drm/imx/dcif/dcif-crtc.c
...
> +static int dcif_crtc_query_output_bus_format(struct drm_crtc *crtc,
> +					     struct drm_crtc_state *crtc_state)
> +{
> +	struct dcif_crtc_state *dcif_state = to_dcif_crtc_state(crtc_state);
> +	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;

While this is OK, there is generally a preference to declare and assign in
the same statement when using cleanup actions, so...

> +	struct drm_bridge_state *bridge_state;
> +	u32 bus_format;
> +
> +	dcif_state->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +	dcif_state->bus_flags = 0;
> +
> +	bridge = dcif_crtc_get_bridge(crtc, crtc_state);

...it should all happen here, as:

	struct drm_bridge *bridge __free(drm_bridge_put) =
		dcif_crtc_get_bridge(crtc, crtc_state);

> +++ b/drivers/gpu/drm/imx/dcif/dcif-kms.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_panel.h>

Unused include?

> +static int dcif_kms_init(struct dcif_dev *dcif)
> +{
> +	struct drm_device *drm = &dcif->drm;
> +	struct device_node *np = drm->dev->of_node;
> +	struct drm_connector *connector;
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	ret = dcif_crtc_init(dcif);
> +	if (ret)
> +		return ret;
> +
> +	bridge = devm_drm_of_get_bridge(drm->dev, np, 0, 0);

This function is deprecated. You can use of_drm_get_bridge_by_endpoint()
instead, which returns a refcounted bridge pointer. And since the bridge
pointer is a local variable you can just use a cleanup action to put it
easily:

  struct drm_bridge *bridge __free(drm_bridge_put) = of_drm_get_bridge_by_endpoint(...);

Otherwise LGTM.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

