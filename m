Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D768315D5AB
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 02:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722998315; cv=none; b=UZILyHGqMmvzY/uxcaMW/CnceFkXJLn/MfVK0dLc3gPae4Olau/D+5I45csNvJxGAUiZ5vNQHYvZkNw3SrIspTkDAXSI+uPpUfsUe6s7LN7rC0nJLD4qvG4Jy+cO/sV7Gp+44nmj4VXU7N62brYB2GhL3IchYhcJJdeioeIQD9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722998315; c=relaxed/simple;
	bh=H53QfNZ8ujjLxAzVaZqiEMr4h97nSljQkNpQ18CRFWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeVZU66HItW8tY6XDSiOH1xM/vXwwfZVX3mJzY+Mk6a7pJrq0Valdkr+sQ4ST68JIm0V4EChkq2wY1UeSIFTjmf8+IWCjy2Kgo42HrGuCYXJLAFF493LiuUJggppMH3AsW/72xO17jYYIzQHJ+dh4Y8cx4hQfGUIO1rb7N1nkB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nJGNYDol; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nJGNYDol"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc56fd4de1so3339815ad.0
        for <imx@lists.linux.dev>; Tue, 06 Aug 2024 19:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722998313; x=1723603113; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mtp3NbD/YqRvTh1X6hVLatX9/l1nLSm5GP8YfNboPug=;
        b=nJGNYDolyyW3VcXfxVYTROIpHUnyJPeB9nlmZDIHqffe+PHqN35V5Kc2TweoOvGW+b
         CUu5epSUnOVvNqzIJELdhkwnq2VGJSXwZsM3oqnRvHnbMaF82Gb5v/RyzYdNEq8uFB30
         hlVeYcxDcpwICXjqKc/ZVcqyByCWFld76FHihDy2AFwQbVx5plf11+iKyjydEwHCeI3G
         32E4XsQyNiTq49f5z9zHl6p575NceO73vjPS1JTeasScvLNHOTGwmMDx5wlA7f1lwKM+
         iZEAKEk95uKmTT32SQYVhQzHFCWVJMntYrJBxnVPu5Uju/bJcTiGPY2hkvIrERHKeJV8
         /FoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722998313; x=1723603113;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mtp3NbD/YqRvTh1X6hVLatX9/l1nLSm5GP8YfNboPug=;
        b=tEuqD7Fn5lRKTg9VKTOVtbfTqowcoRf/cZ4mxA2SJeRPXQGcn7T24zXZh2Kivv+bqJ
         va1B8oTPSitLslyexLweLu4GrYQH7RWOJeUxitDpfBu5aDEUMwuvJvLRuztKZNzqX+c8
         4UwJuXA7eWpgpwlFTTY0qBHQJo4VHAZyewiqmd9I21Vv22W7tuSaiCJIOnpZ7lIKFMnO
         Nsz+wTcMQfTIFdvm5Iw86VCoMzCk8QGKuX13pAejmCXFQPyN+A0rJO1wJk08GlHvbj0K
         EP9ajc4l7/eTlSKxGjrW5OQNtLlfqJztEWPjrbK0yuhx+xo2dY/fvw3YqAvSJSoxm7w3
         jEQw==
X-Forwarded-Encrypted: i=1; AJvYcCX+RSbYKhMnt7m7e7eFBlrJIyM86M1ZFJC8bh5E4oTA2lgL8woDxIggs4SY4w5cBcCoup5Sjt1vo0q22+6Ywlx9CZIK
X-Gm-Message-State: AOJu0YxgP5oZdEqBdFg5Dy9tnPWoBO73hiOQEXDrjJmAW/UFN6CCfXcQ
	qGSgvLut2GTW75FJ6bPrTuZ9G8DB2DGLh2rywi8hf61BzMOpLjbCx8O4KranJg==
X-Google-Smtp-Source: AGHT+IEd1qQTRt9UOIknRR+fvi02G2idHTW2IbPzXHNTiCav0Sk5mM6ZKvmCfShwLcwTUuICmygZSg==
X-Received: by 2002:a17:902:da8d:b0:1fc:5b81:729f with SMTP id d9443c01a7336-200855706cemr10944935ad.32.1722998313089;
        Tue, 06 Aug 2024 19:38:33 -0700 (PDT)
Received: from thinkpad ([120.60.72.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f29d37sm94937275ad.48.2024.08.06.19.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 19:38:32 -0700 (PDT)
Date: Wed, 7 Aug 2024 08:08:14 +0530
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
	devicetree@vger.kernel.org, Jason Liu <jason.hui.liu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 00/11] PCI: imx6: Fix\rename\clean up and add lut
 information for imx95
Message-ID: <20240807023814.GD3412@thinkpad>
References: <20240729-pci2_upstream-v8-0-b68ee5ef2b4d@nxp.com>
 <ZrKIotkhvAnt87fX@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZrKIotkhvAnt87fX@lizhi-Precision-Tower-5810>

On Tue, Aug 06, 2024 at 04:33:38PM -0400, Frank Li wrote:
> On Mon, Jul 29, 2024 at 04:18:07PM -0400, Frank Li wrote:
> > Fixed 8mp EP mode problem.
> >
> > imx6 actaully for all imx chips (imx6*, imx7*, imx8*, imx9*). To avoid
> > confuse, rename all imx6_* to imx_*, IMX6_* to IMX_*. pci-imx6.c to
> > pci-imx.c to avoid confuse.
> >
> > Using callback to reduce switch case for core reset and refclk.
> >
> > Base on linux 6.11-rc1
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
> > Changes in v8:
> > - Rebase to 6.11-rc1
> > - Add Mani's review tags for 2, 6, 8, 9, 10
> > - Add fix patch PCI: imx6: Fix missing call to phy_power_off() in error handling
> > - keep enable_ref_clk(), I will add more code to make disabe/enable symtric
> > - Link to v7: https://lore.kernel.org/r/20240708-pci2_upstream-v7-0-ac00b8174f89@nxp.com
> 
> 
> Manivannan:
> 
> 	Do you have chance to review these again? Only few patch without
> your review tag.
> 

Done, series LGTM.

- Mani

> Frank
> 
> >
> > Changes in v7:
> > - rework commit message for PCI: imx6: Fix i.MX8MP PCIe EP's occasional failure to trigger MSI
> > - Add Mani's review tags for patch 1, 5
> > - Fix errata number in commit message for patch 6
> > - replace set_ref_clk with enable_ref_clk in patch 4
> > - using regmap_set(clear)_bits in patch 4
> > - Use exactly the same logic with original code at patch 4
> > - Add errata doc link for patch 6
> > - Fix miss "." at comment form patch 6.
> > - order include header for patch 9
> > - use cap register to set_speed for patch 9
> > - use PCIe in error msg for patch 9
> > - Remove reduntant ':' at patch 9' subject.
> > - Change range to ranges for patch 10.
> > - Change error code to -ENODEV for patch 10.
> > - Link to v6: https://lore.kernel.org/r/20240617-pci2_upstream-v6-0-e0821238f997@nxp.com
> >
> > Changes in v6:
> > - Base on Linux 6.10-rc1 by Bjorn's required.
> > - Remove imx95 LUT patch because it need more time to work out the
> > solution. This patch add 8qxp and 8qm and support and some bug fixes.
> > - Link to v5: https://lore.kernel.org/r/20240528-pci2_upstream-v5-0-750aa7edb8e2@nxp.com
> >
> > Changes in v5:
> > - Rebase to linux-pci next. fix conflict with gpiod change
> > - Add rob and cornor's review tag
> > - Link to v4: https://lore.kernel.org/r/20240507-pci2_upstream-v4-0-e8c80d874057@nxp.com
> >
> > Changes in v4:
> > - Improve comment message for patch 1 and 2.
> > - Rework commit message for patch 3 and add mani's review tag
> > - Remove file rename patch and update maintainer patch
> > - [PATCH v3 06/11] PCI: imx: Simplify switch-case logic by involve set_ref_clk callback
> > 	remove extra space.
> > 	keep original comments format (wrap at 80 column width)
> > 	update error message "'Failed to enable PCIe REFCLK'"
> > - PATCH v3 07/11] PCI: imx: Simplify switch-case logic by involve core_reset callback
> > 	keep exact the logic as original code
> > - Add patch to update comment about workaround ERR010728
> > - Add patch about help function imx_pcie_match_device()
> > - Using bus device notify to update LUT information for imx95 to avoid
> > parse iommu-map and msi-map in driver code.  Bus notify will better and
> > only update lut when device added.
> > - split patch call PHY interface function.
> > - Improve commit message for imx8q. remove local-address dts proptery. and
> > use standard "range" to convert cpu address to bus address.
> > - Check entry in cpu_fix function is too late. Check it at probe
> > - Link to v3: https://lore.kernel.org/r/20240402-pci2_upstream-v3-0-803414bdb430@nxp.com
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
> >       PCI: imx6: Fix missing call to phy_power_off() in error handling
> >       PCI: imx6: Rename imx6_* with imx_*
> >       PCI: imx6: Introduce SoC specific callbacks for controlling REFCLK
> >       PCI: imx6: Simplify switch-case logic by involve core_reset callback
> >       PCI: imx6: Improve comment for workaround ERR010728
> >       PCI: imx6: Consolidate redundant if-checks
> >       PCI: imx6: Call common PHY API to set mode, speed, and submode
> >
> > Richard Zhu (4):
> >       PCI: imx6: Fix establish link failure in EP mode for iMX8MM and iMX8MP
> >       PCI: imx6: Fix i.MX8MP PCIe EP's occasional failure to trigger MSI
> >       dt-bindings: imx6q-pcie: Add i.MX8Q pcie compatible string
> >       PCI: imx6: Add i.MX8Q PCIe root complex (RC) support
> >
> >  .../devicetree/bindings/pci/fsl,imx6q-pcie.yaml    |  16 +
> >  drivers/pci/controller/dwc/pci-imx6.c              | 989 +++++++++++----------
> >  2 files changed, 542 insertions(+), 463 deletions(-)
> > ---
> > base-commit: c428091cdcf7f368ad9884f8caa68b79cd6c333a
> > change-id: 20240227-pci2_upstream-0cdd19a15163
> >
> > Best regards,
> > ---
> > Frank Li <Frank.Li@nxp.com>
> >

-- 
மணிவண்ணன் சதாசிவம்
