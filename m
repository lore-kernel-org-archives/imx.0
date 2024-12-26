Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7284410E0
	for <imx@lists.linux.dev>; Thu, 26 Dec 2024 17:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735233266; cv=none; b=rqMpwjosgqDDGm5nfeRPqjanPsC3hotroC8kFiPju1HEAeDtsI4UCQuIPKgqkG2uKerYm/oFLdWWk78lVKyDjJOKJ+TIgxJoiGVPS+J1yUurmz1Q1wlE5UpTUzbkr6efFPjCQndQ97PWjpmWHw9RTvB0JCmeaAmiVx95gm+mEIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735233266; c=relaxed/simple;
	bh=77ul4j/jxmOSl9ihMAuZoB2MruDn1x+bb27zZ3nYFtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qbncPgHAOCYmdvtCupLJACH2c65ohU+stH000jeBkzcTdRyaFxcC/iuruDwFWS6eT5aS16fpcdczsfSG61QAP3TguqDnFSKk8jyLtZB8zuChRzJjGw2hx4XR4eyx1N/6eTp7/QbuVdTz1iqEm7Zi9Q3+0Ez0/QG+HEi7h3lSizw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=aLAoZsnt; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="aLAoZsnt"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E9F81040A8BC;
	Thu, 26 Dec 2024 18:14:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735233262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bXRSQCyMMVKF+Dp2DNv3gQhV/nWJspq5ARRgI6slgVI=;
	b=aLAoZsntrQ/gkh3F95WxW1+CvItBhwNWCbRE/kXqB8+8RF+m486rEZFg7cVJPpTsG1FXq7
	d7mI/biLxeqds3z0DulSjVp39OkPwcoDbd8Zr1Sy65cfHtWQt5tKzlfzgeSraRqiXn6Ruy
	n7XVfoIEAVM5EosH0TYZD3tnBGdJBNx6RPJFvaxp1lxT73o1BzBtEoTlfzq/0pBDQ8ubPw
	0VJC7Te/FEQILOdoVVaYoWUqyOTUODzeM2wMuuyiAJ+ntM2g5quHrgCfg3bLcDvXXjT5g0
	EMRYQ9zM0VwBKTJRA5DpaN03q/I4mNtdRc5oh/m4aStVjPlr31HXFTb3uxtpmA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] arm64: dts: imx8mp: Update Data Modul i.MX8M Plus eDM SBC DT to rev.903
Date: Thu, 26 Dec 2024 18:13:27 +0100
Message-ID: <20241226171404.84095-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Update the DT to match newest Data Modul i.MX8M Plus eDM SBC rev.903
board which implements significant changes. Keep some of the rev.900
and rev.902 nodes in the DT so that a DTO can be used to support old
rev.900 and rev.902 boards easily.

The changes from rev.900 to rev.902 are:
- Both ethernet PHYs replaced from AR8031 to BCM54213PE
- Both ethernet PHYs MDIO address changed
- PCIe WiFi now comes with dedicated regulator
- I2C TPM chip address
- Additional GPIO expander for LVDS panel control added
- Current EEPROM I2C address changed
- Another optional EEPROM added onto another I2C bus

The changes from rev.902 to rev.903 are:
- Additional GPIO expander for WiFi and LVDS panel control added
- Multiple GPIOs are reassigned

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 .../freescale/imx8mp-data-modul-edm-sbc.dts   | 147 +++++++++++++++---
 1 file changed, 128 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index d0fc5977258fb..9858a4365abe4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
@@ -93,6 +93,17 @@ reg_panel_vcc: regulator-panel-vcc {
 		status = "disabled";
 	};
 
+	reg_pcie0: regulator-pcie {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_wifi>;
+		regulator-name = "WIFI_BT_RST#";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -190,7 +201,7 @@ &ecspi3 {	/* Display connector SPI */
 &eqos {	/* First ethernet */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
-	phy-handle = <&phy_eqos>;
+	phy-handle = <&phy_eqos_bcm>;
 	phy-mode = "rgmii-id";
 	status = "okay";
 
@@ -200,7 +211,7 @@ mdio {
 		#size-cells = <0>;
 
 		/* Atheros AR8031 PHY */
-		phy_eqos: ethernet-phy@0 {
+		phy_eqos_ath: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 			/*
@@ -213,6 +224,7 @@ phy_eqos: ethernet-phy@0 {
 			reset-deassert-us = <10000>;
 			qca,keep-pll-enabled;
 			vddio-supply = <&vddio_eqos>;
+			status = "disabled";
 
 			vddio_eqos: vddio-regulator {
 				regulator-name = "VDDIO_EQOS";
@@ -224,13 +236,27 @@ vddh_eqos: vddh-regulator {
 				regulator-name = "VDDH_EQOS";
 			};
 		};
+
+		/* Broadcom BCM54213PE PHY */
+		phy_eqos_bcm: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			/*
+			 * Dedicated ENET_INT# and ENET_WOL# signals are
+			 * unused, the PHY does not provide cable detect
+			 * interrupt.
+			 */
+			reset-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+		};
 	};
 };
 
 &fec {	/* Second ethernet */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec>;
-	phy-handle = <&phy_fec>;
+	phy-handle = <&phy_fec_bcm>;
 	phy-mode = "rgmii-id";
 	fsl,magic-packet;
 	status = "okay";
@@ -240,7 +266,7 @@ mdio {
 		#size-cells = <0>;
 
 		/* Atheros AR8031 PHY */
-		phy_fec: ethernet-phy@0 {
+		phy_fec_ath: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 			/*
@@ -253,6 +279,7 @@ phy_fec: ethernet-phy@0 {
 			reset-deassert-us = <10000>;
 			qca,keep-pll-enabled;
 			vddio-supply = <&vddio_fec>;
+			status = "disabled";
 
 			vddio_fec: vddio-regulator {
 				regulator-name = "VDDIO_FEC";
@@ -264,6 +291,20 @@ vddh_fec: vddh-regulator {
 				regulator-name = "VDDH_FEC";
 			};
 		};
+
+		/* Broadcom BCM54213PE PHY */
+		phy_fec_bcm: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			/*
+			 * Dedicated ENET_INT# and ENET_WOL# signals are
+			 * unused, the PHY does not provide cable detect
+			 * interrupt.
+			 */
+			reset-gpios = <&gpio2 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+		};
 	};
 };
 
@@ -378,13 +419,26 @@ usb-hub@2c {
 		self-powered;
 	};
 
-	eeprom: eeprom@50 {
+	tpm: tpm@2e {
+		compatible = "st,st33tphf2ei2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+	};
+
+	eeprom900: eeprom@50 {	/* board rev.900 */
 		compatible = "atmel,24c32";
 		reg = <0x50>;
 		pagesize = <32>;
+		status = "disabled";
+	};
+
+	eeprom902: eeprom@51 {	/* board rev.902 */
+		compatible = "atmel,24c32";
+		reg = <0x51>;
+		pagesize = <32>;
 	};
 
 	rtc: rtc@68 {
+		#clock-cells = <0>;
 		compatible = "st,m41t62";
 		reg = <0x68>;
 		pinctrl-names = "default";
@@ -408,6 +462,45 @@ &i2c2 {
 	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
+
+	gpiolvds: io-expander@20 {
+		compatible = "nxp,pca9554";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"BL_ENABLE_V", "SEL_BL_12V",
+			"SEL_PANEL_5V", "SEL_PANEL_12V",
+			"SEL_BL_PWM", "SEL_BL_EN",
+			"REVERSE_SCAN_PANEL", "GND_REV903";
+	};
+
+	gpiowifi: io-expander@21 {
+		compatible = "nxp,pca9554";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"BL_LVDS_ENABLE_3V3", "BL_LVDS_PWM_3V3",
+			"M2_BT_WAKE_3V3#", "M2_W_DISABLE2_3V3#",
+			"TFT_PANEL_ENABLE_3V3", "TPM_RESET_3V3#",
+			"CSI2_PD_3V3", "CSI2_RESET_3V3#";
+
+		pwm-input-hog {
+			gpio-hog;
+			gpios = <1 0>;
+			input;
+			line-name = "BL_LVDS_PWM_3V3_HOG";
+		};
+	};
+
+	eepromlvds: eeprom@51 {
+		compatible = "atmel,24c32";
+		reg = <0x51>;
+		pagesize = <32>;
+		/* Optional EEPROM, disabled by default. */
+		status = "disabled";
+	};
 };
 
 &i2c3 {
@@ -521,6 +614,7 @@ &pcie {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	fsl,max-link-speed = <3>;
 	reset-gpio = <&gpio1 5 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcie0>;
 	status = "okay";
 };
 
@@ -597,7 +691,17 @@ &uart3 {	/* A53 Debug */
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
-	status = "disabled";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "infineon,cyw55572-bt";
+		brcm,requires-autobaud-mode;
+		clocks = <&rtc>;
+		clock-names = "txco";
+		max-speed = <921600>;
+		shutdown-gpios = <&gpiowifi 3 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &usb3_phy0 {
@@ -685,8 +789,6 @@ MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2	0x91
 			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3	0x91
 			/* ENET_RST# */
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15		0x6
-			/* ENET_INT# */
-			MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11		0x40000090
 		>;
 	};
 
@@ -708,8 +810,6 @@ MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL	0x1f
 			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC		0x1f
 			/* ENET2_RST# */
 			MX8MP_IOMUXC_SD1_DATA7__GPIO2_IO09		0x6
-			/* ENET2_INT# */
-			MX8MP_IOMUXC_SD1_DATA0__GPIO2_IO02		0x40000090
 		>;
 	};
 
@@ -753,10 +853,6 @@ MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x40000090
 
 			/* PG_V_IN_VAR# */
 			MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01		0x40000000
-			/* CSI2_PD_1V8 */
-			MX8MP_IOMUXC_NAND_DATA02__GPIO3_IO08		0x0
-			/* CSI2_RESET_1V8# */
-			MX8MP_IOMUXC_NAND_DATA03__GPIO3_IO09		0x0
 
 			/* DIS_USB_DN1 */
 			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21		0x0
@@ -770,8 +866,14 @@ MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21		0x0
 			/* GRAPHICS_PRSNT_1V8# */
 			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18		0x40000000
 
+			/* TOUCH_RESET_3V3# */
+			MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00		0x2
+			/* TOUCH_INT# */
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x40000140
 			/* CLK_CCM_CLKO1_3V3 */
 			MX8MP_IOMUXC_GPIO1_IO14__CCM_CLKO1		0x10
+			/* ENET_INT# (rev.900,901) or M2_WDIS_BTIRQ_3V3# (rev.903) */
+			MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11		0x40000092
 		>;
 	};
 
@@ -874,12 +976,10 @@ pinctrl_pcie0: pcie-grp {
 		fsl,pins = <
 			/* M2_PCIE_RST# */
 			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x2
-			/* M2_W_DISABLE1_1V8# */
+			/* M2_PCIE_WAKE_1V8# */
 			MX8MP_IOMUXC_SAI5_RXD2__GPIO3_IO23		0x2
-			/* M2_W_DISABLE2_1V8# */
-			MX8MP_IOMUXC_SAI5_RXD3__GPIO3_IO24		0x2
-			/* CLK_M2_32K768 */
-			MX8MP_IOMUXC_GPIO1_IO00__CCM_EXT_CLK1		0x14
+			/* M2_UART_WAKE_1V8# */
+			MX8MP_IOMUXC_SAI5_RXD3__GPIO3_IO24		0x40000002
 			/* M2_PCIE_WAKE# */
 			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x40000140
 			/* M2_PCIE_CLKREQ# */
@@ -973,6 +1073,8 @@ pinctrl_uart4: uart4-grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x49
 			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x49
+			MX8MP_IOMUXC_NAND_DATA02__UART4_DCE_CTS		0x149
+			MX8MP_IOMUXC_NAND_DATA03__UART4_DCE_RTS		0x149
 		>;
 	};
 
@@ -1099,4 +1201,11 @@ MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05		0x6
 			MX8MP_IOMUXC_SD1_DATA6__GPIO2_IO08		0x26
 		>;
 	};
+
+	pinctrl_wifi: wifi-grp {
+		fsl,pins = <
+			/* WIFI_BT_RST_3V3# */
+			MX8MP_IOMUXC_SD1_DATA0__GPIO2_IO02		0x40000090
+		>;
+	};
 };
-- 
2.45.2

