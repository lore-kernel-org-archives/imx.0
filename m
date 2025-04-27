Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC6D250C16
	for <imx@lists.linux.dev>; Sun, 27 Apr 2025 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745752818; cv=none; b=l93CY0LLEYYJTMxHhETCn6Ki1APhfHvWvG9ezCph9uliWY0rvwt9GcHexhqF0OeDBLxi5SP3H3txHBjCNZjAknikBF+43z1Mj4vVs8E1tP6ymwGsVIDg1OH8u6cRvEFwhXzNA9HBfGfr60hoefvssRLeOi4jzD6iF8oOlGRvSFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745752818; c=relaxed/simple;
	bh=l+r6gW/k4AiLNiqCdXWLcYbQjOS4aPFNelQN+qJ9t9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9J8DGZdDr6kgCnsQZW2Aypdc7d5b5LWT64/TalZBqEZIX6YaX624WWeUjuIAWVavBwZfQ4HTLBuvB4Cy4bDDVlt7HOgv8RW58/uwEVNO1tLZlfTQgBR24uGmHoXNagTWbbzpWakWPM7JI6e+zMOEBFEQGvQ99S5oop79q2sFGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CkhOUBic; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CkhOUBic"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736b98acaadso3617133b3a.1
        for <imx@lists.linux.dev>; Sun, 27 Apr 2025 04:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745752814; x=1746357614; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8PIzBYTDnuUJNOzFhZUf8k7SMLmkkalf0cCtjYXloU=;
        b=CkhOUBic4xXQuCExNrM3Bv06Pe8SJK6uIbpqhu0PrYJtgyHC+sW+V46lXfTC5AK1IM
         BzDOBIa4p6lO92LTYY68SD5/hKv1EU2lPNTUo2Z2hPEUJMesJ17rBG4tdGseYeOonY2w
         NXiEXWBeK8suTlZozPmnLzlYo2M2pWC29SG82gLRTIE1NCZKWbr+v+BXnbp4/qsEqEZz
         P5RC2MHvX2TNxBmOhs9vaLH9f7nj/UQ+K0svdf3OH0xxlLQQYxtmiwSZB3DCEvtoa+xY
         AptnJeJyKq1aR2IIdZgo89e11Pq/1XlmGb6LOmSeB8LGYQt36K6akADvZ+zeoHJT57L7
         n70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745752814; x=1746357614;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8PIzBYTDnuUJNOzFhZUf8k7SMLmkkalf0cCtjYXloU=;
        b=d5iOYpovtWoQP3+FV38jMCvrvXiv9+5zFghkTf2jmwFxmfLlbgXw/VoziUMdshozll
         caYZnuhLxqQop2H//iyiDPIdrPdIQpoVTpNQer5nXaIrbsm9jPp4IYc6K6TILP6U4DCg
         Tgt2zD73iV9+FtlJqQDfCr32hT4olKrJEgiVG8jIpWMEUCYdVLSM5VZ6RozP4slDKKKU
         bG/qmPf4Cyv8sy3y6uu003Q04LTcWVIs34FL7dBLBcvaRzdb84lb+Hb3dU4qO4jrfSFD
         USQeHW8Vcmx9px2mXGBDPLDp3OyyFs8usQCZEcaAzvCjE3MEl1Wf/AWRy02lFlE/KfBs
         /wdw==
X-Forwarded-Encrypted: i=1; AJvYcCWBc744uHDpwAcsOHFyAapnL+Cz2MegGhpeonHs7e+pfRblQJEv4vMoou7BbtXhcGC8l8s=@lists.linux.dev
X-Gm-Message-State: AOJu0YydFVviVHvsrpmETM29kBr8Sn2+vpGvWz12MBbhvo2K/Nh9C2lH
	/OWSr8Unl6jTp9Q7uUgbW6IQOHNFU7BOzl+f3658Kwyd2wZRVG5fp0/GdPe5Kw==
X-Gm-Gg: ASbGnct7vYQQla/Y0LRLxRRCHbHdWjtGPJmzHZ4K+TyrrmMV/uS45GBGGJCetjNal5F
	XPg6iQtd2QvWSdUiCZeXWGpQ5ENAfKiXlCBRrm2xvnU/7yzX0MwBB0vEXHyNkcKiW8qU7yHWP5J
	uDlN39Ic0B3BzuJPRfMfVPZnM+J7P4L+b6rLVbgUY9RfPUbAUaUt5WFbuMXX5TLSgc30Q4VP+lz
	dj8Qyw49QPzKmMFyEDVVpDS2dxFlAX4xXtoFNdt4FjC6nkvd6YaFY1IJe6Zh3HakqIECTmKMb2O
	XsBSafNTA0mgGcAb+SyG7VsHoMC41+mc04Q3z4ELxef37PKyqd9j
X-Google-Smtp-Source: AGHT+IFv79IfZh1GxCFHYniWlVSDWEu/6IbqRbKPw+om4ozt3ytyq0VaNeh7LhP4FfVYP6Dn5aHP7g==
X-Received: by 2002:a05:6a00:2da6:b0:73c:3060:d53 with SMTP id d2e1a72fcca58-73fd8b6bc26mr10692158b3a.18.1745752813817;
        Sun, 27 Apr 2025 04:20:13 -0700 (PDT)
Received: from thinkpad ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a17csm6054959b3a.111.2025.04.27.04.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:20:13 -0700 (PDT)
Date: Sun, 27 Apr 2025 16:50:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v6 6/7] PCI: imx6: Add PLL clock lock check for
 i.MX95 PCIe
Message-ID: <fnaivdfzjrzcivpegdozhp5i4cjqehze5smp23xiwktce7x4a2@2ryfqsuyvfec>
References: <20250416081314.3929794-1-hongxing.zhu@nxp.com>
 <20250416081314.3929794-7-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416081314.3929794-7-hongxing.zhu@nxp.com>

On Wed, Apr 16, 2025 at 04:13:13PM +0800, Richard Zhu wrote:
> Add PLL clock lock check for i.MX95 PCIe.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One comment below. But I'll fix it up while applying.

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 29 +++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 7dcc9d88740d..4cff66794990 100644
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
> @@ -132,6 +135,7 @@ struct imx_pcie_drvdata {
>  	int (*init_phy)(struct imx_pcie *pcie);
>  	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
>  	int (*core_reset)(struct imx_pcie *pcie, bool assert);
> +	int (*wait_pll_lock)(struct imx_pcie *pcie);
>  	const struct dw_pcie_host_ops *ops;
>  };
>  
> @@ -479,6 +483,23 @@ static void imx7d_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
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
> @@ -1225,6 +1246,12 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  		goto err_phy_off;
>  	}
>  
> +	if (imx_pcie->drvdata->wait_pll_lock) {
> +		ret = imx_pcie->drvdata->wait_pll_lock(imx_pcie);
> +		if (ret < 0)
> +			goto err_phy_off;

You should also assert core reset in the error path.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
