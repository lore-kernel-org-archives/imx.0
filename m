Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D30323E
	for <imx@lists.linux.dev>; Fri, 30 May 2025 02:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748571679; cv=none; b=ZHwEBmp54gVqw1qUH2KonAPnVT4LzBx84eniKRy6fa/gMiizz7rYKInbFStybcmgTEk3I0KRnC+0IV1uD2GVFFz+2/6pRlhyMZ4cFASXknrWzE42WpVPWletefiQ0i92IeDdU7HHWylrHEk7q1Gz/KRKAu2gOAG6A0KEJkhFuVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748571679; c=relaxed/simple;
	bh=Z5S/u7bBXJz+UJbmVHinb1QfE/kpI3juJH+VPbf0yqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgkXMmgX4e6U6C/iO+4+bVK7vfUV5rJrMOUnupnq0EILiz+koOYEW0licGFrGxHawNfn/UTl9/UkjZIEcQXupIyJWFZv0H6B5zVOrQwnlbrlN8BEMwH3VYqwJZkiOYJcvT94Hb/bduJFBq8aqDWULPACCe8uyQq+opGPsfEkWwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnMLbaGZ; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnMLbaGZ"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3dc83a8a4afso8961835ab.1
        for <imx@lists.linux.dev>; Thu, 29 May 2025 19:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748571677; x=1749176477; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmH5dt7dkmT0sqR1VIsfV7vNMyQYFdcO4lpGZIrbck0=;
        b=SnMLbaGZZx08Iazq30dNLiHE23K/F5SBqDGDUQejb9v+H4O9GV7ShXvLHGPrf5PjG5
         QjkVKrwcypsKAE33d/6tWRA2EPKN5FRQ78fun02QdFaWJqJVnu/LJxny4V5RL7BYjKx3
         Q7Btg7Rq8QHcH4KKnfA1fIk/W+BTrTQtijZ/vZJT69QT9r8CdEUllfrxQbRnxIlr4Mbt
         ye4W56LsJA/OlAy4eY4Rp6rdKRImNbWtntf+3cpc7Gx0sbU9vqygJwZ1gpZ3O5J/EXpY
         vuttjgkL2uCgn6DX/g+VfXe5Ti7pNbQKyexxT7YowmD4/RWzMdvZM5KWlv2NPWaJg7v7
         EaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748571677; x=1749176477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmH5dt7dkmT0sqR1VIsfV7vNMyQYFdcO4lpGZIrbck0=;
        b=E35KKnazIX2VT3KEr5PsE40s+AwXxLJXifIx4ZnUnCsr4Z6Sqtu1A2kPFhQMkzfRfc
         HoRtSyasJRAffM+YEtAgSiE5mSfH7oBw6UN5Uy9qUSdHtaWRGomtQUVgopPpDUPm4czE
         btQtp3avOJeX738jxbMrgRXl4h2FXMoZRVgFaoG1uRbOY6MRW+YKTHxXeJ5Sm0GPHDhY
         o3bOlSu4iUfMsWrYi40uGGH8n9gq/1V/QABpcfRc73O1ppuKkmxMtejjD4+0c7xIBGW7
         YIsQv5kNbi0LPi5CdqNePHfJueZrx25UtyT9AXFdGrboFQsFBJGfnv8GPOfR+QSEMJl5
         xN9w==
X-Forwarded-Encrypted: i=1; AJvYcCWM/hbcPbLg/rrDSCgQczF92i29d5wKjr4RywB60CtWWRPmGn9m0A12IwnCDVnDcnphxbk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwU2z6Liist3htwslXfyPNK1tgjA8cG6frOdqOx1pFFWE/QgEAm
	v+HBqz3Un9ZCHIkpy3vGWent1iuKRqLfYZF44OP56/DtQPLytThtdPHst4l4iuIc0YHKR9vBUV2
	I/lNqldgeYdc7o7DWv9pe716f9xJZ64I=
X-Gm-Gg: ASbGnctrl7OEEZ2pbkdoBeeP8R0nbvW7oOx5Gx4XSB826ObKG4DpG7lIN0QIZbkb8Ks
	hCx7qlxj3DT9xKUZHlfkrlW8zZQbkX7zmE7yCjhIxaYDSsOpy43ladJrGR99qUbUPjZ3lK3uU7b
	lLS1RFmZ28aECXArjLEJR6h9+s9BWwlj+N
X-Google-Smtp-Source: AGHT+IF3V2Reg6jytvBoWQIFfYDbO3xHDMdxyQHBKHDQU6qnKv9QNLMNJun7za9/cXwvOQopUbNOEo2NaT5EoYkZ2lc=
X-Received: by 2002:a05:6e02:b27:b0:3dc:8a59:9d91 with SMTP id
 e9e14a558f8ab-3dd9a2f69b8mr15435425ab.5.1748571677153; Thu, 29 May 2025
 19:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
 <20250528015837.488376-5-shengjiu.wang@nxp.com> <20250528083704.ne6wyoj6vcmy7azq@pengutronix.de>
In-Reply-To: <20250528083704.ne6wyoj6vcmy7azq@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 May 2025 10:21:03 +0800
X-Gm-Features: AX0GCFsoAsJ1BSh1zryHTek_C0ndoEf3QlabWsiqEfnyP_mssnH9rTINpQzDe4g
Message-ID: <CAA+D8AMDbenx8scnBZdABAxF8MaYsBRzxXZjgGhMRbCJ-1wwcw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: imx943-evk: add sound-wm8962 support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, carlos.song@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 4:37=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Hi,
>
> On 25-05-28, Shengjiu Wang wrote:
> > Add WM8962 codec connected to SAI1 interface.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx943-evk.dts | 79 ++++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/=
boot/dts/freescale/imx943-evk.dts
> > index ff6e9ac5477f..da08aaa95904 100644
> > --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > @@ -36,6 +36,15 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
> >               enable-active-high;
> >       };
> >
> > +     reg_audio_pwr: regulator-wm8962-pwr {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-name =3D "audio-pwr";
> > +             gpio =3D <&pcal6416_i2c3_u171 12 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> >       reserved-memory {
> >               ranges;
> >               #address-cells =3D <2>;
> > @@ -50,6 +59,21 @@ linux,cma {
> >               };
> >       };
> >
> > +     sound-wm8962 {
> > +             compatible =3D "fsl,imx-audio-wm8962";
>
> Out of curiosity did you considered making use of "audio-graph-card2"?
>
> The "fsl,imx-audio-wm8962" seems like a pretty simple sound card which
> could be added via the "audio-graph-card2" as well. Don't get me wrong,
> it's not wrong what you're doing here but making use of the generic
> sound card would be nice because it's very common to just copy'n'paste
> the audio integration from the corresponding evk.dts file.

Thanks for the suggestion.

WM8962 has a function .set_pll(), which hasn't been supported in
audio-graph-card2.  so we still use fsl,imx-audio-wm8962.

Best regards
Shengjiu Wang

>
> Regards,
>   Marco
>
> > +             audio-codec =3D <&wm8962>;
> > +             audio-cpu =3D <&sai1>;
> > +             audio-routing =3D "Headphone Jack", "HPOUTL",
> > +                     "Headphone Jack", "HPOUTR",
> > +                     "Ext Spk", "SPKOUTL",
> > +                     "Ext Spk", "SPKOUTR",
> > +                     "AMIC", "MICBIAS",
> > +                     "IN3R", "AMIC",
> > +                     "IN1R", "AMIC";
> > +             hp-det-gpio =3D <&pcal6416_i2c3_u48 14 GPIO_ACTIVE_HIGH>;
> > +             model =3D "wm8962-audio";
> > +     };
> > +
> >       memory@80000000 {
> >               reg =3D <0x0 0x80000000 0x0 0x80000000>;
> >               device_type =3D "memory";
> > @@ -103,6 +127,28 @@ i2c@4 {
> >                       reg =3D <4>;
> >                       #address-cells =3D <1>;
> >                       #size-cells =3D <0>;
> > +
> > +                     wm8962: codec@1a {
> > +                             compatible =3D "wlf,wm8962";
> > +                             reg =3D <0x1a>;
> > +                             clocks =3D <&scmi_clk IMX94_CLK_SAI1>;
> > +                             AVDD-supply =3D <&reg_audio_pwr>;
> > +                             CPVDD-supply =3D <&reg_audio_pwr>;
> > +                             DBVDD-supply =3D <&reg_audio_pwr>;
> > +                             DCVDD-supply =3D <&reg_audio_pwr>;
> > +                             gpio-cfg =3D <
> > +                                     0x0000 /* 0:Default */
> > +                                     0x0000 /* 1:Default */
> > +                                     0x0000 /* 2:FN_DMICCLK */
> > +                                     0x0000 /* 3:Default */
> > +                                     0x0000 /* 4:FN_DMICCDAT */
> > +                                     0x0000 /* 5:Default */
> > +                             >;
> > +                             MICVDD-supply =3D <&reg_audio_pwr>;
> > +                             PLLVDD-supply =3D <&reg_audio_pwr>;
> > +                             SPKVDD1-supply =3D <&reg_audio_pwr>;
> > +                             SPKVDD2-supply =3D <&reg_audio_pwr>;
> > +                     };
> >               };
> >
> >               i2c@5 {
> > @@ -128,6 +174,12 @@ pcal6416_i2c3_u171: gpio@21 {
> >                               reg =3D <0x21>;
> >                               #gpio-cells =3D <2>;
> >                               gpio-controller;
> > +
> > +                             audio-pwren-hog {
> > +                                     gpios =3D <12 GPIO_ACTIVE_HIGH>;
> > +                                     gpio-hog;
> > +                                     output-high;
> > +                             };
> >                       };
> >               };
> >
> > @@ -262,6 +314,23 @@ &lpuart1 {
> >       status =3D "okay";
> >  };
> >
> > +&sai1 {
> > +     assigned-clocks =3D <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
> > +                       <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
> > +                       <&scmi_clk IMX94_CLK_AUDIOPLL1>,
> > +                       <&scmi_clk IMX94_CLK_AUDIOPLL2>,
> > +                       <&scmi_clk IMX94_CLK_SAI1>;
> > +     assigned-clock-parents =3D <0>, <0>, <0>, <0>,
> > +                              <&scmi_clk IMX94_CLK_AUDIOPLL1>;
> > +     assigned-clock-rates =3D <3932160000>,
> > +                            <3612672000>, <393216000>,
> > +                            <361267200>, <12288000>;
> > +     pinctrl-0 =3D <&pinctrl_sai1>;
> > +     pinctrl-names =3D "default";
> > +     fsl,sai-mclk-direction-output;
> > +     status =3D "okay";
> > +};
> > +
> >  &scmi_iomuxc {
> >
> >       pinctrl_ioexpander_int2: ioexpanderint2grp {
> > @@ -297,6 +366,16 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL          0x40000b9=
e
> >               >;
> >       };
> >
> > +     pinctrl_sai1: sai1grp {
> > +             fsl,pins =3D <
> > +                     IMX94_PAD_SAI1_TXFS__SAI1_TX_SYNC       0x31e
> > +                     IMX94_PAD_SAI1_TXC__SAI1_TX_BCLK        0x31e
> > +                     IMX94_PAD_SAI1_TXD0__SAI1_TX_DATA0      0x31e
> > +                     IMX94_PAD_SAI1_RXD0__SAI1_RX_DATA0      0x31e
> > +                     IMX94_PAD_I2C2_SDA__SAI1_MCLK           0x31e
> > +             >;
> > +     };
> > +
> >       pinctrl_uart1: uart1grp {
> >               fsl,pins =3D <
> >                       IMX94_PAD_UART1_TXD__LPUART1_TX         0x31e
> > --
> > 2.34.1
> >
> >
> >
