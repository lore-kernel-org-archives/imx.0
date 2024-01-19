Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFFC28E08
	for <imx@lists.linux.dev>; Fri, 19 Jan 2024 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705652855; cv=none; b=d8SjqXyUOq0/b8ELEvcjrRfaUeX9MgLkWNgROZxLrOCMomM/e+/qPMSyxcAfLIplvw9aTANV3IarBeObYkA+pUlFA5mGLkQFavo7jUE6FWmXYhZKBR+sx6iftVSVtEtI8R88/Fqj5G51M0UXn5KCAOYVMiqSAzYEC2JC0kdPqXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705652855; c=relaxed/simple;
	bh=fhJ4bDbWi3zDE3rFX30T25ydBeO6PsuMRdUVAAKN8Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Akbv5bRx7QraprlMAPo3HpEyxFIwrsFzNiLo/jqTNCTWbXC7ek2awo5CJ9FGAOfJFW1EOuxUwqeiQYdfdXsBVTi29Xar1+9vkSuha2i5MQxXTJifNGqC37Jg9sVsJaOLJtsiszZFwm74HR9lx/3ha4TNS+DU89ikUHW7gclO/Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EZi382/W; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EZi382/W"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d7232dcb3eso804475ad.2
        for <imx@lists.linux.dev>; Fri, 19 Jan 2024 00:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705652852; x=1706257652; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LR+SAY5vhVQKjS7aGLC0MWFLnWjLp9TblT0nHaLa0mM=;
        b=EZi382/WXsiq6kDGI50aM9tjrFbx17m3IHlBPau7DCFkbFw7LSh8FKxnLc9jgqVRqZ
         yirytek7Dma6aCqnvEk1V4GEd1O5Dkl7EH9nYzd3MYf91LcJ4t4hjaIiqtpg789pEoBV
         k83+Ld7mEm13jCpzT8w3fG0A0K4vHWVZ1pOCQnB8MQNAwvNEBWu85+gfdNLTA6G63xjN
         bzotaJIWM4+Ies2kq6aj0vwyNJdPbGbzMM98RPNmgD5hgPQu+gIjY5PqximiLCiFVFq4
         YjVAhWuZlCZTO+Z3dJwtocxdcgvHPPNCgxF4mepf4Cpy8cZYBXOQDjz2O53fyi7eAiGQ
         wWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705652852; x=1706257652;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LR+SAY5vhVQKjS7aGLC0MWFLnWjLp9TblT0nHaLa0mM=;
        b=g1zGXRh7bcn7dgorAAFXfzjUhxG7iJGdl7GVUMp4mmaDj3p8nariqNuyL2tHU0SLcm
         lCJpTEswJSNl+VgCUVWwsoPWxii01lEDp0VGXAthXRP8EBbkFLku4XyLReD4PRQDNXBz
         UYrXPMrzOZfE20kudDNux507mIL7Ze0xs4jSRjC6O+lej77/AecRFIaI/5gK0C9NMjkB
         v9jAMI5Uorccx9cu0WbU937elQ1KCRuP4RhtiVVMJOZXB2UDkRj0sp6ncmt900SxSwhi
         qSlOOZXw9woY43Z8kC31pgk+WmuBlkFNXs+aki3cqwY1bUnCKzP/xhi3/zrNN6Fk/y0H
         MurA==
X-Gm-Message-State: AOJu0YyXZx19FkbJ5GVeMfCEcdY6zrO0NxfFOpucjMTz6VPev9Uqamqd
	pKaV1tAwOtI447tHWHW46BcA2hfXIY85NKEG59Q7CnlLNDYfq3oZbbRBraAA0w==
X-Google-Smtp-Source: AGHT+IGAYtsT3XiUBVbv5vAjJPw+V4vnusYgLd3mRbJj4CjHgWv7Cb0pdrUS5rWD+Kx8NOpzFRwHtA==
X-Received: by 2002:a17:902:c195:b0:1d7:14e2:23dc with SMTP id d21-20020a170902c19500b001d714e223dcmr1453303pld.129.1705652852609;
        Fri, 19 Jan 2024 00:27:32 -0800 (PST)
Received: from thinkpad ([117.248.2.56])
        by smtp.gmail.com with ESMTPSA id kv4-20020a17090328c400b001d5b93560c3sm2546861plb.167.2024.01.19.00.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 00:27:32 -0800 (PST)
Date: Fri, 19 Jan 2024 13:57:25 +0530
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
Subject: Re: [PATCH v8 12/16] PCI: imx6: Add iMX95 PCIe Root Complex support
Message-ID: <20240119082725.GH2866@thinkpad>
References: <20240108232145.2116455-1-Frank.Li@nxp.com>
 <20240108232145.2116455-13-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240108232145.2116455-13-Frank.Li@nxp.com>

On Mon, Jan 08, 2024 at 06:21:41PM -0500, Frank Li wrote:
> Add iMX95 PCIe Root Complex support.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
> Notes:
>     Change from v7 to v8
>     - Update commit subject
>     - add const from regmap
>     - remove unnessary logic in imx6_pcie_deassert_core_reset()
>     
>     Change from v4 to v7
>     - none
>     Change from v1 to v3
>     - none
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 82 +++++++++++++++++++++++++--
>  1 file changed, 77 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index ac338a88fe21e..c0d08cd55d681 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -42,6 +42,25 @@
>  #define IMX8MQ_GPR_PCIE_VREG_BYPASS		BIT(12)
>  #define IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE	GENMASK(11, 8)
>  
> +#define IMX95_PCIE_PHY_GEN_CTRL			0x0
> +#define IMX95_PCIE_REF_USE_PAD			BIT(17)
> +
> +#define IMX95_PCIE_PHY_MPLLA_CTRL		0x10
> +#define IMX95_PCIE_PHY_MPLL_STATE		BIT(30)
> +
> +#define IMX95_PCIE_SS_RW_REG_0			0xf0
> +#define IMX95_PCIE_REF_CLKEN			BIT(23)
> +#define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
> +
> +#define IMX95_PE0_GEN_CTRL_1			0x1050
> +#define IMX95_PCIE_DEVICE_TYPE			GENMASK(3, 0)
> +
> +#define IMX95_PE0_GEN_CTRL_3			0x1058
> +#define IMX95_PCIE_LTSSM_EN			BIT(0)
> +
> +#define IMX95_PE0_PM_STS			0x1064
> +#define IMX95_PCIE_PM_LINKST_IN_L2		BIT(14)
> +
>  #define to_imx6_pcie(x)	dev_get_drvdata((x)->dev)
>  
>  enum imx6_pcie_variants {
> @@ -52,6 +71,7 @@ enum imx6_pcie_variants {
>  	IMX8MQ,
>  	IMX8MM,
>  	IMX8MP,
> +	IMX95,
>  	IMX8MQ_EP,
>  	IMX8MM_EP,
>  	IMX8MP_EP,
> @@ -63,6 +83,7 @@ enum imx6_pcie_variants {
>  #define IMX6_PCIE_FLAG_HAS_PHYDRV			BIT(3)
>  #define IMX6_PCIE_FLAG_HAS_APP_RESET		BIT(4)
>  #define IMX6_PCIE_FLAG_HAS_PHY_RESET		BIT(5)
> +#define IMX6_PCIE_FLAG_HAS_SERDES		BIT(6)
>  
>  #define imx6_check_flag(pci, val)     (pci->drvdata->flags & val)
>  
> @@ -179,6 +200,24 @@ static unsigned int imx6_pcie_grp_offset(const struct imx6_pcie *imx6_pcie)
>  	return imx6_pcie->controller_id == 1 ? IOMUXC_GPR16 : IOMUXC_GPR14;
>  }
>  
> +static int imx95_pcie_init_phy(struct imx6_pcie *imx6_pcie)
> +{
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr,
> +			IMX95_PCIE_SS_RW_REG_0,
> +			IMX95_PCIE_PHY_CR_PARA_SEL,
> +			IMX95_PCIE_PHY_CR_PARA_SEL);
> +
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr,
> +			   IMX95_PCIE_PHY_GEN_CTRL,
> +			   IMX95_PCIE_REF_USE_PAD, 0);
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr,
> +			   IMX95_PCIE_SS_RW_REG_0,
> +			   IMX95_PCIE_REF_CLKEN,
> +			   IMX95_PCIE_REF_CLKEN);
> +
> +	return 0;
> +}
> +
>  static void imx6_pcie_configure_type(struct imx6_pcie *imx6_pcie)
>  {
>  	const struct imx6_pcie_drvdata *drvdata = imx6_pcie->drvdata;
> @@ -575,6 +614,7 @@ static int imx6_pcie_enable_ref_clk(struct imx6_pcie *imx6_pcie)
>  				   IMX6Q_GPR1_PCIE_REF_CLK_EN, 1 << 16);
>  		break;
>  	case IMX7D:
> +	case IMX95:
>  		break;
>  	case IMX8MM:
>  	case IMX8MM_EP:
> @@ -1280,12 +1320,32 @@ static int imx6_pcie_probe(struct platform_device *pdev)
>  		return PTR_ERR(imx6_pcie->turnoff_reset);
>  	}
>  
> +	if (imx6_pcie->drvdata->gpr) {
>  	/* Grab GPR config register range */
> -	imx6_pcie->iomuxc_gpr =
> -		 syscon_regmap_lookup_by_compatible(imx6_pcie->drvdata->gpr);
> -	if (IS_ERR(imx6_pcie->iomuxc_gpr)) {
> -		dev_err(dev, "unable to find iomuxc registers\n");
> -		return PTR_ERR(imx6_pcie->iomuxc_gpr);
> +		imx6_pcie->iomuxc_gpr =
> +			 syscon_regmap_lookup_by_compatible(imx6_pcie->drvdata->gpr);
> +		if (IS_ERR(imx6_pcie->iomuxc_gpr))
> +			return dev_err_probe(dev, PTR_ERR(imx6_pcie->iomuxc_gpr),
> +					     "unable to find iomuxc registers\n");
> +	}
> +
> +	if (imx6_check_flag(imx6_pcie, IMX6_PCIE_FLAG_HAS_SERDES)) {
> +		void __iomem *off = devm_platform_ioremap_resource_byname(pdev, "app");
> +
> +		if (IS_ERR(off))
> +			return dev_err_probe(dev, PTR_ERR(off),
> +					     "unable to find serdes registers\n");
> +
> +		static const struct regmap_config regmap_config = {
> +			.reg_bits = 32,
> +			.val_bits = 32,
> +			.reg_stride = 4,
> +		};
> +
> +		imx6_pcie->iomuxc_gpr = devm_regmap_init_mmio(dev, off, &regmap_config);
> +		if (IS_ERR(imx6_pcie->iomuxc_gpr))
> +			return dev_err_probe(dev, PTR_ERR(imx6_pcie->iomuxc_gpr),
> +					     "unable to find iomuxc registers\n");
>  	}
>  
>  	/* Grab PCIe PHY Tx Settings */
> @@ -1462,6 +1522,17 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.mode_off[0] = IOMUXC_GPR12,
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
> +	[IMX95] = {
> +		.variant = IMX95,
> +		.flags = IMX6_PCIE_FLAG_HAS_SERDES,
> +		.clk_names = imx6_4clks_bus_pcie_phy_aux,
> +		.clks_cnt = ARRAY_SIZE(imx6_4clks_bus_pcie_phy_aux),
> +		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
> +		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
> +		.mode_off[0]  = IMX95_PE0_GEN_CTRL_1,
> +		.mode_mask[0] = IMX95_PCIE_DEVICE_TYPE,
> +		.init_phy = imx95_pcie_init_phy,
> +	},
>  	[IMX8MQ_EP] = {
>  		.variant = IMX8MQ_EP,
>  		.flags = IMX6_PCIE_FLAG_HAS_APP_RESET |
> @@ -1506,6 +1577,7 @@ static const struct of_device_id imx6_pcie_of_match[] = {
>  	{ .compatible = "fsl,imx8mq-pcie", .data = &drvdata[IMX8MQ], },
>  	{ .compatible = "fsl,imx8mm-pcie", .data = &drvdata[IMX8MM], },
>  	{ .compatible = "fsl,imx8mp-pcie", .data = &drvdata[IMX8MP], },
> +	{ .compatible = "fsl,imx95-pcie", .data = &drvdata[IMX95], },
>  	{ .compatible = "fsl,imx8mq-pcie-ep", .data = &drvdata[IMX8MQ_EP], },
>  	{ .compatible = "fsl,imx8mm-pcie-ep", .data = &drvdata[IMX8MM_EP], },
>  	{ .compatible = "fsl,imx8mp-pcie-ep", .data = &drvdata[IMX8MP_EP], },
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
