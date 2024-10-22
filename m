Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912031BD4E2
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729617668; cv=none; b=MxwqBv+FwkGPNgYYi9zlQWE/BVhqy3DVR2RuhJlyBLsR5FlB3CRa4U12lVboUw0EZ2EFYE9HjdTDDUqUU+iMMAe6G5ayGiqQdpOJsuGzJvIEoFrSbWNvvSsl2oDBwDEXQH5UYm9Vk8lrRbDCne3ypULJAeIAkjeFpairXuuDoSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729617668; c=relaxed/simple;
	bh=ROz6wyxkN00RlAqx/HywNHHOFDd4bvEy70xBiafp8II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4qxiVbEuAfnTV/SeU79HD8ZPa9U6D6myeUPO4oahI9L8ISA8V29nzcI5F2N+0G7Lzb0ACDLVqx3UVoRHqalWGz9UVmtbV3RZbcrRG8WDVH9CsLdKtR3B60xVSjKW06/lh5zJVC/guvXsH3tzZCCNkqoLRhH/VMGLslADz04LvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rPQ2J73O; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rPQ2J73O"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20bb39d97d1so55074515ad.2
        for <imx@lists.linux.dev>; Tue, 22 Oct 2024 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729617666; x=1730222466; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EYyTRaKGn0PVJQtdVRYtFHSxQ4TFBsfP/i6X4tjAirc=;
        b=rPQ2J73OX5tAnjoagAsfQcEdVNZ/i8TqPvWWMIeqY3dVGqOq3sE5fRO5FnXQfo09ax
         5hAW/8dEb3J2jDhch2hox3/dFnqSH0RKl6JYPlXWHnt0VeduAClbpyHRYExH7YFXuj7s
         yvz5hA9kaQF0M3Bogtw5j9SaWDXyFu96KXoulpp+6dtu6lWJfGHjq7qSZnQ2szsN6EqB
         QaHQrjajYyft6HDJa+fpKoJRO0cfcADtoHDEb4e4QG8IMKf6k5pQ5BJ6yAQsCfk1GOrS
         NmnIFJcvZW/alTBvJR6qXPcOtjNg5l/qt9xGlWcXi6QT+J39ShWyAiu4cD0V01oKw8xl
         Sftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729617666; x=1730222466;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EYyTRaKGn0PVJQtdVRYtFHSxQ4TFBsfP/i6X4tjAirc=;
        b=f4qBs6GsZbIbejO78z3DXCBs6x4sBbsMNzAivllXABQ0xqHBp/iWNOybNJ3bQQ31Y0
         1ZSRRcGRop97hrpV9ViyuRY4ITTsBo1xyq7xtKGQi+OKuelZzqwa6+CVy8/LVfoFVXHz
         DdCun+pbCljs2tcyf0hgM2gUhjYhtqTci40Hy/ecA44yeOpOWKOU6QYcUPRQI4V5Og0A
         BJqBxZ00GmH9VFqWdU9rVAKPkpjQwbLNQ7GL6ilJ9/qfGjgY2uQ/KW1ZnciRQ9F/YoGB
         9jdiS2ZIDyIE5nTzhYxP24EulUXQJoAI+TNa06OpSvqg8FJ33giw5boRDeiaH3MaVTH2
         t+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeRVwN6NI326WkaM3Let7fVfu+9BfS8xuRt+R9xOlgq+43k5hG7DEw7S9vi/+tBh8fvHI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaBoLF1gikT6xykxrtae4EZzQP05jviKIfPzIcdpqVvvY1L7FC
	uKsOwznwvuCGUFz0pOFSGAXYB07lU8lvbrT4/Ex9cCSghJohrdX5bajuo6+cTQ==
X-Google-Smtp-Source: AGHT+IEFhMlMl+SifAdPrVg99u83uazLX/A9KcHRvv7Tuv35akUo2976i/YilQVOuBqYd19nUmnDHQ==
X-Received: by 2002:a17:902:da85:b0:20b:6f04:486f with SMTP id d9443c01a7336-20e9489afa8mr44178795ad.18.1729617666017;
        Tue, 22 Oct 2024 10:21:06 -0700 (PDT)
Received: from thinkpad ([36.255.17.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eeef535sm45591245ad.44.2024.10.22.10.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 10:21:05 -0700 (PDT)
Date: Tue, 22 Oct 2024 22:50:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: kw@linux.com, bhelgaas@google.com, lpieralisi@kernel.org,
	frank.li@nxp.com, l.stach@pengutronix.de, robh+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, festevam@gmail.com,
	s.hauer@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 9/9] arm64: dts: imx95: Add ref clock for i.MX95 PCIe
Message-ID: <20241022172059.wuw5xel7m4vobarq@thinkpad>
References: <1728981213-8771-1-git-send-email-hongxing.zhu@nxp.com>
 <1728981213-8771-10-git-send-email-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1728981213-8771-10-git-send-email-hongxing.zhu@nxp.com>

On Tue, Oct 15, 2024 at 04:33:33PM +0800, Richard Zhu wrote:
> Add ref clock for i.MX95 PCIe.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 03661e76550f..5cb504b5f851 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1473,6 +1473,14 @@ smmu: iommu@490d0000 {
>  			};
>  		};
>  
> +		hsio_blk_ctl: syscon@4c0100c0 {
> +			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
> +			reg = <0x0 0x4c0100c0 0x0 0x4>;
> +			#clock-cells = <1>;
> +			clocks = <&dummy>;
> +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +		};

This is an internal reference clock, right? Please mention it in patch
description since the controller supports external reference clock also.

- Mani

> +
>  		pcie0: pcie@4c300000 {
>  			compatible = "fsl,imx95-pcie";
>  			reg = <0 0x4c300000 0 0x10000>,
> @@ -1500,8 +1508,9 @@ pcie0: pcie@4c300000 {
>  			clocks = <&scmi_clk IMX95_CLK_HSIO>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> -				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> -			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> +				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> +				 <&hsio_blk_ctl 0>;
> +			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
>  			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
>  					 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> @@ -1528,8 +1537,9 @@ pcie0_ep: pcie-ep@4c300000 {
>  			clocks = <&scmi_clk IMX95_CLK_HSIO>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> -				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> -			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> +				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> +				 <&hsio_blk_ctl 0>;
> +			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
>  			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
>  					 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
