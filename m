Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9031DE2B4
	for <imx@lists.linux.dev>; Wed,  2 Apr 2025 07:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577831; cv=none; b=iP3E0R79tIai97Dw11oNDvM4D7P2vQ3UXBgaz6fA8Ln6YYSUIVUIm8YHq3uAz/di2xwZCGwtXL7Hf2+9krrWD78mDy+F6fAfaz6+U4A67z9JFKfA7HE4gPnvwLZwAzC5NZwyGiytP6rPd9wKhXH6o3s950SM9asYO8pyQXzjxB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577831; c=relaxed/simple;
	bh=7ZFduh289kmIv14Cb97BOB2D+kLl6uOqn1YtVHrX7Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3G2E2mc/cjzf9Ysb6qPQ6WbHIKBOGjKJnVEzZI611fJ28QZwlwMpRQHPKVYa6ci+0vJzw9QEwmc1gosOZ7KQoMDRi/BpAFRuU+ae4afVq7iPlG00JOtH4mc9wTLbSSYE+NKHjAWzI2+GsUxL0Krg/hy2NQsx5MmgwzKn8ZmXrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S8DjLrmF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S8DjLrmF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227914acd20so8308105ad.1
        for <imx@lists.linux.dev>; Wed, 02 Apr 2025 00:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743577829; x=1744182629; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zjR4lEGGyx3HdyMesa5h6gRayUig9bsMGHv5vZfbr1E=;
        b=S8DjLrmFe2KXB+jkipyGEFhw353t437SGIO3V1Ds+1IyRmsnRTNThaCAwtx830u3wc
         qFBUFQiEJ2cUGj5MeNAvq3fv+T0bgQkjEMIRU9P4WrsEVFf26St47bpHfiHQ6AE8XDKk
         ekqtJoR7OheqU6YhMtABA7ldotFvYOZs/kat7UOBIfZn+gAR43KhQS8/V/X1P75JEeFk
         YzvOxHiYn8zK24BpDYCZewXE0qR9ADp559QvzS51/F6q951pCpvIvePGGKBR24urb/tj
         hMYx/M8NsO4cWZFnHHlvvA0Li3U9CjMpejl4AiE5d3eKNPhZABRpwIVyiC/0Bgs0xHMe
         YvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577829; x=1744182629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjR4lEGGyx3HdyMesa5h6gRayUig9bsMGHv5vZfbr1E=;
        b=iHYGhi1+/QZpGKchJv0XM8AlMxq+skN9w/PGp/eW8gDXj9oUyzxO8j+U56g/0jQoCX
         En5qHJFDhtOhGogTvUWshF7MGOy8D3WBW3UGnUay5sNiGhBw37xz2/9Aa80mxFtWem5O
         2lu5aKtRKemHlEjTLMVGfG52Ezq4PCno5VQUx+V3tcoAm59WJ7nm9o454vpAFJ8DSIjI
         skBA/67D6RovMpGjw+VRABXKSsPjoyBAIlWW/LVLGE/RS/fLnfdBIg5BvooGBxaD/wFf
         uTr+9jgT9ldXNCS0Scc92U4U5NNH9EA8KW9umUCtzYji94iqfAvfNu6oEzu+NAXgXjUe
         xIlg==
X-Forwarded-Encrypted: i=1; AJvYcCVtd7JxU+fOqqqWu/bJ7g3K0mhOA9i+Gw8hXCFD2BjM1KqaY1kD7ire7+I2Yv/hk37hmc0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmS3skpt2W83O5/HYwD+2Lb6jths50wWwcAr9SvIKD6q1xEFR3
	vvlxhz94kq+dowbAeXwZlz9NGs867MJqI2vZqPfdbQhNHV2PChW0/gveiXdfFQ==
X-Gm-Gg: ASbGnctTk4f5grvNYaHevSPn3h11YY6jfA6JEcOmoenaCSiFpxp63Optfj869X6tzI1
	w1Kr2IUN7FojdXYAGoZdB0WJnvG2wyzY9Crt8Zt13nNRWXfx94hOilj4mIsDhgtL4ju5/KY4tOQ
	53cMqSJWQTkJ75LiXFwyu4lQqsCJt8qebekQaop1CSJ5SyvL1GSkU7rLaK8g/wi2E+Pz3BiPeU0
	9/KGHB1tQbhzfUxlWVHlWn6sXoOq1nrGrjIb/pSlOMYsFWXP87yV2xSKAR6THi3l96V5Qk1/gR7
	Xud4BfREo7Vl6b57XaTMVMfHjGjns5qG8CLyIuMhGCiyaLiz8ES1rG6U
X-Google-Smtp-Source: AGHT+IF2PkfJ6gvdatC+Ohrdk2DCIs4bJ4gvM262TiahqchaDp4ihwwIJoGbKxCJkUgJQO2cM8XLTw==
X-Received: by 2002:a05:6a00:130d:b0:737:cd8:2484 with SMTP id d2e1a72fcca58-739cac57712mr1314725b3a.6.1743577829272;
        Wed, 02 Apr 2025 00:10:29 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710cbd88sm10117652b3a.157.2025.04.02.00.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:28 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:40:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] PCI: imx6: Add PLL clock lock check for i.MX95
 PCIe
Message-ID: <y3ys5ojt3cryklqibg4shznkjqije7bturs5ljkjyzbri5dhgu@jeo2mmyv7sci>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-6-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-6-hongxing.zhu@nxp.com>

On Fri, Mar 28, 2025 at 11:02:12AM +0800, Richard Zhu wrote:
> Add PLL clock lock check for i.MX95 PCIe.
> 

What are the implications of not waiting for PLL lock? I guess clock
instability.

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 28 +++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 35194b543551..40eeb02ffb5d 100644
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
> +		return -ENODEV;

-ETIMEDOUT

- Mani

-- 
மணிவண்ணன் சதாசிவம்
