Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A0278F5F
	for <imx@lists.linux.dev>; Sun, 19 Jan 2025 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737270176; cv=none; b=bTA8Pknp9QJbuOsFMm1LGXqsk7ySixU6phNo7Fa0HrjN8qhmwE+BS85EY8fCXz8zPZpSNL3xq0KEK+GAcLTseDBx1u4Wbw9h5a/fDbARu669oSORuKqgRYjeF5W7puWfxTtTvM17sCut7CpeaPwHN7GG6O6paLVgBLEKfqZBxow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737270176; c=relaxed/simple;
	bh=9Uyh20Bo/JCrzKWgQJoe3V6rjzekT4NllWMa1CNe8Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mx6ICw15kz+QfwzM3mnXEKa/ZCavY7CtXDKCoeUZjnUhn8YGDFg+tlmD5a7Rs/zrgKFod9jtPXuG73DHX4nhJUgT9usGaNH451tRl0JzExBls4khU5acWshjr27vPJCO/rjRoKBop3suga949Hu9CFOQlRQwBQxhXS9eokyJmwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vu4873eh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vu4873eh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21628b3fe7dso61671765ad.3
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 23:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737270174; x=1737874974; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vMJ3GX6dkOYZdUXVc1wm3huqORVLg1qLuaKka3o+Bqk=;
        b=vu4873ehM8ztNfhwa9AP7B6gMtD5oFes0YowtNz5QdiyeGKmQqXMGsFkBWLzurO/mQ
         CpzaqE6l4Y51J+gSYZReKrzmlIJsWPAVCiiOp8pF4ySHWISlDRv3UNHfnPkEKRHLOtny
         ztTZynJQXmW/2YwLUjc0Njx0JM9ZGkO9Wol6n6Z5UcW1ms8fU29UaN+bUoV3TL3Et7gT
         XOPBDP0ntGr524uSJcmaUFYo5Dz/tGqN9tnJ+7/8tU1gbXLonBZbXiQz/3XbNM6Ez7cJ
         aoula6+44s1I6oZZQIpHZfuDCeea8nb2M6864iSPGWD2iHXad3ylb4ceBVNYHWs4StWq
         EKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737270174; x=1737874974;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMJ3GX6dkOYZdUXVc1wm3huqORVLg1qLuaKka3o+Bqk=;
        b=gIEqdnWGXt2HSJTiISTUmZene3F/ogGHBHxDkjTlJ7qaVApSXG5sZfgL9cngySADOu
         dfX05e7xaZylwI5tpzoZ6kyqzpmQglhizuspOaeyEpVcqRGDNlVaguqzCg06+yx3fxTy
         SgbldPqXfTc0UTIMhOEA8o8P4f3/ODTVZGighKlu4G2QYT2EjHRaDNG3upz9YsDS5zqj
         hDmqHJcEwt1ZW/ZRc2nLcIf4QB5CwGRJIRwJtf1rLCi46GwOefjH1qK5UgeIak46oDD3
         Nutl1Ia6F8P7gM18TZZM3vprF7Ds3Fn7P25QLaAS43Pw3wldHjTUW+pmiMN2Da9OEuDp
         6G5A==
X-Forwarded-Encrypted: i=1; AJvYcCV0zhM3x5APADOMvL6Ex7A4N6KpMsahDeqEzzaXKnu+2LZLOoCtbQWksGENiEah+8kXfJE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCeil8jA2fK4/WvUCtxd0LavgmbAofic8Rny20g4jV2PT/IB7a
	MDRzFH74xUi/U7MCGwXgajdbnYc4ts+74tGSvO2huldjGldZ8vqGJrTs1qvUAg==
X-Gm-Gg: ASbGncuPucOFpofGlrnVyN7Hh9imqmgG96SSco42TVWu4IPjdeED/k4pPddJAjrJJnp
	b6pMPbAvWJ4OpQdOxXrem1aIrf3LckoCklWO9nAlQ3JWbQK0Ir2udFuH6QUabOT60chXlKC6EbD
	Q+2ONalg8fw6wrfMOxfg6ylYyGkSsWRL1klojmsHXqRTvfnox2ODLWMN+de6a7bKCc/OLZCrtvs
	e8NErh+qS1gM7FC0rxw3d+vYlJtuxfHkeUwFD0YtMs1AYgsc6qE57xM2uEgMtgo3hR/srFGe8eT
	E5mHsA==
X-Google-Smtp-Source: AGHT+IEeTs48whwEN7rNg39TN9hpGQKSWq0W/VdR6tyAMeUyYliEEBAyt6ics9gbcWZ/8208wLwfuw==
X-Received: by 2002:a17:903:22cb:b0:21b:d105:26a5 with SMTP id d9443c01a7336-21c355becd3mr125597245ad.38.1737270173884;
        Sat, 18 Jan 2025 23:02:53 -0800 (PST)
Received: from thinkpad ([120.56.195.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3dd93esm40763455ad.164.2025.01.18.23.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 23:02:53 -0800 (PST)
Date: Sun, 19 Jan 2025 12:32:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/10] PCI: imx6: Add ref clock for i.MX95 PCIe
Message-ID: <20250119070246.yfxogn4vv3jqfvzb@thinkpad>
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
 <20241126075702.4099164-3-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126075702.4099164-3-hongxing.zhu@nxp.com>

On Tue, Nov 26, 2024 at 03:56:54PM +0800, Richard Zhu wrote:
> Add "ref" clock to enable reference clock. To avoid breaking DT
> backwards compatibility, i.MX95 REF clock might be optional. Use
> devm_clk_get_optional() to fetch i.MX95 PCIe optional clocks in driver.
> 
> If use external clock, ref clock should point to external reference.
> 
> If use internal clock, CREF_EN in LAST_TO_REG controls reference output,
> which implement in drivers/clk/imx/clk-imx95-blk-ctl.c.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 385f6323e3ca..f7e928e0a018 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -103,6 +103,7 @@ struct imx_pcie_drvdata {
>  	const char *gpr;
>  	const char * const *clk_names;
>  	const u32 clks_cnt;
> +	const u32 clks_optional_cnt;
>  	const u32 ltssm_off;
>  	const u32 ltssm_mask;
>  	const u32 mode_off[IMX_PCIE_MAX_INSTANCES];
> @@ -1306,9 +1307,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	struct device_node *np;
>  	struct resource *dbi_base;
>  	struct device_node *node = dev->of_node;
> -	int ret;
> +	int i, ret, req_cnt;
>  	u16 val;
> -	int i;
>  
>  	imx_pcie = devm_kzalloc(dev, sizeof(*imx_pcie), GFP_KERNEL);
>  	if (!imx_pcie)
> @@ -1358,9 +1358,13 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  		imx_pcie->clks[i].id = imx_pcie->drvdata->clk_names[i];
>  
>  	/* Fetch clocks */
> -	ret = devm_clk_bulk_get(dev, imx_pcie->drvdata->clks_cnt, imx_pcie->clks);
> +	req_cnt = imx_pcie->drvdata->clks_cnt - imx_pcie->drvdata->clks_optional_cnt;
> +	ret = devm_clk_bulk_get(dev, req_cnt, imx_pcie->clks);
>  	if (ret)
>  		return ret;
> +	imx_pcie->clks[req_cnt].clk = devm_clk_get_optional(dev, "ref");
> +	if (IS_ERR(imx_pcie->clks[req_cnt].clk))
> +		return PTR_ERR(imx_pcie->clks[req_cnt].clk);

I think you should just switch to devm_clk_bulk_get_all() instead of getting the
clks separately. As I told previously, the DT binding should ensure that correct
clocks for the platforms are defined in DT and the driver has no business in
validating it. Driver should trust the DT instead (unless there is a valid
reason to not do so).

>  
>  	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_PHYDRV)) {
>  		imx_pcie->phy = devm_phy_get(dev, "pcie-phy");
> @@ -1509,6 +1513,7 @@ static const char * const imx8mm_clks[] = {"pcie_bus", "pcie", "pcie_aux"};
>  static const char * const imx8mq_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux"};
>  static const char * const imx6sx_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_inbound_axi"};
>  static const char * const imx8q_clks[] = {"mstr", "slv", "dbi"};
> +static const char * const imx95_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux", "ref"};

And these static clock defines will go away too.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
