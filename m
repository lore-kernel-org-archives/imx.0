Received: from finn.localdomain (finn.gateworks.com [108.161.129.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D0E287276;
	Mon,  2 Feb 2026 18:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=108.161.129.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770056937; cv=none; b=SFzYGq9ViGFKWiBfKKu5SXB+8M3vtZPsYeF90q/h4GmxZoj6MgUgp+Ol9SBLEsOOwLHRwZXjnU4skHw63m34udN8IWBw51lyoSkWhzoZAv75duIolmWEEbD2BYbTy6O/D+dDlapJNbgeHPEs9Jud1bxfzvuecFxTAut/8efUZaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770056937; c=relaxed/simple;
	bh=1t+Un9+Y9nYgUqRhtzCb1oZmQ6D9xn+kYMZRRrWSww4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K6M4UJeQGA84mTDhefc9ggm5DVxW6GUsK2r3aWEyk6W+Atrh56E6qQo+AV5T8AFvJOa9AN8iUMlYmsbNe2epr8dIg9FYMaVBnoIdxATNs9+iRpepwN4kU3I0+HkdbUkc5vm84uQJYmgYSj3HFAjO6T91jeWBzUXwDxhnENBWsiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; arc=none smtp.client-ip=108.161.129.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1vmyNc-00EkV2-RQ;
	Mon, 02 Feb 2026 18:10:33 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 2/2] arm64: dts: imx: Add i.mx8mm Gateworks GW7906 dts support
Date: Mon,  2 Feb 2026 10:10:29 -0800
Message-Id: <20260202181029.1832198-2-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202181029.1832198-1-tharvey@gateworks.com>
References: <20260202181029.1832198-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GW7906 is based on the i.MX8M Mini SoC featuring:
 - LPDDR4 DRAM
 - eMMC FLASH
 - microSD connector with UHS support
 - LIS2DE12 3-axis accelerometer
 - Gateworks System Controller
 - IMX8M FEC
 - software selectable RS232/RS485/RS422 serial transceiver
 - PMIC
 - 1x isolated RS232 UART
 - 1x off-board bi-directional opto-isolated digital I/O
 - 1x M.2 A-E Key Socket and 1x MiniPCIe socket with USB2.0 and PCIe
   (resistor loading to route PCIe/USB2 between M.2 and MiniPCIe socket)

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-venice-gw7906.dts    | 869 ++++++++++++++++++
 2 files changed, 870 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e60..83fc7faf81d8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -167,6 +167,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7906.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
new file mode 100644
index 000000000000..ec146a2b7549
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
@@ -0,0 +1,869 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Gateworks Corporation
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mm.dtsi"
+
+/ {
+	model = "Gateworks Venice GW7906 i.MX8MM board";
+	compatible = "gateworks,imx8mm-gw7906", "fsl,imx8mm";
+
+	aliases {
+		ethernet0 = &fec1;
+		rtc0 = &gsc_rtc;
+		rtc1 = &snvs_rtc;
+		usb0 = &usbotg1;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0x80000000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-user-pb {
+			label = "user_pb";
+			gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
+			linux,code = <BTN_0>;
+		};
+
+		key-user-pb1x {
+			label = "user_pb1x";
+			linux,code = <BTN_1>;
+			interrupt-parent = <&gsc>;
+			interrupts = <0>;
+		};
+
+		key-erased {
+			label = "key_erased";
+			linux,code = <BTN_2>;
+			interrupt-parent = <&gsc>;
+			interrupts = <1>;
+		};
+
+		key-eeprom-wp {
+			label = "eeprom_wp";
+			linux,code = <BTN_3>;
+			interrupt-parent = <&gsc>;
+			interrupts = <2>;
+		};
+
+		switch-hold {
+			label = "switch_hold";
+			linux,code = <BTN_5>;
+			interrupt-parent = <&gsc>;
+			interrupts = <7>;
+		};
+	};
+
+	led-controller {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led-0 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_RED>;
+			label = "led01_red";
+			gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-1 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			label = "led01_grn";
+			gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-2 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_RED>;
+			label = "led02_red";
+			gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-3 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			label = "led02_grn";
+			gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-4 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_RED>;
+			label = "led03_red";
+			gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-5 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			label = "led03_grn";
+			gpios = <&gpio5 3 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-6 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_RED>;
+			label = "led04_red";
+			gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-7 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			label = "led04_grn";
+			gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-8 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_RED>;
+			label = "led05_red";
+			gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-9 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			label = "led05_grn";
+			gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-a {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_RED>;
+			label = "led06_red";
+			gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-b {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			label = "led06_grn";
+			gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2>;
+};
+
+&ddrc {
+	operating-points-v2 = <&ddrc_opp_table>;
+
+	ddrc_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-25000000 {
+			opp-hz = /bits/ 64 <25000000>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+		};
+
+		opp-750000000 {
+			opp-hz = /bits/ 64 <750000000>;
+		};
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy0>;
+	local-mac-address = [00 00 00 00 00 00];
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			rx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_AMBER>;
+					function = LED_FUNCTION_LAN;
+					default-state = "keep";
+				};
+
+				led@2 {
+					reg = <2>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					default-state = "keep";
+				};
+			};
+		};
+	};
+};
+
+&gpio1 {
+	gpio-line-names = "", "", "", "", "", "", "", "",
+		"", "", "rs422_en#", "rs485_en#", "rs232_en#", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio2 {
+	gpio-line-names = "", "", "", "", "", "", "dig1_ctl", "",
+		"dig1_out#", "dig1_in", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio5 {
+	gpio-line-names = "", "", "", "", "", "", "", "",
+		"", "", "", "", "pci_wdis#", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	gsc: gsc@20 {
+		compatible = "gw,gsc";
+		reg = <0x20>;
+		pinctrl-0 = <&pinctrl_gsc>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		adc {
+			compatible = "gw,gsc-adc";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			channel@6 {
+				gw,mode = <0>;
+				reg = <0x06>;
+				label = "temp";
+			};
+
+			channel@8 {
+				gw,mode = <3>;
+				reg = <0x08>;
+				label = "vdd_bat";
+			};
+
+			channel@82 {
+				gw,mode = <2>;
+				reg = <0x82>;
+				label = "vin";
+				gw,voltage-divider-ohms = <22100 1000>;
+				gw,voltage-offset-microvolt = <700000>;
+			};
+
+			channel@84 {
+				gw,mode = <2>;
+				reg = <0x84>;
+				label = "vdd_5p0";
+				gw,voltage-divider-ohms = <10000 10000>;
+			};
+
+			channel@86 {
+				gw,mode = <2>;
+				reg = <0x86>;
+				label = "vdd_3p3";
+				gw,voltage-divider-ohms = <10000 10000>;
+			};
+
+			channel@88 {
+				gw,mode = <2>;
+				reg = <0x88>;
+				label = "vdd_0p9";
+			};
+
+			channel@8c {
+				gw,mode = <2>;
+				reg = <0x8c>;
+				label = "vdd_soc";
+			};
+
+			channel@8e {
+				gw,mode = <2>;
+				reg = <0x8e>;
+				label = "vdd_arm";
+			};
+
+			channel@90 {
+				gw,mode = <2>;
+				reg = <0x90>;
+				label = "vdd_1p8";
+			};
+
+			channel@92 {
+				gw,mode = <2>;
+				reg = <0x92>;
+				label = "vdd_dram";
+			};
+
+			channel@a2 {
+				gw,mode = <2>;
+				reg = <0xa2>;
+				label = "vdd_gsc";
+				gw,voltage-divider-ohms = <10000 10000>;
+			};
+		};
+	};
+
+	gpio: gpio@23 {
+		compatible = "nxp,pca9555";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gsc>;
+		interrupts = <4>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c02";
+		reg = <0x51>;
+		pagesize = <16>;
+	};
+
+	eeprom@52 {
+		compatible = "atmel,24c02";
+		reg = <0x52>;
+		pagesize = <16>;
+	};
+
+	eeprom@53 {
+		compatible = "atmel,24c02";
+		reg = <0x53>;
+		pagesize = <16>;
+	};
+
+	gsc_rtc: rtc@68 {
+		compatible = "dallas,ds1672";
+		reg = <0x68>;
+	};
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
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		rohm,reset-snvs-powered;
+		#clock-cells = <0>;
+		clocks = <&osc_32k>;
+		clock-output-names = "clk-32k-out";
+
+		regulators {
+			/* vdd_soc: 0.805-0.900V (typ=0.8V) */
+			BUCK1 {
+				regulator-name = "buck1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+			};
+
+			/* vdd_arm: 0.805-1.0V (typ=0.9V) */
+			buck2: BUCK2 {
+				regulator-name = "buck2";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <1000000>;
+				rohm,dvs-idle-voltage = <900000>;
+			};
+
+			/* vdd_0p9: 0.805-1.0V (typ=0.9V) */
+			BUCK3 {
+				regulator-name = "buck3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* vdd_3p3 */
+			BUCK4 {
+				regulator-name = "buck4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* vdd_1p8 */
+			BUCK5 {
+				regulator-name = "buck5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* vdd_dram */
+			BUCK6 {
+				regulator-name = "buck6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* nvcc_snvs_1p8 */
+			LDO1 {
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* vdd_snvs_0p8 */
+			LDO2 {
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* vdda_1p8 */
+			LDO3 {
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO4 {
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO6 {
+				regulator-name = "ldo6";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
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
+
+	accelerometer@19 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_accel>;
+		compatible = "st,lis2de12";
+		reg = <0x19>;
+		st,drdy-int-pin = <1>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&pcie_phy {
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	fsl,clkreq-unsupported;
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	status = "okay";
+};
+
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie0>;
+	reset-gpio = <&gpio5 11 GPIO_ACTIVE_LOW>;
+	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
+		 <&clk IMX8MM_CLK_PCIE1_AUX>;
+	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
+			  <&clk IMX8MM_CLK_PCIE1_CTRL>;
+	assigned-clock-rates = <10000000>, <250000000>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
+				 <&clk IMX8MM_SYS_PLL2_250M>;
+	status = "okay";
+};
+
+&disp_blk_ctrl {
+	status = "disabled";
+};
+
+&pgc_mipi {
+	status = "disabled";
+};
+
+/* console */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	disable-over-current;
+	status = "okay";
+};
+
+/* microSD */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_3p3v>;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	assigned-clocks = <&clk IMX8MM_CLK_USDHC3>;
+	assigned-clock-rates = <400000000>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x40000041 /* RS422# */
+			MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x40000041 /* RS485# */
+			MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12	0x40000041 /* RS232# */
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9	0x40000041 /* DIG1_IN */
+			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x40000041 /* DIG1_OUT */
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x40000041 /* DIG1_CTL */
+			MX8MM_IOMUXC_ECSPI2_MISO_GPIO5_IO12	0x40000041 /* PCI_WDIS# */
+		>;
+	};
+
+	pinctrl_accel: accelgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x159
+		>;
+	};
+
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
+			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x3
+			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1f
+			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1f
+			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1f
+			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1f
+			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
+			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
+			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
+			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x0
+			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
+			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_SAI2_TXFS_GPIO4_IO24		0x19 /* IRQ# */
+			MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25		0x19 /* RST# */
+		>;
+	};
+
+	pinctrl_gsc: gscgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26	0x159
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_GPIO5_IO14	0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_GPIO5_IO15	0x400001c3
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C2_SCL_GPIO5_IO16	0x400001c3
+			MX8MM_IOMUXC_I2C2_SDA_GPIO5_IO17	0x400001c3
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18	0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19	0x400001c3
+		>;
+	};
+
+	pinctrl_gpio_leds: gpioledgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5	0x19
+			MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30	0x19
+			MX8MM_IOMUXC_SAI3_MCLK_GPIO5_IO2	0x19
+			MX8MM_IOMUXC_GPIO1_IO14_GPIO1_IO14	0x19
+			MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9	0x19
+			MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3		0x19
+			MX8MM_IOMUXC_SAI3_RXC_GPIO4_IO29	0x19
+			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28	0x19
+			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x19
+			MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31	0x19
+			MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4		0x19
+			MX8MM_IOMUXC_GPIO1_IO08_GPIO1_IO8	0x19
+		>;
+	};
+
+	pinctrl_pcie0: pciegrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ECSPI2_MOSI_GPIO5_IO11	0x41
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_DATA02_GPIO3_IO8	0x41
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
+			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12	0x1c4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT  0x1d0
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x190
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK	0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x194
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK	0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x196
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0xc6
+		>;
+	};
+};
-- 
2.25.1

