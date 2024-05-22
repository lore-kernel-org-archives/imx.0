Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B104F1C683
	for <imx@lists.linux.dev>; Wed, 22 May 2024 02:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716343562; cv=none; b=PTmb6GVEdJ9HpKxDGa7s9s1UkCLRzxGR04fqf3TUKZluwV57D4D++WMi/UezBQ7hvJSY/iN3NpO8EL8s8BYiLMe8P15wKBfbPN6sPJYV3jcOtWpF4TFbt+LdOMMJss2/87+rs5N8ojcEnKUVNveLJ+SlDFmXbbTMbb9Q3WdaZzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716343562; c=relaxed/simple;
	bh=cqKCSGQGjMNfM+jf3RsqKDf/P5FOZraL0UthYMFVnMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUp/wUSlToGFzW6/N8Gp1L9DLiuUO1SwdqhKPZOnv6gE6XKuT6ZOwhFZaL78A2vSGrJ+UJRn+1WIPlBDPfuLbYX3qsj34a+eXibRDnqueUAxLgHU00JoePWz11FtQBCmlUqkLZIsySYocoOOaNDqTRYd0ZukDDXgBWnYtUZiNK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECCzfm+1; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECCzfm+1"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3713ff97cf5so4952695ab.2
        for <imx@lists.linux.dev>; Tue, 21 May 2024 19:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716343560; x=1716948360; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnv9v2c0E57wPW+4p8ZhEo1c9rdpxtiAjmB2vfpueB4=;
        b=ECCzfm+1gYY2xbYwUdu0RnDdW5i40fsBGPbLBc1weSmQNGweB9+3xs2kjL1mL7gX/3
         /uUiIRJVZPa8IRiVhLiLAfCaW+iNqkY142mAoFVpqr49SWMmojmSCR8FYKhmxPB1B5QR
         di5raIYW8rRAK5Nw77oHwLNlxs2HZJW4SVwGaecniMOvoA5/a5CH8gBNnF84sSUcYFEn
         G7J/vDScANq86cmfuaJG3Pjd388iJj3XDjwGr+a5RVOyRaORT02dvWog6yxkPAo2BjwS
         tK6XHKDegeQ2o3EkZRhuR3GIUF+sxLzamrSLPRSq/qNB/g3SIVs7pCV+/SHDDp9zvNbo
         ic3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716343560; x=1716948360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnv9v2c0E57wPW+4p8ZhEo1c9rdpxtiAjmB2vfpueB4=;
        b=wDIhKrFAQBltBU6dsCYeppHJdghCpY7qYl56aiL43QMpjRMrNiBh0txcffhnCDF4eQ
         BIxFUAiav1thfmJtwJEPdMXV4cmvTu763AlUbsQwGMX8pf91F3OElXAbEghCyKU2/T+q
         jgyXDmNHnlA4PsCNXkm7dhOaLv/vIi7o1BPdXYNnCCWxm+3A31R7P/e3c/NYHJVacR8m
         hYgR59kgwo5NEtKJOEQykcmmLQCaEpvUfybs3MYsMgId4T/fXS10o6lVZ9unVU7nliMd
         ex9SzKq5Fd8hXw84pJLKbpxhxOFwU1ucee2Veq3QA7CQC5xvmr8TSB3ukEB2e50uCm0a
         6UYg==
X-Forwarded-Encrypted: i=1; AJvYcCXLzuGOm/fOOEKOp4qRDuUdQ8Hh72mnAMYPuX7b9umy1F4OlAMJxU8jsJ+WkPiQ5H9oAheVYCI2BAyvhQI8MsrCBlkb
X-Gm-Message-State: AOJu0YwoWY+j+A9BXFuVkPwqIhtqirCe/N8hDuO3qQalDmeEU/IM5pQA
	I3DLCbkDeNWAaRlPbDruCG81Oc0mEIGzXd8k8dxEoDuYUcIx156aJjH8JOp5M2AEX1UiHleDgrR
	oa52hzhcOcuHUQQIjzjY8by7Zk9k=
X-Google-Smtp-Source: AGHT+IGWau/e/rvvgASCHQCUf6H0cfZp5gpvIsVjqT1ymyJTnGmjRGx0xCNX0GDTJQt5yWuYjLGL7jucwJ/sMEV6Jms=
X-Received: by 2002:a05:6e02:1c02:b0:36c:46bf:4afa with SMTP id
 e9e14a558f8ab-371f99f5e32mr8121285ab.6.1716343559715; Tue, 21 May 2024
 19:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1716188963-16175-1-git-send-email-shengjiu.wang@nxp.com>
 <1716188963-16175-3-git-send-email-shengjiu.wang@nxp.com> <Zktv3OcDbV1cggP1@lizhi-Precision-Tower-5810>
In-Reply-To: <Zktv3OcDbV1cggP1@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 22 May 2024 10:05:48 +0800
Message-ID: <CAA+D8AMajQn37bH1qrvuUBoUUowMPPwVztRfkCdg5AR8KC0muQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] clk: imx: clk-audiomix: Add reset controller
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

On Mon, May 20, 2024 at 11:44=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, May 20, 2024 at 03:09:20PM +0800, Shengjiu Wang wrote:
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
> >  drivers/clk/imx/clk-imx8mp-audiomix.c | 61 +++++++++++++++++++++++++++
> >  2 files changed, 62 insertions(+)
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
> > index b381d6f784c8..d2eaabe431cd 100644
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
> > @@ -217,6 +218,62 @@ struct clk_imx8mp_audiomix_priv {
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
> > +     struct auxiliary_device *adev;
> > +     int ret;
> > +
> > +     adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
>
>
> You may use scoped free
>
>         struct auxiliary_device *adev __free(kfree) =3D kzalloc(sizeof(*a=
dev), GFP_KERNEL);

Ok, will update the code

best regards
Shengjiu Wang
>
> > +     if (!adev)
> > +             return -ENOMEM;
> > +
> > +     adev->name =3D "reset";
> > +     adev->dev.parent =3D dev;
> > +     adev->dev.release =3D clk_imx8mp_audiomix_reset_adev_release;
> > +
> > +     ret =3D auxiliary_device_init(adev);
> > +     if (ret) {
> > +             kfree(adev);
> > +             return ret;
> > +     }
>
> if use scoped free,
>
>         if (ret)
>                 return ret;
>
> > +
> > +     ret =3D auxiliary_device_add(adev);
> > +     if (ret) {
> > +             auxiliary_device_uninit(adev);
> > +             kfree(adev);
> > +             return ret;
>
> the same here.
>
> > +     }
> > +
> > +     return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_un=
register_adev, adev);
>
> if use scope free
>         return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_un=
register_adev, no_free_ptr(adev));
>
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
> > @@ -337,6 +394,10 @@ static int clk_imx8mp_audiomix_probe(struct platfo=
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
