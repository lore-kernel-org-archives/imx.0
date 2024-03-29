Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C88713AA5F
	for <imx@lists.linux.dev>; Fri, 29 Mar 2024 21:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711748649; cv=none; b=nh1UD6hD23TpVHr7FTWs0VZQM5KCoq1loFrR/fuyd8TwblKHRy+2D5fGyogpShWJz752ZykqjV7gpy2DO8fEzDUez6iVmnmkfP0CsQVGnMZ+YLXOczTN5QvIsyh7nA4DfrC4VhzmMZqso90/wIYteEeoJxUXsLxs2jlUUsYAq+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711748649; c=relaxed/simple;
	bh=+jBhIrvcXVyDq33tjtqEIp6zIzGJy+Qq5epT7vDVv70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXtvfn/ZxicdaoUQ7wTR0CFYiapEbBG4b0fhQ/efsSq0XxYJcTauZNedW/iGdPYoUVgLX/vsKzosgCu+hWaObW6dV7TLlrhYj7Gg/pd7KVhKS/ozeZ/SqIaJEs4wEePV49+M7tcFL4C1Iq377hpajMzR8Aik+Qf+gM3tCDxGzNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hzdy6Eik; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hzdy6Eik"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-515b69e8f38so2442661e87.1
        for <imx@lists.linux.dev>; Fri, 29 Mar 2024 14:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711748645; x=1712353445; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+j4R62w7usMioWBNXcnFNjoIGgezgYc/HXlodfmczNY=;
        b=Hzdy6EikuNgfu9aDWWp+/EKK8EBGuKSu5Wh6nuIkEUbgcwOFwZvTXnJNf+KsstgOoi
         c/MkenYzcbLZxpSZ9CE3dDDbQOj8ovYzJl1emZL8LLAqvaPcIoB6KlHw2tadA2pYvIUp
         JeBSnzCvh69hEJMcXB8534IZ7St8fgSXK9avL4PI8rzEgX8HiaN7pTRC3RXuPkFRvU9r
         WlfBf8o/nIZ8HVn99uNfqkG4SPPreICRwZQkMm8/WvjLvlmNOI5aRTbzZwUkxU8252Uo
         rXwqUWYm+KaEGfAd+0io12Rx+W4ZVFpHU5MyWBKWKIIZddCtnvN8dJgMSI11vVC8HHun
         dS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711748645; x=1712353445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+j4R62w7usMioWBNXcnFNjoIGgezgYc/HXlodfmczNY=;
        b=wmg+p9pX1ZSNZIzPGFH8yfBgigDacBrOI365nR9ReamXkfSsZ+keF0nprxr/LYnkrE
         Da6VTNrSFlMh5Qld4ELiX5eVIJA9BwqW1vpwDI0FCBDWrL29LhS4e3SsiGzbYEcba4nR
         w/jp8x9ZyYtNlNW/wKcrnSDUHaNR8kA4uPa+SW2hkibiKbANLvvEnvIP1Jpx4KHxQ5nM
         0kHAWn9xBTG3jePCiNzoYqQ9293vy+qWkPGFDiMGj8gtAGEP4YEoBMZkSzlVxdhEpUrp
         AFMBK3c5dSC3mzZR2i9OnSxARl8PknGfyJvls54vegOAGzoPcLAqjZRHq2nApWKrzlSA
         yN/A==
X-Forwarded-Encrypted: i=1; AJvYcCUAkXf6WbS+OiQmLR/c0XG+dl+krqiERN3XpwZMRIfZm59/8z1w//ec+iUR2FGLj96zASvo0CbgT0Ludeyyv1ud1trc
X-Gm-Message-State: AOJu0YwquzMoDdTlsBkKEvwysRp7u4+O8bDQ4LV0LYNmwq74OxcPpT7+
	jWhhJ4PZuKoqHOA0Kh17hPco2zB6cUJIZ7rqN4V4OwMVa2+YCYm1RpNTdekKz2y6xsBAAYKk9wi
	x6Zf8lTnw9snarbZKXPX8ExvgM8c=
X-Google-Smtp-Source: AGHT+IEMkv0f7VY6qxqY6HZok7AeOOVlOfCa5B3zFUOTk1dxtaQmV5ORK1u77W2cQlpruHy+LjqPA5yWFRyWTEWsBXY=
X-Received: by 2002:ac2:528a:0:b0:515:e6bd:2f13 with SMTP id
 q10-20020ac2528a000000b00515e6bd2f13mr196626lfm.15.1711748644943; Fri, 29 Mar
 2024 14:44:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328202320.187596-1-gilles.talis@gmail.com>
 <20240328202320.187596-4-gilles.talis@gmail.com> <a6728917-b756-430a-905c-f458fe41b998@linaro.org>
In-Reply-To: <a6728917-b756-430a-905c-f458fe41b998@linaro.org>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 29 Mar 2024 17:43:53 -0400
Message-ID: <CAKcgs2zY6q95jWpdgxsjDpmKttB1b2Jc+euhn+jkaP1CKKhoVg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: freescale: Add device tree for Emcraft
 Systems NavQ+ Kit
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, shawnguo@kernel.org, 
	festevam@gmail.com, alex@voxelbotics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

Le jeu. 28 mars 2024 =C3=A0 18:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
>
> On 28/03/2024 21:23, Gilles Talis wrote:
> > The Emcraft Systems NavQ+ kit is a mobile robotics platform
> > based on NXP i.MX8 MPlus SoC.
> >
> > The following interfaces and devices are enabled:
> > - eMMC
> > - Gigabit Ethernet
> > - RTC
> > - SD-Card
> > - UART console
> >
> > Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../arm64/boot/dts/freescale/imx8mp-navqp.dts | 435 ++++++++++++++++++
> >  2 files changed, 436 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/d=
ts/freescale/Makefile
> > index 045250d0a040..bf99864c0bc4 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -166,6 +166,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-dhcom-pdk3.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-icore-mx8mp-edimm2.2.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-msc-sm2s-ep1.dtb
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-navqp.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-phyboard-pollux-rdk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-skov-revb-hdmi.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-skov-revb-lt6.dtb
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts b/arch/arm6=
4/boot/dts/freescale/imx8mp-navqp.dts
> > new file mode 100644
> > index 000000000000..8182e71008f8
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
> > @@ -0,0 +1,435 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2021 Emcraft Systems
> > + * Copyright 2024 Gilles Talis <gilles.talis@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include "imx8mp.dtsi"
> > +
> > +/ {
> > +     model =3D "Emcraft Systems i.MX8MPlus NavQ+ Kit";
> > +     compatible =3D "emcraft,imx8mp-navqp", "fsl,imx8mp";
> > +
> > +     chosen {
> > +             stdout-path =3D &uart2;
> > +     };
> > +
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&pinctrl_gpio_led>;
> > +
> > +             status {
>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=3D1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
>
> > +                     label =3D "status";
>
> Please provide color and function properties, if reasonable, and then
> remove label property.
>
> > +                     gpios =3D <&gpio3 16 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "on";
> > +             };
> > +     };
> > +
>
> ...
>
> > +     pinctrl_i2c6: i2c6grp {
> > +             fsl,pins =3D <
> > +                     MX8MP_IOMUXC_UART4_RXD__I2C6_SCL                 =
               0x400001c3
> > +                     MX8MP_IOMUXC_UART4_TXD__I2C6_SDA                 =
               0x400001c3
> > +             >;
> > +     };
> > +
> > +     pinctrl_pmic: pmicirq {
> > +             fsl,pins =3D <
> > +                     MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03              =
               0x41
> > +             >;
> > +     };
> > +
> > +     pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> > +             fsl,pins =3D <
> > +                     MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19             =
               0x41
> > +             >;
> > +     };
> > +
> > +     pinctrl_uart2: uart2grp {
> > +             fsl,pins =3D <
> > +                     MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX             =
               0x49
> > +                     MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX             =
               0x49
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc2: usdhc2grp {
> > +             fsl,pins =3D <
> > +                     MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                 =
               0x190
> > +                     MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                 =
               0x1d0
> > +                     MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0             =
               0x1d0
> > +                     MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1             =
               0x1d0
> > +                     MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2             =
               0x1d0
> > +                     MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3             =
               0x1d0
> > +                     MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT          =
               0xc1
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
>
> Hm, you upstreamed something based on downstream source. Please avoid
> that. Instead take upstream, clean DTS and customize it to your needs.
> Otherwise you send patch with the same issues we fixed.
OK. Got it. Will avoid that in the future.

>
> Standard form letter:
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=3D1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
>
> Nodes end on 'grp' I believe.
I did run it, but I might have messed up something, as I did not get
the results your automatic check reported. Let me run it again and fix
the issues.

>
>
> Best regards,
> Krzysztof
>
regards
Gilles.
