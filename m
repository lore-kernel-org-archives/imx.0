Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BBD2BDC2A
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 20:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770150719; cv=pass; b=gxJajHqXiJl13b4TKnpiVajSmlBbcxFR3ThR3aZVnWQonyVppZZJ0TLd7vSFAslFCsYIVgFJF99XZG5sbNbSYHWb4Yr9FkD751P2cHyOg2rQBTwn2Ovtik1bLJdl4kdyJ2wX8juar6JVrthLkrs0cgNl33iMreZDcYQFhL6SvrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770150719; c=relaxed/simple;
	bh=6JY5YQmobWcflbXeloYx8GMFdawrLtZ3rM0je0z+vgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqVYFQLfY0rsxMNUvzcUvV+r67uSIKfHrjQWSOr5mHaJFwvBgyHHg7feBxvILlAdtBwTaHJSzkFeFGA3BvenYs3BJoEO4SB7BcXFZTtgkozuFKJl3kb4AW0Js6DevsMSM/doyg/6EqSvIj2owgLnI97y3sua2dcFlntL5n43vkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=dNPDQMER; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="dNPDQMER"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d15b8feca3so5682547a34.3
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 12:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770150716; cv=none;
        d=google.com; s=arc-20240605;
        b=WJiPjiy+psGfu4Oivlbl0zZEdw2TPKtTyz5ZIt7DyT0ntm/YkPDUXpTngtzaJ6Smye
         cNqBWGtvToMA0uOxSuJxEHFlj0eHf6nGli0wnr2aWF6TfL6ndndXXu8IhVti/kea+4Wq
         SBpUShDWPR8kSliLwYvsLqTX4CAjTzmknF/Bp82nlnANnGTV2HDeRaYoZpB94JCv+Wjs
         PVFcobisngfLcdc5xhFY9x89tys9EAKfHnq7Dg5fJLF1rQCmsYctfFm93HKKrwMhGiF2
         kuyug3Z6vhvres9Kjv5WTC41dN9+ngsI9hnJqeEygskFZo0zWkMNhDLHJyvsJpAfp6NE
         cqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CttTs2kso+hQn7GHK2gtz+9z0ip+70pxKojcVe3oG34=;
        fh=Tm5aeIA+LXDoOQdrMBNDam6pBBsnXt/95BBejwVcYPk=;
        b=Lajwi7fBb77G7msXAVSEkax/eYTjuzUGfAzhovmQ9GC3b6u5+AWjbZDTEpt5pZAxiR
         40YmEwNjHuVxgrSHg1GAt6cGyfgtAYziacqPxsUIAyTgXdRXtCopI7XEJb1MJlLRB5sp
         Cu+UU/Eeqa/sK3wtYqSKpIX9jcj+GWBuxJWlwDRA0lB3lVt5vdLlb9jNWXJLdSlfotkV
         I6gAmN1SjcqD8xvGYVZ61bVQVpioVKlfjoB9gE4D3Du38M3cHMy63VkfkPE6hDfA41H0
         JRq2mn243IzZTd6rpu9Mzto6wAMfjDGCBKwHmInrBVrRNZeYdnbgjXlRpL7qaH6qYmZT
         GLpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1770150716; x=1770755516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CttTs2kso+hQn7GHK2gtz+9z0ip+70pxKojcVe3oG34=;
        b=dNPDQMERSOmSFIBxAONl8bMNjSnxULqlSP7jq0M9CTzi+hMigAToKPaayNtfnpTig2
         tqnLcj53oVwJdysDv/dqEi51F9wvVHd6EEOb2GccMb2JtvvUXi/GBHxLsiB4ptLTvgLs
         AjcmqOULLaFVU/O1M1rKwc3+ZClU0C1CKX9juyujPw+y8lP1KAULOWIbk3SwHHttT01B
         p/7kWlS73ZnnuRJQAdM6rfdqX5+Lrlm2K204AOmdeH37iqVPt0EtqQA9WAPrTq/h95jP
         PNs+Mp/tlRVhcFtFUw7/sCLBHu5VaEzTCWIQbXWFZUewe5665HwpOOh3YFiMUXr1K4jj
         omuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770150716; x=1770755516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CttTs2kso+hQn7GHK2gtz+9z0ip+70pxKojcVe3oG34=;
        b=Q1IjAMWc2lMGtLq3qYn5eLuRlpAFfQzGb8ftlSpAx2ZdHg4UPOlOUi6kTEMa1iV0pq
         lobar95jOtKIL1w6ix5tntL/NSesGrsK/slziG4exmjF9QfCR+w1riH+AKUD4O8dXeGa
         M0SGy/F4RUxDwpK9XzI5l4BO1vDz7QpiHoETfQ9Yz1Dt6Hof8WOw43W9eMCDzphLRY4e
         o01FbMhOf9NB7Dq+PI8YJBJ4BgDAwluhB8dnExSzmTU7bOhisSNjQzHHcFTGaZ15uJ/+
         30+L+vBlHTfqoKtF3rKk6MOcyqCQShBKOPjGF6dBoCv0DcYNxhvDy/uUbF9dzhnhiSuH
         lalg==
X-Forwarded-Encrypted: i=1; AJvYcCWmwh7oK/OQHOUuXBtY0C330uw1LvAf7ZLWmYnVvPxnKSoT9dGnBnLoqvauxavCNwwP8cA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv3x0VsqAEEYZC6IiuFgX5als5zFFt3atjBnzxyJZZ3FHwhGGR
	/D155K/KH6PWLNI5PJNOcIq8Bc4ORomDhny3WT1mJHJTdvk/a0ke6OQmi1OHkoWW6KN+eEcxngK
	tZS/ndyj1Mu95DYDBDVz5Bj7j3F5oEbXIJAuJ/nFOeA==
X-Gm-Gg: AZuq6aJ+ofOtYq+TL0F4ROZcnsWTPauLNn+4szOyhxtuylvyXhYGrQWp/e1BElrO5NJ
	+RG+7qnXSTsxgGa2kfLiplPgBVbiSQoS1kJx1M+vTzzQ2q1M95cI2+//63OzLhVwifHfuhAJ0tB
	fNE7DW3MA/0VXP07hUjhNdbZmLMWTwPsljMa6HS0E8JD/8NkO9hXnPbCy23qXBwFnBEJbXB7af7
	C9mhbo8IqZs3RUPFxfczGGFsoyzw2eXIqayowyuwJV2iwkEpbySvlcn2P5KrzIIJgNxo/JxiwEL
	wjdadg==
X-Received: by 2002:a05:6820:20d:b0:66a:b73:5e2c with SMTP id
 006d021491bc7-66a23cfb687mr430971eaf.77.1770150715478; Tue, 03 Feb 2026
 12:31:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260202181029.1832198-1-tharvey@gateworks.com>
 <20260202181029.1832198-2-tharvey@gateworks.com> <aYD4BwB3McK45vCk@lizhi-Precision-Tower-5810>
 <CAJ+vNU0rwpoedAvPH5whLSXKHXX+jbsnAy1hKx_0To8KoMqBvA@mail.gmail.com> <aYJOQ42Scp5jAjzR@lizhi-Precision-Tower-5810>
In-Reply-To: <aYJOQ42Scp5jAjzR@lizhi-Precision-Tower-5810>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 3 Feb 2026 12:31:42 -0800
X-Gm-Features: AZwV_QgOGPpO3NSGOVWFQ-Ur1yAZpWg6tChZll09Aj71H1u2DIHSXiWonvdnktU
Message-ID: <CAJ+vNU2toxmJGQX=PNxc3U2w5fHNhRmw2vTe8LM_ksarPixXzA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx: Add i.mx8mm Gateworks GW7906 dts support
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 11:36=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
> <snip>
> > > > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/bo=
ot/dts/freescale/Makefile
> > > > index 700bab4d3e60..83fc7faf81d8 100644
> > > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > > @@ -167,6 +167,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw790=
1.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw7902.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw7903.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw7904.dtb
> > > > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw7906.dtb
> > >
> > > Please run https://github.com/lznuaa/dt-format for new dts to keep ni=
ce
> > > node order,
> > >
> > > If output result is not good enough, let know
> >
> > I notice you asking people to do this but is that tool robust? Every
> > dts I through at it crashes:
> >
> > $ git clone https://github.com/lznuaa/dt-format.git
> > $ cd dt-format
> > $ make
> > $ ./dt-format ~/linux-6.18/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> > Segmentation fault (core dumped)
>
> which version imx8mm-evk.dts? It works at my side.
>

Every version I've tried crashes. It crashes for me on v6.18 of
arch/arm64/boot/dts/freescale/imx8mm-evk.dts. See
https://github.com/lznuaa/dt-format/issues/4 - reverting the latest
patch resolves the issue.

Is using dt-format really a requirement? If this is a requirement it
should probably be picked up and integrated into the dtc somehow or at
least properly maintained? There are issues reported that appear very
valid to me that have not been addressed in 7 months time among them
being the fact it crashes on most dts and some of the ordering rules
that have not been the norm:
https://github.com/lznuaa/dt-format/issues

I welcome a tool that helps streamline the dts process but this tool
appears to need some work.

Best Regards,

Tim

> Frank
>
> >
> > Best Regards,
> >
> > Tim
> >
> > >
> > > Frank
> > >
> > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-nonwifi-dahlia.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-nonwifi-dev.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-nonwifi-ivy.dtb
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts=
 b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> > > > new file mode 100644
> > > > index 000000000000..ec146a2b7549
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> > > > @@ -0,0 +1,869 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +/*
> > > > + * Copyright 2026 Gateworks Corporation
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +
> > > > +#include <dt-bindings/gpio/gpio.h>
> > > > +#include <dt-bindings/input/linux-event-codes.h>
> > > > +#include <dt-bindings/leds/common.h>
> > > > +#include <dt-bindings/net/ti-dp83867.h>
> > > > +#include <dt-bindings/phy/phy-imx8-pcie.h>
> > > > +
> > > > +#include "imx8mm.dtsi"
> > > > +
> > > > +/ {
> > > > +     model =3D "Gateworks Venice GW7906 i.MX8MM board";
> > > > +     compatible =3D "gateworks,imx8mm-gw7906", "fsl,imx8mm";
> > > > +
> > > > +     aliases {
> > > > +             ethernet0 =3D &fec1;
> > > > +             rtc0 =3D &gsc_rtc;
> > > > +             rtc1 =3D &snvs_rtc;
> > > > +             usb0 =3D &usbotg1;
> > > > +     };
> > > > +
> > > > +     chosen {
> > > > +             stdout-path =3D &uart2;
> > > > +     };
> > > > +
> > > > +     memory@40000000 {
> > > > +             device_type =3D "memory";
> > > > +             reg =3D <0x0 0x40000000 0 0x80000000>;
> > > > +     };
> > > > +
> > > > +     gpio-keys {
> > > > +             compatible =3D "gpio-keys";
> > > > +
> > > > +             key-user-pb {
> > > > +                     label =3D "user_pb";
> > > > +                     gpios =3D <&gpio 2 GPIO_ACTIVE_LOW>;
> > > > +                     linux,code =3D <BTN_0>;
> > > > +             };
> > > > +
> > > > +             key-user-pb1x {
> > > > +                     label =3D "user_pb1x";
> > > > +                     linux,code =3D <BTN_1>;
> > > > +                     interrupt-parent =3D <&gsc>;
> > > > +                     interrupts =3D <0>;
> > > > +             };
> > > > +
> > > > +             key-erased {
> > > > +                     label =3D "key_erased";
> > > > +                     linux,code =3D <BTN_2>;
> > > > +                     interrupt-parent =3D <&gsc>;
> > > > +                     interrupts =3D <1>;
> > > > +             };
> > > > +
> > > > +             key-eeprom-wp {
> > > > +                     label =3D "eeprom_wp";
> > > > +                     linux,code =3D <BTN_3>;
> > > > +                     interrupt-parent =3D <&gsc>;
> > > > +                     interrupts =3D <2>;
> > > > +             };
> > > > +
> > > > +             switch-hold {
> > > > +                     label =3D "switch_hold";
> > > > +                     linux,code =3D <BTN_5>;
> > > > +                     interrupt-parent =3D <&gsc>;
> > > > +                     interrupts =3D <7>;
> > > > +             };
> > > > +     };
> > > > +
> > > > +     led-controller {
> > > > +             compatible =3D "gpio-leds";
> > > > +             pinctrl-names =3D "default";
> > > > +             pinctrl-0 =3D <&pinctrl_gpio_leds>;
> > > > +
> > > > +             led-0 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_RED>;
> > > > +                     label =3D "led01_red";
> > > > +                     gpios =3D <&gpio5 5 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-1 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_GREEN>;
> > > > +                     label =3D "led01_grn";
> > > > +                     gpios =3D <&gpio4 30 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-2 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_RED>;
> > > > +                     label =3D "led02_red";
> > > > +                     gpios =3D <&gpio5 2 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-3 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_GREEN>;
> > > > +                     label =3D "led02_grn";
> > > > +                     gpios =3D <&gpio1 14 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-4 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_RED>;
> > > > +                     label =3D "led03_red";
> > > > +                     gpios =3D <&gpio1 9 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-5 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_GREEN>;
> > > > +                     label =3D "led03_grn";
> > > > +                     gpios =3D <&gpio5 3 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-6 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_RED>;
> > > > +                     label =3D "led04_red";
> > > > +                     gpios =3D <&gpio4 29 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-7 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_GREEN>;
> > > > +                     label =3D "led04_grn";
> > > > +                     gpios =3D <&gpio4 28 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-8 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_RED>;
> > > > +                     label =3D "led05_red";
> > > > +                     gpios =3D <&gpio1 13 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-9 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_GREEN>;
> > > > +                     label =3D "led05_grn";
> > > > +                     gpios =3D <&gpio4 31 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-a {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_RED>;
> > > > +                     label =3D "led06_red";
> > > > +                     gpios =3D <&gpio5 4 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-b {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_GREEN>;
> > > > +                     label =3D "led06_grn";
> > > > +                     gpios =3D <&gpio1 8 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +     };
> > > > +
> > > > +     pcie0_refclk: pcie0-refclk {
> > > > +             compatible =3D "fixed-clock";
> > > > +             #clock-cells =3D <0>;
> > > > +             clock-frequency =3D <100000000>;
> > > > +     };
> > > > +
> > > > +     reg_3p3v: regulator-3p3v {
> > > > +             compatible =3D "regulator-fixed";
> > > > +             regulator-name =3D "3P3V";
> > > > +             regulator-min-microvolt =3D <3300000>;
> > > > +             regulator-max-microvolt =3D <3300000>;
> > > > +             regulator-always-on;
> > > > +     };
> > > > +};
> > > > +
> > > > +&A53_0 {
> > > > +     cpu-supply =3D <&buck2>;
> > > > +};
> > > > +
> > > > +&A53_1 {
> > > > +     cpu-supply =3D <&buck2>;
> > > > +};
> > > > +
> > > > +&A53_2 {
> > > > +     cpu-supply =3D <&buck2>;
> > > > +};
> > > > +
> > > > +&A53_3 {
> > > > +     cpu-supply =3D <&buck2>;
> > > > +};
> > > > +
> > > > +&ddrc {
> > > > +     operating-points-v2 =3D <&ddrc_opp_table>;
> > > > +
> > > > +     ddrc_opp_table: opp-table {
> > > > +             compatible =3D "operating-points-v2";
> > > > +
> > > > +             opp-25000000 {
> > > > +                     opp-hz =3D /bits/ 64 <25000000>;
> > > > +             };
> > > > +
> > > > +             opp-100000000 {
> > > > +                     opp-hz =3D /bits/ 64 <100000000>;
> > > > +             };
> > > > +
> > > > +             opp-750000000 {
> > > > +                     opp-hz =3D /bits/ 64 <750000000>;
> > > > +             };
> > > > +     };
> > > > +};
> > > > +
> > > > +&fec1 {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&pinctrl_fec1>;
> > > > +     phy-mode =3D "rgmii-id";
> > > > +     phy-handle =3D <&ethphy0>;
> > > > +     local-mac-address =3D [00 00 00 00 00 00];
> > > > +     status =3D "okay";
> > > > +
> > > > +     mdio {
> > > > +             #address-cells =3D <1>;
> > > > +             #size-cells =3D <0>;
> > > > +
> > > > +             ethphy0: ethernet-phy@0 {
> > > > +                     compatible =3D "ethernet-phy-ieee802.3-c22";
> > > > +                     reg =3D <0>;
> > > > +                     ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>=
;
> > > > +                     ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2=
_00_NS>;
> > > > +                     ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2=
_00_NS>;
> > > > +                     tx-fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4=
_B_NIB>;
> > > > +                     rx-fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4=
_B_NIB>;
> > > > +
> > > > +                     leds {
> > > > +                             #address-cells =3D <1>;
> > > > +                             #size-cells =3D <0>;
> > > > +
> > > > +                             led@1 {
> > > > +                                     reg =3D <1>;
> > > > +                                     color =3D <LED_COLOR_ID_AMBER=
>;
> > > > +                                     function =3D LED_FUNCTION_LAN=
;
> > > > +                                     default-state =3D "keep";
> > > > +                             };
> > > > +
> > > > +                             led@2 {
> > > > +                                     reg =3D <2>;
> > > > +                                     color =3D <LED_COLOR_ID_GREEN=
>;
> > > > +                                     function =3D LED_FUNCTION_LAN=
;
> > > > +                                     default-state =3D "keep";
> > > > +                             };
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +};
> > > > +
> > > > +&gpio1 {
> > > > +     gpio-line-names =3D "", "", "", "", "", "", "", "",
> > > > +             "", "", "rs422_en#", "rs485_en#", "rs232_en#", "", ""=
, "",
> > > > +             "", "", "", "", "", "", "", "",
> > > > +             "", "", "", "", "", "", "", "";
> > > > +};
> > > > +
> > > > +&gpio2 {
> > > > +     gpio-line-names =3D "", "", "", "", "", "", "dig1_ctl", "",
> > > > +             "dig1_out#", "dig1_in", "", "", "", "", "", "",
> > > > +             "", "", "", "", "", "", "", "",
> > > > +             "", "", "", "", "", "", "", "";
> > > > +};
> > > > +
> > > > +&gpio5 {
> > > > +     gpio-line-names =3D "", "", "", "", "", "", "", "",
> > > > +             "", "", "", "", "pci_wdis#", "", "", "",
> > > > +             "", "", "", "", "", "", "", "",
> > > > +             "", "", "", "", "", "", "", "";
> > > > +};
> > > > +
> > > > +&i2c1 {
> > > > +     clock-frequency =3D <100000>;
> > > > +     pinctrl-names =3D "default", "gpio";
> > > > +     pinctrl-0 =3D <&pinctrl_i2c1>;
> > > > +     pinctrl-1 =3D <&pinctrl_i2c1_gpio>;
> > > > +     scl-gpios =3D <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
> > > > +     sda-gpios =3D <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
> > > > +     status =3D "okay";
> > > > +
> > > > +     gsc: gsc@20 {
> > > > +             compatible =3D "gw,gsc";
> > > > +             reg =3D <0x20>;
> > > > +             pinctrl-0 =3D <&pinctrl_gsc>;
> > > > +             interrupt-parent =3D <&gpio4>;
> > > > +             interrupts =3D <26 IRQ_TYPE_EDGE_FALLING>;
> > > > +             interrupt-controller;
> > > > +             #interrupt-cells =3D <1>;
> > > > +             #address-cells =3D <1>;
> > > > +             #size-cells =3D <0>;
> > > > +
> > > > +             adc {
> > > > +                     compatible =3D "gw,gsc-adc";
> > > > +                     #address-cells =3D <1>;
> > > > +                     #size-cells =3D <0>;
> > > > +
> > > > +                     channel@6 {
> > > > +                             gw,mode =3D <0>;
> > > > +                             reg =3D <0x06>;
> > > > +                             label =3D "temp";
> > > > +                     };
> > > > +
> > > > +                     channel@8 {
> > > > +                             gw,mode =3D <3>;
> > > > +                             reg =3D <0x08>;
> > > > +                             label =3D "vdd_bat";
> > > > +                     };
> > > > +
> > > > +                     channel@82 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x82>;
> > > > +                             label =3D "vin";
> > > > +                             gw,voltage-divider-ohms =3D <22100 10=
00>;
> > > > +                             gw,voltage-offset-microvolt =3D <7000=
00>;
> > > > +                     };
> > > > +
> > > > +                     channel@84 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x84>;
> > > > +                             label =3D "vdd_5p0";
> > > > +                             gw,voltage-divider-ohms =3D <10000 10=
000>;
> > > > +                     };
> > > > +
> > > > +                     channel@86 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x86>;
> > > > +                             label =3D "vdd_3p3";
> > > > +                             gw,voltage-divider-ohms =3D <10000 10=
000>;
> > > > +                     };
> > > > +
> > > > +                     channel@88 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x88>;
> > > > +                             label =3D "vdd_0p9";
> > > > +                     };
> > > > +
> > > > +                     channel@8c {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x8c>;
> > > > +                             label =3D "vdd_soc";
> > > > +                     };
> > > > +
> > > > +                     channel@8e {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x8e>;
> > > > +                             label =3D "vdd_arm";
> > > > +                     };
> > > > +
> > > > +                     channel@90 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x90>;
> > > > +                             label =3D "vdd_1p8";
> > > > +                     };
> > > > +
> > > > +                     channel@92 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x92>;
> > > > +                             label =3D "vdd_dram";
> > > > +                     };
> > > > +
> > > > +                     channel@a2 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0xa2>;
> > > > +                             label =3D "vdd_gsc";
> > > > +                             gw,voltage-divider-ohms =3D <10000 10=
000>;
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +
> > > > +     gpio: gpio@23 {
> > > > +             compatible =3D "nxp,pca9555";
> > > > +             reg =3D <0x23>;
> > > > +             gpio-controller;
> > > > +             #gpio-cells =3D <2>;
> > > > +             interrupt-parent =3D <&gsc>;
> > > > +             interrupts =3D <4>;
> > > > +     };
> > > > +
> > > > +     eeprom@50 {
> > > > +             compatible =3D "atmel,24c02";
> > > > +             reg =3D <0x50>;
> > > > +             pagesize =3D <16>;
> > > > +     };
> > > > +
> > > > +     eeprom@51 {
> > > > +             compatible =3D "atmel,24c02";
> > > > +             reg =3D <0x51>;
> > > > +             pagesize =3D <16>;
> > > > +     };
> > > > +
> > > > +     eeprom@52 {
> > > > +             compatible =3D "atmel,24c02";
> > > > +             reg =3D <0x52>;
> > > > +             pagesize =3D <16>;
> > > > +     };
> > > > +
> > > > +     eeprom@53 {
> > > > +             compatible =3D "atmel,24c02";
> > > > +             reg =3D <0x53>;
> > > > +             pagesize =3D <16>;
> > > > +     };
> > > > +
> > > > +     gsc_rtc: rtc@68 {
> > > > +             compatible =3D "dallas,ds1672";
> > > > +             reg =3D <0x68>;
> > > > +     };
> > > > +};
> > > > +
> > > > +&i2c2 {
> > > > +     clock-frequency =3D <400000>;
> > > > +     pinctrl-names =3D "default", "gpio";
> > > > +     pinctrl-0 =3D <&pinctrl_i2c2>;
> > > > +     pinctrl-1 =3D <&pinctrl_i2c2_gpio>;
> > > > +     scl-gpios =3D <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
> > > > +     sda-gpios =3D <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
> > > > +     status =3D "okay";
> > > > +
> > > > +     pmic@4b {
> > > > +             compatible =3D "rohm,bd71847";
> > > > +             reg =3D <0x4b>;
> > > > +             pinctrl-names =3D "default";
> > > > +             pinctrl-0 =3D <&pinctrl_pmic>;
> > > > +             interrupt-parent =3D <&gpio3>;
> > > > +             interrupts =3D <8 IRQ_TYPE_LEVEL_LOW>;
> > > > +             rohm,reset-snvs-powered;
> > > > +             #clock-cells =3D <0>;
> > > > +             clocks =3D <&osc_32k>;
> > > > +             clock-output-names =3D "clk-32k-out";
> > > > +
> > > > +             regulators {
> > > > +                     /* vdd_soc: 0.805-0.900V (typ=3D0.8V) */
> > > > +                     BUCK1 {
> > > > +                             regulator-name =3D "buck1";
> > > > +                             regulator-min-microvolt =3D <700000>;
> > > > +                             regulator-max-microvolt =3D <1300000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                             regulator-ramp-delay =3D <1250>;
> > > > +                     };
> > > > +
> > > > +                     /* vdd_arm: 0.805-1.0V (typ=3D0.9V) */
> > > > +                     buck2: BUCK2 {
> > > > +                             regulator-name =3D "buck2";
> > > > +                             regulator-min-microvolt =3D <700000>;
> > > > +                             regulator-max-microvolt =3D <1300000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                             regulator-ramp-delay =3D <1250>;
> > > > +                             rohm,dvs-run-voltage =3D <1000000>;
> > > > +                             rohm,dvs-idle-voltage =3D <900000>;
> > > > +                     };
> > > > +
> > > > +                     /* vdd_0p9: 0.805-1.0V (typ=3D0.9V) */
> > > > +                     BUCK3 {
> > > > +                             regulator-name =3D "buck3";
> > > > +                             regulator-min-microvolt =3D <700000>;
> > > > +                             regulator-max-microvolt =3D <1350000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     /* vdd_3p3 */
> > > > +                     BUCK4 {
> > > > +                             regulator-name =3D "buck4";
> > > > +                             regulator-min-microvolt =3D <3000000>=
;
> > > > +                             regulator-max-microvolt =3D <3300000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     /* vdd_1p8 */
> > > > +                     BUCK5 {
> > > > +                             regulator-name =3D "buck5";
> > > > +                             regulator-min-microvolt =3D <1605000>=
;
> > > > +                             regulator-max-microvolt =3D <1995000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     /* vdd_dram */
> > > > +                     BUCK6 {
> > > > +                             regulator-name =3D "buck6";
> > > > +                             regulator-min-microvolt =3D <800000>;
> > > > +                             regulator-max-microvolt =3D <1400000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     /* nvcc_snvs_1p8 */
> > > > +                     LDO1 {
> > > > +                             regulator-name =3D "ldo1";
> > > > +                             regulator-min-microvolt =3D <1600000>=
;
> > > > +                             regulator-max-microvolt =3D <1900000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     /* vdd_snvs_0p8 */
> > > > +                     LDO2 {
> > > > +                             regulator-name =3D "ldo2";
> > > > +                             regulator-min-microvolt =3D <800000>;
> > > > +                             regulator-max-microvolt =3D <900000>;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     /* vdda_1p8 */
> > > > +                     LDO3 {
> > > > +                             regulator-name =3D "ldo3";
> > > > +                             regulator-min-microvolt =3D <1800000>=
;
> > > > +                             regulator-max-microvolt =3D <3300000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     LDO4 {
> > > > +                             regulator-name =3D "ldo4";
> > > > +                             regulator-min-microvolt =3D <900000>;
> > > > +                             regulator-max-microvolt =3D <1800000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     LDO6 {
> > > > +                             regulator-name =3D "ldo6";
> > > > +                             regulator-min-microvolt =3D <900000>;
> > > > +                             regulator-max-microvolt =3D <1800000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +};
> > > > +
> > > > +&i2c3 {
> > > > +     clock-frequency =3D <400000>;
> > > > +     pinctrl-names =3D "default", "gpio";
> > > > +     pinctrl-0 =3D <&pinctrl_i2c3>;
> > > > +     pinctrl-1 =3D <&pinctrl_i2c3_gpio>;
> > > > +     scl-gpios =3D <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
> > > > +     sda-gpios =3D <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
> > > > +     status =3D "okay";
> > > > +
> > > > +     accelerometer@19 {
> > > > +             pinctrl-names =3D "default";
> > > > +             pinctrl-0 =3D <&pinctrl_accel>;
> > > > +             compatible =3D "st,lis2de12";
> > > > +             reg =3D <0x19>;
> > > > +             st,drdy-int-pin =3D <1>;
> > > > +             interrupt-parent =3D <&gpio1>;
> > > > +             interrupts =3D <15 IRQ_TYPE_LEVEL_LOW>;
> > > > +     };
> > > > +};
> > > > +
> > > > +&pcie_phy {
> > > > +     fsl,refclk-pad-mode =3D <IMX8_PCIE_REFCLK_PAD_INPUT>;
> > > > +     fsl,clkreq-unsupported;
> > > > +     clocks =3D <&pcie0_refclk>;
> > > > +     clock-names =3D "ref";
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&pcie0 {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&pinctrl_pcie0>;
> > > > +     reset-gpio =3D <&gpio5 11 GPIO_ACTIVE_LOW>;
> > > > +     clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
> > > > +              <&clk IMX8MM_CLK_PCIE1_AUX>;
> > > > +     assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> > > > +                       <&clk IMX8MM_CLK_PCIE1_CTRL>;
> > > > +     assigned-clock-rates =3D <10000000>, <250000000>;
> > > > +     assigned-clock-parents =3D <&clk IMX8MM_SYS_PLL2_50M>,
> > > > +                              <&clk IMX8MM_SYS_PLL2_250M>;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&disp_blk_ctrl {
> > > > +     status =3D "disabled";
> > > > +};
> > > > +
> > > > +&pgc_mipi {
> > > > +     status =3D "disabled";
> > > > +};
> > > > +
> > > > +/* console */
> > > > +&uart2 {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&pinctrl_uart2>;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&usbotg1 {
> > > > +     dr_mode =3D "host";
> > > > +     disable-over-current;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +/* microSD */
> > > > +&usdhc2 {
> > > > +     pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> > > > +     pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > > > +     pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio=
>;
> > > > +     pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio=
>;
> > > > +     cd-gpios =3D <&gpio2 12 GPIO_ACTIVE_LOW>;
> > > > +     bus-width =3D <4>;
> > > > +     vmmc-supply =3D <&reg_3p3v>;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +/* eMMC */
> > > > +&usdhc3 {
> > > > +     pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> > > > +     pinctrl-0 =3D <&pinctrl_usdhc3>;
> > > > +     pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
> > > > +     pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> > > > +     assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> > > > +     assigned-clock-rates =3D <400000000>;
> > > > +     bus-width =3D <8>;
> > > > +     non-removable;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&wdog1 {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&pinctrl_wdog>;
> > > > +     fsl,ext-reset-output;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&iomuxc {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&pinctrl_hog>;
> > > > +
> > > > +     pinctrl_hog: hoggrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10      0x400=
00041 /* RS422# */
> > > > +                     MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11      0x400=
00041 /* RS485# */
> > > > +                     MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12      0x400=
00041 /* RS232# */
> > > > +                     MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9        0x400=
00041 /* DIG1_IN */
> > > > +                     MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8        0x400=
00041 /* DIG1_OUT */
> > > > +                     MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6        0x400=
00041 /* DIG1_CTL */
> > > > +                     MX8MM_IOMUXC_ECSPI2_MISO_GPIO5_IO12     0x400=
00041 /* PCI_WDIS# */
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_accel: accelgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15      0x159
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_fec1: fec1grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_ENET_MDC_ENET1_MDC              =
   0x3
> > > > +                     MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO            =
   0x3
> > > > +                     MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3        =
   0x1f
> > > > +                     MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2        =
   0x1f
> > > > +                     MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1        =
   0x1f
> > > > +                     MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0        =
   0x1f
> > > > +                     MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3        =
   0x91
> > > > +                     MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2        =
   0x91
> > > > +                     MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1        =
   0x91
> > > > +                     MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0        =
   0x91
> > > > +                     MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC        =
   0x0
> > > > +                     MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC        =
   0x91
> > > > +                     MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL  =
   0x91
> > > > +                     MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL  =
   0x1f
> > > > +                     MX8MM_IOMUXC_SAI2_TXFS_GPIO4_IO24            =
   0x19 /* IRQ# */
> > > > +                     MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25             =
   0x19 /* RST# */
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_gsc: gscgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26       0x159
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_i2c1: i2c1grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL          0x400=
001c3
> > > > +                     MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA          0x400=
001c3
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_i2c1_gpio: i2c1gpiogrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_I2C1_SCL_GPIO5_IO14        0x400=
001c3
> > > > +                     MX8MM_IOMUXC_I2C1_SDA_GPIO5_IO15        0x400=
001c3
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_i2c2: i2c2grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL          0x400=
001c3
> > > > +                     MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA          0x400=
001c3
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_i2c2_gpio: i2c2gpiogrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_I2C2_SCL_GPIO5_IO16        0x400=
001c3
> > > > +                     MX8MM_IOMUXC_I2C2_SDA_GPIO5_IO17        0x400=
001c3
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_i2c3: i2c3grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL          0x400=
001c3
> > > > +                     MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA          0x400=
001c3
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_i2c3_gpio: i2c3gpiogrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18        0x400=
001c3
> > > > +                     MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19        0x400=
001c3
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_gpio_leds: gpioledgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5    0x19
> > > > +                     MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30        0x19
> > > > +                     MX8MM_IOMUXC_SAI3_MCLK_GPIO5_IO2        0x19
> > > > +                     MX8MM_IOMUXC_GPIO1_IO14_GPIO1_IO14      0x19
> > > > +                     MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9       0x19
> > > > +                     MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3         0x19
> > > > +                     MX8MM_IOMUXC_SAI3_RXC_GPIO4_IO29        0x19
> > > > +                     MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28       0x19
> > > > +                     MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13      0x19
> > > > +                     MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31       0x19
> > > > +                     MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4         0x19
> > > > +                     MX8MM_IOMUXC_GPIO1_IO08_GPIO1_IO8       0x19
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_pcie0: pciegrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_ECSPI2_MOSI_GPIO5_IO11     0x41
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_pmic: pmicgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_NAND_DATA02_GPIO3_IO8      0x41
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_uart2: uart2grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX     0x140
> > > > +                     MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX     0x140
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc2: usdhc2grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x190
> > > > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d0
> > > > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d0
> > > > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d0
> > > > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d0
> > > > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d0
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x194
> > > > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d4
> > > > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d4
> > > > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d4
> > > > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d4
> > > > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d4
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x196
> > > > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d6
> > > > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d6
> > > > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d6
> > > > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d6
> > > > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d6
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12        0x1c4
> > > > +                     MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT  0x1d0
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc3: usdhc3grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x190
> > > > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x190
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x194
> > > > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x194
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x196
> > > > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x196
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_wdog: wdoggrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B    0xc6
> > > > +             >;
> > > > +     };
> > > > +};
> > > > --
> > > > 2.25.1
> > > >
