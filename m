Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D151199FAB;
	Tue, 30 Dec 2025 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767099321; cv=none; b=IEGPc3VcY7nTLWORv1ER98OUMViqUzLt8YYwcWxwAMtX103nCaDTP7OjnMYKNDlTuZ54aOOSrdh9yiJRDJTBQYqK/Ldmy7rfcIIWz29roPDQkYfI+eJUW1ZDcDEadF/SeF845aMbonrNlGPNaL5a4rgXH8TO3gm5b0VcSSEANxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767099321; c=relaxed/simple;
	bh=sDdmBNbfWNiWeNz/dHQFGjINpvfG56xANftGFhqwYnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ukx43fdqwHWNyQJ5Ade7GF1IWdcj5oEPUNxTskfhQZAK3LDbmFfgaoa/74fgp/sbbkD4ogGSSBYk5QxFCZdgwySvd0wFZoN6TKwGMnIyR89K+lLfH23bQWunsg/e20PSztIMy/4lmE63h7Ih/j39K/T5O3/l9OFypq7mK4eQOI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTYp/FqX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTYp/FqX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F208C4CEFB;
	Tue, 30 Dec 2025 12:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767099321;
	bh=sDdmBNbfWNiWeNz/dHQFGjINpvfG56xANftGFhqwYnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTYp/FqXoR2r7a2Ez0FtyB1fdlwYvLCSTrR6uMaSE5N233xIWvszbQeV4txtMokgZ
	 O8tAHQDgcN1yAcBp8dW1o80N6hu0e90ySR0yqbFGpEvv3/NB/ZrJ8OCi6q6lRPmDTC
	 LRuY7gb+MpGB+073xBP9EQzqu2hpy/qskx3yvo05rYCRSXpIJbUXJuXDf3r8DoJlV8
	 FdepUr2LlsV29UjHvL6XKZC5K/kqRtu6FX4yDtGXJYzf1cMBgCeN7o5tniWy+Wf8B/
	 pfV92JBRlxADuj+Xb1JM153hmFaWL8vlI4CgHQB717k8wjNUFZbKgQw+K95ZEWiNa0
	 +Rcjfu4Abo7lg==
Date: Tue, 30 Dec 2025 20:55:11 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 7/7] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Message-ID: <aVPLr8ByUwrnda_Y@dragon>
References: <20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com>
 <20251221-imx8mp-hb-iiot-v5-7-4a4dad916348@solid-run.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221-imx8mp-hb-iiot-v5-7-4a4dad916348@solid-run.com>

On Sun, Dec 21, 2025 at 12:28:56PM +0100, Josua Mayer wrote:
> Add description for the SolidRun i.MX8M Mini SoM on HummingBoard Ripple.
> 
> The SoM features:
> - 1Gbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - NPU (assembly option)
> - WiFi + Bluetooth
> 
> The HummingBoard Ripple features:
> - 2x USB-2.0 Type-A connector
> - 1Gbps RJ45 Ethernet with PoE
> - microSD connector
> - microHDMI connector
> - mpcie connector with USB-2.0 interface + SIM card holder
> - microUSB connector for console (using fdtdi chip)
> - RTC with backup battery
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 394 +++++++++++++++++++++
>  3 files changed, 731 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 73c3d234149cd..6be7de1f0e1c4 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -124,6 +124,8 @@ imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
>  imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
>  
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-hummingboard-ripple.dtb
> +DTC_FLAGS_imx8mm-hummingboard-ripple += -@
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
> new file mode 100644
> index 0000000000000..110e7ff1ff135
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +
> +#include "imx8mm-sr-som.dtsi"
> +
> +/ {
> +	model = "SolidRun i.MX8MM HummingBoard Ripple";
> +	compatible = "solidrun,imx8mm-hummingboard-ripple",
> +		     "solidrun,imx8mm-sr-som", "fsl,imx8mm";
> +
> +	aliases {
> +		rtc0 = &carrier_rtc;
> +		rtc1 = &snvs_rtc;
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "c";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&adv7535_out>;
> +			};
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&led_pins>;
> +
> +		led-0 {
> +			label = "D30";
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;
> +			default-state = "on";
> +		};
> +
> +		led-1 {
> +			label = "D31";
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
> +			default-state = "on";
> +		};
> +
> +		led-2 {
> +			label = "D32";
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
> +			default-state = "on";
> +		};
> +
> +		led-3 {
> +			label = "D33";
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
> +			default-state = "on";
> +		};
> +
> +		led-4 {
> +			label = "D34";
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
> +			default-state = "on";
> +		};
> +	};
> +
> +	rfkill-mpcie-wifi {
> +		compatible = "rfkill-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pcie_rfkill_pins>;
> +		label = "mpcie WiFi";
> +		radio-type = "wlan";
> +		/* rfkill-gpio inverts internally */
> +		shutdown-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vmmc: regulator-mmc {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vmmc_pins>;
> +		regulator-name = "vmmc";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
> +		startup-delay-us = <250>;
> +	};
> +
> +	vbus1: regulator-vbus-1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vbus1";
> +		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vbus1_pins>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	vbus2: regulator-vbus-2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vbus2";
> +		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vbus2_pins>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	v_1_2: regulator-1-2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v2";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +	};
> +};
> +
> +&i2c3 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c3_pins>;
> +	status = "okay";
> +
> +	carrier_rtc: rtc@69 {
> +		compatible = "abracon,ab1805";
> +		reg = <0x69>;
> +		abracon,tc-diode = "schottky";
> +		abracon,tc-resistor = <3>;
> +	};
> +
> +	carrier_eeprom: eeprom@57{

Sort I2C devices in order of slave/unit address.

> +		compatible = "st,24c02", "atmel,24c02";
> +		reg = <0x57>;
> +		pagesize = <16>;
> +	};
> +
> +	hdmi@3d {
> +		compatible = "adi,adv7535";
> +		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
> +		reg-names = "main", "edid", "cec", "packet";
> +		adi,dsi-lanes = <4>;
> +		avdd-supply = <&v_1_8>;
> +		dvdd-supply = <&v_1_8>;
> +		pvdd-supply = <&v_1_8>;
> +		a2vdd-supply = <&v_1_8>;
> +		v3p3-supply = <&v_3_3>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&hdmi_pins>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
> +		pd-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				adv7535_from_dsim: endpoint {
> +					remote-endpoint = <&mipi_dsi_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				adv7535_out: endpoint {
> +					remote-endpoint = <&hdmi_connector_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&iomuxc {
> +	hdmi_pins: pinctrl-hdmi-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x0
> +			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22	0x0
> +		>;
> +	};
> +
> +	i2c3_pins: pinctrl-i2c3-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
> +			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
> +		>;
> +	};
> +
> +	led_pins: pinctrl-led-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_UART4_TXD_GPIO5_IO29	0x0
> +			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9	0x0
> +			MX8MM_IOMUXC_ECSPI1_MISO_GPIO5_IO8	0x0
> +			MX8MM_IOMUXC_ECSPI1_MOSI_GPIO5_IO7	0x0
> +			MX8MM_IOMUXC_ECSPI1_SCLK_GPIO5_IO6	0x0
> +		>;
> +	};
> +
> +	pcie_rfkill_pins: pinctrl-pcie-rfkill-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20		0x0
> +		>;
> +	};
> +
> +	usb_hub_pins: pinctrl-usb-hub-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30	0x0
> +		>;
> +	};
> +
> +	usdhc2_pins: pinctrl-usdhc2-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
> +			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
> +			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
> +			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
> +			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
> +			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
> +			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
> +			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
> +		>;
> +	};
> +
> +	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
> +			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
> +			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
> +			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
> +			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
> +			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
> +			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
> +			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
> +		>;
> +	};
> +
> +	usdhc2_200mhz_pins: pinctrl-usdhc2-100mhz-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
> +			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
> +			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
> +			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
> +			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
> +			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
> +			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
> +			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
> +		>;
> +	};
> +
> +	vbus1_pins: pinctrl-vbus-1-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x20
> +		>;
> +	};
> +
> +	vbus2_pins: pinctrl-vbus-2-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI2_RXFS_GPIO4_IO21	0x20
> +		>;
> +	};
> +
> +	vmmc_pins: pinctrl-vmmc-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
> +		>;
> +	};
> +};
> +
> +&lcdif {
> +	status = "okay";
> +};
> +
> +&mipi_dsi {
> +	samsung,esc-clock-frequency = <10000000>;
> +	status = "okay";
> +};
> +
> +&mipi_dsi_out {
> +	remote-endpoint = <&adv7535_from_dsim>;
> +};
> +
> +&usbotg1 {
> +	dr_mode = "host";
> +	vbus-supply = <&vbus2>;
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	status = "okay";
> +	dr_mode = "host";
> +	vbus-supply = <&vbus1>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb_hub_pins>;
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb4b4,6502", "usb4b4,6506";
> +		reg = <1>;
> +		peer-hub = <&hub_3_0>;
> +		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&v_1_2>;
> +		vdd2-supply = <&v_3_3>;
> +	};
> +
> +	/* this device is not visible because host supports 2.0 only */
> +	hub_3_0: hub@2 {
> +		compatible = "usb4b4,6500", "usb4b4,6504";
> +		reg = <2>;
> +		peer-hub = <&hub_2_0>;
> +		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&v_1_2>;
> +		vdd2-supply = <&v_3_3>;
> +	};
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&usdhc2_pins>;
> +	pinctrl-1 = <&usdhc2_100mhz_pins>;
> +	pinctrl-2 = <&usdhc2_200mhz_pins>;
> +	vmmc-supply = <&vmmc>;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
> new file mode 100644
> index 0000000000000..0bc1b6fa8e994
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
> @@ -0,0 +1,394 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +#include <dt-bindings/phy/phy-imx8-pcie.h>
> +
> +#include "imx8mm.dtsi"
> +
> +/ {
> +	model = "SolidRun i.MX8MM SoM";
> +	compatible = "solidrun,imx8mm-sr-som", "fsl,imx8mm";
> +
> +	chosen {
> +		bootargs = "earlycon=ec_imx6q,0x30890000,115200";
> +		stdout-path = &uart2;
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x40000000 0 0x80000000>;
> +	};
> +
> +	usdhc1_pwrseq: usdhc1-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	v_1_8: regulator-1-8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	v_3_3: regulator-3-3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +};
> +
> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&fec1_pins>;
> +	phy-mode = "rgmii-id";
> +	phy = <&phy0>;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		phy0: ethernet-phy@4 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0x4>;
> +			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
> +			phy-reset-duration = <10>;
> +			qca,smarteee-tw-us-1g = <24>;
> +			vddio-supply = <&vddio>;
> +
> +			vddio: vddio-regulator {
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins>;
> +	status = "okay";
> +
> +	som_eeprom: eeprom@50{
> +		compatible = "st,24c01", "atmel,24c01";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
> +
> +	pmic@4b {

Same here

> +		compatible = "rohm,bd71847";
> +		reg = <0x4b>;
> +		pinctrl-0 = <&pmic_pins>;
> +		pinctrl-names = "default";
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +		rohm,reset-snvs-powered;
> +

Nit: unnecessary newline

Shawn

> +		#clock-cells = <0>;
> +		clocks = <&osc_32k>;
> +		clock-output-names = "clk-32k-out";
> +
> +		regulators {
> +			buck1_reg: BUCK1 {
> +				regulator-name = "buck1";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <1250>;
> +			};
> +
> +			buck2_reg: BUCK2 {
> +				regulator-name = "buck2";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <1250>;
> +				rohm,dvs-run-voltage = <1000000>;
> +				rohm,dvs-idle-voltage = <900000>;
> +			};
> +
> +			buck3_reg: BUCK3 {
> +				// BUCK5 in datasheet
> +				regulator-name = "buck3";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck4_reg: BUCK4 {
> +				// BUCK6 in datasheet
> +				regulator-name = "buck4";
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck5_reg: BUCK5 {
> +				// BUCK7 in datasheet
> +				regulator-name = "buck5";
> +				regulator-min-microvolt = <1605000>;
> +				regulator-max-microvolt = <1995000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck6_reg: BUCK6 {
> +				// BUCK8 in datasheet
> +				regulator-name = "buck6";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo1_reg: LDO1 {
> +				regulator-name = "ldo1";
> +				regulator-min-microvolt = <1600000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo2_reg: LDO2 {
> +				regulator-name = "ldo2";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <900000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo3_reg: LDO3 {
> +				regulator-name = "ldo3";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo4_reg: LDO4 {
> +				regulator-name = "ldo4";
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo6_reg: LDO6 {
> +				regulator-name = "ldo6";
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
> +&iomuxc {
> +	fec1_pins: pinctrl-fec1-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
> +			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x3
> +			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1f
> +			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1f
> +			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1f
> +			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1f
> +			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
> +			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
> +			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
> +			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
> +			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
> +			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
> +			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
> +			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
> +			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x19
> +		>;
> +	};
> +
> +	i2c1_pins: pinctrl-i2c1-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
> +			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
> +		>;
> +	};
> +
> +	pcie_pins: pinctrl-pcie-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15		0x0
> +		>;
> +	};
> +
> +	pmic_pins: pinctrl-pmic-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x140
> +		>;
> +	};
> +
> +	uart1_pins: pinctrl-uart1-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
> +			MX8MM_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
> +			MX8MM_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
> +			MX8MM_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
> +			/* BT_REG_ON */
> +			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x0
> +			/* BT_WAKE_DEV */
> +			MX8MM_IOMUXC_SD1_DATA5_GPIO2_IO7	0x0
> +			/* BT_WAKE_HOST */
> +			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x100
> +		>;
> +	};
> +
> +	uart2_pins: pinctrl-uart2-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX		0x140
> +			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX		0x140
> +		>;
> +	};
> +
> +	usdhc1_pins: pinctrl-usdhc1-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
> +			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
> +			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
> +			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
> +			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
> +			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
> +			/* wifi refclk */
> +			MX8MM_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x0
> +			/* WL_REG_ON */
> +			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10		0x0
> +			/* WL_WAKE_HOST */
> +			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9		0x100
> +		>;
> +	};
> +
> +	usdhc3_pins: pinctrl-usdhc3-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
> +		>;
> +	};
> +
> +	usdhc3_100mhz_pins: pinctrl-usdhc3-100mhz-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
> +		>;
> +	};
> +
> +	usdhc3_200mhz_pins: pinctrl-usdhc3-200mhz-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
> +		>;
> +	};
> +
> +	wdog1_pins: pinctrl-wdog1-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x140
> +		>;
> +	};
> +};
> +
> +&pcie_phy {
> +	fsl,clkreq-unsupported;
> +	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
> +	status = "okay";
> +};
> +
> +/* assembly-option for AI accelerator on SoM, otherwise routed to carrier */
> +&pcie0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie_pins>;
> +	reset-gpios = <&gpio1 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart1_pins>;
> +	uart-has-rtscts;
> +	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
> +	assigned-clocks = <&clk IMX8MM_CLK_UART1>;
> +	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "brcm,bcm4330-bt";
> +		device-wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
> +		host-wakeup-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
> +		shutdown-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
> +		max-speed = <3000000>;
> +	};
> +};
> +
> +&uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart2_pins>;
> +	status = "okay";
> +};
> +
> +&usdhc1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usdhc1_pins>;
> +	vmmc-supply = <&v_3_3>;
> +	vqmmc-supply = <&v_1_8>;
> +	bus-width = <4>;
> +	mmc-pwrseq = <&usdhc1_pwrseq>;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&usdhc3_pins>;
> +	pinctrl-1 = <&usdhc3_100mhz_pins>;
> +	pinctrl-2 = <&usdhc3_200mhz_pins>;
> +	vmmc-supply = <&v_3_3>;
> +	vqmmc-supply = <&v_1_8>;
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&wdog1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&wdog1_pins>;
> +	status = "okay";
> +};
> 
> -- 
> 2.51.0
> 
> 
