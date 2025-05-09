Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7513182BC
	for <imx@lists.linux.dev>; Fri,  9 May 2025 16:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806858; cv=none; b=aFRy99I4Reuv+0leq/pwKxxX+OoyKyhsiNHCCnisRffCn+sfIEj8l6G3GPEHM3mtUA3FHBL/f5IHF/M+juJVMlJJcLxlDmHQLuC1IAFMtaj+9RZVjbYY7MjlCmSCcmWdqncje2Zl6EDGq+oUcifw3pxLotuegC8dZSvk+I9VN8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806858; c=relaxed/simple;
	bh=+/1IQ2oCinigP5CnNh1S1UQ2fww1RQQZshyDjBgmy6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AO1l/vK+kTQ7pTW0k+HfSb3sBjDuBHAjaPjI3dTYuRHRE+QiZYlnshincjTmuxKlGoWMata5lk/gimc27BbCe/bB+ZynrnSr9K54eFlTMTY0GvF5UsQMf8hXIr2YV2hRKANSWfSFLjIBEiI9p1JdgHLOYaq/AaPwQdKSur798cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAKxJ6ZS; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAKxJ6ZS"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad1b42d7ea7so30706266b.2
        for <imx@lists.linux.dev>; Fri, 09 May 2025 09:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806855; x=1747411655; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O1aSEKZ9GPjDBpZIq0+eebFymFhGTQv6JnpJUamgLSU=;
        b=iAKxJ6ZSmn79On66HtLVAMD37UTeU0vptZ+WNUYIIXjzJxqcFO9LVPgTMmbuOWoAu5
         CWLDIUzFzigyHOMiWp9w4LGEqFKOHqcxBSCQSFCG1DSG778MybZB/W7MundY7M8SC776
         Y3sLxDtml9AClEWH/o1DO+PFqG8tMhmL8ArZvveMAvLYcG2hWJPol+Ka5k5lXwn9RYG0
         vjP/gyFX882Te50nVM2/f+4h3y8VUej5k+uAWBAfM+iEH80E0+yKb8wqWl4b626j4UQi
         4pSQkWSk5gNxQ0d9T9UHawxJiUj9/mIXHVOlXKaB7ZuP6n/mDuOzaYg28XBiohiiI5lb
         4+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806855; x=1747411655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1aSEKZ9GPjDBpZIq0+eebFymFhGTQv6JnpJUamgLSU=;
        b=KhS3Ycxs4FCIiC5mriEgPZA9hi7CH/kEovIbQALdalKEWwl486Qbg/5490MUFrsdNb
         fo3pkrIk/yuoanzK39Thtz+HEtgkSF0MmheI+7yTb5x9+GKvhT3zUlWJBqhK4+xUK1FQ
         k4/E3Oq8w96YzKx8iRLYrN1Yu/jHjlgB5ajeFYX3lclmtEX633gFdwbR1AxKlmhcwDHj
         f1bkGiURo1dwqIl7JDDMw8CWGBboXaM3dvvpb6LHB9EcJQF+/WI/I1YkuzIrG0o+pGgb
         zrIhD5zthPPnMFDoXJ7KV9arZETuxApUf6VehY1aXOxxMy7Z4E2xKujPFnRtK5nDiJOo
         itNA==
X-Forwarded-Encrypted: i=1; AJvYcCXsCXQQeR2no0lSrCZdzjXry1yqe3X3j0nL9B1ufCNj4XOxeIsj77P1iKuA4CBWFykla88=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKIdskbYKbnXStwNUvD2yCPVOOZ3oN6ySg8MO1RszrXyAEWH0B
	UraOj79wEG0t2hEcDMWtvWNK49k0XPy7aLHgzCxczBXwF+b9+mkh
X-Gm-Gg: ASbGnctWjZ5YEO+rDyziaYFo4YXOKYJaliXWl1Safc0i8o3UinuL329+ZTjxhtRTRRp
	4HnfnxALgkZ82CT2hUm4DFdLYC+KBWphnvMiko2vbjlj+Mmy8VMiNB0FoOmxtBdg6jpLJ/sFmBF
	clGH+Zb2MIfJVgrlrpdgOomZnoon459eI6r2Q2aP3Axpd1himNKB7mSJ6OzWba8mqy4+ynmSp7i
	8D12KJ0ZbL9qDWSzd/QcVvOSCpf4/KXfDcm2OYRMFnR+CvDdWNlA0OYFJjdYI3H7HlWkBcbAk2z
	P/TC942imRYvPExfv553YL3ZmxDn
X-Google-Smtp-Source: AGHT+IFfblZ5zyybW8Zc1JXlu3gaLC6XU1AeC2AshGGFeE3SDeA+ieQda1+l7upR9+VJ3d7Jl2trlg==
X-Received: by 2002:a17:906:84ef:b0:ad1:e9fb:e78 with SMTP id a640c23a62f3a-ad219121b47mr132183266b.10.1746806854983;
        Fri, 09 May 2025 09:07:34 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad22562ed61sm84950466b.31.2025.05.09.09.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:07:34 -0700 (PDT)
Date: Fri, 9 May 2025 19:07:31 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com,
	arnd@linaro.org, andrei.stefanescu@nxp.com,
	dan.carpenter@linaro.org, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/14] spi: spi-fsl-dspi: Re-use one volatile regmap for
 both device types
Message-ID: <20250509160731.wibhaumyialjloz3@skbuf>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-2-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-2-32bfcd2fea11@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-james-nxp-spi-v1-2-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-2-32bfcd2fea11@linaro.org>

On Fri, May 09, 2025 at 12:05:49PM +0100, James Clark wrote:
> max_register overrides anything in the volatile ranges, so we can get
> away with sharing the same one for both types. In a later commit we'll
> add more devices and also read/write ranges which also override volatile
> ranges so this avoids adding even more duplication.
> 
> No functional changes.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/spi/spi-fsl-dspi.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
> index 31ea8ce81e98..cb0e55a49eea 100644
> --- a/drivers/spi/spi-fsl-dspi.c
> +++ b/drivers/spi/spi-fsl-dspi.c
> @@ -141,6 +141,7 @@ static const struct regmap_range dspi_volatile_ranges[] = {
>  	regmap_reg_range(SPI_MCR, SPI_TCR),
>  	regmap_reg_range(SPI_SR, SPI_SR),
>  	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
> +	regmap_reg_range(SPI_SREX, SPI_SREX)

Same idea, don't take the review tag as a sign that I don't have any
change request here.

>  };
>  
>  static const struct regmap_access_table dspi_volatile_table = {
> @@ -148,18 +149,6 @@ static const struct regmap_access_table dspi_volatile_table = {
>  	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
>  };
>  
> -static const struct regmap_range dspi_xspi_volatile_ranges[] = {
> -	regmap_reg_range(SPI_MCR, SPI_TCR),
> -	regmap_reg_range(SPI_SR, SPI_SR),
> -	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
> -	regmap_reg_range(SPI_SREX, SPI_SREX),
> -};
> -
> -static const struct regmap_access_table dspi_xspi_volatile_table = {
> -	.yes_ranges	= dspi_xspi_volatile_ranges,
> -	.n_yes_ranges	= ARRAY_SIZE(dspi_xspi_volatile_ranges),
> -};
> -
>  enum {
>  	DSPI_REGMAP,
>  	DSPI_XSPI_REGMAP,
> @@ -179,7 +168,7 @@ static const struct regmap_config dspi_regmap_config[] = {
>  		.val_bits	= 32,
>  		.reg_stride	= 4,
>  		.max_register	= 0x13c,
> -		.volatile_table	= &dspi_xspi_volatile_table
> +		.volatile_table	= &dspi_volatile_table
>  	},
>  	[DSPI_PUSHR] = {
>  		.name		= "pushr",
> 
> -- 
> 2.34.1
> 

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
