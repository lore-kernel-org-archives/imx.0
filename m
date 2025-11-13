Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE74364E83
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 16:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763053152; cv=none; b=kzreiOGa1bVztfBK2ddNS30Ll6y3JfTKmvJ5Ka+CqbekG0vCamfJIUbtkixtO1Vx83AC5bnh8PPTCQH2axWYo7OCYJ2qcZv0ylGip84Z2E6LXdRrnSmvWGG+ma+1Oxa0fq5iwGMKPlo3YiCbJkTfwGOo9bimG73f0RRmLcPrhh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763053152; c=relaxed/simple;
	bh=xbKveKZnMEV74izGFNst9sDTLVDcIA8bsSE/ScapJi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyZNgIXujmYnXvb0136JZW+fPdk5ZxwwbSiMPnvF9vXK5Bs+C6Ij5bKn9LsRSdPWD4ECJNLt+tnfuU62oCqD6p01M/4+moAVSM7G1smE0+rOHE4DDsYo3ZuafsaHoeOm0CaDwVWKZoFeVwO3e5IU4UtHdAJIc/MHhFCoUswfkBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWLXVRQH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWLXVRQH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so1546024a12.3
        for <imx@lists.linux.dev>; Thu, 13 Nov 2025 08:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763053148; x=1763657948; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nKGQCbFSZFfN1OMLvE+EkMUU0QXCTcfpOtpHJMHTRc0=;
        b=TWLXVRQH8FwTh+VAH6X39OmWmZEFfBzX5XliblahjkeoDsuL10rHGyKF/WvuOG7ihq
         bXGdZfX2ERyC0at/oFDN1DTx2z2g7X4d5jgzVnbTkeJ+sJ+UieQ2GmNtbDeLqi64yD5x
         L0PEtjPbmW40ej4o33Ypr0qk3zDGg8eyAelZj6Zk3bOhwzPVRKIhgnXvqhvWptGhulHY
         Cqu8OHeG9/ubcY+5FEchxLXN0NRP+YZTE0X+Gxg2copQFPT0oL7Sd5Na0WtYiIxm0Gef
         j81cyG7dynTZw6uqttOkmt6LA2+6/Vz0IQ09GjiQ07tMUQVERAgnM2nWs59MV7nxW1TX
         PLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763053148; x=1763657948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKGQCbFSZFfN1OMLvE+EkMUU0QXCTcfpOtpHJMHTRc0=;
        b=XbxGHM4Jv66mvjZrp9H15VnVjffDYjMNvXPoxLTSEhnNKwkWeu4sCcgnsgouFKgcBf
         eT750ebN/kL/J5Ge0pQqrHpzMfMT0mMnQm7jDQ4c2AMDN9cCWE7trvYxWqMErbYwUg5S
         c9buZijX0wrj030y4nJWcBO7OVoo+a2TCMpioHLkh94qVAdIT1HPDEyrx+qgbb4fc8z+
         rUHITZX8v+JdAvodCcT9bGYqOzyt6WTdXkH70aB7fGL32i6EMU4wM7JddrKMVOx1JGpT
         CW7FANsHa5el2OihGE6u45GF28/F1mQV4VCbQKfSySk8IPZX7KGfV79T6h5KWiAr76NA
         VJjw==
X-Forwarded-Encrypted: i=1; AJvYcCXxP9WACBCcK93M98LSqWvuehMgwDD/vvUVASwwjDW5CHKvw3xXdI52O22UBX8RlZihSG8=@lists.linux.dev
X-Gm-Message-State: AOJu0YweV7pr7pJ8xQapDC9Z7and0bV9bk5HXP1V8vJ0Ei70Aq8t+XRX
	PjeuuEh9Y1I04lwCwRIog3NSFc3xP3WFmREcwN8w49+qAb9SnPM29/lq1NB81EC5RiioW0Bb2BJ
	nKuHt+mfycGFuec7Ffw/e0vWyzY0eVYjnEDVBonUgOg==
X-Gm-Gg: ASbGncvIR1ujvACwBmUuD/ACz8Z0xNkzOJAcLrngLpW6ACGBXmz0PqndL9Kw1UfR6Yn
	JRRcwVtZjmpVDJ8k1CK9qu5yydZmNHI910LjY+QOJ64sf/2nGf5ismoT5uryefmExKyjPWdDX42
	c1Z7reyOEibTaEMVK5fjbm8JhQKt+kdNU3i0OqBzMr8Pj/S1KYmxO6RhVkPzs9pSVkoNwLoBmZo
	ytxKWQ5DeGtJpl/Cz5UzfDzx2x9kUC8BXV/IZ1JxurLBScL2aG6yR5Fb1PqsBJZeCz8Z/UWYvGy
	Ttdf2B8EhLfntQ==
X-Google-Smtp-Source: AGHT+IHNiNj5c6BzZKED1Z000ERZybmUuYkJX4r0ws3HcIoZwiOXufpN2vALmssDs7zOCU5+nbxIjpi4YX1O6qX0ouE=
X-Received: by 2002:a05:6402:254a:b0:63c:4da1:9a10 with SMTP id
 4fb4d7f45d1cf-6431a55e345mr6812988a12.31.1763053148461; Thu, 13 Nov 2025
 08:59:08 -0800 (PST)
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
Date: Thu, 13 Nov 2025 17:58:57 +0100
X-Gm-Features: AWmQ_bkUC0Olt3VIt07NPBKQfZFgoo8sTusuWbmfnXreuUvnA3jlm9GTd56XT6U
Message-ID: <CAKfTPtAFg-=k_Et8RMa4Ok1oBv87qpMrdiW+Xy9NixZAXUUm6w@mail.gmail.com>
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
>
> I remember I asked if DEBUG0 register work? any conclusion?
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

It has been agreed on v3 that I should handle this locally for now
until dwc core driver gets the support of root port nodes
https://lore.kernel.org/all/20251106173853.GA1959661@bhelgaas/

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
