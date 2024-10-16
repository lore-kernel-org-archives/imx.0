Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC4B20C493
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 18:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729102503; cv=none; b=ZQROYFVaFqYCmdbGGvWisVtFjJEb0kzDcTQK8pMNCbTJ/8seuKyWH3tF6t3Fd23FBV4jvE8iIe3ahjzIWxfBEneJ40Tc3s8+suJdGS04d8d3c6wOaUDARi+WaUyb/tAXeDaVHoFx8JZcX7nRCTFYAN8mrL9LF9sMRRdQcoQiuKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729102503; c=relaxed/simple;
	bh=kMOkuyqyDiBU70N6lFEUOgEkhx4xtPTR2JIeyK1sEbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyT5qBEJP6Q3CahCtKTp9f/B48SqwmndumJYYCpEQhBFiiEm64XB/VHew/2KdP4UrU9SygVM63BmFHE0L2WX+1SO0cCkhZRrYPNMn29Il7Sc8MMDCMhnGCupk6uJuk/lv5tC4nPquQQhHTJCjPqEDi1EPZwnSoEob+bCvdXvhtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ke7ZAfuO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ke7ZAfuO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b5affde14so721465ad.3
        for <imx@lists.linux.dev>; Wed, 16 Oct 2024 11:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729102500; x=1729707300; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JqcNJoZn1LzotoHmCYaem8+wwJv3TspcxGY5Y2wT3qE=;
        b=ke7ZAfuO5SIAS8sgsX8fiF8VaA5i1JOWhPm9n7uTHoDbwi7S4eMDriaA1/MTMp+5yS
         ZzRmE0xhcnJjsJMXMgfIg7T5kGPSXTmeXtiudJSVcj8iDRK/6o0tn9/6J6mQU4Ibv0kQ
         mdMEVsvT3vLyK3gKVAvly075LimvJdGAEtIIE5rIQLiPaZV24eoyZeMcfzGtBOL8rRcK
         xSeUkLai9wTG74+0IHu3IAJNm1DwIIGLNm2GH8RcBGYTSHKW8c7Y/isMnpgmuKASisEk
         Bo9dhEjrdKNZaIQq8LhAS2MFKXs/QKK0M91dRJQlBL6NOr1iLj1dyJs7BzSiE8Ebz8Ee
         LeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729102500; x=1729707300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JqcNJoZn1LzotoHmCYaem8+wwJv3TspcxGY5Y2wT3qE=;
        b=DzqeoEBTGqsh7ed245JzertMirL/rKZvpUJokB97UO/iCdyHlZd1spc0mKFf7DXW47
         lr1WvMBUAlfv88AkhPoC6GA33ppWt2JDxC4gQvo1uWkJhoRFBZ889E5H5YuqvFNr4FFp
         nsnZ5pqOOnYbLJWPzpfcn+Uk/VJC64WrjsuaPs26yJyCGY9xsaglAigwub7SyV69rSfS
         khedcB6PyCYaQ145O0FUGihXqlBjeFWrjcpIv3PanOeV9GmxvrwWcIkvEBtFAjCRdTom
         CbNCqIlb51PCZoJZRMVx7EvtHt57XemyEpTGUoATBjoTLxRtPgQSfM42EFCctbOI0Owb
         /G9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlhtAKZuOq0gBgjvNba4QJpDXUx8PwW3M/BnE2NiGvgyosMY3ba1kXvJkvQCSkm3xeeV8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRYwVXbGRuHmjMoL7x9LgVSULTNZ/E2SUsMTW6RwriDmhEHYzc
	dLhsWIGbhoh7ohoPYh2+OXyoS3/kwMk1XtHPZ16kYM52LkU6HJFIk81H4dXRkA==
X-Google-Smtp-Source: AGHT+IFkhn/1WXaFJTfDH4EjM24/sVzkY4clftH7mc2KR4khd66Aw1VpnRIVe5BuWrMJFdiif8PjyA==
X-Received: by 2002:a17:903:2405:b0:20c:9bf9:1d97 with SMTP id d9443c01a7336-20d27f41971mr51867625ad.60.1729102500172;
        Wed, 16 Oct 2024 11:15:00 -0700 (PDT)
Received: from thinkpad ([220.158.156.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805a175sm31465615ad.247.2024.10.16.11.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 11:14:59 -0700 (PDT)
Date: Wed, 16 Oct 2024 23:44:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v2 4/4] PCI: imx6: Add i.MX8Q PCIe Endpoint (EP) support
Message-ID: <20241016181451.atzbuvubsxrpsaiw@thinkpad>
References: <20240923-pcie_ep_range-v2-0-78d2ea434d9f@nxp.com>
 <20240923-pcie_ep_range-v2-4-78d2ea434d9f@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923-pcie_ep_range-v2-4-78d2ea434d9f@nxp.com>

On Mon, Sep 23, 2024 at 02:59:22PM -0400, Frank Li wrote:

Subject should specify 'i.MX8Q series of SoCs'. So it would become:

'PCI: imx6: Add PCIe Endpoint (EP) support for i.MX8Q series of SoCs'

> Add support for i.MX8Q series (i.MX8QM, i.MX8QXP, and i.MX8DXL) PCIe
> Endpoint (EP). On i.MX8Q platforms, the PCI bus addresses differ from the
> CPU addresses. The DesignWare (DWC) driver already handles this in the
> common code.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index bdc2b372e6c13..1e58c24137e7f 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -70,6 +70,7 @@ enum imx_pcie_variants {
>  	IMX8MQ_EP,
>  	IMX8MM_EP,
>  	IMX8MP_EP,
> +	IMX8Q_EP,
>  	IMX95_EP,
>  };
>  
> @@ -1079,6 +1080,16 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
>  	.align = SZ_64K,
>  };
>  
> +static const struct pci_epc_features imx8q_pcie_epc_features = {
> +	.linkup_notifier = false,
> +	.msi_capable = true,
> +	.msix_capable = false,
> +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.align = SZ_64K,
> +};
> +
>  /*
>   * BAR#	| Default BAR enable	| Default BAR Type	| Default BAR Size	| BAR Sizing Scheme
>   * ================================================================================================
> @@ -1645,6 +1656,14 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.epc_features = &imx8m_pcie_epc_features,
>  		.enable_ref_clk = imx8mm_pcie_enable_ref_clk,
>  	},
> +	[IMX8Q_EP] = {
> +		.variant = IMX8Q_EP,
> +		.flags = IMX_PCIE_FLAG_HAS_PHYDRV,
> +		.mode = DW_PCIE_EP_TYPE,
> +		.epc_features = &imx8q_pcie_epc_features,
> +		.clk_names = imx8q_clks,
> +		.clks_cnt = ARRAY_SIZE(imx8q_clks),
> +	},
>  	[IMX95_EP] = {
>  		.variant = IMX95_EP,
>  		.flags = IMX_PCIE_FLAG_HAS_SERDES |
> @@ -1674,6 +1693,7 @@ static const struct of_device_id imx_pcie_of_match[] = {
>  	{ .compatible = "fsl,imx8mq-pcie-ep", .data = &drvdata[IMX8MQ_EP], },
>  	{ .compatible = "fsl,imx8mm-pcie-ep", .data = &drvdata[IMX8MM_EP], },
>  	{ .compatible = "fsl,imx8mp-pcie-ep", .data = &drvdata[IMX8MP_EP], },
> +	{ .compatible = "fsl,imx8q-pcie-ep", .data = &drvdata[IMX8Q_EP], },
>  	{ .compatible = "fsl,imx95-pcie-ep", .data = &drvdata[IMX95_EP], },
>  	{},
>  };
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
