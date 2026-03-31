Received: from mail-m19731119.qiye.163.com (mail-m19731119.qiye.163.com [220.197.31.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEB83BE16E
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 07:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942277; cv=none; b=pLLHov6zaYsCR6U/NirZ/XohohItQZciqnYHzzRhOz9tWYCWhgWy0l2mloR6X/wg0X+HKIbmZ9a1AFHuvCR0jNz48dg/bv86eTr8AZPPC4wjQcvONOFQkuEzJ7CuufAPBoRIdndqnxIrz1TvEK6mLqAlzrTdF6W6gnRMg21i09o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942277; c=relaxed/simple;
	bh=jLrLlHz3Rk6WpLoF/F1IgbWWwVQdwb43ZXK9bMwjong=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MWjX6vUlX8LFWplBrUZIFN54DIwtihfAFRtpV0Rp3+0MenkE94vYrE0OdqwOCZLcKTbj7num6d8/fUQ9vVEhBThfPc4OhRWEKU0RhphR6x4ifS2jRgQEd1Mb30s/sOUzPaX8LEKrpvgPyGWRAITcTQpIHNZb/P2yzD6Nr9o8WSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Gt+84e7R; arc=none smtp.client-ip=220.197.31.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Gt+84e7R"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38f48c703;
	Tue, 31 Mar 2026 15:25:55 +0800 (GMT+08:00)
Message-ID: <4fe357a3-2a4a-45fa-8fa2-6e74cd8fe254@rock-chips.com>
Date: Tue, 31 Mar 2026 15:25:55 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] drm/bridge: dw-hdmi: warn on unsupported attach
 combination
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
 <20260330-drm-lcdif-dbanc-v2-6-c7f2af536a24@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260330-drm-lcdif-dbanc-v2-6-c7f2af536a24@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9d42c8e62f03a3kunm0cf998d0a6b464
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk1LGFZJHkxIS0pLTUhCThhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=Gt+84e7Re463RchY6ClojFR1lQV0h32cgP4QGw1Ho9LrRvZtoPjlyJMhBN4/7GfmeYCNggEf3iYwFoO1Apea/XVf5JTqffa0gdlGMYGMkxznzmddrgI3Bv9G9wW6oWK/zjFuYEIbBfqIGS/whL0A23UKaj05z7141AR8BP0AOSA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=goB0cTHExm4jZajm3TogQBTzo9t4lHbQNOdATI5lgbs=;
	h=date:mime-version:subject:message-id:from;

On 3/31/2026 3:25 AM, Luca Ceresoli wrote:
> dw-hdmi can operate in two different modes, depending on the platform data
> as set by the driver:
> 
>   A. hdmi->plat_data->output_port = 0:
>      the HDMI output (port@1) in device tree is not used
> 
>   B. hdmi->plat_data->output_port = 1:
>      the HDMI output (port@1) is parsed to find the next bridge
> 
> Only case B is supported when the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is
> passed to the attach callback. Emit a warning when this is violated. Also
> return -EINVAL which would be returned by drm_bridge_attach() right after
> anyway.
> 
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Tested-by: Martyn Welch <martyn.welch@collabora.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8MPxL/MBa8MPxL
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Note: Returning when the warning triggers does not change the functional
> behaviour of this function. It is not strictly necessary in this patch but
> it will have to be done anyway in the following patch.
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 0296e110ce65..ab1a6a8783cd 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2910,6 +2910,10 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>   {
>   	struct dw_hdmi *hdmi = bridge->driver_private;
>   
> +	/* DRM_BRIDGE_ATTACH_NO_CONNECTOR requires a remote-endpoint to the next bridge */
> +	if (WARN_ON((flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) && !hdmi->plat_data->output_port))
> +		return -EINVAL;
> +
>   	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>   		return drm_bridge_attach(encoder, hdmi->bridge.next_bridge,
>   					 bridge, flags);
> 

Tested-by: Damon Ding <damon.ding@rock-chips.com> (on rk3399)

Best regards,
Damon

