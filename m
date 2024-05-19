Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8F871743
	for <imx@lists.linux.dev>; Sun, 19 May 2024 21:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716154789; cv=none; b=of5bdVlHQwl2rO+pBB1bkmQQx1v5hMzQfD5giWpxyy3lBJH0mgTq8YLk1ZtxnJnCjp3NJ+QP6TdoHNaXK/R2kt8sHkyO2hf/wUHmsw9kfh1EBloYxguRxXI7h4PshCaqATsHjTibjm0MsvQ8RNfgKwo33tjHt9ovcRjVaBbXlX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716154789; c=relaxed/simple;
	bh=m6R8+3qojvcBS4piDk/3SdUzsO9i3lvH/aBW2WtzGNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFBzRxCDsUKWH8GFK3cjcrw8EtvE2uVX1nT++oQPFwq7O2P2AWXOaglECZFjxW3CQIlFuwcByly7m1lrCco7tK3Kh5ctUwAZ65CXE90LhLLqMhPgwH8HndAkYsjhGbtxYPppE38TbAWku+LRykW/zlR+uX9w8Cv7fAHuHoG7TqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=up1l7/Xa; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="up1l7/Xa"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51f2ebbd8a7so4483380e87.2
        for <imx@lists.linux.dev>; Sun, 19 May 2024 14:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716154785; x=1716759585; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sBKoviMmIMIkPsEzGI/ajrL3ge2BNQAmTeLSufIdz3Q=;
        b=up1l7/Xa1MrpcqyH6XZe+043AOBNHUjA9IaM+IoMO/fP83JHyyLPCJTbSmGD62UzfH
         t2KsVVxCmvktC+FopnYsHcHPleDC+f66xoK5pWeIHlQ6ZWVhUqni7F0VG5AjCI6oeZHQ
         YFITkr/7K2lbRz5VrkpDn1Ph54FZ68z9e5a8N6F7Ui+9aXz8a8rYIAtszikc8SswdVx3
         cCSTFyfFGp0uQbr3vVxmSlPHsHVQ+7Y6oFPwevoJhD37jXjndCSu1DmRdkxTf2/mPTO8
         MGYhTznOEX8IWGmJSIupiEeQIaaQklYkmLsUNJNGSbZbDiXhfYL0aJXHrgaB1yKnNFsh
         +pGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716154785; x=1716759585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBKoviMmIMIkPsEzGI/ajrL3ge2BNQAmTeLSufIdz3Q=;
        b=mdeM9fDLKMRAJILvatXMyqIWhuxOreIZhjR4wyMR/ng9ItyFh8hEfYkSY2ON/9mxvw
         1mbFWQUJwaLHQlf3UYJmZ9Ng4xp9zQNn5l/nCLkLeE3nOgxr2exBoviqGkl8g0e/X9HR
         Y/rJKQQfonayBqaHuRbVwd+L2qsGxcRU7KuVXyEsj6r3g945R9deVIFhsRDXjWYe+RJu
         n8foIHfZAgAypb0CBouOLHvQu9O5SPwT16ujwrqzZr2S4g85mjkBtiqcFVpLQsCktlWg
         spC4H84cGc8J0ijKqLqhOCNl+i81VoOETB0+xAyj+uu473yhaWEYkDi1oAoBY3X+mROW
         FxjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyYTvSeE7gf1tB548Of6LgFXljBAILFl0YLUayQXCrbbL4mZlGEaSra+UL22chWdF/9cjmWVxB1LN2uBwXPZTv57v/
X-Gm-Message-State: AOJu0Yyr7zxMfGCs6L8vpWSF8TT/zHdPYDUAlr2xWNdUdDWQbPz6H859
	VXFD6PIg0MSBEktSzkaCGP9TLL8867FmAc8pRIpLELloOP06aUYMVc6IsTVwUDA=
X-Google-Smtp-Source: AGHT+IGuVW67eLUYZOtoSdlxREuU4ssfyqlixP9pt5IroDU7SPhL9/1CwvMwVWbWNiyxVq7mu4UPwA==
X-Received: by 2002:a05:6512:33c2:b0:51f:5853:14e3 with SMTP id 2adb3069b0e04-5220fb74839mr20719294e87.25.1716154785275;
        Sun, 19 May 2024 14:39:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d3791sm4008349e87.174.2024.05.19.14.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 14:39:44 -0700 (PDT)
Date: Mon, 20 May 2024 00:39:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 11/11] drm/imx/ldb: convert to struct drm_edid
Message-ID: <x4ycujgusxndgcmpwdb624xsuv22aktmlahwawmimp26zxwhww@cum2dlwdzj6w>
References: <cover.1715691257.git.jani.nikula@intel.com>
 <c1f1143b5aea14aea968cda6508b275b2f7246ea.1715691257.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1f1143b5aea14aea968cda6508b275b2f7246ea.1715691257.git.jani.nikula@intel.com>

On Tue, May 14, 2024 at 03:55:17PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Note: https://lore.kernel.org/dri-devel/20240331-drm-imx-cleanup-v2-5-d81c1d1c1026@linaro.org/


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
> index 71d70194fcbd..793dfb1a3ed0 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
> @@ -72,7 +72,7 @@ struct imx_ldb_channel {
>  	struct device_node *child;
>  	struct i2c_adapter *ddc;
>  	int chno;
> -	void *edid;
> +	const struct drm_edid *drm_edid;
>  	struct drm_display_mode mode;
>  	int mode_valid;
>  	u32 bus_format;
> @@ -142,15 +142,15 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
>  	if (num_modes > 0)
>  		return num_modes;
>  
> -	if (!imx_ldb_ch->edid && imx_ldb_ch->ddc)
> -		imx_ldb_ch->edid = drm_get_edid(connector, imx_ldb_ch->ddc);
> -
> -	if (imx_ldb_ch->edid) {
> -		drm_connector_update_edid_property(connector,
> -							imx_ldb_ch->edid);
> -		num_modes = drm_add_edid_modes(connector, imx_ldb_ch->edid);
> +	if (!imx_ldb_ch->drm_edid && imx_ldb_ch->ddc) {
> +		imx_ldb_ch->drm_edid = drm_edid_read_ddc(connector,
> +							 imx_ldb_ch->ddc);
> +		drm_edid_connector_update(connector, imx_ldb_ch->drm_edid);
>  	}
>  
> +	if (imx_ldb_ch->drm_edid)
> +		num_modes = drm_edid_connector_add_modes(connector);
> +
>  	if (imx_ldb_ch->mode_valid) {
>  		struct drm_display_mode *mode;
>  
> @@ -553,7 +553,6 @@ static int imx_ldb_panel_ddc(struct device *dev,
>  		struct imx_ldb_channel *channel, struct device_node *child)
>  {
>  	struct device_node *ddc_node;
> -	const u8 *edidp;
>  	int ret;
>  
>  	ddc_node = of_parse_phandle(child, "ddc-i2c-bus", 0);
> @@ -567,6 +566,7 @@ static int imx_ldb_panel_ddc(struct device *dev,
>  	}
>  
>  	if (!channel->ddc) {
> +		const void *edidp;
>  		int edid_len;
>  
>  		/* if no DDC available, fallback to hardcoded EDID */
> @@ -574,8 +574,8 @@ static int imx_ldb_panel_ddc(struct device *dev,
>  
>  		edidp = of_get_property(child, "edid", &edid_len);
>  		if (edidp) {
> -			channel->edid = kmemdup(edidp, edid_len, GFP_KERNEL);
> -			if (!channel->edid)
> +			channel->drm_edid = drm_edid_alloc(edidp, edid_len);
> +			if (!channel->drm_edid)
>  				return -ENOMEM;
>  		} else if (!channel->panel) {
>  			/* fallback to display-timings node */
> @@ -744,7 +744,7 @@ static void imx_ldb_remove(struct platform_device *pdev)
>  	for (i = 0; i < 2; i++) {
>  		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
>  
> -		kfree(channel->edid);
> +		drm_edid_free(channel->drm_edid);
>  		i2c_put_adapter(channel->ddc);
>  	}
>  
> -- 
> 2.39.2
> 

-- 
With best wishes
Dmitry
