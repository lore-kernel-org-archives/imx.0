Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D822DEA89
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 21:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767130458; cv=none; b=ifdXeo05v9vqgO6fpIesf+JDSTJq1QUTOHKGk61UWkvXFLgF+mw7Q+5Bxu/QmfUqbjtHDkVs1NbH0SBMYgNcXWqvjgrWA6H/oaL+v6ZfsKftpZOFGmsa8gmsyujhY+DI00uOuFyGPJp4bpLnazgbSbGheKwQikfSca1sjjnl/8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767130458; c=relaxed/simple;
	bh=4HWwbuqEUef/J5VEBzwF2MJlwZ3k+q9Lt9vb455fQ/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDjbwc7JzCm2paeZ8F1qUtq5dGYvAh0j+C7KAOyoZS7GYW9Bv/x3Iqh6Onwiff/aRBsQpi2Odj9Xirw7BQ1r0saUPj4dIwaa/8Ax1fOh26BboH5v4BPPM3aY9BYuaYAyd2Htyq617E9Tem5LQZ2OsLv0fRLsQ3TuPNWn1nuVFIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=BZxNHsaq; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="BZxNHsaq"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57ABA10CCB6;
	Tue, 30 Dec 2025 22:34:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767130452; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zR/W4Mel/czflcqoOSpjHMOazNPnFJTj9W/suYbxztw=;
	b=BZxNHsaqvvX/nDeMnwBg29xkJ+x7J//jzCQ/ogME3DmlnvDt+D+1zNh+L6MMGsZP+kmTxR
	JbO2VTUG5ZPGJ4yFBRuvRRyZcxY+L0YbSGQphe6pc2Gy8scODDqgSXgM3LzUL9Vdme5du0
	yrxJbOX+zsRvfYYKfrP0q4nq23NbtIuGz8w4hqwPyIk3m0eOtkl6XzyADrjXRumzAFgPUw
	yIojHZ9plSuyR8JWuZA0jRT3P1xGb8QmwwMsQyrD/bKP/A3txf6TxcFc3dGJWMKsOT03Sy
	dEL58TIU3BlcSP2fnNpUdVSInSOwrwSEaxPG1QrhtOtTEpDusGoGTVZnkEzcOw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Fedor Ross <fedor.ross@ifm.com>,
	Marek Vasut <marex@nabladev.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and v2
Date: Tue, 30 Dec 2025 22:32:34 +0100
Message-ID: <20251230213401.219808-4-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251230213401.219808-1-marex@nabladev.com>
References: <20251230213401.219808-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Fedor Ross <fedor.ross@ifm.com>

Add support for ifm i.MX8MN VHIP4 EvalBoard v1 and v2 reference design.
This system exists in two generations, v1 and v2, which share a lot of
commonality. The boards come with either single gigabit ethernet or an
KSZ8794 fast-ethernet switch, boot from eMMC, and offer CAN interfaces
via Microchip MCP25xx SPI CAN controllers, UART, and USB host. The GPU
is not available in the SoC populated on these devices.

Signed-off-by: Fedor Ross <fedor.ross@ifm.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: - Drop snvs-lpgpr node in favor of separate patch to imx8mn.dtsi
    - Sort properties and update newlines according to V1 feedback
V3: - Drop fsl,magic-packet
V4: - Switch USB hub to compatible = "usb424,2512", "usb424,2514"
    - Use temperature-sensor@48 for temperature sensor node names
    - Sort pinctrl_gpio_5 iomux node
---
 arch/arm64/boot/dts/freescale/Makefile        |  19 +
 .../imx8mn-vhip4-evalboard-common.dtsi        | 398 ++++++++++++++++++
 ...imx8mn-vhip4-evalboard-ksz8794-common.dtsi |  98 +++++
 ...mn-vhip4-evalboard-v1-overlay-ksz8794.dtso |  24 ++
 ...mn-vhip4-evalboard-v1-overlay-ksz9031.dtso |  48 +++
 .../freescale/imx8mn-vhip4-evalboard-v1.dts   | 258 ++++++++++++
 ...n-vhip4-evalboard-v2-overlay-adin1300.dtso |  60 +++
 ...mn-vhip4-evalboard-v2-overlay-ksz8794.dtso |  24 ++
 .../freescale/imx8mn-vhip4-evalboard-v2.dts   | 221 ++++++++++
 9 files changed, 1150 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-ksz8794-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0c..01b2ec5ad81ff 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -191,6 +191,25 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-venice-gw7902.dtb
 
+imx8mn-vhip4-evalboard-v1-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
+						  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtbo
+imx8mn-vhip4-evalboard-v1-overlay-ksz9031-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
+						  imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtbo
+imx8mn-vhip4-evalboard-v2-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
+						  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo
+imx8mn-vhip4-evalboard-v2-overlay-adin1300-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
+						   imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mn-vhip4-evalboard-v1.dtb \
+			  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtb \
+			  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtbo \
+			  imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtb \
+			  imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtbo \
+			  imx8mn-vhip4-evalboard-v2.dtb \
+			  imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtb \
+			  imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtbo \
+			  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtb \
+			  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo
+
 imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtbo
 imx8mn-tqma8mqnl-mba8mx-usbotg-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8mqnl-mba8mx-usbotg.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-common.dtsi
new file mode 100644
index 0000000000000..a9506ecf9647b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-common.dtsi
@@ -0,0 +1,398 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2020-2024 Fedor Ross <fedor.ross@ifm.com>
+ */
+
+#include "imx8mn.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "ifm i.MX8MNano VHIP4 Evaluation Board";
+	compatible = "ifm,imx8mn-vhip4-evalboard", "ifm,imx8mn-vhip4", "fsl,imx8mn";
+
+	aliases {
+		mmc0 = &usdhc3;
+		mmc1 = &usdhc1;
+		mmc2 = &usdhc2;
+		rtc0 = &hw_rtc;
+		rtc1 = &snvs_rtc;
+	};
+
+	chosen {
+		bootargs = "console=ttymxc2,115200 earlycon=ec_imx6q,0x30880000,115200 rootwait";
+		stdout-path = &uart3;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0x40000000>;
+	};
+
+	can_clk20m: can-clk20m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <20000000>;
+	};
+
+	can_clk40m: can-clk40m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&pinctrl_gpio_button>;
+		pinctrl-names = "default";
+
+		button-2 {
+			label = "Button2";
+			gpios = <&gpio2 16 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_2>;
+		};
+
+		button-3 {
+			label = "Button3";
+			gpios = <&gpio2 18 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+		};
+	};
+
+	ifm_led: led {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&pinctrl_gpio_led>;
+		pinctrl-names = "default", "extended";
+
+		led-0 {
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			color = <LED_COLOR_ID_YELLOW>;
+			gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-1 {
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio2 15 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2_reg>;
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
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+		};
+	};
+};
+
+&ecspi1 {
+	pinctrl-names = "default", "cs";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	pinctrl-1 = <&pinctrl_ecspi1_cs>;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
+};
+
+&ecspi3 {
+	pinctrl-names = "default", "cs";
+	pinctrl-0 = <&pinctrl_ecspi3>;
+	pinctrl-1 = <&pinctrl_ecspi3_cs>;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
+};
+
+&gpu {
+	/* SoC has GPU fused off. */
+	status = "disabled";
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+
+	hw_rtc: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+
+	ifm_pmic: pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-0 = <&pinctrl_pmic>;
+		rohm,reset-snvs-powered;
+
+		regulators {
+			buck1_reg: BUCK1 {
+				regulator-name = "buck1";
+				regulator-min-microvolt = <790000>;
+				regulator-max-microvolt = <860000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "buck2";
+				regulator-min-microvolt = <840000>;
+				regulator-max-microvolt = <960000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+			};
+
+			buck3_reg: BUCK3 {
+				// BUCK5 in datasheet
+				regulator-name = "buck3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+			};
+
+			buck4_reg: BUCK4 {
+				// BUCK6 in datasheet
+				regulator-name = "buck4";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5_reg: BUCK5 {
+				// BUCK7 in datasheet
+				regulator-name = "buck5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6_reg: BUCK6 {
+				// BUCK8 in datasheet
+				regulator-name = "buck6";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1_reg: LDO1 {
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			ldo5_reg: LDO5 {
+				regulator-name = "ldo5";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo6_reg: LDO6 {
+				regulator-name = "ldo6";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_ecspi1: ecspi1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x110
+			MX8MN_IOMUXC_ECSPI1_MOSI_ECSPI1_MOSI		0x110
+			MX8MN_IOMUXC_ECSPI1_MISO_ECSPI1_MISO		0x190
+		>;
+	};
+
+	pinctrl_ecspi3: ecspi3-grp {
+		fsl,pins = <
+			/* SPI3_CAN_CLK */
+			MX8MN_IOMUXC_UART1_RXD_ECSPI3_SCLK		0x110
+			/* SPI3_CAN_MOSI */
+			MX8MN_IOMUXC_UART1_TXD_ECSPI3_MOSI		0x110
+			/* SPI3_CAN_MISO */
+			MX8MN_IOMUXC_UART2_RXD_ECSPI3_MISO		0x190
+		>;
+	};
+
+	pinctrl_gpio_button: gpiobutton-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_DATA1_GPIO2_IO16		0x96
+			MX8MN_IOMUXC_SD2_DATA3_GPIO2_IO18		0x96
+		>;
+	};
+
+	pinctrl_gpio_led: gpioled-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_GPIO2_IO13			0x116
+			MX8MN_IOMUXC_SD2_DATA0_GPIO2_IO15		0x116
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x40000110
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
+			MX8MN_IOMUXC_NAND_READY_B_USDHC3_RESET_B	0x150
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x40000114
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
+			MX8MN_IOMUXC_NAND_READY_B_USDHC3_RESET_B	0x150
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x40000116
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
+			MX8MN_IOMUXC_NAND_READY_B_USDHC3_RESET_B	0x150
+		>;
+	};
+
+	pinctrl_wdog: wdog-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x64
+		>;
+	};
+};
+
+&pgc_gpumix {
+	/* SoC has GPU fused off. */
+	status = "disabled";
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+&uart3 { /* console */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	status = "okay";
+};
+
+&usbotg1 {
+	status = "okay";
+};
+
+&usdhc3 {
+	assigned-clocks = <&clk IMX8MN_CLK_USDHC3_ROOT>;
+	assigned-clock-rates = <400000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-ksz8794-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-ksz8794-common.dtsi
new file mode 100644
index 0000000000000..c1a98ec2f4382
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-ksz8794-common.dtsi
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2025 Fedor Ross <fedor.ross@ifm.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx8mn-pinfunc.h"
+
+&ecspi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	ksz8794: ethernet-switch@1 {
+		compatible = "microchip,ksz8794";
+		pinctrl-names = "default", "reset";
+		pinctrl-0 = <&pinctrl_ks8794>;
+		pinctrl-1 = <&pinctrl_ks8794>;
+		reg = <1>;
+		reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <5000000>;
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				label = "lan1";
+			};
+
+			port@1 {
+				reg = <1>;
+				label = "lan2";
+			};
+
+			port@2 {
+				reg = <2>;
+				label = "lan3";
+			};
+
+			port@4 {
+				reg = <4>;
+				label = "cpu";
+				ethernet = <&fec1>;
+				phy-mode = "rgmii-id";
+				rx-internal-delay-ps = <2000>;
+				tx-internal-delay-ps = <2000>;
+				fixed-link {
+					full-duplex;
+					speed = <1000>;
+				};
+			};
+		};
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	fixed-link {
+		full-duplex;
+		speed = <1000>;
+	};
+};
+
+&iomuxc {
+	pinctrl_fec1: fec1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_ENET_MDC_ENET1_MDC			0x16
+			MX8MN_IOMUXC_ENET_MDIO_ENET1_MDIO		0x96
+			MX8MN_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x16
+			MX8MN_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x16
+			MX8MN_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x16
+			MX8MN_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x16
+			MX8MN_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x96
+			MX8MN_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x96
+			MX8MN_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x96
+			MX8MN_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x96
+			MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x10
+			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x96
+			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x96
+			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x16
+			MX8MN_IOMUXC_SAI3_TXFS_GPIO4_IO31		0x1d6
+		>;
+	};
+
+	pinctrl_ks8794: ks8794-grp {
+		fsl,pins = <
+			/* KSZ8794 reset line */
+			MX8MN_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x16
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtso
new file mode 100644
index 0000000000000..20eb427f3dd66
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2021 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx8mn-pinfunc.h"
+
+&pinctrl_ecspi1 {
+	fsl,pins = <
+		MX8MN_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x10
+		MX8MN_IOMUXC_ECSPI1_MOSI_ECSPI1_MOSI		0x10
+		MX8MN_IOMUXC_ECSPI1_MISO_ECSPI1_MISO		0x90
+		/* KS8794 nCS */
+		MX8MN_IOMUXC_I2C4_SDA_GPIO5_IO21		0x150
+		/* ANV32C81 nCS */
+		MX8MN_IOMUXC_ECSPI1_SS0_GPIO5_IO9		0x150
+	>;
+};
+
+#include "imx8mn-vhip4-evalboard-ksz8794-common.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtso
new file mode 100644
index 0000000000000..de24206106b3b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtso
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2021 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mn-pinfunc.h"
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_fec1: fec1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_ENET_MDC_ENET1_MDC			0x16
+			MX8MN_IOMUXC_ENET_MDIO_ENET1_MDIO		0x96
+			MX8MN_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x16
+			MX8MN_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x16
+			MX8MN_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x16
+			MX8MN_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x16
+			MX8MN_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x96
+			MX8MN_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x96
+			MX8MN_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x96
+			MX8MN_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x96
+			MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x16
+			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x96
+			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x96
+			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x16
+			MX8MN_IOMUXC_SAI3_TXFS_GPIO4_IO31		0x1d6
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
new file mode 100644
index 0000000000000..5f37065bf43f3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2020-2024 Fedor Ross <fedor.ross@ifm.com>
+ */
+
+/dts-v1/;
+
+#include "imx8mn-vhip4-evalboard-common.dtsi"
+
+/ {
+	model = "ifm i.MX8MNano VHIP4 Evaluation Board v1";
+	compatible = "ifm,imx8mn-vhip4-evalboard-v1", "ifm,imx8mn-vhip4-evalboard",
+		     "ifm,imx8mn-vhip4", "fsl,imx8mn";
+};
+
+&ifm_led {
+	pinctrl-1 = <&pinctrl_gpio_led_v1>;
+
+	led-2 {
+		function = LED_FUNCTION_STATUS;
+		function-enumerator = <3>;
+		color = <LED_COLOR_ID_YELLOW>;
+		gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
+		default-state = "keep";
+	};
+
+	led-3 {
+		function = LED_FUNCTION_STATUS;
+		function-enumerator = <4>;
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		default-state = "keep";
+	};
+};
+
+&ecspi1 {
+	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>, <&gpio5 21 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	eeprom@0 {
+		compatible = "anvo,anv32c81w", "atmel,at25";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		spi-cpha;
+		spi-cpol;
+		pagesize = <1>;
+		size = <32768>;
+		address-width = <16>;
+	};
+};
+
+&ecspi3 {
+	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>, <&gpio5 4 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	can0: can@0 {
+		compatible = "microchip,mcp25625";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mcp25625>;
+		reg = <0>;
+		clocks = <&can_clk20m>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	can1: can@1 {
+		compatible = "microchip,mcp2518fd";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mcp2518>;
+		reg = <1>;
+		clocks = <&can_clk40m>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		microchip,rx-int-gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&i2c1 {
+	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 15 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	temperature-sensor@48 {
+		compatible = "national,lm75";
+		reg = <0x48>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 17 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&i2c3 {
+	scl-gpios = <&gpio2 10 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&ifm_pmic {
+	interrupt-parent = <&gpio2>;
+	interrupts = <0 GPIO_ACTIVE_LOW>;
+};
+
+&iomuxc {
+	pinctrl_ecspi1_cs: ecspi1-cs-grp {
+		fsl,pins = <
+			/* KS8794 nCS */
+			MX8MN_IOMUXC_I2C4_SDA_GPIO5_IO21		0x150
+			/* ANV32C81 nCS */
+			MX8MN_IOMUXC_ECSPI1_SS0_GPIO5_IO9		0x150
+		>;
+	};
+
+	pinctrl_ecspi3_cs: ecspi3-cs-grp {
+		fsl,pins = <
+			/* MCP25625 nCS */
+			MX8MN_IOMUXC_UART2_TXD_GPIO5_IO25		0x150
+			/* MCP2518FD nCS */
+			MX8MN_IOMUXC_SPDIF_RX_GPIO5_IO4			0x150
+		>;
+	};
+
+	pinctrl_gpio_5: gpio5-grp {
+		fsl,pins = <
+			/* CFG_EEPROM_WP */
+			MX8MN_IOMUXC_I2C4_SCL_GPIO5_IO20		0x140
+		>;
+	};
+
+	pinctrl_gpio_led_v1: gpioled-v1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_DATA2_GPIO2_IO17		0x116
+			MX8MN_IOMUXC_SD2_RESET_B_GPIO2_IO19		0x116
+		>;
+	};
+
+	pinctrl_i2c1: i2c1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x40000056
+			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA			0x400000d6
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1-gpio-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C1_SCL_GPIO5_IO14		0x56
+			MX8MN_IOMUXC_I2C1_SDA_GPIO5_IO15		0xd6
+		>;
+	};
+
+	pinctrl_i2c2: i2c2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C2_SCL_I2C2_SCL			0x40000056
+			MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA			0x400000d6
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2-gpio-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C2_SCL_GPIO5_IO16		0x56
+			MX8MN_IOMUXC_I2C2_SDA_GPIO5_IO17		0xd6
+		>;
+	};
+
+	pinctrl_i2c3: i2c3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD1_RESET_B_I2C3_SCL		0x40000056
+			MX8MN_IOMUXC_SD1_STROBE_I2C3_SDA		0x400000d6
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3-gpio-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD1_RESET_B_GPIO2_IO10		0x56
+			MX8MN_IOMUXC_SD1_STROBE_GPIO2_IO11		0xd6
+		>;
+	};
+
+	pinctrl_mcp2518: mcp2518-grp {
+		fsl,pins = <
+			/* MCP2518 nINT line */
+			MX8MN_IOMUXC_SAI3_MCLK_GPIO5_IO2		0x116
+			/* MCP2518 nINT1/GPIO1 line */
+			MX8MN_IOMUXC_SAI3_TXD_GPIO5_IO1			0x116
+		>;
+	};
+
+	pinctrl_mcp25625: mcp25625-grp {
+		fsl,pins = <
+			/* MCP25625 nINT line */
+			MX8MN_IOMUXC_SAI2_RXFS_GPIO4_IO21		0x156
+		>;
+	};
+
+	pinctrl_pmic: pmic-irq-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD1_CLK_GPIO2_IO0			0x16
+		>;
+	};
+
+	pinctrl_uart3: uart3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART3_RXD_UART3_DCE_RX		0x142
+			MX8MN_IOMUXC_UART3_TXD_UART3_DCE_TX		0x142
+		>;
+	};
+
+	pinctrl_usb_nreset: usbnreset-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SAI3_RXC_GPIO4_IO29                0x14a
+		>;
+	};
+
+	pinctrl_wdog: wdog-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x64
+		>;
+	};
+};
+
+&gpio5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_5>;
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "",
+		"ifm_device_info_eeprom_wp",
+		"", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&usbotg1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb_nreset>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	usb-hub@1 {
+		compatible = "usb424,2512", "usb424,2514";
+		reg = <1>;
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtso
new file mode 100644
index 0000000000000..6ad7434a1787e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtso
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 Fedor Ross <fedor.ross@ifm.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "imx8mn-pinfunc.h"
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			reg = <0>;
+
+			adi,rx-internal-delay-ps = <1800>;
+			adi,tx-internal-delay-ps = <2200>;
+			interrupts-extended = <&gpio4 31 IRQ_TYPE_LEVEL_LOW>;
+			reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_fec1: fec1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_ENET_MDC_ENET1_MDC			0x16
+			MX8MN_IOMUXC_ENET_MDIO_ENET1_MDIO		0x96
+			MX8MN_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x16
+			MX8MN_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x16
+			MX8MN_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x16
+			MX8MN_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x16
+			MX8MN_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x96
+			MX8MN_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x96
+			MX8MN_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x96
+			MX8MN_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x96
+			MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x16
+			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x96
+			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x96
+			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x16
+			/* nRST */
+			MX8MN_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x156
+			/* nIRQ */
+			MX8MN_IOMUXC_SAI3_TXFS_GPIO4_IO31		0x1d6
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtso
new file mode 100644
index 0000000000000..ab1304ebd965e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2021 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx8mn-pinfunc.h"
+
+&pinctrl_ecspi1 {
+	fsl,pins = <
+		MX8MN_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x10
+		MX8MN_IOMUXC_ECSPI1_MOSI_ECSPI1_MOSI		0x10
+		MX8MN_IOMUXC_ECSPI1_MISO_ECSPI1_MISO		0x90
+		/* KS8794 nCS */
+		MX8MN_IOMUXC_GPIO1_IO11_GPIO1_IO11		0x150
+		/* ANV32C81 nCS */
+		MX8MN_IOMUXC_ECSPI1_SS0_GPIO5_IO9		0x150
+	>;
+};
+
+#include "imx8mn-vhip4-evalboard-ksz8794-common.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
new file mode 100644
index 0000000000000..4dadfb7f78de2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 Fedor Ross <fedor.ross@ifm.com>
+ */
+
+/dts-v1/;
+
+#include "imx8mn-vhip4-evalboard-common.dtsi"
+
+/ {
+	model = "ifm i.MX8MNano VHIP4 Evaluation Board v2";
+	compatible = "ifm,imx8mn-vhip4-evalboard-v2", "ifm,imx8mn-vhip4-evalboard",
+		     "ifm,imx8mn-vhip4", "fsl,imx8mn";
+
+	multi-led {
+		compatible = "leds-group-multicolor";
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_INDICATOR;
+		leds = <&rgb_0>, <&rgb_1>, <&rgb_2>;
+	};
+};
+
+&ifm_led {
+	pinctrl-1 = <&pinctrl_gpio_led_v2>;
+
+	rgb_0: rgb-led-red {
+		color = <LED_COLOR_ID_RED>;
+		gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
+		default-state = "keep";
+	};
+
+	rgb_1: rgb-led-green {
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		default-state = "keep";
+	};
+
+	rgb_2: rgb-led-blue {
+		color = <LED_COLOR_ID_BLUE>;
+		gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+		default-state = "keep";
+	};
+};
+
+&ecspi1 {
+	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>, <&gpio1 11 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	eeprom@0 {
+		compatible = "fujitsu,mb85rs64", "atmel,at25";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		spi-cpha;
+		spi-cpol;
+		pagesize = <1>;
+		size = <32768>;
+		address-width = <16>;
+	};
+};
+
+&ecspi3 {
+	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	can0: can@0 {
+		compatible = "microchip,mcp2518fd";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mcp2518>;
+		reg = <0>;
+		clocks = <&can_clk40m>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+		microchip,rx-int-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&i2c1 {
+	scl-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp1075";
+		reg = <0x48>;
+	};
+
+	eeprom@54 {
+		compatible = "atmel,24c128";
+		reg = <0x54>;
+	};
+};
+
+&i2c3 {
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&ifm_pmic {
+	interrupt-parent = <&gpio5>;
+	interrupts = <17 GPIO_ACTIVE_LOW>;
+};
+
+&iomuxc {
+	pinctrl_ecspi1_cs: ecspi1-cs-grp {
+		fsl,pins = <
+			/* KS8794 nCS */
+			MX8MN_IOMUXC_GPIO1_IO11_GPIO1_IO11		0x150
+			/* Retain memory nCS (FRAM or MRAM) */
+			MX8MN_IOMUXC_ECSPI1_SS0_GPIO5_IO9		0x150
+			/* RETAIN_nHOLD */
+			MX8MN_IOMUXC_SPDIF_RX_GPIO5_IO4			0x140
+		>;
+	};
+
+	pinctrl_ecspi3_cs: ecspi3-cs-grp {
+		fsl,pins = <
+			/* MCP2518FD nCS */
+			MX8MN_IOMUXC_UART2_TXD_GPIO5_IO25		0x150
+		>;
+	};
+
+	pinctrl_gpio_led_v2: gpioled-v2-grp {
+		fsl,pins = <
+			/* LED_RGB_RED */
+			MX8MN_IOMUXC_SD2_DATA2_GPIO2_IO17		0x116
+			/* LED_RGB_GREEN */
+			MX8MN_IOMUXC_SD2_RESET_B_GPIO2_IO19		0x116
+			/* LED_RGB_BLUE */
+			MX8MN_IOMUXC_SD2_WP_GPIO2_IO20			0x116
+		>;
+	};
+
+	pinctrl_i2c1: i2c1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD1_DATA4_I2C1_SCL			0x40000056
+			MX8MN_IOMUXC_SD1_DATA5_I2C1_SDA			0x400000d6
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1-gpio-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD1_DATA4_GPIO2_IO6		0x56
+			MX8MN_IOMUXC_SD1_DATA5_GPIO2_IO7		0xd6
+			/* CFG_EEPROM_WP */
+			MX8MN_IOMUXC_SD1_STROBE_GPIO2_IO11		0x140
+			/* RTC_nIRQ */
+			MX8MN_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5		0x116
+			/* LOG_EE_WP */
+			MX8MN_IOMUXC_SPDIF_TX_GPIO5_IO3			0x140
+		>;
+	};
+
+	pinctrl_i2c3: i2c3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL			0x40000056
+			MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA			0x400000d6
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3-gpio-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C3_SCL_GPIO5_IO18		0x56
+			MX8MN_IOMUXC_I2C3_SDA_GPIO5_IO19		0xd6
+		>;
+	};
+
+	pinctrl_mcp2518: mcp2518-grp {
+		fsl,pins = <
+			/* CAN0_CLKO */
+			MX8MN_IOMUXC_GPIO1_IO00_GPIO1_IO0		0x116
+			/* CAN0_nINT0 */
+			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x116
+			/* CAN0_nINT1 */
+			MX8MN_IOMUXC_GPIO1_IO04_GPIO1_IO4		0x116
+			/* CAN0_nINT */
+			MX8MN_IOMUXC_GPIO1_IO01_GPIO1_IO1		0x116
+		>;
+	};
+
+	pinctrl_pmic: pmic-irq-grp {
+		fsl,pins = <
+			/* PMIC_nIRQ */
+			MX8MN_IOMUXC_I2C2_SDA_GPIO5_IO17		0x1d6
+		>;
+	};
+
+	pinctrl_uart3: uart3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD1_DATA6_UART3_DCE_TX		0x142
+			MX8MN_IOMUXC_SD1_DATA7_UART3_DCE_RX		0x142
+		>;
+	};
+
+	pinctrl_wdog: wdog-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x64
+		>;
+	};
+};
+
+&gpio2 {
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "",
+		"ifm_device_info_eeprom_wp",
+		"", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio5 {
+	gpio-line-names =
+		"", "", "",
+		"ifm_logging_eeprom_wp",
+		"", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "",	"", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
-- 
2.51.0

