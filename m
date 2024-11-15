Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C647523A
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 07:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731654978; cv=none; b=usFB2m3p6QZrjOgSaYmgocvRB6wloDD33ZR+oqZepsB98nP0t92eqIfcGfVp1K58DVi74/SbKj9Uv70/mTvTDIPZhiq4uD12rlQz4RkCwubwg7ibGBBuYgpMz82S0Q6wAI+57rrlnk4iMWdd4I09OsGt4JewkcWLBdhUqzC3APs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731654978; c=relaxed/simple;
	bh=/BFAzfbNwNggHRas2O0NhAg3XSMOblIbua33XQGyfkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2WDygNK0G+iEyZZrMMBHqy0IXVnJlW/NQbUaREqxoN+5bR9pD+awNZlacV+gGntZTypvrcV4mW3nKChmvLrtlBIy1hBYwMevaC6weRLX/UGxRGRg+4fGEK577F+bnVOP0JXjSJWNb7CBPgIur6i51wyA0qdQbW43Z8/7ASonaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AQyHmBNN; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQyHmBNN"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-72475e29578so372646b3a.3
        for <imx@lists.linux.dev>; Thu, 14 Nov 2024 23:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731654976; x=1732259776; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LiTwGr+7x8eq6OawzeIifFURDeSsU/2WLtRWg3Kwch8=;
        b=AQyHmBNNfEneYW4fTzv4I/W7SECTHlnyDyGgCiHq4qSCGGJ2Hvql19u52KAt+gq52n
         GgrFglYSTA8EK4+9ZKjM4016PrH04aSreBWrUIye2bwF0c404kX1dq1tuOc9+FbJnVHW
         aQLj9p38U1tXEGThRfR9WeySCE5a/d/WBkZE8J7uegTKSCJ+mqAqoW4qjkGby8y2BHVK
         952ZZO0HZYI0vSeW42/uKGi/ZO/Ij7OZSir1iD2i/4ME+by/G/cJdg3TL+NR6DQuMSS8
         k6h3vK/IlQRMO5NE1NnVkmDmbhYBtUal0pFACCgBOLrgMGIrSQghLSiDubBGI9BG6MN1
         U9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731654976; x=1732259776;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LiTwGr+7x8eq6OawzeIifFURDeSsU/2WLtRWg3Kwch8=;
        b=hS2VyjKuN6LQiyvOFmyK5qv0ljqy+hAUp3mN9bgG34vwXDZSAeENf3zRyRBMTIsz5t
         N0Iz4BuqrdfPJInz6uFnUIwCqngbz7WFfjjmzAe7AKzdlN+XF50uLHKFB9ft8/8SbWq/
         xw04H4Rww6NvGyLXYI9xqmrQ5VDWpdXIl83ZayKRc+Of71AahuE5JsVAeK3QKU58DvIk
         TZYnuT15CS6bhOv13P8LrC6QQaU72RKCMa8wrHt6w9jWAajBzJgKmfGe3L1nvZboCVpz
         TkiNei+XTVF6UEr2GrobjVU3ivwqMUqpEmWb8noGec2rvYz4D2vzp6VaF0aRDTvXkXnD
         hrAA==
X-Forwarded-Encrypted: i=1; AJvYcCX1QfeINwzeLCiA6NM9mwGaGa5oS3MJQSORU9vRvylpaVQNNANn0h3wPCx914x1jla8XC4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm9K3ZmXMsu4aPcDBEOKtylnF5ghCEeycjynMBQBDdouJsWYMF
	iQdmZBLhNZtmxs10oEBxqJJcLYg52RWryc9yehZcaKsdlY7moW64PXHxpr90+w==
X-Google-Smtp-Source: AGHT+IFUGFVKPN4BKyWiSKTekpGzXkV6s3Ozr7ZGuoQIwQMzFc7uRDlF/nAJCTwPmnCNLPy5shFpNg==
X-Received: by 2002:a05:6a00:c91:b0:71e:693c:107c with SMTP id d2e1a72fcca58-72476baf03bmr2003025b3a.11.1731654975730;
        Thu, 14 Nov 2024 23:16:15 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770ee9dfsm718640b3a.9.2024.11.14.23.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 23:16:15 -0800 (PST)
Date: Fri, 15 Nov 2024 12:46:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/10] arm64: dts: imx95: Add ref clock for i.MX95 PCIe
Message-ID: <20241115071605.qwy4hfqmrnaknokl@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-11-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-11-hongxing.zhu@nxp.com>

On Fri, Nov 01, 2024 at 03:06:10PM +0800, Richard Zhu wrote:
> Add ref clock for i.MX95 PCIe here, when the internal PLL is used as
> PCIe reference clock.
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

What does this 'dummy' clock do? Looks like it doesn't have a frequency at all.
Is bootloader updating it? But the name looks wierd.

- Mani

> +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +		};
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
