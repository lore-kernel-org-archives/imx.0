Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962D77710B
	for <imx@lists.linux.dev>; Wed,  1 May 2024 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714563579; cv=none; b=hLwe6Ji8CYQ4IhHVblzXbQ/w6y3y+TbKlwubo8hTkI3MzjSlLety1e8IxYvaNNh/DTXQP5+3bo41KJt45yNHifvB5HVcA4r3vmF3+HTRIVIGkbyvAcP6ycDpNBtrMTEdP/JVqRTw2SJpDgBmMGZRgn8Ob7u9fTkY/6PPQLE0D5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714563579; c=relaxed/simple;
	bh=hWiB2IF9/BVtMMyQ4v988Y/lvqGLBwMNOHdlgiN6avs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gh1+zwlWfgxXIbeOQQ3VYzlVT+tp3uf2bDluOv6gO6dUdUx8oeivlX5H49arVyjqnAcNgRsJMV683SOu5eCvNDY1OrWRY0+Xub0p+d+dsukNEixMx6024hJ1Hub29PKDku5MR44SomVVY7lNhnxI1Co7Tdkrr/JjlTept0hQYmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CczAGi+B; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CczAGi+B"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a58fc650f8fso393361666b.1
        for <imx@lists.linux.dev>; Wed, 01 May 2024 04:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714563574; x=1715168374; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6F17kWFJJgrPWa4fwXbgU8r9m9niISBPH10+pYqanrE=;
        b=CczAGi+B56gEPmkIwr8iD+XGui7/zJW8IJ76dzL8Qj+E+qnJLw2RpT+qqT/aqEcA97
         Ulz95q7XTGKXOhT/xaEEHyoqIgjbrGnIpSC3F0n86YCATsoLvErWt82JJEuhwnnR3GGs
         GqM8XMP6x8yIFFtbPpFOQR7BL5DAZ5IpWmm72rktMF8I2LxgPf06qCLsArSci9gjAb4d
         V52ytK35Ely8FKZ1Nxn1ObTNax/yut6o1r8HUcT/AbSYR1GeJbfzdwE46Eiwk2T0NB4k
         Ok+SNuL76j+mSAlHn5Qh2OCYZ7rxiFYDlc9LVNYmXyH8PV+YtKi7KgJq2XxXl8VUrle9
         az2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714563574; x=1715168374;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6F17kWFJJgrPWa4fwXbgU8r9m9niISBPH10+pYqanrE=;
        b=DTsjN38Xo5Vz/VBdPF7B4mBGO0jeI6Rz1dx2KFOo6X1aEwiipSCaC6kvVuffjehtJi
         4J57UfK7HevciOs5UpZGwsIlMvhD71fB8NKg2bhIFNOv57z+SLffRTHkrfeDKX3VY63W
         pzH/IJG14snH2ARD2HMh1hDBqNZr2JCXpYtSQ+qFGvK1PuXJclD1ozO9WKZ3zZjK2Qlf
         SR/XDTzPhSMzHISAI8/ZKBeCRUpJF0P1UV8kroe8pFHupaCZzBDu3XjuNilra6h7/6kK
         S9bSV/aTmPHyWis8BYAJDti217edrgWtkW/zZGJxaQPFwqBiZOI430fIf865KCkGZj/h
         TxVw==
X-Forwarded-Encrypted: i=1; AJvYcCWERIeTiRTH3wMGaP3VaUpt6h9Lpvw04FdQFAK8V6sNUcfyi4bUxLYIGrB3YWzlCY2udlUxM3AofLSel5HwHNjBSoV/
X-Gm-Message-State: AOJu0Yxkq0f2r/07E2fqdEEWx9ovK6p26Ap3c8d0/5csELYPrBfiCHzd
	0BWcZFHw373gnFXABxLyeePzeDqIhwSPR3eTYqcrCvMYulwuZIdrlRUGij8Ir7Y=
X-Google-Smtp-Source: AGHT+IG0gW8AtnHPdOjlgNheHMn3PEoAxQnpTPi2JoQxokArraxLe3iFJHW1+ihQz250D5AqltkHqw==
X-Received: by 2002:a17:906:af85:b0:a58:a1e3:a2cd with SMTP id mj5-20020a170906af8500b00a58a1e3a2cdmr1578941ejb.55.1714563573542;
        Wed, 01 May 2024 04:39:33 -0700 (PDT)
Received: from linaro.org ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id f7-20020a170906c08700b00a51a80028e8sm16222894ejz.65.2024.05.01.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 04:39:33 -0700 (PDT)
Date: Wed, 1 May 2024 14:39:31 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] clk: imx: imx8mp: Convert to platform remove callback
 returning void
Message-ID: <ZjIp85IouNtMV7JD@linaro.org>
References: <20240423071232.463201-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423071232.463201-2-u.kleine-koenig@pengutronix.de>

On 24-04-23 09:12:31, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Fixes: 1496dd413b2e ("clk: imx: imx8mp: Add pm_runtime support for power saving")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

LGTM.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> Hello,
> 
> after the merge window leading to v6.10-rc1 (assuming Linus has >= 10 fingers
> this cycle :-) I want to switch the prototype of struct
> platform_driver::remove to return void. So please either merge this
> patch together with 1496dd413b2e, or accept me sending this patch
> together with the patch changing the function's prototype for inclusion
> to Greg's driver-core tree.

Sure, will apply it today.

> 
> Thanks
> Uwe
> 
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
> index 574a032309c1..be9df93b6adb 100644
> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -346,11 +346,9 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int clk_imx8mp_audiomix_remove(struct platform_device *pdev)
> +static void clk_imx8mp_audiomix_remove(struct platform_device *pdev)
>  {
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
> @@ -382,7 +380,7 @@ MODULE_DEVICE_TABLE(of, clk_imx8mp_audiomix_of_match);
>  
>  static struct platform_driver clk_imx8mp_audiomix_driver = {
>  	.probe	= clk_imx8mp_audiomix_probe,
> -	.remove = clk_imx8mp_audiomix_remove,
> +	.remove_new = clk_imx8mp_audiomix_remove,
>  	.driver = {
>  		.name = "imx8mp-audio-blk-ctrl",
>  		.of_match_table = clk_imx8mp_audiomix_of_match,
> -- 
> 2.43.0
> 
