Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E88213E7A
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 14:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763045116; cv=none; b=fvgsrEE6Iglo6WRwfDPbsEhmdqfnPEmZ+1+qFOb8hBz2/pAVdfqQ9ho4BSjuA2D1B7/yevcI/DqocHEolU3mylMYmy4goj8GlDwCShZ6UxvG7280hWhU1q2sS1Gva+wK3RljkCNyxAROa3FqRDiOgK9UOom07DP5SjvWHvslQUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763045116; c=relaxed/simple;
	bh=8WiMhuBKU7uISQx1WePYrV/nI54SOz4u0gi10cE+jSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqaKgMcEX6lryHM3+fmvfQL0f2uZzQrTdOIy/KgkAAOw5+iY2QVDqvGO0KWtMjOH62IBU9PWdCupmIVNEe5OJeelALTFOpMbfian29+PcEaQkc3nkhNFtXQP3E0Qv3bSpzKS3XwYQWDh429gza3HrERHeRX9HvOD3msybTjHjYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=On3OCjGZ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="On3OCjGZ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so1769719a12.2
        for <imx@lists.linux.dev>; Thu, 13 Nov 2025 06:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763045112; x=1763649912; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m53OXX0FSEdVsD/HzcBlcWiZnahYMqqYD9/Rw82fxP8=;
        b=On3OCjGZkQ6xupKpOa6pPt4/3cDWdeDf+FdAywnAs/EKyStQumT90xCOiJXRXNsa1C
         GbpSFtNItmJXD8L6ZMDFMuPjf5/lg43HY680GGKoCaJUFOo+vwDjmxMqHSE7KTJeREm/
         nzoRnzZ+3X2+x5O6UxQKsKryciMDUvmUw2PZeIQbp/2Mtd24Rna5kfhLsUhLAbkYXkFJ
         kP7VMFCGif1IFlwApi7YQm80hnRkFyWN97/Yp6RvHt5O7u8SHqabBcCXJxHOnsZC6sEM
         xvAR9enQyPKruHg5VklzTlvGhm8X5ii+2kV7kpPqBJNRg+yvP7axLtjU2s7ZM473iI8d
         bcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763045112; x=1763649912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m53OXX0FSEdVsD/HzcBlcWiZnahYMqqYD9/Rw82fxP8=;
        b=XjAJcl4qE2KBudUu7ZbtWtXf8iYrvbLed4n8SLLVUKmIluubIzss3S4dzDmfBDfeir
         18mnF3L26HvmwIYon5FWsO8c5mGyS8q5YoSv3obsgNrVZ7Dro9yOfQ18nR2vPC/oecfR
         v3ZCfjBFSczrDa0xFcqh9HDtEnfOWrlYQq0RGcHrgg3NbOkrebtWx7XS/RnTGzkZU2d3
         TtCaAW5xC5NjSNU106fJ5JnTWQ3jAsQ4zeHwZUrjwgJuDE6SCEYCsPt2doLlo67SkjKY
         pMWEZSW0yeL1aNNBgOmwYxkk6AdGbFbwXG//mfpUxpHv85mYsjC+/l9omHhkg4crPTP5
         vw1g==
X-Forwarded-Encrypted: i=1; AJvYcCVljC0E23Oni+dLo97mfjTsbswPDMlK2nLtGujzOh9Louptpftb4gY/s1YJ1ulc6/h68oY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZsdhwLPAAmzllV7hY0pKZ2AXIv1r+rlulzhyyHxWHhlgIV+rJ
	pAa/krt7Z37UV3VX+Nd8my3FquDrSvL+oyMAPsh6vu+qZg9bUQ5gokhPqid31qMCNfpOevEpcVB
	ipwCxp7BCFrqwacZ7OWORKK22XJZ2QIwcvIujQ0tCFQ==
X-Gm-Gg: ASbGnct+hFWbrImZz6clKE+eu1X/nvBhm4oK4qjgHRhudQFDIfSV9Y9V89wp1qNx2YA
	boxdyk0Mt0EB8Q9Rpusb4arTPN5uFBLC6p6rLfpdEyqunax/AutmxOIPGqRamOyfQ+3Fifaupe6
	YPsL7oUdtCGXyOrra+Z1eimJBlCghORf0bcLmEYzcxGccH0jPwOoWim2+w+/AjG7e3MEu+KkjU/
	MYL0fvKDcxHekPPhPczajUSRdPgs4JXe+J6PRBbuMSq70GTXBgmOLoPv5JoGrd4bXDgQAf2iBaj
	Q6ddGgYPmnnTYw==
X-Google-Smtp-Source: AGHT+IH4jj6eVtxRt3wKbnn+UazVGdwbCJoI149sIZw96/aCkUMses1jDosEW0DIlhxtvuCWHuc2IKSjJmxjA9t2HMA=
X-Received: by 2002:a05:6402:42c8:b0:640:fb13:6b8 with SMTP id
 4fb4d7f45d1cf-6431a548655mr6370272a12.22.1763045111775; Thu, 13 Nov 2025
 06:45:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251110173334.234303-1-vincent.guittot@linaro.org>
 <20251110173334.234303-4-vincent.guittot@linaro.org> <aRI9T260bl9bok4W@lizhi-Precision-Tower-5810>
In-Reply-To: <aRI9T260bl9bok4W@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 13 Nov 2025 15:44:58 +0100
X-Gm-Features: AWmQ_bkvZNjQ1Qh_dA2hcZ-2KrSCoqn4Hw9CqqUeyqhk9LfBW4EldGpwJgFMJrs
Message-ID: <CAKfTPtDCysLA6TLxUnP8-vsD4DwvPz2Ri6R5k6YE4ZtQY0uk8Q@mail.gmail.com>
Subject: Re: [PATCH 3/4 v4] PCI: s32g: Add initial PCIe support (RC)
To: Frank Li <Frank.li@nxp.com>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Nov 2025 at 20:30, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Nov 10, 2025 at 06:33:33PM +0100, Vincent Guittot wrote:
> > Add initial support of the PCIe controller for S32G Soc family. Only
> > host mode is supported.
> >
> > Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/Kconfig            |  10 +
> >  drivers/pci/controller/dwc/Makefile           |   1 +
> >  .../pci/controller/dwc/pcie-nxp-s32g-regs.h   |  27 ++
> >  drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 435 ++++++++++++++++++
> >  4 files changed, 473 insertions(+)
> >  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
> >  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c
> >
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index 349d4657393c..e276956c3fca 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -256,6 +256,16 @@ config PCIE_TEGRA194_EP
> >         in order to enable device-specific features PCIE_TEGRA194_EP must be
> >         selected. This uses the DesignWare core.
> >
> > +config PCIE_NXP_S32G
> > +     tristate "NXP S32G PCIe controller (host mode)"
> > +     depends on ARCH_S32 || COMPILE_TEST
> > +     select PCIE_DW_HOST
> > +     help
> > +       Enable support for the PCIe controller in NXP S32G based boards to
> > +       work in Host mode. The controller is based on DesignWare IP and
> > +       can work either as RC or EP. In order to enable host-specific
> > +       features PCIE_NXP_S32G must be selected.
> > +
> >  config PCIE_DW_PLAT
> >       bool
> >
> > diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
> > index 7ae28f3b0fb3..3301bbbad78c 100644
> > --- a/drivers/pci/controller/dwc/Makefile
> > +++ b/drivers/pci/controller/dwc/Makefile
> > @@ -10,6 +10,7 @@ obj-$(CONFIG_PCI_DRA7XX) += pci-dra7xx.o
> >  obj-$(CONFIG_PCI_EXYNOS) += pci-exynos.o
> >  obj-$(CONFIG_PCIE_FU740) += pcie-fu740.o
> >  obj-$(CONFIG_PCI_IMX6) += pci-imx6.o
> > +obj-$(CONFIG_PCIE_NXP_S32G) += pcie-nxp-s32g.o
> >  obj-$(CONFIG_PCIE_SPEAR13XX) += pcie-spear13xx.o
> >  obj-$(CONFIG_PCI_KEYSTONE) += pci-keystone.o
> >  obj-$(CONFIG_PCI_LAYERSCAPE) += pci-layerscape.o
> > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h b/drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
> > new file mode 100644
> > index 000000000000..c264446a8f21
> > --- /dev/null
> > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright 2015-2016 Freescale Semiconductor, Inc.
> > + * Copyright 2016-2023, 2025 NXP
> > + */
> > +
> > +#ifndef PCIE_S32G_REGS_H
> > +#define PCIE_S32G_REGS_H
> > +
> > +/* PCIe controller Sub-System */
> > +
> > +/* PCIe controller 0 General Control 1 */
> > +#define PCIE_S32G_PE0_GEN_CTRL_1             0x50
> > +#define DEVICE_TYPE_MASK                     GENMASK(3, 0)
> > +#define SRIS_MODE                            BIT(8)
> > +
> > +/* PCIe controller 0 General Control 3 */
> > +#define PCIE_S32G_PE0_GEN_CTRL_3             0x58
> > +#define LTSSM_EN                             BIT(0)
> > +
> > +/* PCIe Controller 0 Link Debug 2 */
> > +#define PCIE_S32G_PE0_LINK_DBG_2             0xB4
> > +#define SMLH_LTSSM_STATE_MASK                        GENMASK(5, 0)
> > +#define SMLH_LINK_UP                         BIT(6)
> > +#define RDLH_LINK_UP                         BIT(7)
> > +
> > +#endif  /* PCI_S32G_REGS_H */
> > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > new file mode 100644
> > index 000000000000..18bf0fe6f416
> > --- /dev/null
> > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > @@ -0,0 +1,435 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * PCIe host controller driver for NXP S32G SoCs
> > + *
> > + * Copyright 2019-2025 NXP
> > + */
> > +
> ...
> > +
> > +#define PCIE_LINKUP  (SMLH_LINK_UP | RDLH_LINK_UP)
> > +
> > +static bool s32g_has_data_phy_link(struct s32g_pcie *s32g_pp)
> > +{
> > +     u32 reg = s32g_pcie_readl_ctrl(s32g_pp, PCIE_S32G_PE0_LINK_DBG_2);
> > +
> > +     if ((reg & PCIE_LINKUP) == PCIE_LINKUP) {
> > +             switch (FIELD_GET(SMLH_LTSSM_STATE_MASK, reg)) {
> > +             case DW_PCIE_LTSSM_L0:
> > +             case DW_PCIE_LTSSM_L0S:
> > +             case DW_PCIE_LTSSM_L1_IDLE:
> > +                     return true;
> > +             default:
> > +                     return false;
>
> Are you sure code can go here? I think IP set flag PCIE_LINKUP of
> PCIE_S32G_PE0_LINK_DBG_2 only after LTSSM in above states. Do you know
> which case PCIE_LINKUP is true, but LTSSM is not other state?

I don't have access to such details but can't we have
DW_PCIE_LTSSM_L123_SEND_EIDLE or other transient state but PCIE_LINKUP
?

>
> I remember I asked if DEBUG0 register work? any conclusion?

I mentioned in the cover letter that I was still waiting feedback from
internal team before switching to DEBUG0 and DEBUG1 and remove
.get_ltssm() and .link_up()

I received the feedback earlier today that I can use DEBUG0 and
DEBUG1, so I don't need to implement .get_ltssm() and .link_up(). I
will remove them in the next version

>
> > +             }
> > +     }
> > +
> > +     return false;
> > +}
> > +
>
> ...
>
> > +
> > +static int s32g_pcie_parse_port(struct s32g_pcie *s32g_pp, struct device_node *node)
> > +{
> > +     struct device *dev = s32g_pp->pci.dev;
> > +     struct s32g_pcie_port *port;
> > +     int num_lanes;
> > +
> > +     port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> > +     if (!port)
> > +             return -ENOMEM;
> > +
> > +     port->phy = devm_of_phy_get(dev, node, NULL);
> > +     if (IS_ERR(port->phy))
> > +             return dev_err_probe(dev, PTR_ERR(port->phy),
> > +                             "Failed to get serdes PHY\n");
> > +
> > +     INIT_LIST_HEAD(&port->list);
> > +     list_add_tail(&port->list, &s32g_pp->ports);
> > +
> > +     /*
> > +      * The DWC core initialization code cannot parse yet the num-lanes
> > +      * attribute in the Root Port node. The S32G only supports one Root
> > +      * Port for now so its driver can parse the node and set the num_lanes
> > +      * field of struct dwc_pcie before calling dw_pcie_host_init().
> > +      */
> > +     if (!of_property_read_u32(node, "num-lanes", &num_lanes))
> > +             s32g_pp->pci.num_lanes = num_lanes;
>
> Can you add this to dwc core driver?
>
> Frank
>
> > +
> > +     return 0;
> > +}
> > +
> ...
> > --
> > 2.43.0
> >
