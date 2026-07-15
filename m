Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35AA3D79EF
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 08:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105393; cv=none; b=Gff8HdO8o11V+el4aTkH8Hg9ugWpnUq3w5a0nNfss1tNsTluYg6RW3aZtKQYTeKuvNCD0rfC5Jpr+dyeBOQkQmMfp8aRpObDh+Qtf/cjCXidUrlXYYCeOosvFD8jxWuR+kqL+bbO01WJBhLg3cvEZV5So1f8FaSn9OcUPMwDV4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105393; c=relaxed/simple;
	bh=MmarBasXfQmC5MEBsnaG4oLh0ejHeaQIQu1QoJ4BW7g=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=hFTD5PZ3AM/8prMNEYoPpaiy/IsXSunTYVh73ovYB624yw7Lke4CYxl2iIYjspt7oXC64g9TAe3DoVG49jB5m3w4dAX1YzOjdWe99WiUJdnKIUSeNtVay3+femvQtF6tvfKygfX4TlL+36mgsZu5rgcizJgfxe4yoQM9vxsbkGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=v0kbq9Wp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="v0kbq9Wp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2ADF64E40DC9;
	Wed, 15 Jul 2026 08:49:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0D8D6035C;
	Wed, 15 Jul 2026 08:49:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51F9311BD3C24;
	Wed, 15 Jul 2026 10:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784105381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rFNGUCLtwL0J9UMzLUhMW3/R8y1OqX7JmKnCzawnBV4=;
	b=v0kbq9Wp0Snw1mUEYQk9jToT+RDLdlswU2d0gC17xE5U6j9w26ZQcy27tuDIGkUnAsWC1r
	mfHKBcv8AJCFniJb3MRRErQT9zgqyu8yiiG8WlCormo77+OHu3roSFs/eepL/Uc4wb9WV1
	FbHWqZcpMDLxwYSTsZt8U3SBiWe14c6eWGWevDaw7Dgp2wSempFJvZIklMt7ywWFux98Zm
	MFBSwcNJRqJbqxBhDAMGbIV6SF3THRFUdD+AyVAuTBGTmxgDX9iIQaY/gXXJ2nLOVIu9xj
	6NP6WpfY8ydvPcYOcFNuJvo9SL3ml07T795y/M9jWuPy4Zf6L+qUYNadwe6HRA==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/2] drm/bridge: ti-sn65dsi83: Add reversed lvds
 lanes support
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Wojciech Dubowik <wojciech.dubowik@mt.com>
Cc: linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260713082622.52985-3-wojciech.dubowik@mt.com>
References: <20260713082622.52985-1-wojciech.dubowik@mt.com>
 <20260713082622.52985-3-wojciech.dubowik@mt.com>
Date: Wed, 15 Jul 2026 10:49:31 +0200
Message-Id: <178410537112.253594.1490996314225033236.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 13 Jul 2026 10:26:20 +0200, Wojciech Dubowik <wojciech.dubowik@mt.com> wrote:

Hello Wojciech,

>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index e6dbe51d0dba..d676ea3b40e8 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -148,6 +148,18 @@ enum sn65dsi83_lvds_term {
>  	OHM_200
>  };
>  
> +enum {
> +	NORMAL_LANE_MAPPING,
> +	REVERSE_LANE_MAPPING,

Please use a fixed prefix and use the suffix to differentiate:

  LANE_MAPPING_NORMAL,
  LANE_MAPPING_REVERSE,

> @@ -854,6 +873,37 @@ static int sn65dsi83_parse_lvds_endpoint(struct sn65dsi83 *ctx, int channel)
>  		goto exit;
>  	}
>  
> +	ret_data = of_property_read_u32_array(endpoint, "data-lanes", data_lanes,
> +			ARRAY_SIZE(data_lanes));
> +	if (ret_data != 0 && ret_data != -EINVAL) {
> +		ret = ret_data;
> +		goto exit;

The goto-based error handling is getting trickier and trickier with more
error conditions. Can you please add a preliminary commit in this series
that replaces:

 -struct device_node *endpoint;
 -endpoint = of_graph_get_endpoint_by_regs(dev->of_node, endpoint_reg, -1);
 +struct device_node *endpoint __free(device_node) =
 +         of_graph_get_endpoint_by_regs(dev->of_node, endpoint_reg, -1);

and removes the entire "ret = foo; goto exit;" logic with simple returns?

> +	}
> +
> +	if (!ret_data) {
> +		for (i = 0; i < ARRAY_SIZE(supported_data_lane_mapping); i++) {
> +			for (j = 0; j < DATA_LANES_COUNT; j++) {
> +				if (data_lanes[j] != supported_data_lane_mapping[i][j])
> +					break;
> +			}
> +
> +			if (j == DATA_LANES_COUNT)
> +				break;
> +		}

I think a memcmp() can simplify the implementation if you use the same data
type (u32) for data_lanes and supported_data_lane_mapping[].

> +
> +		switch (i) {
> +		case NORMAL_LANE_MAPPING:
> +			break;
> +		case REVERSE_LANE_MAPPING:
> +			ctx->lvds_reverse_lanes_conf[channel] = true;
> +			break;
> +		default:
> +			dev_err(dev, "invalid data lanes mapping\n");
> +			ret = -EINVAL;
> +			goto exit;
> +		}
> +	}

And perhaps the whole if (!ret_data) here can be simplified a lot as this
(pseudocode, not tested):

  if (!ret_data) {
      if (memcmp(data_lanes[j], supported_data_lane_mapping[NORMAL_LANE_MAPPING], size) == 0)
          break;
      else if (memcmp(data_lanes[j], supported_data_lane_mapping[REVERSE_LANE_MAPPING], size) == 0)
          ctx->lvds_reverse_lanes_conf[channel] = true;
      else
          return dev_err_probe(...);
  }

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

