Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A314645
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 06:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731652709; cv=none; b=YV355QrevoedH8OM34uYX9aWr+T+3WwYFb48UGu+I6eW6nXmCPfDJ0Hs+WR1TyBJqFJfc9MLVxxN+doZ9phPq2PJ0CVtzcyPNM6dmrS86sWlB8D1qcTHoaMv1E2etSCtQzhz4O1ylkd4LhC3pM/aV/iZEOdqjVrZQhSISuoW/Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731652709; c=relaxed/simple;
	bh=rNXtr4YimcmppNnAP0ClgueGOcouCPS66vY3HdKZhcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChPuSkcgfsJwrLLjHRACOYeagji0+jQXHv3AtSN9c4uI602ydziY2xe9XyCzMTOlni1twgrJyhL+Bo+VDrBgvy1rCglhAS6/srTvMp1Fwt4a7FcHf0jJ67T40EUzhIVRVW4NkPojBJPoTXJFt+YBW1qaH65oX6NsGiyDqMJbCdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CCpn9uXg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CCpn9uXg"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20e576dbc42so4132735ad.0
        for <imx@lists.linux.dev>; Thu, 14 Nov 2024 22:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731652707; x=1732257507; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3ASYot59pnFaxW/GHMyz8Y0KBxe3S70/tiXkzx5jQ+Y=;
        b=CCpn9uXgb3y394y2W5wAd45ypdju8BEZiS21+fW03xT6MAhkYrmJdNa3tYYVOAe7WW
         2+wG6WVsZKWgtoTRYIN2imxppdfc+xrhTE/0WawyL+hINnnIENTP2JDF3p+mnSAtm3Et
         +OqgUG23aT69iid+nRviVsMqn0q7srfNmJO6jhe3urvO+QOZDUqPxzE9TH6Hcg88TKPX
         NMK2fslxiTENjBXtaUDYuCq0esPj/mmpQYD4haWzIRgrW6mtT23neCYmYFBzrdRgN74M
         Nql0A82bpZnDJsIDV2OMXurF1mc4BRM1EnIH/ArFdGQABcaGVOTW50AyLVs6Y568kNW0
         6dmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731652707; x=1732257507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ASYot59pnFaxW/GHMyz8Y0KBxe3S70/tiXkzx5jQ+Y=;
        b=HUlB1aIJFBAdVN6AojvbBOzcPlGi6aTNrtBF2RRA6MFW6S6ZkzMEJ4H9GcsZE2D+h0
         1KLoUWx+BUhg5zBZz1I4x8WNuUaqt09dJKXZ3Wy0CD2B99umnN/CSzxkHGSqRi83zZP4
         b6LQrrQGpWyKrFhRN1mjGCZ1+4fZ7CO5I215va+ZiZS2yViM5IIuyrprSpv5Izjh771Q
         9ARWzdgX3FY7ia1EaMdR6OWaACD7XKwqxU3Me3yXaWTpk/HqiFxL04VrCSMVTt4NbUhT
         FHektxyVSGLgNXZ9V5aJPkOD7KwmGjupSyAGuN98qcvI6y+T2uZHdclqYhiIXaFpZ+8r
         AuTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBhZ3QLwc6t4n1wug1n6WX43u8XN7ayE+EohF2lUStAMTmCwPJ804we3vne/6HLrY8CDY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaUx3VDHSQ/+16wM047z9HtcljAnktHFuM+3HPi6FfXfNAscKk
	+gIOKRaP+9MCtnlp76X/Bs0t/pR+jhWIU32uG+PPOyRiYcTG7h6fySgMi5C/JA==
X-Google-Smtp-Source: AGHT+IHmK/K9KtNXF8MAKgzWlqq1Xbvw08TMatRS4xdoCN6jQH4adnR3wRNRA42mwN6r478Ju/K5qw==
X-Received: by 2002:a17:902:ecc1:b0:20c:c631:d81f with SMTP id d9443c01a7336-211d0d71690mr17005295ad.21.1731652707497;
        Thu, 14 Nov 2024 22:38:27 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0ec7bc7sm6089015ad.68.2024.11.14.22.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:38:27 -0800 (PST)
Date: Fri, 15 Nov 2024 12:08:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/10] PCI: imx6: Add ref clock for i.MX95 PCIe
Message-ID: <20241115063816.xpjqgm2j34enhe7s@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-3-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-3-hongxing.zhu@nxp.com>

On Fri, Nov 01, 2024 at 03:06:02PM +0800, Richard Zhu wrote:
> Add "ref" clock to enable reference clock. To avoid the DT
> compatibility, i.MX95 REF clock might be optional.

Your wording is not correct. Perhaps you wanted to say, "To avoid breaking DT
backwards compatibility"?

> Replace the
> devm_clk_bulk_get() by devm_clk_bulk_get_optional() to fetch
> i.MX95 PCIe optional clocks in driver.
> 
> If use external clock, ref clock should point to external reference.
> 
> If use internal clock, CREF_EN in LAST_TO_REG controls reference output,
> which implement in drivers/clk/imx/clk-imx95-blk-ctl.c.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 808d1f105417..bc8567677a67 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -82,6 +82,7 @@ enum imx_pcie_variants {
>  #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
>  #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
>  #define IMX_PCIE_FLAG_CPU_ADDR_FIXUP		BIT(8)
> +#define IMX_PCIE_FLAG_CUSTOM_PME_TURNOFF	BIT(9)
>  
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
> @@ -98,6 +99,7 @@ struct imx_pcie_drvdata {
>  	const char *gpr;
>  	const char * const *clk_names;
>  	const u32 clks_cnt;
> +	const u32 clks_optional_cnt;
>  	const u32 ltssm_off;
>  	const u32 ltssm_mask;
>  	const u32 mode_off[IMX_PCIE_MAX_INSTANCES];
> @@ -1278,9 +1280,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	struct device_node *np;
>  	struct resource *dbi_base;
>  	struct device_node *node = dev->of_node;
> -	int ret;
> +	int ret, i, req_cnt;
>  	u16 val;
> -	int i;
>  
>  	imx_pcie = devm_kzalloc(dev, sizeof(*imx_pcie), GFP_KERNEL);
>  	if (!imx_pcie)
> @@ -1330,7 +1331,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  		imx_pcie->clks[i].id = imx_pcie->drvdata->clk_names[i];
>  
>  	/* Fetch clocks */
> -	ret = devm_clk_bulk_get(dev, imx_pcie->drvdata->clks_cnt, imx_pcie->clks);
> +	req_cnt = imx_pcie->drvdata->clks_cnt - imx_pcie->drvdata->clks_optional_cnt;
> +	ret = devm_clk_bulk_get(dev, req_cnt, imx_pcie->clks);
> +	ret |= devm_clk_bulk_get_optional(dev, imx_pcie->drvdata->clks_optional_cnt,
> +					  imx_pcie->clks + req_cnt);

Why do you need to use 'clk_bulk' API to get a single reference clock? Just use
devm_clk_get_optional(dev, "ref")

And who is going to supply the reference clock in the absence of this clockn in
DT?

- Mani

>  	if (ret)
>  		return ret;
>  
> @@ -1480,6 +1484,7 @@ static const char * const imx8mm_clks[] = {"pcie_bus", "pcie", "pcie_aux"};
>  static const char * const imx8mq_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux"};
>  static const char * const imx6sx_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_inbound_axi"};
>  static const char * const imx8q_clks[] = {"mstr", "slv", "dbi"};
> +static const char * const imx95_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux", "ref"};
>  
>  static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX6Q] = {
> @@ -1592,9 +1597,11 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	},
>  	[IMX95] = {
>  		.variant = IMX95,
> -		.flags = IMX_PCIE_FLAG_HAS_SERDES,
> -		.clk_names = imx8mq_clks,
> -		.clks_cnt = ARRAY_SIZE(imx8mq_clks),
> +		.flags = IMX_PCIE_FLAG_HAS_SERDES |
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
> +		.clk_names = imx95_clks,
> +		.clks_cnt = ARRAY_SIZE(imx95_clks),
> +		.clks_optional_cnt = 1,
>  		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
>  		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
>  		.mode_off[0]  = IMX95_PE0_GEN_CTRL_1,
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
