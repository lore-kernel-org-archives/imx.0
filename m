Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769507A233
	for <imx@lists.linux.dev>; Tue, 12 Dec 2023 16:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypb+Rmd2"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5c629a9fe79so3179480a12.3
        for <imx@lists.linux.dev>; Tue, 12 Dec 2023 08:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702399764; x=1703004564; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O3Qb4Pmctf3QLFWZxDCGFwLHLw9E0QvAVnQNcESZf+I=;
        b=ypb+Rmd2v0PCVp2ryMB/4l0pau4tURHjtpYI68lqEnJFKl9TfxB8cbfbINDf2TrN8D
         QkCzd/nbcF548utxDOZzVBoeRmJqdmH8KkUfLixuujW+7K8F5yU9JEmQf79a6vzPR0L2
         GqtoVTcRFkdCCi9o79xZH2gXxsiCbgkN79zNRDyzMtP+2tNBLznKVrEH138zRaLhdAdf
         366X08EE28l+Y7wh7dvlYCVQsEZ5k9B9uCGx5aUmmPJCBEinlBhMeK+zl027GA4gEUGN
         +0LBgd/T59oa9A2YxuhDnSUi89ONuCo03KiByg74Jy5f7R/p8JB0XNq5BdIsKZRkdwDm
         mAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702399764; x=1703004564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3Qb4Pmctf3QLFWZxDCGFwLHLw9E0QvAVnQNcESZf+I=;
        b=KFYvS3gOaf7RCTi79sapdNdnk9VxxPlXg3z6A1RB483OQvD6+3gDIacy73xmNG+6pe
         7YEgAglZBjfuZo2CQhx6d/HwZlmBSfg2E5xLRIxWTMGCK7IMqznbPGMoKEmVxnmz6Miu
         1B5T29g2JLdAoEZg0CpbRURLE6hKXbi7zat1nrn36EwuW6mGqmpfC8r6SWVZvlVm5ekv
         1auy0jaxxaySd3/y0DulhmuasVhsr9pl/DK2yXgiUsFmwq4JGd45/q5u6n3Vwz9miEpI
         XDTwga+M/5KNl3mSE0SJqayu5PrT16T3Vkm/nZsWipUFjuSLfmsYbspR/c3J/8qAy+qe
         TQzQ==
X-Gm-Message-State: AOJu0YzpyKVGC1eF7PEc/Bwv3pRAyTbyfVj0tBzBnlCy6LTwTX6aKChw
	SVTQGxw3Q/YuseUW1/fKp0x7
X-Google-Smtp-Source: AGHT+IEdRCICFtznyHHkBUNYDtZL2BWvbWNge5n8xa4XWLlDEc4bBXuXkjMOrYe3szp98CDGiy/H6w==
X-Received: by 2002:a05:6a21:3281:b0:18b:985e:8035 with SMTP id yt1-20020a056a21328100b0018b985e8035mr3756929pzb.12.1702399763615;
        Tue, 12 Dec 2023 08:49:23 -0800 (PST)
Received: from thinkpad ([117.202.189.222])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm8368570pga.33.2023.12.12.08.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 08:49:22 -0800 (PST)
Date: Tue, 12 Dec 2023 22:19:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: bhelgaas@google.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, helgaas@kernel.org, hongxing.zhu@nxp.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	krzysztof.kozlowski+dt@linaro.org, kw@linux.com,
	l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, lpieralisi@kernel.org, robh@kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH v3 01/13] PCI: imx6: Simplify clock handling by using
 HAS_CLK_* bitmask
Message-ID: <20231212164913.GA21240@thinkpad>
References: <20231211215842.134823-1-Frank.Li@nxp.com>
 <20231211215842.134823-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231211215842.134823-2-Frank.Li@nxp.com>

On Mon, Dec 11, 2023 at 04:58:30PM -0500, Frank Li wrote:
> Refactors the clock handling logic in the imx6 PCI driver by adding
> HAS_CLK_* bitmask define for drvdata::flags . Simplifies the code and makes
> it more maintainable, as future additions of SOC support will only require
> straightforward changes. The drvdata::flags and a bitmask ensures a cleaner
> and more scalable switch-case structure for handling clocks.
> 

Is there any necessity to validate each clock in the driver? I mean, can't you
just rely on devicetree to provide enough clocks for the functioning of the PCIe
controller?

If you can rely on devicetree (everyone should in an ideal world), then you can
just use devm_clk_bulk_get_all() to get all available clocks for the SoC and
just enable/disable whatever is available.

This will greatly simplify the code.

Only downside of this approach is, if the devicetree is not supplying enough
clocks, then it will be difficult to find why PCIe is not working. But this also
means that the devicetree is screwed.

- Mani

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v1 to v3
>     - none
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 84 +++++++++++++--------------
>  1 file changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 74703362aeec7..8a9b527934f80 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -60,6 +60,10 @@ enum imx6_pcie_variants {
>  #define IMX6_PCIE_FLAG_IMX6_PHY			BIT(0)
>  #define IMX6_PCIE_FLAG_IMX6_SPEED_CHANGE	BIT(1)
>  #define IMX6_PCIE_FLAG_SUPPORTS_SUSPEND		BIT(2)
> +#define IMX6_PCIE_FLAG_HAS_CLK_INBOUND_AXI	BIT(3)
> +#define IMX6_PCIE_FLAG_HAS_CLK_AUX		BIT(4)
> +
> +#define imx6_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
>  struct imx6_pcie_drvdata {
>  	enum imx6_pcie_variants variant;
> @@ -550,19 +554,23 @@ static int imx6_pcie_attach_pd(struct device *dev)
>  
>  static int imx6_pcie_enable_ref_clk(struct imx6_pcie *imx6_pcie)
>  {
> -	struct dw_pcie *pci = imx6_pcie->pci;
> -	struct device *dev = pci->dev;
>  	unsigned int offset;
>  	int ret = 0;
>  
> -	switch (imx6_pcie->drvdata->variant) {
> -	case IMX6SX:
> +	if (imx6_check_flag(imx6_pcie, IMX6_PCIE_FLAG_HAS_CLK_INBOUND_AXI)) {
>  		ret = clk_prepare_enable(imx6_pcie->pcie_inbound_axi);
> -		if (ret) {
> -			dev_err(dev, "unable to enable pcie_axi clock\n");
> -			break;
> -		}
> +		if (ret)
> +			return ret;
> +	}
>  
> +	if (imx6_check_flag(imx6_pcie, IMX6_PCIE_FLAG_HAS_CLK_AUX)) {
> +		ret = clk_prepare_enable(imx6_pcie->pcie_aux);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	switch (imx6_pcie->drvdata->variant) {
> +	case IMX6SX:
>  		regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
>  				   IMX6SX_GPR12_PCIE_TEST_POWERDOWN, 0);
>  		break;
> @@ -589,12 +597,6 @@ static int imx6_pcie_enable_ref_clk(struct imx6_pcie *imx6_pcie)
>  	case IMX8MQ_EP:
>  	case IMX8MP:
>  	case IMX8MP_EP:
> -		ret = clk_prepare_enable(imx6_pcie->pcie_aux);
> -		if (ret) {
> -			dev_err(dev, "unable to enable pcie_aux clock\n");
> -			break;
> -		}
> -
>  		offset = imx6_pcie_grp_offset(imx6_pcie);
>  		/*
>  		 * Set the over ride low and enabled
> @@ -614,10 +616,13 @@ static int imx6_pcie_enable_ref_clk(struct imx6_pcie *imx6_pcie)
>  
>  static void imx6_pcie_disable_ref_clk(struct imx6_pcie *imx6_pcie)
>  {
> -	switch (imx6_pcie->drvdata->variant) {
> -	case IMX6SX:
> +	if (imx6_check_flag(imx6_pcie, IMX6_PCIE_FLAG_HAS_CLK_INBOUND_AXI))
>  		clk_disable_unprepare(imx6_pcie->pcie_inbound_axi);
> -		break;
> +
> +	if (imx6_check_flag(imx6_pcie, IMX6_PCIE_FLAG_HAS_CLK_AUX))
> +		clk_disable_unprepare(imx6_pcie->pcie_aux);
> +
> +	switch (imx6_pcie->drvdata->variant) {
>  	case IMX6QP:
>  	case IMX6Q:
>  		regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR1,
> @@ -631,14 +636,6 @@ static void imx6_pcie_disable_ref_clk(struct imx6_pcie *imx6_pcie)
>  				   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL,
>  				   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL);
>  		break;
> -	case IMX8MM:
> -	case IMX8MM_EP:
> -	case IMX8MQ:
> -	case IMX8MQ_EP:
> -	case IMX8MP:
> -	case IMX8MP_EP:
> -		clk_disable_unprepare(imx6_pcie->pcie_aux);
> -		break;
>  	default:
>  		break;
>  	}
> @@ -1316,21 +1313,21 @@ static int imx6_pcie_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(imx6_pcie->pcie),
>  				     "pcie clock source missing or invalid\n");
>  
> -	switch (imx6_pcie->drvdata->variant) {
> -	case IMX6SX:
> -		imx6_pcie->pcie_inbound_axi = devm_clk_get(dev,
> -							   "pcie_inbound_axi");
> +	if (imx6_check_flag(imx6_pcie, IMX6_PCIE_FLAG_HAS_CLK_INBOUND_AXI)) {
> +		imx6_pcie->pcie_inbound_axi = devm_clk_get(dev, "pcie_inbound_axi");
>  		if (IS_ERR(imx6_pcie->pcie_inbound_axi))
> -			return dev_err_probe(dev, PTR_ERR(imx6_pcie->pcie_inbound_axi),
> -					     "pcie_inbound_axi clock missing or invalid\n");
> -		break;
> -	case IMX8MQ:
> -	case IMX8MQ_EP:
> +			dev_err_probe(dev, PTR_ERR(imx6_pcie->pcie_inbound_axi),
> +				      "pcie_inbound_axi clock missing or invalid\n");
> +	}
> +
> +	if (imx6_check_flag(imx6_pcie, IMX6_PCIE_FLAG_HAS_CLK_AUX)) {
>  		imx6_pcie->pcie_aux = devm_clk_get(dev, "pcie_aux");
>  		if (IS_ERR(imx6_pcie->pcie_aux))
>  			return dev_err_probe(dev, PTR_ERR(imx6_pcie->pcie_aux),
>  					     "pcie_aux clock source missing or invalid\n");
> -		fallthrough;
> +	}
> +
> +	switch (imx6_pcie->drvdata->variant) {
>  	case IMX7D:
>  		if (dbi_base->start == IMX8MQ_PCIE2_BASE_ADDR)
>  			imx6_pcie->controller_id = 1;
> @@ -1353,10 +1350,6 @@ static int imx6_pcie_probe(struct platform_device *pdev)
>  	case IMX8MM_EP:
>  	case IMX8MP:
>  	case IMX8MP_EP:
> -		imx6_pcie->pcie_aux = devm_clk_get(dev, "pcie_aux");
> -		if (IS_ERR(imx6_pcie->pcie_aux))
> -			return dev_err_probe(dev, PTR_ERR(imx6_pcie->pcie_aux),
> -					     "pcie_aux clock source missing or invalid\n");
>  		imx6_pcie->apps_reset = devm_reset_control_get_exclusive(dev,
>  									 "apps");
>  		if (IS_ERR(imx6_pcie->apps_reset))
> @@ -1482,7 +1475,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.variant = IMX6SX,
>  		.flags = IMX6_PCIE_FLAG_IMX6_PHY |
>  			 IMX6_PCIE_FLAG_IMX6_SPEED_CHANGE |
> -			 IMX6_PCIE_FLAG_SUPPORTS_SUSPEND,
> +			 IMX6_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX6_PCIE_FLAG_HAS_CLK_INBOUND_AXI,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
>  	},
>  	[IMX6QP] = {
> @@ -1500,30 +1494,36 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  	},
>  	[IMX8MQ] = {
>  		.variant = IMX8MQ,
> +		.flags = IMX6_PCIE_FLAG_HAS_CLK_AUX,
>  		.gpr = "fsl,imx8mq-iomuxc-gpr",
>  	},
>  	[IMX8MM] = {
>  		.variant = IMX8MM,
> -		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND,
> +		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX6_PCIE_FLAG_HAS_CLK_AUX,
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
>  	},
>  	[IMX8MP] = {
>  		.variant = IMX8MP,
> -		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND,
> +		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX6_PCIE_FLAG_HAS_CLK_AUX,
>  		.gpr = "fsl,imx8mp-iomuxc-gpr",
>  	},
>  	[IMX8MQ_EP] = {
>  		.variant = IMX8MQ_EP,
> +		.flags = IMX6_PCIE_FLAG_HAS_CLK_AUX,
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mq-iomuxc-gpr",
>  	},
>  	[IMX8MM_EP] = {
>  		.variant = IMX8MM_EP,
> +		.flags = IMX6_PCIE_FLAG_HAS_CLK_AUX,
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
>  	},
>  	[IMX8MP_EP] = {
>  		.variant = IMX8MP_EP,
> +		.flags = IMX6_PCIE_FLAG_HAS_CLK_AUX,
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mp-iomuxc-gpr",
>  	},
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
