Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5113325948B
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 12:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735561863; cv=none; b=VDqRWkfrTmQyyJsoqV0QNm69/wFhAMfc1vOzhtnthcFG4GKEA99BOmXdlhfSqF9jhG6dEea6cKeeIn5ZVaxMqcEpJEPT+iPEhtBBkoJFJrIvIN8kvmHX4oeUuLGwAYOxCfUjP1doZ6RgZCIsR2aH8id6SvJNJwFasUKFU8Zp/5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735561863; c=relaxed/simple;
	bh=0186PX+EHcqP0L/XXSE3xvwGsWqYGLNpxq73trcWElg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fccN8nrb+jar/T19fiYPUSFOtingf5yJQYRNyaY00F+ZOyA5y+DMe7oAL+8kJraNGBUorthGtlEsJ4XBOh15v37jE51+k8C5Qh7mepa1HvYHxJcepsDO6uR56nSnv/CGuCdgpa2uaR06K7WF11YN4D2KJPp9opHUexBDau4ZaP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rEib+wrx; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rEib+wrx"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3022484d4e4so114757281fa.1
        for <imx@lists.linux.dev>; Mon, 30 Dec 2024 04:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735561859; x=1736166659; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XC7aFoxrHSDbAWGEa4JymcLKu3NlXqEnFCSTzXWk0ZE=;
        b=rEib+wrxcrsuukh730F0bTkfnZp4tOnH37GwoD9W1h6pfXBEP+FO5EcgZvGqnTeg11
         y1lUp3aKJH8CGJ74XZQLISGsf7AxQFKZRawQ6nUjekzB1S8jSW27tBb2h48jYPXYNEyL
         ONN3CzomTjVLZW+bahE1uFIFsnKtPe1uyxz003z4RJnMLPdkfqWgTrFT8Nmx+sayOzr5
         OzHTQa2NV1pPhcgk110cJCyanQL5cltlsgDieY423u7Didu9ar+3x6v8lhApAhFsRKGt
         2BEjpojg+GKf6ErLyECeD0gmak3cjpCeP5W857OPLe/qfV3vEMl5h31BAF/LpomvhkVt
         e5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735561859; x=1736166659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XC7aFoxrHSDbAWGEa4JymcLKu3NlXqEnFCSTzXWk0ZE=;
        b=CsUA0hVzOuF/D4HvJXfCM0uPJwV5349AtJ4E+C5cwUGlP9JrZGLsv9YEFaKNPWB34Y
         drMJoQb0RipSTjGB4GnRDi9nFPHFesFlUSnzII9dlMw7EndXFJ+vwbLrnVk9KwMolBL8
         snmGlVw1dbTcu6Nkny3nK3MilfSSTFSRSP8L7g9YHsQO+U9nCAAZPPPJ2iGkgvHA+2Zb
         3D4ouL4SbCV3LQveIq7N7ptuPJiZR+dlvq90uuLJkmfhF5FIzwUDh/sVlWU4/BauDR1L
         OjpN7AEDKv4MA1GcF5PywljubIKRku6xS8iHivxnAPGd2cVLJfdjoEkRyShc9g5dKmAa
         IFFg==
X-Forwarded-Encrypted: i=1; AJvYcCWnuxRh5/Enhf5OM0rhX2wCG9qbbIhJmMuSRW6nZtnKmk6zUduBKgn2zAX4chn3wVnYJA0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0vHODG9uC9v9fGLC/6C7R1v3htP0qNrAikmVvdpSrKzD/cIS+
	DqfHZdZkNbHIcBDlk+BF/+GVvMpXHnKSRw119B0Ro/Kjvdq88bHJXcrcFS65FOc=
X-Gm-Gg: ASbGncss8q2/eKYLmzzBHJW3rU7pmuHZf0xtvoIcLpEaTEdpkB+yiNJ/bdXfJP1Nflx
	o3qaWT9kkOL5P+rv5KORIYnz37sdV5n+Xdm1RgPMGzZZ2y7x1xtvnZnRfxEjOnm7L0uiBs1gKlM
	YJDGFTzE/lG4nldi4j+hmyva2u4+zspys8AP9BzFRQdPT47rHycehBTAQWiRfuWYeAK4UK3oc+h
	vhE2s6NyO8YU/acOirp19Vag6VF9X5jSTsv66WHztVIffvXWNewec+2vNuX5F9bGkrqNok14e1O
	Uq035z5eAsNBooCcMo4wXbGHdvNJXuWRWS1v
X-Google-Smtp-Source: AGHT+IHnMCZF1zu8nJTtjEUT7Ed/kcm++NEx7SYSKZGed7mcIjxQVIqgMQ+VgW8ijFMQzuCRlvCpHQ==
X-Received: by 2002:a05:651c:2229:b0:2ff:a7c1:8c55 with SMTP id 38308e7fff4ca-304685f51f9mr159543341fa.28.1735561859482;
        Mon, 30 Dec 2024 04:30:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b069ef9sm34662771fa.91.2024.12.30.04.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:30:59 -0800 (PST)
Date: Mon, 30 Dec 2024 14:30:56 +0200
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
Subject: Re: [PATCH v8 10/19] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
Message-ID: <ircgfhci3wmpahpxflmsbsxpahafqj6y5v56llezazaarbzppf@njzxhahie7xx>
References: <20241230021207.220144-1-victor.liu@nxp.com>
 <20241230021207.220144-11-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230021207.220144-11-victor.liu@nxp.com>

On Mon, Dec 30, 2024 at 10:11:58AM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller pixel engine consists of all processing
> units that operate in the AXI bus clock domain.  Add drivers for
> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
> well as a pixel engine driver, so that two displays with primary
> planes can be supported.  The pixel engine driver and those unit
> drivers are components to be aggregated by a master registered in
> the upcoming DRM driver.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v8:
> * Get CF/ED/FL/FW/LB device instance numbers through register start addresses
>   of the devices, instead of compatible strings. (Dmitry)
> * s/shdld/shdload/ for ED IRQs. (Dmitry)
> * Add dc_pe_post_bind(), to avoid dependency on the component helper's way of
>   implementing component binding order. (Dmitry)
> * Add dev_warn() to dc_lb_pec_dynamic_{prim,sec}_sel(). (Dmitry)
> * Drop lb_links[] and dc_fetchunit_all_fracs[] arrays. (Dmitry)
> 
> v7:
> * Add kernel doc for struct dc_drm_device. (Dmitry)
> * Fix regmap_config definitions by correcting name field, correcting read
>   ranges and setting max_register field.
> * Get instance numbers from device data(compatible strings) instead of OF
>   aliases.
> * Collect Maxime's R-b tag.
> * Trivial tweaks.
> 
> v6:
> * Fix build warning by expanding sizeof(fu->name) from 13 to 21.
>   (kernel test robot)
> 
> v5:
> * Replace .remove_new with .remove in dc-{cf,de,fl,fw,lb,pe}.c. (Uwe)
> * Fix commit message to state that pixel engine driver is a component driver
>   instead of a master/aggregate driver.
> 
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Inline some small functions. (Dmitry)
> * Move dc_lb_blendcontrol() function call from KMS routine to initialization
>   stage. (Dmitry)
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> * Drop unnecessary private struct dc_*_priv.
> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>   interfaces to bind/unbind the drivers.
> * Make some fetch unit operations be aware of fractional fetch unit index(0-7).
> 
> v3:
> * No change.
> 
> v2:
> * Use OF alias id to get instance id.
> 
>  drivers/gpu/drm/imx/dc/Makefile |   3 +-
>  drivers/gpu/drm/imx/dc/dc-cf.c  | 172 +++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-drv.c |   6 +
>  drivers/gpu/drm/imx/dc/dc-drv.h |  22 +++
>  drivers/gpu/drm/imx/dc/dc-ed.c  | 288 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fl.c  | 185 ++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fu.c  | 258 +++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fu.h  | 129 +++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fw.c  | 222 ++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-lb.c  | 325 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-pe.c  | 158 ++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-pe.h  | 101 ++++++++++
>  12 files changed, 1868 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
