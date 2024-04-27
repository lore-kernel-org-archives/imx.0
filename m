Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EFF47F5B
	for <imx@lists.linux.dev>; Sat, 27 Apr 2024 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714211697; cv=none; b=aDE83sQ6MCezu1L7Rf1m/MKs5CD27UfT/LI2Cfn09Foc2fn6O8OJrjcyu3rfmgnBMEBKLr9OHJEyrV+5tKKXmIyU+bDtAvwHku9K4BEWroDxDzkdwR2v7YL2X/i0FdLOWp+XAhIpkQ7bmKphRzm50LEr8hba3gX3eXuxeoxRHbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714211697; c=relaxed/simple;
	bh=oAKyMTR8eWOSyqxbhlem5MYmleLa9lzfZXEEcetSXnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJbHcYcYV1U7Tn+duHY3qE/vyHE4G+xPK73DIjs/d74tYBmXM8uWt3e8dqK42PbB9QvjX8bTMfQdGV24gqP2GWdTH8Oi7GYYBIA5QQQLz/jaNf6bcwmkAvk9HI8253WEejgiv8M70TN3Y/HKxb6h/mqy62UM0dQ6jXlzG+S3oOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TsLTW4P+; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TsLTW4P+"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2b07f6b38daso905892a91.1
        for <imx@lists.linux.dev>; Sat, 27 Apr 2024 02:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714211694; x=1714816494; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7IJCY5rJWmDi7bRkGY/6TU0zJug2sXYMpCIYdgYukw=;
        b=TsLTW4P+P0Ytrz5e97Y+O1faHYJJof0GYVruun5v54ACiqLshGs+a1pNERk+qNnAcI
         DWVrB42cjTQ0KRslk9Lx5Of6oNHWSzuEze7ESDjySVv4pfhhQ4patSsz2GLkUKW+8vlc
         gmnx+XeqAcw2C1neIC7A5E8fYx3mJ2zCMA6Lzpc8Pbkkk9qo6CUrQWqyOEv25w34lqqP
         ek3iEohQsqT3iK+3/RYwxiIZpB6d31j3ZEnSazanyXFhrifgXpvnfFDoSk4FyvhrJzSE
         G9izXLT9/d/pfqZpCgCFqUm+gcbcQ2/foUTRV/ruNx4s7O9BpjPNo/XOxXRxfEpIliyH
         p19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714211694; x=1714816494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7IJCY5rJWmDi7bRkGY/6TU0zJug2sXYMpCIYdgYukw=;
        b=f1ltJQ2ElLrLCLhMfkTe2Re4f+zbrSB1Ac1YfYhUbMGp6qYihVDwxpQYbd0uxNnCiM
         4ecgeFsVqxAhz8VZfBD8fKZcnfp4eeAp+mbO62SQaSTHDWGXQdBgSrLVG+Tet9xnmomO
         eYbACMAeXc7BHp+RB6X6Us6T1h9tnjNmdZYl7rDppzqE+qapYEuIrMnKLkFGQYrr6AOs
         6xdhXXZw87l9YnGjbEck7FnedBErKne96h4T5AqlZqRCAVczsBGKQukW3/jUK5gMa4v9
         vAZifV28wZ4F6yeY0afV5/FQ02JCvz0J+oSJOj5pbuzkfVBud59FvVQ1DClm8uEfU+Og
         0P3g==
X-Forwarded-Encrypted: i=1; AJvYcCUi4GjLAmwnI2pX0ArQPxhmZkAuSUz2iFyacEyRb6Xw7LBdfanIk6i6e5Jdbb5wqVmThrLykV1LbDPJW7JdRYGgZ5HA
X-Gm-Message-State: AOJu0YzHBPM3IupHRX8/1gg6s9nDaEKwa/tE7M8v/ewkH/dUyhyhEqFO
	Yv4Sc3rwvftsVmD7QcBfIejSJuknH+So4vAaJzWNC/qi7cREKJ29CPQtNjVY0w==
X-Google-Smtp-Source: AGHT+IHbaVLmro9zr9PHmAJzQU4EgUaA+TXAd31urwcQTwZNnANEbssC6ijmrdtMi2g14n+SXgcytg==
X-Received: by 2002:a17:90b:246:b0:2aa:cadb:d290 with SMTP id fz6-20020a17090b024600b002aacadbd290mr7383922pjb.13.1714211694536;
        Sat, 27 Apr 2024 02:54:54 -0700 (PDT)
Received: from thinkpad ([117.213.97.210])
        by smtp.gmail.com with ESMTPSA id y10-20020a17090ad70a00b002a63e966fd7sm15753781pju.47.2024.04.27.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 02:54:54 -0700 (PDT)
Date: Sat, 27 Apr 2024 15:24:44 +0530
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
Subject: Re: [PATCH v3 06/11] PCI: imx: Simplify switch-case logic by involve
 set_ref_clk callback
Message-ID: <20240427095444.GK1981@thinkpad>
References: <20240402-pci2_upstream-v3-0-803414bdb430@nxp.com>
 <20240402-pci2_upstream-v3-6-803414bdb430@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240402-pci2_upstream-v3-6-803414bdb430@nxp.com>

On Tue, Apr 02, 2024 at 10:33:42AM -0400, Frank Li wrote:

PCI: imx6: Introduce SoC specific callbacks for controlling REFCLK

> Instead of using the switch case statement to enable/disable the reference
> clock handled by this driver itself, let's introduce a new callback
> set_ref_clk() and define it for platforms that require it. This simplifies
> the code.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-imx.c | 119 ++++++++++++++++------------------
>  1 file changed, 55 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-imx.c b/drivers/pci/controller/dwc/pcie-imx.c
> index e93070d60df52..77dae5c3f7057 100644
> --- a/drivers/pci/controller/dwc/pcie-imx.c
> +++ b/drivers/pci/controller/dwc/pcie-imx.c
> @@ -103,6 +103,7 @@ struct imx_pcie_drvdata {
>  	const u32 mode_mask[IMX_PCIE_MAX_INSTANCES];
>  	const struct pci_epc_features *epc_features;
>  	int (*init_phy)(struct imx_pcie *pcie);
> +	int (*set_ref_clk)(struct imx_pcie *pcie, bool enable);
>  };
>  
>  struct imx_pcie {
> @@ -585,77 +586,54 @@ static int imx_pcie_attach_pd(struct device *dev)
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
> -		 * the async reset input need ref clock to sync internally,
> -		 * when the ref clock comes after reset, internal synced
> -		 * reset time is too short, cannot meet the requirement.
> -		 * add one ~10us delay here.
> +		 * the async reset input need ref clock to sync internally, when the ref clock comes
> +		 * after reset, internal synced reset time is too short, cannot meet the
> +		 * requirement.add one ~10us delay here.

Please wrap the comments to 80 column width.

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
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, offset, IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE,
> +			   enable ? 0 : IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE);
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, offset, IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN,
> +			   enable ? IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN :  0);

Extra space after :

> +	return 0;
> +}
> +
> +static int imx7d_pcie_set_ref_clk(struct imx_pcie *imx_pcie, bool enable)
> +{
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12, IMX7D_GPR12_PCIE_PHY_REFCLK_SEL,
> +			    enable ? 0 : IMX7D_GPR12_PCIE_PHY_REFCLK_SEL);
> +	return 0;
>  }
>  
>  static int imx_pcie_clk_enable(struct imx_pcie *imx_pcie)
> @@ -668,10 +646,12 @@ static int imx_pcie_clk_enable(struct imx_pcie *imx_pcie)
>  	if (ret)
>  		return ret;
>  
> -	ret = imx_pcie_enable_ref_clk(imx_pcie);
> -	if (ret) {
> -		dev_err(dev, "unable to enable pcie ref clock\n");
> -		goto err_ref_clk;
> +	if (imx_pcie->drvdata->set_ref_clk) {
> +		ret = imx_pcie->drvdata->set_ref_clk(imx_pcie, true);
> +		if (ret) {
> +			dev_err(dev, "unable to enable pcie ref clock\n");

'Failed to enable PCIe REFCLK'

- Mani

-- 
மணிவண்ணன் சதாசிவம்
