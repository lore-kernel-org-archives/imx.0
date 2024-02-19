Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB7D3B7A8
	for <imx@lists.linux.dev>; Mon, 19 Feb 2024 16:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708359140; cv=none; b=dZ5OOgEJJEREIMS7xhjZn1G5izcuBZvb4MTh/2uZWkUTWp+s3WCLBBmIeIF6Ieb83PN20IenRedBW8Rl6W+qfTKZwfN4XoBGfXlfS0MYr7mKuCRxRbKICaHQZrH7J7avVdKH3lE1W7jdTj4GrZ7iTO09NQ074lbYa/t96N88o4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708359140; c=relaxed/simple;
	bh=sHaZ1fkkziKisQCFum7OdMUZZlYeSLfKSujPIsT4gnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkOWcEqY+pVJRJNHnBartQHl+4AN/umyY4jj/XGJ3SskzTJNJPpqnwkYH8ePQzqhkcykJCg3a/+nqk2tm6642nms14RQUN6NqKpQwzEEMLOZHk+ZeO4xPBZVvecDxnPFaYibsBzOtv0qBNsoVHSC+CnSw+QDMr7LEn3HIO/FpHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DpjVFu3H; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DpjVFu3H"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e4741b23d7so278955b3a.0
        for <imx@lists.linux.dev>; Mon, 19 Feb 2024 08:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708359137; x=1708963937; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VjM5BP6IafIzFETSaEBSJHdOU4rhZ/NqSlKuCbN1tEA=;
        b=DpjVFu3HZOd2NX+OiCRG2hO9ayxl+YgWYYpndgByd6ertKzN3LTalbMv1gO8jw+HZi
         QvIvKYfw0lZtVYdlXCS6Fb1yjrrQb2r+AMOMGnKSYvcYYqmvnuTY+RSRzs87jnkrWh+G
         +3obcB4hfe5sePkCzxOTal8lwTdlUI9gxq6bZMFfT002qWm1WasHxn+fHoXVemjmMPAT
         7wDOWrqLkCYG/6+gtLcZ38pokmYZ0AKrHItEHpMI+Ka3dZzK8w32ud+oyxN2bnU9HLQJ
         zF5ZWkzxcPOCbS3ZVPIN6x4cmR6uRhqWC744GSeRu9c0719Km4GqRaoyPUh0Ra5gOE2X
         UGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708359137; x=1708963937;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjM5BP6IafIzFETSaEBSJHdOU4rhZ/NqSlKuCbN1tEA=;
        b=Zyi1caKQ4YSqOPTb31e7keyBmjvbuO5VeYrzc3Wk3+f6OH7o1u/4zJLAxEg8/z3rGJ
         i8fgCiCuM1A2hxzw9qQlRbHo4bVWlOzPj4dchxIbxYH2GwlM/ke22u2N0j5J6fNH1UVc
         IqNcjiGTl8kRNRJiL5U7m7vahODwwvBqlJgkoSEbMo96wh//C9Q7IovFVEr4xW8R4+6r
         TgCNmoFLimzQbrEnErXV2XAKuhMBbQDjdEE0tfhLYrOthSmYVcRJ1yglsRYUNybKGo2y
         8vvuKH1p21+TQHmDU+ARfbIecuRgwhv+V/3XbuXLNHynb5k3Z/XsTlDOHXKA7mP6YVbE
         8AlA==
X-Forwarded-Encrypted: i=1; AJvYcCUE+HtKITy+S5h1StY9shzF0n9i/I4Bg5IBgCtIBUIg1uwQQwoyhE4o0xnor3y1U4TfgbBZqkM/N12qTzt1mpezzf/T
X-Gm-Message-State: AOJu0YwmHxiheskVAIOsJmtPov5EOGYpPvLM9lYbZ+WzyNm9br67aaUU
	ywiTJxp3qqm9jaTR7WS2bvWGj9zGFPsDXiG+zYQqvadveS2OQlryTV0x0Bq3ow==
X-Google-Smtp-Source: AGHT+IEe2VfOrNLtUn52OWpBafmo/JTiMuopuECfKir8MlzvUnPKjJ7qwLaSaZAMlkN+p9OgG7LaGw==
X-Received: by 2002:aa7:8b8f:0:b0:6e3:ad06:8153 with SMTP id r15-20020aa78b8f000000b006e3ad068153mr4161626pfd.28.1708359137153;
        Mon, 19 Feb 2024 08:12:17 -0800 (PST)
Received: from thinkpad ([117.248.7.166])
        by smtp.gmail.com with ESMTPSA id c7-20020a62f847000000b006e0e35c1e55sm4930061pfm.79.2024.02.19.08.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 08:12:16 -0800 (PST)
Date: Mon, 19 Feb 2024 21:42:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: lpieralisi@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, festevam@gmail.com, helgaas@kernel.org,
	hongxing.zhu@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de,
	krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
	kw@linux.com, l.stach@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH v10 00/14] PCI: imx6: Clean up and add imx95 pci support
Message-ID: <20240219161208.GE3281@thinkpad>
References: <20240205173335.1120469-1-Frank.Li@nxp.com>
 <ZdNvsdao8jbB/52L@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdNvsdao8jbB/52L@lizhi-Precision-Tower-5810>

On Mon, Feb 19, 2024 at 10:11:45AM -0500, Frank Li wrote:
> On Mon, Feb 05, 2024 at 12:33:21PM -0500, Frank Li wrote:
> > first 6 patches use drvdata: flags to simplify some switch-case code.
> > Improve maintaince and easy to read code.
> > 
> 
> @Lorenzo Pieralisi:
> 
> 	Do you have chance to look other patches?
> 	Mani's apply EP side change. 

Even though the controller is for the endpoint, it is still a controller
driver. So all the patches should go through Lorenzo.

I only merge patches under drivers/pci/endpoint. Hope this clarifies.

- Mani

> 	'PCI: imx6: Add iMX95 Endpoint (EP) support' need be rebased. 
> 
> Frank
> 
> > Then add imx95 basic pci host function.
> > 
> > follow two patch do endpoint code clean up.
> > Then add imx95 basic endpont function.
> > 
> > Compared with v2, added EP function support and some fixes,  please change
> > notes at each patches.
> > 
> > Change from v9 to v10
> > - remove two patches:
> > >   dt-bindings: imx6q-pcie: Add linux,pci-domain as required for iMX8MQ
> > >   PCI: imx6: Using "linux,pci-domain" as slot ID
> > it is not good solution to fixed hardcode check to get controller id.
> > Will see better solution later.
> > 
> > dt-binding pass pcie node:
> > 
> > pcie0: pcie@4c300000 {
> >                         compatible = "fsl,imx95-pcie";
> >                         reg = <0 0x4c300000 0 0x40000>,
> >                                 <0 0x4c360000 0 0x10000>,
> >                                 <0 0x4c340000 0 0x20000>,
> >                                 <0 0x60100000 0 0xfe00000>;
> >                         reg-names = "dbi", "atu", "app", "config";
> >                         #address-cells = <3>;
> >                         #size-cells = <2>;
> >                         device_type = "pci";
> >                         linux,pci-domain = <0>;
> >                         bus-range = <0x00 0xff>;
> >                         ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
> >                                  <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
> >                         num-lanes = <1>;
> >                         num-viewport = <8>;
> >                         interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
> >                         interrupt-names = "msi";
> >                         #interrupt-cells = <1>;
> >                         interrupt-map-mask = <0 0 0 0x7>;
> >                         interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> >                                         <0 0 0 2 &gic 0 0 GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> >                                         <0 0 0 3 &gic 0 0 GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> >                                         <0 0 0 4 &gic 0 0 GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
> >                         fsl,max-link-speed = <3>;
> >                         clocks = <&scmi_clk IMX95_CLK_HSIO>,
> >                                  <&scmi_clk IMX95_CLK_HSIOPLL>,
> >                                  <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> >                                  <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> >                         clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> >                         assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> >                                          <&scmi_clk IMX95_CLK_HSIOPLL>,
> >                                          <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> >                         assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
> >                         assigned-clock-parents = <0>, <0>,
> >                                                  <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> >                         power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> >                         /* 0x30~0x37 stream id for pci0 */
> >                         /*
> >                          * iommu-map = <0x000 &apps_smmu 0x30 0x1>,
> >                          * <0x100 &apps_smmu 0x31 0x1>;
> >                          */
> >                         status = "disabled";
> >                 };
> > 
> > pcie1: pcie-ep@4c380000 {
> >                         compatible = "fsl,imx95-pcie-ep";
> >                         reg = <0 0x4c380000 0 0x20000>,
> >                               <0 0x4c3e0000 0 0x1000>,
> >                               <0 0x4c3a0000 0 0x1000>,
> >                               <0 0x4c3c0000 0 0x10000>,
> >                               <0 0x4c3f0000 0 0x10000>,
> >                               <0xa 0 1 0>;
> >                         reg-names = "dbi", "atu", "dbi2", "app", "dma", "addr_space";
> >                         interrupts = <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
> >                         interrupt-names = "dma";
> >                         fsl,max-link-speed = <3>;
> >                         clocks = <&scmi_clk IMX95_CLK_HSIO>,
> >                                  <&scmi_clk IMX95_CLK_HSIOPLL>,
> >                                  <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> >                                  <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> >                         clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> >                         assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> >                                          <&scmi_clk IMX95_CLK_HSIOPLL>,
> >                                          <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> >                         assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
> >                         assigned-clock-parents = <0>, <0>,
> >                                                  <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> >                         power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> >                         status = "disabled";
> >                 };
> > 
> > Frank Li (13):
> >   PCI: imx6: Simplify clock handling by using clk_bulk*() function
> >   PCI: imx6: Simplify phy handling by using IMX6_PCIE_FLAG_HAS_PHYDRV
> >   PCI: imx6: Simplify reset handling by using by using
> >     *_FLAG_HAS_*_RESET
> >   PCI: imx6: Simplify ltssm_enable() by using ltssm_off and ltssm_mask
> >   PCI: imx6: Simplify configure_type() by using mode_off and mode_mask
> >   PCI: imx6: Simplify switch-case logic by involve init_phy callback
> >   dt-bindings: imx6q-pcie: Clean up irrationality clocks check
> >   dt-bindings: imx6q-pcie: Restruct reg and reg-name
> >   PCI: imx6: Add iMX95 PCIe Root Complex support
> >   PCI: imx6: Clean up get addr_space code
> >   PCI: imx6: Add epc_features in imx6_pcie_drvdata
> >   dt-bindings: imx6q-pcie: Add iMX95 pcie endpoint compatible string
> >   PCI: imx6: Add iMX95 Endpoint (EP) support
> > 
> > Richard Zhu (1):
> >   dt-bindings: imx6q-pcie: Add imx95 pcie compatible string
> > 
> >  .../bindings/pci/fsl,imx6q-pcie-common.yaml   |  17 +-
> >  .../bindings/pci/fsl,imx6q-pcie-ep.yaml       |  46 +-
> >  .../bindings/pci/fsl,imx6q-pcie.yaml          |  49 +-
> >  drivers/pci/controller/dwc/pci-imx6.c         | 634 ++++++++++--------
> >  4 files changed, 436 insertions(+), 310 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 

-- 
மணிவண்ணன் சதாசிவம்
