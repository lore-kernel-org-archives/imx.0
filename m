Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624A525776
	for <imx@lists.linux.dev>; Fri, 19 Jan 2024 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705652764; cv=none; b=Cov1pJZvI2CkyaLSS325k35FRJqiZ116t6uhuuww05cTJS4AAexZDRGRyD0+zeRduPZqOnN0mRd72BTgBONicw6222IinVUCmA9yQA23n3jMbbfzNskOJ5qq+sC6jDvctR5naCAF/PgIDdnHbl4E+Wb3NiacAm8e1Jf2ZJIcix8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705652764; c=relaxed/simple;
	bh=14enbQNT425H/s7qxuMVbS/EvYQp4sjrhMrRGBV63bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8vAQKBGg29aJKJHBITbcGpK3MbkSF8O1mNBOYKo2fbx5xJf0hgeIOG7EFCDh5m3c++vfyomY8vkiIx8wsYFFw9HzLv/sNKNiGKFoPd//pJBV6N9UTuEcfQj8qdOspt0EYB+5BCHZnH1+qfBVk8EPTJI3NnQ/dNDcufWdok5Vw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M8LSS7Fj; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M8LSS7Fj"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-598a5448ef5so299590eaf.0
        for <imx@lists.linux.dev>; Fri, 19 Jan 2024 00:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705652761; x=1706257561; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KkWXmKH0r8EujnkQjuJIPEC6n7Ky9X3nKqyBzdmGTX4=;
        b=M8LSS7FjEcwm4y0AYXM6OXI4fSnUjbD8eS5FEm19hTsNj1CM9p7bBERR6kClTYQwmz
         2JxL7Z4mvaSUxnCbecrXpHKCNbti2VtfmAT6ryjC/ju63wtK32KzQMJFT1nla6PK5ek4
         qHOVbDtnJ17lo1OwRJs6Enj9z9JDC8M8qiyiaECUKJVmv5UW6HFyefWFcPo2hE3JqV2/
         lWptr5xbsY6Uvy1kYVagyn/uQAWpXVYJyjhMw5Q99Acz1SpbxmX0EOy+GBQ7Dxrz6jgz
         O0vsubMiNjs08LMLd7t/XzeQ6/p6yQkIdOmWjGgVUvGiwACqdpPGsJj5asXDMDlIUrD0
         eZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705652761; x=1706257561;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkWXmKH0r8EujnkQjuJIPEC6n7Ky9X3nKqyBzdmGTX4=;
        b=qdNiH4jiv0SsKiZI8Nqqjb6lnEEl3rkcqdqsZ60kp7IN8Tj5mLw0CwvaXQTnTf+O4E
         B4b9QwEgqqXDzeuTu9+PmvAFvg87vxJ6q5MC/kWdr8Ujx7bPsJqjTrX2MtlLpbboPXXQ
         mgEqUOXeTEMI5UcJ3H4shgOgndUpABM5B6VlZtEas3oUSGRZzW1vzHQqHl+GBHruBomL
         ufzmPgatAdUOjZT1yML9S2Gisaom+3XgZluD+pY8rTYbXYXE2Nr/sLms71k4p9HXY7jO
         T0DD79mD5F9osfxZ9zNaZctHxm2DeYDaKol202lo+MBxyqeKQ22IUpUA2gPO734Mjs15
         4zJA==
X-Gm-Message-State: AOJu0YwDEo+cQNS0CroCVSHiPK9d+gzrU0CFOrdkKq5V6XHQd4jhq2LH
	H4AljjUDvRGIjAEweCn1SggqzEnHZiRcw313ZD72dDyJZ0fipiPbWphGU4xDKg==
X-Google-Smtp-Source: AGHT+IH4zHVhjf2dGBDi9fXZGMfVXKS+wYAhsQnF5CU4QOXjKDKMimg65NlxwYiYaoOMd3gXW0pP8w==
X-Received: by 2002:a05:6359:3511:b0:175:bfae:a564 with SMTP id un17-20020a056359351100b00175bfaea564mr1866729rwb.38.1705652761382;
        Fri, 19 Jan 2024 00:26:01 -0800 (PST)
Received: from thinkpad ([117.248.2.56])
        by smtp.gmail.com with ESMTPSA id p27-20020a056a0026db00b006dbad3a1b84sm2346449pfw.190.2024.01.19.00.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 00:26:00 -0800 (PST)
Date: Fri, 19 Jan 2024 13:55:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: krzysztof.kozlowski@linaro.org, bhelgaas@google.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
	helgaas@kernel.org, hongxing.zhu@nxp.com, imx@lists.linux.dev,
	kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
	kw@linux.com, l.stach@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lpieralisi@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
	shawnguo@kernel.org
Subject: Re: [PATCH v8 08/16] PCI: imx6: Simplify switch-case logic by
 involve init_phy callback
Message-ID: <20240119082552.GG2866@thinkpad>
References: <20240108232145.2116455-1-Frank.Li@nxp.com>
 <20240108232145.2116455-9-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240108232145.2116455-9-Frank.Li@nxp.com>

On Mon, Jan 08, 2024 at 06:21:37PM -0500, Frank Li wrote:
> Simplify switch-case logic by involve init_phy callback.
> 

"Instead of using the switch case statement to initialize the PHY handled by
this driver itself, let's introduce a new callback init_phy() and define it for
platforms that require it. This simplifies the code."

> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
> Notes:
>     Change from v7 to v8:
>     - rework commit message
>     - wrap comments to 100 chars
>     - return 0 at imx7d_pcie_init_phy()
>     
>     change from v1 to v4:
>     - none
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 134 +++++++++++++-------------
>  1 file changed, 69 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index fd83af238fa60..ac338a88fe21e 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -69,6 +69,9 @@ enum imx6_pcie_variants {
>  #define IMX6_PCIE_MAX_CLKS       6
>  
>  #define IMX6_PCIE_MAX_INSTANCES			2
> +
> +struct imx6_pcie;
> +
>  struct imx6_pcie_drvdata {
>  	enum imx6_pcie_variants variant;
>  	enum dw_pcie_device_mode mode;
> @@ -81,6 +84,7 @@ struct imx6_pcie_drvdata {
>  	const u32 ltssm_mask;
>  	const u32 mode_off[IMX6_PCIE_MAX_INSTANCES];
>  	const u32 mode_mask[IMX6_PCIE_MAX_INSTANCES];
> +	int (*init_phy)(struct imx6_pcie *pcie);
>  };
>  
>  struct imx6_pcie {
> @@ -322,76 +326,66 @@ static int pcie_phy_write(struct imx6_pcie *imx6_pcie, int addr, u16 data)
>  	return 0;
>  }
>  
> -static void imx6_pcie_init_phy(struct imx6_pcie *imx6_pcie)
> +static int imx8mq_pcie_init_phy(struct imx6_pcie *imx6_pcie)
>  {
> -	switch (imx6_pcie->drvdata->variant) {
> -	case IMX8MM:
> -	case IMX8MM_EP:
> -	case IMX8MP:
> -	case IMX8MP_EP:
> -		/*
> -		 * The PHY initialization had been done in the PHY
> -		 * driver, break here directly.
> -		 */
> -		break;
> -	case IMX8MQ:
> -	case IMX8MQ_EP:
> -		/*
> -		 * TODO: Currently this code assumes external
> -		 * oscillator is being used
> -		 */
> +	/* TODO: Currently this code assumes external oscillator is being used */
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr,
> +			   imx6_pcie_grp_offset(imx6_pcie),
> +			   IMX8MQ_GPR_PCIE_REF_USE_PAD,
> +			   IMX8MQ_GPR_PCIE_REF_USE_PAD);
> +	/*
> +	 * Regarding the datasheet, the PCIE_VPH is suggested to be 1.8V. If the PCIE_VPH is
> +	 * supplied by 3.3V, the VREG_BYPASS should be cleared to zero.
> +	 */
> +	if (imx6_pcie->vph && regulator_get_voltage(imx6_pcie->vph) > 3000000)
>  		regmap_update_bits(imx6_pcie->iomuxc_gpr,
>  				   imx6_pcie_grp_offset(imx6_pcie),
> -				   IMX8MQ_GPR_PCIE_REF_USE_PAD,
> -				   IMX8MQ_GPR_PCIE_REF_USE_PAD);
> -		/*
> -		 * Regarding the datasheet, the PCIE_VPH is suggested
> -		 * to be 1.8V. If the PCIE_VPH is supplied by 3.3V, the
> -		 * VREG_BYPASS should be cleared to zero.
> -		 */
> -		if (imx6_pcie->vph &&
> -		    regulator_get_voltage(imx6_pcie->vph) > 3000000)
> -			regmap_update_bits(imx6_pcie->iomuxc_gpr,
> -					   imx6_pcie_grp_offset(imx6_pcie),
> -					   IMX8MQ_GPR_PCIE_VREG_BYPASS,
> -					   0);
> -		break;
> -	case IMX7D:
> -		regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
> -				   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL, 0);
> -		break;
> -	case IMX6SX:
> -		regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
> -				   IMX6SX_GPR12_PCIE_RX_EQ_MASK,
> -				   IMX6SX_GPR12_PCIE_RX_EQ_2);
> -		fallthrough;
> -	default:
> -		regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
> +				   IMX8MQ_GPR_PCIE_VREG_BYPASS,
> +				   0);
> +
> +	return 0;
> +}
> +
> +static int imx7d_pcie_init_phy(struct imx6_pcie *imx6_pcie)
> +{
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12, IMX7D_GPR12_PCIE_PHY_REFCLK_SEL, 0);
> +
> +	return 0;
> +}
> +
> +static int imx6_pcie_init_phy(struct imx6_pcie *imx6_pcie)
> +{
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
>  				   IMX6Q_GPR12_PCIE_CTL_2, 0 << 10);
>  
> -		/* configure constant input signal to the pcie ctrl and phy */
> -		regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
> -				   IMX6Q_GPR12_LOS_LEVEL, 9 << 4);
> -
> -		regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR8,
> -				   IMX6Q_GPR8_TX_DEEMPH_GEN1,
> -				   imx6_pcie->tx_deemph_gen1 << 0);
> -		regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR8,
> -				   IMX6Q_GPR8_TX_DEEMPH_GEN2_3P5DB,
> -				   imx6_pcie->tx_deemph_gen2_3p5db << 6);
> -		regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR8,
> -				   IMX6Q_GPR8_TX_DEEMPH_GEN2_6DB,
> -				   imx6_pcie->tx_deemph_gen2_6db << 12);
> -		regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR8,
> -				   IMX6Q_GPR8_TX_SWING_FULL,
> -				   imx6_pcie->tx_swing_full << 18);
> -		regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR8,
> -				   IMX6Q_GPR8_TX_SWING_LOW,
> -				   imx6_pcie->tx_swing_low << 25);
> -		break;
> -	}
> +	/* configure constant input signal to the pcie ctrl and phy */
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
> +			   IMX6Q_GPR12_LOS_LEVEL, 9 << 4);
> +
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR8,
> +			   IMX6Q_GPR8_TX_DEEMPH_GEN1,
> +			   imx6_pcie->tx_deemph_gen1 << 0);
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR8,
> +			   IMX6Q_GPR8_TX_DEEMPH_GEN2_3P5DB,
> +			   imx6_pcie->tx_deemph_gen2_3p5db << 6);
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR8,
> +			   IMX6Q_GPR8_TX_DEEMPH_GEN2_6DB,
> +			   imx6_pcie->tx_deemph_gen2_6db << 12);
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR8,
> +			   IMX6Q_GPR8_TX_SWING_FULL,
> +			   imx6_pcie->tx_swing_full << 18);
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR8,
> +			   IMX6Q_GPR8_TX_SWING_LOW,
> +			   imx6_pcie->tx_swing_low << 25);
> +	return 0;
> +}
>  
> -	imx6_pcie_configure_type(imx6_pcie);
> +static int imx6sx_pcie_init_phy(struct imx6_pcie *imx6_pcie)
> +{
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
> +			   IMX6SX_GPR12_PCIE_RX_EQ_MASK, IMX6SX_GPR12_PCIE_RX_EQ_2);
> +
> +	return imx6_pcie_init_phy(imx6_pcie);
>  }
>  
>  static void imx7d_pcie_wait_for_phy_pll_lock(struct imx6_pcie *imx6_pcie)
> @@ -902,7 +896,11 @@ static int imx6_pcie_host_init(struct dw_pcie_rp *pp)
>  	}
>  
>  	imx6_pcie_assert_core_reset(imx6_pcie);
> -	imx6_pcie_init_phy(imx6_pcie);
> +
> +	if (imx6_pcie->drvdata->init_phy)
> +		imx6_pcie->drvdata->init_phy(imx6_pcie);
> +
> +	imx6_pcie_configure_type(imx6_pcie);
>  
>  	ret = imx6_pcie_clk_enable(imx6_pcie);
>  	if (ret) {
> @@ -1386,6 +1384,7 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.ltssm_mask = IMX6Q_GPR12_PCIE_CTL_2,
>  		.mode_off[0] = IOMUXC_GPR12,
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
> +		.init_phy = imx6_pcie_init_phy,
>  	},
>  	[IMX6SX] = {
>  		.variant = IMX6SX,
> @@ -1399,6 +1398,7 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.ltssm_mask = IMX6Q_GPR12_PCIE_CTL_2,
>  		.mode_off[0] = IOMUXC_GPR12,
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
> +		.init_phy = imx6sx_pcie_init_phy,
>  	},
>  	[IMX6QP] = {
>  		.variant = IMX6QP,
> @@ -1413,6 +1413,7 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.ltssm_mask = IMX6Q_GPR12_PCIE_CTL_2,
>  		.mode_off[0] = IOMUXC_GPR12,
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
> +		.init_phy = imx6_pcie_init_phy,
>  	},
>  	[IMX7D] = {
>  		.variant = IMX7D,
> @@ -1424,6 +1425,7 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_phy),
>  		.mode_off[0] = IOMUXC_GPR12,
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
> +		.init_phy = imx7d_pcie_init_phy,
>  	},
>  	[IMX8MQ] = {
>  		.variant = IMX8MQ,
> @@ -1436,6 +1438,7 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  		.mode_off[1] = IOMUXC_GPR12,
>  		.mode_mask[1] = IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE,
> +		.init_phy = imx8mq_pcie_init_phy,
>  	},
>  	[IMX8MM] = {
>  		.variant = IMX8MM,
> @@ -1471,6 +1474,7 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  		.mode_off[1] = IOMUXC_GPR12,
>  		.mode_mask[1] = IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE,
> +		.init_phy = imx8mq_pcie_init_phy,
>  	},
>  	[IMX8MM_EP] = {
>  		.variant = IMX8MM_EP,
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
