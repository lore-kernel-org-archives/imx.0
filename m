Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC5316F849
	for <imx@lists.linux.dev>; Tue, 11 Jun 2024 02:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718073304; cv=none; b=R5iinv6jzzvPHfZCBMnzgFwy8A6gmHEkRScccHcWIDpL8CRc4qphI2pste/IOx50xNSXA4ZMo/6lJGl29yqzbyB7JbbUVVjOd226TVPbPWrwyrAPZG86sMXhK8/UxrZe/Ta/RdjBv3LkIOfUb/52k1rY/DV/FXYEfHM988DAlA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718073304; c=relaxed/simple;
	bh=uX23ExG6CnBtKrCFcOoTf4iiV2uXPJwIj4H+fGp/ph8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V5aBBxYJ2qnNtNKbA/1k1+yGk9YRlHFQY4lgl/ECu2ywKJOgS2Fa4LTTCv8ayy2i4t2r0PQapRLmvIjQkWD4T/2qA/FEAm4W8F5LFixcdPpIslFeUHtHzoZTnKVhBOsSlzNdOr+lE4Uzx6EoUKx4EhULQvFmFYBtZKNqyAQ2UZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muyWmwkv; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muyWmwkv"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-375932c94a9so2746365ab.1
        for <imx@lists.linux.dev>; Mon, 10 Jun 2024 19:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718073302; x=1718678102; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Gfi1U2YocN7eKZd+4TAjGD3Blv7pzKIBpTmBX7SoCw=;
        b=muyWmwkvOpXWRFB/OOx4VT9qD+Ou7kmhL2LZjKEZqxPnihTeFTae699pdCG1FO/yuS
         v0nw3xGWdsI3yRWuVCVPV0M8d4Yxjswm6CfFfzKLZ0cpKY48Tje8DhlnjXD7iCiVdYtk
         GPPngAzpFBGSwRCGFcftvqNAPByU7fSajRZIh2/ficSe4yBusRxmprjGQysXCplWCWCx
         IglnSa+pkXeWpcsMJ44cmmSVfVQqvm9xFZZ2h+qPDLXX1UUq/R2Ji2DCG0R3/9u4KTNk
         l0mZG/qtRcmC/+Stisr8E5UW6rM8qiSRaLxAbu+2U3GnJn5PJvdVr3bpogIqZuMxisuI
         IDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718073302; x=1718678102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Gfi1U2YocN7eKZd+4TAjGD3Blv7pzKIBpTmBX7SoCw=;
        b=JaXVKC7kUrKZvK2ckg4Z9Q50tq/E0Tsu+q6bkBLkVOXHSUT3EoVVxLoE8Quf0tPgZZ
         1kn7DHHVv8NVriQncdhxXwVVkhWN6JJ/3A6J5OcB9ueaGlEoH2t/x/+3IPtXlFgvTfZJ
         oHTyBZCgmPjNhpQFM301Mz0wJ7qP4BEvViMWmkyr/uT3chX5EIqWqa0LJfcZLwRo6mEL
         gYXBJtLIornTIdy+Y8mguvIRKTf59abboe+5o8V0JaKZGwvUECyRKyYWVm641iwOJcPP
         aM7/P7tvnJE9nlpG9rMwIHc+THoFw5qC0sHwA8pDLDFgDeC286SLjD8UpwTzccVIE6jv
         PhSA==
X-Forwarded-Encrypted: i=1; AJvYcCVnrZ+SoE4MHnfRQE6v/hULmFw4/dy8lTlXCKbXuQzxj1PkTSzjWAwSB5kVYjs35ernUwdauu0YAWRLncjligaNCAaC
X-Gm-Message-State: AOJu0YwBt7ptI+sNLWnkGlvaVKIFdcFjsTFxo9/yHmHXINtTm6BzFO51
	1X+3uuwiT0sDRFauTN9E4QlLCwApipKmyN99oR2G+CnkB9OmMXy4sMGbwiW0jPEuzaaSDQCxr92
	na/9QvgpBuL2yVr5tLu/ysyymnEk=
X-Google-Smtp-Source: AGHT+IFMzXCoGvT54xrVUmElOG6ITA/pDCGx5P7kEv4zMKFvgLbChT4GvzIFhyASquV0eQSJFmz3vN3JDrgQJHAkFK0=
X-Received: by 2002:a92:dac1:0:b0:375:88ec:811b with SMTP id
 e9e14a558f8ab-37588ec880emr95209215ab.10.1718073301702; Mon, 10 Jun 2024
 19:35:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1717036278-3515-1-git-send-email-shengjiu.wang@nxp.com>
 <1717036278-3515-3-git-send-email-shengjiu.wang@nxp.com> <20240530085115.ttmzx4dve4x6nep2@pengutronix.de>
In-Reply-To: <20240530085115.ttmzx4dve4x6nep2@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 11 Jun 2024 10:34:50 +0800
Message-ID: <CAA+D8AP++bNzE4cccKP_NaxDK-MWN3jtkcB_P5jj0tNiZYYFSg@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] clk: imx: clk-audiomix: Add reset controller
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

On Thu, May 30, 2024 at 4:51=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> On 24-05-30, Shengjiu Wang wrote:
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
> > index b381d6f784c8..a3dc2f3606ee 100644
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
> > +     struct auxiliary_device *adev __free(kfree) =3D NULL;
> > +     int ret;
>
> Since the reset-controller is optional you need to check the existence
> of the '#reset-cells' property before you register it.
>

ok, will add it.

best regards
Shengjiu Wang

> Regards,
>   Marco
>
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
> >
> >
