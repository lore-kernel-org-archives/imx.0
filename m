Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E51A28689
	for <imx@lists.linux.dev>; Wed, 25 Oct 2023 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ckZ8pbaN"
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66621EF2;
	Wed, 25 Oct 2023 18:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698252643;
	bh=n46aDGyBMVgE8EMTAAnCD5NsJPIqdgQX4fW86Kp1V6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ckZ8pbaN6QxzlOR9AogBA6O+I5uX+No1YwMqcRsz6xbr6J/OG3AlYi0jEBIJN72xp
	 fD7Jq28nqtn8liR5Dg3cbtg+L/z1p3RN/TGhw54zAZ3TGPGGw0DEBXvf7SK3ubc4Jh
	 37NOZzud4NNT7t6yR0OuxRwCT4ZXJv0c7AYT1Zog=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Marco Contenti <marco.c@variscite.com>,
	Nate Drude <nate.d@variscite.com>,
	FrancescoFerraro <francesco.f@variscite.com>,
	Harshesh Valera <harshesh.v@variscite.com>
Subject: [PATCH v2 3/4] arm64: dts: freescale: Add support for the Variscite i.MX8MP DART8MCustomBoard
Date: Wed, 25 Oct 2023 19:50:57 +0300
Message-ID: <20231025165058.31697-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025165058.31697-1-laurent.pinchart@ideasonboard.com>
References: <20231025165058.31697-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT8MCustomBoard is a carrier board for DART i.MX8-based modules.
This device tree file adds support for the DT8MCustomBoard v2.0 with a
connected DART-MX8M-PLUS module.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Make reg second property in touch@0 and can@1 nodes
- Drop unneeded status = "okay"
- Move status = "disabled" to end of node
- Rename can0-osc node with generic clock- prefix
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../imx8mp-var-dart-dt8mcustomboard-v2.dts    | 500 ++++++++++++++++++
 2 files changed, 501 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 89aee6c92576..19637302397f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -103,6 +103,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-dt8mcustomboard-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dts
new file mode 100644
index 000000000000..95eb80370a1a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dts
@@ -0,0 +1,500 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2019 NXP
+ * Copyright 2020-2021 Variscite Ltd.
+ * Copyright 2023 Ideas on Board Oy
+ */
+
+#include "imx8mp-var-dart.dtsi"
+
+/ {
+	compatible = "variscite,dart-mx8mp-dt8mcustomboard-v2",
+		     "variscite,dart-mx8mp",
+		     "fsl,imx8mp";
+	model = "Variscite DART-MX8M-PLUS on DT8MCustomBoard 2.x";
+
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	clk_can0: clock-can0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-back {
+			label = "BACK";
+			linux,code = <KEY_BACK>;
+			gpios = <&gpio_exp_1 7 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		key-up {
+			label = "UP";
+			linux,code = <KEY_UP>;
+			gpios = <&gpio_exp_1 5 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		key-home {
+			label = "HOME";
+			linux,code = <KEY_HOME>;
+			gpios = <&gpio_exp_1 4 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		key-down {
+			label = "DOWN";
+			linux,code = <KEY_DOWN>;
+			gpios = <&gpio_exp_1 6 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led1 {
+			label = "LED1";
+			gpios = <&gpio_exp_2 7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led2 {
+			label = "LED2";
+			gpios = <&gpio_exp_2 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led3 {
+			label = "LED3";
+			gpios = <&gpio_exp_2 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		led4 {
+			label = "LED4";
+			gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "mmc2";
+		};
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <100>;
+		off-on-delay-us = <12000>;
+	};
+};
+
+&ecspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	cs-gpios = <&gpio5  9 GPIO_ACTIVE_LOW>,
+		   <&gpio1 12 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	touch@0 {
+		compatible = "ti,tsc2046";
+		reg = <0>;
+
+		spi-max-frequency = <1500000>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+
+		interrupt-parent = <&gpio1>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+
+		pendown-gpio = <&gpio1 7 GPIO_ACTIVE_LOW>;
+		wakeup-source;
+
+		touchscreen-min-x = <125>;
+		touchscreen-min-y = <282>;
+		touchscreen-size-x = <4009>;
+		touchscreen-size-y = <3865>;
+		touchscreen-max-pressure = <255>;
+		touchscreen-average-samples = <10>;
+
+		ti,keep-vref-on;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+
+		status = "disabled";
+	};
+
+	can@1 {
+		compatible = "microchip,mcp2518fd";
+		reg = <1>;
+
+		spi-max-frequency = <20000000>;
+		clocks = <&clk_can0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+
+		interrupt-parent = <&gpio1>;
+		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
+
+		microchip,rx-int-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&eqos {
+	mdio {
+		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			eee-broken-1000t;
+			reset-gpios = <&gpio_exp_2 0 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <20000>;
+		};
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec>;
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy1>;
+	status = "okay";
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	status = "okay";
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	eeprom@54 {
+		compatible = "rohm,24c04", "atmel,24c04";
+		reg = <0x54>;
+		pagesize = <16>;
+	};
+
+	rtc@68 {
+		compatible = "isil,isl12057";	/* dallas,ds1337 on v3.0 */
+		reg = <0x68>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-source;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	gpio_exp_1: gpio@20 {
+		compatible = "ti,tca6408";	/* nxp,pcal6408 on v3.0 */
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pca6408>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio_exp_2: gpio@21 {
+		compatible = "ti,tca6408";	/* nxp,pcal6408 on v3.0 */
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+/* Reference voltage for eQOS PHY */
+&ldo4 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
+/* Console */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+/* Header */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+/* Header */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	fsl,permanently-attached;
+	fsl,disable-port-power-control;
+	status = "okay";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+/* SD card connector */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06				0x1c6
+			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x16
+		>;
+	};
+
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK				0x12
+			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI				0x12
+			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO				0x12
+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09				0x12
+			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12				0x12
+		>;
+	};
+
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0				0x90
+			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1				0x90
+			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2				0x90
+			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3				0x90
+			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC				0x90
+			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL			0x90
+			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0				0x00
+			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1				0x00
+			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2				0x00
+			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3				0x00
+			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL			0x00
+			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC				0x00
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_RXC__CAN1_TX					0x154
+			MX8MP_IOMUXC_SAI2_TXC__CAN1_RX					0x154
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_MCLK__CAN2_RX					0x154
+			MX8MP_IOMUXC_SAI2_TXD0__CAN2_TX					0x154
+		>;
+	};
+
+	pinctrl_gpio_leds: ledgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18				0xc6
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16				0x1c2
+			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17				0x1c2
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18				0x1c2
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20				0x1c2
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21				0x1c2
+		>;
+	};
+
+	pinctrl_pca6408: pca6408grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x1c6
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT				0x116
+		>;
+	};
+
+	pinctrl_restouch: restouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07				0xc0
+		>;
+	};
+
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15				0x1c0
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX				0x40
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX				0x40
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX				0x40
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART3_RXD__UART3_DCE_RX				0x40
+			MX8MP_IOMUXC_UART3_TXD__UART3_DCE_TX				0x40
+		>;
+	};
+
+	pinctrl_usb0: usb0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC				0x1c0
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12				0x1c4
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19				0x40
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK				0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD				0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0				0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1				0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2				0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3				0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT				0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK				0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD				0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0				0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1				0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2				0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3				0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT				0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK				0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD				0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0				0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1				0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2				0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3				0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT				0xc0
+		>;
+	};
+};
-- 
Regards,

Laurent Pinchart

