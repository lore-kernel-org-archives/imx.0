Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD17F4A3C
	for <imx@lists.linux.dev>; Fri, 24 May 2024 01:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716515362; cv=none; b=VZxsqud1VGw0cvk/pNgMoSdHYce7xpHuBxHukZNtxZv0oeadhMc6e6hghCXThIrhQLT8OOinMwbnU6EpeaoEM3OE2WnajnDxQ0p/TxrP2aqkvXch/8cz7iQCqWC8FSQLcDhal/r/h+61gM1JN6uLzUKawNHN0ilTLypXdA1zWgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716515362; c=relaxed/simple;
	bh=fOK2TCE5oDIMbTwzI9DfT0ukFf7sfhp16ruyzkZnJtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cylVhUSDAUJRRtOFtCn5K3NU1n6csuBbLbZLMdA1F05ysr9i6kM9AqeDeZohUM5Lhsfliun7rVmAyq+hE0QUUKQL2cV1IwK1On0Txr20SrSDIkGaiXMGH0t+42L+jyLzfhhKeVh8pNvIuheiJCH7eCJ5215GeS7GcxRhiNw8bzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kj/7/Eka; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kj/7/Eka"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-36d93568a58so31362915ab.3
        for <imx@lists.linux.dev>; Thu, 23 May 2024 18:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716515360; x=1717120160; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaHuh4+m6vv2JYkBPChLg2kvgbF787xvUsagVVKzGy4=;
        b=Kj/7/EkaJM3IpliqQHsrdqiFfrim7zA7NvOaDg+z0/XICrDApnZRt7rhw/Z7x53ICH
         ONxKh+heZ7kgpugu31kHl57Mlc3drJ79gBOm+2qY5ykR8n9482+dFHTgicOsVgGggcvB
         Jd6/Ibuy/W3imMsq7hzemwcgmlcRqeGPq821aE9Swcscn7Rq2A75ybArQQUsBYUfrwqB
         y700/8lj0l7YKeIiM17YxrxJXhM54VWZRPe5F4xk+O7q71H7nXgO5mDvKH45F+h8QZ7L
         27pz0L9J5pmDjUNZh9wPKUrGvdxwSP1A8GJZFnOCT67bqHTx4ui8v2xXLseOsq8ga0NK
         GLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716515360; x=1717120160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaHuh4+m6vv2JYkBPChLg2kvgbF787xvUsagVVKzGy4=;
        b=TIkgaoKE/mlitzapr9tgmW6eWxLbqAmokhb396E91aS8YsUHq2j9JBAUriPZI1CHHS
         zfR6dMuWevtrHi9TKKXRw9xzIarnctWs/pDmsYbnngLAwfjkyv97pCU30TL39WuBVoeG
         xJvt0beJrbMvHWm35uDKRqXqoYMczQvyrVI2l1GIgKv/M3E1/8dz7BLaJswtodLyiuW3
         +WDyqcn2gtbySZW3EWXxUXWVuIfsqAwlfP46vpsHjctRXdw+fNVKl5zYwFchZvSC5TOE
         WkVii31WTfc1M3IJmT+KXT3o5jXzlOTiIXnnY6C6VvWfezkA9yvrUM28ciKuS2zGbGYe
         YxaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0m1HGK57BGWoXJgrdVFSv9vFOSQZU+tXmg149SrjqlZ6rlDFn3e+lrtgGGuhGMLMH7LkjuUShduoFhuPWl37ks+QC
X-Gm-Message-State: AOJu0YzHtEutwpzFBLVRGw19sTZ1rRtJBCdFv+1pq1sGVYdeX58wT9LS
	QXE4qbsk/y8Ld18Z492IMzs7vd8PVpxqmwasZ4E5yCuF7OHb5jLJ8BEAGJhJTvfdI8NDZArxx4F
	/s9JeMR5OadASC/iSJ6KueVelu18=
X-Google-Smtp-Source: AGHT+IEK9vmj8neF4F55N645JBC1EaRdY3npShutVz5Cv3dOxwoge7Qm5GttoeiQi1A3WlSKb4Zn6OT23sNlHff/HF4=
X-Received: by 2002:a92:c249:0:b0:371:b5a7:e44c with SMTP id
 e9e14a558f8ab-3737b35f477mr10159775ab.25.1716515359840; Thu, 23 May 2024
 18:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1716458390-20120-1-git-send-email-shengjiu.wang@nxp.com>
 <1716458390-20120-3-git-send-email-shengjiu.wang@nxp.com> <Zk+oxAh9+c0RIQ/t@lizhi-Precision-Tower-5810>
In-Reply-To: <Zk+oxAh9+c0RIQ/t@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 24 May 2024 09:49:08 +0800
Message-ID: <CAA+D8ANOQ8Pgt8QZWduZoVKCcb8Mdc=Xzotu4zAqakTjHO8pBQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] clk: imx: clk-audiomix: Add reset controller
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org, peng.fan@nxp.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	marex@denx.de, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 4:36=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, May 23, 2024 at 05:59:47PM +0800, Shengjiu Wang wrote:
> > Audiomix block control can be a reset controller for
> > Enhanced Audio Return Channel (EARC), which is one of
> > modules in this audiomix subsystem.
> >
> > The reset controller is supported by the auxiliary device
> > framework.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/clk/imx/Kconfig               |  1 +
> >  drivers/clk/imx/clk-imx8mp-audiomix.c | 60 +++++++++++++++++++++++++++
> >  2 files changed, 61 insertions(+)
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
> >       help
> >           Build the driver for i.MX8MP CCM Clock Driver
> >
> > diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/cl=
k-imx8mp-audiomix.c
> > index b381d6f784c8..2ee68f518850 100644
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
> >
> >  #include <dt-bindings/clock/imx8mp-clock.h>
> >
> > @@ -217,6 +219,60 @@ struct clk_imx8mp_audiomix_priv {
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
> > +     struct auxiliary_device __free(kfree) * adev =3D NULL;
>
> nit:  *adev =3D NULL;

Actually,  the checkpatch.pl told me need to have space after '*'...

Best regards
Shengjiu Wang

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> > +     int ret;
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
> > @@ -337,6 +393,10 @@ static int clk_imx8mp_audiomix_probe(struct platfo=
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
