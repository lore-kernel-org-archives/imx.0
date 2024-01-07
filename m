Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BEF11CB1
	for <imx@lists.linux.dev>; Sun,  7 Jan 2024 05:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/BVlirx"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-28b82dc11e6so249035a91.1
        for <imx@lists.linux.dev>; Sat, 06 Jan 2024 21:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704604625; x=1705209425; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NWyB8TfZzCqz702pXUBpDot48wicywENtsPUdumX/6U=;
        b=K/BVlirxPHXy9qIiFPegp2HnBuo8sWyyZDhRlAN2WuJdSWw58/QziYptgI2UKZ3+Tq
         khE/gPSS3eu3qbuWhE229pTodUrf1AVI/DN1QSWNV+01dS2Wr5AjIjWdeicYYGIJsM3J
         bE9N3PlHYtWwTgr+ErqU/zT86l8cnLpcFD05vp6tDzMdzvzKjITcBz3UbcY7v5WtgLcE
         QfA7240tJJc3g6YWQ1TkkcghIs88MHkKUzrgsyQk0+LACuFne3NeajurGyzUxMjMlIPh
         JVgWm2oSTHw/axzdzz9hO7/mQ2SsNuskhl9J59+huWk9FHJunh3lUc/HWM1+PKYfUy3a
         +YbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704604625; x=1705209425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NWyB8TfZzCqz702pXUBpDot48wicywENtsPUdumX/6U=;
        b=XoI+IprK69uWkjZ5zLRoxCzWdR6Ud2NmymKjM90nzt1GOD6TY7YAviCUv9Y6f1MyIT
         DSCjfRC2CWyUrV5Er0t52E1m0/2JDyydfnk+ibMUH+5lmMFnBgGaP0SsUZ9rMd8wnYOw
         YY/FtOVfeBeBnDqtmGRjGG/GDDOGfe2H8gPMJ/40Cabr18OSUjUlLNhxX6RFo+W2DuMJ
         30KRC/aMdAbNj5iANoYiuD2XF+7eKBUABEkbhID+v7QmthvK97w3dattj8VV1KJSJR6B
         XC/EPAmDihGIkxllLk51PBjaXMBtIBjVh1rsdhNDrAGSBG0YPmtrcNWMn54ZmTdY0RbZ
         iISg==
X-Gm-Message-State: AOJu0Yw1HgLeq33McCr0TQM8Jhk+DZDNEcNehZPhyxCloTZa3fu3m+xH
	239L+Ur7zOG00OfN0QnegJaKHkam8NfU
X-Google-Smtp-Source: AGHT+IFBdvFE2Q0qIHSiOlcgmOnRSvw0TrAzPtxFZEro5J/kLPEpFkDeJ6Tv7L+vQOYwllLbaQkyGQ==
X-Received: by 2002:a05:6a20:3252:b0:18f:97c:8267 with SMTP id hm18-20020a056a20325200b0018f097c8267mr467006pzc.113.1704604625435;
        Sat, 06 Jan 2024 21:17:05 -0800 (PST)
Received: from thinkpad ([103.197.115.97])
        by smtp.gmail.com with ESMTPSA id q15-20020a170902dacf00b001d337b8c0b2sm3852056plx.7.2024.01.06.21.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 21:17:05 -0800 (PST)
Date: Sun, 7 Jan 2024 10:46:55 +0530
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
Subject: Re: [PATCH v7 07/16] PCI: imx6: Simplify configure_type() by using
 mode_off and mode_mask
Message-ID: <20240107051655.GF3416@thinkpad>
References: <20231227182727.1747435-1-Frank.Li@nxp.com>
 <20231227182727.1747435-8-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227182727.1747435-8-Frank.Li@nxp.com>

On Wed, Dec 27, 2023 at 01:27:18PM -0500, Frank Li wrote:
> Add drvdata::mode_off and drvdata::mode_mask to simple

simplify

> imx6_pcie_configure_type() logic.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Couple of comments below.

> ---
> 
> Notes:
>     Change from v2 to v3
>     - none
>     Change from v1 to v2
>     - use ffs() to fixe build error.
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 60 ++++++++++++++++++---------
>  1 file changed, 40 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 588bfb616260e..717e8fa030deb 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -68,6 +68,7 @@ enum imx6_pcie_variants {
>  
>  #define IMX6_PCIE_MAX_CLKS       6
>  
> +#define IMX6_PCIE_MAX_INSTANCES			2
>  struct imx6_pcie_drvdata {
>  	enum imx6_pcie_variants variant;
>  	enum dw_pcie_device_mode mode;
> @@ -77,6 +78,8 @@ struct imx6_pcie_drvdata {
>  	const char *clk_names[IMX6_PCIE_MAX_CLKS];
>  	const u32 ltssm_off;
>  	const u32 ltssm_mask;
> +	const u32 mode_off[IMX6_PCIE_MAX_INSTANCES];
> +	const u32 mode_mask[IMX6_PCIE_MAX_INSTANCES];
>  };
>  
>  struct imx6_pcie {
> @@ -174,32 +177,25 @@ static unsigned int imx6_pcie_grp_offset(const struct imx6_pcie *imx6_pcie)
>  
>  static void imx6_pcie_configure_type(struct imx6_pcie *imx6_pcie)
>  {
> -	unsigned int mask, val, mode;
> +	const struct imx6_pcie_drvdata *drvdata = imx6_pcie->drvdata;
> +	unsigned int mask, val, mode, id;
>  
> -	if (imx6_pcie->drvdata->mode == DW_PCIE_EP_TYPE)
> +	if (drvdata->mode == DW_PCIE_EP_TYPE)
>  		mode = PCI_EXP_TYPE_ENDPOINT;
>  	else
>  		mode = PCI_EXP_TYPE_ROOT_PORT;
>  
> -	switch (imx6_pcie->drvdata->variant) {
> -	case IMX8MQ:
> -	case IMX8MQ_EP:
> -		if (imx6_pcie->controller_id == 1) {
> -			mask = IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE;
> -			val  = FIELD_PREP(IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE,
> -					  mode);
> -		} else {
> -			mask = IMX6Q_GPR12_DEVICE_TYPE;
> -			val  = FIELD_PREP(IMX6Q_GPR12_DEVICE_TYPE, mode);
> -		}
> -		break;
> -	default:
> -		mask = IMX6Q_GPR12_DEVICE_TYPE;
> -		val  = FIELD_PREP(IMX6Q_GPR12_DEVICE_TYPE, mode);
> -		break;
> -	}
> +	id = imx6_pcie->controller_id;
> +
> +	/* If mode_mask[id] is zero, means each controller have its individual gpr */
> +	if (!drvdata->mode_mask[id])
> +		id = 0;
> +
> +	mask = drvdata->mode_mask[id];
> +	/* FIELD_PREP mask have been constant */

No need of this comment.

> +	val = mode << (ffs(mask) - 1);
>  
> -	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12, mask, val);
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr, drvdata->mode_off[id], mask, val);
>  }
>  
>  static int pcie_phy_poll_ack(struct imx6_pcie *imx6_pcie, bool exp_val)
> @@ -1376,6 +1372,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.clk_names = {"pcie_bus", "pcie", "pcie_phy"},
>  		.ltssm_off = IOMUXC_GPR12,
>  		.ltssm_mask = IMX6Q_GPR12_PCIE_CTL_2,
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX6SX] = {
>  		.variant = IMX6SX,
> @@ -1386,6 +1384,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.clk_names = {"pcie_bus", "pcie", "pcie_phy", "pcie_inbound_axi"},
>  		.ltssm_off = IOMUXC_GPR12,
>  		.ltssm_mask = IMX6Q_GPR12_PCIE_CTL_2,
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX6QP] = {
>  		.variant = IMX6QP,
> @@ -1397,6 +1397,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.clk_names = {"pcie_bus", "pcie", "pcie_phy"},
>  		.ltssm_off = IOMUXC_GPR12,
>  		.ltssm_mask = IMX6Q_GPR12_PCIE_CTL_2,
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX7D] = {
>  		.variant = IMX7D,
> @@ -1405,6 +1407,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  			 IMX6_PCIE_FLAG_HAS_PHY_RESET,
>  		.gpr = "fsl,imx7d-iomuxc-gpr",
>  		.clk_names = {"pcie_bus", "pcie", "pcie_phy"},
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX8MQ] = {
>  		.variant = IMX8MQ,
> @@ -1412,6 +1416,10 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  			 IMX6_PCIE_FLAG_HAS_PHY_RESET,
>  		.gpr = "fsl,imx8mq-iomuxc-gpr",
>  		.clk_names = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux"},
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
> +		.mode_off[1] = IOMUXC_GPR12,
> +		.mode_mask[1] = IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE,

Is the mode_mask differ between SoCs or fixed based on instances? I mean, if
there is a guarantee that it is going to be IMX6Q_GPR12_DEVICE_TYPE for instance
1 and IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE for instance 2 etc...

Then we can avoid these SoC specific config and simplify the code further.

- Mani

>  	},
>  	[IMX8MM] = {
>  		.variant = IMX8MM,
> @@ -1420,6 +1428,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  			 IMX6_PCIE_FLAG_HAS_APP_RESET,
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
>  		.clk_names = {"pcie_bus", "pcie", "pcie_aux"},
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX8MP] = {
>  		.variant = IMX8MP,
> @@ -1428,6 +1438,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  			 IMX6_PCIE_FLAG_HAS_APP_RESET,
>  		.gpr = "fsl,imx8mp-iomuxc-gpr",
>  		.clk_names = {"pcie_bus", "pcie", "pcie_aux"},
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX8MQ_EP] = {
>  		.variant = IMX8MQ_EP,
> @@ -1436,6 +1448,10 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mq-iomuxc-gpr",
>  		.clk_names = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux"},
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
> +		.mode_off[1] = IOMUXC_GPR12,
> +		.mode_mask[1] = IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE,
>  	},
>  	[IMX8MM_EP] = {
>  		.variant = IMX8MM_EP,
> @@ -1443,6 +1459,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
>  		.clk_names = {"pcie_bus", "pcie", "pcie_aux"},
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX8MP_EP] = {
>  		.variant = IMX8MP_EP,
> @@ -1450,6 +1468,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mp-iomuxc-gpr",
>  		.clk_names = {"pcie_bus", "pcie", "pcie_aux"},
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  };
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
