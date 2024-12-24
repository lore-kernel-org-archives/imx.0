Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3C0C8FE
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 01:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735003570; cv=none; b=QeicJT1hIWH92vQKZLWc4pdioA23aFP4YdTpegJ5ciHkJ+Wi5WGEHXCYT9eg0Vx/1r2rv41RwdZCnFqtOrNEDsxLtdowsBjhT1S8W+XLtqFYP+iMdZXTqAbhliRxtxlS0uo4zaaPuErIYqOyQtvG+nTv5zDeWLKlnFnK+bhzAss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735003570; c=relaxed/simple;
	bh=TVUUlxgWBZMeMhISAnoQAy5m96MMhv+rw/qrGNnv3mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WokvZNwdyjKLGDk8aXUIwi7w3cUuUaNIiUxvhUy4+vLTbdhwxGZGCmxrj89dzUm6QtNliVgDEMF2cp61OhFHH36DHfykpxk+MjYfY6cy+GuUutU/A/1ciJ8kjwS3a6JOuVnUGkqb2aIuTxhslVHzQUlAc63X5adothuIFppvs3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HGcXVkGT; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HGcXVkGT"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401b7f7141so4241941e87.1
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 17:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735003567; x=1735608367; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nOF8DK/NkDs2L91eWGo0OJRjfjJdjQA+q8dHhp2WoGY=;
        b=HGcXVkGTz/xN3gXW3uPZ6cIjHLr4lO8JxsqUWf81DSQJKIwc8tx3WeF6UzCGPgSZ1R
         mFoyeP0TBRwicKaXQTdNDCh5MWUpue1t3YPm1aG11wjjoYYZzqHJtSDFxPuYZge7UhrT
         hK6MlV9nv4PVllcLhrvXZy9zK2iXQwmS1QJFyz7nke3N2FO7UI22UIU0kdTMwCRT+2d2
         I7zsVVDGcz2m/3w9bzlhNlrWXT4/mDBZNLOivKEWtJ7EbjmNhswgKS+hBt7Hp5zOb1P3
         jMW08oZYgWCdTNzqfDfYcrVv/SQz8IuWrJPBz8X5b+QzpO2M6/RrySDvQs9kcijSdVAr
         0y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735003567; x=1735608367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOF8DK/NkDs2L91eWGo0OJRjfjJdjQA+q8dHhp2WoGY=;
        b=iqbMljxa+kS23oia1Wp6qW4TTk6PrPs7BkGmknkl83u7WdYTcXSKCj19qxsAD98iuX
         rPGHStxHGaXsTxmhH+0v+XboxY77s5z9xewEi4r83aRlVkO6bA94xwy15dchsMtQ3noB
         bdlHgjU2ZEw9IYwxzF4WQl4CKW5eOsjgmIpTtTobP8wm7Ii3hXIHEkEBS2Kyav9iRARG
         wtgCnRbdLUOw0uA8GqX4UXwFhguTaVAhLgn+WTQUuWJs7CCy7qPZGCJwxBt86EectXRv
         lSz74mCG3RZPafEev/g7kZTyKkc2wePnPagDLO7v+2aJnFlEDoE1bi6AB9icwTb3yc24
         35kg==
X-Forwarded-Encrypted: i=1; AJvYcCVZJ8ODb0qhMzJBFwrYLiyRrUkUGfGmsloP+DWMcftgJvExOf6q7FZH1Gcndo/ykqZAwz4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd8z8/sl99acXqlt1kP0hJi+d1RF2WYRvR5/uy+OuVysa7p80w
	kxyoUVu0SCW6mWoxLl0PYKcp42PgwpZwaAbvhFB0WTcmvkNTKhIMJiBnbMnbSTM=
X-Gm-Gg: ASbGncsQ86PVbuktWyG9KhNkKzzpqa+hNQIXy27IOB2IDcxnJjg8+hQAyc7hCjAifcE
	uy3kDtkQqRRq5Pgg5bHbqoS/4OxANc8VT+yrgBlw0rqWcr/uXvm+2ryoMvQZcGBg7jci6D9nE1N
	XwiVH41DISDx0Ch/2tBzQyAIg6cDPztXC1s6Yj+h7xIlJPi4HhRUNLZOSN1rbYj2ODgfDshN+PZ
	xe5j0d1VozorY7fvTRHFxic6kQLzOKeKs3ZruA6ZAJcEvA6yYKhsiNAxb2c1Ft9KrOzuhwOMQwk
	xyISBhqpztl63fxvUbXcDIEHrP9WCXyg136s
X-Google-Smtp-Source: AGHT+IFhha2IAymEp/0LSPoMPL8Vz0jJeIdZsjQiJTabJykmywUV1yX1xHj6Mzyxbed2Ac1pnbLlDA==
X-Received: by 2002:a05:6512:239b:b0:53e:44a4:34e0 with SMTP id 2adb3069b0e04-5422953306amr5601701e87.16.1735003566780;
        Mon, 23 Dec 2024 17:26:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832089sm1462892e87.268.2024.12.23.17.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:26:05 -0800 (PST)
Date: Tue, 24 Dec 2024 03:26:03 +0200
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
Subject: Re: [PATCH 2/3] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
Message-ID: <6fildsf62t6mj4wg7fqq5m7biuvp7lums5n3wszqyl5f4wfdxl@2ij3i2bhse32>
References: <20241224004439.239880-1-marex@denx.de>
 <20241224004439.239880-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224004439.239880-2-marex@denx.de>

On Tue, Dec 24, 2024 at 01:42:48AM +0100, Marek Vasut wrote:
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
> This makes LT9611 work with i.MX8M Plus.
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
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 23 ++++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)

Also please note the series at [1]. Since that time we got ycbcr420
handled properly, but handling the HDR should require DRM_BRIDGE_OP_HDMI
at least.

[1] https://lore.kernel.org/dri-devel/20241018064813.2750016-1-victor.liu@nxp.com/

-- 
With best wishes
Dmitry
