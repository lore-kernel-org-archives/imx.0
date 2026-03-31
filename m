Received: from mail-m32102.qiye.163.com (mail-m32102.qiye.163.com [220.197.32.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633D53CD8C8
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 07:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943994; cv=none; b=BkfzUnIdNAj0JXHreXMKPMdWKHGLI1+418iUcY5YhenUOmLP060vMO25ONbEH+fmy5ityLK/PSJ/wt0lE3JmF6Fm1BHxR+3GM4R2YkLy+Vy7Rf+u9IQLu/L119NoRIPQI9UUMVc5SfUtstv7fKyXXZmHmdt6XjnjPo1VTP4m8h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943994; c=relaxed/simple;
	bh=uqfaO+FKyxOyT8cRysw8t5NVwAtt2Q99YAdW08Jxs+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5g0Yc6cO421qDykxaN3nOt+4OUMeM6RAhTaWfaPKTjSYbsxICw2b1Dq7nGTKaPSdJImISg/xP8gCOf7s/uvuB3Q8CkiQJEcZ/uyG6C5G5JPF5o3MzF2EOd3Nq7/j1nDDJHbVWQDbmABwNOAbUYDUCn/M5lDfcjTnYOJYb4kr18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=SOssxE5s; arc=none smtp.client-ip=220.197.32.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="SOssxE5s"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38f46a9a4;
	Tue, 31 Mar 2026 15:24:13 +0800 (GMT+08:00)
Message-ID: <26af9f46-a831-425f-89b8-c6e66a937b26@rock-chips.com>
Date: Tue, 31 Mar 2026 15:24:13 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] drm/bridge: dw-hdmi: move next_bridge lookup to
 attach time
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Fabio Estevam <festevam@denx.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Gilles Talis <gilles.talis@gmail.com>,
 =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
 Heiko Schocher <hs@denx.de>, Josua Mayer <josua@solid-run.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Martyn Welch <martyn.welch@collabora.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Richard Hu <richard.hu@technexion.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Vitor Soares <vitor.soares@toradex.com>
References: <20260330-drm-lcdif-dbanc-v2-0-c7f2af536a24@bootlin.com>
 <20260330-drm-lcdif-dbanc-v2-7-c7f2af536a24@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260330-drm-lcdif-dbanc-v2-7-c7f2af536a24@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9d42c7556e03a3kunmef6e2820a6aebe
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUJKH1ZOGhlOQkxDTR9MQkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=SOssxE5suj5ZNsuWbIy+7Xf44htCzfzHoDzFo/VhGeZ+2K2xJGxUp8Qe/bk2B8eeiRFXXBBjPNj8WGF+reXTb9bNrmGb5iZazSq4V85svyX1U9z5f0KkZDL5q3Kxd/kAD5cnNbus1AYR/PEaEH/yFB5mvdB3LEdTvO34OpXgMcc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=maTtoLZ6eXqdqKa68USyYKNJj/9x0MED6DQWvxrTcj8=;
	h=date:mime-version:subject:message-id:from;

On 3/31/2026 3:25 AM, Luca Ceresoli wrote:
> This driver looks up the next_bridge at probe time and stores it in
> hdmi->bridge.next_bridge, but only uses the stored value when attaching,
> and only in the DRM_BRIDGE_ATTACH_NO_CONNECTOR case.
> 
> This will be problematic with an upcoming change, adding an hdmi-connector
> using a device tree overlay when not present. That change is in turn
> necessary to migrate the i.MX LCDIF driver to the bridge-connector.
> 
> The problem is that, adding the hdmi-connector via an overlay, devlink
> considers hdmi-connector a consumer of the dw-hdmi device, generating a
> chicken-egg problem:
> 
>   * hdmi-connector probe won't be tried until dw-hdmi is probed (devlink)
>   * dw-hdmi probe will defer until it finds the next_bridge (the
>     hdmi-connector wrapper bridge)
> 
> In preparation for those changes, move the next_bridge lookup from probe to
> attach, when it is actually used. This allows dw-hdmi to probe, so that the
> hdmi-connector can probe as well.
> 
> Also avoid storing the pointer in hdmi->bridge.next_bridge: the value is
> computed when needed, thus a local variable is enough.
> 
> Finally, this also allows to slightly improve the code by not doing any DT
> lookup in the !DRM_BRIDGE_ATTACH_NO_CONNECTOR case.
> 
> Tested-by: Martyn Welch <martyn.welch@collabora.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8MPxL/MBa8MPxL
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v2:
> - Fix returned error codes
> - Added missing cleanup.h include
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 45 +++++++++++--------------------
>   1 file changed, 16 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index ab1a6a8783cd..f4a1ebb79716 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -6,6 +6,8 @@
>    * Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
>    * Copyright (C) 2010, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
>    */
> +
> +#include <linux/cleanup.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/err.h>
> @@ -2914,9 +2916,20 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>   	if (WARN_ON((flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) && !hdmi->plat_data->output_port))
>   		return -EINVAL;
>   
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> -		return drm_bridge_attach(encoder, hdmi->bridge.next_bridge,
> -					 bridge, flags);
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +		struct device_node *remote __free(device_node) =
> +			of_graph_get_remote_node(hdmi->dev->of_node,
> +						 hdmi->plat_data->output_port, -1);
> +		if (!remote)
> +			return -ENODEV;
> +
> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =
> +			of_drm_find_and_get_bridge(remote);
> +		if (!next_bridge)
> +			return -EPROBE_DEFER;
> +
> +		return drm_bridge_attach(encoder, next_bridge, bridge, flags);
> +	}
>   
>   	return dw_hdmi_connector_create(hdmi);
>   }
> @@ -3307,28 +3320,6 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
>    * Probe/remove API, used from platforms based on the DRM bridge API.
>    */
>   
> -static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
> -{
> -	struct device_node *remote;
> -
> -	if (!hdmi->plat_data->output_port)
> -		return 0;
> -
> -
> -	remote = of_graph_get_remote_node(hdmi->dev->of_node,
> -					  hdmi->plat_data->output_port,
> -					  -1);
> -	if (!remote)
> -		return -ENODEV;
> -
> -	hdmi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
> -	of_node_put(remote);
> -	if (!hdmi->bridge.next_bridge)
> -		return -EPROBE_DEFER;
> -
> -	return 0;
> -}
> -
>   bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi)
>   {
>   	return hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format);
> @@ -3373,10 +3364,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>   	mutex_init(&hdmi->cec_notifier_mutex);
>   	spin_lock_init(&hdmi->audio_lock);
>   
> -	ret = dw_hdmi_parse_dt(hdmi);
> -	if (ret < 0)
> -		return ERR_PTR(ret);
> -
>   	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
>   	if (ddc_node) {
>   		hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);
> 

Tested-by: Damon Ding <damon.ding@rock-chips.com> (on rk3399)

Best regards,
Damon

