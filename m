Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778922;
	b=rJR84yVi7QjW6pKfp71apJI1QEF0cDMmRkemRvT7/ibd4SjIEfTODdRBQeTPQtXP6EPt
	 qTzXWmO7L3VPxM7tiv4Bt7SBlMFRMAUoRzUH2emU2++HdQ6OP9RyvUry3fEjgimuItr5Z
	 aaP6WWlL8peeKvx7qDyg8OuSKNlhr30KDEf628WLXEBhzy1KgucPydgxRdYOCAgz+eCAc
	 I9rtYr28fexQGzIOwN0E6NPWb8G02g7wZtiqPsdnFZuLwnMFc1mKOGnPbxrKdhoTgXeFP
	 2udH8QBm9GGy6HFhkHVhQss4EfD+RBDjB9ykXLPZPrmXwf1q+fPq4Gk3wo5eSKB+Qmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778922;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BiD2iT1S2BZCzUM56UymswLPef8+m8/elGiVUqIMfAI=;
	b=RNKzVKztnnkyoyCgFS+SiOHR+VcNV/b0JHMWtix4hhbROxOmkiDq5k/3tX6w6HK3acAV
	 Jrr+eY+rmOZBBkL9frhafIBj4v3rI8b2Km4DfgmGRRIoRztY5ZqNuzdsW5hN2eUkt44u2
	 6KmT74H0uywO4QnPCgBEZc+Ceh0dGHgonpeNhARApMbF9ph+WD+sIxRifQuxxLvk84Igr
	 ulJxjVzG3OcbG0JTjH1yCly6u38xYfwveJo/74IlVAxo23OpkhIAH9L/356HzkeEuCV31
	 CBvZjIrKp0QZsMOm6ZogndkLerqlDk8ICyZmHeru+Hmdh93MBt5M/Bsh+P4j2K1RHjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dQPnSbAt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5346606A328;
	Wed,  4 Nov 2026 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dQPnSbAt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A5C1F000C1;
	Wed,  4 Nov 2026 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793778921;
	bh=BiD2iT1S2BZCzUM56UymswLPef8+m8/elGiVUqIMfAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dQPnSbAtr1l/W9UeGda/hGa2++Wupsy4e7JPfhpA9Ok7js1S1vdFdRV3lB1QbJo6A
	 b+5uT7CS99HHuk1Hqa+SkFDtP4oqv7lRII+K8DBYw2gOf9TjWbCi9czmpdxEmHbekx
	 9K3l5M8zbojQ7qtpile4M+lb10FXGydS1kYhKIzYbsc0bLSyBA+0cNX3Wht0vmgcJN
	 uMubAfgaaOETv0Xg+cRmW5oFuKYoSBE+Eb4l1zHjb2i7Rj1CNNbHgGQEDWd+CzGxiV
	 NWRLhQyGIILylaHW0O7VoxLbMVQotPfDFCY6Z2QNLeSdrr78eAyXrc5lC17tdayP8Z
	 5/UJwhh8ueO3w==
Message-ID: <sashiko-outbox-196840@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/10] ARM: dts: imx6ulz: Add SPI display and touch
 overlay for BSH SMM-M2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haoning Cheng" <Haoning.CHENG@cn.bosch.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261104-add-bsh-smm-m2-v1-10-369f0a77e021@cn.bosch.com>
References: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
 <20261104-add-bsh-smm-m2-v1-10-369f0a77e021@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:55:20 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ARM: dts: imx6ulz: active-high pendown-gpio breaks ads7846 touch
- [Medium] ARM: dts: imx6ulz: backlight pad mux placed on display@0 instead=
 of backlight
- [Low] ARM: dts: imx6ulz: open-coded fragment and __overlay__ nodes in ove=
rlay
--

commit bebf64c08aefd84526e08136a534cf0657beb477
Author: Simon Holesch <simon.holesch@bshg.com>

ARM: dts: imx6ulz: Add SPI display and touch overlay for BSH SMM-M2

This commit adds a Devicetree overlay for an SPI-connected ILI9486 display
and ADS7846 touchscreen on the BSH SMM-M2 board.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-ws13506-ads7846=
.dtso b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-ws13506-ads7846.dtso
> new file mode 100644
> index 0000000000000..869443dd648e8
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-ws13506-ads7846.dtso
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: (GPL-2.0+)
> +/*
> + * Copyright 2024 BSH Hausgeraete GmbH
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "imx6ul-pinfunc.h"
> +
> +/ {
> +	fragment@0 {
> +		target-path =3D "/";
> +		__overlay__ {

[Severity: Low]
This isn't a bug, but could this overlay use the standard DTC target
reference syntax (&{/}, &ecspi1, and &iomuxc) rather than open-coding
fragment@0, fragment@1, fragment@2 and __overlay__ nodes, matching
Documentation/devicetree/overlay-notes.rst and other .dtso files in
arch/arm/boot/dts/?

> +			backlight: backlight {
> +				compatible =3D "gpio-backlight";
> +				gpios =3D <&gpio3 21 GPIO_ACTIVE_HIGH>;
> +			};
> +		};
> +	};
> +
> +	fragment@1 {
> +		target =3D <&ecspi1>;
> +		__overlay__ {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_ecspi1>;
> +			cs-gpios =3D <&gpio3 26 GPIO_ACTIVE_LOW>,
> +				<&gpio2 15 GPIO_ACTIVE_LOW>;
> +			status =3D "okay";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			display@0 {
> +				compatible =3D "waveshare,rpi-lcd-35", "ilitek,ili9486";
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&pinctrl_lcd>;
> +				reg =3D <0>;
> +				spi-max-frequency =3D <32000000>;
> +				dc-gpios =3D <&gpio1 31 GPIO_ACTIVE_HIGH>;
> +				reset-gpios =3D <&gpio3 6 GPIO_ACTIVE_HIGH>;
> +				backlight =3D <&backlight>;
> +				rotation =3D <180>;
> +			};
> +
> +			touchscreen@1 {
> +				compatible =3D "ti,ads7846";
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&pinctrl_touchscreen>;
> +				reg =3D <1>;
> +				interrupt-parent =3D <&gpio3>;
> +				interrupts =3D <18 IRQ_TYPE_EDGE_FALLING>;
> +				pendown-gpio =3D <&gpio3 18 GPIO_ACTIVE_HIGH>;

[Severity: High]
Should pendown-gpio in touchscreen@1 use GPIO_ACTIVE_LOW instead of
GPIO_ACTIVE_HIGH?

The ADS7846 PENIRQ line is active-low (pulled low when touched), which
matches the 100k pull-up in pinctrl_touchscreen (0x1b0b0) and
IRQ_TYPE_EDGE_FALLING.

In drivers/input/touchscreen/ads7846.c, ads7846_setup_pendown() requests
the descriptor via devm_gpiod_get(&spi->dev, "pendown", GPIOD_IN), and
get_pendown_state() calls gpiod_get_value(), which applies the Devicetree
polarity flag:

drivers/input/touchscreen/ads7846.c:get_pendown_state() {
	if (ts->get_pendown_state)
		return ts->get_pendown_state();

	return gpiod_get_value(ts->gpio_pendown);
}

drivers/input/touchscreen/ads7846.c:ads7846_hard_irq() {
	struct ads7846 *ts =3D handle;

	return get_pendown_state(ts) ? IRQ_WAKE_THREAD : IRQ_HANDLED;
}

With GPIO_ACTIVE_HIGH, gpiod_get_value() returns 0 while GPIO3_IO18 is
physically asserted low on touch, causing ads7846_hard_irq() to return
IRQ_HANDLED without waking the threaded IRQ handler ads7846_irq().

[ ... ]

> +	fragment@2 {
> +		target =3D <&iomuxc>;
> +		__overlay__ {
> +			pinctrl_ecspi1: ecspi1grp {
> +				fsl,pins =3D <
> +					MX6UL_PAD_LCD_DATA20__ECSPI1_SCLK    0x100b1
> +					MX6UL_PAD_LCD_DATA22__ECSPI1_MOSI    0x100b1
> +					MX6UL_PAD_LCD_DATA23__ECSPI1_MISO    0x100b1
> +					MX6UL_PAD_LCD_DATA21__GPIO3_IO26     0x0b0b1     /* SPI CS.0 */
> +					MX6UL_PAD_ENET2_RX_ER__GPIO2_IO15    0x0b0b1     /* SPI CS.1 */
> +				>;
> +			};
> +
> +			pinctrl_lcd: lcdgrp {
> +				fsl,pins =3D <
> +					MX6UL_PAD_LCD_DATA01__GPIO3_IO06       0x180b1     /* LCD_RST */
> +					MX6UL_PAD_UART5_RX_DATA__GPIO1_IO31    0x180b1     /* LCD_DC */
> +					MX6UL_PAD_LCD_DATA16__GPIO3_IO21       0x180b1     /* backlight */
> +				>;
> +			};

[Severity: Medium]
Should MX6UL_PAD_LCD_DATA16__GPIO3_IO21 be moved into its own pinctrl group
and referenced via pinctrl-0 on the backlight node rather than on display@0?

In drivers/gpu/drm/tiny/ili9486.c, ili9486_probe() calls
devm_of_find_backlight(dev) and defers with -EPROBE_DEFER until the
backlight device has finished probing. On i.MX6UL, imx_pmx_ops in
drivers/pinctrl/freescale/pinctrl-imx.c does not implement
.gpio_request_enable, so requesting GPIO3_IO21 in gpio_backlight_probe()
does not mux the pad or apply its pad configuration.

As a result, when gpio_backlight_probe() in
drivers/video/backlight/gpio_backlight.c runs before display@0 binds
pinctrl_lcd:

drivers/video/backlight/gpio_backlight.c:gpio_backlight_probe() {
	...
	if (!of_node || !of_node->phandle)
		/* Not booted with device tree or no phandle link to the node */
		bl->props.power =3D def_value ? BACKLIGHT_POWER_ON
					    : BACKLIGHT_POWER_OFF;
	else if (gpiod_get_value_cansleep(gbl->gpiod) =3D=3D 0)
		bl->props.power =3D BACKLIGHT_POWER_OFF;
	else
		bl->props.power =3D BACKLIGHT_POWER_ON;

	ret =3D gpiod_direction_output(gbl->gpiod, !bl->props.power);
	...
}

gpiod_get_value_cansleep() and gpiod_direction_output() execute while
MX6UL_PAD_LCD_DATA16 is still unmuxed and unconfigured.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-add-bsh-sm=
m-m2-v1-0-369f0a77e021@cn.bosch.com?part=3D10
