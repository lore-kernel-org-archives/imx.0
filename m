Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C6612E1CA
	for <imx@lists.linux.dev>; Tue,  4 Jun 2024 03:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717473441; cv=none; b=SWLFQaI5vgMRmfLSY7AI8HYMugdP34/6CrcrKeO5336Y0VG3IB+0TWlWw3ViMW7XNiCGclFh91AIcbxXe3SBC4l8MMx2nxZ6QdcvQMOGheuMp5kkKsMJD5sfrXWM/BMItGuHYa5IIPHVv3IjaoPcVNFX6CWmBFPezYR70/6eprU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717473441; c=relaxed/simple;
	bh=UMFaQHIGOcCk2JsX+HFbn+3z235Z8FarTMQKUt5Qxwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOXwQO06XXsXgu7wn7UkUC7hQ21SBMGQfYubJycEbBhWHYMZkrXS/ZMGy14qKcb9nqBr/4tJIVipAAkFQ4t4hTxU5frfrWy2cq/n6todZL5Ay8MvG5gQYhlh9xFuDeExUd8TuKsHNdwFR6h/tT6UI8FvMjz9q84H6GXKWpocpOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edtI8vf/; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edtI8vf/"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3748d68b7b8so15967495ab.1
        for <imx@lists.linux.dev>; Mon, 03 Jun 2024 20:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717473439; x=1718078239; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDw463836VXxjFEssZxkzySa5xdge6xhhv/M+Qec16I=;
        b=edtI8vf/Ory7GHv5U7v+YTfCGvf8G2B/Aae1CfFVS/yqA1fpGWC26XSZmstO/gxsNf
         UuFz4ATzjzVBFGgzz9OdfXcVF5GEMrwOyX33gO5ChNYonmqWNwSV25Mm1qVg7mvyl8LU
         e/E7nFZV2pDFmG6swsP3Hhs8f4RpHpY03EV6zcQg7mKcDVEg0Ctseag9sBR3cl73b2xu
         tI1qDErXXb9AebWYa9lJMp0M72o7KnUFkWakF60v3TG/IHIR37GCh9Vca4sP10uwu/EX
         DMqpEWJU3N8AjA4lXEDClPv5aSiPoCZuAMQxBL+7iOBnTd6PIUKT/yTw81xcYSIFBSkH
         1r6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717473439; x=1718078239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDw463836VXxjFEssZxkzySa5xdge6xhhv/M+Qec16I=;
        b=uc3rH17Rf6aIQeWwngxKB5Cz7RUxH5v/vnPaKaX7CwNTeSWbwIcg6sY+XBqkEcvepm
         YPxG3RLnL6n7vp1j1pAyeO5zeXA0AyofYNGn3ulqAVuAmsZIE44tBbvpn4s9VBrh9HKW
         3OkTvj4yOZMSsfoamZ1Wmil9WMKJ/ooHYUe97CAk+yL5wJmBZw5P5kO4SObFqx6tRNlV
         8Eb/GpIiAQROSLjCRI4a1QfITzt9Z4UrqY5kDEvp9dKDDEIBO22PMjIeb9hxtUPHi0wC
         C/ypJttKVvdweha5BldgfSvyoQ3hon0gp+fpt2+/sWgTVfKnSccOPxo1gwiwlSQXcLVo
         lAHg==
X-Forwarded-Encrypted: i=1; AJvYcCUTEM7/bleHGo6oxW3H32Wjkr3ASdcjg6Z6a34dGPgM5AcBxOE/6ddQtK5+SlltZYeKjywQgxCb8Jx9FLPlFhBY1vY5
X-Gm-Message-State: AOJu0Yyibx1DGeGdkPpT9MWfXIqKPUKRbIGfPlHQhvuCLj0g6v55U4x5
	tcFPyrQfKrqv9UDoH/+o6vwXvBh/yJpKmYPVoB5qwtIaewRRzKD+0OielSteYRxs1cDBY1FtCzq
	82C62FhQ2yHUWV26QWwQyAJHIhNgSFjydDYE=
X-Google-Smtp-Source: AGHT+IHv96HDpvzi1scKNYLa1svsheD1fN+/LYbf36PbZHOxMXXSnA2KzvqwtRPzC25VCJqRhpk1QNNccpIzt5c3Ijc=
X-Received: by 2002:a05:6e02:2165:b0:374:99df:1da2 with SMTP id
 e9e14a558f8ab-37499df20b9mr66313035ab.18.1717473438578; Mon, 03 Jun 2024
 20:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1717036278-3515-1-git-send-email-shengjiu.wang@nxp.com>
 <1717036278-3515-4-git-send-email-shengjiu.wang@nxp.com> <20240530090558.53reobf2zea22oi2@pengutronix.de>
In-Reply-To: <20240530090558.53reobf2zea22oi2@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Jun 2024 11:57:07 +0800
Message-ID: <CAA+D8AMTC0cwsoebc804rvoJ1tZMqzQcMqDS17tPvwCsAmwFCw@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] reset: imx-aux: Add i.MX auxiliary reset driver
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, p.zabel@pengutronix.de, abelvesa@kernel.org, 
	peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	marex@denx.de, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 5:06=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Hi,
>
> On 24-05-30, Shengjiu Wang wrote:
> > Add support for the resets on i.MX8MP Audio Block Control module,
> > which includes the EARC PHY software reset and EARC controller
> > software reset. The reset controller is created using the auxiliary
> > device framework and set up in the clock driver.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/reset/Kconfig         |   8 ++
> >  drivers/reset/Makefile        |   1 +
> >  drivers/reset/reset-imx-aux.c | 217 ++++++++++++++++++++++++++++++++++
>                             ^
> You make use of the auxiliary bus but this isn't a aux driver, it's the
> i.MX8MP EARC reset driver. According the TRM only the EARC reset bits
> are covered by the AUDIOMIX blk-ctrl.

I am confused. According to below discussion:

https://lore.kernel.org/lkml/b86c83a520f0c45a60249468fa92b1de.sboyd@kernel.=
org/

Stephen and Conor suggested using auxdev.


Best regards
Shengjiu Wang

>
> >  3 files changed, 226 insertions(+)
> >  create mode 100644 drivers/reset/reset-imx-aux.c
> >
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 7112f5932609..38fdf05b326b 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -91,6 +91,14 @@ config RESET_IMX7
> >       help
> >         This enables the reset controller driver for i.MX7 SoCs.
> >
> > +config RESET_IMX_AUX
> > +     tristate "i.MX Auxiliary Reset Driver"
>                         ^
>               Same applies here
>
> > +     depends on CLK_IMX8MP
> > +     select AUXILIARY_BUS
> > +     default CLK_IMX8MP
> > +     help
> > +       This enables the auxiliary reset controller driver for i.MX.
> > +
> >  config RESET_INTEL_GW
> >       bool "Intel Reset Controller Driver"
> >       depends on X86 || COMPILE_TEST
> > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > index fd8b49fa46fc..f078da14c327 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_BRCMSTB_RESCAL) +=3D reset-brcmstb=
-rescal.o
> >  obj-$(CONFIG_RESET_GPIO) +=3D reset-gpio.o
> >  obj-$(CONFIG_RESET_HSDK) +=3D reset-hsdk.o
> >  obj-$(CONFIG_RESET_IMX7) +=3D reset-imx7.o
> > +obj-$(CONFIG_RESET_IMX_AUX) +=3D reset-imx-aux.o
> >  obj-$(CONFIG_RESET_INTEL_GW) +=3D reset-intel-gw.o
> >  obj-$(CONFIG_RESET_K210) +=3D reset-k210.o
> >  obj-$(CONFIG_RESET_LANTIQ) +=3D reset-lantiq.o
> > diff --git a/drivers/reset/reset-imx-aux.c b/drivers/reset/reset-imx-au=
x.c
> > new file mode 100644
> > index 000000000000..61c353abc84e
> > --- /dev/null
> > +++ b/drivers/reset/reset-imx-aux.c
> > @@ -0,0 +1,217 @@
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
> > +#include <linux/reset-controller.h>
> > +
> > +/*
> > + * The reset does not support the feature and corresponding
> > + * values are not valid
> > + */
> > +#define ASSERT_NONE     BIT(0)
> > +#define DEASSERT_NONE   BIT(1)
> > +#define STATUS_NONE     BIT(2)
> > +
> > +/* When set this function is activated by setting(vs clearing) this bi=
t */
> > +#define ASSERT_SET      BIT(3)
> > +#define DEASSERT_SET    BIT(4)
> > +#define STATUS_SET      BIT(5)
> > +
> > +/* The following are the inverse of the above and are added for consis=
tency */
> > +#define ASSERT_CLEAR    (0 << 3)
> > +#define DEASSERT_CLEAR  (0 << 4)
> > +#define STATUS_CLEAR    (0 << 5)
> > +
> > +/**
> > + * struct imx_reset_ctrl - reset control structure
> > + * @assert_offset: reset assert control register offset
> > + * @assert_bit: reset assert bit in the reset assert control register
> > + * @deassert_offset: reset deassert control register offset
> > + * @deassert_bit: reset deassert bit in the reset deassert control reg=
ister
> > + * @status_offset: reset status register offset
> > + * @status_bit: reset status bit in the reset status register
> > + * @flags: reset flag indicating how the (de)assert and status are han=
dled
> > + */
> > +struct imx_reset_ctrl {
> > +     u32 assert_offset;
> > +     u32 assert_bit;
> > +     u32 deassert_offset;
> > +     u32 deassert_bit;
> > +     u32 status_offset;
> > +     u32 status_bit;
> > +     u32 flags;
> > +};
>
> Why do we make it this compicated for an simple EARC module reset? I
> understand that you want to provide a generic driver which can be
> re-used but there is actual no other user and may will get no other user
> in the future too. Therefore I would like to keep it simple at the
> begin and adapt the code on-demand.
>
> Regards,
>   Marco
>
> > +struct imx_reset_data {
> > +     const struct imx_reset_ctrl *rst_ctrl;
> > +     size_t rst_ctrl_num;
> > +};
> > +
> > +struct imx_aux_reset_priv {
> > +     struct reset_controller_dev rcdev;
> > +     void __iomem *base;
> > +     const struct imx_reset_data *data;
> > +};
> > +
> > +static int imx_aux_reset_assert(struct reset_controller_dev *rcdev,
> > +                             unsigned long id)
> > +{
> > +     struct imx_aux_reset_priv *priv =3D container_of(rcdev,
> > +                                     struct imx_aux_reset_priv, rcdev)=
;
> > +     const struct imx_reset_data *data =3D priv->data;
> > +     void __iomem *reg_addr =3D priv->base;
> > +     const struct imx_reset_ctrl *ctrl;
> > +     unsigned int mask, value, reg;
> > +
> > +     if (id >=3D data->rst_ctrl_num)
> > +             return -EINVAL;
> > +
> > +     ctrl =3D &data->rst_ctrl[id];
> > +
> > +     /* assert not supported for this reset */
> > +     if (ctrl->flags & ASSERT_NONE)
> > +             return -EOPNOTSUPP;
> > +
> > +     mask =3D BIT(ctrl->assert_bit);
> > +     value =3D (ctrl->flags & ASSERT_SET) ? mask : 0x0;
> > +
> > +     reg =3D readl(reg_addr + ctrl->assert_offset);
> > +     writel(reg | value, reg_addr + ctrl->assert_offset);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx_aux_reset_deassert(struct reset_controller_dev *rcdev,
> > +                               unsigned long id)
> > +{
> > +     struct imx_aux_reset_priv *priv =3D container_of(rcdev,
> > +                                     struct imx_aux_reset_priv, rcdev)=
;
> > +     const struct imx_reset_data *data =3D priv->data;
> > +     void __iomem *reg_addr =3D priv->base;
> > +     const struct imx_reset_ctrl *ctrl;
> > +     unsigned int mask, value, reg;
> > +
> > +     if (id >=3D data->rst_ctrl_num)
> > +             return -EINVAL;
> > +
> > +     ctrl =3D &data->rst_ctrl[id];
> > +
> > +     /* deassert not supported for this reset */
> > +     if (ctrl->flags & DEASSERT_NONE)
> > +             return -EOPNOTSUPP;
> > +
> > +     mask =3D BIT(ctrl->deassert_bit);
> > +     value =3D (ctrl->flags & DEASSERT_SET) ? mask : 0x0;
> > +
> > +     reg =3D readl(reg_addr + ctrl->deassert_offset);
> > +     writel(reg | value, reg_addr + ctrl->deassert_offset);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx_aux_reset_status(struct reset_controller_dev *rcdev,
> > +                             unsigned long id)
> > +{
> > +     struct imx_aux_reset_priv *priv =3D container_of(rcdev,
> > +                                     struct imx_aux_reset_priv, rcdev)=
;
> > +     const struct imx_reset_data *data =3D priv->data;
> > +     void __iomem *reg_addr =3D priv->base;
> > +     const struct imx_reset_ctrl *ctrl;
> > +     unsigned int reset_state;
> > +
> > +     if (id >=3D data->rst_ctrl_num)
> > +             return -EINVAL;
> > +
> > +     ctrl =3D &data->rst_ctrl[id];
> > +
> > +     /* status not supported for this reset */
> > +     if (ctrl->flags & STATUS_NONE)
> > +             return -EOPNOTSUPP;
> > +
> > +     reset_state =3D readl(reg_addr + ctrl->status_offset);
> > +
> > +     return !(reset_state & BIT(ctrl->status_bit)) =3D=3D
> > +             !(ctrl->flags & STATUS_SET);
> > +}
> > +
> > +static const struct reset_control_ops imx_aux_reset_ops =3D {
> > +     .assert   =3D imx_aux_reset_assert,
> > +     .deassert =3D imx_aux_reset_deassert,
> > +     .status   =3D imx_aux_reset_status,
> > +};
> > +
> > +static int imx_aux_reset_probe(struct auxiliary_device *adev,
> > +                            const struct auxiliary_device_id *id)
> > +{
> > +     struct imx_reset_data *data =3D (struct imx_reset_data *)(id->dri=
ver_data);
> > +     struct imx_aux_reset_priv *priv;
> > +     struct device *dev =3D &adev->dev;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->rcdev.owner     =3D THIS_MODULE;
> > +     priv->rcdev.nr_resets =3D data->rst_ctrl_num;
> > +     priv->rcdev.ops       =3D &imx_aux_reset_ops;
> > +     priv->rcdev.of_node   =3D dev->parent->of_node;
> > +     priv->rcdev.dev       =3D dev;
> > +     priv->rcdev.of_reset_n_cells =3D 1;
> > +     priv->base            =3D of_iomap(dev->parent->of_node, 0);
> > +     priv->data            =3D data;
> > +
> > +     return devm_reset_controller_register(dev, &priv->rcdev);
> > +}
> > +
> > +#define EARC  0x200
> > +
> > +static const struct imx_reset_ctrl imx8mp_audiomix_rst_ctrl[] =3D {
> > +     {
> > +             .assert_offset =3D EARC,
> > +             .assert_bit =3D 0,
> > +             .deassert_offset =3D EARC,
> > +             .deassert_bit =3D 0,
> > +             .flags  =3D ASSERT_CLEAR | DEASSERT_SET | STATUS_NONE,
> > +     },
> > +     {
> > +             .assert_offset =3D EARC,
> > +             .assert_bit =3D 1,
> > +             .deassert_offset =3D EARC,
> > +             .deassert_bit =3D 1,
> > +             .flags  =3D ASSERT_CLEAR | DEASSERT_SET | STATUS_NONE,
> > +     },
> > +};
> > +
> > +static const struct imx_reset_data imx8mp_audiomix_rst_data =3D {
> > +     .rst_ctrl =3D imx8mp_audiomix_rst_ctrl,
> > +     .rst_ctrl_num =3D ARRAY_SIZE(imx8mp_audiomix_rst_ctrl),
> > +};
> > +
> > +static const struct auxiliary_device_id imx_aux_reset_ids[] =3D {
> > +     {
> > +             .name =3D "clk_imx8mp_audiomix.reset",
> > +             .driver_data =3D (kernel_ulong_t)&imx8mp_audiomix_rst_dat=
a,
> > +     },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(auxiliary, imx_aux_reset_ids);
> > +
> > +static struct auxiliary_driver imx_aux_reset_driver =3D {
> > +     .probe          =3D imx_aux_reset_probe,
> > +     .id_table       =3D imx_aux_reset_ids,
> > +};
> > +
> > +module_auxiliary_driver(imx_aux_reset_driver);
> > +
> > +MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
> > +MODULE_DESCRIPTION("Freescale i.MX auxiliary reset driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.34.1
> >
> >
> >
