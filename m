Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016CA3EB0EA
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812829; cv=none; b=a4zQiUCWvYYgQlEY2D6tdORTfV/OquX2AvpXO/tdUXj7Akl3mA8229TQJv9i+1tcCSoBViU1IKXSAU29lPn2t6fGTDlzXnxjIz3VCCMCHnUMi9iVHlFm9rrQxtRVUuiPwbjG/8yZZocKlZY1HkwNhTZo0TNCGCOWWjNq7aiC95c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812829; c=relaxed/simple;
	bh=g2toXpPr3TTzoNixhG+9HkIgpIy3Pw46kKCMhnOFy+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCiLs/cWUpAJamL/ucfeilom5Rhmik9O7PX/xpFV/xamKkavNGFdKRS6okfPlzuCDx7sYMZN3XDon8SXZNDdZRtesTX6kJ6hdMaDkr8TZYc3Q5ES9pixlI45IVQRCfckjOPKTvjhLV2OYgA2lTfrHJdKPvHJlVdL4XbXJQbeVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=psQ3eAaH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="psQ3eAaH"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-472a14c9965so1960646f8f.1
        for <imx@lists.linux.dev>; Tue, 30 Jun 2026 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782812825; x=1783417625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFEIqMsV/WZjPG3GiDeWbAAMsV3GPWKXaGBH34SQUa8=;
        b=psQ3eAaHR+Pr4YCdTKqLr4tMbLazJAjBOm2RLhOiry9e3flW1SyZJHEzhZepAVFM8C
         EqSHi0LdWtPII0PUqQ4r3LjAhyfJN6/q9h9hU//xX1zQa9RXzsS4DFHi0wbivCrx1epb
         23SavFiGbO1fXDxVDfM+U6GGXgONrvYPWbb/hHR+7S0mD3poBmqULd/PGHAp5hSKZ+s4
         Ut3q0YMxq3bVGN7qf1EVyrXSu9+bpmtPxloJWRcifiGNK4qeAPJDW250Ausu8Jo6HjDI
         dv+VD3BD7+TdHw1vs4LrivdPhZuMRmyhpUOEelfa3mw2rwfDYUcxdPEohVut5s+8dx8c
         rRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812825; x=1783417625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cFEIqMsV/WZjPG3GiDeWbAAMsV3GPWKXaGBH34SQUa8=;
        b=Wg/n2JB1sIu7N34uQQVBwczd42seiw3hFAlpqJptfE8QVBjqTVhcI2nxnUmMzoX0aj
         eCS415fqI9SRNv7rOT0XVMHOy/ih1v89C9wRoENPSEpp6yknJxSBsTDL8nRtPTxfSWF9
         2bDbQLRDdXb+n+c9nJlrHlJyrJos4/uY20rl/l5qyyFBOP+zFh5npocyKWtXS+PRJ7Fz
         5HXEQzIX8WHn43ffjaX95gJPq1UqcXHjhKnGMh78xBNWZRkMThuoaTe7EjtRMWDKge9u
         s8VPQVP0+aGhifulBjIKrVvbty2jh4TZNNMgWs9uAeGHrylf1sNT4Ql8yirtbDSRp+H6
         TjnA==
X-Forwarded-Encrypted: i=1; AHgh+RrfK3cIvPlt9P7la66bqyduGUCC085U3SgIyp3+CEKd+hyJF0Yz4tBYfsjS6B+v48NJyPM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAzwHoEx0SwJyFedNzPlkVnoKQq0xaeKiTLM/Tt6iQ5RUVo7lp
	uswuP2IKlrvCEj+HISgUGc59kQtNaQrYqpqGrjGQI5YRpC+yci62V2JY
X-Gm-Gg: AfdE7ckcdYvYIt/q9RufYc8Q30yNx/qvfzdvVaIVSILg+CYe6r38bG2lJWzEyirfCOE
	9G5coByN80+TmG0lgUUR2oEragaO73QRyQ42CQfeg7E+j8oMKItNu8/vxoLBPtQ8IOgMdCDfF3C
	fUy/SuoTbasWJXW0fpSNa96XtRqenulvx6fqQqDdgNTWkY04yrZ3+NGDtX4wWAdQzxsg33xwWkF
	f0LfQnTo70aOkPQnO/4cDtUwGG+UWJR4wVQ3g5lOiBJC25knwqYA/mi1wUzXkpkHG0Lg9m1Rkhi
	30FR4WwGoyGwNEZ7/Cj7lrGVxQsyL79xGLTa6ME36xIY6FuQAGcDzaiwOjLqNJbypt6X8XhHXR3
	Pafs2hmbx9eTFBz6w9RH6V9z31OzlQN+zzMWbkuCSgCOGMrDWMz8YEh5WbywfRXrfH2U859FdfB
	MYE1M8bXEj3rbS/z67QWERbsr62KyylGyi4r14AH/m7Jada/6q8Oo8U78iY0w6qzfK1O2eVRutP
	kJw+NI6/Q2bkdPvNMTVrhAsgYo3oc0Gwg9U
X-Received: by 2002:a05:6000:440b:b0:473:1706:7f01 with SMTP id ffacd0b85a97d-47552f32951mr2599658f8f.43.1782812825292;
        Tue, 30 Jun 2026 02:47:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778f015sm6552725f8f.31.2026.06.30.02.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:04 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 3/3] arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board
Date: Tue, 30 Jun 2026 11:46:56 +0200
Message-ID: <2cdbea18bba7c9e05addd24390e54063216bcf88.1782812572.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782812572.git.stefano.r@variscite.com>
References: <cover.1782812572.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite Symphony carrier board with
the VAR-SOM-MX8 QuadMax system on module.

The Symphony board includes
- uSD Card support
- USB ports and OTG
- Additional Gigabit Ethernet interface
- Uart, SPI and I2C interfaces
- GPIO Expanders
- RTC module
- TPM module
- CAN peripherals
- PCIE support

Link: https://variscite.com/carrier-boards/symphony-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-var-som-symphony.dts | 488 ++++++++++++++++++
 2 files changed, 489 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8ddaab127ab9..118674f0ce7e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -528,6 +528,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
 
 imx8qm-mek-ov5640-csi0-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi0.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
new file mode 100644
index 000000000000..c944c85e1dd7
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
@@ -0,0 +1,488 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Variscite Symphony carrier board for VAR-SOM-MX8 QuadMax
+ *
+ * Link: https://variscite.com/carrier-boards/symphony-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "imx8qm-var-som.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX8 on Symphony evaluation board";
+	compatible = "variscite,var-som-imx8qm-symphony",
+		     "variscite,var-som-imx8qm", "fsl,imx8qm";
+	chosen {
+		stdout-path = &lpuart0;
+	};
+
+	 gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_BACK>;
+		};
+
+		button-home {
+			label = "Home";
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOME>;
+		};
+
+		button-menu {
+			label = "Menu";
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MENU>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-hearthbeat {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pca9534 0 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	reg_fec_phy: regulator-fec-phy {
+		compatible = "regulator-fixed";
+		regulator-name = "fec-phy";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-enable-ramp-delay = <20000>;
+		vin-supply = <&reg_vselect>;
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_otg1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&lsio_gpio0 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "sw-3p3-sd1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_vselect: regulator-vselect {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_vselect";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		gpio = <&pca9534 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
+&fec1 {
+	mdio {
+		ethphy1: ethernet-phy@5 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <5>;
+			vddio-supply = <&reg_phy_vddio>;
+			reset-gpios = <&pca9534 5 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+			};
+		};
+	};
+};
+
+&fec2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec2>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy1>;
+	phy-supply = <&reg_fec_phy>;
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
+&hsio_phy {
+	fsl,hsio-cfg = "pciea-pcieb-sata";
+	fsl,refclk-pad-mode = "input";
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	pca9534: gpio@20 {
+		compatible = "nxp,pca9534";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pca9534>;
+		interrupt-parent = <&lsio_gpio1>;
+		interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	/* USB Type-C Controller */
+	typec_ptn5150: typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&lsio_gpio3>;
+		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
+
+		port {
+			typec_dr_sw: endpoint {
+				remote-endpoint = <&usb3_drd_sw>;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	status = "okay";
+
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca6408 4 GPIO_ACTIVE_LOW>;
+	};
+
+	/* Capacitive touch */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		pinctrl-names = "default";
+		reg = <0x38>;
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&lsio_gpio0>;
+		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
+};
+
+&lpspi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi1>;
+	cs-gpios = <&lsio_gpio3 24 0>;
+	status = "okay";
+};
+
+/* console */
+&lpuart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart0>;
+	status = "okay";
+};
+
+/* header */
+&lpuart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart2>;
+	status = "okay";
+};
+
+&pca9534 {
+	usb3-signal-route-hog {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "usb3_signal_route";
+	};
+};
+
+&pciea{
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	reset-gpio = <&pca6408 1 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg1>;
+	vbus-supply = <&reg_usb_otg1_vbus>;
+	srp-disable;
+	hnp-disable;
+	adp-disable;
+	disable-over-current;
+	status = "okay";
+};
+
+&usbotg3 {
+	status = "okay";
+};
+
+&usbotg3_cdns3 {
+	dr_mode = "otg";
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
+		};
+	};
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	bus-width = <4>;
+	cd-gpios = <&lsio_gpio0 14 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			IMX8QM_GPT1_COMPARE_LSIO_GPIO0_IO19			0x06000021
+			IMX8QM_GPT0_COMPARE_LSIO_GPIO0_IO16			0x06000021
+		>;
+	};
+
+	pinctrl_fec2: fec2grp {
+		fsl,pins = <
+			IMX8QM_ENET1_RGMII_TX_CTL_CONN_ENET1_RGMII_TX_CTL	0x06000048
+			IMX8QM_ENET1_RGMII_TXC_CONN_ENET1_RGMII_TXC		0x06000048
+			IMX8QM_ENET1_RGMII_TXD0_CONN_ENET1_RGMII_TXD0		0x06000048
+			IMX8QM_ENET1_RGMII_TXD1_CONN_ENET1_RGMII_TXD1		0x06000048
+			IMX8QM_ENET1_RGMII_TXD2_CONN_ENET1_RGMII_TXD2		0x06000048
+			IMX8QM_ENET1_RGMII_TXD3_CONN_ENET1_RGMII_TXD3		0x06000048
+			IMX8QM_ENET1_RGMII_RXC_CONN_ENET1_RGMII_RXC		0x06000048
+			IMX8QM_ENET1_RGMII_RX_CTL_CONN_ENET1_RGMII_RX_CTL	0x06000048
+			IMX8QM_ENET1_RGMII_RXD0_CONN_ENET1_RGMII_RXD0		0x06000048
+			IMX8QM_ENET1_RGMII_RXD1_CONN_ENET1_RGMII_RXD1		0x06000048
+			IMX8QM_ENET1_RGMII_RXD2_CONN_ENET1_RGMII_RXD2		0x06000048
+			IMX8QM_ENET1_RGMII_RXD3_CONN_ENET1_RGMII_RXD3		0x06000048
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan0grp {
+		fsl,pins = <
+			IMX8QM_FLEXCAN0_TX_DMA_FLEXCAN0_TX			0x00000021
+			IMX8QM_FLEXCAN0_RX_DMA_FLEXCAN0_RX			0x00000021
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan1grp {
+		fsl,pins = <
+			IMX8QM_FLEXCAN1_TX_DMA_FLEXCAN1_TX			0x00000021
+			IMX8QM_FLEXCAN1_RX_DMA_FLEXCAN1_RX			0x00000021
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			IMX8QM_USB_SS3_TC3_DMA_I2C1_SDA				0xc6000020
+			IMX8QM_USB_SS3_TC1_DMA_I2C1_SCL				0xc6000020
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			IMX8QM_ENET1_MDC_DMA_I2C4_SCL				0xc6000020
+			IMX8QM_ENET1_MDIO_DMA_I2C4_SDA				0xc6000020
+		>;
+	};
+
+	pinctrl_lpspi1: lpspi1grp {
+		fsl,pins = <
+			IMX8QM_ADC_IN3_DMA_SPI1_SCK				0x0600004c
+			IMX8QM_ADC_IN4_DMA_SPI1_SDO				0x0600004c
+			IMX8QM_ADC_IN5_DMA_SPI1_SDI				0x0600004c
+			IMX8QM_ADC_IN6_LSIO_GPIO3_IO24				0x00000021
+		>;
+	};
+
+	pinctrl_lpuart0: lpuart0grp {
+		fsl,pins = <
+			IMX8QM_UART0_RX_DMA_UART0_RX				0x06000020
+			IMX8QM_UART0_TX_DMA_UART0_TX				0x06000020
+		>;
+	};
+
+	pinctrl_lpuart2: lpuart2grp {
+		fsl,pins = <
+			IMX8QM_LVDS0_I2C1_SCL_DMA_UART2_TX			0x06000020
+			IMX8QM_LVDS0_I2C1_SDA_DMA_UART2_RX			0x06000020
+		>;
+	};
+
+	pinctrl_pca9534: pca9534grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI0_MCLK_OUT_LSIO_GPIO1_IO24		0x00000021
+		>;
+	};
+
+	pinctrl_ptn5150: ptn5150grp {
+		fsl,pins = <
+			IMX8QM_SPI2_CS1_LSIO_GPIO3_IO11				0x00000021
+		>;
+	};
+
+	pinctrl_usbotg1: otg1grp {
+		fsl,pins = <
+			IMX8QM_GPT1_CAPTURE_LSIO_GPIO0_IO18			0x06000048
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX8QM_USDHC1_CLK_CONN_USDHC1_CLK			0x06000041
+			IMX8QM_USDHC1_CMD_CONN_USDHC1_CMD			0x00000021
+			IMX8QM_USDHC1_DATA0_CONN_USDHC1_DATA0			0x00000021
+			IMX8QM_USDHC1_DATA1_CONN_USDHC1_DATA1			0x00000021
+			IMX8QM_USDHC1_DATA2_CONN_USDHC1_DATA2			0x00000021
+			IMX8QM_USDHC1_DATA3_CONN_USDHC1_DATA3			0x00000021
+			IMX8QM_USDHC1_VSELECT_CONN_USDHC1_VSELECT		0x00000021
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX8QM_USDHC1_CLK_CONN_USDHC1_CLK			0x06000040
+			IMX8QM_USDHC1_CMD_CONN_USDHC1_CMD			0x00000020
+			IMX8QM_USDHC1_DATA0_CONN_USDHC1_DATA0			0x00000020
+			IMX8QM_USDHC1_DATA1_CONN_USDHC1_DATA1			0x00000020
+			IMX8QM_USDHC1_DATA2_CONN_USDHC1_DATA2			0x00000020
+			IMX8QM_USDHC1_DATA3_CONN_USDHC1_DATA3			0x00000020
+			IMX8QM_USDHC1_VSELECT_CONN_USDHC1_VSELECT		0x00000020
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX8QM_USDHC1_CLK_CONN_USDHC1_CLK			0x06000040
+			IMX8QM_USDHC1_CMD_CONN_USDHC1_CMD			0x00000020
+			IMX8QM_USDHC1_DATA0_CONN_USDHC1_DATA0			0x00000020
+			IMX8QM_USDHC1_DATA1_CONN_USDHC1_DATA1			0x00000020
+			IMX8QM_USDHC1_DATA2_CONN_USDHC1_DATA2			0x00000020
+			IMX8QM_USDHC1_DATA3_CONN_USDHC1_DATA3			0x00000020
+			IMX8QM_USDHC1_VSELECT_CONN_USDHC1_VSELECT		0x00000020
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
+		fsl,pins = <
+			IMX8QM_GPT0_CLK_LSIO_GPIO0_IO14				0x00000021
+		>;
+	};
+};
-- 
2.47.3

