Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC1F7CF16
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713196833; cv=none; b=myvIa1wAD+Tm+tg+W+ITalOCxPujYgJVCPx5qavRlQMoSpLBZ1GkcLeu0pH6BD/dSp+BsU9A9tY+DF+66b0U4QwpFRfCky3flOExwRbKSmfobAGhvZZSwh/Lubh5DfvDN5XppWIfsFQ1J4NP1e8ZcuTKq1PFRNNHEoxLniNRMlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713196833; c=relaxed/simple;
	bh=AIurx8M7UROIIHeLqraX05WDHOH/h7A8uObPQDPI2ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0WuLIlJDh7OENxCcxhNCzbEgp1F5cOVXMJ5LpgseyRheCZ9D6WdHAw/yslMm+FU8BLL7F1nOOaIyL9lqare/57EEa36d0BnXcmI39fxjgrcFBvOe3Ez681fYdNWQJIN6pyeoR9qfviySuNzwHndfcdD5U/g68y0OOyYBZP7rlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgygVaIf; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgygVaIf"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2da888330b2so21466221fa.2
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713196830; x=1713801630; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WonYqSzvWT83jIX0IgNtkReYkS7CHkadpcuSarICRPQ=;
        b=cgygVaIfTXOUilccD4ePxBuHl4y5ynrZ9r9XZKrftwQYlhdGw3XmlbhISLIYPV2ybj
         8MtEKeU9ezcA4V6kszXL5OG1/rMlqVxHjbQ1IlZiFvEPIJ5fz43pESW10Iq68SLdOwC8
         y+io8MZmKE312HYXoXCLLWinledcOAr9tTOMefJ3l9wxDM9hGKy8f9nM1qHUBJyctC26
         Lrqd8cKZ53pKe6RI6lLwsvj9SiPz5dX1KkZKGsIYGz7iGMdZNlxehtFoZKS2t6gUjljf
         xsuIqHgFb2zPPAgOYQbXtwRr6VV01JzzL5Om5hl0ph3Qd9tY4CacP3Euf9iKNnwyUr53
         Qb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713196830; x=1713801630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WonYqSzvWT83jIX0IgNtkReYkS7CHkadpcuSarICRPQ=;
        b=Zv8Z81vlXY2h+QjS1B40LqUUthV2qhrwLatNLEkeLYLnEmOCmguwBlLkMb7pspD/8M
         XpYYBI3aVFkzh89XVZoiFNoR1yMdxGsKkyy189U/YesgDniQ9E7nSTMx30/QmfxUtTh5
         uBFVkBb/ONNWn0MHxB39mMGUn8gT7GOVm+7fNFdOM5vfGM8oMgTW3Xyn8wqSeFwDF6tF
         XPizlgk1dmROYZuBXaWuMcUnHMjD08luyOZ+TYpamlSn3WXSk1+W3/XKEhRdhkY7Qaml
         RIIH2uF8NN3wjMkl3F+AHKaPD6JFv4MCc62Lrspg/SiauMQUQZuZAkSYkItRiLDDZno1
         OfOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNps0wViKmwoEqhZfMJvf2crurF19eIjm+xdubDV13Bd6Yb308w/4UMIlAA/7OGxs9HnSKYmToT02frjGRC5Jo0vhb
X-Gm-Message-State: AOJu0Ywu88yw+6dz32h4aK3B0o/jwAYtbI/m4lrsoRo3Q4xiVpV6DmFV
	a6MwjyDB0hTxHJO5dHeQwkALOPbNT/Y8rn9GNXnTML/s8SAqmCso
X-Google-Smtp-Source: AGHT+IFOUuLN0irhPLHYXZ6mYv7PuyHiv+G70JXmObZzyVsigzU8qLZr9NJrU7yz6GsEcOBavXFeVg==
X-Received: by 2002:a05:651c:b0b:b0:2d4:7455:89f6 with SMTP id b11-20020a05651c0b0b00b002d4745589f6mr9666567ljr.40.1713196829400;
        Mon, 15 Apr 2024 09:00:29 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-57-233.cust.vodafonedsl.it. [188.217.57.233])
        by smtp.gmail.com with ESMTPSA id n21-20020a170906701500b00a53d6b895ddsm783830ejj.200.2024.04.15.09.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 09:00:29 -0700 (PDT)
Date: Mon, 15 Apr 2024 18:00:26 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: git@luigi311.com
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pavel@ucw.cz, phone-devel@vger.kernel.org,
	Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v4 23/25] media: i2c: imx258: Add support for reset gpio
Message-ID: <Zh1PGuTjFlttNnLX@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240414203503.18402-1-git@luigi311.com>
 <20240414203503.18402-24-git@luigi311.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414203503.18402-24-git@luigi311.com>

Hi Luis,

On Sun, Apr 14, 2024 at 02:35:01PM -0600, git@luigi311.com wrote:
> From: Luis Garcia <git@luigi311.com>
> 
> It was documented in DT, but not implemented.

Good catch :-)

> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Signed-off-by: Luis Garcia <git@luigi311.com>
> ---
>  drivers/media/i2c/imx258.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index f0bd72f241e4..5de71cb7c1ae 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -699,6 +699,7 @@ struct imx258 {
>  	unsigned int csi2_flags;
>  
>  	struct gpio_desc *powerdown_gpio;
> +	struct gpio_desc *reset_gpio;
>  
>  	/*
>  	 * Mutex for serialized access:
> @@ -1250,7 +1251,11 @@ static int imx258_power_on(struct device *dev)
>  		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
>  	}
>  
> -	return ret;
> +	gpiod_set_value_cansleep(imx258->reset_gpio, 0);
> +

I think you can remove this new line here.

> +	usleep_range(400, 500);
> +
> +	return 0;
>  }
>  
>  static int imx258_power_off(struct device *dev)
> @@ -1260,6 +1265,7 @@ static int imx258_power_off(struct device *dev)
>  
>  	clk_disable_unprepare(imx258->clk);
>  
> +	gpiod_set_value_cansleep(imx258->reset_gpio, 1);
>  	gpiod_set_value_cansleep(imx258->powerdown_gpio, 1);
>  
>  	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
> @@ -1573,6 +1579,12 @@ static int imx258_probe(struct i2c_client *client)
>  	if (IS_ERR(imx258->powerdown_gpio))
>  		return PTR_ERR(imx258->powerdown_gpio);
>  
> +	/* request optional reset pin */
> +	imx258->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +	if (IS_ERR(imx258->reset_gpio))
> +		return PTR_ERR(imx258->reset_gpio);
> +
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
>  

Looks good to me.
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>

> -- 
> 2.44.0
> 
> 
