Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA23282F1
	for <imx@lists.linux.dev>; Sun, 30 Jun 2024 16:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719763455; cv=none; b=Xd9aIOP2lrFdXMtNo4U86sXKi38b2iqQz5W3miNNtZvUK9qBDXXmzuNK80VABVhglVy5C+RtmUKW9A/8XacPYxr1yDK1N+sTvQyALHpDxJg+S68NCTRSe5qAJvIpqBf6BFv+gOqHhdiaYVWrjmOKa5DbbdSFxOLBl7Q8E+maRFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719763455; c=relaxed/simple;
	bh=QSk3MLBFWYxdS1lyWaKLPfiq8c0bClBAB0cXLtw3hkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXR9/oKjIbhaiG+V6G3p8Q2HtE8kJofgPWbWsKbw937roHmKNSFA5uc2Ne+pdSlwpgXWM78cU03eq8JatSbpwTa79yyMoEGxHOHnMmTZIPx+rvnlJg6L43MCbUFtZ7rtNRvDP3qL/ioqQHSH+qUt/gTj3DflOxbUekUbWJy5Uu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D69AHDHo; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D69AHDHo"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-71816f36d4dso1508069a12.2
        for <imx@lists.linux.dev>; Sun, 30 Jun 2024 09:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719763453; x=1720368253; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AvsobNNphpX1qA8jM6UiYbgsCJI9R8gZdoYIohlPvoU=;
        b=D69AHDHoj0I+q8fh0X3Ul1lCYwseS+yByCu85IiAZ8gcrIU8aIniF/XrKs5BXDsniS
         NUlsnjU1OtsPkIQT+aLGcbdvHruPPNajx8TDUGbJ3x4tGSYZaJH3NUdf1i1m9Z0ojaVg
         6qc2TCcsTgr/PgsVWYe+iEhHn12ZSW3NNKJVlQqvsSsoGdAH+b1u0xSGlCWn1vznC8GQ
         zc3N0rpE4wJVLEz5hre3iRdZuI6vGnyB3HXJYrVGdTTbO4MDXELcCvAmvVBCghby/WSM
         JXIl6qGtlHVKdHL1W4eKYO6hM5L4dauLMNcGj4OpIgW2Oehe6Bl62TAywRXtyUdPqPRy
         Hc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719763453; x=1720368253;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvsobNNphpX1qA8jM6UiYbgsCJI9R8gZdoYIohlPvoU=;
        b=kbvNijUsNpZFYWtqIUCrSJXHUMmDIfjKm9EtCaYrXy2fLhjLCQ/1XAye4AxbuAqt5K
         /1yDs7JeGsgg1af/hxl7FSaVpOq5Aj9/dLJaF5EDyKAIrp2TIi/J/jObdBPPhaRo1I7U
         nMjUMbFjI5u0bHeQZvFKzpnMOQZUYRUIBlMWI84ACNtfNp+adOq8k9FknGQFx8g04oUK
         c1g8aNodZWVZYBVbvJt2aQzQmdmpJrtoWwskGD+BccDtxVtA1X7SnN/RqHDZcbC/DBsm
         1VlNp4YXmCi0nnpef1GZc16tZ09cuQ5hAuScHSVQp6Ve43uqvQ+jM8aBiG9oxS4o0ym/
         ZaEg==
X-Forwarded-Encrypted: i=1; AJvYcCWW7pE4/3u0tOvFjjp62hlYTRC5hLAXTKfI0lwElanJR972o/wa8bf8WzluBYp+pwIO6ILfygKxtN5ze/ypEUQz3WpJ
X-Gm-Message-State: AOJu0YwjoNzoVe7rgMrm+uzyNSkWDBqlQ+r54mL+JwV0g6y8J6Lz7BkH
	wt+ElfYATGHp/pmAJbEZbgwW4ICeGifAoXZEtX3B31ZoU79dmnAT1iq4y40ZMw==
X-Google-Smtp-Source: AGHT+IGyfue7LPLZ7LilRGBZbjr/2wxVRS0FTY7k1T7f6sAuKaMo1GK7re9KdEfypZs3yJjqAb56XQ==
X-Received: by 2002:a05:6a21:18d:b0:1be:bff2:b1b0 with SMTP id adf61e73a8af0-1bef620cb64mr6541664637.40.1719763453270;
        Sun, 30 Jun 2024 09:04:13 -0700 (PDT)
Received: from thinkpad ([220.158.156.215])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac11d8b18sm47987155ad.99.2024.06.30.09.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 09:04:12 -0700 (PDT)
Date: Sun, 30 Jun 2024 21:34:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 04/10] PCI: imx6: Introduce SoC specific callbacks for
 controlling REFCLK
Message-ID: <20240630160404.GA5264@thinkpad>
References: <20240617-pci2_upstream-v6-0-e0821238f997@nxp.com>
 <20240617-pci2_upstream-v6-4-e0821238f997@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617-pci2_upstream-v6-4-e0821238f997@nxp.com>

On Mon, Jun 17, 2024 at 04:16:40PM -0400, Frank Li wrote:
> Instead of using the switch case statement to enable/disable the reference
> clock handled by this driver itself, let's introduce a new callback
> set_ref_clk() and define it for platforms that require it. This simplifies

Should this be called 'enable_ref_clk' since the callback is supposed to enable
REFCLK?

> the code.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 112 ++++++++++++++++------------------
>  1 file changed, 52 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 47134e2dfecf2..ff9d0098294fa 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -103,6 +103,7 @@ struct imx_pcie_drvdata {
>  	const u32 mode_mask[IMX_PCIE_MAX_INSTANCES];
>  	const struct pci_epc_features *epc_features;
>  	int (*init_phy)(struct imx_pcie *pcie);
> +	int (*set_ref_clk)(struct imx_pcie *pcie, bool enable);
>  };
>  
>  struct imx_pcie {
> @@ -585,21 +586,19 @@ static int imx_pcie_attach_pd(struct device *dev)
>  	return 0;
>  }
>  
> -static int imx_pcie_enable_ref_clk(struct imx_pcie *imx_pcie)
> +static int imx6sx_pcie_set_ref_clk(struct imx_pcie *imx_pcie, bool enable)
>  {
> -	unsigned int offset;
> -	int ret = 0;
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12, IMX6SX_GPR12_PCIE_TEST_POWERDOWN,
> +			   enable ? 0 : IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
>  
> -	switch (imx_pcie->drvdata->variant) {
> -	case IMX6SX:
> -		regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> -				   IMX6SX_GPR12_PCIE_TEST_POWERDOWN, 0);
> -		break;
> -	case IMX6QP:
> -	case IMX6Q:
> +	return 0;
> +}
> +
> +static int imx6q_pcie_set_ref_clk(struct imx_pcie *imx_pcie, bool enable)
> +{
> +	if (enable) {
>  		/* power up core phy and enable ref clock */
> -		regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> -				   IMX6Q_GPR1_PCIE_TEST_PD, 0 << 18);
> +		regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_TEST_PD, 0);
>  		/*
>  		 * the async reset input need ref clock to sync internally,
>  		 * when the ref clock comes after reset, internal synced
> @@ -608,54 +607,34 @@ static int imx_pcie_enable_ref_clk(struct imx_pcie *imx_pcie)
>  		 */
>  		usleep_range(10, 100);
>  		regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> -				   IMX6Q_GPR1_PCIE_REF_CLK_EN, 1 << 16);
> -		break;
> -	case IMX7D:
> -	case IMX95:
> -	case IMX95_EP:
> -		break;
> -	case IMX8MM:
> -	case IMX8MM_EP:
> -	case IMX8MQ:
> -	case IMX8MQ_EP:
> -	case IMX8MP:
> -	case IMX8MP_EP:
> -		offset = imx_pcie_grp_offset(imx_pcie);
> -		/*
> -		 * Set the over ride low and enabled
> -		 * make sure that REF_CLK is turned on.
> -		 */
> -		regmap_update_bits(imx_pcie->iomuxc_gpr, offset,
> -				   IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE,
> -				   0);
> -		regmap_update_bits(imx_pcie->iomuxc_gpr, offset,
> -				   IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN,
> -				   IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN);
> -		break;
> +				   IMX6Q_GPR1_PCIE_REF_CLK_EN, IMX6Q_GPR1_PCIE_REF_CLK_EN);
> +	} else {
> +		regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> +				   IMX6Q_GPR1_PCIE_REF_CLK_EN, 0);
> +		regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> +				   IMX6Q_GPR1_PCIE_TEST_PD, IMX6Q_GPR1_PCIE_TEST_PD);
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
> -static void imx_pcie_disable_ref_clk(struct imx_pcie *imx_pcie)
> +static int imx8mm_pcie_set_ref_clk(struct imx_pcie *imx_pcie, bool enable)
>  {
> -	switch (imx_pcie->drvdata->variant) {
> -	case IMX6QP:
> -	case IMX6Q:
> -		regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> -				IMX6Q_GPR1_PCIE_REF_CLK_EN, 0);
> -		regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
> -				IMX6Q_GPR1_PCIE_TEST_PD,
> -				IMX6Q_GPR1_PCIE_TEST_PD);
> -		break;
> -	case IMX7D:
> -		regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> -				   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL,
> -				   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL);
> -		break;
> -	default:
> -		break;
> -	}
> +	int offset = imx_pcie_grp_offset(imx_pcie);
> +
> +	/* Set the over ride low and enabled make sure that REF_CLK is turned on.*/

This comment provides no useful info. So please remove it.

> +	regmap_update_bits(imx_pcie->iomuxc_gpr, offset, IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE,
> +			   enable ? 0 : IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE);
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, offset, IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN,
> +			   enable ? IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN : 0);
> +	return 0;
> +}
> +
> +static int imx7d_pcie_set_ref_clk(struct imx_pcie *imx_pcie, bool enable)
> +{
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12, IMX7D_GPR12_PCIE_PHY_REFCLK_SEL,
> +			    enable ? 0 : IMX7D_GPR12_PCIE_PHY_REFCLK_SEL);
> +	return 0;

Previously imx6_pcie_enable_ref_clk() was bailing out for IMX7D. But now you are
explicitly enabling it. What is the reason?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
