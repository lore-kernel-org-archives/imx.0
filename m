Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6091B4235
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370633; cv=none; b=UIBaXK9e5YtGtBbYkfmScxRDMIgAUboCBSNrUky0iTmwwONOWYMofJSDfb/k6e+wzY05csfaXnIIYpSGwHsYopcps6aoN9AO5QH9YL10JkqcaAAGPXrbkSa1z75WJKr6tTxDsROZG96pSpYJHIid7BJG0ztqGXt4HQV0oNyyM2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370633; c=relaxed/simple;
	bh=hlbVUse1kdyH7T+j1cXIhKPxXlagveeorWZyug3mE/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6fe8jV42090zN3P81sm9mdxwaFRvqDboAgPS5I2f7346P4XyBApCg1m4TNcV/WhZgBrRHj3IMylS7eGRpl7HefhK01mKKkyPFhq65RtQIU6Gg3C9ynIlO8VQOLIdb+ygLajNNGS0Lrk9LitFpf0HobTLkFVM3eKgvGz3AnJXDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sDEZ+aEz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDEZ+aEz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so2715548f8f.0
        for <imx@lists.linux.dev>; Mon, 20 Jan 2025 02:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737370629; x=1737975429; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnCt5DjDOmwR4I1vAJ/enzzSs6/BjfG1IINpOsDqGQc=;
        b=sDEZ+aEzyBRSGkfBNFDaP0oHOORTxPfnIj0iDeNcTldWDjaN8ojACEa7zI0u8psSJn
         KEu/qh8ghFft6rn1T3bRuQY4D4ANyu8YY9Qi47yxxeHvgdDAOIP6ikZp26aMN7PoAZuO
         zokQRjODoeDLM/4MtZaniks81+tzkM2Ucmq+l8F7HxAGtiwlj3Cmb7ED9KxDJbe+hp6o
         157agNvjo+/BwArT9dO3zPnot3rop9VZTQXkNBRL7R+LktRar966cMnXgseKk4NfHO4R
         1NJCULqzF4YtYY/qi+ghGsxrGZGThx9dbDhfNAlYSpSaY1iZfkslBLJPh1kfvx17SprZ
         wYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737370629; x=1737975429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnCt5DjDOmwR4I1vAJ/enzzSs6/BjfG1IINpOsDqGQc=;
        b=wJkajOQKw/4Zcq+E/VgkvhXK8SBVB86jXOyAlj3+GEKB9bzcSX5C8MKaX+AqFDMwLN
         RQM6ABGyoTvOzNn/bYMSEkr1S6IiPxCYlfb0D69gA8TZNm3wZGg91CIv47S4C9O4N5k/
         lDQxlXPFLZUCwBBeW+dFdKK22M7rejlR9h7sUsdrst/NtU+EIgd8Beuhf7HmCosztrur
         dOXUQOUSl/7lOz/y72Pk18NzR2E2oq3ZyJYKALe1CnouZcofsuOp4YopwXbWLnIF+yGZ
         CM0FBdySCmGvgV1lZ2Em8jbHZ3+huLEFn4ye3aqgHhdZNwpLRdlXejycEQe/JGYBeuww
         ZuCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWWGXm8y+0LHF7DRQaTNem+kn5AZ/6H4BpDmL1zSveN0RyjvqkQTPz3K0G0WUebMPtTUI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwhvlta0aheN+dX0tUa6Wq/yp9B2ha7mAqx7iwGA3M83asq60j
	dZg13AYM9kIgXH5+bKop+wVzQLNg6cNbo8YYXkOIQ8c8EFEO5/5E9xSVnmoe1a8=
X-Gm-Gg: ASbGncurbaEh6Ca0FGHHBYYokQ/esQQuWlMpcFb/vZWoebCRArdCgKlWVjyuT1eZGS4
	1JGT0p5Amwn61FRFOr+FZPTLm+SkYnhyxKU2hN+gx3Q2QLD2JWusM66fmzjyt/F7F6LcA8Hlt/f
	UQrF2u6ZD3p/i7CMkkuxjZAM1XhLBWm3qBF6/2NdLe6Dk5Z+K0v3GFmxr7/OKrfJK7wWv88AzjF
	lDPDFRotrH2xHowktKuHu6hTTvMxG6+TptnKISWFg5CKjiR1xjbfxgOnU1yxuweQ1mlir8CW1g=
X-Google-Smtp-Source: AGHT+IFcWdDkIWIV3+3k8GBszP8VeZU7+D+s8s4XaEHc4R+KN6tCXBGU2C0qdKTOyDm73nBXW992qw==
X-Received: by 2002:a5d:4b48:0:b0:38a:41a3:218 with SMTP id ffacd0b85a97d-38bf57a2612mr7545183f8f.36.1737370629606;
        Mon, 20 Jan 2025 02:57:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b7fsm9969683f8f.27.2025.01.20.02.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 02:57:09 -0800 (PST)
Date: Mon, 20 Jan 2025 13:57:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
Message-ID: <a0403834-1c2f-42b4-81f3-ca4123fd2a4e@stanley.mountain>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120-rtc-v1-3-08c50830bac9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-rtc-v1-3-08c50830bac9@nxp.com>

On Mon, Jan 20, 2025 at 10:25:35AM +0800, Peng Fan (OSS) wrote:
>  int __devm_rtc_register_device(struct module *owner, struct rtc_device *rtc)
> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> index c4a3ab53dcd4b7280a3a2981fe842729603a1feb..e0e1a488b795645d7c9453490d6cdba510cc5db5 100644
> --- a/drivers/rtc/dev.c
> +++ b/drivers/rtc/dev.c
> @@ -410,7 +410,8 @@ static long rtc_dev_ioctl(struct file *file,
>  		}
>  		default:
>  			if (rtc->ops->param_get)
> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
> +				err = rtc->ops->param_get(rtc->priv ?
> +							  &rtc->dev : rtc->dev.parent, &param);

This seems kind of horrible...  I can't think of anywhere else which
does something like this.

It would almost be better to do something like:

	err = rtc->ops->param_get(rtc->priv ? (void *)rtc : rtc->dev.parent, &param);

The advatange of this is that it looks totally horrible from the get go
instead of only subtly wrong.  And it would immediately crash if you got
it wrong implementing the ->param_get() function pointer.

regards,
dan carpenter

