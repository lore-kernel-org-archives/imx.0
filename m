Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A29A233704
	for <imx@lists.linux.dev>; Fri,  9 May 2025 16:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806684; cv=none; b=cNBM74+4OxeMPHm97MX79m5pH2gTO20kj+AYf2ALVK63/fNNY1YM2rsPlkRIhUvANUvnSuaaCLy/EFDUTpY49o3eQ8KMgyhLBqM5lMmzAk0XjM4ErtLuGR0kR2Ljg3hV4otnwUD8aXpFcB88M9whvy7+C9M2BzeDsM8mcag80j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806684; c=relaxed/simple;
	bh=UWT3e7uRPGygOVjf8h2Eu768cYnpXn0Oj3p6hUoKpp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqKgoKqpB3xi2gRoVfnS80Vq2XClCeYRvDSnktxgftGqDCPXxYVRovREg6wxH5QNnu3MtIi7p4pIrunQyTT9FHyspoLR8vXjDU/5i1nhX1QwBgG8Hgo1hmBLy3VpPY73ED7QrtPPXIi38LRIZXlJOhyXfOZBDw6izU3STsK++tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewSAh9WO; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewSAh9WO"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad1b42d7ea7so30655166b.2
        for <imx@lists.linux.dev>; Fri, 09 May 2025 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806681; x=1747411481; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pX1Xn48JWPNWwoKS70iDCarEMhnhyPor/kZZ40HpF8o=;
        b=ewSAh9WOolnKWkyxgL9NqW3gRTOaIzB2npgjE3VjYc9s1ViwUdZOf5ofI2c/550w/X
         umIi/ff5gRsN2CgDCYBLVR84d4Rbf4K1+VX2Uktvf+SCPH/xO/lts8e/EIqhqKcsIMp2
         bEzhAHFKoHiTc4Zsi5M9DGZGE30tJ/K7MWMVjUM+bh8wJSrFUcq0pwLZn8fqiGvwzIfR
         eJ7plyx+90yO0qQDFc+X766HxRq94TjgbEzdbEr0kkhHxZeyZnQRMshwTBXDIz2wA1z7
         dDfRyyCN3R+1aMxNMJd+npGC+9C7YR93iyLHK17JM2P/WZbyCJJOG/6IhhYN46gcx+ie
         EmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806681; x=1747411481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pX1Xn48JWPNWwoKS70iDCarEMhnhyPor/kZZ40HpF8o=;
        b=Fu0Yu5tJH0LxWlU7Vedvq7GWVUkT3tyVXHMMTGf8AEpwKFB2KHZ7GM+B9p8Ct1FjiS
         Fqnf+Ahk8ghwHJvLq1Fga/gLWGs5mDEtgmue3VefJg9hHyf2dk4z/9sn7yjcHDR0hdib
         Ne7wQEUSY+dOzqxE9xpps1FZjJF050Afc0as8rmgQ6mH5wOk6LrRqFInwVSQ/ymPKUgo
         woUplbxxHLMtXo+/++y+Rvc7cbQMTuLRcJHP1qSx3znkXsx02RiWKDaRxGCU5o3C0AYy
         F6nSGHlX92dlZtg9IiwqHgBdwKJPiFQpwubgtnnOWB91c/hafckfm02gGWoC/6CmjT5I
         chzg==
X-Forwarded-Encrypted: i=1; AJvYcCUitTDDGce3x7CsYD59mrX9BRegzh7mXYvDFYVxnbJOMTN5YdZBQ12RaTJq76+cUOdrzcI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7d7KHmt/N5tqZ4EE37vVqP/idrbPTeIfqYyAHpEheqfhKGJ4O
	T1kUhi41+4SFw6/NH2w8GT+2XQGfhZD3Nm2ah/az7UtM3NAG6cx6
X-Gm-Gg: ASbGncudejHZZfB9yF43T6Hszm/iBhO919k971BJj5dQ4lW+mCPCFObnv0O2Y5ri6eQ
	JWwdqcvCOSUYcIozDeCVUzkq7bQf2AGQLlIQYcuq4ZT/j5DPtKaEKNjZej38Ghc6fJviTJRuYJV
	w8FiWB7E0nAW8iMNy2Rt7Zgg7vZb9fQiVrBt5/qbX93jGNts35Iptes5scE3dyLACXwGPHARraV
	Cx/zWvrTN9pXBWlYPCqG+O5EYDRoKwNywtGDpMcOfTvU3p14XBbasVtPvATFNF+41/gQ99RZ0+P
	0+y7wa50dkNoIjs6fJ8t7tYUNhO4
X-Google-Smtp-Source: AGHT+IF3sn8zNRPNDYSOtNhbc70HEDVqm9+kB+9U0d1DvOs91XcZhkaM1rCdhEtleM44NPXP0GTkbA==
X-Received: by 2002:a17:907:75f2:b0:ad2:2493:8361 with SMTP id a640c23a62f3a-ad2249383e7mr65020566b.11.1746806680433;
        Fri, 09 May 2025 09:04:40 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8f98sm172443166b.10.2025.05.09.09.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:04:39 -0700 (PDT)
Date: Fri, 9 May 2025 19:04:36 +0300
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
Subject: Re: [PATCH 01/14] spi: spi-fsl-dspi: Define regmaps per device
Message-ID: <20250509160436.ohx57lp7a3w2dhog@skbuf>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-1-32bfcd2fea11@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-james-nxp-spi-v1-1-32bfcd2fea11@linaro.org>

On Fri, May 09, 2025 at 12:05:48PM +0100, James Clark wrote:
>  static const struct fsl_dspi_devtype_data devtype_data[] = {
>  	[VF610] = {
>  		.trans_mode		= DSPI_DMA_MODE,
>  		.max_clock_factor	= 2,
>  		.fifo_size		= 4,
> +		.regmap			= &dspi_regmap_config[DSPI_REGMAP]

Comma at the end, please. Just like you didn't have to modify the
previous line to add this new assignment, so shouldn't any future
contributor. The comment applies throughout the entire patch set.

>  	},
>  	[LS1021A] = {
>  		/* Has A-011218 DMA erratum */
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 4,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LS1012A] = {
>  		/* Has A-011218 DMA erratum */
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 16,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LS1028A] = {
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 4,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LS1043A] = {
>  		/* Has A-011218 DMA erratum */
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 16,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LS1046A] = {
>  		/* Has A-011218 DMA erratum */
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 16,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LS2080A] = {
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 4,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LS2085A] = {
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 4,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LX2160A] = {
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 4,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[MCF5441X] = {
>  		.trans_mode		= DSPI_DMA_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 16,
> +		.regmap			= &dspi_regmap_config[DSPI_REGMAP]
>  	},
>  };
>  
> @@ -1167,54 +1231,6 @@ static int dspi_resume(struct device *dev)
>  
>  static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
>  
> -static const struct regmap_range dspi_volatile_ranges[] = {
> -	regmap_reg_range(SPI_MCR, SPI_TCR),
> -	regmap_reg_range(SPI_SR, SPI_SR),
> -	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
> -};
> -
> -static const struct regmap_access_table dspi_volatile_table = {
> -	.yes_ranges	= dspi_volatile_ranges,
> -	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
> -};
> -
> -static const struct regmap_config dspi_regmap_config = {
> -	.reg_bits	= 32,
> -	.val_bits	= 32,
> -	.reg_stride	= 4,
> -	.max_register	= 0x88,
> -	.volatile_table	= &dspi_volatile_table,
> -};
> -
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
> -static const struct regmap_config dspi_xspi_regmap_config[] = {
> -	{
> -		.reg_bits	= 32,
> -		.val_bits	= 32,
> -		.reg_stride	= 4,
> -		.max_register	= 0x13c,
> -		.volatile_table	= &dspi_xspi_volatile_table,
> -	},
> -	{
> -		.name		= "pushr",
> -		.reg_bits	= 16,
> -		.val_bits	= 16,
> -		.reg_stride	= 2,
> -		.max_register	= 0x2,
> -	},
> -};
> -
>  static int dspi_init(struct fsl_dspi *dspi)
>  {
>  	unsigned int mcr;
> @@ -1272,7 +1288,6 @@ static int dspi_target_abort(struct spi_controller *host)
>  static int dspi_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> -	const struct regmap_config *regmap_config;
>  	struct fsl_dspi_platform_data *pdata;
>  	struct spi_controller *ctlr;
>  	int ret, cs_num, bus_num = -1;
> @@ -1355,11 +1370,7 @@ static int dspi_probe(struct platform_device *pdev)
>  		goto out_ctlr_put;
>  	}
>  
> -	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
> -		regmap_config = &dspi_xspi_regmap_config[0];
> -	else
> -		regmap_config = &dspi_regmap_config;
> -	dspi->regmap = devm_regmap_init_mmio(&pdev->dev, base, regmap_config);
> +	dspi->regmap = devm_regmap_init_mmio(&pdev->dev, base, dspi->devtype_data->regmap);

I know there are other coding conventions floating around, but for this
driver please try to stick to a limit of ~80 characters limit for lines
which don't contain strings.

>  	if (IS_ERR(dspi->regmap)) {
>  		dev_err(&pdev->dev, "failed to init regmap: %ld\n",
>  				PTR_ERR(dspi->regmap));
> @@ -1370,7 +1381,7 @@ static int dspi_probe(struct platform_device *pdev)
>  	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE) {
>  		dspi->regmap_pushr = devm_regmap_init_mmio(
>  			&pdev->dev, base + SPI_PUSHR,
> -			&dspi_xspi_regmap_config[1]);
> +			&dspi_regmap_config[DSPI_PUSHR]);
>  		if (IS_ERR(dspi->regmap_pushr)) {
>  			dev_err(&pdev->dev,
>  				"failed to init pushr regmap: %ld\n",
> 
> -- 
> 2.34.1
> 

With the change request addressed, please add my tag and keep it in
subsequent submissions.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
