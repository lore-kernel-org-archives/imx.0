Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4395D8E0
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 20:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711398789; cv=none; b=dfTw4E/FepOyAP3ho0XTXl1kgsdMpz64IdlN8AeDCd0PVL2CBXmVM94jJgCLjhNSFbxFXdCMFP/8xd94UgxHZi0A28P8DD4K+IFAsUGk8Uhdux13CzWsXb/9iEwk/jWL5dmXaNjFdltMPPApQhVCFPgtF+jktBEKI7b7I5HJPjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711398789; c=relaxed/simple;
	bh=b54+KoPqk9vJxHOYKe1rYg0vBKB3XALqnUgUm4P7Bag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jGCCp/24IfrTTMRfvtgbU7ZXlzzYc2tEoER5o1O4NO2+kjYRe2p6DV6x+slLSNpDTQoq6BbmbDjbqPhaxL/MpVrNhAV4bYRPcTHUNAKf7rjdjEYGnXRSJM84tZR+UihkgPbzokiSGZ548UVP77PqZlYCX2LXe5oFy5ua83VITTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JecIxkwS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JecIxkwS"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 520443DF5;
	Mon, 25 Mar 2024 21:32:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711398749;
	bh=b54+KoPqk9vJxHOYKe1rYg0vBKB3XALqnUgUm4P7Bag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JecIxkwSmvHbuY8HqHQS2tV4U0qa474u+kX/Xv3eSg5HH8atpeKwdf/Fi7qPtANQE
	 hHd8XQcBLYWrT0UZ8dF/Qdgkn/B2D1kKzm/JS8PdRMEpKOGsNBoDXU2tZsNVLRne/c
	 Mg5scYMn/DyVNQN5c0Kt/HHKFB0H8GbYnDqh3Ug4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Trevor Zaharichuk <trevor@au-zone.com>,
	Greg Lytle <greg@au-zone.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 5/5] arm64: dts: Add device tree source for the Au-Zone Maivin Starter Kit
Date: Mon, 25 Mar 2024 22:32:45 +0200
Message-ID: <20240325203245.31660-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240325203245.31660-1-laurent.pinchart@ideasonboard.com>
References: <20240325203245.31660-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Maivin board is an AI vision starter kit sold by Au-Zone
Technologies, developed in collaboration with Toradex and Vision
Components. It is based on a Toradex Verdin i.MX8MP SoM.

Add a device tree that covers the base set the peripherals found on the
board:

- Ethernet
- USB
- SD card slot
- CAN and serial ports (RS232 and RS485)
- DACs, EEPROMs, temperature sensor
- PCI M.2 and CSI regulators

An additional pinctrl group is included for the M.2 modem, but hasn't
been tested due to lack of compatible hardware.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8mp-maivin.dts      | 236 ++++++++++++++++++
 2 files changed, 237 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-maivin.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 045250d0a040..03af8c242649 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -165,6 +165,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-maivin.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-maivin.dts b/arch/arm64/boot/dts/freescale/imx8mp-maivin.dts
new file mode 100644
index 000000000000..2d1c8e782465
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-maivin.dts
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright 2021 Au-Zone Technologies
+ * Copyright 2024 Ideas on Board
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+
+#include "imx8mp-verdin.dtsi"
+#include "imx8mp-verdin-nonwifi.dtsi"
+
+/ {
+	model = "Au-Zone Maivin AI Vision Starter Kit";
+	compatible = "au-zone,maivin-starter-kit",
+		     "toradex,verdin-imx8mp-nonwifi",
+		     "toradex,verdin-imx8mp",
+		     "fsl,imx8mp";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&pinctrl_sw1>;
+
+		button-0 {
+			label = "SW1";
+			linux,code = <BTN_MISC>;
+			interrupts-extended = <&gpio3 16 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&pinctrl_led>;
+
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			linux,default-trigger = "heartbeat";
+			gpios = <&gpio3 14 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	csi_3v3: regulator-csi-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "CSI_3V3";
+		pinctrl-0 = <&pinctrl_csi_3v3>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <50000>;	/* TODO: Determine the right value */
+	};
+
+	m2_3v3: regulator-m2-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "M2_3V3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		pinctrl-0 = <&pinctrl_m2_3v3>;
+		gpio = <&gpio3 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* Carrier Board Supply 3V3_SW */
+	reg_3v3: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3V3_SW";
+	};
+};
+
+&eqos {
+	status = "okay";
+};
+
+/* Verdin CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+/* Verdin CAN_2 */
+&flexcan2 {
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+	dac@d {
+		compatible = "ti,dac081c081";
+		reg = <0x0d>;
+		vref-supply = <&csi_3v3>;
+	};
+};
+
+/* Verdin I2C_4_CSI */
+&i2c3 {
+	status = "okay";
+
+	dac@d {
+		compatible = "ti,dac081c081";
+		reg = <0x0d>;
+		vref-supply = <&csi_3v3>;
+	};
+};
+
+/* Verdin I2C_1 */
+&i2c4 {
+	status = "okay";
+
+	temp-sensor@4b {
+		compatible = "ti,tmp102";
+		reg = <0x4b>;
+	};
+
+	/* EEPROM on the rear connector interface */
+	eeprom@54 {
+		compatible = "st,24c02", "atmel,24c02";
+		pagesize = <16>;
+		reg = <0x54>;
+	};
+};
+
+/* EEPROM on the carrier board */
+&eeprom_carrier_board {
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_csi_3v3: csi-3v3-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_DATA01__GPIO3_IO07		0x184	/* SODIMM 58 */
+		>;
+	};
+
+	gpio7grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03		0x82	/* SODIMM 220 */
+		>;
+	};
+
+	gpio8grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXC__GPIO4_IO01		0x82	/* SODIMM 222 */
+		>;
+	};
+
+	pinctrl_led: ledgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14		0x82	/* SODIMM 66 */
+		>;
+	};
+
+	/* M.2 power off and reset */
+	pinctrl_m2: m2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_DATA00__GPIO3_IO06		0x82	/* SODIMM 56 */
+			MX8MP_IOMUXC_NAND_DATA03__GPIO3_IO09		0x82	/* SODIMM 62 */
+		>;
+	};
+
+	pinctrl_m2_3v3: m2-3v3-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01		0x82	/* SODIMM 54 */
+		>;
+	};
+
+	pinctrl_sw1: sw1grp {
+		fsl,pins = <
+			/*
+			 * SW1 shortens the pin to ground when pressed, enable
+			 * the internal pull-up.
+			 */
+			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16		0x1c0	/* SODIMM 64 */
+		>;
+	};
+};
+
+&reg_usdhc2_vmmc {
+	vin-supply = <&reg_3v3>;
+};
+
+/* Verdin UART_1 */
+/* Enabling RS-485 operation */
+&uart1 {
+	fsl,uart-has-rtscts;
+	linux,rs485-enabled-at-boot-time;
+};
+
+/* Verdin UART_2, for M.2 card slot */
+&uart2 {
+	status = "okay";
+};
+
+/* Verdin UART_3, used as the Linux Console */
+&uart3 {
+	status = "okay";
+};
+
+/* Verdin USB_1, USB recovery */
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	status = "okay";
+};
+
+/* Verdin USB_2, for M.2 card slot */
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_1 {
+	status = "okay";
+};
+
+/* Verdin SD_1, for SD card slot */
+&usdhc2 {
+	status = "okay";
+};
-- 
Regards,

Laurent Pinchart

