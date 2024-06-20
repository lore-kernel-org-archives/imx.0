Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA2C433BB
	for <imx@lists.linux.dev>; Thu, 20 Jun 2024 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876839; cv=none; b=oiMS1yRv+Ue7LjAsGuYYDpL8D0IAoClVRKhuon/EM8lO3IlU903po8waJfx9dHRHAY3Jh3tTC1PDMNNMqkCHTa4Qkh2yoVdMCWNUzfF1o9pBZ+kYnD5CYfumayBoYElQYEPyVYXlnPiyhX8BbOeAzMYXjuFggnhGXjlj2JdMIrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876839; c=relaxed/simple;
	bh=xAGDVdqYGF7Dwk7Zyu4pSEXvweYAZad19JaVU5lJBn0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iJFjeI7brQIhJnM0u8LcunQyyEY0ZNWZvI17ABTuWbyBMKp2TKo+Wjl5QAmyJ97aC8TOWuF7ZINw1+oPFXZKVsqGD9PLGSPMjmNbPcnaiIfdk4IVI0irjS2yghHHZQxgYS5fW0S12utrGvQkKetfPSAas43KYOeif7/VkIfKrHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpizdUYY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpizdUYY"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42172ed3597so4150535e9.0
        for <imx@lists.linux.dev>; Thu, 20 Jun 2024 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718876836; x=1719481636; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WKctuEYUZwkLxrC3E1PmqrbhxPoOg9q030v+QYhbC/c=;
        b=PpizdUYYWm+K0scBfeLWOpcWDrIbjI8VIkDUaw2hzYJkXFm6xmNYqaJr4z3/kAfdwB
         zc5IIusvP1Y1QY+0vZk4y37PYNflPSmmqZ7D53Wh3Y7ZUN1IvmrNqYGfsdsUumCGLy1L
         MTyNCs/RQmz3e3pLgdDLPdKOuaEW7cJiVRs9oSSIcT9Wpx6a/liIOROcvHLFLFRGZgmY
         hvraiCjKAgjSb8GjFoggDs4CwKinjFS7w/fEwzx3jcvqmy+l4F2MnMvMO7JL6nrjiQIR
         Fenbfo39akOJ+GK5RmVYA2EE6IogXEUDnxvv3/+0Lqk1q/Lfb0GdcPZsZaT9slfUD4r4
         wu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718876836; x=1719481636;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WKctuEYUZwkLxrC3E1PmqrbhxPoOg9q030v+QYhbC/c=;
        b=ByX8Er6Gpwcvx38yMwSWlEB2zFZjt3fcw7DGOdNCUBFEn5p1j/XvEL3fGo6eC4LsYJ
         lYRJTmgJ5hI5PnVSC/T7fM/E4CVdzwYgBoods19ieBBeoiGYSLCL9hfz6j3lbhmycxfa
         Sw7XzQw2VqmAKmId3aluoXQnB8W6N2QkUoqmzaCoUQUF2JFl17lW9IBszkkKv4SFCbyw
         3X9LbG6MRJIOaesB3kvP8PDs9rDq8PsKl5Zqt+5cdQqhnukul72zP9/b6WgQvRZp3TMr
         O45uogwhD4tZm5M1t07xlvitmBIHohpw8Kqrgda8yAAhidEyVvDOMCNdRfvQ7ld0nM1/
         v/7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXJTguziNM1nvmIJqSWfSLTg0aMwzaluMrPFHJ+Sv3maf2fIV2keS9NrNm76d7FEk5drMUcOATjBgbJXnYmUUoQKQi
X-Gm-Message-State: AOJu0YzYYJslctlqwISJf4fW7f4Qah30CftXLhLSktrM1dzZpc8RQzQn
	I9M0CHCjrQfW5x3yAWe+WFR9lA4P266fylOsLOLDqrFmqzU6XN7S
X-Google-Smtp-Source: AGHT+IHQvG+njfu7Jbt33yKTwN3jzRduYIPw/O+RD8GZ4LC50ZQL/fKwWEW0MXBXDYbLYss3cQPfQg==
X-Received: by 2002:a7b:cc19:0:b0:424:7871:2e9e with SMTP id 5b1f17b1804b1-42478712f14mr37774595e9.6.1718876836028;
        Thu, 20 Jun 2024 02:47:16 -0700 (PDT)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208b6bsm19782365e9.32.2024.06.20.02.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:47:15 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Martin Kepplinger <martink@posteo.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, imx@lists.linux.dev, Purism Kernel Team
 <kernel@puri.sm>
Subject: Re: [PATCH] media: imx-mipi-csis: Use v4l2_subdev_enable_streams()
In-Reply-To: <20240619232431.5708-1-laurent.pinchart@ideasonboard.com>
References: <20240619232431.5708-1-laurent.pinchart@ideasonboard.com>
Date: Thu, 20 Jun 2024 10:47:14 +0100
Message-ID: <m3h6do3pzx.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hey Laurent,
Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> To support sources that implement the .enable_streams() and
> .disable_streams() operations, replace the manual calls to the subdev
> .s_stream() operation with the v4l2_subdev_enable_streams() and
> v4l2_subdev_disable_streams() helpers. The helpers fall back to
> .s_stream() if the source doesn't implement the new operations, so
> backward compatibility is preserved.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for this, LGTM.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index f49b06978f14..b9729a8883d6 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -320,7 +320,11 @@ struct mipi_csis_device {
>  	struct v4l2_subdev sd;
>  	struct media_pad pads[CSIS_PADS_NUM];
>  	struct v4l2_async_notifier notifier;
> -	struct v4l2_subdev *src_sd;
> +
> +	struct {
> +		struct v4l2_subdev *sd;
> +		const struct media_pad *pad;
> +	} source;
>  
>  	struct v4l2_mbus_config_mipi_csi2 bus;
>  	u32 clk_frequency;
> @@ -597,7 +601,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
>  	u32 lane_rate;
>  
>  	/* Calculate the line rate from the pixel rate. */
> -	link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
> +	link_freq = v4l2_get_link_freq(csis->source.sd->ctrl_handler,
>  				       csis_fmt->width,
>  				       csis->bus.num_data_lanes * 2);
>  	if (link_freq < 0) {
> @@ -958,7 +962,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	int ret;
>  
>  	if (!enable) {
> -		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
> +		v4l2_subdev_disable_streams(csis->source.sd,
> +					    csis->source.pad->index, BIT(0));
>  
>  		mipi_csis_stop_stream(csis);
>  		if (csis->debug.enable)
> @@ -986,7 +991,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	mipi_csis_start_stream(csis, format, csis_fmt);
>  
> -	ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
> +	ret = v4l2_subdev_enable_streams(csis->source.sd,
> +					 csis->source.pad->index, BIT(0));
>  	if (ret < 0)
>  		goto err_stop;
>  
> @@ -1233,12 +1239,14 @@ static int mipi_csis_link_setup(struct media_entity *entity,
>  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
>  
>  	if (flags & MEDIA_LNK_FL_ENABLED) {
> -		if (csis->src_sd)
> +		if (csis->source.sd)
>  			return -EBUSY;
>  
> -		csis->src_sd = remote_sd;
> +		csis->source.sd = remote_sd;
> +		csis->source.pad = remote_pad;
>  	} else {
> -		csis->src_sd = NULL;
> +		csis->source.sd = NULL;
> +		csis->source.pad = NULL;
>  	}
>  
>  	return 0;
>
> base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
> -- 
> Regards,
>
> Laurent Pinchart
