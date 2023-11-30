Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68039487BC
	for <imx@lists.linux.dev>; Thu, 30 Nov 2023 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VQDRj/0m"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-67a34fbaf12so6519656d6.3
        for <imx@lists.linux.dev>; Thu, 30 Nov 2023 08:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701362783; x=1701967583; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kjHz7y8FdABfzePSYWvG3C7LR0AsyMP0bJ41uTORMXU=;
        b=VQDRj/0mGGVia2Z2v5eLh7AM5TGGlbMdvjqG23SsCZNAxReSZENdtiNkSb8e6d0JDM
         SkhpVVe+8T1vpoZ6Dd/Cya88VI8NeqCJSfVf/MYJstnL83gAF0bqDyoder/ADbeLXhlH
         IE2I1EhkjYLlQ8IRSzbPUrL2wmixDrS18WqjBPnwLht7SIPcrk01rxgGFnllJ1boPdZq
         i6Dx16urcwihtY4SNlu+vliriwyAKpB36S944e22uit8AeVgSiMEXMuc3Gcq4GdExbuP
         EEi6I1gWTQ0Pbxf1+McLBCIoIc5litv4T8k/P9fI270K8Lir7AWMGqiAsfCF6wMlvjXh
         v0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701362783; x=1701967583;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kjHz7y8FdABfzePSYWvG3C7LR0AsyMP0bJ41uTORMXU=;
        b=s1PwN7BAGPrnZpzEuP5z0IqthvHHBzNrQTlrNjxDRR990wBIodJFl4ovGLtghHx4ah
         6m29Bq4Mevj0TkhJDEJa/o7+LeTh5wswJvH4yp/hnEb/FO3TPuFiLfZfGZV/ckqAB/fi
         HJzJJocEcxRRd93j/oXO82vRnANzHJOm+2uFFCI6NCZeHZaRRV3++dJQUTUNb+FHqChK
         VM/qvMsEBI8cXWWby0iXfZs0QDnNIgGrfo5+qhsJVHc1km3+WiDUx8xfSEseN0MIWHH4
         QU5vx1HB/w6KeDul0V4gMyRV93pKNWu9HMoUimKmQlgbsTsrQV8LiXTYIyPdjZPnkowg
         igoA==
X-Gm-Message-State: AOJu0YxM0DRHNrlXW8XIIYLi8eIusv7aWosGBqSigtM9Uei31T6NZWvx
	2iWprNud6ZhNvK32hA90dLWV
X-Google-Smtp-Source: AGHT+IGr+FYWyq9x/hJmkOaCYSyPqI1d2GXxR9QhDtHyNIh5/ut2psmnppxw1XpPHzUoptuB8eT7og==
X-Received: by 2002:a05:6214:cce:b0:67a:1580:d7c3 with SMTP id 14-20020a0562140cce00b0067a1580d7c3mr35231818qvx.58.1701362783244;
        Thu, 30 Nov 2023 08:46:23 -0800 (PST)
Received: from thinkpad ([117.213.102.92])
        by smtp.gmail.com with ESMTPSA id h29-20020a0cab1d000000b0067a2a0b44ddsm650581qvb.44.2023.11.30.08.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 08:46:22 -0800 (PST)
Date: Thu, 30 Nov 2023 22:16:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: bhelgaas@google.com, imx@lists.linux.dev, kw@linux.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	lpieralisi@kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com,
	robh@kernel.org, roy.zang@nxp.com
Subject: Re: [PATCH v4 3/4] PCI: layerscape: Rename pf_* as pf_lut_*
Message-ID: <20231130164612.GU3043@thinkpad>
References: <20231129214412.327633-1-Frank.Li@nxp.com>
 <20231129214412.327633-4-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129214412.327633-4-Frank.Li@nxp.com>

On Wed, Nov 29, 2023 at 04:44:11PM -0500, Frank Li wrote:
> 'pf' and 'lut' is just difference name in difference chips, but basic it is
> a MMIO base address plus an offset.
> 
> Rename it to avoid duplicate pf_* and lut_* in driver.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Can you fix the name in pci-layerscape-ep.c also?

- Mani

> ---
> 
> Notes:
>     pf_lut is better than pf_* or lut* because some chip use 'pf', some chip
>     use 'lut'.
>     
>     change from v1 to v4
>     - new patch at v3
> 
>  drivers/pci/controller/dwc/pci-layerscape.c | 34 ++++++++++-----------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 42bca2c3b5c3e..590e07bb27002 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -44,7 +44,7 @@
>  #define PCIE_IATU_NUM		6
>  
>  struct ls_pcie_drvdata {
> -	const u32 pf_off;
> +	const u32 pf_lut_off;
>  	const struct dw_pcie_host_ops *ops;
>  	int (*exit_from_l2)(struct dw_pcie_rp *pp);
>  	bool scfg_support;
> @@ -54,13 +54,13 @@ struct ls_pcie_drvdata {
>  struct ls_pcie {
>  	struct dw_pcie *pci;
>  	const struct ls_pcie_drvdata *drvdata;
> -	void __iomem *pf_base;
> +	void __iomem *pf_lut_base;
>  	struct regmap *scfg;
>  	int index;
>  	bool big_endian;
>  };
>  
> -#define ls_pcie_pf_readl_addr(addr)	ls_pcie_pf_readl(pcie, addr)
> +#define ls_pcie_pf_lut_readl_addr(addr)	ls_pcie_pf_lut_readl(pcie, addr)
>  #define to_ls_pcie(x)	dev_get_drvdata((x)->dev)
>  
>  static bool ls_pcie_is_bridge(struct ls_pcie *pcie)
> @@ -101,20 +101,20 @@ static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
>  	iowrite32(PCIE_ABSERR_SETTING, pci->dbi_base + PCIE_ABSERR);
>  }
>  
> -static u32 ls_pcie_pf_readl(struct ls_pcie *pcie, u32 off)
> +static u32 ls_pcie_pf_lut_readl(struct ls_pcie *pcie, u32 off)
>  {
>  	if (pcie->big_endian)
> -		return ioread32be(pcie->pf_base + off);
> +		return ioread32be(pcie->pf_lut_base + off);
>  
> -	return ioread32(pcie->pf_base + off);
> +	return ioread32(pcie->pf_lut_base + off);
>  }
>  
> -static void ls_pcie_pf_writel(struct ls_pcie *pcie, u32 off, u32 val)
> +static void ls_pcie_pf_lut_writel(struct ls_pcie *pcie, u32 off, u32 val)
>  {
>  	if (pcie->big_endian)
> -		iowrite32be(val, pcie->pf_base + off);
> +		iowrite32be(val, pcie->pf_lut_base + off);
>  	else
> -		iowrite32(val, pcie->pf_base + off);
> +		iowrite32(val, pcie->pf_lut_base + off);
>  }
>  
>  static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> @@ -124,11 +124,11 @@ static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
>  	u32 val;
>  	int ret;
>  
> -	val = ls_pcie_pf_readl(pcie, LS_PCIE_PF_MCR);
> +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_PF_MCR);
>  	val |= PF_MCR_PTOMR;
> -	ls_pcie_pf_writel(pcie, LS_PCIE_PF_MCR, val);
> +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_PF_MCR, val);
>  
> -	ret = readx_poll_timeout(ls_pcie_pf_readl_addr, LS_PCIE_PF_MCR,
> +	ret = readx_poll_timeout(ls_pcie_pf_lut_readl_addr, LS_PCIE_PF_MCR,
>  				 val, !(val & PF_MCR_PTOMR),
>  				 PCIE_PME_TO_L2_TIMEOUT_US/10,
>  				 PCIE_PME_TO_L2_TIMEOUT_US);
> @@ -147,15 +147,15 @@ static int ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
>  	 * Set PF_MCR_EXL2S bit in LS_PCIE_PF_MCR register for the link
>  	 * to exit L2 state.
>  	 */
> -	val = ls_pcie_pf_readl(pcie, LS_PCIE_PF_MCR);
> +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_PF_MCR);
>  	val |= PF_MCR_EXL2S;
> -	ls_pcie_pf_writel(pcie, LS_PCIE_PF_MCR, val);
> +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_PF_MCR, val);
>  
>  	/*
>  	 * L2 exit timeout of 10ms is not defined in the specifications,
>  	 * it was chosen based on empirical observations.
>  	 */
> -	ret = readx_poll_timeout(ls_pcie_pf_readl_addr, LS_PCIE_PF_MCR,
> +	ret = readx_poll_timeout(ls_pcie_pf_lut_readl_addr, LS_PCIE_PF_MCR,
>  				 val, !(val & PF_MCR_EXL2S),
>  				 1000,
>  				 10000);
> @@ -243,7 +243,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
>  };
>  
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
> -	.pf_off = 0xc0000,
> +	.pf_lut_off = 0xc0000,
>  	.pm_support = true,
>  	.exit_from_l2 = ls_pcie_exit_from_l2,
>  };
> @@ -293,7 +293,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  
>  	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
>  
> -	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
> +	pcie->pf_lut_base = pci->dbi_base + pcie->drvdata->pf_lut_off;
>  
>  	if (pcie->drvdata->scfg_support) {
>  		pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
