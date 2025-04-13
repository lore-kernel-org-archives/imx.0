Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF1F1A9B3D
	for <imx@lists.linux.dev>; Sun, 13 Apr 2025 15:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744558417; cv=none; b=WBNB6C/3mwe4iFcZyZFaacAyuGVAR4x9EJMqTA9lVDSfuYAXzDbrtkyYqhXhi5RjZASstewZTsYgJPqzayJqPei+ZZiWxAK6I8+k6F9Obb2QYUGIen3omxZE8ZnXjIywHDYz1L4bxGC8ATjQutWNafqDeqtcWGUH63TYmvwT4ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744558417; c=relaxed/simple;
	bh=QkQ35FzU1yifEsiO2de7qOQR7aY4ClASH7PHwPz5MAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L64eXDvnR3GBOzyYtOFLM2t6kJliA6kPlewquKjimnITU2oHEOD+E9u84LPLkGv+YDPO/XJqQTtk/zh4FoiXHBYKGpgSHB0kB5Q1PMA9l2Ly6iB027b8SWJQiXH594BbDMec1Cg3W0LYpjdynrepWIZw0XsvYiY6Gs3EKgGM8PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EwL18Ck9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EwL18Ck9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739525d4e12so3074705b3a.3
        for <imx@lists.linux.dev>; Sun, 13 Apr 2025 08:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744558415; x=1745163215; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y72/tqUmhTX4OF/q+yEQ8DxW/l3SBJIjmbILZthaGB8=;
        b=EwL18Ck9I8m4fe6H+0OuopFrsYMggmsSJNYhQF3Q5RW5+BFlfTbNbphW0Pfne6WPh0
         CviSWr2NARSdpwaDcuF/h7jaesvtCyDJwmR7XZ+ynQbsLMgmPuO+TypZV9VUcfJCsF24
         Wd8MSwO2GDMiDSIRethwxM5DziI1Q6LMKxqmuXPZGrYLXDncBeeOnswqNVGxcUwpj2kc
         T2P4PUj4nknAJySHemBnDOet6Pr35iIVywQ4Xb7Aerl0F0ktJI1phNM1mmWen7fbcszG
         cwwIAm5wSjlYzOyQoo2vtNQ4QqTC9h2jq2O53nYas5TKoPlOyOvmlJYGVZDWVLUICCY3
         2uiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744558415; x=1745163215;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y72/tqUmhTX4OF/q+yEQ8DxW/l3SBJIjmbILZthaGB8=;
        b=T/lKOqUCYDZpjLDWkwGEbgSC93DmU9WVysnWMo5LJAysLcxsSS/hGr7kqrEp1AX8LD
         Y44CzeycDAqcXFki8iwhyd2ZNwpkUPDR1pmOZ8dp9i4HwO69bkmS5YqCitaCb8kgdDxS
         drCUrWYAkTZowm/IDikr2UTl+QkpoGj/vGj26oebCILLmADVXPlS52NWZb26TpXjKH3M
         rwZiogI/akGNSvfXbJ+VPY9KZ6U5f/+NOWno0Ut9sAI4ASavsnmR6XmrQroyz09Ot7AV
         xBn3mSQbAnMOhOQrrTSikiFqWMLgrGlE2IUdJsDfW25Odq+1Xtxwx0Z0xPefMFqueEXE
         JbKw==
X-Forwarded-Encrypted: i=1; AJvYcCVwHZ05q81VIwI43Oew2TMA8Ev3Q/aRlIxapkXWnKHd6BqdO5qit956OIL1FLl4bL9PDU4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfzmqoksrA8qoX7TOO9qMAhP0tuxIMD/BnrEne2eO00B4GlpnQ
	WHwGeBleWU4GqJexk/4dOmD2pMCzhG+3aw5JwzPiS2P+AHK2Se9M0btP/VLk5A==
X-Gm-Gg: ASbGncsThYLSUbn4ylwLCFWZni6b21foi2eCODnz7gNKNI534kx2gOf2xziDrSXnrPU
	uSlrSbY1ItbIwfrHWiZrZJv0xhPEiMn99BOzdHMeSQ87GFo/lu9UfpCHEVRcU0loRD/EcusePTo
	7uEuxUlI/QXZ4L0hCqmJnDtzoTJH9/spopQ1wkyNyO5JyuxBmuPQ2ON1+xrB9WBQTEvsiYegadV
	5ugUaljZfKUbrKHqhZgBk10ZHzn+PN9dtB7yJw2JXddS2NBoI6ibSunyPV+eNboupgNzSYpLiuc
	iKXl/6C57/f5Gh3Kz+hYuuocuaSYm19txbEBq8Tv40yPE34pbHUj
X-Google-Smtp-Source: AGHT+IGvabAafKDG9hWtMQ/mt33loVlPQcrjfAy+WuQVWFVLw+b1d0XyCzCWqgYy+BHZJDGXRxcaiA==
X-Received: by 2002:a05:6a00:a89:b0:730:4c55:4fdf with SMTP id d2e1a72fcca58-73bd11e6d55mr12724724b3a.7.1744558415257;
        Sun, 13 Apr 2025 08:33:35 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f883asm5237044b3a.107.2025.04.13.08.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 08:33:34 -0700 (PDT)
Date: Sun, 13 Apr 2025 21:03:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/7] PCI: imx6: Add PLL clock lock check for i.MX95
 PCIe
Message-ID: <uqrhqkmtp4yudmt4ys635vg3gh5sibhevu7gjtbbbizuheuk45@lhxywqhtbpak>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-7-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408025930.1863551-7-hongxing.zhu@nxp.com>

On Tue, Apr 08, 2025 at 10:59:29AM +0800, Richard Zhu wrote:
> Add PLL clock lock check for i.MX95 PCIe.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 28 +++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 7dcc9d88740d..c1d128ec255d 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -45,6 +45,9 @@
>  #define IMX95_PCIE_PHY_GEN_CTRL			0x0
>  #define IMX95_PCIE_REF_USE_PAD			BIT(17)
>  
> +#define IMX95_PCIE_PHY_MPLLA_CTRL		0x10
> +#define IMX95_PCIE_PHY_MPLL_STATE		BIT(30)
> +
>  #define IMX95_PCIE_SS_RW_REG_0			0xf0
>  #define IMX95_PCIE_REF_CLKEN			BIT(23)
>  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
> @@ -479,6 +482,23 @@ static void imx7d_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
>  		dev_err(dev, "PCIe PLL lock timeout\n");
>  }
>  
> +static int imx95_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
> +{
> +	u32 val;
> +	struct device *dev = imx_pcie->pci->dev;
> +
> +	if (regmap_read_poll_timeout(imx_pcie->iomuxc_gpr,
> +				     IMX95_PCIE_PHY_MPLLA_CTRL, val,
> +				     val & IMX95_PCIE_PHY_MPLL_STATE,
> +				     PHY_PLL_LOCK_WAIT_USLEEP_MAX,
> +				     PHY_PLL_LOCK_WAIT_TIMEOUT)) {
> +		dev_err(dev, "PCIe PLL lock timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_setup_phy_mpll(struct imx_pcie *imx_pcie)
>  {
>  	unsigned long phy_rate = 0;
> @@ -824,6 +844,8 @@ static int imx95_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  		regmap_read_bypassed(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
>  				     &val);
>  		udelay(10);
> +	} else {
> +		return imx95_pcie_wait_for_phy_pll_lock(imx_pcie);

Is this PLL lock related to COLD_RESET? It doesn't look like it. If unrelated,
it should be called wherever required. imx95_pcie_core_reset() is supposed to
only assert/deassert the COLD_RESET.

If related, please explain how.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
