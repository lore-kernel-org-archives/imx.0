Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013C41F957
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 03:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735529391; cv=none; b=A/QpgPnoWoFwbR8xK20cUcSJJbSDSAtHRP2NxjuXB1E7za1jyf9x7J9JfbdXU1EyO10icbAOggLIERcx6/kHTg6llHZ6/vjlwZP450vhzIqW9maCHaz2tRH5+9hnmLt9oZbSI0IRfnQ9DdRHD5H68WhbLo3OyYHnZyoJVnAwzwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735529391; c=relaxed/simple;
	bh=/1VRIVp3dlpHy3z26txhvIOeYNIoMvv2zBOds9QWe98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlhFFQniNvlnIkPTOMXMPNnDKCSGe0jD3+0A0KTzovi1U3j06JsiLAP8HCrJ1s5aCQ+1uFUWbfKk7HH9NwgVjzHoMVoljhDjVyfdjqnyFpdOHcjsEzPwTqvf0eE82GhbjGJYTQGzWjqwPTnE8CiQioGAqPrbhCGNrNspNU0xS1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=PWiSHYKh; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="PWiSHYKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7IAOg/mAWoU4L7C1DsWS+lH8jqjZPcuiOpcfq17r6sk=;
	b=PWiSHYKhxon5m5bpT0fIct1D10b7ASUWihuKXbtW7z+F0LnSyoiDY1TxPjWFx2
	/G7dw7+arUYe7UEmjRqvDkDysh9Wun6FTBPiNV7p6vhVMQ5LNj/bucBUUXieI1km
	lZZqcIM4hdHwfFdj/2qmgX3Kf7xvIVZUtpaSPPGn9OU2E=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHKlRmE3JnvC8cBg--.62044S3;
	Mon, 30 Dec 2024 11:28:41 +0800 (CST)
Date: Mon, 30 Dec 2024 11:28:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Pengfei Li <pengfei.li_1@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de,
	catalin.marinas@arm.com, will@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, joao.goncalves@toradex.com, marex@denx.de,
	hvilleneuve@dimonoff.com, hiago.franco@toradex.com,
	peng.fan@nxp.com, frieder.schrempf@kontron.de,
	alexander.stein@ew.tq-group.com, m.othacehe@gmail.com,
	mwalle@kernel.org, Max.Merchel@ew.tq-group.com,
	quic_bjorande@quicinc.com, geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
	arnd@arndb.de, nfraprado@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, ping.bai@nxp.com,
	ye.li@nxp.com, aisheng.dong@nxp.com, frank.li@nxp.com,
	carlos.song@nxp.com
Subject: Re: [PATCH v3 3/4] arm64: dts: freescale: Add i.MX91 11x11 EVK basic
 support
Message-ID: <Z3ITZtXIMZ/ZjxEB@dragon>
References: <20241120094945.3032663-1-pengfei.li_1@nxp.com>
 <20241120094945.3032663-4-pengfei.li_1@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120094945.3032663-4-pengfei.li_1@nxp.com>
X-CM-TRANSID:Ms8vCgDHKlRmE3JnvC8cBg--.62044S3
X-Coremail-Antispam: 1Uf129KBjvAXoWfAw4kWrW5Xw47KrWrXryfCrg_yoW5GrWfto
	WYvFZYkry8Kryavr4fJwnFya1xAr1qqa1YkayayryrWF1xtFyqvws8Xa1jqr1rJF4FyFyD
	Z34fZa48ZwsFvws5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYPfQDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxrFZWdyEhAFgQAAsi

On Wed, Nov 20, 2024 at 05:49:44PM +0800, Pengfei Li wrote:
> Add i.MX91 11x11 EVK board support.
> - Enable ADC1.
> - Enable lpuart1 and lpuart5.
> - Enable network eqos and fec.
> - Enable I2C bus and children nodes under I2C bus.
> - Enable USB and related nodes.
> - Enable uSDHC1 and uSDHC2.
> - Enable Watchdog3.
> 
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../boot/dts/freescale/imx91-11x11-evk.dts    | 875 ++++++++++++++++++
>  2 files changed, 876 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 42e6482a31cb..9174c9e215d5 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -256,6 +256,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris-v2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
>  
>  imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> new file mode 100644
> index 000000000000..65571fc223b7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> @@ -0,0 +1,875 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/usb/pd.h>
> +#include "imx91.dtsi"
> +
> +/ {
> +	compatible = "fsl,imx91-11x11-evk", "fsl,imx91";
> +	model = "NXP i.MX91 11X11 EVK board";
> +
> +	aliases {
> +		ethernet0 = &fec;
> +		ethernet1 = &eqos;
> +		rtc0 = &bbnsm_rtc;
> +	};
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	reg_vref_1v8: regulator-adc-vref {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-name = "vref_1v8";
> +	};
> +
> +	reg_audio_pwr: regulator-audio-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "audio-pwr";
> +		gpio = <&adp5585 1 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible = "regulator-fixed";
> +		off-on-delay-us = <12000>;
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "VSD_3V3";
> +		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usdhc3_vmmc: regulator-usdhc3 {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "WLAN_EN";
> +		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		/*
> +		 * IW612 wifi chip needs more delay than other wifi chips to complete
> +		 * the host interface initialization after power up, otherwise the
> +		 * internal state of IW612 may be unstable, resulting in the failure of
> +		 * the SDIO3.0 switch voltage.
> +		 */
> +		startup-delay-us = <20000>;
> +	};
> +
> +	reg_vdd_12v: regulator-vdd-12v {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <12000000>;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-name = "reg_vdd_12v";
> +		gpio = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_vrpi_3v3: regulator-vrpi-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "VRPI_3V3";
> +		vin-supply = <&buck4>;
> +		gpio = <&pcal6524 2 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_vrpi_5v: regulator-vrpi-5v {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "VRPI_5V";
> +		gpio = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reserved-memory {
> +		ranges;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0x80000000 0 0x40000000>;
> +			reusable;
> +			size = <0 0x10000000>;
> +			linux,cma-default;
> +		};
> +	};
> +};
> +
> +&adc1 {
> +	vref-supply = <&reg_vref_1v8>;
> +	status = "okay";
> +};
> +
> +&eqos {
> +	phy-handle = <&ethphy1>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	pinctrl-1 = <&pinctrl_eqos_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-frequency = <5000000>;
> +
> +		ethphy1: ethernet-phy@1 {
> +			reg = <1>;
> +			eee-broken-1000t;
> +		};
> +	};
> +};
> +
> +&fec {
> +	phy-handle = <&ethphy2>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	pinctrl-1 = <&pinctrl_fec_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	fsl,magic-packet;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-frequency = <5000000>;
> +
> +		ethphy2: ethernet-phy@2 {
> +			reg = <2>;
> +			eee-broken-1000t;
> +		};
> +	};
> +};
> +
> +/*
> + * When add, delete or change any target device setting in &lpi2c1,
> + * please synchronize the changes to the &i3c1 bus in imx91-11x11-evk-i3c.dts.
> + */
> +&lpi2c1 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	codec: wm8962@1a {
> +		compatible = "wlf,wm8962";
> +		reg = <0x1a>;
> +		clocks = <&clk IMX93_CLK_SAI3_GATE>;
> +		AVDD-supply = <&reg_audio_pwr>;
> +		CPVDD-supply = <&reg_audio_pwr>;
> +		DBVDD-supply = <&reg_audio_pwr>;
> +		DCVDD-supply = <&reg_audio_pwr>;
> +		MICVDD-supply = <&reg_audio_pwr>;
> +		PLLVDD-supply = <&reg_audio_pwr>;
> +		SPKVDD1-supply = <&reg_audio_pwr>;
> +		SPKVDD2-supply = <&reg_audio_pwr>;
> +		gpio-cfg = <
> +			0x0000 /* 0:Default */
> +			0x0000 /* 1:Default */
> +			0x0000 /* 2:FN_DMICCLK */
> +			0x0000 /* 3:Default */
> +			0x0000 /* 4:FN_DMICCDAT */
> +			0x0000 /* 5:Default */
> +		>;
> +	};
> +
> +	lsm6dsm@6a {
> +		compatible = "st,lsm6dso";
> +		reg = <0x6a>;
> +	};
> +};
> +
> +&lpi2c2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c2>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	pcal6524: gpio@22 {
> +		compatible = "nxp,pcal6524";
> +		reg = <0x22>;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		interrupt-parent = <&gpio3>;
> +		pinctrl-0 = <&pinctrl_pcal6524>;
> +		pinctrl-names = "default";
> +	};
> +
> +	pmic@25 {
> +		compatible = "nxp,pca9451a";
> +		reg = <0x25>;
> +		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-parent = <&pcal6524>;
> +
> +		regulators {
> +

This newline is not useful.

> +			buck1: BUCK1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <2237500>;
> +				regulator-min-microvolt = <650000>;
> +				regulator-name = "BUCK1";
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck2: BUCK2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <2187500>;
> +				regulator-min-microvolt = <600000>;
> +				regulator-name = "BUCK2";
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck4: BUCK4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-min-microvolt = <600000>;
> +				regulator-name = "BUCK4";
> +			};
> +
> +			buck5: BUCK5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-min-microvolt = <600000>;
> +				regulator-name = "BUCK5";
> +			};
> +
> +			buck6: BUCK6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-min-microvolt = <600000>;
> +				regulator-name = "BUCK6";
> +			};
> +
> +			ldo1: LDO1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <1600000>;
> +				regulator-name = "LDO1";
> +			};
> +
> +			ldo4: LDO4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <800000>;
> +				regulator-name = "LDO4";
> +			};
> +
> +			ldo5: LDO5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-name = "LDO5";
> +			};
> +		};
> +	};
> +
> +	adp5585: io-expander@34 {
> +		compatible = "adi,adp5585-00", "adi,adp5585";
> +		reg = <0x34>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		#pwm-cells = <3>;
> +		gpio-reserved-ranges = <5 1>;
> +
> +		exp-sel-hog {
> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_HIGH>;
> +			output-low;
> +		};
> +	};
> +};
> +
> +&lpi2c3 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	ptn5110: tcpc@50 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x50>;
> +		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio3>;
> +		status = "okay";

The "okay" status is usually used to flip "disabled" defined in dtsi.
It's not needed here.

> +
> +		typec1_con: connector {
> +			compatible = "usb-c-connector";
> +			data-role = "dual";
> +			label = "USB-C";
> +			op-sink-microwatt = <15000000>;
> +			power-role = "dual";
> +			self-powered;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 20000, 3000)>;
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			try-power-role = "sink";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					typec1_dr_sw: endpoint {
> +						remote-endpoint = <&usb1_drd_sw>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	ptn5110_2: tcpc@51 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x51>;
> +		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio3>;
> +		status = "okay";
> +
> +		typec2_con: connector {
> +			compatible = "usb-c-connector";
> +			data-role = "dual";
> +			label = "USB-C";
> +			op-sink-microwatt = <15000000>;
> +			power-role = "dual";
> +			self-powered;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 20000, 3000)>;
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			try-power-role = "sink";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					typec2_dr_sw: endpoint {
> +						remote-endpoint = <&usb2_drd_sw>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	pcf2131: rtc@53 {
> +		compatible = "nxp,pcf2131";
> +		reg = <0x53>;
> +		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-parent = <&pcal6524>;
> +		status = "okay";
> +	};
> +};
> +
> +&lpuart1 {
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&lpuart5 {
> +	pinctrl-0 = <&pinctrl_uart5>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	adp-disable;
> +	disable-over-current;
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	usb-role-switch;
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	status = "okay";
> +
> +	port {
> +		usb1_drd_sw: endpoint {
> +			remote-endpoint = <&typec1_dr_sw>;
> +		};
> +	};
> +};
> +
> +&usbotg2 {
> +	adp-disable;
> +	disable-over-current;
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	usb-role-switch;
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	status = "okay";
> +
> +	port {
> +		usb2_drd_sw: endpoint {
> +			remote-endpoint = <&typec2_dr_sw>;
> +		};
> +	};
> +};
> +
> +&usdhc1 {
> +	bus-width = <8>;
> +	non-removable;
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	bus-width = <4>;
> +	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
> +	no-mmc;
> +	no-sdio;
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	status = "okay";
> +};
> +
> +&wdog3 {
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET1_MDC__ENET1_MDC			0x57e
> +			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
> +			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
> +			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
> +			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
> +			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
> +			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC	0x5fe

There are a couple of issues with aligning pad hex values.

 - Not all aligning at the same column
 - Some indentation are using spaces instead tabs

Shawn

> +			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
> +			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
> +			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1			0x57e
> +			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
> +			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
> +			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
> +			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
> +		>;
> +	};
> +
> +	pinctrl_eqos_sleep: eqossleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET1_MDC__GPIO4_IO0				0x31e
> +			MX91_PAD_ENET1_MDIO__GPIO4_IO1				0x31e
> +			MX91_PAD_ENET1_RD0__GPIO4_IO10                          0x31e
> +			MX91_PAD_ENET1_RD1__GPIO4_IO11				0x31e
> +			MX91_PAD_ENET1_RD2__GPIO4_IO12				0x31e
> +			MX91_PAD_ENET1_RD3__GPIO4_IO13				0x31e
> +			MX91_PAD_ENET1_RXC__GPIO4_IO9                          0x31e
> +			MX91_PAD_ENET1_RX_CTL__GPIO4_IO8			0x31e
> +			MX91_PAD_ENET1_TD0__GPIO4_IO5                          0x31e
> +			MX91_PAD_ENET1_TD1__GPIO4_IO4                          0x31e
> +			MX91_PAD_ENET1_TD2__GPIO4_IO3				0x31e
> +			MX91_PAD_ENET1_TD3__GPIO4_IO3				0x31e
> +			MX91_PAD_ENET1_TXC__GPIO4_IO7                          0x31e
> +			MX91_PAD_ENET1_TX_CTL__GPIO4_IO6                       0x31e
> +		>;
> +	};
> +
> +	pinctrl_fec: fecgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET2_MDC__ENET2_MDC			0x57e
> +			MX91_PAD_ENET2_MDIO__ENET2_MDIO			0x57e
> +			MX91_PAD_ENET2_RD0__ENET2_RGMII_RD0		0x57e
> +			MX91_PAD_ENET2_RD1__ENET2_RGMII_RD1		0x57e
> +			MX91_PAD_ENET2_RD2__ENET2_RGMII_RD2		0x57e
> +			MX91_PAD_ENET2_RD3__ENET2_RGMII_RD3		0x57e
> +			MX91_PAD_ENET2_RXC__ENET2_RGMII_RXC		0x5fe
> +			MX91_PAD_ENET2_RX_CTL__ENET2_RGMII_RX_CTL	0x57e
> +			MX91_PAD_ENET2_TD0__ENET2_RGMII_TD0		0x57e
> +			MX91_PAD_ENET2_TD1__ENET2_RGMII_TD1		0x57e
> +			MX91_PAD_ENET2_TD2__ENET2_RGMII_TD2		0x57e
> +			MX91_PAD_ENET2_TD3__ENET2_RGMII_TD3		0x57e
> +			MX91_PAD_ENET2_TXC__ENET2_RGMII_TXC		0x5fe
> +			MX91_PAD_ENET2_TX_CTL__ENET2_RGMII_TX_CTL	0x57e
> +		>;
> +	};
> +
> +	pinctrl_fec_sleep: fecsleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET2_MDC__GPIO4_IO14			0x51e
> +			MX91_PAD_ENET2_MDIO__GPIO4_IO15			0x51e
> +			MX91_PAD_ENET2_RD0__GPIO4_IO24			0x51e
> +			MX91_PAD_ENET2_RD1__GPIO4_IO25			0x51e
> +			MX91_PAD_ENET2_RD2__GPIO4_IO26			0x51e
> +			MX91_PAD_ENET2_RD3__GPIO4_IO27			0x51e
> +			MX91_PAD_ENET2_RXC__GPIO4_IO23			0x51e
> +			MX91_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
> +			MX91_PAD_ENET2_TD0__GPIO4_IO19			0x51e
> +			MX91_PAD_ENET2_TD1__GPIO4_IO18			0x51e
> +			MX91_PAD_ENET2_TD2__GPIO4_IO17			0x51e
> +			MX91_PAD_ENET2_TD3__GPIO4_IO16			0x51e
> +			MX91_PAD_ENET2_TXC__GPIO4_IO21			0x51e
> +			MX91_PAD_ENET2_TX_CTL__GPIO4_IO20		0x51e
> +		>;
> +	};
> +
> +	pinctrl_flexcan2: flexcan2grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO25__CAN2_TX	0x139e
> +			MX91_PAD_GPIO_IO27__CAN2_RX	0x139e
> +		>;
> +	};
> +
> +	pinctrl_flexcan2_sleep: flexcan2sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO25__GPIO2_IO25  0x31e
> +			MX91_PAD_GPIO_IO27__GPIO2_IO27	0x31e
> +		>;
> +	};
> +
> +	pinctrl_lcdif_gpio: lcdifgpiogrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO00__GPIO2_IO0			0x51e
> +			MX91_PAD_GPIO_IO01__GPIO2_IO1			0x51e
> +			MX91_PAD_GPIO_IO02__GPIO2_IO2			0x51e
> +			MX91_PAD_GPIO_IO03__GPIO2_IO3			0x51e
> +		>;
> +	};
> +
> +	pinctrl_lcdif: lcdifgrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x31e
> +			MX91_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x31e
> +			MX91_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x31e
> +			MX91_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x31e
> +			MX91_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA0		0x31e
> +			MX91_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA1		0x31e
> +			MX91_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA2		0x31e
> +			MX91_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA3		0x31e
> +			MX91_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA4		0x31e
> +			MX91_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA5		0x31e
> +			MX91_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA6		0x31e
> +			MX91_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA7		0x31e
> +			MX91_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA8		0x31e
> +			MX91_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA9		0x31e
> +			MX91_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x31e
> +			MX91_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x31e
> +			MX91_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x31e
> +			MX91_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x31e
> +			MX91_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x31e
> +			MX91_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x31e
> +			MX91_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x31e
> +			MX91_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x31e
> +			MX91_PAD_GPIO_IO27__GPIO2_IO27			0x31e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c1: lpi2c1grp {
> +		fsl,pins = <
> +			MX91_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
> +			MX91_PAD_I2C1_SDA__LPI2C1_SDA			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c2: lpi2c2grp {
> +		fsl,pins = <
> +			MX91_PAD_I2C2_SCL__LPI2C2_SCL			0x40000b9e
> +			MX91_PAD_I2C2_SDA__LPI2C2_SDA			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
> +			MX91_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_pcal6524: pcal6524grp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
> +		>;
> +	};
> +
> +	pinctrl_pdm: pdmgrp {
> +		fsl,pins = <
> +			MX91_PAD_PDM_CLK__PDM_CLK			0x31e
> +			MX91_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM0	0x31e
> +			MX91_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM1	0x31e
> +		>;
> +	};
> +
> +	pinctrl_pdm_sleep: pdmsleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_PDM_CLK__GPIO1_IO8			0x31e
> +			MX91_PAD_PDM_BIT_STREAM0__GPIO1_IO9		0x31e
> +			MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_RESET_B__GPIO3_IO7	0x31e
> +		>;
> +	};
> +
> +	pinctrl_sai1: sai1grp {
> +		fsl,pins = <
> +			MX91_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
> +			MX91_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
> +			MX91_PAD_SAI1_TXD0__SAI1_TX_DATA0		0x31e
> +			MX91_PAD_SAI1_RXD0__SAI1_RX_DATA0		0x31e
> +		>;
> +	};
> +
> +	pinctrl_sai1_sleep: sai1sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
> +			MX91_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
> +			MX91_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
> +			MX91_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
> +		>;
> +	};
> +
> +	pinctrl_sai3: sai3grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO26__SAI3_TX_SYNC		0x31e
> +			MX91_PAD_GPIO_IO16__SAI3_TX_BCLK		0x31e
> +			MX91_PAD_GPIO_IO17__SAI3_MCLK			0x31e
> +			MX91_PAD_GPIO_IO19__SAI3_TX_DATA0		0x31e
> +			MX91_PAD_GPIO_IO20__SAI3_RX_DATA0		0x31e
> +		>;
> +	};
> +
> +	pinctrl_sai3_sleep: sai3sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO26__GPIO2_IO26			0x51e
> +			MX91_PAD_GPIO_IO16__GPIO2_IO16			0x51e
> +			MX91_PAD_GPIO_IO17__GPIO2_IO17			0x51e
> +			MX91_PAD_GPIO_IO19__GPIO2_IO19			0x51e
> +			MX91_PAD_GPIO_IO20__GPIO2_IO20			0x51e
> +		>;
> +	};
> +
> +	pinctrl_spdif: spdifgrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO22__SPDIF_IN		0x31e
> +			MX91_PAD_GPIO_IO23__SPDIF_OUT		0x31e
> +		>;
> +	};
> +
> +	pinctrl_spdif_sleep: spdifsleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO22__GPIO2_IO22		0x31e
> +			MX91_PAD_GPIO_IO23__GPIO2_IO23		0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX91_PAD_UART1_RXD__LPUART1_RX			0x31e
> +			MX91_PAD_UART1_TXD__LPUART1_TX			0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart5: uart5grp {
> +		fsl,pins = <
> +			MX91_PAD_DAP_TDO_TRACESWO__LPUART5_TX	0x31e
> +			MX91_PAD_DAP_TDI__LPUART5_RX		0x31e
> +			MX91_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B	0x31e
> +			MX91_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B	0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD1_CLK__USDHC1_CLK		0x158e
> +			MX91_PAD_SD1_CMD__USDHC1_CMD		0x138e
> +			MX91_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
> +			MX91_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
> +			MX91_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
> +			MX91_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
> +			MX91_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
> +			MX91_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
> +			MX91_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
> +			MX91_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
> +			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD1_CLK__USDHC1_CLK		0x15fe
> +			MX91_PAD_SD1_CMD__USDHC1_CMD		0x13fe
> +			MX91_PAD_SD1_DATA0__USDHC1_DATA0	0x13fe
> +			MX91_PAD_SD1_DATA1__USDHC1_DATA1	0x13fe
> +			MX91_PAD_SD1_DATA2__USDHC1_DATA2	0x13fe
> +			MX91_PAD_SD1_DATA3__USDHC1_DATA3	0x13fe
> +			MX91_PAD_SD1_DATA4__USDHC1_DATA4	0x13fe
> +			MX91_PAD_SD1_DATA5__USDHC1_DATA5	0x13fe
> +			MX91_PAD_SD1_DATA6__USDHC1_DATA6	0x13fe
> +			MX91_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe
> +			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX91_PAD_SD1_CLK__USDHC1_CLK		0x1582
> +			MX91_PAD_SD1_CMD__USDHC1_CMD		0x1382
> +			MX91_PAD_SD1_DATA0__USDHC1_DATA0	0x1382
> +			MX91_PAD_SD1_DATA1__USDHC1_DATA1	0x1382
> +			MX91_PAD_SD1_DATA2__USDHC1_DATA2	0x1382
> +			MX91_PAD_SD1_DATA3__USDHC1_DATA3	0x1382
> +			MX91_PAD_SD1_DATA4__USDHC1_DATA4	0x1382
> +			MX91_PAD_SD1_DATA5__USDHC1_DATA5	0x1382
> +			MX91_PAD_SD1_DATA6__USDHC1_DATA6	0x1382
> +			MX91_PAD_SD1_DATA7__USDHC1_DATA7	0x1382
> +			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x1582
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK		0x158e
> +			MX91_PAD_SD2_CMD__USDHC2_CMD		0x138e
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK		0x15fe
> +			MX91_PAD_SD2_CMD__USDHC2_CMD		0x13fe
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0	0x13fe
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1	0x13fe
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2	0x13fe
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3	0x13fe
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CD_B__GPIO3_IO0		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CD_B__GPIO3_IO0		0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK		0x1582
> +			MX91_PAD_SD2_CMD__USDHC2_CMD		0x1382
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0	0x1382
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1	0x1382
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2	0x1382
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3	0x1382
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__GPIO3_IO1            0x51e
> +			MX91_PAD_SD2_CMD__GPIO3_IO2		0x51e
> +			MX91_PAD_SD2_DATA0__GPIO3_IO3		0x51e
> +			MX91_PAD_SD2_DATA1__GPIO3_IO4		0x51e
> +			MX91_PAD_SD2_DATA2__GPIO3_IO5		0x51e
> +			MX91_PAD_SD2_DATA3__GPIO3_IO6		0x51e
> +			MX91_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD3_CLK__USDHC3_CLK		0x158e
> +			MX91_PAD_SD3_CMD__USDHC3_CMD		0x138e
> +			MX91_PAD_SD3_DATA0__USDHC3_DATA0	0x138e
> +			MX91_PAD_SD3_DATA1__USDHC3_DATA1	0x138e
> +			MX91_PAD_SD3_DATA2__USDHC3_DATA2	0x138e
> +			MX91_PAD_SD3_DATA3__USDHC3_DATA3	0x138e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD3_CLK__USDHC3_CLK		0x15fe
> +			MX91_PAD_SD3_CMD__USDHC3_CMD		0x13fe
> +			MX91_PAD_SD3_DATA0__USDHC3_DATA0	0x13fe
> +			MX91_PAD_SD3_DATA1__USDHC3_DATA1	0x13fe
> +			MX91_PAD_SD3_DATA2__USDHC3_DATA2	0x13fe
> +			MX91_PAD_SD3_DATA3__USDHC3_DATA3	0x13fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX91_PAD_SD3_CLK__USDHC3_CLK		0x1582
> +			MX91_PAD_SD3_CMD__USDHC3_CMD		0x1382
> +			MX91_PAD_SD3_DATA0__USDHC3_DATA0	0x1382
> +			MX91_PAD_SD3_DATA1__USDHC3_DATA1	0x1382
> +			MX91_PAD_SD3_DATA2__USDHC3_DATA2	0x1382
> +			MX91_PAD_SD3_DATA3__USDHC3_DATA3	0x1382
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_sleep: usdhc3sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD3_CLK__GPIO3_IO20		0x31e
> +			MX91_PAD_SD3_CMD__GPIO3_IO21		0x31e
> +			MX91_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> +			MX91_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> +			MX91_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> +			MX91_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
> +		>;
> +	};
> +};
> -- 
> 2.34.1
> 

