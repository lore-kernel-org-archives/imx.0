Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C0E218827
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 07:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701662; cv=none; b=dQYqF9KJwfziE5N0sgsTbbpAg4bZN++YYG/lNBOsUMs8SOKgyXEcmK3dxnY9ycpaWz6ikwSCub84I22U8NmGPoXFAYQItVgHvfcVmkJ/cRrgas9Y2x6bifNjXTQRS8M1Pywe9khGVdKX7az9f1kLAk2SqhP3GrGxM2Zt34xUEcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701662; c=relaxed/simple;
	bh=GEfBOA45QlWfcWHD5yzJuDstvply4eSmwqKjrGpmXUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnDuonYwzXR2K51EcS7LiTodRtp+3F+DOnRmcaoPz6gX8/qfBx1bDApkQUW/a/IZfGYQsA2TjGd8H+zhkdwbIincMe1yCNNDCt1zcKeyhqUuDpR3oj4aALcO7CrR1Ch9GUNRkQ1zSIaAMoKG8RnJgW1poVKFP+isNoT9aZurpZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gHyXDois; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gHyXDois"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2295d78b433so54041605ad.2
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 00:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744701660; x=1745306460; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XCNk9Rod1k+bgkwurUtIjlivzVvS2RJvCje5WjdRCTk=;
        b=gHyXDoisceyqGf8MoQvlmE9RgyHuFziR9z6C/jPuyaDiI56zpM6TG2CiLGJPRvx6Xt
         NXKX9CEYDgYCC0q+dqlhJkuO2Cc1InHpXXInETW7hjXPgE4hXUGa8f9oPYFo1JnGJUVY
         UJC+2VKt2VupCQpFSRZjH7k+vwnkRofw5ARkA7tuMechXIdneUMtrEKxxe3ilYONEmx+
         1HdVuNZBYmkcPMtnWLG0Trb3uhLExRZqNb8Yf4Sj5irXe41Vlzlg3zgRFCNg4vlptue5
         hVqhMZkWsWJmgMAvaY3TBXjbcG2YnLvbIThUChUFq5gzMn9H6cEuO+5lrixzcVeeT4/+
         +k3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701660; x=1745306460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCNk9Rod1k+bgkwurUtIjlivzVvS2RJvCje5WjdRCTk=;
        b=CVgChH0w91bvtjpUdMYEbyScepjW61Ifm7Nk7XquXytuWb2ssiqkLufEZ9/OMEMtWP
         3ztmnrCdlFlhsteq+cHAw2A1bAo2yLlaKKm091hk2PZ5EOu4Ajr99LZALIBdi6ShH1um
         Kyn0AlFQ8frnug8c/QU5fzcg7vfwwIizGXf6Nwl6ta5jmqQeDwQihcu3mwnarv9wIhxw
         BapiIECPH6APcHvmBFmpbYBBbHgjoqzoNA35sQdAoQlsoeeTuWQ69HEnjDatSFDB5qY8
         NHSELe+D3eY68xcFDaUhIfhGURiqjAhnhuyKgkui6JjC+2tv47rPMQ/A5z/L90nP61iB
         n2ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWfYBZ18htmqkkQhTykSLD5/zjYVnQwdlwP0Ss3X+vqFdQvS8dOH4bRNH1SXMP3A8wrhj8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPs6wBbMJK5qNaUuvVpOQAMdX2exOKq7SFA09E1QyZYcz0617v
	40yplYoX9TCdmgfvWsECsw12f0nkBKVzc0y/GDtZGnLubTGVHoo2JMzxf4rSNg==
X-Gm-Gg: ASbGncvGVu1uccK6c9hDMF6wDooa9B5UACZDwNihXNDwnSF9jn4p+IQbxTj2WXQ8Pwx
	M3C7vcHwL4j7zNGmcbuychButETEveQkefdlYMLhP1C1Zq74nE/aNYY3OFg/f12AgjOLC7ma3lC
	EzwkcyC9JwDs8URitilI58nV41xPG52lb725JjJn4hsWrjJ6bCeZbP749rkp8k6eQFRLFZxsSDw
	IPRXDbfDWC+Y/M5CvBlzZmEbVbyxfLFK0bHwG6i+DKs28xVxI0dOFf57r8h8zOj/q7OAoXAm41K
	XqSw5zsaC7KgJ2H+vPpjxBkwgP+bttNhUi7q9pYgqq4VpheTLZX+pnzsu05j
X-Google-Smtp-Source: AGHT+IHwx8NytA4HfmHYqY+ucueZxWfnA77QXqfaKsQqKRz4c9hbWsTrqA2PwtFUSZmcoIQDMTuTwQ==
X-Received: by 2002:a17:903:1b6f:b0:224:c47:cb7 with SMTP id d9443c01a7336-22bea3f02aemr222574665ad.0.1744701659806;
        Tue, 15 Apr 2025 00:20:59 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cddfaesm111157005ad.257.2025.04.15.00.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:20:59 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:50:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 6/7] PCI: imx6: Add PLL clock lock check for i.MX95
 PCIe
Message-ID: <3wmkjmutepc2s2ookc3ces4eyxe6morhhwxzlpup4mkkoy5ocx@py6h36upgl75>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-7-hongxing.zhu@nxp.com>
 <uqrhqkmtp4yudmt4ys635vg3gh5sibhevu7gjtbbbizuheuk45@lhxywqhtbpak>
 <AS8PR04MB867619A464E923655EDEF4878CB32@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB867619A464E923655EDEF4878CB32@AS8PR04MB8676.eurprd04.prod.outlook.com>

On Mon, Apr 14, 2025 at 03:16:46AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2025年4月13日 23:33
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v5 6/7] PCI: imx6: Add PLL clock lock check for i.MX95
> > PCIe
> > 
> > On Tue, Apr 08, 2025 at 10:59:29AM +0800, Richard Zhu wrote:
> > > Add PLL clock lock check for i.MX95 PCIe.
> > >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pci-imx6.c | 28
> > > +++++++++++++++++++++++++--
> > >  1 file changed, 26 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > index 7dcc9d88740d..c1d128ec255d 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -45,6 +45,9 @@
> > >  #define IMX95_PCIE_PHY_GEN_CTRL			0x0
> > >  #define IMX95_PCIE_REF_USE_PAD			BIT(17)
> > >
> > > +#define IMX95_PCIE_PHY_MPLLA_CTRL		0x10
> > > +#define IMX95_PCIE_PHY_MPLL_STATE		BIT(30)
> > > +
> > >  #define IMX95_PCIE_SS_RW_REG_0			0xf0
> > >  #define IMX95_PCIE_REF_CLKEN			BIT(23)
> > >  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
> > > @@ -479,6 +482,23 @@ static void
> > imx7d_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
> > >  		dev_err(dev, "PCIe PLL lock timeout\n");  }
> > >
> > > +static int imx95_pcie_wait_for_phy_pll_lock(struct imx_pcie
> > > +*imx_pcie) {
> > > +	u32 val;
> > > +	struct device *dev = imx_pcie->pci->dev;
> > > +
> > > +	if (regmap_read_poll_timeout(imx_pcie->iomuxc_gpr,
> > > +				     IMX95_PCIE_PHY_MPLLA_CTRL, val,
> > > +				     val & IMX95_PCIE_PHY_MPLL_STATE,
> > > +				     PHY_PLL_LOCK_WAIT_USLEEP_MAX,
> > > +				     PHY_PLL_LOCK_WAIT_TIMEOUT)) {
> > > +		dev_err(dev, "PCIe PLL lock timeout\n");
> > > +		return -ETIMEDOUT;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int imx_setup_phy_mpll(struct imx_pcie *imx_pcie)  {
> > >  	unsigned long phy_rate = 0;
> > > @@ -824,6 +844,8 @@ static int imx95_pcie_core_reset(struct imx_pcie
> > *imx_pcie, bool assert)
> > >  		regmap_read_bypassed(imx_pcie->iomuxc_gpr,
> > IMX95_PCIE_RST_CTRL,
> > >  				     &val);
> > >  		udelay(10);
> > > +	} else {
> > > +		return imx95_pcie_wait_for_phy_pll_lock(imx_pcie);
> > 
> > Is this PLL lock related to COLD_RESET? It doesn't look like it. If unrelated, it
> > should be called wherever required. imx95_pcie_core_reset() is supposed to
> > only assert/deassert the COLD_RESET.
> > 
> > If related, please explain how.
> Thanks for your kindly review.
> To make sure the HW state is correct to continue the sequential initializations.
> The PLL lock or not check would be kicked off after the COLD_RESET is
>  de-asserted for i.MX95 PCIe.
> So, the PLL lock check is added at the end of de-assertion in
>  imx95_pcie_core_reset() function.
> 

But imx95_pcie_core_reset() is not doing anything for deassert other than
waiting for PLL lock. Hence my question.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
