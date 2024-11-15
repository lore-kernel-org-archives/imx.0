Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4FA186294
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 06:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731653666; cv=none; b=RFItIsf6tEiocQ74QxYJ36eWap8HMX3ueL9TsTco6iZOunnaSoS5rof9GsZ3F/7ZQBYbmPv0/CAzcAsZOX22qlotsXpMVUSMNlq0CriZxSMEfEJIf22fNb+tPA0gv1UVrPWTYU1XIcMW0NtqzRywnfJgrhk/hwoD1666XgLLdVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731653666; c=relaxed/simple;
	bh=x/2VSAbk+bd/qDKumw5Nythdu6G/pN92DH/s7nEgFDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkuqG6C4zFWF0eHymsFqEdMRsrw8fx5CDy3Hh2mUc/XKeT9pCOk16++6PU0eazvHWQqsIqGtGIYdVKprbW54jQbbGHuPSNoolPUTMWbQkfAw3gX7oe5xvT48IThnvhjm+4Av22LL+sN281uj9YaL8mM5n81C1PQRGyXg3HaEXCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DgI6VzkN; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DgI6VzkN"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-29066daf9e2so747360fac.3
        for <imx@lists.linux.dev>; Thu, 14 Nov 2024 22:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731653663; x=1732258463; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VpIhQ9mb9ycFkMd8PQ/S0ZDiIrP7seI2TZz9r3I3eW0=;
        b=DgI6VzkNpLPRPyDtwefGH7WlJtMiZmmnPFXeaZtLts5iOu1mjBSey2lQv3kEVOgS0S
         R8FncXtnsGB/AujxwwLhZYYNEz6T0pa91Di9nOtVWjPj88RtKs4tLgr0HrgJoBeqMN3Y
         NJt4WmjMnvA182/oRoByhxhlVHreNQ5SF+vTXJk9O22LhDTpbZixwNE9HwnNmbTR/2d/
         JM0JTtXPEAQQ2M0NCBaFXyGaekQ011rN+bVOJAsh0wyBmO9iDyYK2iSD5kEzTGyr0ya9
         JKybkia5JVuuduKUS2nm9Q1GzDWp2CLZP2em47B16lYExIMD7hsMxqcEvOj26weLjDEx
         +ELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731653663; x=1732258463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VpIhQ9mb9ycFkMd8PQ/S0ZDiIrP7seI2TZz9r3I3eW0=;
        b=Augwq2w46gSZ4bWHymspXFAjbmn5Nn3EcMg4FYFCNIFWlnZSZzoVLUqQ8V8r7Ix84Y
         jLYlpvSir5CB5RX+6K6GFHmGDNjSKL9rLy8oXa6lohhd7mZuUd2pSyV/3avaCSLcfyg/
         WZoIXuUJoAjW7M1QlHLYx4Pio3Mr2wrvhBabjGr6FVdJSM2ghwVf3WELvozVbAY1QXcV
         ECHgyTSeGcRQKtdppUwzGi7L87aHnGh4tE1yqvlqd8l8WvTFylwCcIpo6NaARyaGfb9R
         6TeWnVu/Wtj9NoyIuGLlry+i20ldMM7R4LUNkS7js/+dv/lpSiyHHCkqlfkpBQHHDg90
         Py5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBKNzSLVQGNTpme4M08KTn0jlElrmrOpt5+uZz8nmxDw0K/AcsRpqMRnpVbO2IZ7CPKV4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpyQ3MlHbrWq4nKrnSUW0vB5rf8YAe2pDXm1KNaruiU8MsjqVn
	yqypN1ccU96D8TL7hM53+8IvIUEraHzmPkOHMLnDxprbiQ/pRGbBRy+SX5rKHg==
X-Google-Smtp-Source: AGHT+IGA2wP5EZO//DczjdnLKwXL89OrzkosGXPzS/O5S6Z8HF8QEOaPag4uwMWdG7hB0NyuZCDjFw==
X-Received: by 2002:a05:6871:691:b0:270:27e6:6f1a with SMTP id 586e51a60fabf-2962e2a0d04mr1279132fac.41.1731653662715;
        Thu, 14 Nov 2024 22:54:22 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1c3224asm650735a12.29.2024.11.14.22.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:54:22 -0800 (PST)
Date: Fri, 15 Nov 2024 12:24:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 06/10] PCI: imx6: Fix the missing reference clock
 disable logic
Message-ID: <20241115065412.l2r5vmqaw3ufcjo3@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-7-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-7-hongxing.zhu@nxp.com>

On Fri, Nov 01, 2024 at 03:06:06PM +0800, Richard Zhu wrote:
> Ensure the *_enable_ref_clk() function is symmetric by addressing missing
> disable parts on some platforms.
> 
> Fixes: d0a75c791f98 ("PCI: imx6: Factor out ref clock disable to match enable")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 54039d2760d5..bb130c84c016 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -595,10 +595,9 @@ static int imx_pcie_attach_pd(struct device *dev)
>  
>  static int imx6sx_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
>  {
> -	if (enable)
> -		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> -				  IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
> -
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> +			   IMX6SX_GPR12_PCIE_TEST_POWERDOWN,
> +			   enable ? 0 : IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
>  	return 0;
>  }
>  
> @@ -627,19 +626,20 @@ static int imx8mm_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
>  {
>  	int offset = imx_pcie_grp_offset(imx_pcie);
>  
> -	if (enable) {
> -		regmap_clear_bits(imx_pcie->iomuxc_gpr, offset, IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE);
> -		regmap_set_bits(imx_pcie->iomuxc_gpr, offset, IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN);
> -	}
> -
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, offset,
> +			   IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE,
> +			   enable ? 0 : IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE);
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, offset,
> +			   IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN,
> +			   enable ? IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN : 0);
>  	return 0;
>  }
>  
>  static int imx7d_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
>  {
> -	if (!enable)
> -		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> -				IMX7D_GPR12_PCIE_PHY_REFCLK_SEL);
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> +			   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL,
> +			   enable ? 0 : IMX7D_GPR12_PCIE_PHY_REFCLK_SEL);
>  	return 0;
>  }
>  
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
