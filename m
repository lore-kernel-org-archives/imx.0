Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872DE1B87F2
	for <imx@lists.linux.dev>; Sun, 13 Apr 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744557517; cv=none; b=Kv+T6SCF8/ebxmyFg12UM6+gDEKQsZUKPU/5XWFzoztdUSZccdl/OgBGwLhEr0Sic9JM3qsulpZACEtsD3prCXeXWdp9p7D7ps0ceWFm9CCC8vDQtuVFIAfInfLkrD7UxcR9oaLIMzrXUHk0jY/cmfZXduDzU3D7PkwvqJ51A8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744557517; c=relaxed/simple;
	bh=zmesPPV9ChE9oRi1yUXnqbMt44Qq+n0tUWnOlfbWAY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIoypOSGUtNeYev0U+2w1YVTTIEx0IaVQ7fmNtpnK0NQzr+oVH9n2thu0j3GmiQrzI2KUOBI64apyc7lLO7VbOvSbe4npV5zaZ5t2tJbTzmS3wsJZStbgyC3yPMdrDvOv2eej/QAMSbELvBYDtIk9UKC+496uDeC8XFUHHZVCQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mn5HU9cF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mn5HU9cF"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2254e0b4b79so47044645ad.2
        for <imx@lists.linux.dev>; Sun, 13 Apr 2025 08:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744557514; x=1745162314; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t5SxyZdFhsBdqIFHmGXVTKr/6RFpFPtSv5Kv+4B1G54=;
        b=mn5HU9cFvVu7FG+CVqlYdN45Z+6CPZRbbAd3iIKB+PO0kHlq1lbGnRG49ioyK7T5m1
         Ds6D99qlYBvGS91WhkPmG5wBn5vcZxIGn1JyN/SgBxGDqY4izekVLWqlsd21r+z/zQQL
         8uC6GNFIIwwUBCwQet542r2agY/por8IZJJwok49gpM27ngUrsamMfPMrATBK6CPk0AS
         B/RSQp8xRGQTsAgcl66+xsK7A9BSOO4iTJhJcPrtdssIdu3SlOeNBFPnm+x4zBWFMWBq
         wjVyQb+JaLh5IS2TZPkFcAgYN4AP0pFPEX39ZKT6LzufxW2dCSHRzZUQELIIDsyB/UiO
         Gahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744557514; x=1745162314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5SxyZdFhsBdqIFHmGXVTKr/6RFpFPtSv5Kv+4B1G54=;
        b=C4AvuoYtuGqO9fJJbmmWUERfent8xtug1MLpWpCmybEoaWfTpQ+lAsEYw4MpAEtq+R
         +TfISlyCuoVNIcq4VIa0MvYta2pqG4YZ+10lu7lgXiHCbENVPIPVQbBUeXm4vgDrj4P/
         h5ArMmEOZ1EPg31rl9AtjNeXL59pQXZio1d0tWtaCxDni/u/NkqDbRVedgw9S9wcsEOG
         m7qzELbgb9tfo3N4BkLOi/uBZaXqUV3Tb87VUVdkIXuhinQfUt7tlfAcy2K7KvnuYZ1a
         27oJypSgmgL57ZiQPWasMiwWH33/76k6NHXExf6boNwnUyvIwyQacNuiPW0vC1stpJG7
         1PtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg1xWxM/45uh6G5WoOp+KRDVs837Tu6vFCNX4/rAs96a51lQV/HxvxLd2GWUYFk+5/VKc=@lists.linux.dev
X-Gm-Message-State: AOJu0YydEF0PovI/tKLqswR27w3JOQMbxLPVQS881eOQH8plTl13lzWd
	4gTPlVEe5F3Z2tqrkaetaUM2yD1644MXnIy/HEG/KHfSFmZkhCeZxvBQIzqiig==
X-Gm-Gg: ASbGncv63ED4dvueoy4a3vQYbJ+YSNFz+S6lgIPlmsxbRJDDs6FGWEI8oUx9nhOGfRW
	sfmgI431a1R8DxoyBsFNRioM8tbXPpBA4Q/RobAQ/xWj7QmFWMFtmtpB3bvkIhziPRSfyC/sVmt
	E7257WTtOroEz7idyx66UcEPnPocFaqLZU6JvJD1ex7B1m32j6/zKgKEd/bswNKEZSFuKY/4nU3
	eO1zGrjn99wPd5PR78bhUMmAM8Jg7lKQ5sTf/jTHycvOl6CapPPD9WC98l+DeV7cKViuC7atmqG
	Mfy26uCN9CmM8F3D3ilYT2iwvKctuHRhbDcl3nnI3JVcybJhWzAX
X-Google-Smtp-Source: AGHT+IHDZ8f7JVDhbxKzAwHoGnI3IfIzM3yHwUjNE3PyS9q8zuAZM5A71PAC0QwIseLe1+9XzUcjmQ==
X-Received: by 2002:a17:903:2309:b0:220:c813:dfcc with SMTP id d9443c01a7336-22bea4f1ab1mr152530195ad.40.1744557513757;
        Sun, 13 Apr 2025 08:18:33 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb59a6sm83980095ad.203.2025.04.13.08.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 08:18:33 -0700 (PDT)
Date: Sun, 13 Apr 2025 20:48:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/7] PCI: imx6: Toggle the cold reset for i.MX95 PCIe
Message-ID: <pnc2kgveacnox4kbdamggp6p7pjmuyan6lwucdgzyqg3u75uo7@bb6bnsy75e4x>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-4-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408025930.1863551-4-hongxing.zhu@nxp.com>

On Tue, Apr 08, 2025 at 10:59:26AM +0800, Richard Zhu wrote:
> Add the cold reset toggle for i.MX95 PCIe to align PHY's power up sequency.

Please avoid spelling mistakes in the commit messages.

> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 42 +++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index c5871c3d4194..7c60b712480a 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -71,6 +71,9 @@
>  #define IMX95_SID_MASK				GENMASK(5, 0)
>  #define IMX95_MAX_LUT				32
>  
> +#define IMX95_PCIE_RST_CTRL			0x3010
> +#define IMX95_PCIE_COLD_RST			BIT(0)
> +
>  #define to_imx_pcie(x)	dev_get_drvdata((x)->dev)
>  
>  enum imx_pcie_variants {
> @@ -773,6 +776,43 @@ static int imx7d_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  	return 0;
>  }
>  
> +static int imx95_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
> +{
> +	u32 val;
> +
> +	if (assert) {
> +		/*
> +		 * From i.MX95 PCIe PHY perspective, the COLD reset toggle
> +		 * should be complete after power-up by the following sequence.
> +		 *                 > 10us(at power-up)
> +		 *                 > 10ns(warm reset)
> +		 *               |<------------>|
> +		 *                ______________
> +		 * phy_reset ____/              \________________
> +		 *                                   ____________
> +		 * ref_clk_en_______________________/
> +		 * Toggle COLD reset aligned with this sequence for i.MX95 PCIe.
> +		 */
> +		regmap_set_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				IMX95_PCIE_COLD_RST);
> +		/*
> +		 * Make sure the write to IMX95_PCIE_RST_CTRL is flushed to the
> +		 * hardware by doing a read. Otherwise, there is no guarantee
> +		 * that the write has reached the hardware before udelay().
> +		 */
> +		regmap_read_bypassed(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				     &val);
> +		udelay(15);
> +		regmap_clear_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				  IMX95_PCIE_COLD_RST);
> +		regmap_read_bypassed(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				     &val);
> +		udelay(10);
> +	}
> +
> +	return 0;
> +}
> +
>  static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
>  {
>  	reset_control_assert(imx_pcie->pciephy_reset);
> @@ -1739,6 +1779,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
>  		.mode_off[0]  = IMX95_PE0_GEN_CTRL_1,
>  		.mode_mask[0] = IMX95_PCIE_DEVICE_TYPE,
> +		.core_reset = imx95_pcie_core_reset,
>  		.init_phy = imx95_pcie_init_phy,
>  	},
>  	[IMX8MQ_EP] = {
> @@ -1792,6 +1833,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.mode_off[0]  = IMX95_PE0_GEN_CTRL_1,
>  		.mode_mask[0] = IMX95_PCIE_DEVICE_TYPE,
>  		.init_phy = imx95_pcie_init_phy,
> +		.core_reset = imx95_pcie_core_reset,
>  		.epc_features = &imx95_pcie_epc_features,
>  		.mode = DW_PCIE_EP_TYPE,
>  	},
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
