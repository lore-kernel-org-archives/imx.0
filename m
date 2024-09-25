Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3848825
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 16:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727280271; cv=none; b=tEIv0eKTwQ/fUCVMwZ9Wn0xguhKuwTL9ITTe04deRKXkX6KjkyipstXAnjbIIKoGTZo7gi6msTtFvtTDt1l2LwrqxEmRNFOigQgpRfgbTZmCPjzHHcbB9FK97hJBwREkrgEMiQQ1Zebl7rKTG3vL4Jk0udsB1msLljIAKiB//i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727280271; c=relaxed/simple;
	bh=CLWq13aHXZRAbUwX6XwdRem/fKQDbFY9QDHFdxa90DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADy4bao+jGQzlrqbm0/UWJyyyKxnnJQCLAS4VqVZ5aDrMLIuyNh6muDzJ+W7S3s0rvs59G1eTmAR52VZhbwboeBlWxj0vXfbJiDpgQGNiBk9lmw713GRZ3I0dpAeNBhptsID5c65VTm6buVLvoYZg8X2bbXhyTgFNSHKmmUrovs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=BKuq4B3n; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="BKuq4B3n"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 03F8F87BF4;
	Wed, 25 Sep 2024 18:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727280266;
	bh=EImXGMkZqH6ajYAOmaEOLce7Unt7mTnSgQhsh3cdp7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BKuq4B3nhviSalHZWicJbFzYAJGZ79xQO5/GvDOAmeBRNrZoYj4w/5KCQgMavoZbr
	 RDqV06gxp0n9NAW5pkAwgwj6A7kv0P1MLX3PLRPntBetGmTOXvBsDWSAMLGG6JLhBG
	 SSKO/sa/p8Sa7zz8snu0uuMOtGFr4keNHjmos472nGzZY2QZruDZWTXdbHTZ6kUoFh
	 HjLpCSAGWqjbv608hAtMImmOjcuzuIwQ4VT5Ont3CbYCKTNVu/TBPRRFrOTGApZb0U
	 2AxxwZGiZBU/0s/UU7ysq0T/jOQIhYL71v7EAW77/pid9GBpsCwVqeRCVCuJSpD3S6
	 zAQuZREQuKwOw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: kernel@dh-electronics.com,
	Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 2/2] arm64: dts: imx8mp: Add DH i.MX8MP DHCOM SoM on DRC02 carrier board
Date: Wed, 25 Sep 2024 18:03:08 +0200
Message-ID: <20240925160343.84388-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925160343.84388-1-marex@denx.de>
References: <20240925160343.84388-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Add support for DH electronics i.MX8MP DHCOM SoM on DRC02 carrier board.
This system is populated with two ethernet ports, two CANs, RS485 and RS232,
USB, capacitive buttons and an OLED display.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Gregor Herburger <gregor.herburger@ew.tq-group.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Mathieu Othacehe <m.othacehe@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: No change
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8mp-dhcom-drc02.dts | 255 ++++++++++++++++++
 2 files changed, 256 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 9d3df8b218a2e..f6b8041c1e8f7 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -167,6 +167,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-drc02.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dts
new file mode 100644
index 0000000000000..c6bf7fd919814
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dts
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2024 Marek Vasut <marex@denx.de>
+ *
+ * DHCOM iMX8MP variant:
+ * DHCM-iMX8ML8-C160-R204-F1638-SPI16-E2-CAN2-RTC-I-01D2
+ * DHCOM PCB number: 660-100 or newer
+ * DRC02 PCB number: 568-100 or newer
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include "imx8mp-dhcom-som.dtsi"
+
+/ {
+	model = "DH electronics i.MX8M Plus DHCOM on DRC02";
+	compatible = "dh,imx8mp-dhcom-drc02", "dh,imx8mp-dhcom-som",
+		     "fsl,imx8mp";
+
+	chosen {
+		stdout-path = &uart1;
+	};
+};
+
+&eqos {	/* First ethernet */
+	pinctrl-0 = <&pinctrl_eqos_rmii>;
+	phy-handle = <&ethphy0f>;
+	phy-mode = "rmii";
+
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_266M>,
+				 <&clk IMX8MP_SYS_PLL2_100M>,
+				 <&clk IMX8MP_SYS_PLL2_50M>;
+	assigned-clock-rates = <0>, <100000000>, <50000000>;
+};
+
+&ethphy0g {	/* Micrel KSZ9131RNXI */
+	status = "disabled";
+};
+
+&ethphy0f {	/* SMSC LAN8740Ai */
+	status = "okay";
+};
+
+&fec {	/* Second ethernet */
+	pinctrl-0 = <&pinctrl_fec_rmii>;
+	phy-handle = <&ethphy1f>;
+	phy-mode = "rmii";
+	status = "okay";
+
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_266M>,
+				 <&clk IMX8MP_SYS_PLL2_100M>,
+				 <&clk IMX8MP_SYS_PLL2_50M>,
+				 <&clk IMX8MP_SYS_PLL2_50M>;
+	assigned-clock-rates = <0>, <100000000>, <50000000>, <0>;
+};
+
+&ethphy1f {	/* SMSC LAN8740Ai */
+	status = "okay";
+};
+
+&flexcan1 {
+	status = "okay";
+};
+
+&flexcan2 {
+	status = "okay";
+};
+
+&gpio1 {
+	gpio-line-names =
+		"DRC02-In1", "", "", "", "", "DHCOM-I", "DRC02-HW2", "DRC02-HW0",
+		"DHCOM-B", "DHCOM-A", "", "DHCOM-H", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+
+	/*
+	 * NOTE: On DRC02, the RS485_RX_En is controlled by a separate
+	 * GPIO line, however the i.MX8 UART driver assumes RX happens
+	 * during TX anyway and that it only controls drive enable DE
+	 * line. Hence, the RX is always enabled here.
+	 */
+	rs485-rx-en-hog {
+		gpio-hog;
+		gpios = <13 0>; /* GPIO Q */
+		line-name = "rs485-rx-en";
+		output-low;
+	};
+};
+
+&gpio2 {
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"DHCOM-O", "DHCOM-N", "", "SOM-HW1", "", "", "", "",
+		"", "", "", "", "DRC02-In2", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio3 {
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "SOM-HW0", "",
+		"", "", "", "", "", "", "SOM-MEM0", "SOM-MEM1",
+		"SOM-MEM2", "SOM-HW2", "", "", "", "", "", "";
+};
+
+&gpio4 {
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "SOM-HW1", "", "", "", "",
+		"", "", "", "DRC02-Out2", "", "", "", "";
+};
+
+&gpio5 {
+	gpio-line-names =
+		"", "", "DHCOM-C", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "DHCOM-E", "DRC02-Out1",
+		"", "", "", "", "", "", "", "";
+};
+
+/* No HS connector on this SoM variant, so no HDMI, PCIe and only USB HS. */
+&hdmi_blk_ctrl {
+	status = "disabled";
+};
+
+&hdmi_pvi {
+	status = "disabled";
+};
+
+&hdmi_tx {
+	status = "disabled";
+};
+
+&hdmi_tx_phy {
+	status = "disabled";
+};
+
+&i2c3 {
+	/* Resistive touch controller not populated on this one SoM variant. */
+	touchscreen@49 {
+		status = "disabled";
+	};
+};
+
+&irqsteer_hdmi {
+	status = "disabled";
+};
+
+&lcdif3 {
+	status = "disabled";
+};
+
+&pcie_phy {
+	status = "disabled";
+};
+
+&pcie {
+	status = "disabled";
+};
+
+/* Console UART */
+&pinctrl_uart1 {
+	fsl,pins = <
+		/* No pull-ups on DRC02, enable in-SoC pull-ups */
+		MX8MP_IOMUXC_SAI2_RXC__UART1_DCE_RX		0x149
+		MX8MP_IOMUXC_SAI2_RXFS__UART1_DCE_TX		0x149
+	>;
+};
+
+&pinctrl_uart3 {
+	fsl,pins = <
+		/* No pull-ups on DRC02, enable in-SoC pull-ups */
+		MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x149
+		MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x149
+	>;
+};
+
+&uart1 {
+	/*
+	 * Due to the use of CAN2 the signals for CAN2 Tx and Rx are routed to
+	 * DHCOM UART1 RTS/CTS pins. Therefore this UART have to use DHCOM GPIOs
+	 * for RTS/CTS. So configure DHCOM GPIO I as RTS and GPIO M as CTS.
+	 */
+	/delete-property/ uart-has-rtscts;
+	cts-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>; /* GPIO M */
+	pinctrl-0 = <&pinctrl_uart1 &pinctrl_dhcom_i &pinctrl_dhcom_m>;
+	pinctrl-names = "default";
+	rts-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>; /* GPIO I */
+};
+
+&uart3 {
+	/*
+	 * On DRC02 this UART is used as RS485 interface and RS485_TX_En is
+	 * controlled by DHCOM GPIO P. So remove RTS/CTS pins and the property
+	 * uart-has-rtscts from this UART and add the DHCOM GPIO P pin via
+	 * rts-gpios. The RS485_RX_En is controlled by DHCOM GPIO Q, see gpio1
+	 * node above.
+	 */
+	/delete-property/ uart-has-rtscts;
+	linux,rs485-enabled-at-boot-time;
+	pinctrl-0 = <&pinctrl_uart3 &pinctrl_dhcom_p &pinctrl_dhcom_q>;
+	pinctrl-names = "default";
+	rts-gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>; /* GPIO P */
+};
+
+/* No WiFi/BT chipset on this SoM variant. */
+&uart2 {
+	bluetooth {
+		status = "disabled";
+	};
+};
+
+/* USB_OTG port is not routed out on DRC02. */
+&usb3_0 {
+	status = "disabled";
+};
+
+&usb_dwc3_0 {
+	status = "disabled";
+};
+
+/* USB_HOST port has USB Hub connected to it, PWR/OC pins are unused */
+&usb3_1 {
+	fsl,disable-port-power-control;
+	fsl,permanently-attached;
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	maximum-speed = "high-speed";
+};
+
+/* No WiFi/BT chipset on this SoM variant. */
+&usdhc1 {
+	status = "disabled";
+};
+
+&iomuxc {
+	/*
+	 * GPIO I is connected to UART1_RTS
+	 * GPIO M is connected to UART1_CTS
+	 * GPIO P is connected to RS485_TX_En
+	 * GPIO Q is connected to RS485_RX_En
+	 */
+	pinctrl-0 = <&pinctrl_hog_base
+		     &pinctrl_dhcom_a &pinctrl_dhcom_b &pinctrl_dhcom_c
+		     &pinctrl_dhcom_d &pinctrl_dhcom_e &pinctrl_dhcom_f
+		     &pinctrl_dhcom_g &pinctrl_dhcom_h &pinctrl_dhcom_j
+		     &pinctrl_dhcom_k &pinctrl_dhcom_l &pinctrl_dhcom_n
+		     &pinctrl_dhcom_o &pinctrl_dhcom_r &pinctrl_dhcom_s
+		     &pinctrl_dhcom_int>;
+};
-- 
2.45.2

