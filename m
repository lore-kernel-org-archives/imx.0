Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4E63B8BBB
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728752; cv=none; b=Vbd+dbUZRjy0/3PwXoYrGyEJkZ5Rbo5W65DSa043oNKeuWIiJI5xzaLT2cg/YWHj8aX+9VMi4o6MOUcrEVJdbBv8clV+tsO7qX5jXHv3515w3sVx7vPd5oLFAaPENcP5MAR8k4ruBWok9vZ1sEBT+ClbVNBPCzxmU2ISOx+ksco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728752; c=relaxed/simple;
	bh=j0WClbTZiaHT33x71GW4w2C7/rxjwAQDbh3tRs2GZDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3gwXXNnx6dIVAyqtt5RtOlF6aY+T9Y4xZqlmJ94TXe9AQENWXNHuEpghusp5k4WyqBKQUEa3PcK9eNXn+LOGM63dqUyizPN9/c835f9l9CUSQVIE/F2NkcW2Z/Shit5hh+BLEDikFVs9prHHnIbA1bOQ5Lqvr/lthBZlb06FRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=GO0SP8eV; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="GO0SP8eV"
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 159D620683;
	Thu,  9 Apr 2026 11:59:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775728748;
	bh=qZVl/p98xOhxNt0/2ZtCIi7x1GyMgkaFpFlLYO2xtkM=; h=From:To:Subject;
	b=GO0SP8eVC0KcMi42COj+d21QuaHC/f9qX75SIZMB2i3zWGGUeCkYyr30MsMNjqHMU
	 pLrOjGcy5z32P9PJRoYXqE4udUaDbfIoWk7l1tkAdnBR36BfMzxWOjh+BduCjECPmF
	 e0JF01TNV74rHYyq7XYpqmlUON5+IkY8A4JlMuys+mDuBk227fFzp88uBLYRnHBc/V
	 ckTgxgT8tHEuOYYvS8+F8KrPvBArgmP24vCu976E1aNkpKSA+QnIeFwf3Y8zQrt87u
	 nQR6V5dAU8wZkHhr3A0GLNrxFqF3Bt+BwEql5akUkcyDVRXbsstGwsDfcJWfYjGMM0
	 FiiKXRrFoLwiw==
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
Subject: [PATCH v1 3/7] arm64: dts: freescale: imx8mm-verdin: Add Zinnia
Date: Thu,  9 Apr 2026 11:58:49 +0200
Message-ID: <20260409095855.61252-4-francesco@dolcini.it>
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

Add Zinnia Carrier Board mated with Verdin iMX8M Mini.

It features 1 x RS232, 1 x RS485, 1 x CAN, 3 x isolated digital I/O,
1 x GBit/s Ethernet, a mini PCIe slot with USB / SIM card connector
for a modem, USB and SD card interfaces.

Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../imx8mm-verdin-nonwifi-zinnia.dts          |  21 +
 .../freescale/imx8mm-verdin-wifi-zinnia.dts   |  21 +
 .../dts/freescale/imx8mm-verdin-zinnia.dtsi   | 383 ++++++++++++++++++
 4 files changed, 427 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-zinnia.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c99..072df4128716 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -177,11 +177,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-zinnia.dtb
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
 imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-zinnia.dts b/arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-zinnia.dts
new file mode 100644
index 000000000000..07b4daf916c2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-zinnia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx-8m-mini-nano
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+/dts-v1/;
+
+#include "imx8mm-verdin.dtsi"
+#include "imx8mm-verdin-nonwifi.dtsi"
+#include "imx8mm-verdin-zinnia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX8M Mini on Zinnia";
+	compatible = "toradex,verdin-imx8mm-nonwifi-zinnia",
+		     "toradex,verdin-imx8mm-nonwifi",
+		     "toradex,verdin-imx8mm",
+		     "fsl,imx8mm";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-zinnia.dts b/arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-zinnia.dts
new file mode 100644
index 000000000000..01a254dc1e6c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-zinnia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx-8m-mini-nano
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+/dts-v1/;
+
+#include "imx8mm-verdin.dtsi"
+#include "imx8mm-verdin-wifi.dtsi"
+#include "imx8mm-verdin-zinnia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX8M Mini WB on Zinnia";
+	compatible = "toradex,verdin-imx8mm-wifi-zinnia",
+		     "toradex,verdin-imx8mm-wifi",
+		     "toradex,verdin-imx8mm",
+		     "fsl,imx8mm";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-zinnia.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-zinnia.dtsi
new file mode 100644
index 000000000000..686486e03178
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-zinnia.dtsi
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin IMX8MM SoM on Zinnia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx-8m-mini-nano
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+#include <dt-bindings/leds/common.h>
+
+/ {
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_zinnia_leds>;
+
+		/* LED1 Red - SODIMM 48 - LED1_R */
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED1 Blue - SODIMM 46 - LED1_B */
+		led-1 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Red - SODIMM 44 - LED3_R */
+		led-2 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Green - SODIMM 54 - LED3_G */
+		led-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&gpio3 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Blue - SODIMM 36 - LED3_B */
+		led-4 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&gpio4 23 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Red - SODIMM 34 - LED4_R */
+		led-5 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&gpio4 26 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Green - SODIMM 32 - LED4_G */
+		led-6 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&gpio4 24 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Blue - SODIMM 30 - LED4_B */
+		led-7 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&gpio4 25 GPIO_ACTIVE_HIGH>;
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
+&ecspi2 {
+	pinctrl-0 = <&pinctrl_ecspi2>, <&pinctrl_uart3_cts_gpio>;
+	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>, <&gpio5 13 GPIO_ACTIVE_LOW>;
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
+&fec1 {
+	status = "okay";
+};
+
+&gpio1 {
+	gpio-line-names =
+		"DI2_RB", /* SODIMM 216 */ /* 0 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"DO3_EN", /* SODIMM 220 */
+		"DI3_EN", /* SODIMM 222 */
+		"", /* 10 */
+		"DI2_EN", /* SODIMM 218 */
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
+		"DO1_EN", /* SODIMM 206 */
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
+		"";
+};
+
+&gpio4 {
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
+		"",
+		"",
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
+		"DI1_EN", /* SODIMM 208 */
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
+		"DI1_RB", /* SODIMM 210 */
+		"DO2_EN", /* SODIMM 212 */
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
+/* Verdin UART_3 */
+&uart1 {
+	status = "okay";
+};
+
+/* Verdin UART_1 */
+&uart2 {
+	status = "okay";
+};
+
+/* Verdin UART_2 */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>, <&pinctrl_uart3_rts>;
+	rs485-rx-during-tx;
+	linux,rs485-enabled-at-boot-time;
+
+	status = "okay";
+};
+
+/* Verdin USB_1 */
+&usbotg1 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usbotg2 {
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
+	pinctrl_qspi1_io0_gpio: gpio3io6grp {
+		fsl,pins = <MX8MM_IOMUXC_NAND_DATA00_GPIO3_IO6	0x184>;	/* SODIMM 56 */
+	};
+
+	pinctrl_uart3_cts_gpio: gpio5io9grp {
+		fsl,pins = <MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9	0x184>;	/* SODIMM 143 */
+	};
+
+	pinctrl_zinnia_leds: zinnialedsgrp {
+		fsl,pins =
+			<MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25	0x16>, /* SODIMM 30 */
+			<MX8MM_IOMUXC_SAI2_TXFS_GPIO4_IO24	0x16>, /* SODIMM 32 */
+			<MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26	0x16>, /* SODIMM 34 */
+			<MX8MM_IOMUXC_SAI2_RXD0_GPIO4_IO23	0x16>, /* SODIMM 36 */
+			<MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22	0x16>, /* SODIMM 44 */
+			<MX8MM_IOMUXC_SAI5_RXD3_GPIO3_IO24	0x16>, /* SODIMM 46 */
+			<MX8MM_IOMUXC_SAI5_RXD0_GPIO3_IO21	0x16>, /* SODIMM 48 */
+			<MX8MM_IOMUXC_NAND_CE0_B_GPIO3_IO1	0x16>; /* SODIMM 54 */
+	};
+};
-- 
2.47.3

