Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A4C1DE3BF
	for <imx@lists.linux.dev>; Fri, 22 Nov 2024 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732293876; cv=none; b=G1oXjqYEQCHw3MNBXnCS8G7F14wyMaUX/Kp4R99xw18s1i4IVE4cVuZVzXW+s7jzD/q/w7tE/Nq/SPl7mk7HvEugU8HxmO/mol5Yl7b/GlVTrrzy6xKXwKuROXV16f2utW3tY32VCltLq7hTKCVh/jR+6GfF6XZ7TdLuarOctpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732293876; c=relaxed/simple;
	bh=gRXAN2GhFByioHeJclpQRULpgQOeLPlr8+w40Lu99vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2ZByWyGrJidgE2DIA++DW26Ml3jzhN6m/Cyy19iuErEX5pZuI7mXcTo2Z9mfW6X5A0goY3k+2OByzbELyARddNujenHAmHshDhzcUce/9PVp157xo59zAUeGcWw8P+TLjB9chiqTzlVheb6PeCw82VxXGgXz2MSzibWgIYmDgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dvTOSbKW; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvTOSbKW"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-724d8422dbaso1585696b3a.0
        for <imx@lists.linux.dev>; Fri, 22 Nov 2024 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732293873; x=1732898673; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IwR2oPIQAt5cBP8ivKC91SEZVyVQIhFtIJGjJD68WpY=;
        b=dvTOSbKWCuY4UwhEEX4+Fjnxv1ZS6y3sgpDH7ahKmD5WFLtj4j0iN61PO5n1rPTEFU
         UI8DfxqRHAyHFJy3Lxi1zGD9Azzvv8yv7yx5D5Q26e0GSeS33ptY61XJY0BWLD09f01S
         yio/H/Tzm0kA5cE1lKChm2SY+u1ga1jpX8STYHjou8mChk3GKf1g2MzHbiDCns+bKoK6
         2MvxHZAqHiToIs47rhd4O/usNdNiRT8yM68BdRdlXuc+aPCWHjSc8LXeQa5xLTDw0zuq
         SBuMKRhO58FaGisfT3ix98qZ9t7aS7IjpZpMXo0LR5eV4QGOny3yXZLhFEds7Q4XMTQ+
         yLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732293873; x=1732898673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwR2oPIQAt5cBP8ivKC91SEZVyVQIhFtIJGjJD68WpY=;
        b=k6MLTVRk7GItz7SpRqT0Sc5L6oUFhYTdw2iRLiC4QRaiK7qLMug0Z8MN+TalS6xN6x
         z6TOH4stNBdHHRYT68rF5zoDzn6/ClNwGHrAfp6ZGi+DqK5lPQud5baAWYzBthQWUlU6
         mLMa51L9eUjMQW/b5+dDvfd39suAzs5Byrv70yK77B43kc0k2XJLBprJeuxTmY3gBYHo
         O+lIYQPuMXlrGNYZGzr4U1Y4a+uh+U//u0DMfZR7I7+kXVOqszjSYS36AY4+SQncjqls
         l37m3TpcdtrFcErB3H+wJySKuCTKcdIvgjlOOi+as9gUtGogeFQknYXQERLvXER0cUCJ
         Ro7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcTVoFjrE5RrNaUnGReBxbsDID5TH+ySuFpW+XgestZ1QiU4hWttV3m1UXAf5lx/ZCs9E=@lists.linux.dev
X-Gm-Message-State: AOJu0YykdFvcWPrFLkAxyQO26Fo7aRHsn21o11fAOQHc0YOSclbKU9WU
	/MQcQl/lgPZO9B4DG2KNMb4tFqdX2SEPmrFi+WvmeRCMmxAQx2/1ry6auPBF5A==
X-Gm-Gg: ASbGncuwaQ5nCvVnM046EIuzL3RNitkeUuyYuGT2+vCmU8l4WMi5ADFAAA7y6gmh7Py
	gMEh2PtpDM0Fg2jfSpzvuxdT1DrB8Va1iAFSXVDb0eH6xQzJl1RkJDC7DFJk1hWeAww6u8bi1DS
	c6kckz7EjpbwtzHGfknjzLbZv+3V0ig+yODZq90fipF0E7bWRIyL1HBQZ4Ejf0Fb238gHiny1HA
	gcDI8eXU/X2SThSEMaRXxhxIMi5y9ozcAZJRw/h12bCtN/WLadTgow44zz2
X-Google-Smtp-Source: AGHT+IHgULISyXOq5TQcOtW3Twh+i1nObBb6S6wCbmH2FUwOM/cGRvZbPtQMUa46S4dJNMfTxBufDg==
X-Received: by 2002:a05:6a00:9a3:b0:71e:5de:ad6d with SMTP id d2e1a72fcca58-724df6b81c4mr4858528b3a.24.1732293873177;
        Fri, 22 Nov 2024 08:44:33 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e3fdbsm1607239a12.30.2024.11.22.08.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:44:32 -0800 (PST)
Date: Fri, 22 Nov 2024 22:14:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 02/10] PCI: imx6: Add ref clock for i.MX95 PCIe
Message-ID: <20241122164426.55zgf36oewcjxjvz@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-3-hongxing.zhu@nxp.com>
 <20241115063816.xpjqgm2j34enhe7s@thinkpad>
 <AS8PR04MB86767205982E13C2771614AB8C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <AS8PR04MB8676DFD33B926A2EC57577CC8C202@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676DFD33B926A2EC57577CC8C202@AS8PR04MB8676.eurprd04.prod.outlook.com>

On Tue, Nov 19, 2024 at 05:38:30AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Hongxing Zhu
> > Sent: 2024年11月18日 10:59
> > To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Cc: l.stach@pengutronix.de; bhelgaas@google.com; lpieralisi@kernel.org;
> > kw@linux.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > shawnguo@kernel.org; Frank Li <frank.li@nxp.com>; s.hauer@pengutronix.de;
> > festevam@gmail.com; imx@lists.linux.dev; kernel@pengutronix.de;
> > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: RE: [PATCH v6 02/10] PCI: imx6: Add ref clock for i.MX95 PCIe
> > 
> > > -----Original Message-----
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Sent: 2024年11月15日 14:38
> > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > Cc: l.stach@pengutronix.de; bhelgaas@google.com;
> > > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > > krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org; Frank Li
> > > <frank.li@nxp.com>; s.hauer@pengutronix.de; festevam@gmail.com;
> > > imx@lists.linux.dev; kernel@pengutronix.de; linux-pci@vger.kernel.org;
> > > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > > linux-kernel@vger.kernel.org
> > > Subject: Re: [PATCH v6 02/10] PCI: imx6: Add ref clock for i.MX95 PCIe
> > >
> > > On Fri, Nov 01, 2024 at 03:06:02PM +0800, Richard Zhu wrote:
> > > > Add "ref" clock to enable reference clock. To avoid the DT
> > > > compatibility, i.MX95 REF clock might be optional.
> > >
> > > Your wording is not correct. Perhaps you wanted to say, "To avoid
> > > breaking DT backwards compatibility"?
> > >
> > Yes, you're right. Thanks.
> > 
> > > > Replace the
> > > > devm_clk_bulk_get() by devm_clk_bulk_get_optional() to fetch
> > > > i.MX95 PCIe optional clocks in driver.
> > > >
> > > > If use external clock, ref clock should point to external reference.
> > > >
> > > > If use internal clock, CREF_EN in LAST_TO_REG controls reference
> > > > output, which implement in drivers/clk/imx/clk-imx95-blk-ctl.c.
> > > >
> > > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  drivers/pci/controller/dwc/pci-imx6.c | 19 +++++++++++++------
> > > >  1 file changed, 13 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > > index 808d1f105417..bc8567677a67 100644
> > > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > > @@ -82,6 +82,7 @@ enum imx_pcie_variants {
> > > >  #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
> > > >  #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
> > > >  #define IMX_PCIE_FLAG_CPU_ADDR_FIXUP		BIT(8)
> > > > +#define IMX_PCIE_FLAG_CUSTOM_PME_TURNOFF	BIT(9)
> > > >
> > > >  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
> > > >
> > > > @@ -98,6 +99,7 @@ struct imx_pcie_drvdata {
> > > >  	const char *gpr;
> > > >  	const char * const *clk_names;
> > > >  	const u32 clks_cnt;
> > > > +	const u32 clks_optional_cnt;
> > > >  	const u32 ltssm_off;
> > > >  	const u32 ltssm_mask;
> > > >  	const u32 mode_off[IMX_PCIE_MAX_INSTANCES]; @@ -1278,9
> > +1280,8
> > > @@
> > > > static int imx_pcie_probe(struct platform_device *pdev)
> > > >  	struct device_node *np;
> > > >  	struct resource *dbi_base;
> > > >  	struct device_node *node = dev->of_node;
> > > > -	int ret;
> > > > +	int ret, i, req_cnt;
> > > >  	u16 val;
> > > > -	int i;
> > > >
> > > >  	imx_pcie = devm_kzalloc(dev, sizeof(*imx_pcie), GFP_KERNEL);
> > > >  	if (!imx_pcie)
> > > > @@ -1330,7 +1331,10 @@ static int imx_pcie_probe(struct
> > > platform_device *pdev)
> > > >  		imx_pcie->clks[i].id = imx_pcie->drvdata->clk_names[i];
> > > >
> > > >  	/* Fetch clocks */
> > > > -	ret = devm_clk_bulk_get(dev, imx_pcie->drvdata->clks_cnt,
> > > imx_pcie->clks);
> > > > +	req_cnt = imx_pcie->drvdata->clks_cnt -
> > > imx_pcie->drvdata->clks_optional_cnt;
> > > > +	ret = devm_clk_bulk_get(dev, req_cnt, imx_pcie->clks);
> > > > +	ret |= devm_clk_bulk_get_optional(dev,
> > > imx_pcie->drvdata->clks_optional_cnt,
> > > > +					  imx_pcie->clks + req_cnt);
> > >
> > > Why do you need to use 'clk_bulk' API to get a single reference clock?
> > > Just use devm_clk_get_optional(dev, "ref")
> > It's easier to add more optional clks in future. I can change to use
> > devm_clk_get_optional(dev, "ref") here if you insistent.
> Since the clock fetch is not distinguished by platforms explicitly.
> devm_clk_get_optional(dev, "ref") can be used only when i.MX95 specification
>  is added.
> -       ret |= devm_clk_bulk_get_optional(dev, imx_pcie->drvdata->clks_optional_cnt,
> -                                         imx_pcie->clks + req_cnt);
>         if (ret)
>                 return ret;
> +       for (i = 0; i < imx_pcie->drvdata->clks_optional_cnt; i++) {
> +               imx_pcie->clks[req_cnt + i].clk = devm_clk_get_optional(dev,
> +                               imx_pcie->drvdata->clk_names[req_cnt + i]);
> +               if (IS_ERR(imx_pcie->clks[req_cnt + i].clk))
> +                       return PTR_ERR(imx_pcie->clks[req_cnt + i].clk);
> +       }
> 
> Or
> -       ret |= devm_clk_bulk_get_optional(dev, imx_pcie->drvdata->clks_optional_cnt,
> -                                         imx_pcie->clks + req_cnt);
>         if (ret)
>                 return ret;
> +       if (imx_pcie->drvdata->variant == IMX95) {

Why do you need this check? If there is no clock, devm_clk_get_optional() will
return NULL, so you can just do IS_ERR() without any checks.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
