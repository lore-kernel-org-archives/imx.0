Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D504C3FE31
	for <imx@lists.linux.dev>; Sat, 27 Apr 2024 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714208468; cv=none; b=YoBR5ZW/dVfY0XjwPo5MeeHC1006tVnnV6GWaVMC3/omqJ9fOBcwLTC7h0zJlus7nAFREJjZDgwC7kFiM2dHvjGTV8yo+jP2C1AaqfEmCcTPgohhFBgFvM3Nb0kb58ceqm4D4tezLeMLXY5jRYXaRG5yCWByUr4WvPKhlgM7oeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714208468; c=relaxed/simple;
	bh=QKT7BbT0qdBcKFjzr1eNmhMAp51nbEYUTEgPS9pJd/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmCLRg1spY9O3Qe9+iRUdEPh614K5W0nlQm1AFcJUiJ/5LFLmN9nI74E6A6w0Lo76ZDbVSCB/exCQ8EPmAN+EubHpP9sfcezUF/hWE3+O1bjbJb77v/tb5KQOb6gHO9MlK4Ln+QFW/F1fMOrBjzwGb/KgBVEuoNoPPOCexFQNyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t70e6Kra; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t70e6Kra"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e3ca546d40so24598015ad.3
        for <imx@lists.linux.dev>; Sat, 27 Apr 2024 02:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714208466; x=1714813266; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Vr7JWEB2T4GWYXcygc/EdGZmH7vUwdeKPTcNVaexOg=;
        b=t70e6KrakgLlgg/T0WK9jO7j/OQTcyIgb0C1W2Bfh5k72YSb1Me2I9Ic/uy2iUyl1x
         xU2xgmSd/Io+jojqhuyVtBqSrDKAKN0VguPhUZ0FovLY6m7hu0iPEfhddK5VFHcelZAu
         wGOpGb/aBKw7q79NdlV1nz/3IHmfLxMZAkcf05q7fdHz60xJIZBX93DnBFt4vvHwk4eC
         GykO4Iu5uDJ/ffHMSFxYExItyBOcDelNIBeQEpROpHC3wvicQWuIu/ZSurimg8uplf45
         9BZhZTXuiWzuw9GUS+4WM0nOGMGZq6XJetPLyxx4Pjd7Yhy2QwlpYkd4cWPdskcBp1/j
         paiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714208466; x=1714813266;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Vr7JWEB2T4GWYXcygc/EdGZmH7vUwdeKPTcNVaexOg=;
        b=qWHzQdOyLMYsv1Lcr3kXLBKI2gpAyjrxK6c/nHy220c5APvGTEVpmsEuhkfQHkHPHT
         8y04IBwHfZrVlT0E/YctHISXI9Ejvr8keRogfRnMiD3UNklx5EBf2gyf/nZe1lFOmZSf
         5VaTwc3DajexYyI6tEyyV52qYE/5TaTLVpf+UoCxjMm35fbPDG9DU8vVY4fMLUJB6XAZ
         gsFtamwanB2qxFwve/TjpjFjm2k65/a03fy25dDRHIiiB+9x7VbgWGGiaCGYVCnEXsVS
         NdLcF8LwEejA6C2tKUmzsDCYHZF5+0R27iGnDX1lDmK9hxL2SoeyGodrhWOstP7SZLkc
         BbQA==
X-Forwarded-Encrypted: i=1; AJvYcCWVF6w3qCC88jo/G0iYGesj44fR+t48OYJNc4M8xyhkqTw9cu5WDUd6VNQDmHJJraZcI12wYTM3+CmzkLXEDWh0oW0z
X-Gm-Message-State: AOJu0YzY/qh2AxU4fTcPYNyla07dvwd149FRPI6FHjvEKxh2v4TEy4zz
	3zr9AzPC17I9TQ1+g1BsD55jImhJsBX63mnlWbELIioZDoGSUdArkYqZOV4Wgw==
X-Google-Smtp-Source: AGHT+IHkIXGWPg97/VUL48rQXl/r6tasTmDAIegAIO6ujBMNWegRRUnBy7wEvErIfoXUBhtG5bde6A==
X-Received: by 2002:a17:903:234b:b0:1e7:d482:9e32 with SMTP id c11-20020a170903234b00b001e7d4829e32mr5854001plh.7.1714208465952;
        Sat, 27 Apr 2024 02:01:05 -0700 (PDT)
Received: from thinkpad ([120.60.53.237])
        by smtp.gmail.com with ESMTPSA id h15-20020a170902680f00b001e89e7b2b74sm16138858plk.235.2024.04.27.02.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 02:01:05 -0700 (PDT)
Date: Sat, 27 Apr 2024 14:30:57 +0530
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
Subject: Re: [PATCH v3 01/11] PCI: imx6: Fix PCIe link down when i.MX8MM and
 i.MX8MP PCIe is EP mode
Message-ID: <20240427090057.GF1981@thinkpad>
References: <20240402-pci2_upstream-v3-0-803414bdb430@nxp.com>
 <20240402-pci2_upstream-v3-1-803414bdb430@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240402-pci2_upstream-v3-1-803414bdb430@nxp.com>

On Tue, Apr 02, 2024 at 10:33:37AM -0400, Frank Li wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Both IMX8MM_EP and IMX8MP_EP have the "IMX6_PCIE_FLAG_HAS_APP_RESET"
> set indeed. Otherwise, the LTSSM_EN bit wouldn't be asserted anymore.
> That's the root cause that PCIe link is down when i.MX8MM and i.MX8MP
> PCIe are in the EP mode.
> 

This commit message is difficult to understand. I think the issue you are fixing
is that these 2 SoCs do not control the 'apps_reset', due to which the LTSSM
state is not configured properly.

Referring Link Down is confusing at its best. Is the link training happens first
of all?

- Mani

> Fixes: 0c9651c21f2a ("PCI: imx6: Simplify reset handling by using *_FLAG_HAS_*_RESET")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 99a60270b26cd..e43eda6b33ca7 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1568,7 +1568,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  	},
>  	[IMX8MM_EP] = {
>  		.variant = IMX8MM_EP,
> -		.flags = IMX6_PCIE_FLAG_HAS_PHYDRV,
> +		.flags = IMX6_PCIE_FLAG_HAS_APP_RESET |
> +			 IMX6_PCIE_FLAG_HAS_PHYDRV,
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
>  		.clk_names = imx8mm_clks,
> @@ -1579,7 +1580,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  	},
>  	[IMX8MP_EP] = {
>  		.variant = IMX8MP_EP,
> -		.flags = IMX6_PCIE_FLAG_HAS_PHYDRV,
> +		.flags = IMX6_PCIE_FLAG_HAS_APP_RESET |
> +			 IMX6_PCIE_FLAG_HAS_PHYDRV,
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mp-iomuxc-gpr",
>  		.clk_names = imx8mm_clks,
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
