Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70978DDAE
	for <imx@lists.linux.dev>; Fri, 19 Jan 2024 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705652232; cv=none; b=WBWvQkSi1IXEhthhdRjjSdcXancyqPzfaESLnzEMQQZCoYqikhy42imgOZJ2Uc+7e7fmZggGS5molGyeBzA74/UWX/tgtqWwCEdnA8E2/pe2DyEJ5D18KxAqE9hMgpccpgKDRZyYo4eVkgkZgDLT24cU1Srq1VQOrEjikrocb8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705652232; c=relaxed/simple;
	bh=oKKbj+jvfOiHePyNHPvlPksDgVHym+JYEXU4x7rTGMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1pC0JhzW0RMbq4ZmlRJIvumY+XdLAqW2mf2RWpvcjeB7ODeB/IG+PqCa1h/OBoKh3JfwefGPx7K1JSv29nq6SchHsPIu/1JfUOn90E3Q82wDLvhQkE9kkyWpPzt7LiQBMrfn9dv17thxjfvilZbrHQo/JkXNHpfLoASzXMgSNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EBTG68eB; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EBTG68eB"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so417669a12.1
        for <imx@lists.linux.dev>; Fri, 19 Jan 2024 00:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705652231; x=1706257031; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CKeQxr74v0/RAxO8TgttZrcsw2Yx0+jcWvQmI1Qe2Zw=;
        b=EBTG68eBlp9B0sxoPqKfUMSiY0rSIgA7rJuJJEuzt8XoeGrng6eCFAuY7a/zLB1qtb
         laoIu4dJ0lSzItjmR0/RavVCO86Vvgv/8OQldmVQotoRHfhQz9WusdPbHBlgyVJJM5WE
         ICTSFUIjI+ytBcaARwE1so7yduFHASoaMvrbrG118mBFe14Ul0BQP2hFWqomRl3fNpbA
         wWGIAkzxozhPwmMKeDVmph355bCewUczcr3MMhx+RcV+Tgq69q0pgEgDIAVdgT4VtncX
         DufHQ64qQChj/MjhUsHx0DqG37R+yS1IDjEx22tDTjylwW2z6JWC2RVOsG2NQRrLHmwA
         9R4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705652231; x=1706257031;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CKeQxr74v0/RAxO8TgttZrcsw2Yx0+jcWvQmI1Qe2Zw=;
        b=uUqynhLcd5pAoafMRup2thWVYGenZL/2i1TT/zHMadGiakxr2wKxPI3FCGClDwz6jq
         5fq3ajW3Tv0OBEoycyQ3+JZLJAJHmdi1acRzb9Q+61K03iK3Uu4FC1DTi4QsJSpPPQqE
         36jqxzo4pHkc83ybR6xyt5fBBxBugP11Z1MPEP0OAofu2+P4axV8VdLJ2T+NPi/R0xOS
         ePAnhWVEUNRRhK2NpEKh8iB8oi9LDyPflI+1cOVeqqwMX+45piaq5XOaK9Oh3/YBMXoY
         rmLoNycUqMaVdNGNu5I0T5PdzQA4L4sGp0JP21yGBUuiQtrXM3a/n9WjM+pOGUDvxT7l
         cXtA==
X-Gm-Message-State: AOJu0YxYLGUkKPPBB27idU3dihatwcspkkhfyDa/ACGjM6/NXekWsF3S
	0erdZbTE+EjyOvSM0dGwoTP5zmhFNbhijFx9TLMXdsmyBAsZcDDtcHLvHoJfnw==
X-Google-Smtp-Source: AGHT+IGS5Ltk1U1ZHIZAH9/TpF9urtmkWgrvxjyopbIMgOLF9edEyr5g7jMcF0En2+zgNlJcEzObqA==
X-Received: by 2002:a05:6a20:7fa4:b0:19a:21b8:ab6a with SMTP id d36-20020a056a207fa400b0019a21b8ab6amr2476870pzj.27.1705652230687;
        Fri, 19 Jan 2024 00:17:10 -0800 (PST)
Received: from thinkpad ([117.248.2.56])
        by smtp.gmail.com with ESMTPSA id fb30-20020a056a002d9e00b006d9af8c25easm4506321pfb.84.2024.01.19.00.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 00:17:10 -0800 (PST)
Date: Fri, 19 Jan 2024 13:47:00 +0530
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
Subject: Re: [PATCH v8 01/16] PCI: imx6: Simplify clock handling by using
 clk_bulk*() function
Message-ID: <20240119081700.GD2866@thinkpad>
References: <20240108232145.2116455-1-Frank.Li@nxp.com>
 <20240108232145.2116455-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240108232145.2116455-2-Frank.Li@nxp.com>

On Mon, Jan 08, 2024 at 06:21:30PM -0500, Frank Li wrote:
> Refector the clock handling logic. Add 'clk_names' define in drvdata. Use
> clk_bulk*() api simplify the code.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

One comment below. With that addressed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> 
> Notes:
>     Change from v7 to v8
>     - update comment message
>     - using ARRAY_SIZE to count clk_names.
>     Change from v6 to v7
>     - none
>     Change from v4 to v5
>     - update commit message
>     - direct using clk name list, instead of macro
>     - still keep caculate clk list count because sizeof return pre allocated
>     array size.
>     
>     Change from v3 to v4
>     - using clk_bulk_*() API
>     Change from v1 to v3
>     - none
>     
>     Change from v4 to v5
>     - update commit message
>     - direct using clk name list, instead of macro
>     - still keep caculate clk list count because sizeof return pre allocated
>     array size.
>     
>     Change from v3 to v4
>     - using clk_bulk_*() API
>     Change from v1 to v3
>     - none
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 144 ++++++++++----------------
>  1 file changed, 54 insertions(+), 90 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 74703362aeec7..4912c6b08ecf8 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c

[...]

>  
> +static const char * const
> +imx6_3clks_bus_pcie_phy[] = {"pcie_bus", "pcie", "pcie_phy"};
> +static const char * const
> +imx6_3clks_bus_pcie_aux[] = {"pcie_bus", "pcie", "pcie_aux"};
> +static const char * const
> +imx6_4clks_bus_pcie_phy_aux[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux"};
> +static const char * const
> +imx6_4clks_bus_pcie_phy_axi[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_inbound_axi"};
> +

Use platform names for defining the array. Like,

imx6q_clks[]
imx6sx_clks[]
imx8mq_clks[]
imx8mm_clks[]

and reuse them for other platforms as well. This gives an idea of how the clocks
got inherited from some base platforms.

- Mani

>  static const struct imx6_pcie_drvdata drvdata[] = {
>  	[IMX6Q] = {
>  		.variant = IMX6Q,
> @@ -1477,6 +1421,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  			 IMX6_PCIE_FLAG_IMX6_SPEED_CHANGE,
>  		.dbi_length = 0x200,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
> +		.clk_names = imx6_3clks_bus_pcie_phy,
> +		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_phy),
>  	},
>  	[IMX6SX] = {
>  		.variant = IMX6SX,
> @@ -1484,6 +1430,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  			 IMX6_PCIE_FLAG_IMX6_SPEED_CHANGE |
>  			 IMX6_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
> +		.clk_names = imx6_4clks_bus_pcie_phy_axi,
> +		.clks_cnt = ARRAY_SIZE(imx6_4clks_bus_pcie_phy_axi),
>  	},
>  	[IMX6QP] = {
>  		.variant = IMX6QP,
> @@ -1492,40 +1440,56 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  			 IMX6_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.dbi_length = 0x200,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
> +		.clk_names = imx6_3clks_bus_pcie_phy,
> +		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_phy),
>  	},
>  	[IMX7D] = {
>  		.variant = IMX7D,
>  		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.gpr = "fsl,imx7d-iomuxc-gpr",
> +		.clk_names = imx6_3clks_bus_pcie_phy,
> +		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_phy),
>  	},
>  	[IMX8MQ] = {
>  		.variant = IMX8MQ,
>  		.gpr = "fsl,imx8mq-iomuxc-gpr",
> +		.clk_names = imx6_4clks_bus_pcie_phy_aux,
> +		.clks_cnt = ARRAY_SIZE(imx6_4clks_bus_pcie_phy_aux),
>  	},
>  	[IMX8MM] = {
>  		.variant = IMX8MM,
>  		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
> +		.clk_names = imx6_3clks_bus_pcie_aux,
> +		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_aux),
>  	},
>  	[IMX8MP] = {
>  		.variant = IMX8MP,
>  		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.gpr = "fsl,imx8mp-iomuxc-gpr",
> +		.clk_names = imx6_3clks_bus_pcie_aux,
> +		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_aux),
>  	},
>  	[IMX8MQ_EP] = {
>  		.variant = IMX8MQ_EP,
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mq-iomuxc-gpr",
> +		.clk_names = imx6_4clks_bus_pcie_phy_aux,
> +		.clks_cnt = ARRAY_SIZE(imx6_4clks_bus_pcie_phy_aux),
>  	},
>  	[IMX8MM_EP] = {
>  		.variant = IMX8MM_EP,
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
> +		.clk_names = imx6_3clks_bus_pcie_aux,
> +		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_aux),
>  	},
>  	[IMX8MP_EP] = {
>  		.variant = IMX8MP_EP,
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mp-iomuxc-gpr",
> +		.clk_names = imx6_3clks_bus_pcie_aux,
> +		.clks_cnt = ARRAY_SIZE(imx6_3clks_bus_pcie_aux),
>  	},
>  };
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
