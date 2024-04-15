Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C15D75818
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713194327; cv=none; b=anbunlkeSrZtzdTj4FQoodXHIoEuZHYWQMVpfYrEAE1YRJR3GfbuBmZb61eXcnZHwP8WVvKvnjP87bAHy1kmf75KzN7WjUs57vIKdvW+hbjZLAOrL1riUv4j7m8swPs9MSgqYfPQsxg+BpRnajJgFQytHgK226mBZw+GdO/tMuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713194327; c=relaxed/simple;
	bh=vYNESEOUgzTI40faatByfpCU1dT6sZuS9cR0oF8rJaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6OAEI6OfO15f5fghuMMfSTMRKdxkHGOe6MTRcntj8UVekeEVVct6ckl4+W4WLM45tvWnhVFOvGKP4DXxHS2Hz0+rrl01v50+cTe7lPZYhjRSN2qObdwuE8aRUyDkAnjStqSbfIz7bcK1NTUT/feXN2+L3mrIwWHbDxSEGsTR44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFHakai6; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFHakai6"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56e69888a36so4700883a12.3
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 08:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713194324; x=1713799124; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vpq7QbSflVZxyFAuGvP4r1TwK6fSOB6v15DB0jnFa2U=;
        b=KFHakai6Gk4mppiG05rxRrSV23GDt1HWyVV1vSIHmUN+C1TocYoRjvhEDunWKmOcTl
         yM/53g51NkLAk2Va/aR3QsWqkjmESJOX0UriD/h5sx3eb+AD620fmX5bd7qxKi68xoBm
         +Ew8A7bRmeRjqYH1ZYBxZN7H5R/E9mH8ThsmQyzme5KjhcfkmW3lWmEcPqDM1ehBJug6
         Z2ytEzYipXpJy1A0waue55qiWOsj9qTj6KjFof8uGDG4xLOYtSXoWEWQO+QbOPlpDayd
         izwBdmBId1RT/fBBBm+/KLJioagyA3MSm4AsT3WHV6Liyvc96FPyG5EY79jxx6ZQeehf
         QGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713194324; x=1713799124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vpq7QbSflVZxyFAuGvP4r1TwK6fSOB6v15DB0jnFa2U=;
        b=wDuxDa5U9JFSoCEAOd7c55LN4fVktoI/Er2N0Ewfg1RXym54hBU1ZGD0dCizF6nWpv
         nJjok2rgGqyPT7klh3i8XiGQg7Tm5eNH73b0uqxakH9m53l5djryTLSZpOnNTz94uQqH
         Yzhi7hTIFdVLyuYTJzVXwDQcef5agn4S2ZnQg7RsvRRtu1JuZ0BXAC5pM1mH2cxdf0YI
         tJc1H7D6Pcg2n1v4YRv6ASWUjc79GnUbfBmKLrtXQ3YxpJf5wWuoBNrYRRpcIhzerK23
         MZXb+wT8BbQqRMCc4nJRCXxATatNURQQFeHR8mVJX+DDQ1GvbPvYq1kw5adkB4hlNiK5
         t9IA==
X-Forwarded-Encrypted: i=1; AJvYcCU59WNsM34z76sGWbgppfoNlgfnFPASKC3Iv2MfxanYT/xKAxyggUQy/oaX0bGU7smKpUVJL0q4juaSISDIlOk7YW3L
X-Gm-Message-State: AOJu0YzdJ4hpQhrBQylNuvTB+tYIZNu8OQn5DquLIp0qrYm/ohXJqVZ3
	rVSJLtqOVAoHjMooE0HBxr3zZ7ZWA5VKD4Hfocr7B3ObL2oYFlQf
X-Google-Smtp-Source: AGHT+IEZ37fDv/8PATbDYAXJxrOLvA4hobMxdgnN/ln5UGiqgDS8FX1e15FZfty45LYMSm2C40OJEg==
X-Received: by 2002:a17:907:7283:b0:a52:320a:632f with SMTP id dt3-20020a170907728300b00a52320a632fmr7624800ejc.27.1713194324054;
        Mon, 15 Apr 2024 08:18:44 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-57-233.cust.vodafonedsl.it. [188.217.57.233])
        by smtp.gmail.com with ESMTPSA id bk5-20020a170907360500b00a53f1303771sm739161ejc.151.2024.04.15.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 08:18:43 -0700 (PDT)
Date: Mon, 15 Apr 2024 17:18:41 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: git@luigi311.com
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pavel@ucw.cz, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 24/25] media:i2c: imx258: Use v4l2_link_freq_to_bitmap
 helper
Message-ID: <Zh1FUQOt9n/tO3er@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240414203503.18402-1-git@luigi311.com>
 <20240414203503.18402-25-git@luigi311.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414203503.18402-25-git@luigi311.com>

Hi Luis,

On Sun, Apr 14, 2024 at 02:35:02PM -0600, git@luigi311.com wrote:
> From: Luis Garcia <git@luigi311.com>
> 
> Use the v4l2_link_freq_to_bitmap() helper to figure out which
> driver-supported link freq can be used on a given system.
> 
> Signed-off-by: Luis Garcia <git@luigi311.com>
> Reviewed-by: Pavel Machek <pavel@ucw.cz>
> ---
>  drivers/media/i2c/imx258.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 5de71cb7c1ae..65846dff775e 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -693,6 +693,7 @@ struct imx258 {
>  	/* Current mode */
>  	const struct imx258_mode *cur_mode;
>  
> +	unsigned long link_freq_bitmap;
>  	const struct imx258_link_freq_config *link_freq_configs;
>  	const s64 *link_freq_menu_items;
>  	unsigned int lane_mode_idx;
> @@ -1552,6 +1553,17 @@ static int imx258_probe(struct i2c_client *client)
>  		return ret;
>  	}
>  
> +	ret = v4l2_link_freq_to_bitmap(&client->dev,
> +				       ep.link_frequencies,
> +				       ep.nr_of_link_frequencies,
> +				       imx258->link_freq_menu_items,
> +				       ARRAY_SIZE(link_freq_menu_items_19_2),
> +				       &imx258->link_freq_bitmap);
> +	if (ret) {
> +		dev_err(&client->dev, "Link frequency not supported\n");
> +		goto error_endpoint_free;
> +	}
> +
>  	/* Get number of data lanes */
>  	switch (ep.bus.mipi_csi2.num_data_lanes) {
>  	case 2:

Looks good to me.

ps:
Maybe a good plan for the future would be to use: dev_err_probe
(instead of dev_err into probe function)

But this I think is somenthing for next improvements. :)

Thanks & Regards,
Tommaso

> -- 
> 2.44.0
> 
> 
