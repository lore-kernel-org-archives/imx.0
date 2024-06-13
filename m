Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D64929AB
	for <imx@lists.linux.dev>; Thu, 13 Jun 2024 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718270431; cv=none; b=Ov3KfSjFCRil4ib/o8CB1WkItivByy4cnVAckGzAccMKk2hURpMcJSsxyVD2vsGodcANfBg/4ppZT7B0c/3sTK/1vuXV9PW4+9zM0Vnn+BDqRtakIyB9qFJCpy4cjfYb0C1n5ubAvx521lZKukjh5UNe5nzchzVTSsXAc7aags0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718270431; c=relaxed/simple;
	bh=nwIWyEx/7teWV5FWMzmwa4MnROj8ZAkaiOIAWcLazkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfRvNEQcvJoLtKwXg5lVyiCcfsU0FGkC/HhNJOp8oxES2NTPXMnnlVJ44JSHVVnolqn8cobO/N413CR9zbkg/67MjqAcQ6IFB+OSOq3xrwI7qRtWsUM5hymRqdtzwvu5iHCIC5waVnR9fDKXJvHRgh24kJpC52SCMlMOrtC4jeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zr3qfPmb; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zr3qfPmb"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-375daa47685so898035ab.0
        for <imx@lists.linux.dev>; Thu, 13 Jun 2024 02:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718270429; x=1718875229; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csLKQFD6Tcenf8eJdKO/adEt8f/6C41cqRO+iDbL3zg=;
        b=Zr3qfPmbVELkz0QzyPLoGnwpTz6y1m6nTxcaLKnGwQjxFg8b3TJfvOnTvx5jJTX0Vb
         4NsDRwhmJaDVj4+Z8RsbFYy9h5Wu3Cdb3GH1WlstJpT9l0EMBbgPllPlnb74ikVGfZhF
         /vhR50XAgAY+dYJcJV7rEVVXSy22qJ9BZp1b5xEp8aifpnLb0QvRWAKGqwe/3DFXuoT6
         x8fL8Ov7OAWCPtnqunpwlErr0jLSoRbbiZdqXeBU4nmgSnXoc2ocesPGnGQcdkT1bzUs
         mD4Z+aAauD2w6TbIgGAw0HF11MhJsGHSal5vGfkCNKtOCedycPOvV5CeqWyLC9m5bRV7
         7rYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718270429; x=1718875229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csLKQFD6Tcenf8eJdKO/adEt8f/6C41cqRO+iDbL3zg=;
        b=LYsap3e802GPH1/+GGWk3lxVfAwKgwetUjgTx1zWgHf0Ye3ZjBJjoS/gBXW+FJvPbL
         6qrSurrQtTOMi+26tMoO3kliDetiCWeb4hUG2DxTG39BWAmXMka+jXZllNRR1fEeU4rc
         cw2WS32xX0ZOTlAdTPXW1YSOJICo3x0/bAJUP1a16Q4uRt7R1hY9Z2cQlKiIMv079/Mo
         4a0DAdloAjuvk1kV2EIbBh50ZKZhKBXwhI9V6XS63UW4jafef9iDf8+IgPTWW1g3XD15
         XNV4JkLpcuoQkHjUCTa1pbRorDxqQW3E4zkK6C1qf78HST4vA8aezCWp6n18XQvV2xJX
         2F8w==
X-Forwarded-Encrypted: i=1; AJvYcCXL82DgiK3nhpoCOJ1s85RKdv3gZpg5kHu2MQeMuFBCEQDpA83oOIuKRy4nz486MlJdo5sYP5teBCzhUMMWfnTx1vpS
X-Gm-Message-State: AOJu0Yx6mvr27tAfRqN4Z12PgaJAOJBggVYlcmsL/Sq9arA6gdheJk4z
	sd6BrzzghK11c/z+sFfnNusZR8DvGYY/KCTQ8LNFchJQd8fIt3zUFb6lu0OAKJSuNjVCoqABC1Y
	lkQ/Q44e2NFXh2odFtc/Zexb3xTE=
X-Google-Smtp-Source: AGHT+IFed9H5JM1SrGJtb2+Kf28Ibrp0V6KX2iqKvtXKbBzLKEMT/llRVLx61dEjDWZmVwx1MrI8K71JhP7Jr+l1hlY=
X-Received: by 2002:a92:ca06:0:b0:375:a994:6de0 with SMTP id
 e9e14a558f8ab-375cd177970mr48444765ab.13.1718270429288; Thu, 13 Jun 2024
 02:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1718243482-18552-1-git-send-email-shengjiu.wang@nxp.com>
 <1718243482-18552-3-git-send-email-shengjiu.wang@nxp.com> <20240613081949.yty3hznopp3u2qwq@pengutronix.de>
In-Reply-To: <20240613081949.yty3hznopp3u2qwq@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 13 Jun 2024 17:20:18 +0800
Message-ID: <CAA+D8AMc9=bzHKNXyMH5LLerr2kgmKTxacP=1LhocTHgP9Thfw@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] clk: imx: clk-audiomix: Add reset controller
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

On Thu, Jun 13, 2024 at 4:20=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> On 24-06-13, Shengjiu Wang wrote:
> > Audiomix block control can be a reset controller for
> > Enhanced Audio Return Channel (EARC), which is one of
> > modules in this audiomix subsystem.
> >
> > The reset controller is supported by the auxiliary device
> > framework.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/clk/imx/Kconfig               |  1 +
> >  drivers/clk/imx/clk-imx8mp-audiomix.c | 63 +++++++++++++++++++++++++++
> >  2 files changed, 64 insertions(+)
> >
> > diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> > index 6da0fba68225..9edfb030bea9 100644
> > --- a/drivers/clk/imx/Kconfig
> > +++ b/drivers/clk/imx/Kconfig
> > @@ -81,6 +81,7 @@ config CLK_IMX8MP
> >       tristate "IMX8MP CCM Clock Driver"
> >       depends on ARCH_MXC || COMPILE_TEST
> >       select MXC_CLK
> > +     select AUXILIARY_BUS
>
>         select AUXILIARY_BUS if RESET_CONTROLLER

Do we really need this change?

I checked other drivers like MCHP_CLK_MPFS, but they don't have
this condition also.

>
> >       help
> >           Build the driver for i.MX8MP CCM Clock Driver
> >
> > diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/cl=
k-imx8mp-audiomix.c
> > index b381d6f784c8..517b1f88661b 100644
> > --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> > +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> >   */
> >
> > +#include <linux/auxiliary_bus.h>
> >  #include <linux/clk-provider.h>
> >  #include <linux/device.h>
> >  #include <linux/io.h>
> > @@ -13,6 +14,7 @@
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/slab.h>
>                 ^
> This is an unrelated change.

This is for the fix of this issue

https://lore.kernel.org/oe-kbuild-all/202405201844.zf7UkDmq-lkp@intel.com/

Best regards
Shengjiu wang

>
> Regards,
>   Marco
>
> >
> >  #include <dt-bindings/clock/imx8mp-clock.h>
> >
> > @@ -217,6 +219,63 @@ struct clk_imx8mp_audiomix_priv {
> >       struct clk_hw_onecell_data clk_data;
> >  };
> >
> > +#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
> > +
> > +static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
> > +{
> > +     struct auxiliary_device *adev =3D _adev;
> > +
> > +     auxiliary_device_delete(adev);
> > +     auxiliary_device_uninit(adev);
> > +}
> > +
> > +static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
> > +{
> > +     struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> > +
> > +     kfree(adev);
> > +}
> > +
> > +static int clk_imx8mp_audiomix_reset_controller_register(struct device=
 *dev,
> > +                                                      struct clk_imx8m=
p_audiomix_priv *priv)
> > +{
> > +     struct auxiliary_device *adev __free(kfree) =3D NULL;
> > +     int ret;
> > +
> > +     if (!of_property_present(dev->of_node, "#reset-cells"))
> > +             return 0;
> > +
> > +     adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
> > +     if (!adev)
> > +             return -ENOMEM;
> > +
> > +     adev->name =3D "reset";
> > +     adev->dev.parent =3D dev;
> > +     adev->dev.release =3D clk_imx8mp_audiomix_reset_adev_release;
> > +
> > +     ret =3D auxiliary_device_init(adev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D auxiliary_device_add(adev);
> > +     if (ret) {
> > +             auxiliary_device_uninit(adev);
> > +             return ret;
> > +     }
> > +
> > +     return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_un=
register_adev,
> > +                                     no_free_ptr(adev));
> > +}
> > +
> > +#else /* !CONFIG_RESET_CONTROLLER */
> > +
> > +static int clk_imx8mp_audiomix_reset_controller_register(struct clk_im=
x8mp_audiomix_priv *priv)
> > +{
> > +     return 0;
> > +}
> > +
> > +#endif /* !CONFIG_RESET_CONTROLLER */
> > +
> >  static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool =
save)
> >  {
> >       struct clk_imx8mp_audiomix_priv *priv =3D dev_get_drvdata(dev);
> > @@ -337,6 +396,10 @@ static int clk_imx8mp_audiomix_probe(struct platfo=
rm_device *pdev)
> >       if (ret)
> >               goto err_clk_register;
> >
> > +     ret =3D clk_imx8mp_audiomix_reset_controller_register(dev, priv);
> > +     if (ret)
> > +             goto err_clk_register;
> > +
> >       pm_runtime_put_sync(dev);
> >       return 0;
> >
> > --
> > 2.34.1
> >
> >
> >
