Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D161494A3
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484877; cv=none; b=E3pR4CKdFnE2W2XqMaiTvHTG0LuCDzN3QWo9jbbqk7Uz9cIopLFjnD7ZmLBIvOKqxctOE6FpHeRwGiLdmaamffRU4bd73iSz8WiQWEFEyyfuW/4sbhjwnohU6DJEA2b7j+VSJad0r+8JvT+hXBaQa/tdckcl5ZI0Ta8Ewjx6JlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484877; c=relaxed/simple;
	bh=oZ2eFoC+V5lXSs62YPNGeUBebnPSxj7VP91pS1H4+Qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMyW3BNgO/6TeauKyn3pmUc/7jvg2VKKv+sqyqpWGBSQEHqiCaWyW2JVDuDhNDVaDdapdWBckA+GqBgV5q9VyPdW2pD0RsBnE9UqxrNHr1ftttYqac+2qUevl5UNqhP9NzujfYxSYq93LUvvQiACYggcCiKWEfEULa86JdgfWow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Msns87te; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Msns87te"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e812c817de0so3899963276.0
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 09:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749484874; x=1750089674; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6fBa/D7ZSdkp1CcirJkKYMOK5Z9MjA4EI8lgY6/+9GI=;
        b=Msns87tefE7n5BenKB83uKeNnTbd3OEH3pjmACooryyyulkcdec91HFxTr7uBRnk7K
         IXbN+ObLccHqn6swe+IWDLXeEXAiZpEP6vyeKs38BHAsjniwNbR3KODNlTTApo+0fi44
         5wTbaZuH1JTpL73kMvUo0GuetFyp7ApBXgayKZUq+6YBmD3RgckmVCbCGxqqO2vKsvJl
         ZSPR2FUi2EhZblFzu2SkPXSj6nq8e4FXvAiNgDVKCdby8c749B+fPUHYPM9UWKI/7lX/
         iJbu7JZzxUYD9PfWaBPZCOYitKoWBX9EYH3n4I6waXzASTrZ2c2HKp1Y40SlYf5A+z8D
         g+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484874; x=1750089674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fBa/D7ZSdkp1CcirJkKYMOK5Z9MjA4EI8lgY6/+9GI=;
        b=T3dtcODnbKsdxbHvvyVoSBvjOpkQVSTuWI6+BC//plJoxKqKCvB/Z8IQc9yf09orhP
         OYEihfWZFdS9Rvj8W69wrNdz0LmBTEfL8+GnXtG4kZpRR2btxXgluWOmV1+Rhwy+9u+T
         RVGArhSAaQ1Bzx5s/QLrTdcTw2lXGJ0eP2Nvcr/TQm0afjVjQgEcsVbYh6wRPfJtcCwx
         vQ90r6qNlDTWBRC9NPcHV4SG3c7A/A08T2WDRtar5uiO3DM/uriXBV6pSkkBtgPVYPr1
         Jmr1iHWu5UZllXDj23ix8lOV/QIfuLnOPT/FHvhz1Cr2qfl0CE0XFUTC4mpJmRXBJQ2/
         NiDg==
X-Forwarded-Encrypted: i=1; AJvYcCVvZwg6uquBSicyEaJF7Zjxr959q3SnFcUv2dSfr1LxAydPwi/EBZ5DonCoznnrDmvWW9c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvpf0nDRozisdj2OsxSBoL0K8XsJHvcqya83g3ohUPZwDRporS
	+FtRN4ZYYvVo7PDiVq+6OPQ/ET/lR0nLCx3CWfmjy3bRIxCrrm8Ln7vdNmsQ9piQzPBEROgslMJ
	QrDJM36KCfxwQvQ4N4+VrsBqQV44T3ak=
X-Gm-Gg: ASbGncvgik/Ad1YPuzPgSJRyCGJDeGXMziEm0RjvoHsZ4HgVOJXip9rTHL6xDUswefq
	4dOZZ6qW1riZAdNZvcDNlGROHXIbifn9qmrfqrnJ2pvSQ+sc2Wnu024AWhWg07S6ZkDjTc0N09O
	ne+vq3ctq5zHTqJ3Nh8+1FjEqaDi+ghnRsR82VtMUzyQ==
X-Google-Smtp-Source: AGHT+IEIB8zpDCWcvtBAEzi9NFpxDUdLEsuaA1XVK7qwbkI8oYOnzL1Es6VPcyxBlIwHUkvGkUTGO5iDPTFdkAt7y3Y=
X-Received: by 2002:a05:6902:4911:b0:e81:992c:944d with SMTP id
 3f1490d57ef6-e81a214a687mr19372674276.29.1749484874113; Mon, 09 Jun 2025
 09:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250609140643.26270-1-stefano.radaelli21@gmail.com> <aEb5PHawmlhXs0xs@lizhi-Precision-Tower-5810>
In-Reply-To: <aEb5PHawmlhXs0xs@lizhi-Precision-Tower-5810>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Mon, 9 Jun 2025 18:00:56 +0200
X-Gm-Features: AX0GCFvjgcJAA-64XgvWKGj9tzVUxKIm25Rq28d_hMMp4iijhQyDQKRcAqF3GIk
Message-ID: <CAK+owoidpKXje+vbCSKRbHMZfiWUkp9oO=JDfe7UOoYu=jz+tQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mp-var-som: Add EQoS
 support with MaxLinear PHY
To: Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

> +                     reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +                     reset-assert-us = <10000>;
> +                     reset-deassert-us = <100000>;
> +                     vddio-supply = <&reg_phy_vddio>;
> extra empty line here.

Ack, will add the empty line before the leds block.

> +                     at803x,eee-disabled;
> +                     eee-broken-1000t;
> are you sure eee broken? recently we found it wrong copy from fec.

You're absolutely right. I checked the MXL86110 datasheet and it clearly states
that EEE is properly supported for both 100BASE-TX and 1000BASE-T operations.
These properties were indeed copied incorrectly from other configurations.
I'll remove both at803x,eee-disabled and eee-broken-1000t properties in v2.

Thanks for catching this!

Il giorno lun 9 giu 2025 alle ore 17:10 Frank Li <Frank.li@nxp.com> ha scritto:
>
> On Mon, Jun 09, 2025 at 04:06:42PM +0200, Stefano Radaelli wrote:
> > Enable the EQoS Ethernet controller on the i.MX8MP VAR-SOM with the
> > integrated Maxlinear MXL86110 PHY. The PHY is connected to the EQOS
> > MDIO bus at address 4.
> >
> > This patch adds:
> > - EQOS controller configuration with RGMII interface.
> > - Proper reset timings.
> > - PHY power supply regulators.
> > - RGMII pinmux configuration for all data, control and clock signals.
> > - LED configuration for link status indication via the LED subsystem
> >   under /sys/class/leds/, leveraging the support implemented in the.
> >   mxl86110 PHY driver (drivers/net/phy/mxl-86110.c).
> >   Two LEDs are defined to match the LED configuration on the Variscite
> >   VAR-SOM Carrier Boards:
> >     * LED@0: Yellow, netdev trigger.
> >     * LED@1: Green, netdev trigger.
> >
> > The RGMII TX/RX delays are implemented in SOM via PCB passive
> > delays, so no software delay configuration is required.
> >
> > Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
> > ---
> >  .../boot/dts/freescale/imx8mp-var-som.dtsi    | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
> > index b59da91fdd04..3be59692849f 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
> > @@ -55,6 +55,24 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
> >               states = <3300000 0x0 1800000 0x1>;
> >               vin-supply = <&ldo5>;
> >       };
> > +
> > +     reg_phy_supply: regulator-phy-supply {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "phy-supply";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +             regulator-enable-ramp-delay = <20000>;
> > +             gpio = <&gpio2 20 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_phy_vddio: regulator-phy-vddio {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vddio-1v8";
> > +             regulator-min-microvolt = <1800000>;
> > +             regulator-max-microvolt = <1800000>;
> > +     };
> >  };
> >
> >  &A53_0 {
> > @@ -73,6 +91,54 @@ &A53_3 {
> >       cpu-supply = <&buck2>;
> >  };
> >
> > +&eqos {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_eqos>;
> > +     /*
> > +      * The required RGMII TX and RX 2ns delays are implemented directly
> > +      * in hardware via passive delay elements on the SOM PCB.
> > +      * No delay configuration is needed in software via PHY driver.
> > +      */
> > +     phy-mode = "rgmii";
> > +     phy-handle = <&ethphy0>;
> > +     status = "okay";
> > +
> > +     mdio {
> > +             compatible = "snps,dwmac-mdio";
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             ethphy0: ethernet-phy@4 {
> > +                     compatible = "ethernet-phy-ieee802.3-c22";
> > +                     reg = <4>;
> > +                     at803x,eee-disabled;
> > +                     eee-broken-1000t;
>
> are you sure eee broken? recently we found it wrong copy from fec.
>
>
> > +                     reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> > +                     reset-assert-us = <10000>;
> > +                     reset-deassert-us = <100000>;
> > +                     vddio-supply = <&reg_phy_vddio>;
>
> extra empty line here.
>
> Frank
> > +                     leds {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             led@0 {
> > +                                     reg = <0>;
> > +                                     color = <LED_COLOR_ID_YELLOW>;
> > +                                     function = LED_FUNCTION_LAN;
> > +                                     linux,default-trigger = "netdev";
> > +                             };
> > +
> > +                             led@1 {
> > +                                     reg = <1>;
> > +                                     color = <LED_COLOR_ID_GREEN>;
> > +                                     function = LED_FUNCTION_LAN;
> > +                                     linux,default-trigger = "netdev";
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> >  &i2c1 {
> >       clock-frequency = <400000>;
> >       pinctrl-names = "default";
> > @@ -239,6 +305,27 @@ &wdog1 {
> >
> >  &iomuxc {
> >
> > +     pinctrl_eqos: eqosgrp {
> > +             fsl,pins = <
> > +                     MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC                             0x2
> > +                     MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO                           0x2
> > +                     MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0                       0x90
> > +                     MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1                       0x90
> > +                     MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2                       0x90
> > +                     MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3                       0x90
> > +                     MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK       0x90
> > +                     MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL                 0x90
> > +                     MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0                       0x16
> > +                     MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1                       0x16
> > +                     MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2                       0x16
> > +                     MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3                       0x16
> > +                     MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL                 0x16
> > +                     MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK       0x16
> > +                     MX8MP_IOMUXC_SD2_WP__GPIO2_IO20                                 0x10
> > +                     MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10                             0x150
> > +             >;
> > +     };
> > +
> >       pinctrl_i2c1: i2c1grp {
> >               fsl,pins = <
> >                       MX8MP_IOMUXC_SD1_DATA4__I2C1_SCL                                0x400001c2
> >
> > base-commit: e271ed52b344ac02d4581286961d0c40acc54c03
> > prerequisite-patch-id: 2335ebcc90360b008c840e7edf7e34a595880edf
> > --
> > 2.43.0
> >
