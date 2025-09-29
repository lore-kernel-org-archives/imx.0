Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D034C30C0ED
	for <imx@lists.linux.dev>; Mon, 29 Sep 2025 16:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759163001; cv=none; b=PuVSnos/N97F53tPel0hNOzIg3Qsn/yMqGgqDUibBtFZ/VL2mPxb8QPDJJL39chQPZzeCz++Jl/rfvym9CdoUQD6H2HTqybNN1qHFIhPsvZKRP4u3qw2tlOn5crutBclJ/6qaphVPAyKl/9mz/gLFsyBPnF/d2j3UVS8PAusdBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759163001; c=relaxed/simple;
	bh=lm9i8y7Ti1H6l0SiJXFDsZCS8BN+fGL4O3uSzyhpnWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdb+U3pR9g+d5oC1XAEWtNfok8TCI+pzb7ZGFIaflRbZJtpGrhsjkH+4HumWM0LRi/DoYpTnE1K9qeuAuWiDjztgQoJO/CS7ArSHjP3TJiznN+h6Mt82TTHGfCwV+IZtiowOCriaNy2mHifTAiCWT0DtpcOnfB5BQ/mYHs0Siaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xwldfDaj; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xwldfDaj"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso10848341a12.1
        for <imx@lists.linux.dev>; Mon, 29 Sep 2025 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759162997; x=1759767797; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YQoxCqYRFr1IPODxO3ePMy5XMnd34Oj4csnrBa794A=;
        b=xwldfDajH1dgJDrBDHTjvRkCPZKpViuwaSTYT7WJEaG9d0uBOG6N4ViSgHm7qKTVac
         A/+EohvCjQWJL+n6tLQnREYK/jKovereNAut/qTIDOukLOygwS7aTdRyS/tuntPcTiLT
         W3l9TbFk7dnjFQNnvXZWhkLrQplCpNvoHbOktUHMyKZdN4AegQVKtYT6RRUAcod2Nl/l
         1JfEbD5/GsxN1pY17A/ba2Uehda9PbUhuQLX2ij74GU3tec3aud/QD9NxHuAnwQO/RT8
         VEH9EwnsSM0tINqt/LHOgxWQnV5r1Lg5x89MkgBrgbhmyFl8QQxwVJyC1LwFRgFqEHoh
         yPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759162997; x=1759767797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YQoxCqYRFr1IPODxO3ePMy5XMnd34Oj4csnrBa794A=;
        b=KmkQmGzlBpnOG1Fu51BM6VTBzmj8cJB8PNyWySCK49YbeS6teLLJ3BwzPFftrkQMRk
         NpTQYWy88ZV2bOR7rmf17L/d3A1o3HsIeSziA79NQzbeqDok9elYfGT1tnzRivkCVEqi
         muVzxbsHc2Un+XK6Z92dpYY26k8QAFjxvB1KPSNFmOgN2rKzFZH52ry3BEdIrfdTZr/9
         hfgJL7VB7OOLZSF2UU1BZJxPgHSOg6GDkMOKHc1V+zkQalRdR9u90b0s2rHuJXFeXR54
         rBkIyXrgtpN7VFiWabC08lFY9yLoTs8/mcY4K344GkEnHTGk0sf6pPybr5+lyNLv9zUw
         L6rA==
X-Forwarded-Encrypted: i=1; AJvYcCXd+AHSiit2Nk+PkNTZbalSj8orhH+0YfcTLjvGTjDReDeQcw5nYBa+x9VP2wHgheIzrag=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyarUHeafuJNZQIQ3s9iTB/Em1dbDv1zCEJoBTVRsPn/b9358/
	+UXUT1Tolxts6JcqDqSm6g7ECTk6ZrNbXfkDYKBXaURNyqKgFCGgfknwaHq2QiTLEp2BS2MzHoa
	sa1F39GEtSyQxEwyvEmRWr3gHT4VIRj5J7vRL6zlEOg==
X-Gm-Gg: ASbGncv5rMKoAhFwDJ6SgDV4/if7lS5sn6HZrn52W44dqCnE/6Mp7E96hJMAnpFcY9B
	++5iw0LuPUQ9aYCRdEpsQa8M0cFQO+eUw4gn0SPlBCiaIMGdV43LFKrWnfIssKn3krECvlG3mJj
	nn/bLXBcGFY6eEc2iUTiisCvAfous4ESWKO3Im5Qq0x6i/OqaIhdMzqlycA1jC+8eszV5xTtI0W
	ePe6YRR13F7EK+y+btP4HYnsv2Q+c1VS6q5PsFskhZJ5XU=
X-Google-Smtp-Source: AGHT+IEQD1BpgSF0z/c/mJJwi8cnJHWjQYFs7yuK6+w9PPbW1p70qiX8XqOv4IL6RqByzwe1yUK1NZrqO2adewR/gmE=
X-Received: by 2002:aa7:c88f:0:b0:631:b058:bef0 with SMTP id
 4fb4d7f45d1cf-6349faa0ceamr11349916a12.32.1759162996913; Mon, 29 Sep 2025
 09:23:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-3-vincent.guittot@linaro.org> <4ee5tqdjv5ogcdtysiebtoxmrvrzhkar4bjcsqi47dxtgwac4c@rezn4waubroh>
 <CAKfTPtAEkegCV-9_x-dXSWQFOoG6kO5JbJq_LToY9YuuRusoVA@mail.gmail.com> <lmczw5agheqbcl6xcomlhf7yfbdvfx45pozmaxjmbkkqudsxlu@c7u6s5h4xm6j>
In-Reply-To: <lmczw5agheqbcl6xcomlhf7yfbdvfx45pozmaxjmbkkqudsxlu@c7u6s5h4xm6j>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 29 Sep 2025 18:23:05 +0200
X-Gm-Features: AS18NWDZOxPs7jB1-W-zDx-gh2UpfgrmkNJD8zYQ6wJpdnMNmLjoT0rjb-_sqWM
Message-ID: <CAKfTPtCacFhJztYvWycSdoWMUStaf1WAcGJKHwk3y4n-uEELSw@mail.gmail.com>
Subject: Re: [PATCH 2/3 v2] PCI: s32g: Add initial PCIe support (RC)
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Sept 2025 at 15:57, Manivannan Sadhasivam <mani@kernel.org> wrot=
e:
>
> On Thu, Sep 25, 2025 at 06:52:57PM +0200, Vincent Guittot wrote:
> > On Mon, 22 Sept 2025 at 09:56, Manivannan Sadhasivam <mani@kernel.org> =
wrote:
> > >
> > > On Fri, Sep 19, 2025 at 05:58:20PM +0200, Vincent Guittot wrote:
> > > > Add initial support of the PCIe controller for S32G Soc family. Onl=
y
> > > > host mode is supported.
> > > >
> > > > Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > > > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > > > Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.co=
m>
> > > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > > > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > > > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > > > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > > > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/Kconfig           |  11 +
> > > >  drivers/pci/controller/dwc/Makefile          |   1 +
> > > >  drivers/pci/controller/dwc/pcie-designware.h |   1 +
> > > >  drivers/pci/controller/dwc/pcie-s32g-regs.h  |  61 ++
> > > >  drivers/pci/controller/dwc/pcie-s32g.c       | 578 +++++++++++++++=
++++
> > > >  5 files changed, 652 insertions(+)
> > > >  create mode 100644 drivers/pci/controller/dwc/pcie-s32g-regs.h
> > > >  create mode 100644 drivers/pci/controller/dwc/pcie-s32g.c
> > > >
> > > > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/contr=
oller/dwc/Kconfig
> > > > index ff6b6d9e18ec..d7cee915aedd 100644
> > > > --- a/drivers/pci/controller/dwc/Kconfig
> > > > +++ b/drivers/pci/controller/dwc/Kconfig
> > > > @@ -255,6 +255,17 @@ config PCIE_TEGRA194_EP
> > > >         in order to enable device-specific features PCIE_TEGRA194_E=
P must be
> > > >         selected. This uses the DesignWare core.
> > > >
> > > > +config PCIE_S32G
> > >
> > > PCIE_NXP_S32G?
> >
> > I don't have a  strong opinion on this. I have followed what was done
> > for other PCIE drivers which only use soc family as well like
> > PCI_IMX6_HOST
> > PCIE_KIRIN
> > PCIE_ARMADA_8K
> > PCIE_TEGRA194_HOST
> > PCIE_RCAR_GEN4
> > PCIE_SPEAR13XX
> >
>
> I'd prefer to have vendor prefix to avoid collisions. Especially if the p=
roduct
> name is something like S32G, which is not 'unique'.
>
> > >
> > > > +     bool "NXP S32G PCIe controller (host mode)"
> > > > +     depends on ARCH_S32 || (OF && COMPILE_TEST)
> > > > +     select PCIE_DW_HOST
> > > > +     help
> > > > +       Enable support for the PCIe controller in NXP S32G based bo=
ards to
> > > > +       work in Host mode. The controller is based on DesignWare IP=
 and
> > > > +       can work either as RC or EP. In order to enable host-specif=
ic
> > > > +       features PCIE_S32G must be selected.
> > > > +
> > > > +
> > > >  config PCIE_DW_PLAT
> > > >       bool
> > > >
> > > > diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/cont=
roller/dwc/Makefile
> > > > index 6919d27798d1..47fbedd57747 100644
> > > > --- a/drivers/pci/controller/dwc/Makefile
> > > > +++ b/drivers/pci/controller/dwc/Makefile
> > > > @@ -14,6 +14,7 @@ obj-$(CONFIG_PCIE_SPEAR13XX) +=3D pcie-spear13xx.=
o
> > > >  obj-$(CONFIG_PCI_KEYSTONE) +=3D pci-keystone.o
> > > >  obj-$(CONFIG_PCI_LAYERSCAPE) +=3D pci-layerscape.o
> > > >  obj-$(CONFIG_PCI_LAYERSCAPE_EP) +=3D pci-layerscape-ep.o
> > > > +obj-$(CONFIG_PCIE_S32G) +=3D pcie-s32g.o
> > >
> > > pcie-nxp-s32g?
> >
> > Same as Kconfig, other drivers only use the SoC family.
> >
> > >
> > > >  obj-$(CONFIG_PCIE_QCOM_COMMON) +=3D pcie-qcom-common.o
> > > >  obj-$(CONFIG_PCIE_QCOM) +=3D pcie-qcom.o
> > > >  obj-$(CONFIG_PCIE_QCOM_EP) +=3D pcie-qcom-ep.o
> > > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers=
/pci/controller/dwc/pcie-designware.h
> > > > index 00f52d472dcd..2aec011a9dd4 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > > @@ -119,6 +119,7 @@
> > > >
> > > >  #define GEN3_RELATED_OFF                     0x890
> > > >  #define GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL BIT(0)
> > > > +#define GEN3_RELATED_OFF_EQ_PHASE_2_3                BIT(9)
> > > >  #define GEN3_RELATED_OFF_RXEQ_RGRDLESS_RXTS  BIT(13)
> > > >  #define GEN3_RELATED_OFF_GEN3_EQ_DISABLE     BIT(16)
> > > >  #define GEN3_RELATED_OFF_RATE_SHADOW_SEL_SHIFT       24
> > > > diff --git a/drivers/pci/controller/dwc/pcie-s32g-regs.h b/drivers/=
pci/controller/dwc/pcie-s32g-regs.h
> > > > new file mode 100644
> > > > index 000000000000..674ea47a525f
> > > > --- /dev/null
> > > > +++ b/drivers/pci/controller/dwc/pcie-s32g-regs.h
> > > > @@ -0,0 +1,61 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > > +/*
> > > > + * Copyright 2015-2016 Freescale Semiconductor, Inc.
> > > > + * Copyright 2016-2023, 2025 NXP
> > > > + */
> > > > +
> > > > +#ifndef PCIE_S32G_REGS_H
> > > > +#define PCIE_S32G_REGS_H
> > > > +
> > > > +/* Instance PCIE_SS - CTRL register offsets (ctrl base) */
> > > > +#define LINK_INT_CTRL_STS                    0x40
> > >
> > > Use PCIE_S32G prefix for vendor specific registers.
> >
> > Okay
> >
> > >
> > > > +#define LINK_REQ_RST_NOT_INT_EN                      BIT(1)
> > > > +#define LINK_REQ_RST_NOT_CLR                 BIT(2)
> > > > +
> > > > +/* PCIe controller 0 general control 1 (ctrl base) */
> > > > +#define PE0_GEN_CTRL_1                               0x50
> > > > +#define SS_DEVICE_TYPE_MASK                  GENMASK(3, 0)
> > > > +#define SS_DEVICE_TYPE(x)                    FIELD_PREP(SS_DEVICE_=
TYPE_MASK, x)
> > > > +#define SRIS_MODE_EN                         BIT(8)
> > > > +
> > > > +/* PCIe controller 0 general control 3 (ctrl base) */
> > > > +#define PE0_GEN_CTRL_3                               0x58
> > > > +/* LTSSM Enable. Active high. Set it low to hold the LTSSM in Dete=
ct state. */
> > > > +#define LTSSM_EN                             BIT(0)
> > > > +
> > > > +/* PCIe Controller 0 Link Debug 2 (ctrl base) */
> > > > +#define PCIE_SS_PE0_LINK_DBG_2                       0xB4
> > > > +#define PCIE_SS_SMLH_LTSSM_STATE_MASK                GENMASK(5, 0)
> > > > +#define PCIE_SS_SMLH_LINK_UP                 BIT(6)
> > > > +#define PCIE_SS_RDLH_LINK_UP                 BIT(7)
> > > > +#define LTSSM_STATE_L0                               0x11U /* L0 s=
tate */
> > > > +#define LTSSM_STATE_L0S                              0x12U /* L0S =
state */
> > > > +#define LTSSM_STATE_L1_IDLE                  0x14U /* L1_IDLE stat=
e */
> > > > +#define LTSSM_STATE_HOT_RESET                        0x1FU /* HOT_=
RESET state */
> > > > +
> > > > +/* PCIe Controller 0  Interrupt Status (ctrl base) */
> > > > +#define PE0_INT_STS                          0xE8
> > > > +#define HP_INT_STS                           BIT(6)
> > > > +
> > > > +/* Link Control and Status Register. (PCI_EXP_LNKCTL in pci-regs.h=
) */
> > > > +#define PCIE_CAP_LINK_TRAINING                       BIT(27)
> > > > +
> > > > +/* Instance PCIE_PORT_LOGIC - DBI register offsets */
> > > > +#define PCIE_PORT_LOGIC_BASE                 0x700
> > > > +
> > > > +/* ACE Cache Coherency Control Register 3 */
> > > > +#define PORT_LOGIC_COHERENCY_CONTROL_1               (PCIE_PORT_LO=
GIC_BASE + 0x1E0)
> > > > +#define PORT_LOGIC_COHERENCY_CONTROL_2               (PCIE_PORT_LO=
GIC_BASE + 0x1E4)
> > > > +#define PORT_LOGIC_COHERENCY_CONTROL_3               (PCIE_PORT_LO=
GIC_BASE + 0x1E8)
> > > > +
> > > > +/*
> > > > + * See definition of register "ACE Cache Coherency Control Registe=
r 1"
> > > > + * (COHERENCY_CONTROL_1_OFF) in the SoC RM
> > > > + */
> > > > +#define CC_1_MEMTYPE_BOUNDARY_MASK           GENMASK(31, 2)
> > > > +#define CC_1_MEMTYPE_BOUNDARY(x)             FIELD_PREP(CC_1_MEMTY=
PE_BOUNDARY_MASK, x)
> > > > +#define CC_1_MEMTYPE_VALUE                   BIT(0)
> > > > +#define CC_1_MEMTYPE_LOWER_PERIPH            0x0
> > > > +#define CC_1_MEMTYPE_LOWER_MEM                       0x1
> > > > +
> > > > +#endif  /* PCI_S32G_REGS_H */
> > > > diff --git a/drivers/pci/controller/dwc/pcie-s32g.c b/drivers/pci/c=
ontroller/dwc/pcie-s32g.c
> > > > new file mode 100644
> > > > index 000000000000..995e4593a13e
> > > > --- /dev/null
> > > > +++ b/drivers/pci/controller/dwc/pcie-s32g.c
> > > > @@ -0,0 +1,578 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * PCIe host controller driver for NXP S32G SoCs
> > > > + *
> > > > + * Copyright 2019-2025 NXP
> > > > + */
> > > > +
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/io.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of_device.h>
> > > > +#include <linux/of_address.h>
> > > > +#include <linux/pci.h>
> > > > +#include <linux/phy.h>
> > > > +#include <linux/phy/phy.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/pm_runtime.h>
> > > > +#include <linux/sizes.h>
> > > > +#include <linux/types.h>
> > > > +
> > > > +#include "pcie-designware.h"
> > > > +#include "pcie-s32g-regs.h"
> > > > +
> > > > +struct s32g_pcie {
> > > > +     struct dw_pcie  pci;
> > > > +
> > > > +     /*
> > > > +      * We have cfg in struct dw_pcie_rp and
> > > > +      * dbi in struct dw_pcie, so define only ctrl here
> > > > +      */
> > > > +     void __iomem *ctrl_base;
> > > > +     u64 coherency_base;
> > > > +
> > > > +     struct phy *phy;
> > > > +};
> > > > +
> > > > +#define to_s32g_from_dw_pcie(x) \
> > > > +     container_of(x, struct s32g_pcie, pci)
> > > > +
> > > > +static void s32g_pcie_writel_ctrl(struct s32g_pcie *s32g_pp, u32 r=
eg, u32 val)
> > > > +{
> > > > +     if (dw_pcie_write(s32g_pp->ctrl_base + reg, 0x4, val))
> > > > +             dev_err(s32g_pp->pci.dev, "Write ctrl address failed\=
n");
> > > > +}
> > >
> > > Since you are having complete control over the register and the base,=
 you can
> > > directly use writel/readl without these helpers. They are mostly used=
 to
> > > read/write the common register space like DBI.
> >
> > fair enough
> >
>
> You should also use _relaxed variants unless ordering is necessary.
>
> > >
> > > > +
> > > > +static u32 s32g_pcie_readl_ctrl(struct s32g_pcie *s32g_pp, u32 reg=
)
> > > > +{
> > > > +     u32 val =3D 0;
> > > > +
> > > > +     if (dw_pcie_read(s32g_pp->ctrl_base + reg, 0x4, &val))
> > > > +             dev_err(s32g_pp->pci.dev, "Read ctrl address failed\n=
");
> > > > +
> > > > +     return val;
> > > > +}
> > > > +
> > > > +static void s32g_pcie_enable_ltssm(struct s32g_pcie *s32g_pp)
> > > > +{
> > > > +     u32 reg;
> > > > +
> > > > +     reg =3D s32g_pcie_readl_ctrl(s32g_pp, PE0_GEN_CTRL_3);
> > > > +     reg |=3D LTSSM_EN;
> > > > +     s32g_pcie_writel_ctrl(s32g_pp, PE0_GEN_CTRL_3, reg);
> > > > +}
> > > > +
> > > > +static void s32g_pcie_disable_ltssm(struct s32g_pcie *s32g_pp)
> > > > +{
> > > > +     u32 reg;
> > > > +
> > > > +     reg =3D s32g_pcie_readl_ctrl(s32g_pp, PE0_GEN_CTRL_3);
> > > > +     reg &=3D ~LTSSM_EN;
> > > > +     s32g_pcie_writel_ctrl(s32g_pp, PE0_GEN_CTRL_3, reg);
> > > > +}
> > > > +
> > > > +static bool is_s32g_pcie_ltssm_enabled(struct s32g_pcie *s32g_pp)
> > > > +{
> > > > +     return (s32g_pcie_readl_ctrl(s32g_pp, PE0_GEN_CTRL_3) & LTSSM=
_EN);
> > > > +}
> > > > +
> > > > +static enum dw_pcie_ltssm s32g_pcie_get_ltssm(struct dw_pcie *pci)
> > > > +{
> > > > +     struct s32g_pcie *s32g_pp =3D to_s32g_from_dw_pcie(pci);
> > > > +     u32 val =3D s32g_pcie_readl_ctrl(s32g_pp, PCIE_SS_PE0_LINK_DB=
G_2);
> > > > +
> > > > +     return (enum dw_pcie_ltssm)FIELD_GET(PCIE_SS_SMLH_LTSSM_STATE=
_MASK, val);
> > > > +}
> > > > +
> > > > +#define PCIE_LINKUP  (PCIE_SS_SMLH_LINK_UP | PCIE_SS_RDLH_LINK_UP)
> > > > +
> > > > +static bool has_data_phy_link(struct s32g_pcie *s32g_pp)
> > > > +{
> > > > +     u32 val =3D s32g_pcie_readl_ctrl(s32g_pp, PCIE_SS_PE0_LINK_DB=
G_2);
> > > > +
> > > > +     if ((val & PCIE_LINKUP) =3D=3D PCIE_LINKUP) {
> > > > +             switch (val & PCIE_SS_SMLH_LTSSM_STATE_MASK) {
> > > > +             case LTSSM_STATE_L0:
> > > > +             case LTSSM_STATE_L0S:
> > > > +             case LTSSM_STATE_L1_IDLE:
> > > > +                     return true;
> > > > +             default:
> > > > +                     return false;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     return false;
> > > > +}
> > > > +
> > > > +static bool s32g_pcie_link_up(struct dw_pcie *pci)
> > > > +{
> > > > +     struct s32g_pcie *s32g_pp =3D to_s32g_from_dw_pcie(pci);
> > > > +
> > > > +     if (!is_s32g_pcie_ltssm_enabled(s32g_pp))
> > > > +             return false;
> > > > +
> > > > +     return has_data_phy_link(s32g_pp);
> > > > +}
> > > > +
> > > > +static int s32g_pcie_start_link(struct dw_pcie *pci)
> > > > +{
> > > > +     struct s32g_pcie *s32g_pp =3D to_s32g_from_dw_pcie(pci);
> > > > +
> > > > +     s32g_pcie_enable_ltssm(s32g_pp);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void s32g_pcie_stop_link(struct dw_pcie *pci)
> > > > +{
> > > > +     struct s32g_pcie *s32g_pp =3D to_s32g_from_dw_pcie(pci);
> > > > +
> > > > +     s32g_pcie_disable_ltssm(s32g_pp);
> > > > +}
> > > > +
> > > > +struct dw_pcie_ops s32g_pcie_ops =3D {
> > > > +     .get_ltssm =3D s32g_pcie_get_ltssm,
> > > > +     .link_up =3D s32g_pcie_link_up,
> > > > +     .start_link =3D s32g_pcie_start_link,
> > > > +     .stop_link =3D s32g_pcie_stop_link,
> > > > +};
> > > > +
> > > > +static const struct dw_pcie_host_ops s32g_pcie_host_ops;
> > > > +
> > > > +static void disable_equalization(struct dw_pcie *pci)
> > > > +{
> > > > +     u32 val;
> > > > +
> > > > +     val =3D dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> > > > +     val &=3D ~(GEN3_EQ_CONTROL_OFF_FB_MODE |
> > > > +              GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> > > > +     val |=3D FIELD_PREP(GEN3_EQ_CONTROL_OFF_FB_MODE, 1) |
> > > > +            FIELD_PREP(GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC, 0x84);
> > >
> > > FIELD_MODIFY()?
> >
> > FIELD_PREP() allows  adding multiple fields changes in a single access
> > instead of having one access per field with FIELD_MODIFY
> >
>
> Yeah, but it gets rid of the explicit masking.
>
> > >
> > > > +     dw_pcie_dbi_ro_wr_en(pci);
> > > > +     dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> > > > +     dw_pcie_dbi_ro_wr_dis(pci);
> > > > +}
> > > > +
> > > > +static void s32g_pcie_reset_mstr_ace(struct dw_pcie *pci, u64 ddr_=
base_addr)
> > >
> > > What does _ace stands for?
> >
> > AMBA AXI Coherency Extensions (ACE)
> >
>
> Ok. You could add a comment to make it clear of what this function does.
>
> > >
> > > > +{
> > > > +     u32 ddr_base_low =3D lower_32_bits(ddr_base_addr);
> > > > +     u32 ddr_base_high =3D upper_32_bits(ddr_base_addr);
> > > > +
> > > > +     dw_pcie_dbi_ro_wr_en(pci);
> > > > +     dw_pcie_writel_dbi(pci, PORT_LOGIC_COHERENCY_CONTROL_3, 0x0);
> > > > +
> > > > +     /*
> > > > +      * Transactions to peripheral targets should be non-coherent,
> > >
> > > What is exactly meant by 'Transactions to peripheral targets'? Is it =
the MMIO
> > > access to peripherals? If so, all MMIO memory is marked as non-cachea=
ble by
> > > default.
> >
> > From the ref manual of s32g :
> > Ncore is a cache-coherent interconnect module. It enables the
> > integration of heterogeneous coherent agents and non-coherent
> > agents in a chip. It processes transactions with coherent access
> > semantics from various fully-coherent and IO-coherent masters,
> > targeting shared resources.
> >
>
> Ok. It would help if this is described in the patch description.
>
> > >
> > > > +      * or Ncore might drop them.
> > >
> > > What is 'Ncore'?
> > >
>
> [...]
>
> > >
> > > > +
> > > > +     return 0;
> > > > +
> > > > +err_host_deinit:
> > > > +     dw_pcie_host_deinit(pp);
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int s32g_pcie_probe(struct platform_device *pdev)
> > > > +{
> > > > +     struct device *dev =3D &pdev->dev;
> > > > +     struct s32g_pcie *s32g_pp;
> > > > +     int ret;
> > > > +
> > > > +     s32g_pp =3D devm_kzalloc(dev, sizeof(*s32g_pp), GFP_KERNEL);
> > > > +     if (!s32g_pp)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ret =3D s32g_pcie_get_resources(pdev, s32g_pp);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     devm_pm_runtime_enable(dev);
> > > > +     ret =3D pm_runtime_get_sync(dev);
> > >
> > > Does this driver rely on any of its parent to enable the resources? L=
ike
> > > pm-domain, clock, etc... If so, just set pm_runtime_no_callbacks() be=
fore
> >
> > pm_runtime_no_callbacks() is missing.
> >
>
> I was specifically questioning the 'pm_runtime_get_sync()' call. If you n=
eed to
> enable any parent resources, then you can keep it. Otherwise, just drop i=
t.
>
> > > devm_pm_runtime_enable(). If not, then do:
> > >
> > >         pm_runtime_set_active()
> > >         pm_runtime_no_callbacks()
> > >         devm_pm_runtime_enable()
> > >
> > > > +     if (ret < 0)
> > > > +             goto err_pm_runtime_put;
> > > > +
> > > > +     ret =3D s32g_pcie_init(dev, s32g_pp);
> > > > +     if (ret)
> > > > +             goto err_pm_runtime_put;
> > > > +
> > > > +     ret =3D s32g_pcie_host_init(dev, s32g_pp);
> > > > +     if (ret)
> > > > +             goto err_deinit_controller;
> > > > +
> > > > +     return 0;
> > > > +
> > > > +err_deinit_controller:
> > > > +     s32g_pcie_deinit(s32g_pp);
> > > > +err_pm_runtime_put:
> > > > +     pm_runtime_put(dev);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int s32g_pcie_suspend(struct device *dev)
> > > > +{
> > > > +     struct s32g_pcie *s32g_pp =3D dev_get_drvdata(dev);
> > > > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > > > +     struct dw_pcie_rp *pp =3D &pci->pp;
> > > > +     struct pci_bus *bus, *root_bus;
> > > > +
> > > > +     s32g_pcie_downstream_dev_to_D0(s32g_pp);
> > > > +
> > > > +     bus =3D pp->bridge->bus;
> > > > +     root_bus =3D s32g_get_child_downstream_bus(bus);
> > > > +     if (!IS_ERR(root_bus))
> > > > +             pci_walk_bus(root_bus, pci_dev_set_disconnected, NULL=
);
> > > > +
> > > > +     pci_stop_root_bus(bus);
> > > > +     pci_remove_root_bus(bus);
> > >
> > > Why can't you rely on dw_pcie_host_deinit()?
> >
> > I need to check but mainly because we don't do dw_pcie_host_init() duri=
ng resume
> >
>
> You should and it will simplify your driver a lot.
>
> > >
> > > > +
> > > > +     s32g_pcie_deinit(s32g_pp);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int s32g_pcie_resume(struct device *dev)
> > > > +{
> > > > +     struct s32g_pcie *s32g_pp =3D dev_get_drvdata(dev);
> > > > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > > > +     struct dw_pcie_rp *pp =3D &pci->pp;
> > > > +     int ret =3D 0;
> > > > +
> > > > +     ret =3D s32g_pcie_init(dev, s32g_pp);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     ret =3D dw_pcie_setup_rc(pp);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "Failed to resume DW RC: %d\n", ret);
> > > > +             goto fail_host_init;
> > > > +     }
> > > > +
> > > > +     ret =3D dw_pcie_start_link(pci);
> > > > +     if (ret) {
> > > > +             /*
> > > > +              * We do not exit with error if link up was unsuccess=
ful
> > > > +              * Endpoint may not be connected.
> > > > +              */
> > > > +             if (dw_pcie_wait_for_link(pci))
> > > > +                     dev_warn(pci->dev,
> > > > +                              "Link Up failed, Endpoint may not be=
 connected\n");
> > > > +
> > > > +             if (!phy_validate(s32g_pp->phy, PHY_MODE_PCIE, 0, NUL=
L)) {
> > > > +                     dev_err(dev, "Failed to get link up with EP c=
onnected\n");
> > > > +                     goto fail_host_init;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     ret =3D pci_host_probe(pp->bridge);
> > >
> > > Oh no... Do not call pci_host_probe() directly from glue drivers. Use
> > > dw_pcie_host_init() to do so. This should simplify suspend and resume=
 functions.
> >
> > dw_pcie_host_init() is doing much more than just init the controller
> > as it gets resources which we haven't released during suspend.
> >
>
> Any specific reason to keep resources enabled, even though you were remov=
ing the
> Root bus? This doesn't make sense to me.

By ressources I mean everything before  dw_pcie_setup_rc()  in
dw_pcie_host_init() which are still there after dw_pcie_host_deinit()
in addition to being a waste of time. Also we don't need to remove
edma and free msi

>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
