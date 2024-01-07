Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB7A1118D
	for <imx@lists.linux.dev>; Sun,  7 Jan 2024 03:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gy7nxpzW"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7bbec1d1c9dso57436439f.1
        for <imx@lists.linux.dev>; Sat, 06 Jan 2024 19:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704596665; x=1705201465; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7sp8lR8fVruy7aXHQIvUQeGshhQgsSFVGSZnezGwNmY=;
        b=gy7nxpzWSYS5pH19POYnEHJi4j6P66VOT2d/ZcNqWd3xbXjW4iMP0girzqluUFdBhR
         I8E4QaD52goTQVbHS78UCPFCfJkoNIaSmfelg7UO1a5e/LVIjYwB20InZ10eFTqnniVv
         6ZoumPE5UXzU8W25j1LSizpzRjE+/CSG0bAktJreQ8YMf4HWGmKk8q6SeuZAC/aDQZgU
         OpT9PnPU7sW0A4cPD9heRf1gKhrYU7u+yUmzTiQYx1AqVSexvbGCsm+isjv9Cboa7ioG
         SNp7m6A9w0EbAToJbrLHvCIDutgMZ4jlmRmVwjfCLg4KFIaDAjnCm6JnvSX8c8TMc0l0
         jHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704596665; x=1705201465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7sp8lR8fVruy7aXHQIvUQeGshhQgsSFVGSZnezGwNmY=;
        b=M6luHIlvvFZGNFX2iVmNki1qMQSmjFiojr0KFaYXAIthxlPfETsPuCIDg6hWUlz6/Q
         PCPIM0k7wdbtZd1PEA0c5P9yKq4MXEmPQAUNCBtxELP0WgzPj5YeQTVxLy4cxZrMXKlu
         6pjEWdCqdvPWV4x5ohjVF8I+JsQ21E3o4ZSoiu1Qp65Oga1PQwli9jVCSQ8Y0FuUuh/B
         TsIHNmCIyxuZGCpKc97LhwKpcJVFJxfJiMKiRfaVfkQy8fAJXl8wgJtUaEJImgmhmt1Z
         MV8uf/k3fV2WbUW3yZJjyFForncir6l/zMqcIwzEssLGjHPlJ862YkTk5d69SUIyKYpf
         AjQg==
X-Gm-Message-State: AOJu0Yy/9C4TK1PepXt3Itg4IfqcMNcQ8i9unAXd2nVIwEiWeidlccpM
	nQGSmvw03NvACxFoWfyd7z/w4lEhvuGQ
X-Google-Smtp-Source: AGHT+IHsUozNDbBUGhK/kPkGuJeGxcsOSl6NPAeIm7KmHBeMpMshWboxNlelX33jnj6MU0MpT+m+kg==
X-Received: by 2002:a05:6e02:32c3:b0:35f:ff8c:7a31 with SMTP id bl3-20020a056e0232c300b0035fff8c7a31mr3406835ilb.65.1704596665631;
        Sat, 06 Jan 2024 19:04:25 -0800 (PST)
Received: from thinkpad ([103.197.115.97])
        by smtp.gmail.com with ESMTPSA id w22-20020a1709029a9600b001d35223d0besm3675636plp.251.2024.01.06.19.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 19:04:25 -0800 (PST)
Date: Sun, 7 Jan 2024 08:34:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: krzysztof.kozlowski@linaro.org, bhelgaas@google.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
	helgaas@kernel.org, hongxing.zhu@nxp.com, imx@lists.linux.dev,
	kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
	kw@linux.com, l.stach@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lpieralisi@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
	shawnguo@kernel.org
Subject: Re: [PATCH v7 02/16] PCI: imx6: Simplify phy handling by using by
 using IMX6_PCIE_FLAG_HAS_PHY
Message-ID: <20240107030418.GB3416@thinkpad>
References: <20231227182727.1747435-1-Frank.Li@nxp.com>
 <20231227182727.1747435-3-Frank.Li@nxp.com>
 <20240106153323.GE2512@thinkpad>
 <ZZmE1NV6ShVBm5FU@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZZmE1NV6ShVBm5FU@lizhi-Precision-Tower-5810>

On Sat, Jan 06, 2024 at 11:50:28AM -0500, Frank Li wrote:
> On Sat, Jan 06, 2024 at 09:03:23PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Dec 27, 2023 at 01:27:13PM -0500, Frank Li wrote:
> > > Refactors the phy handling logic in the imx6 PCI driver by adding
> > > IMX6_PCIE_FLAG_HAS_PHY bitmask define for drvdata::flags.
> > > 
> > > The drvdata::flags and a bitmask ensures a cleaner and more scalable
> > > switch-case structure for handling phy.
> > > 
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > 
> > > Notes:
> > >     Change from v4 to v5:
> > >     - none, Keep IMX6_PCIE_FLAG_HAS_PHY to indicate dts mismatch when platform
> > >     require phy suppport.
> > >     
> > >     Change from v1 to v3:
> > >     - none
> > > 
> > >  drivers/pci/controller/dwc/pci-imx6.c | 23 ++++++++++++++++-------
> > >  1 file changed, 16 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> > > index 50d9faaa17f71..4d620249f3d52 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -60,6 +60,9 @@ enum imx6_pcie_variants {
> > >  #define IMX6_PCIE_FLAG_IMX6_PHY			BIT(0)
> > >  #define IMX6_PCIE_FLAG_IMX6_SPEED_CHANGE	BIT(1)
> > >  #define IMX6_PCIE_FLAG_SUPPORTS_SUSPEND		BIT(2)
> > > +#define IMX6_PCIE_FLAG_HAS_PHY			BIT(3)
> > 
> > Every PCIe setup requires PHY for its operation. Perhaps you are referring to
> > external PHY? If so, please rename this to IMX6_PCIE_FLAG_HAS_EXT_PHY.
> 
> Actually, it means use phy driver. How about using IMX6_PCIE_HAS_PHYDRV?
> 

Ah, ok. Yes, this makes sense.

- Mani

> > 
> > > +
> > > +#define imx6_check_flag(pci, val)     (pci->drvdata->flags & val)
> > >  
> > >  #define IMX6_PCIE_MAX_CLKS       6
> > >  
> > > @@ -1277,6 +1280,13 @@ static int imx6_pcie_probe(struct platform_device *pdev)
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > +	if (imx6_check_flag(imx6_pcie, IMX6_PCIE_FLAG_HAS_PHY)) {
> > 
> > IMO, we would not need these kind of checks in the driver if the DT binding is
> > properly validated using schema. But folks always want to validate "broken DT"
> > in the drivers :(
> > 
> > But I'm fine with this check for now since not everyone agree with above.
> > 
> > - Mani
> > 
> > > +		imx6_pcie->phy = devm_phy_get(dev, "pcie-phy");
> > > +		if (IS_ERR(imx6_pcie->phy))
> > > +			return dev_err_probe(dev, PTR_ERR(imx6_pcie->phy),
> > > +					     "failed to get pcie phy\n");
> > > +	}
> > > +
> > >  	switch (imx6_pcie->drvdata->variant) {
> > >  	case IMX7D:
> > >  		if (dbi_base->start == IMX8MQ_PCIE2_BASE_ADDR)
> > > @@ -1306,11 +1316,6 @@ static int imx6_pcie_probe(struct platform_device *pdev)
> > >  			return dev_err_probe(dev, PTR_ERR(imx6_pcie->apps_reset),
> > >  					     "failed to get pcie apps reset control\n");
> > >  
> > > -		imx6_pcie->phy = devm_phy_get(dev, "pcie-phy");
> > > -		if (IS_ERR(imx6_pcie->phy))
> > > -			return dev_err_probe(dev, PTR_ERR(imx6_pcie->phy),
> > > -					     "failed to get pcie phy\n");
> > > -
> > >  		break;
> > >  	default:
> > >  		break;
> > > @@ -1444,13 +1449,15 @@ static const struct imx6_pcie_drvdata drvdata[] = {
> > >  	},
> > >  	[IMX8MM] = {
> > >  		.variant = IMX8MM,
> > > -		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND,
> > > +		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND |
> > > +			 IMX6_PCIE_FLAG_HAS_PHY,
> > >  		.gpr = "fsl,imx8mm-iomuxc-gpr",
> > >  		.clk_names = {"pcie_bus", "pcie", "pcie_aux"},
> > >  	},
> > >  	[IMX8MP] = {
> > >  		.variant = IMX8MP,
> > > -		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND,
> > > +		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND |
> > > +			 IMX6_PCIE_FLAG_HAS_PHY,
> > >  		.gpr = "fsl,imx8mp-iomuxc-gpr",
> > >  		.clk_names = {"pcie_bus", "pcie", "pcie_aux"},
> > >  	},
> > > @@ -1462,12 +1469,14 @@ static const struct imx6_pcie_drvdata drvdata[] = {
> > >  	},
> > >  	[IMX8MM_EP] = {
> > >  		.variant = IMX8MM_EP,
> > > +		.flags = IMX6_PCIE_FLAG_HAS_PHY,
> > >  		.mode = DW_PCIE_EP_TYPE,
> > >  		.gpr = "fsl,imx8mm-iomuxc-gpr",
> > >  		.clk_names = {"pcie_bus", "pcie", "pcie_aux"},
> > >  	},
> > >  	[IMX8MP_EP] = {
> > >  		.variant = IMX8MP_EP,
> > > +		.flags = IMX6_PCIE_FLAG_HAS_PHY,
> > >  		.mode = DW_PCIE_EP_TYPE,
> > >  		.gpr = "fsl,imx8mp-iomuxc-gpr",
> > >  		.clk_names = {"pcie_bus", "pcie", "pcie_aux"},
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
