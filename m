Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C6815491
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 00:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712104249; cv=none; b=R3UFVjjvEfyDCrN649i14U/Npm6CifRvHC3QiaWnPdLX71iIqCOwa+Ew3XtuajC1W9xaDmMD3QSIY1chUc3OARcPu+ObgPfBVyOvH4ZGy0u4q8IRIZPfkHXYnjaB7La8oyvRJxaEyrilqfuX6hrD+s+e2RRBHDSSCh1kLyciKNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712104249; c=relaxed/simple;
	bh=swZSrKG0qB/Jjtliaitcljm/bXavS5dlU8K/wHD+3bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdG7gqLl+bwD9DhFk+WEbDpQ+XSehJqrHIfr+drdjvAsi1vhGG/o7CJcWLftbzOWy9KO31SEmtoeb4bJ1JsxTvWZN+YHYKm33Qi+UE385pNWu5KdMwvVFX7THBy3FN4/gw/2s5DOYsJRgm29qxYhisMSVaSfbLYAqBSjunuKxC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=n4qZ49fW; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="n4qZ49fW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=10vJT0Uk2ARxAvksKrhWVkuBaK22icnr/l5cuBxbE54=;
	b=n4qZ49fWFIgA8d1UyNEwguiwVviSfM3NETSTKaqVjjYOuT3NlEhhGL0KBcFwXN
	IdW1nY2c4K+HABW03BwusZmZ7qUvbmzyNzNNM7y4ZjYZJDDDl+KwAR3t5nUdHGaZ
	+xRsj39InjqjXz5DIQ01I8qWRkgMaskVm5TnIIxNUncVY=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrADXHyEUowxm85CsAQ--.30521S3;
	Wed, 03 Apr 2024 08:30:13 +0800 (CST)
Date: Wed, 3 Apr 2024 08:30:11 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Trevor Zaharichuk <trevor@au-zone.com>,
	Greg Lytle <greg@au-zone.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: Add device tree source for the Au-Zone
 Maivin Starter Kit
Message-ID: <ZgyjE05p/1NZnzaK@dragon>
References: <20240325203245.31660-1-laurent.pinchart@ideasonboard.com>
 <20240325203245.31660-6-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325203245.31660-6-laurent.pinchart@ideasonboard.com>
X-CM-TRANSID:ClUQrADXHyEUowxm85CsAQ--.30521S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxKrykJF15CrW3Xw4ruF1fXrb_yoWxCFWfpF
	9rA39rWrWrXr47Aa4qqa1xKr9xtws5K3yq9w1DCFy8CFs2kasrtFn8Krs8Cr1fGrs8Xw4F
	kF1rZr42kFnIq3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jc0edUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBRW1ZVsVCbgBnwAAsh

On Mon, Mar 25, 2024 at 10:32:45PM +0200, Laurent Pinchart wrote:
> The Maivin board is an AI vision starter kit sold by Au-Zone
> Technologies, developed in collaboration with Toradex and Vision
> Components. It is based on a Toradex Verdin i.MX8MP SoM.
> 
> Add a device tree that covers the base set the peripherals found on the
> board:
> 
> - Ethernet
> - USB
> - SD card slot
> - CAN and serial ports (RS232 and RS485)
> - DACs, EEPROMs, temperature sensor
> - PCI M.2 and CSI regulators
> 
> An additional pinctrl group is included for the M.2 modem, but hasn't
> been tested due to lack of compatible hardware.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../boot/dts/freescale/imx8mp-maivin.dts      | 236 ++++++++++++++++++
>  2 files changed, 237 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-maivin.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 045250d0a040..03af8c242649 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -165,6 +165,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-maivin.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-maivin.dts b/arch/arm64/boot/dts/freescale/imx8mp-maivin.dts
> new file mode 100644
> index 000000000000..2d1c8e782465
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-maivin.dts
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Copyright 2021 Au-Zone Technologies
> + * Copyright 2024 Ideas on Board
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/leds/common.h>
> +
> +#include "imx8mp-verdin.dtsi"
> +#include "imx8mp-verdin-nonwifi.dtsi"
> +
> +/ {
> +	model = "Au-Zone Maivin AI Vision Starter Kit";
> +	compatible = "au-zone,maivin-starter-kit",
> +		     "toradex,verdin-imx8mp-nonwifi",
> +		     "toradex,verdin-imx8mp",
> +		     "fsl,imx8mp";
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&pinctrl_sw1>;
> +
> +		button-0 {
> +			label = "SW1";
> +			linux,code = <BTN_MISC>;
> +			interrupts-extended = <&gpio3 16 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-0 = <&pinctrl_led>;
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_STATUS;
> +			linux,default-trigger = "heartbeat";
> +			gpios = <&gpio3 14 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	csi_3v3: regulator-csi-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "CSI_3V3";
> +		pinctrl-0 = <&pinctrl_csi_3v3>;
> +		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us = <50000>;	/* TODO: Determine the right value */
> +	};
> +
> +	m2_3v3: regulator-m2-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "M2_3V3";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		pinctrl-0 = <&pinctrl_m2_3v3>;
> +		gpio = <&gpio3 1 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	/* Carrier Board Supply 3V3_SW */
> +	reg_3v3: regulator-3v3-sw {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "3V3_SW";
> +	};
> +};
> +
> +&eqos {
> +	status = "okay";
> +};
> +
> +/* Verdin CAN_1 */
> +&flexcan1 {
> +	status = "okay";
> +};
> +
> +/* Verdin CAN_2 */
> +&flexcan2 {
> +	status = "okay";
> +};
> +
> +/* Verdin I2C_2_DSI */
> +&i2c2 {
> +	status = "okay";
> +
> +	clock-frequency = <400000>;
> +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

We usually end property list with 'status'.

> +
> +	dac@d {
> +		compatible = "ti,dac081c081";
> +		reg = <0x0d>;
> +		vref-supply = <&csi_3v3>;
> +	};
> +};
> +
> +/* Verdin I2C_4_CSI */
> +&i2c3 {
> +	status = "okay";
> +
> +	dac@d {
> +		compatible = "ti,dac081c081";
> +		reg = <0x0d>;
> +		vref-supply = <&csi_3v3>;
> +	};
> +};
> +
> +/* Verdin I2C_1 */
> +&i2c4 {
> +	status = "okay";
> +
> +	temp-sensor@4b {
> +		compatible = "ti,tmp102";
> +		reg = <0x4b>;
> +	};
> +
> +	/* EEPROM on the rear connector interface */
> +	eeprom@54 {
> +		compatible = "st,24c02", "atmel,24c02";
> +		pagesize = <16>;
> +		reg = <0x54>;
> +	};
> +};
> +
> +/* EEPROM on the carrier board */
> +&eeprom_carrier_board {
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_csi_3v3: csi-3v3-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_DATA01__GPIO3_IO07		0x184	/* SODIMM 58 */
> +		>;
> +	};
> +
> +	gpio7grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03		0x82	/* SODIMM 220 */
> +		>;
> +	};
> +
> +	gpio8grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXC__GPIO4_IO01		0x82	/* SODIMM 222 */
> +		>;
> +	};
> +
> +	pinctrl_led: ledgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14		0x82	/* SODIMM 66 */
> +		>;
> +	};
> +
> +	/* M.2 power off and reset */
> +	pinctrl_m2: m2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_DATA00__GPIO3_IO06		0x82	/* SODIMM 56 */
> +			MX8MP_IOMUXC_NAND_DATA03__GPIO3_IO09		0x82	/* SODIMM 62 */
> +		>;
> +	};
> +
> +	pinctrl_m2_3v3: m2-3v3-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01		0x82	/* SODIMM 54 */
> +		>;
> +	};
> +
> +	pinctrl_sw1: sw1grp {
> +		fsl,pins = <
> +			/*
> +			 * SW1 shortens the pin to ground when pressed, enable
> +			 * the internal pull-up.
> +			 */
> +			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16		0x1c0	/* SODIMM 64 */
> +		>;
> +	};
> +};
> +
> +&reg_usdhc2_vmmc {
> +	vin-supply = <&reg_3v3>;
> +};
> +
> +/* Verdin UART_1 */
> +/* Enabling RS-485 operation */
> +&uart1 {
> +	fsl,uart-has-rtscts;

uart-has-rtscts instead.

Shawn

> +	linux,rs485-enabled-at-boot-time;
> +};
> +
> +/* Verdin UART_2, for M.2 card slot */
> +&uart2 {
> +	status = "okay";
> +};
> +
> +/* Verdin UART_3, used as the Linux Console */
> +&uart3 {
> +	status = "okay";
> +};
> +
> +/* Verdin USB_1, USB recovery */
> +&usb3_phy0 {
> +	status = "okay";
> +};
> +
> +&usb3_0 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	status = "okay";
> +};
> +
> +/* Verdin USB_2, for M.2 card slot */
> +&usb3_phy1 {
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_1 {
> +	status = "okay";
> +};
> +
> +/* Verdin SD_1, for SD card slot */
> +&usdhc2 {
> +	status = "okay";
> +};
> -- 
> Regards,
> 
> Laurent Pinchart
> 

