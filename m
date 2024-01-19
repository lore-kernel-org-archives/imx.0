Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B72288CE
	for <imx@lists.linux.dev>; Fri, 19 Jan 2024 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705652565; cv=none; b=bb82Gs6INoqWu1L6+0TQ79sPXjfrJkBIfXzrMtf5YsJu1vrYSRDws9523oKxKJg7R0qcx6aCbdEl16fqETBBh1/tRHmXeMm0gRDO07cFNbqhzSVSBmTNSeI0sE+kECrKfw7shATJsUMWJh3/p4OS8a8FcA8Gid3nnKRtVPDowME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705652565; c=relaxed/simple;
	bh=fE4nvdepXcainxleFg2p2rGfLXyNjOvfjkFBTMMXaTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjZIoftMcp2ODTyneS63XVDzf4pEzmLvsQ7BlSR+/OpWuIh3dD1x5iDixFaDVqRB2YyaxENDnXvZNnaDvmtKXT+5IFlVQt+x6bWXteX0ke3bhXjngpwJbXc65Oi/LfEYfrtZCygG4IX1JW6KdNMixEgYiHj5SZVNZT4NRr+mQcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YBCW7aL1; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YBCW7aL1"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6db79e11596so468586b3a.0
        for <imx@lists.linux.dev>; Fri, 19 Jan 2024 00:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705652563; x=1706257363; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=32Sy5zn9pzxRmXmijB2NuJFzqsTbhpiZL8r/igtqHEg=;
        b=YBCW7aL1IeHC4721juHdQ2iPSaz4AINlAWj6ZNui/GaAL4vAvcdxVBJg7SYcTE3qxS
         Mbs3EYBtlPZDSv5HX4MNjzoCCQwgGqwcmRFyztE1xqMgvcQJud3ooyBXTXCcxT+TMLKj
         a/WEcuDQrmhZ+bF9skDqIpkaHqZECdIwuOiB8QoM+c0Zf6HLw32s2rCXS6lGV5LGYKeD
         pdSS2xI9ukeBsAWtGosN82bCB81sk5dquPZEIkVvg0IqwD0Kawf5nD9LP5JhAW/BV3Dz
         9M3XBYmMeE2fsuPRhxkrBHsg1+sr9zeLO0J4O0r7wWnJH+I1gyrd/A1WU3qJWN4Dv7Xg
         035A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705652564; x=1706257364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32Sy5zn9pzxRmXmijB2NuJFzqsTbhpiZL8r/igtqHEg=;
        b=crXMVAoYNyVPhl3TK3djeEXhMGRcvzGRXdZvEXDWmMd5dpMXO1wNXW1yi4y0W7fbFE
         olrIR6Dsooszb5VBmQEuI9fMZKPnK6aHizvfvDjOXJkSglClr6cITRDpH5Y8ANQK/m+D
         R5jtz1ZqcPcoOfdzuXFh3DI/DQemr31UM9zSCvhrQksGiDlivl4MV5u9pydlZ0Vfmbru
         Ey0HA5SeJhpA1HJrcCV81GdO6K7aN1YADvwvAsYopBYi6+JzoqSVlht9J09QoASyPe7j
         eeASfv/eFVKnupolNfZE+ZjMtRaJqyyUZ0fMPXZlXn7/OpzVDyoYybh6te1IutNDmBf3
         1GtQ==
X-Gm-Message-State: AOJu0Yw3Ru0NB+0eTb/8yYLqp/O9Q/4MQsgw8zuJFdB+ffzYF8qiAQ4g
	XrgxpAQhcEoJgeFktYe8VFPqmPlcvoc1vY3FfTB+sS5Tv9n4V003hmeA3J2lJA==
X-Google-Smtp-Source: AGHT+IFMeb9Ejw77pAkfYEpPDGHEgKv3OxR2ZLFWnHGVvr5z23CoC8i1jJjT6oNmGxF+fMDTo5sxyw==
X-Received: by 2002:a05:6a00:39a4:b0:6db:c577:67d6 with SMTP id fi36-20020a056a0039a400b006dbc57767d6mr331819pfb.0.1705652563679;
        Fri, 19 Jan 2024 00:22:43 -0800 (PST)
Received: from thinkpad ([117.248.2.56])
        by smtp.gmail.com with ESMTPSA id n16-20020aa78a50000000b006cecaff9e29sm4535056pfa.128.2024.01.19.00.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 00:22:43 -0800 (PST)
Date: Fri, 19 Jan 2024 13:52:33 +0530
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
Subject: Re: [PATCH v8 07/16] PCI: imx6: Simplify configure_type() by using
 mode_off and mode_mask
Message-ID: <20240119082233.GF2866@thinkpad>
References: <20240108232145.2116455-1-Frank.Li@nxp.com>
 <20240108232145.2116455-8-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240108232145.2116455-8-Frank.Li@nxp.com>

On Mon, Jan 08, 2024 at 06:21:36PM -0500, Frank Li wrote:
> Add drvdata::mode_off and drvdata::mode_mask to simplify
> imx6_pcie_configure_type() logic.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
> Notes:
>     Change from v7 to v8
>     - replace simple with simplify
>     - remove reduntant comments about FILED_PREP
>     Change from v3 to v7
>     - none
>     Change from v2 to v3
>     - none
>     Change from v1 to v2
>     - use ffs() to fixe build error.
>     
>     Change from v2 to v3
>     - none
>     Change from v1 to v2
>     - use ffs() to fixe build error.
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 59 ++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 818e73157e724..fd83af238fa60 100644
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
> @@ -78,6 +79,8 @@ struct imx6_pcie_drvdata {
>  	const u32 clks_cnt;
>  	const u32 ltssm_off;
>  	const u32 ltssm_mask;
> +	const u32 mode_off[IMX6_PCIE_MAX_INSTANCES];
> +	const u32 mode_mask[IMX6_PCIE_MAX_INSTANCES];
>  };
>  
>  struct imx6_pcie {
> @@ -174,32 +177,24 @@ static unsigned int imx6_pcie_grp_offset(const struct imx6_pcie *imx6_pcie)
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
> +	val = mode << (ffs(mask) - 1);
>  
> -	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12, mask, val);
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr, drvdata->mode_off[id], mask, val);
>  }
>  
>  static int pcie_phy_poll_ack(struct imx6_pcie *imx6_pcie, bool exp_val)
> @@ -1389,6 +1384,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_phy),
>  		.ltssm_off = IOMUXC_GPR12,
>  		.ltssm_mask = IMX6Q_GPR12_PCIE_CTL_2,
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX6SX] = {
>  		.variant = IMX6SX,
> @@ -1400,6 +1397,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.clks_cnt = ARRAY_SIZE(imx6_4clks_bus_pcie_phy_axi),
>  		.ltssm_off = IOMUXC_GPR12,
>  		.ltssm_mask = IMX6Q_GPR12_PCIE_CTL_2,
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX6QP] = {
>  		.variant = IMX6QP,
> @@ -1412,6 +1411,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_phy),
>  		.ltssm_off = IOMUXC_GPR12,
>  		.ltssm_mask = IMX6Q_GPR12_PCIE_CTL_2,
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX7D] = {
>  		.variant = IMX7D,
> @@ -1421,6 +1422,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.gpr = "fsl,imx7d-iomuxc-gpr",
>  		.clk_names = imx6_3clks_bus_pcie_phy,
>  		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_phy),
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX8MQ] = {
>  		.variant = IMX8MQ,
> @@ -1429,6 +1432,10 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.gpr = "fsl,imx8mq-iomuxc-gpr",
>  		.clk_names = imx6_4clks_bus_pcie_phy_aux,
>  		.clks_cnt = ARRAY_SIZE(imx6_4clks_bus_pcie_phy_aux),
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
> +		.mode_off[1] = IOMUXC_GPR12,
> +		.mode_mask[1] = IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE,
>  	},
>  	[IMX8MM] = {
>  		.variant = IMX8MM,
> @@ -1438,6 +1445,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
>  		.clk_names = imx6_3clks_bus_pcie_aux,
>  		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_aux),
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX8MP] = {
>  		.variant = IMX8MP,
> @@ -1447,6 +1456,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.gpr = "fsl,imx8mp-iomuxc-gpr",
>  		.clk_names = imx6_3clks_bus_pcie_aux,
>  		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_aux),
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX8MQ_EP] = {
>  		.variant = IMX8MQ_EP,
> @@ -1456,6 +1467,10 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.gpr = "fsl,imx8mq-iomuxc-gpr",
>  		.clk_names = imx6_4clks_bus_pcie_phy_aux,
>  		.clks_cnt = ARRAY_SIZE(imx6_4clks_bus_pcie_phy_aux),
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
> +		.mode_off[1] = IOMUXC_GPR12,
> +		.mode_mask[1] = IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE,
>  	},
>  	[IMX8MM_EP] = {
>  		.variant = IMX8MM_EP,
> @@ -1464,6 +1479,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
>  		.clk_names = imx6_3clks_bus_pcie_aux,
>  		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_aux),
> +		.mode_off[0] = IOMUXC_GPR12,
> +		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  	},
>  	[IMX8MP_EP] = {
>  		.variant = IMX8MP_EP,
> @@ -1472,6 +1489,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.gpr = "fsl,imx8mp-iomuxc-gpr",
>  		.clk_names = imx6_3clks_bus_pcie_aux,
>  		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_aux),
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
