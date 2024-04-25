Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC47A84E10
	for <imx@lists.linux.dev>; Thu, 25 Apr 2024 11:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714043597; cv=none; b=JLDFsIqTOZ5p/WTBUD2P2B1H6oOz+wgBdryheZ3DvaY8DUGUszjoT8TPOygZTIJ3jO0GG/khevdWsnKIUht1Ot7oN1pTFXXiM+FCUlNBq+RSbLQH9yAS3bFU80+hl97FcDLBdWeS1/3WOswZA0vHQ5EXKdqGoWJ2kbA9WCTQq98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714043597; c=relaxed/simple;
	bh=9KoaB6+HPDJeQljM4fsDBGLmE1iGfG/0qRUTsarWPHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pioWWx70KPsTrUj6pp+z/CVjjeCWx3efDUeAkty5ZVZo46+zHhZTlms0JiJveSJ+/ZWFNGsjYo39bzEz1kNKW0a94HsQRUEyTBwr0cdrpDlxhVToy1sThXRj65seeYvGm0WQKGOjRGZGlP+ox0CX3ePRedyih/ypEKNWLzgH/Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hjFYv9F7; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hjFYv9F7"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6eb7d1a5d39so447140a34.2
        for <imx@lists.linux.dev>; Thu, 25 Apr 2024 04:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714043594; x=1714648394; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QsbB44EeMQGDiOFPnRm6gwdDqQTA+5PLqDVHUcWTTkw=;
        b=hjFYv9F7UKNW4XjLdcGhhRgQBPqbcJDIIQEKktUbQRCRGYPZ10MfoT2DaVDoRgs/zw
         ZSoNyczxRP4SHCi0InCqKVmTv0osyx5kez0JBWqcCt0MKlt2Fl6RF3T/V0J7eTDRqdi/
         3fBsXIZqQoze2Zc4u1b4iCNARlmTzVnmZYOdexpTmEJAMn3RiCAGN+b4L09lE82UIrCj
         6gh46hMwY7POBvW1mYaMH47n+/Yim5mCLh4Rzgiz0vynB3FPfTv1YU+tbgUVotuyln/2
         fqdrOBw3Ml3VYXP88hCUoZTFNCTEalRzwXZc1H2+Ke/mJAheoeu23V10Ey/dtMxJXajY
         VE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714043594; x=1714648394;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QsbB44EeMQGDiOFPnRm6gwdDqQTA+5PLqDVHUcWTTkw=;
        b=CmuA6//2i4r7S9fGII3Smq3ruHarRQ/k/UYE9RkbvEHfR6atLdJd1tC0G5kT9cQDUc
         X73CJTEkKalqbo5yPfnrgNX/GG9Cs3mNGjg8FVTwNkBXwEVYoW4//axkpGej0jdz8qDa
         bNOEm5YNTEaGcpufJDDV/W2dWOHhY+ZYvdoyK/I3RoG3B60p3QvW4bvQxzDmGXdI3K0E
         TN3mV6Zi8z118iokDzwj++I9+XRDr9sLoc5enLfp8A64yOh7EvWBjYrg8R3KnVkT2H94
         po77XRsyEu+wlSKz+cNL6jKkXbMUL99PRRbvm9cFIryAg7GgWg4CRnKlzWmniU3Q2Gip
         qc5A==
X-Forwarded-Encrypted: i=1; AJvYcCWrmC7JtFULOupEJ8NU/a92r1XRlmXVrLEWtZJENIwFVs74ng0X115lVISne9af8v0tYG9hGH7VXh/7EZlvN9cUmN47
X-Gm-Message-State: AOJu0YzLJQb//6djRYp+c74GGFP5KKBj/KaTNIiY1US8aZy9xD7rmpPZ
	5NS8nrVuYDOoxqRqHbtTnuOZzV6byk5Akczt5JpwqMng0ySOIwX2LI8ELee4qg==
X-Google-Smtp-Source: AGHT+IFHNH/NdwDnqsViBBSK6fogRbB2GKz5I1kvzLPqZs/OJ7Et5KDr4OWgWersvg/dQNYVNr96aA==
X-Received: by 2002:a05:6870:a119:b0:22e:d324:b888 with SMTP id m25-20020a056870a11900b0022ed324b888mr5826865oae.56.1714043593756;
        Thu, 25 Apr 2024 04:13:13 -0700 (PDT)
Received: from thinkpad ([120.60.75.221])
        by smtp.gmail.com with ESMTPSA id fu16-20020a056a00611000b006ecca2f2a32sm12930125pfb.168.2024.04.25.04.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 04:13:13 -0700 (PDT)
Date: Thu, 25 Apr 2024 16:42:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
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
	devicetree@vger.kernel.org, Jason Liu <jason.hui.liu@nxp.com>
Subject: Re: [PATCH v3 00/11] PCI: imx6: Fix\rename\clean up and add lut
 information for imx95
Message-ID: <20240425111259.GB3449@thinkpad>
References: <20240402-pci2_upstream-v3-0-803414bdb430@nxp.com>
 <Zh6GHcARSmlV/QdS@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zh6GHcARSmlV/QdS@lizhi-Precision-Tower-5810>

On Tue, Apr 16, 2024 at 10:07:25AM -0400, Frank Li wrote:
> On Tue, Apr 02, 2024 at 10:33:36AM -0400, Frank Li wrote:
> > Fixed 8mp EP mode problem.
> > 
> > imx6 actaully for all imx chips (imx6*, imx7*, imx8*, imx9*). To avoid     
> > confuse, rename all imx6_* to imx_*, IMX6_* to IMX_*. pci-imx6.c to        
> > pci-imx.c to avoid confuse.                                                
> 
> 
> Mani and lorenzo:
> 
> Do you have chance to look these patches?
> 

Sorry for the delay. Since this is a non-dwc driver, it got into my low priority
queue. Will take a look this week.

- Mani

> Frank
> 
> > 
> > Using callback to reduce switch case for core reset and refclk.            
> > 
> > Add imx95 iommux and its stream id information.                            
> > 
> > Base on linux-pci/controller/imx
> > 
> > To: Richard Zhu <hongxing.zhu@nxp.com>
> > To: Lucas Stach <l.stach@pengutronix.de>
> > To: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > To: Krzysztof Wilczyński <kw@linux.com>
> > To: Rob Herring <robh@kernel.org>
> > To: Bjorn Helgaas <bhelgaas@google.com>
> > To: Shawn Guo <shawnguo@kernel.org>
> > To: Sascha Hauer <s.hauer@pengutronix.de>
> > To: Pengutronix Kernel Team <kernel@pengutronix.de>
> > To: Fabio Estevam <festevam@gmail.com>
> > To: NXP Linux Team <linux-imx@nxp.com>
> > To: Philipp Zabel <p.zabel@pengutronix.de>
> > To: Liam Girdwood <lgirdwood@gmail.com>
> > To: Mark Brown <broonie@kernel.org>
> > To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > Cc: linux-pci@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: bpf@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > 
> > Changes in v3:
> > - Add an EP fixed patch
> >   PCI: imx6: Fix PCIe link down when i.MX8MM and i.MX8MP PCIe is EP mode
> >   PCI: imx6: Fix i.MX8MP PCIe EP can not trigger MSI
> > - Add 8qxp rc support
> > dt-bing yaml pass binding check
> > make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx6q-pcie.yaml
> >   LINT    Documentation/devicetree/bindings
> >   DTEX    Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.example.dts
> >   CHKDT   Documentation/devicetree/bindings/processed-schema.json
> >   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> >   DTC_CHK Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.example.dtb
> > 
> > - Link to v2: https://lore.kernel.org/r/20240304-pci2_upstream-v2-0-ad07c5eb6d67@nxp.com
> > 
> > Changes in v2:
> > - remove file to 'pcie-imx.c'
> > - keep CONFIG unchange.
> > - Link to v1: https://lore.kernel.org/r/20240227-pci2_upstream-v1-0-b952f8333606@nxp.com
> > 
> > ---
> > Frank Li (7):
> >       PCI: imx6: Rename imx6_* with imx_*
> >       PCI: imx6: Rename pci-imx6.c to pcie-imx.c
> >       MAINTAINERS: pci: imx: update imx6* to imx* since rename driver file
> >       PCI: imx: Simplify switch-case logic by involve set_ref_clk callback
> >       PCI: imx: Simplify switch-case logic by involve core_reset callback
> >       PCI: imx: Config look up table(LUT) to support MSI ITS and IOMMU for i.MX95
> >       PCI: imx: Consolidate redundant if-checks
> > 
> > Richard Zhu (4):
> >       PCI: imx6: Fix PCIe link down when i.MX8MM and i.MX8MP PCIe is EP mode
> >       PCI: imx6: Fix i.MX8MP PCIe EP can not trigger MSI
> >       dt-bindings: imx6q-pcie: Add i.MX8Q pcie compatible string
> >       PCI: imx6: Add i.MX8Q PCIe support
> > 
> >  .../bindings/pci/fsl,imx6q-pcie-common.yaml        |    5 +
> >  .../devicetree/bindings/pci/fsl,imx6q-pcie.yaml    |   18 +
> >  MAINTAINERS                                        |    4 +-
> >  drivers/pci/controller/dwc/Makefile                |    2 +-
> >  .../pci/controller/dwc/{pci-imx6.c => pcie-imx.c}  | 1173 ++++++++++++--------
> >  5 files changed, 727 insertions(+), 475 deletions(-)
> > ---
> > base-commit: 2e45e73eebd43365cb585c49b3a671dcfae6b5b5
> > change-id: 20240227-pci2_upstream-0cdd19a15163
> > 
> > Best regards,
> > ---
> > Frank Li <Frank.Li@nxp.com>
> > 

-- 
மணிவண்ணன் சதாசிவம்
