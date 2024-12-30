Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C742594B9
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735561845; cv=none; b=pEJRZ5zXj9QmK7cbRkLJ3rUoUSJJRt5BCbEluWZVf9ImAjVxH+VBl2hiHchxChGOZgwvemLtYPpZObXJW8OUafy04yC5fN03bpqoYvB1Sp519bqoCo1CcPrClGOsM74i+dsHYUb2qmw6wNoxE8odkHUXS3+B9BTMGMUVxsdmHE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735561845; c=relaxed/simple;
	bh=1Da+aWYWjUDDOnKx0JPqyCvQMJnsbX+TLRKFOsYKlyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrS1Ze8CQMnCOB1ox1oABwzwgL0Hy45O+vmfo84bWjL4SVronspvnIw2WDxwJvpzqhPDBzzwACeRCcISAAOXD5MmPFlv1Otf2Xm4gaEXyPdIVvNqaOSK8ndODFQScW+9ygDtKGUCbY1Pz3IfTRkL2Cc4uNAB+YlvVVXv+drsc3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SKsWwTuX; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SKsWwTuX"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so9000178e87.1
        for <imx@lists.linux.dev>; Mon, 30 Dec 2024 04:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735561842; x=1736166642; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwalPoVfhXMCQGFYr9ryIpasntXwzfLlG4s9wl797Go=;
        b=SKsWwTuXmJoVFkz+DfXIvVUwMV9TlRLwGjTC3tXtLsfsXID9KfRZVvdh2uAN20r2ZU
         2OpQu0UL5jyJOcyVZHV7ZE0otxq6eZj2xBMhk89rbovtv2xXeuIYJPVILqlF9Km4zaJm
         nrcLMshtT6FIw1DyzHHnhFnP2KpcChkVuUY7NJmam9/KAyUnT/NQtkQyotH3QFT/2975
         oJ40O5+aE3VB0PuAsPSy/53a145YAfPusnqH77fh4uDiS1FJuQwKzx+mfMUtI2HulVRj
         GQnBL6mSVm9L6jrkwaYZRrzx2r2Oc66uqGzyuHFXVT4tRrFfIp4NIDbrHUnj1muRBIKU
         +fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735561842; x=1736166642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwalPoVfhXMCQGFYr9ryIpasntXwzfLlG4s9wl797Go=;
        b=c9KPErjBQR84HP33p/QJJxm6AmfMg7xqC22v/t1fvwDZQ2tVvOHJnFEQjxv1f8rX7H
         tNOy5Hsog3wxthP9BCQoVgvxA0Zqmj9jy8NQ8BuurVjkL1/dU8m31me2Nh12ldXJjn2s
         teBivI6A+mKYsoP3f2kK6ZY0mKZUyBSeYgmX7ebEEvtuL01RLNEmne9bBYhfQepVhS07
         6Ha+2z1rfNG8C2FHzRUZX/tQSXH9rYKco9x0QNHVLZON3i9oSsahDyrM9czQxB58gdMo
         gMIeKK5E8pVQrQkAiLgwosWdl2AkQVWOkBYbhLpZHQzlztOePmgHav4gyoTj4y9RLrAb
         xVcw==
X-Forwarded-Encrypted: i=1; AJvYcCUYMmfv8Veq9StB7+3RLen6GEzuG4zgmU2K6Yd9W6CCZK+mc9kdDSKyxJkYteiKzENJpks=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxpWSDATFoLJKuQLgMetc4dJkFOe5YQnqP57lUkLKarAVeFfJk
	pu9axcrCXhAB8ArbjqR3B1Cvi9Y0InJGqUD7JMYLi/+qdvwhn6pgA8CSQAxHw1Q=
X-Gm-Gg: ASbGncu0DkSzPw4XZD8xUkF8yaIf9QNCCPnkCpRHBaSNk6CqwoF3wCShwo7JH8T+EXB
	MjmZioVcFRO4iui6Wjy9yH1ye8TyTGF1aNJGY5DTxDjnjpzevcT6Qk6/81DS1kyHwLLf4ADzlOo
	Z7typRwEtiBjA9NXtFrMm4qh/QozFyO9146gdgY2Ld1EH4xPukG3mlOGRAWkF8KNXiQJ8NQCVfr
	hUmZht5t1VchWdoiPTMUrcXFZEH3P2pkFPRJgFoIvDbAVa9jxBEkLWpY0QneNoFSDy/DGahCmLa
	V2Szjchcap5L0TYY56MWdscTXr7T+b9VgcLP
X-Google-Smtp-Source: AGHT+IGs664Z6a1VXnL1IU1qIYV7pMmpsbWRxTp2wEqrbi2vMMk6KM7ZX9fIIcaItp6yhkS4k5KJrg==
X-Received: by 2002:a05:6512:10ce:b0:540:2fbb:22fe with SMTP id 2adb3069b0e04-54229474ebcmr9865558e87.26.1735561841796;
        Mon, 30 Dec 2024 04:30:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6073sm3157778e87.27.2024.12.30.04.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:30:40 -0800 (PST)
Date: Mon, 30 Dec 2024 14:30:37 +0200
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
Subject: Re: [PATCH v8 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
Message-ID: <kwipz3wzydihroelii6enzxv63yyfuidmrua2fzhdvjdbjpqqp@s66fwhbbvcs5>
References: <20241230021207.220144-1-victor.liu@nxp.com>
 <20241230021207.220144-10-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230021207.220144-10-victor.liu@nxp.com>

On Mon, Dec 30, 2024 at 10:11:57AM +0800, Liu Ying wrote:
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
> v8:
> * Get DE/FG/TC device instance numbers through register start addresses of the
>   devices, instead of compatible strings. (Dmitry)
> * s/shdld/shdload/ for DE IRQs. (Dmitry)
> * Drop id member from struct dc_de. (Dmitry)
> * Add dc_de_post_bind(), to avoid dependency on the component helper's way of
>   implementing component binding order. (Dmitry)
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
>  drivers/gpu/drm/imx/dc/dc-de.c  | 177 +++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.h  |  56 +++++
>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>  drivers/gpu/drm/imx/dc/dc-drv.h |  57 +++++
>  drivers/gpu/drm/imx/dc/dc-fg.c  | 376 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-tc.c  | 141 ++++++++++++
>  10 files changed, 853 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
