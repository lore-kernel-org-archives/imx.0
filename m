Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED5125B8
	for <imx@lists.linux.dev>; Sun,  7 Jan 2024 06:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHyaU4SC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d40eec5e12so6452325ad.1
        for <imx@lists.linux.dev>; Sat, 06 Jan 2024 22:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704608823; x=1705213623; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iW5VT/4eLpp7PKquWlruWMTFNJDHZ9lSGytu3Jmlq4E=;
        b=UHyaU4SCnnW+OHEZSJ+r9PXbqvjPF5MA2IE2V09UXuwNwo54reVI8mQxEVdAX+gDfI
         O2vz2V6Lmwo+JQWaGMBy4m9ZKpYjXP9mZA/pcsIdygn9dinN8TcEzumq8zdjaum0tZDC
         +EPU+h84byBAXigrI7cQ7D0FLcwtQJd3oVHeuRV9zoERq8YntW+cNX6prHX6AYzGnj7w
         GVwQFVYVeaHtj6URDyjO+uaJXFzQKaIVv6fYjjqkVM/rQt2xAsYvDxHwHUXTbI6Ru/q0
         2BaiX4pE0A/RI1s66PF8vw2cXvQqAqTSJEMLv86G0BP4TC3dwNA3h3pTH7K2oMJznRbN
         5LfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704608823; x=1705213623;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iW5VT/4eLpp7PKquWlruWMTFNJDHZ9lSGytu3Jmlq4E=;
        b=eda/dUCfBTZDpSbqt0CwibDRJJTyu01SdhQwnuH66DNCmCwQmL4g1FqfSY6pAW5vEx
         etVAkkeNXzFTVInUXYGBBqJhinczg64A+CUXCMX7yntZSmRdrEE2qU5RYhlNOrJUc+Wo
         MR+vsXzSwO5+s0/8K3urM+NKgc/CVfYfFQOZFqHM7xRzSxzIdalXT+f1hiVdURYDUQj1
         QXE713x2hhTNP9j/sc0PMf0LdQkJRAqscvoLlStmR4hj6auoyqc5rPGQNXBZqas+Prmj
         Aibs8bWAD3dxjA1UvMYQe2zz9EHNxR4yc5gJ2p9hu9b6GtfEMxl49dtj68W28PbEg+jS
         cqZQ==
X-Gm-Message-State: AOJu0YwJU46luZd6Q2arkn8f1Jv5hLJe+o7uZoWfLdCKxkjm+6Ez30SS
	/dkuy/Ks0x3JNSIQ2YE1pyoI+BCpznMs
X-Google-Smtp-Source: AGHT+IF9EIsAdvfe7SNGb3Xs8d3OsvAgoF/ITk2xEdFgJKxUc+1zTbZHj5eHo35V0G3bc6Ra+uzqcw==
X-Received: by 2002:a17:902:b70f:b0:1d4:e2bc:88f2 with SMTP id d15-20020a170902b70f00b001d4e2bc88f2mr2077033pls.88.1704608823306;
        Sat, 06 Jan 2024 22:27:03 -0800 (PST)
Received: from thinkpad ([103.197.115.97])
        by smtp.gmail.com with ESMTPSA id b9-20020a170902b60900b001d4c984e02bsm3906425pls.11.2024.01.06.22.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 22:27:02 -0800 (PST)
Date: Sun, 7 Jan 2024 11:56:54 +0530
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
Subject: Re: [PATCH v7 16/16] PCI: imx6: Add iMX95 Endpoint (EP) function
 support
Message-ID: <20240107062654.GO3416@thinkpad>
References: <20231227182727.1747435-1-Frank.Li@nxp.com>
 <20231227182727.1747435-17-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227182727.1747435-17-Frank.Li@nxp.com>

On Wed, Dec 27, 2023 at 01:27:27PM -0500, Frank Li wrote:

Subject: PCI: imx6: Add iMX95 Endpoint (EP) support

> Add iMX95 EP function support and add 64bit address support. Internal bus

Remove 'function' as that refers to endpoint function.

> bridge for PCI support 64bit dma address in iMX95. So set call
> dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)).
> 

'Hence, call dma_set_mask_and_coherent() to set 64 bit DMA mask.'

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v3 to v4
>     - change align to 4k for imx95
>     Change from v1 to v3
>     - new patches at v3
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 45 +++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 6a58fd63a9dd2..00ec59867c17b 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -75,6 +75,7 @@ enum imx6_pcie_variants {
>  	IMX8MQ_EP,
>  	IMX8MM_EP,
>  	IMX8MP_EP,
> +	IMX95_EP,
>  };
>  
>  #define IMX6_PCIE_FLAG_IMX6_PHY			BIT(0)
> @@ -84,6 +85,7 @@ enum imx6_pcie_variants {
>  #define IMX6_PCIE_FLAG_HAS_APP_RESET		BIT(4)
>  #define IMX6_PCIE_FLAG_HAS_PHY_RESET		BIT(5)
>  #define IMX6_PCIE_FLAG_HAS_SERDES		BIT(6)
> +#define IMX6_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
>  
>  #define imx6_check_flag(pci, val)     (pci->drvdata->flags & val)
>  
> @@ -620,6 +622,7 @@ static int imx6_pcie_enable_ref_clk(struct imx6_pcie *imx6_pcie)
>  		break;
>  	case IMX7D:
>  	case IMX95:
> +	case IMX95_EP:
>  		break;
>  	case IMX8MM:
>  	case IMX8MM_EP:
> @@ -1063,6 +1066,23 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
>  	.align = SZ_64K,
>  };
>  
> +/*
> + * BAR#	| Default BAR enable	| Default BAR Type	| Default BAR Size	| BAR Sizing Scheme
> + * ================================================================================================
> + * BAR0	| Enable		| 64-bit		| 1 MB			| Programmable Size
> + * BAR1	| Disable		| 32-bit		| 64 KB			| Fixed Size
> + *	| (BAR0 is 64-bit)	| if BAR0 is 32-bit	|			| As Bar0 is 64bit

I couldn't understand above. And not aligned properly.

> + * BAR2	| Enable		| 32-bit		| 1 MB			| Programmable Size
> + * BAR3	| Enable		| 32-bit		| 64 KB			| Programmable Size
> + * BAR4	| Enable		| 32-bit		| 1M			| Programmable Size
> + * BAR5	| Enable		| 32-bit		| 64 KB			| Programmable Size
> + */
> +static const struct pci_epc_features imx95_pcie_epc_features = {
> +	.msi_capable = true,
> +	.bar_fixed_size[1] = SZ_64K,
> +	.align = SZ_4K,
> +};
> +
>  static const struct pci_epc_features*
>  imx6_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  {
> @@ -1105,6 +1125,14 @@ static int imx6_add_pcie_ep(struct imx6_pcie *imx6_pcie,
>  
>  	pci->dbi_base2 = pci->dbi_base + pcie_dbi2_offset;
>  
> +	/*

Use FIXME here.

- Mani

> +	 * db2 information should fetch from dtb file. dw_pcie_ep_init() can get dbi_base2 from
> +	 * "dbi2" if pci->dbi_base2 is NULL. All code related pcie_dbi2_offset should be removed
> +	 * after all dts added "dbi2" reg.
> +	 */
> +	if (imx6_pcie->drvdata->variant == IMX95_EP)
> +		pci->dbi_base2 = NULL;
> +
>  	ret = dw_pcie_ep_init(ep);
>  	if (ret) {
>  		dev_err(dev, "failed to initialize endpoint\n");
> @@ -1355,6 +1383,9 @@ static int imx6_pcie_probe(struct platform_device *pdev)
>  					     "unable to find iomuxc registers\n");
>  	}
>  
> +	if (imx6_check_flag(imx6_pcie, IMX6_PCIE_FLAG_SUPPORT_64BIT))
> +		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +
>  	/* Grab PCIe PHY Tx Settings */
>  	if (of_property_read_u32(node, "fsl,tx-deemph-gen1",
>  				 &imx6_pcie->tx_deemph_gen1))
> @@ -1557,6 +1588,19 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  		.epc_features = &imx8m_pcie_epc_features,
>  	},
> +	[IMX95_EP] = {
> +		.variant = IMX95_EP,
> +		.flags = IMX6_PCIE_FLAG_HAS_SERDES |
> +			 IMX6_PCIE_FLAG_SUPPORT_64BIT,
> +		.clk_names = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux"},
> +		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
> +		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
> +		.mode_off[0]  = IMX95_PE0_GEN_CTRL_1,
> +		.mode_mask[0] = IMX95_PCIE_DEVICE_TYPE,
> +		.init_phy = imx95_pcie_init_phy,
> +		.epc_features = &imx95_pcie_epc_features,
> +		.mode = DW_PCIE_EP_TYPE,
> +	},
>  };
>  
>  static const struct of_device_id imx6_pcie_of_match[] = {
> @@ -1571,6 +1615,7 @@ static const struct of_device_id imx6_pcie_of_match[] = {
>  	{ .compatible = "fsl,imx8mq-pcie-ep", .data = &drvdata[IMX8MQ_EP], },
>  	{ .compatible = "fsl,imx8mm-pcie-ep", .data = &drvdata[IMX8MM_EP], },
>  	{ .compatible = "fsl,imx8mp-pcie-ep", .data = &drvdata[IMX8MP_EP], },
> +	{ .compatible = "fsl,imx95-pcie-ep", .data = &drvdata[IMX95_EP], },
>  	{},
>  };
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
