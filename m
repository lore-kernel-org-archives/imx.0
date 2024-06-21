Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0B2152E0A
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973277; cv=none; b=PccSTOTe5HV12o7jbGX+aLWthrwV/ZLsYYb7k5m9v549MbfVAWQYacSMZ0rYbmD8zN1n/jma6zTc07m3Onoz2eJURDw5l7c8p7hDtXuanMegEqknyDeeU03JrWRGUj3fE2zOTNk0IpaUwyZJbW5zNboBclGSKsWpqplM/2gYqsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973277; c=relaxed/simple;
	bh=Yahd2TW4qFaEJgmMQrnqN51wGuKcQM4+rIrvMT2uzvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJjIcEZGMvFqCE1bmoJDWc6efMQc0vEVTWEUGnYNvMWLHGJTSqlc6izVuVvf1GpeNI9qIRdDVxmg3ooxwUJgd3HODJo9MS8lsZE1sDeC9cTmTdy5AQs+WZo31g7IZ32946b8VwWPKKS46PEeCD0MklejauxhxNm0CjpmJIHSVlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTRX+Gep; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTRX+Gep"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3748ebe7e53so7577685ab.1
        for <imx@lists.linux.dev>; Fri, 21 Jun 2024 05:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718973275; x=1719578075; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhi9mJ2T+XilHMtHiURF97rDjoedF5ZeDitu39Zi0QU=;
        b=RTRX+GepxhNR20o/lkGjUWuNFsz8eFyT25Y7S51pvcQRxO5IZytZXt9oUxX391FIKV
         ntTtp75d+xJAk/DuIuExjlSrWusiy92WHP8NnzbbSW9zhtAyHP/vOnOqv6+bZNvWUslZ
         gSAW94skb7MohgnyjFbnQpLvI3NgjlO42FykM1wNfW0u/DDEroYASiEq+U13U6HR9Z1m
         k1ya4LK/PkdEXOqeBrpkkKPspkK+eocCwqYHdTS0QF4jpZlv4APxLfFTIM6XwxeRb/h0
         wEth76UOwIndUM5OAc2bH3jpa0CunzlT8VpctSNGeDD45EHFavxy9tGg+4qXvRd/Mo6g
         RJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718973275; x=1719578075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhi9mJ2T+XilHMtHiURF97rDjoedF5ZeDitu39Zi0QU=;
        b=KYb1Xfc+EQZgantWrnX0Au1eQwvtn7L4T/Kh1F8WVmo1l7hO4SECRp61pBPvrpMc7t
         cjA9h3lgzzUsU+z2GyP4Tm0N6zzP53GEhD/t+cY27ELFkB0EbsIRigG7ZbozVCOFNxU7
         fzsFyYBkIAwASIZtdyBTZH1viO9yr1X6lFR0wsSmQLC1JnbfuByywTHVu/oajSSFQr9T
         tGXRgh4CanwaJRqqMCSoaBiIIhXpSnVCdKUwHJnZuiiGGxvPqQNuwUSayvGY+BBZok7y
         YbTE6ILzkvjB+Tg6cuWgvcku3q9y36HX02a2u6gP9ucm22PM+0cvnH1q+zn2YfkZyDQY
         llKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb75mTfdEtfjJ33/wpUDMrAh0h1Nt6L12jSs1l2tgwOz7zARvSVH35fmZad/F05Ogwij/rJZUv7MXvnGnF5uaINB8z
X-Gm-Message-State: AOJu0YwoU9SwwV2fsnSub2BTr4MeqWoOSZPospgeSI8Pd51qcjHp5yNk
	amYDXfYLgrxL+hjGoIUPrpbgsjohtBbcmyZHzKbRyNt686HNgEvVqSmDOzuwXgOS33M8kUr/qeE
	buzs+1e5X6S31v/+OogoUalNt/MU=
X-Google-Smtp-Source: AGHT+IGQkbrfRhBIP+rcF1h8shhS/agBglVSTfqe/anG+BrwroxCr0J9kcHCTV0Y5V8uiwFSyhB1bW216O5/yaDcYNo=
X-Received: by 2002:a05:6e02:164e:b0:375:9e3f:5f6 with SMTP id
 e9e14a558f8ab-3761d656391mr93527345ab.6.1718973275065; Fri, 21 Jun 2024
 05:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1718350923-21392-1-git-send-email-shengjiu.wang@nxp.com>
 <1718350923-21392-4-git-send-email-shengjiu.wang@nxp.com> <27ea1bf7de6f349426fcd7ddb056a1adfae47c73.camel@pengutronix.de>
In-Reply-To: <27ea1bf7de6f349426fcd7ddb056a1adfae47c73.camel@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 21 Jun 2024 20:34:23 +0800
Message-ID: <CAA+D8AOzY3EcUayGP+pYeAqQu1y0=8WWngnBriwDwOCwnbcN2A@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] reset: imx8mp-audiomix: Add AudioMix Block Control
 reset driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org, peng.fan@nxp.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	marex@denx.de, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 6:59=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> Hi,
>
> On Fr, 2024-06-14 at 15:42 +0800, Shengjiu Wang wrote:
> > Add support for the resets on i.MX8MP Audio Block Control module,
> > which includes the EARC PHY software reset and EARC controller
> > software reset. The reset controller is created using the auxiliary
> > device framework and set up in the clock driver.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/reset/Kconfig                 |   8 ++
> >  drivers/reset/Makefile                |   1 +
> >  drivers/reset/reset-imx8mp-audiomix.c | 106 ++++++++++++++++++++++++++
> >  3 files changed, 115 insertions(+)
> >  create mode 100644 drivers/reset/reset-imx8mp-audiomix.c
> >
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 7112f5932609..b3c0e528d08c 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -91,6 +91,14 @@ config RESET_IMX7
> >       help
> >         This enables the reset controller driver for i.MX7 SoCs.
> >
> > +config RESET_IMX8MP_AUDIOMIX
> > +     tristate "i.MX8MP AudioMix Reset Driver"
> > +     depends on CLK_IMX8MP
>
> I'd like this to be made compile-testable without CLK_IMX8MP being
> enabled.

Ok, will remove the depends.

>
> > +     select AUXILIARY_BUS
> > +     default CLK_IMX8MP
> > +     help
> > +       This enables the reset controller driver for i.MX8MP AudioMix
> > +
> >  config RESET_INTEL_GW
> >       bool "Intel Reset Controller Driver"
> >       depends on X86 || COMPILE_TEST
> > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > index fd8b49fa46fc..a6796e83900b 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_BRCMSTB_RESCAL) +=3D reset-brcmstb=
-rescal.o
> >  obj-$(CONFIG_RESET_GPIO) +=3D reset-gpio.o
> >  obj-$(CONFIG_RESET_HSDK) +=3D reset-hsdk.o
> >  obj-$(CONFIG_RESET_IMX7) +=3D reset-imx7.o
> > +obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) +=3D reset-imx8mp-audiomix.o
> >  obj-$(CONFIG_RESET_INTEL_GW) +=3D reset-intel-gw.o
> >  obj-$(CONFIG_RESET_K210) +=3D reset-k210.o
> >  obj-$(CONFIG_RESET_LANTIQ) +=3D reset-lantiq.o
> > diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/rese=
t-imx8mp-audiomix.c
> > new file mode 100644
> > index 000000000000..1fc984bc08c0
> > --- /dev/null
> > +++ b/drivers/reset/reset-imx8mp-audiomix.c
> > @@ -0,0 +1,106 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright 2024 NXP
> > + */
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/device.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
>
> Still needed?

Ok, can be removed.

>
> > +#include <linux/reset-controller.h>
> > +
> > +#define EARC                 0x200
> > +#define EARC_RESET_MASK              0x3
> > +
> > +struct imx8mp_audiomix_reset {
> > +     struct reset_controller_dev rcdev;
> > +     void __iomem *base;
> > +};
> > +
> > +static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct r=
eset_controller_dev *rcdev)
> > +{
> > +     return container_of(rcdev, struct imx8mp_audiomix_reset, rcdev);
> > +}
> > +
> > +static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *r=
cdev,
> > +                                     unsigned long id)
> > +{
> > +     struct imx8mp_audiomix_reset *priv =3D to_imx8mp_audiomix_reset(r=
cdev);
> > +     void __iomem *reg_addr =3D priv->base;
> > +     unsigned int mask, reg;
> > +
> > +     if (id >=3D fls(EARC_RESET_MASK))
> > +             return -EINVAL;
>
> This check is not required.
>
> Since you have nr_resets set to fls(EARC_RESET_MASK), the same is
> already checked in of_reset_simple_xlate, before a reset control is
> even returned.

Ok, will remove it.

>
> > +     mask =3D BIT(id);
> > +     reg =3D readl(reg_addr + EARC);
> > +     writel(reg & ~mask, reg_addr + EARC);
>
> There are multiple (well, two) resets in this register, so it would be
> good style to protect the read-modify-write cycle with a spinlock.

Ok, will add spinlock

>
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev =
*rcdev,
> > +                                       unsigned long id)
> > +{
> > +     struct imx8mp_audiomix_reset *priv =3D to_imx8mp_audiomix_reset(r=
cdev);
> > +     void __iomem *reg_addr =3D priv->base;
> > +     unsigned int mask, reg;
> > +
> > +     if (id >=3D fls(EARC_RESET_MASK))
> > +             return -EINVAL;
> > +
> > +     mask =3D BIT(id);
> > +     reg =3D readl(reg_addr + EARC);
> > +     writel(reg | mask, reg_addr + EARC);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct reset_control_ops imx8mp_audiomix_reset_ops =3D {
> > +     .assert   =3D imx8mp_audiomix_reset_assert,
> > +     .deassert =3D imx8mp_audiomix_reset_deassert,
> > +};
> > +
> > +static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
> > +                                    const struct auxiliary_device_id *=
id)
> > +{
> > +     struct imx8mp_audiomix_reset *priv;
> > +     struct device *dev =3D &adev->dev;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->rcdev.owner     =3D THIS_MODULE;
> > +     priv->rcdev.nr_resets =3D fls(EARC_RESET_MASK);
> > +     priv->rcdev.ops       =3D &imx8mp_audiomix_reset_ops;
> > +     priv->rcdev.of_node   =3D dev->parent->of_node;
> > +     priv->rcdev.dev       =3D dev;
> > +     priv->rcdev.of_reset_n_cells =3D 1;
> > +     priv->base            =3D of_iomap(dev->parent->of_node, 0);
>
> This is missing the corresponding iounmap().

Ok, will add iounmap.

>
> I wonder why we map at all. If the parent driver already has iomem
> mapped, can't it just pass that in, like JH7110 does?

Because this is a simple reset driver, just two reset bits,
I want to avoid adding a header file for the parent driver and this driver.

Thanks for reviewing.

By the way: shall I just send a new version for this patch only next time?

Best regards
Shengjiu Wang
>
>
> regards
> Philipp
