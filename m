Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA64BB641
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729066639; cv=none; b=UVZOCMPmZpZnlIhMa8ttYyQ4PS0C2Z0fW1TOP+5Wpvwxd6u5ThQQk65NAfWiWoWHaKiKseqcWTvJxQHZ280OLTraDPXE6UVmPdPL3clNPsgQQc6HLfELrqUw8CGPAw8BoC4DVDYqFAeM7lUbObeH+dFutAYhWh/O6kYberXq/lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729066639; c=relaxed/simple;
	bh=W7RowBdHT4f+P8dR62eXduVYuqH0YV4BoB3Kz9EFdy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rkN9P2PXz+GiQ3eKpvTccXpyZOarhGOksFm+ZHj4vldWSURT7wGTcxhzVlv5SylaTTwXke7h/1CMnnkk2M0urZdtVwyq1t9zPHBRiFGyEb+jhrVc0XlJ/buBKr2N9vl6CSDXM2tgPj1yL/h8xbg5lXiZcyIRGCooMFhxTQRLdoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeZ452lC; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeZ452lC"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a39f73a2c7so23842675ab.0
        for <imx@lists.linux.dev>; Wed, 16 Oct 2024 01:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729066637; x=1729671437; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ7Yl/IADUsYDzfDC27LTc+4OQ90sFAT2PacItaEUAU=;
        b=IeZ452lC60wCady3J21LSGUaacwAAQmo0/xJ9E3m2BHWkhWNwbNCbmGBbOhc2BkfVS
         QUmWkD/++1Do08vKMXchOeyHuBOTG62UuYUemy3YmfCAVSxFNoy6vufogXPBjulELIys
         RK9mHSR+k1x0jTJY6leJugJdOSDjC4Ogr79b5EKSNbibg0VjoKFT5whYGdzd40N1Wcyj
         5lRZXEeQSrFHOLTPd5GofEc4vUo3YJh3FLZfK5Qi8I53XZM8AGzCyEpJXrVaV28xRtQj
         7WzNntxtbpCxQki07vla//b8ncsuVPaifmyiPa+pGg4vp7fI/KNztRQJMLo2ILOrds2J
         olFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729066637; x=1729671437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ7Yl/IADUsYDzfDC27LTc+4OQ90sFAT2PacItaEUAU=;
        b=DNMyhQjKZbE41KiwzKXMFtErGfgHhyfM2Q6U3PULSmLR3Ee6U9KW8FganNjVmh7/rB
         hIag8WDk6UP23EM+DeC0yq2P4Hxskemso+z2EkN4LbgkGN6GEHnClm8ADw4dM+jlzGaf
         gxbJ8TVFXtZCyuaTFTuPt9nG0T8rrTDfdiBof0DBGk0+1uZa46ApZE7ZyJnzfyXJDiRD
         6kpnQ8jCUCMuZZ0Tydydjw3oAT24Pgq2qEB8pjlnulb7MLA/QhTqCX1ZvEYdb5bz5Cpm
         bjstn6kAcQxeUjhqnU64y4cFWT9Djlxe5cZfEJlea0PahXYYsVQ7+wPMf3hJI+Qk3YiC
         9wSA==
X-Forwarded-Encrypted: i=1; AJvYcCUwuI/8Imf4mmF9W1lyvSOwa/3LkUUMxN4OXkr3TxGQYDWveMr2t8I8vll7CzNY50S/2Wg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWtymp0j/FlIgqDRC9qu4eBYgYVbYoKOGfnhyAYQP+5Z6vp+1W
	Yka5fgp3Zc4IdzQiTWq7mEG1GV/1PGBg+0GG54MRG4OvYjtWuYyYmoF/PFYwe2awsP28P0OlJza
	YAudgmHtYermKRigUJmHDFc17ARg=
X-Google-Smtp-Source: AGHT+IGMGwemmX8QKJFS/YeT0BUqntktDJUHCQOSIR3XNqG5e5BuUkFwWEi1dzGtv+YrGwI7DX/vejugt8v79fdr6tI=
X-Received: by 2002:a05:6e02:1d15:b0:3a3:3e17:993f with SMTP id
 e9e14a558f8ab-3a3b5f4411fmr161294395ab.8.1729066636855; Wed, 16 Oct 2024
 01:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1726106381-1138-1-git-send-email-shengjiu.wang@nxp.com>
 <1726106381-1138-2-git-send-email-shengjiu.wang@nxp.com> <Zw9y84AzNwUhUAhJ@dragon>
In-Reply-To: <Zw9y84AzNwUhUAhJ@dragon>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 16 Oct 2024 16:17:04 +0800
Message-ID: <CAA+D8APK+6ErUHXe7c0ooLcm3TLCNgYPeuC4ywgPME_o+TM4+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: imx93-9x9-qsb: Enable sound-wm8962
 sound card
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 4:03=E2=80=AFPM Shawn Guo <shawnguo2@yeah.net> wrot=
e:
>
> On Thu, Sep 12, 2024 at 09:59:39AM +0800, Shengjiu Wang wrote:
> > Add wm8962 sound card which connects to sai3. The connection
> > of SAI3 and wm8962 is controlled by PCAL6524HEAZ module, add
> > gpio-hog for it.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../boot/dts/freescale/imx93-9x9-qsb.dts      | 74 +++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm=
64/boot/dts/freescale/imx93-9x9-qsb.dts
> > index f8a73612fa05..10f3366b8253 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> > @@ -68,6 +68,15 @@ reg_vref_1v8: regulator-adc-vref {
> >               regulator-max-microvolt =3D <1800000>;
> >       };
> >
> > +     reg_audio_pwr: regulator-audio-pwr {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "audio-pwr";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             gpio =3D <&pcal6524 16 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> >       reg_rpi_3v3: regulator-rpi {
> >               compatible =3D "regulator-fixed";
> >               regulator-name =3D "VDD_RPI_3V3";
> > @@ -88,6 +97,22 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
> >               enable-active-high;
> >               off-on-delay-us =3D <12000>;
> >       };
> > +
> > +     sound-wm8962 {
> > +             compatible =3D "fsl,imx-audio-wm8962";
> > +             model =3D "wm8962-audio";
> > +             audio-cpu =3D <&sai3>;
> > +             audio-codec =3D <&wm8962>;
> > +             hp-det-gpio =3D <&pcal6524 4 GPIO_ACTIVE_HIGH>;
> > +             audio-routing =3D
> > +                     "Headphone Jack", "HPOUTL",
> > +                     "Headphone Jack", "HPOUTR",
> > +                     "Ext Spk", "SPKOUTL",
> > +                     "Ext Spk", "SPKOUTR",
> > +                     "AMIC", "MICBIAS",
> > +                     "IN3R", "AMIC",
> > +                     "IN1R", "AMIC";
> > +     };
> >  };
> >
> >  &adc1 {
> > @@ -136,6 +161,28 @@ &lpi2c1 {
> >       pinctrl-0 =3D <&pinctrl_lpi2c1>;
> >       status =3D "okay";
> >
> > +     wm8962: codec@1a {
>
> Can we use audio-codec for node name?

Ok,  will update it.

Best regards
Shengjiu Wang

>
> Shawn
>
> > +             compatible =3D "wlf,wm8962";
> > +             reg =3D <0x1a>;
> > +             clocks =3D <&clk IMX93_CLK_SAI3_GATE>;
> > +             DCVDD-supply =3D <&reg_audio_pwr>;
> > +             DBVDD-supply =3D <&reg_audio_pwr>;
> > +             AVDD-supply =3D <&reg_audio_pwr>;
> > +             CPVDD-supply =3D <&reg_audio_pwr>;
> > +             MICVDD-supply =3D <&reg_audio_pwr>;
> > +             PLLVDD-supply =3D <&reg_audio_pwr>;
> > +             SPKVDD1-supply =3D <&reg_audio_pwr>;
> > +             SPKVDD2-supply =3D <&reg_audio_pwr>;
> > +             gpio-cfg =3D <
> > +                     0x0000 /* 0:Default */
> > +                     0x0000 /* 1:Default */
> > +                     0x0000 /* 2:FN_DMICCLK */
> > +                     0x0000 /* 3:Default */
> > +                     0x0000 /* 4:FN_DMICCDAT */
> > +                     0x0000 /* 5:Default */
> > +             >;
> > +     };
> > +
> >       ptn5110: tcpc@50 {
> >               compatible =3D "nxp,ptn5110", "tcpci";
> >               reg =3D <0x50>;
> > @@ -194,6 +241,12 @@ pcal6524: gpio@22 {
> >               interrupts =3D <26 IRQ_TYPE_LEVEL_LOW>;
> >               pinctrl-names =3D "default";
> >               pinctrl-0 =3D <&pinctrl_pcal6524>;
> > +
> > +             exp-sel-hog {
> > +                     gpio-hog;
> > +                     gpios =3D <22 GPIO_ACTIVE_HIGH>;
> > +                     output-low;
> > +             };
> >       };
> >
> >       pmic@25 {
> > @@ -286,6 +339,17 @@ &mu2 {
> >       status =3D "okay";
> >  };
> >
> > +&sai3 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_sai3>;
> > +     assigned-clocks =3D <&clk IMX93_CLK_SAI3>;
> > +     assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;
> > +     assigned-clock-rates =3D <12288000>;
> > +     fsl,sai-mclk-direction-output;
> > +     fsl,sai-synchronous-rx;
> > +     status =3D "okay";
> > +};
> > +
> >  &usbotg1 {
> >       dr_mode =3D "otg";
> >       hnp-disable;
> > @@ -443,6 +507,16 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07 0x31e
> >               >;
> >       };
> >
> > +     pinctrl_sai3: sai3grp {
> > +             fsl,pins =3D <
> > +                     MX93_PAD_GPIO_IO12__SAI3_RX_SYNC                0=
x31e
> > +                     MX93_PAD_GPIO_IO18__SAI3_RX_BCLK                0=
x31e
> > +                     MX93_PAD_GPIO_IO17__SAI3_MCLK                   0=
x31e
> > +                     MX93_PAD_GPIO_IO19__SAI3_TX_DATA00              0=
x31e
> > +                     MX93_PAD_GPIO_IO20__SAI3_RX_DATA00              0=
x31e
> > +             >;
> > +     };
> > +
> >       pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> >               fsl,pins =3D <
> >                       MX93_PAD_SD2_CD_B__GPIO3_IO00           0x31e
> > --
> > 2.34.1
> >
>
