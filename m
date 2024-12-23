Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BD5192B60
	for <imx@lists.linux.dev>; Mon, 23 Dec 2024 11:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734952635; cv=none; b=HuNqNnTYWwjZTsv8mGdRK1R5gU6ifcPa7CcK6IlYi2mvbNSoDqUvALI/vnfbAc5PwFRwDwQ4CjCr0oWtBqBVHf4TWWurRK6P2SY/3fpgnKUyrmWRCAnABWLqfUu5e7IMUVfs8gV3Ajw99Y4rlNYlaYSpmtD4gqqHdzsRkLsaciw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734952635; c=relaxed/simple;
	bh=gddnFubPquA8KlRVCcM7OyD1/U0UlHokw/tbt7He7RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuUN206StNBqqcu+CDsAy6NVhcSl8D95ZLvByKikpptUcZPPWsf0UUg4U7Zsn2pW1iSC/5ZJC35yPHYpxGa6oFcavQkXZ9stDTvZz8sHis6yI1U+nk/xV6GeAHwtvPr3OE7iAruvZhtIqxOUp+z3V5VvuNPtfHU9seZAuS4EkoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dfp+UjQq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfp+UjQq"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so4201015e87.3
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 03:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734952631; x=1735557431; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oAg0zQo1HvAo0iqaanIJTGGSdxrt4g4lbpXT4Fzk4t8=;
        b=dfp+UjQqPkLvlXfSI9tBEqKAvx9J/tCmzrrGmYjXGOH2b7f9LA8VdenIYF14MJ6c4W
         GUGiJpy1U6Zxtvz596nbPSlTdBWXeBqkerR8nXTr990OtOo6lZhS/vNxzcxGNmtfK/BF
         1L5uoPxfszMUse4gLtF+74JA7lmthlLuEWMyOPDbXKEpsZx4F24QTybwkiWUSRVw4gA/
         kJxDawzzLtwD53F92+XpMVM1FgHUlA6KscTwo4vRnZKgBDya7kdJUF1/gsFGDLqEu8BF
         7TlPl95ggMcAE6Z0pEHWPV4QZkbUTHuiKC6iqr+3vV2NJju/5QcsogIWf/4GV8//BL5c
         xDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734952631; x=1735557431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAg0zQo1HvAo0iqaanIJTGGSdxrt4g4lbpXT4Fzk4t8=;
        b=elnBCOb61DcSJ6jJEU63WdmVY/kFQ7b97OVfBQwn/ldzGvX/f9LUFvbVGj8sd5Sdxe
         ZLleuvjlkOlQRJ370vPhI+fdjHSU9yHuZK+H/U4R/xecDKW+AhxwEYmBmdKzuOyIXlfD
         7Mwn3rnappstMxgRzcvfr4g8jXbKA2/5ul6eMY8YP2Eebce8k8FMpE2mZRKO2H8KF0ok
         Gj6ibvDK8fwmYB1NBVIbc2KzAK20lMUw3e+6jX4DXPfiG2vldgPFIBp822oZZIDir8a+
         rt1ax1RpYrSeFnTB0+WmoBWDnpr+qOJ/nzJJ4HMgl0LiVnIbD/NhSvJS4CNclT4/Svfw
         4UcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUEuws74nk3HP6u+99PJabmvq1QXST2CQhh12CMr2YO5D8RrHrC7ItyE55+0j9Ow1Fo6c=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvqNtwtFT/DI/UGWeCPXTHD2Emma0uOk7EWGYm9Hdh3GkDwZm0
	kzCV+fOTOgyFwLa0jPL4c7ypljiN6GwXlBA1Jkeni4BicpEBErPBKVxeVqz20cQ=
X-Gm-Gg: ASbGnct/pbctHYLWBeQVr+qr0YeJnXSJafPpagOeqZGJa2pVFilsD8e92JXjKBmiye6
	nI2TC5Ju0F0zKEPWF+9aH+FpsEPBcj9K8r473TQTHZw4Su/wo3zrmMfv082tXSAKUGRwPDrI4DT
	bfuzgbutGcTqHQOAmIA9rBEDPHKEgK4u1Qi2rG75rBld3Kn8uCS7Dt7hnIYcrUON3KTPfRRXKCq
	klF7Y+5QWbncCBd3I5K7KkHAgOjjDaWZnilwv/S7cjpjcPpGGMfjxdJOrAOHa7FDmLeCYQGqeLk
	8L/m8Z+F17nh85erz7PrcofTktJgFIBpINpO
X-Google-Smtp-Source: AGHT+IGwOxJn54Td8r+NyaqARiydob0173z+5mppR6r0JXqtqFfPSqJJa2vifkVmQItUKQ/aSDHrlg==
X-Received: by 2002:a05:6512:39cc:b0:542:250d:eefb with SMTP id 2adb3069b0e04-5422955fd2fmr4096765e87.41.1734952631337;
        Mon, 23 Dec 2024 03:17:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223825f48sm1244622e87.225.2024.12.23.03.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 03:17:10 -0800 (PST)
Date: Mon, 23 Dec 2024 13:17:07 +0200
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
Subject: Re: [PATCH v7 11/19] drm/imx: Add i.MX8qxp Display Controller
 interrupt controller
Message-ID: <6eg5ahmcxfvwzoybqqcksqergoeu5ivsqshfjjmotwe6t4brge@aahohpjlfqic>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-12-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-12-victor.liu@nxp.com>

On Mon, Dec 23, 2024 at 02:41:39PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller has a built-in interrupt controller to support
> Enable/Status/Preset/Clear interrupt bit.  Add driver for it.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7:
> * Fix regmap_config definition by removing name field, correcting read ranges
>   and setting max_register field.
> * Collect Maxime's R-b tag.
> 
> v6:
> * No change.
> 
> v5:
> * Replace .remove_new with .remove in dc-ic.c. (Uwe)
> 
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_ic_data data strutures.
> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>   interfaces to bind/unbind the driver.
> * Take DC interrupt controller driver as a standalone driver instead of a
>   component driver.
> * Replace drmm_kcalloc() with devm_kcalloc() to allocate an array for
>   struct dc_ic_entry.
> * Call platform_get_irq() from DC interrupt controller driver to make sure
>   parent interrupt controller driver is probed first.
> 
> v3:
> * No change.
> 
> v2:
> * No change.
> 
>  drivers/gpu/drm/imx/dc/Kconfig  |   1 +
>  drivers/gpu/drm/imx/dc/Makefile |   2 +-
>  drivers/gpu/drm/imx/dc/dc-drv.c |   1 +
>  drivers/gpu/drm/imx/dc/dc-drv.h |   1 +
>  drivers/gpu/drm/imx/dc/dc-ic.c  | 282 ++++++++++++++++++++++++++++++++
>  5 files changed, 286 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
