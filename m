Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0473B8D48
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728754; cv=none; b=DzPRudbLt0bWVJKiKqB5iuaqoo51GaFRmPGP0AY3LaRpdDAj77N/wOwwAZwAUxTnf2FNioN4xi85miugdJPVcmasHlwUaD536r+BQV2xSZEJD9ywSMH+s27/dFp5BhXbyPW3NlfIw8fNkKRy7rvyOHe5TP1eFe/i0c5ZP35/MAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728754; c=relaxed/simple;
	bh=H/kwaQJn/seRIljnVWNhFs6KSn/x4JsjO6r4XmbyEak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZ3K4otQ7UEIcJK2/5zMaETgjjaGSE+JusmgqCdLU5zcVPQGYFSiitkVG56vEG3kN/GzuscdrffSVS9bV2ECEwnm2b/D3RH6d1nn5MzDIPJOmWRNRlbq2CLRBDZ3Nyl2bO6IHB2MxdzGeA4VMbiITfQ3iXbO/eqBfwm7Z+BrkHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Afj2JdAJ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Afj2JdAJ"
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 7313A20374;
	Thu,  9 Apr 2026 11:59:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775728750;
	bh=YRXhxiMdcV9E6STZeVzhXB2Y6uGvSTwnSvSng5/Orh4=; h=From:To:Subject;
	b=Afj2JdAJNnrNU7jTNWy0yvHjypfptX+uvV4bo0h9Eyd2USHro7I6VNcgZshMOkF1r
	 eu2GnI5IhnMAYzeif+EkOr5tkE5GoZX6NiwizQ7w51o1J6t6KZ25/0HcWV3VnxHd7O
	 DOqvTklJyLMuQRL4Oqh+ULAJq1Kh4Ua3ndzgEiHJAV1lKcKWP3/+MCkbOVscYtf4Qw
	 TxDAGLwMxUXG/n7IPUT6QwKl4pyq8LQxj9T2vC5Y62A+eqRcSypEeKaP0czEGTfrAm
	 Hx5COl0hGI5IAcOciwkgYH2lrG+EDMPxtRo5Ab2tU9J6GJkmwzFLstEXG40p0vYEiG
	 c/bWZ6r289lzA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 5/7] arm64: dts: freescale: imx8mp-verdin: Add Zinnia
Date: Thu,  9 Apr 2026 11:58:51 +0200
Message-ID: <20260409095855.61252-6-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409095855.61252-1-francesco@dolcini.it>
References: <20260409095855.61252-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add Zinnia Carrier Board mated with Verdin iMX8M Plus.

It features 1 x RS232, 1 x RS485, 1 x CAN, 3 x isolated digital I/O,
2 x GBit/s Ethernet, a mini PCIe slot with USB / SIM card connector
for a modem, USB and SD card interfaces.

Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../imx8mp-verdin-nonwifi-zinnia.dts          |  21 +
 .../freescale/imx8mp-verdin-wifi-zinnia.dts   |  21 +
 .../dts/freescale/imx8mp-verdin-zinnia.dtsi   | 422 ++++++++++++++++++
 4 files changed, 466 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-zinnia.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 072df4128716..c14ccf24210a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -347,11 +347,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-zinnia.dts b/arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-zinnia.dts
new file mode 100644
index 000000000000..e78b25d65c94
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-zinnia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx-8m-plus
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+/dts-v1/;
+
+#include "imx8mp-verdin.dtsi"
+#include "imx8mp-verdin-nonwifi.dtsi"
+#include "imx8mp-verdin-zinnia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX8M Plus on Zinnia";
+	compatible = "toradex,verdin-imx8mp-nonwifi-zinnia",
+		     "toradex,verdin-imx8mp-nonwifi",
+		     "toradex,verdin-imx8mp",
+		     "fsl,imx8mp";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-zinnia.dts b/arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-zinnia.dts
new file mode 100644
index 000000000000..85eb56524314
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-zinnia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx-8m-plus
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+/dts-v1/;
+
+#include "imx8mp-verdin.dtsi"
+#include "imx8mp-verdin-wifi.dtsi"
+#include "imx8mp-verdin-zinnia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX8M Plus WB on Zinnia";
+	compatible = "toradex,verdin-imx8mp-wifi-zinnia",
+		     "toradex,verdin-imx8mp-wifi",
+		     "toradex,verdin-imx8mp",
+		     "fsl,imx8mp";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-zinnia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-zinnia.dtsi
new file mode 100644
index 000000000000..6beb2f2f4548
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-zinnia.dtsi
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin IMX8MP SoM on Zinnia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx-8m-plus
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+
+/ {
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_zinnia_leds>;
+
+		/* LED1 Red - SODIMM 48 - LED1_R */
+		led-1 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED1 Blue - SODIMM 46 - LED1_B */
+		led-2 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&gpio5 01 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Red - SODIMM 44 - LED3_R */
+		led-3 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Green - SODIMM 54 - LED3_G */
+		led-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&gpio3 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Blue - SODIMM 36 - LED3_B */
+		led-5 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&gpio4 2 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Red - SODIMM 34 - LED4_R */
+		led-6 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&gpio3 19 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Green - SODIMM 32 - LED4_G */
+		led-7 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Blue - SODIMM 30 - LED4_B */
+		led-8 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&gpio3 25 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	zinnia-1v8-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <39000>; /* 12k + 27k */
+		/* Verdin ADC_4 */
+		io-channels = <&verdin_som_adc 4>;
+		output-ohms = <27000>;
+	};
+
+	zinnia-3v3-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <54000>; /* 27k + 27k */
+		/* Verdin ADC_3 */
+		io-channels = <&verdin_som_adc 5>;
+		output-ohms = <27000>;
+	};
+
+	zinnia-5v-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <39000>; /* 27k + 12k */
+		/* Verdin ADC_2 */
+		io-channels = <&verdin_som_adc 6>;
+		output-ohms = <12000>;
+	};
+
+	/* Zinnia Power Supply Input Voltage */
+	zinnia-input-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <204700>; /* 200k + 4.7k */
+		/* Verdin ADC_1 */
+		io-channels = <&verdin_som_adc 7>;
+		output-ohms = <4700>;
+	};
+};
+
+/* Verdin SPI_1 */
+&ecspi1 {
+	pinctrl-0 = <&pinctrl_ecspi1>, <&pinctrl_uart2_cts_gpio>;
+	cs-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>, <&gpio5 9 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+
+	tpm@1 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <1>;
+		spi-max-frequency = <18500000>;
+	};
+};
+
+/* EEPROM on Zinnia */
+&eeprom_carrier_board {
+	status = "okay";
+};
+
+/* Verdin ETH_1 */
+&eqos {
+	status = "okay";
+};
+
+/* Verdin ETH_2 */
+&fec {
+	phy-handle = <&ethphy2>;
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+&verdin_eth2_mdio {
+	ethphy2: ethernet-phy@2 {
+		reg = <2>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+/* Verdin CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+&gpio1 {
+	gpio-line-names =
+		"DO1_EN", /* 0 */ /* SODIMM 206 */
+		"DI1_EN", /* SODIMM 208 */
+		"",
+		"",
+		"",
+		"DI1_RB", /* SODIMM 210 */
+		"DO2_EN", /* SODIMM 212 */
+		"DI2_RB", /* SODIMM 216 */
+		"DI2_EN", /* SODIMM 218 */
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+&gpio2 {
+	gpio-line-names =
+		"", /* 0 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		""; /* 20 */
+};
+
+&gpio3 {
+	gpio-line-names =
+		"", /* 0 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"DI3_RB", /* SODIMM 56 */
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+&gpio4 {
+	gpio-line-names =
+		"", /* 0 */
+		"DI3_EN", /* SODIMM 222 */
+		"",
+		"DO3_EN", /* SODIMM 220 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 30 */
+		"";
+};
+
+&gpio5 {
+	gpio-line-names =
+		"", /* 0 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+/* Temperature sensor on Zinnia */
+&hwmon_temp {
+	compatible = "ti,tmp1075";
+
+	status = "okay";
+};
+
+/* Verdin I2C_1 */
+&i2c4 {
+	status = "okay";
+};
+
+/* Verdin UART_1 */
+&uart1 {
+	status = "okay";
+};
+
+/* Verdin UART_2 */
+&uart2 {
+	pinctrl-0 = <&pinctrl_uart2>, <&pinctrl_uart2_rts>;
+	linux,rs485-enabled-at-boot-time;
+	rs485-rx-during-tx;
+
+	status = "okay";
+};
+
+/* Verdin UART_3 */
+&uart3 {
+	status = "okay";
+};
+
+/* Verdin USB_1 */
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_phy0 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usb3_1 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
+/* Verdin SD_1 */
+&usdhc2 {
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio1>,
+		    <&pinctrl_gpio2>,
+		    <&pinctrl_gpio3>,
+		    <&pinctrl_gpio4>,
+		    <&pinctrl_gpio5>,
+		    <&pinctrl_gpio6>,
+		    <&pinctrl_gpio7>,
+		    <&pinctrl_gpio8>,
+		    <&pinctrl_qspi1_io0_gpio>;
+
+	pinctrl_uart2_cts_gpio: gpio2io6grp {
+		fsl,pins = <MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x184>;	/* SODIMM 143 */
+	};
+
+	pinctrl_qspi1_io0_gpio: gpio3io6grp {
+		fsl,pins = <MX8MP_IOMUXC_NAND_DATA00__GPIO3_IO06	0x184>;	/* SODIMM 56 */
+	};
+
+	pinctrl_zinnia_leds: zinnialedsgrp {
+		fsl,pins =
+			<MX8MP_IOMUXC_SAI5_MCLK__GPIO3_IO25	0x16>, /* SODIMM 30 */
+			<MX8MP_IOMUXC_SAI5_RXD1__GPIO3_IO22	0x16>, /* SODIMM 32 */
+			<MX8MP_IOMUXC_SAI5_RXFS__GPIO3_IO19	0x16>, /* SODIMM 34 */
+			<MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02	0x16>, /* SODIMM 36 */
+			<MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31	0x16>, /* SODIMM 44 */
+			<MX8MP_IOMUXC_SAI3_TXD__GPIO5_IO01	0x16>, /* SODIMM 46 */
+			<MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30	0x16>, /* SODIMM 48 */
+			<MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01	0x16>; /* SODIMM 54 */
+	};
+};
-- 
2.47.3

