Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6252CA9
	for <imx@lists.linux.dev>; Thu,  2 Jan 2025 04:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735793729; cv=none; b=cgBpdKVd4oCMrN1sNQg7J+rYpZFZagSY9Ik5n6eqUH97mpN7t30OwbqCIaqSk8n2XE/sA4xNwp4xugUMf2M5wCgNcpyo1zGbpsj5T9WMp3112yVFkbsYyVnrfpnK0q4Eg/QpCJ7hQ1ZOvLSILabQKALOZfSWT9O+Dv+iRJiJ+sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735793729; c=relaxed/simple;
	bh=MOMEXdj91x69/DMRjeSSexSgUIaj9maNB31Fvs8rpns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOh7Hw6Kd1A/fZ+In4d3t5fSpZ7/H2SkHEkiN76JgOgUVE31lRGudEC0aVxKmUgGs9x9xWCvKiTzYaotoN/AU9jsHF7bp9x2vUOkfXi5aI4y3wC5jdn4IfebYAsAoY8HsDPAASsaD+knyyqKp1tcNxtk3hvEQld9Tcbvyk5sZKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPNOpv19; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPNOpv19"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30039432861so125767701fa.2
        for <imx@lists.linux.dev>; Wed, 01 Jan 2025 20:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735793725; x=1736398525; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qASnP2cY4XrN23QHAx7oo1qyNnemaNPNaz8WLNECAxw=;
        b=FPNOpv19vyRRih5NIQl9P0CUZxZfJiPiXEgKAa1EkQWgVigQzKx9Zq9t1oC+4QnTpR
         M3lsHi8UEg12o6Xwcd2DxXsDHOl9h/DuBI6QLjHOLbNUsF5vOiFaaoBmfkfosfZrG7/S
         abR4KmVeR/BUepX6HZ9tIdPKNGlvKp7tY9bzsirHIiB+A12mkVxNRv/en9NXbvoV2iUi
         Fovd1NITd++7VqGxqAx1rjdFl3ue7zo34VJmsg1Kq/WZJbiFLLGKwP9BUPIxSjQD+u+t
         YR42fLF4/5RhkmApKTE+hZATp5URyDM74nNxCZ6Yv0fnIqvu1rzPTET4Yq9CI70TclbM
         nLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735793725; x=1736398525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qASnP2cY4XrN23QHAx7oo1qyNnemaNPNaz8WLNECAxw=;
        b=hdvH/zm4s7EEYrF4JjRwY5UG0cpv2FKRJkB5pOnIuSbX6cPXwCwEePxqpOn6NCnAZ6
         x51nPc4gVJKwSIqguu4OdFL3zz30UqLi9kXEzPfIb0Jtx/Sjx2NXq4f15gVnbLxCA2Xm
         kw2wKrxIyhZt/RCL3jaiMVHKQ9XO0UbVIlHxAgFXF5BoPehU9k9WM/43k6vgs6ldWnjq
         aK2M0UljKhkkaOZDm5vheqF25kIAgokcp8tN6zNESVgz75wuwtyWhA4qdqPZ6HD5Ypk9
         Hh2cLRlNezcszhG9jt0RMiPmyutLda7LuBJ/JzXWh6CHF6faqks6ONVBOvqZCp5M6Jx3
         KLqA==
X-Forwarded-Encrypted: i=1; AJvYcCUSY18LNkXvwUP1zqCaWLUMYMQ4cuHoULyo5UaBUxvtyPxeE9cyl3FPUZPXRAdxGgKvvvI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUouFgiQ0tz7rhhOpv2EY22VrtW/w2V9N+AgGcM1+W3+EZABSu
	caax8AVPpf6wrB8DBhoyEucQk2x5en8l4GF04dizuVPNCZ8IQFkLbNr7+jTF6nk=
X-Gm-Gg: ASbGncu5GvKARjErUXQheru6r9Nb3kArTt3EL7ZIoaB+k9cOupQPA+lgCvFL/3wSZOG
	yL5zVkkOo4FykL8PFkWo5I0FBPO/IHWvtnL7BMb1M1+GoGJlKc+2LiKxKRs8nM1DGSq/90LK/L5
	zCnXFwzysejJphLuoywRVYZeZJCigU3zbXPLX50CSpKp7u6CvahHOskwbWJby9009yhBIXxjG71
	9ryJALE4jNLKiUScltE8Ns8PbCG8y6aMRZlbm7pLPK7BeG9DxSav9FHVSnUwNCxfAEYk1Fxz7Z3
	xQwYWZpPW110RKbPh2bloCHjrEQSux70e7DM
X-Google-Smtp-Source: AGHT+IGG3mukVpNeyVH5K54Lp9BzgauZG9/9OolikaWA8gUQhWcUH40nRVYnybuB5sK96BFCwAUJaQ==
X-Received: by 2002:a2e:b8c6:0:b0:300:7f87:a4f with SMTP id 38308e7fff4ca-30468557147mr160123631fa.19.1735793725424;
        Wed, 01 Jan 2025 20:55:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9bbe9sm41388161fa.43.2025.01.01.20.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 20:55:25 -0800 (PST)
Date: Thu, 2 Jan 2025 06:55:22 +0200
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
Subject: Re: [PATCH v3 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <sjyw3afx5qyrupf5tixgtubevmklgmstjvj3hjt5xukzmgluuv@47j6afzl5dp6>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231192925.97614-2-marex@denx.de>

On Tue, Dec 31, 2024 at 08:28:49PM +0100, Marek Vasut wrote:
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> The output_port set to 1 makes the DW HDMI driver core look up the
> next bridge in DT, where the next bridge is often the hdmi-connector .
> 
> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> 
> Note that looking at the upstream arch/arm64/boot/dts/freescale/imx8mp*dts ,
> the oldest commit which adds HDMI support is commit:
> 
> 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")
> 
> That already contains the HDMI connector node. Most follow up additions
> of HDMI support to another devices has been a variation of the same commit,
> including connector node, which is the proper way of eanbling HDMI on the
> i.MX8MP.
> 
> The rest should be covered by output_port_optional which should make systems
> with DTs without HDMI connector node work, but such DTs should be updated and
> the HDMI connector node should be added.
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
> V2: No change
> V3: - Update commit message
>     - Move select DRM_DISPLAY_CONNECTOR to DRM_IMX8MP_DW_HDMI_BRIDGE
>     - Enable output_port_optional
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb856..db5c8a76193ac 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -17,6 +17,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  	tristate "Freescale i.MX8MP HDMI-TX bridge support"
>  	depends on OF
>  	depends on COMMON_CLK
> +	select DRM_DISPLAY_CONNECTOR

I was going to write that it is not to be selected by anybody, but then
I stumbled upon meson driver, which also selects the symbol.

I still think that it is not to be selected by your driver as there is
no direct dependency (and there can be other bridges inbetween or the
bridge chain can end up with some other bridge). Such decisions belong
to defconfig or distribution's kernel config file.

>  	select DRM_DW_HDMI
>  	imply DRM_IMX8MP_HDMI_PVI
>  	imply PHY_FSL_SAMSUNG_HDMI_PHY
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 1e7a789ec2890..3d63200e468bf 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -101,6 +101,8 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>  	plat_data->priv_data = hdmi;
>  	plat_data->phy_force_vendor = true;
> +	plat_data->output_port = 1;
> +	plat_data->output_port_optional = true;
>  
>  	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi->dw_hdmi))
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
