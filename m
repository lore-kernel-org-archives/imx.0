Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF2F33B969;
	Mon, 13 Jul 2026 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935970; cv=none; b=mziKh0l9R1xK1S6LsiIq5RfuKFmEUwsbUREaMpwC0cXiyGHLP6SWSCyl3BOhWJC8Jah2qxta/tvx9dQhz3HP6XzJwnnaxgqothWXtzLq4zLfqvRlzttwc0Jdl8ByI/beUGfXdovAG3/1Qcytk/jvkvcQ8jg7KlTM2PrmthA3AbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935970; c=relaxed/simple;
	bh=JAFUm2CGMUfbqECxK2ES2D68fbKmX8LWF1CCo1igAng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDqX1TQD0CybpKwfcihvsMF3n6/xX2S8cThQsvYDQt+DAH3SImZ1MKPoYJxQGTkAQWJUCLt0Ld4DvmAwEXKmp/mn+7B0s99p6H2P3WMV7MjedKQBiIKn1W9RL6Y2lKXhaOFdKcAXNZtAq+tckqdUds8J/fy9w2ogxMGX8tHwLzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ARqHym/I; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ARqHym/I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=hohz79ONKsINArIsoFlQ7Fv2oZ3R3ZmZa2svKSYCZDU=; b=ARqHym/I1L3vJqEUUg0Rs7NP4i
	CBQdAVpQY2i1+qpff547XXDfHc5jmWTLjjbe1Rusc3DX0Hlw7QHYxeePRaoeLnk9utbOHutOErUoX
	+I405lFCJal1yDzNA/Zm49sg9fiQRqRFXEZWbwjAO4WkpJf0SEBeULleVzzLan2TQvit8Px96GfSG
	Pzt9NL3jsEpoqFgfo5swIVKVG9JpRDtTpPO6UEMGKK3FMplbhNQTy8W+ySG6scizTYUMfxUDUKLxa
	/QTCFQ0V3rdg6ABxpNfkdD3N5motXMZ9Q8kSrxvAkeTwfLOWihwdIcClPKZiRsIa81qFtKZwOd8CF
	q0nIj/oQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjCp9-0004S4-25;
	Mon, 13 Jul 2026 11:19:39 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjCp9-0004Bh-0j;
	Mon, 13 Jul 2026 11:19:39 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 2/2] arm64: dts: add devicetree for TQMa91xx on MBa93xxCA
Date: Mon, 13 Jul 2026 11:19:22 +0200
Message-ID: <20260713091924.2319674-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713091924.2319674-1-alexander.stein@ew.tq-group.com>
References: <20260713091924.2319674-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28059/Mon Jul 13 08:25:07 2026)

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

This allows using TQMa91xxCA / TQMa91xxLA SoM on MBa93xxCA
starter kit. While not having display all other interfaces
of this mainboard can be used.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx91-tqma9131-mba93xxca.dts    | 937 ++++++++++++++++++
 2 files changed, 938 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 9dfcaf9bc78ba..92a0101b9eb5a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -581,6 +581,7 @@ imx91-phyboard-segin-peb-av-18-dtbs += imx91-phyboard-segin.dtb imx91-phyboard-s
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin-peb-av-18.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba93xxca.dtb
 
 imx91-tqma9131-mba91xxca-lvds-tm070jvhg33-dtbs := imx91-tqma9131-mba91xxca.dtb imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtbo
 imx91-tqma9131-mba91xxca-rgb-cdtech-dc44-dtbs := imx91-tqma9131-mba91xxca.dtb imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dts
new file mode 100644
index 0000000000000..3fb5bb71b6225
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dts
@@ -0,0 +1,937 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2022-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Markus Niebel
+ * Author: Alexander Stein
+ */
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/pwm/pwm.h>
+
+#include "imx91-tqma9131.dtsi"
+
+/{
+	model = "TQ-Systems i.MX91 TQMa91xxLA/TQMa91xxCA on MBa93xxCA starter kit";
+	compatible = "tq,imx91-tqma9131-mba93xxca",
+		     "tq,imx91-tqma9131", "fsl,imx91";
+	chassis-type = "embedded";
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	aliases {
+		eeprom0 = &eeprom0;
+		ethernet0 = &eqos;
+		ethernet1 = &fec;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		rtc0 = &pcf85063;
+		rtc1 = &bbnsm_rtc;
+		serial0 = &lpuart1;
+		serial1 = &lpuart2;
+		serial2 = &lpuart3;
+		serial5 = &lpuart6;
+		serial7 = &lpuart8;
+	};
+
+	clk_dp: clk-dp {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		status = "disabled";
+	};
+
+	fan0: pwm-fan {
+		compatible = "pwm-fan";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwmfan>;
+		fan-supply = <&reg_pwm_fan>;
+		#cooling-cells = <2>;
+		/* typical 25 kHz -> 40.000 nsec */
+		pwms = <&tpm6 0 40000 PWM_POLARITY_INVERTED>;
+		cooling-levels = <0 32 64 128 196 240>;
+		pulses-per-revolution = <2>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+		status = "disabled";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		switch-a {
+			label = "switcha";
+			linux,code = <BTN_0>;
+			gpios = <&expander0 6 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		switch-b {
+			label = "switchb";
+			linux,code = <BTN_1>;
+			gpios = <&expander0 7 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&expander2 6 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&expander2 7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_3V3_MB";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_5v0: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_5V0_MB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_12v0: regulator-12v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		gpio = <&expander1 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_mpcie_1v5: regulator-mpcie-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_1V5_MPCIE";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		gpio = <&expander0 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_mpcie_3v3: regulator-mpcie-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_3V3_MPCIE";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander0 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_pwm_fan: regulator-pwm-fan {
+		compatible = "regulator-fixed";
+		regulator-name = "FAN_PWR";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		gpio = <&expander0 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_12v0>;
+	};
+
+	thermal-zones {
+		cpu-thermal {
+			trips {
+				cpu_active0: trip-active0 {
+					temperature = <40000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				cpu_active1: trip-active1 {
+					temperature = <48000>;
+					hysteresis = <3000>;
+					type = "active";
+				};
+
+				cpu_active2: trip-active2 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map1 {
+					trip = <&cpu_active0>;
+					cooling-device = <&fan0 1 1>;
+				};
+
+				map2 {
+					trip = <&cpu_active1>;
+					cooling-device = <&fan0 2 2>;
+				};
+
+				map3 {
+					trip = <&cpu_active2>;
+					cooling-device = <&fan0 3 3>;
+				};
+			};
+		};
+	};
+};
+
+&adc1 {
+	status = "okay";
+};
+
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy_eqos>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy_eqos: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_eqos_phy>;
+			reset-gpios = <&expander1 0 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <500000>;
+			reset-deassert-us = <50000>;
+			interrupt-parent = <&gpio3>;
+			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+			enet-phy-lane-no-swap;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,dp83867-rxctrl-strap-quirk;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		};
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy_fec>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy_fec: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_fec_phy>;
+			reset-gpios = <&expander1 1 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <500000>;
+			reset-deassert-us = <50000>;
+			interrupt-parent = <&gpio3>;
+			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+			enet-phy-lane-no-swap;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,dp83867-rxctrl-strap-quirk;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		};
+	};
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	xceiver-supply = <&reg_3v3>;
+	status = "okay";
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	xceiver-supply = <&reg_3v3>;
+	status = "okay";
+};
+
+&gpio1 {
+	gpio-line-names =
+		/* 00 */ "", "", "USB_C_ALERT#", "PMIC_IRQ#",
+		/* 04 */ "", "", "", "",
+		/* 08 */ "", "", "", "BM2_TEMP_EVENT_MOD#",
+		/* 12 */ "PEX_INT#", "", "RTC_EVENT#", "",
+		/* 16 */ "", "", "", "",
+		/* 20 */ "", "", "", "",
+		/* 24 */ "", "", "", "",
+		/* 28 */ "", "", "", "";
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio2>;
+
+	gpio-line-names =
+		/* 00 */ "SPI6_PCS0#", "", "", "",
+		/* 04 */ "", "", "", "SPI_CS#",
+		/* 08 */ "", "FAN_RPM", "MIPI_CSI_TRIGGER", "MIPI_CSI_SYNC",
+		/* 12 */ "", "", "", "",
+		/* 16 */ "X1_11", "X1_21", "X1_17", "X1_13",
+		/* 20 */ "X1_15", "X1_9", "", "",
+		/* 24 */ "", "", "X1_7", "",
+		/* 28 */ "", "", "", "";
+};
+
+&gpio3 {
+	gpio-line-names =
+		/* 00 */ "SD2_CD#", "", "", "",
+		/* 04 */ "", "", "", "SD2_RST#",
+		/* 08 */ "", "", "", "",
+		/* 12 */ "", "", "", "",
+		/* 16 */ "", "", "", "",
+		/* 20 */ "", "", "", "",
+		/* 24 */ "", "", "ENET1_INT#", "ENET2_INT#",
+		/* 28 */ "", "", "", "";
+};
+
+&gpio4 {
+	gpio-line-names =
+		/* 00 */ "", "", "", "",
+		/* 04 */ "", "", "", "",
+		/* 08 */ "", "", "", "",
+		/* 12 */ "", "", "", "",
+		/* 16 */ "", "", "", "",
+		/* 20 */ "", "", "", "",
+		/* 24 */ "", "", "", "",
+		/* 28 */ "", "DP_INT", "", "";
+};
+
+&lpi2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3>;
+	status = "okay";
+
+	temperature-sensor@1c {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x1c>;
+	};
+
+	ptn5110: usb-typec@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "X17";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			typec-power-opmode = "default";
+			pd-disable;
+			self-powered;
+
+			port {
+				typec_con_hs: endpoint {
+					remote-endpoint = <&typec_hs>;
+				};
+			};
+		};
+	};
+
+	eeprom2: eeprom@54 {
+		compatible = "nxp,se97b", "atmel,24c02";
+		reg = <0x54>;
+		pagesize = <16>;
+		vcc-supply = <&reg_3v3>;
+	};
+
+	expander0: gpio@70 {
+		compatible = "nxp,pca9538";
+		reg = <0x70>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pexp_irq>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_3v3>;
+		gpio-line-names = "FAN_PWR_EN", "MPCIE_WAKE#",
+				  "MPCIE_1V5_EN", "MPCIE_3V3_EN",
+				  "MPCIE_PERST#", "MPCIE_WDISABLE#",
+				  "BUTTON_A#", "BUTTON_B#";
+
+		mpcie-wake-hog {
+			gpio-hog;
+			gpios = <1 GPIO_ACTIVE_LOW>;
+			input;
+			line-name = "MPCIE_WAKE#";
+		};
+
+		/*
+		 * Controls the mPCIE slot reset which is low active as
+		 * reset signal. The output-low states, the signal is
+		 * inactive, e.g. not in reset
+		 */
+		mpcie_rst_hog: mpcie-rst-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "MPCIE_PERST#";
+		};
+
+		/*
+		 * Controls the mPCIE slot WDISABLE pin which is low active
+		 * as disable signal. The output-low states, the signal is
+		 * inactive, e.g. not disabled
+		 */
+		mpcie_wdisable_hog: mpcie-wdisable-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "MPCIE_WDISABLE#";
+		};
+	};
+
+	expander1: gpio@71 {
+		compatible = "nxp,pca9538";
+		reg = <0x71>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		vcc-supply = <&reg_3v3>;
+		gpio-line-names = "ENET1_RESET#", "ENET2_RESET#",
+				  "USB_RESET#", "",
+				  "WLAN_PD#", "WLAN_W_DISABLE#",
+				  "WLAN_PERST#", "12V_EN";
+
+		/*
+		 * Controls the WiFi card's low-active power down pin.
+		 * The output-low states, the signal is inactive,
+		 * resulting in high signal at power-down pin
+		 */
+		wlan-pd-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "WLAN_PD#";
+		};
+
+		/*
+		 * Controls the WiFi card's low-active disable pin.
+		 * The output-low states, the signal is inactive,
+		 * resulting in high signal at power-down pin
+		 */
+		wlan-wdisable-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "WLAN_W_DISABLE#";
+		};
+
+		/*
+		 * Controls the WiFi card's reset pin.
+		 * The output-low states, the signal is inactive,
+		 * resulting in high signal at power-down pin
+		 */
+		wlan-perst-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "WLAN_PERST#";
+		};
+	};
+
+	expander2: gpio@72 {
+		compatible = "nxp,pca9538";
+		reg = <0x72>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		vcc-supply = <&reg_3v3>;
+		gpio-line-names = "LCD_RESET#", "LCD_PWR_EN",
+				  "LCD_BLT_EN", "DP_EN",
+				  "MIPI_CSI_EN", "MIPI_CSI_RST#",
+				  "USER_LED1", "USER_LED2";
+	};
+};
+
+&lpi2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c5>;
+	pinctrl-1 = <&pinctrl_lpi2c5>;
+	status = "okay";
+
+	dp_bridge: dp-bridge@f {
+		compatible = "toshiba,tc9595", "toshiba,tc358767";
+		reg = <0x0f>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_tc9595>;
+		clock-names = "ref";
+		clocks = <&clk_dp>;
+		reset-gpios = <&expander2 3 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_RISING>;
+		toshiba,hpd-pin = <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dp_dsi_in: endpoint {
+					data-lanes = <1 2 3 4>;
+				};
+			};
+		};
+	};
+};
+
+&lpspi6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi6>, <&pinctrl_lpspi6_cs>;
+	cs-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>, <&gpio2 7 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&lpuart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	linux,rs485-enabled-at-boot-time;
+	status = "okay";
+};
+
+&lpuart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	status = "okay";
+};
+
+&lpuart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart6>;
+	status = "okay";
+};
+
+&lpuart8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart8>;
+	status = "okay";
+};
+
+&pcf85063 {
+	/* RTC_EVENT# from SoM is connected on mainboard */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcf85063>;
+	interrupt-parent = <&gpio1>;
+	interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+};
+
+&se97_som {
+	/* TEMP_EVENT# from SoM is connected on mainboard */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_temp_sensor_som>;
+	interrupt-parent = <&gpio1>;
+	interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+};
+
+/* on LVDS connector, not usable */
+&tpm5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tpm5>;
+};
+
+&tpm6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tpm6>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		typec_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb424,2517";
+		reg = <1>;
+		reset-gpios = <&expander1 2 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_3v3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2_hs>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_uhs>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_uhs>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+	disable-wp;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			/* PD | FSEL_2 | DSE X4 */
+			MX91_PAD_ENET1_MDC__ENET1_MDC				0x51e
+			/* SION | HYS | FSEL_2 | DSE X4 */
+			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x4000111e
+			/* HYS | FSEL_0 | DSE no drive */
+			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x1000
+			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x1000
+			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x1000
+			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x1000
+			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x1000
+			/* HYS | PD | FSEL_0 | DSE no drive */
+			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC			0x1400
+			/* PD | FSEL_2 | DSE X4 */
+			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x51e
+			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1			0x51e
+			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x51e
+			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x51e
+			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x51e
+			/* PD | FSEL_3 | DSE X3 */
+			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
+		>;
+	};
+
+	pinctrl_eqos_phy: eqosphygrp {
+		fsl,pins = <
+			/* HYS | FSEL_0 | DSE no drive */
+			MX91_PAD_CCM_CLKO1__GPIO3_IO26			0x1000
+		>;
+	};
+
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			/* PD | FSEL_2 | DSE X4 */
+			MX91_PAD_ENET2_MDC__ENET2_MDC			0x51e
+			/* SION | HYS | FSEL_2 | DSE X4 */
+			MX91_PAD_ENET2_MDIO__ENET2_MDIO			0x4000111e
+			/* HYS | FSEL_0 | DSE no drive */
+			MX91_PAD_ENET2_RD0__ENET2_RGMII_RD0		0x1000
+			MX91_PAD_ENET2_RD1__ENET2_RGMII_RD1		0x1000
+			MX91_PAD_ENET2_RD2__ENET2_RGMII_RD2		0x1000
+			MX91_PAD_ENET2_RD3__ENET2_RGMII_RD3		0x1000
+			MX91_PAD_ENET2_RX_CTL__ENET2_RGMII_RX_CTL	0x1000
+			/* HYS | PD | FSEL_0 | DSE no drive */
+			MX91_PAD_ENET2_RXC__ENET2_RGMII_RXC		0x1400
+			/* PD | FSEL_2 | DSE X4 */
+			MX91_PAD_ENET2_TD0__ENET2_RGMII_TD0		0x51e
+			MX91_PAD_ENET2_TD1__ENET2_RGMII_TD1		0x51e
+			MX91_PAD_ENET2_TD2__ENET2_RGMII_TD2		0x51e
+			MX91_PAD_ENET2_TD3__ENET2_RGMII_TD3		0x51e
+			MX91_PAD_ENET2_TX_CTL__ENET2_RGMII_TX_CTL	0x51e
+			/* PD | FSEL_3 | DSE X3 */
+			MX91_PAD_ENET2_TXC__ENET2_RGMII_TXC		0x58e
+		>;
+	};
+
+	pinctrl_fec_phy: fecphygrp {
+		fsl,pins = <
+			/* HYS | FSEL_0 | DSE no drive */
+			MX91_PAD_CCM_CLKO2__GPIO3_IO27			0x1000
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			/* HYS | PU | FSEL_0 | DSE no drive */
+			MX91_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1200
+			/* PU | FSEL_3 | DSE X4 */
+			MX91_PAD_PDM_CLK__CAN1_TX			0x039e
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			/* HYS | PU | FSEL_0 | DSE no drive */
+			MX91_PAD_GPIO_IO27__CAN2_RX			0x1200
+			/* PU | FSEL_3 | DSE X4 */
+			MX91_PAD_GPIO_IO25__CAN2_TX			0x039e
+		>;
+	};
+
+	pinctrl_gpio2: gpio2grp {
+		fsl,pins = <
+			/* HYS | PD | FSEL_2 | DSE X4 */
+			MX91_PAD_GPIO_IO16__GPIO2_IO16			0x151e
+			MX91_PAD_GPIO_IO17__GPIO2_IO17			0x151e
+			MX91_PAD_GPIO_IO18__GPIO2_IO18			0x151e
+			MX91_PAD_GPIO_IO19__GPIO2_IO19			0x151e
+			MX91_PAD_GPIO_IO20__GPIO2_IO20			0x151e
+			MX91_PAD_GPIO_IO21__GPIO2_IO21			0x151e
+			MX91_PAD_GPIO_IO26__GPIO2_IO26			0x151e
+		>;
+	};
+
+	pinctrl_jtag: jtaggrp {
+		fsl,pins = <
+			MX91_PAD_DAP_TCLK_SWCLK__JTAG_MUX_TCK		0x051e
+			MX91_PAD_DAP_TDI__JTAG_MUX_TDI			0x1200
+			MX91_PAD_DAP_TDO_TRACESWO__JTAG_MUX_TDO		0x031e
+			MX91_PAD_DAP_TMS_SWDIO__JTAG_MUX_TMS		0x1200
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			/* SION | HYS | OD | FSEL_3 | DSE X4 */
+			MX91_PAD_GPIO_IO28__LPI2C3_SDA			0x4000199e
+			MX91_PAD_GPIO_IO29__LPI2C3_SCL			0x4000199e
+		>;
+	};
+
+	pinctrl_lpi2c5: lpi2c5grp {
+		fsl,pins = <
+			/* SION | HYS | OD | FSEL_3 | DSE X4 */
+			MX91_PAD_GPIO_IO22__LPI2C5_SDA			0x4000199e
+			MX91_PAD_GPIO_IO23__LPI2C5_SCL			0x4000199e
+		>;
+	};
+
+	pinctrl_lpspi6: lpspi6grp {
+		fsl,pins = <
+			/* HYS | PD | FSEL_0 | DSE no drive */
+			MX91_PAD_GPIO_IO01__LPSPI6_SIN			0x1400
+			/* PD | FSEL_2 | DSE X4 */
+			MX91_PAD_GPIO_IO02__LPSPI6_SOUT			0x051e
+			MX91_PAD_GPIO_IO03__LPSPI6_SCK			0x051e
+		>;
+	};
+
+	pinctrl_lpspi6_cs: lpspi6csgrp {
+		fsl,pins = <
+			/* FSEL_2 | DSE X4 */
+			MX91_PAD_GPIO_IO00__GPIO2_IO0			0x011e
+			MX91_PAD_GPIO_IO07__GPIO2_IO7			0x011e
+		>;
+	};
+
+	pinctrl_mipi_csi: mipicsigrp {
+		fsl,pins = <
+			MX91_PAD_CCM_CLKO3__CCMSRCGPCMIX_CLKO3		0x051e /* MCLK */
+			MX91_PAD_GPIO_IO10__GPIO2_IO10			0x051e /* TRIGGER */
+			MX91_PAD_GPIO_IO11__GPIO2_IO11			0x1400 /* SYNC */
+		>;
+	};
+
+	pinctrl_pcf85063: pcf85063grp {
+		fsl,pins = <
+			MX91_PAD_SAI1_RXD0__GPIO1_IO14			0x1000
+		>;
+	};
+
+	pinctrl_pexp_irq: pexpirqgrp {
+		fsl,pins = <
+			/* HYS | FSEL_0 | No DSE */
+			MX91_PAD_SAI1_TXC__GPIO1_IO12			0x1000
+		>;
+	};
+
+	pinctrl_pwmfan: pwmfangrp {
+		fsl,pins = <
+			/* HYS | PU | FSEL_0 | no DSE */
+			MX91_PAD_GPIO_IO09__GPIO2_IO9			0x1200
+		>;
+	};
+
+	pinctrl_tc9595: tc9595-grp {
+		fsl,pins = <
+			/* HYS | PD | FSEL_0 | no DSE */
+			MX91_PAD_CCM_CLKO4__GPIO4_IO29			0x1400
+		>;
+	};
+
+	pinctrl_temp_sensor_som: tempsensorsomgrp {
+		fsl,pins = <
+			/* HYS | FSEL_0 | no DSE */
+			MX91_PAD_SAI1_TXFS__GPIO1_IO11			0x1000
+		>;
+	};
+
+	pinctrl_tpm5: tpm5grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO06__TPM5_CH0			0x57e
+		>;
+	};
+
+	pinctrl_tpm6: tpm6grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO08__TPM6_CH0			0x57e
+		>;
+	};
+
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			/* HYS | FSEL_0 | No DSE */
+			MX91_PAD_I2C2_SCL__GPIO1_IO2			0x1000
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			/* HYS | FSEL_0 | No DSE */
+			MX91_PAD_UART1_RXD__LPUART1_RX			0x1000
+			/* FSEL_2 | DSE X4 */
+			MX91_PAD_UART1_TXD__LPUART1_TX			0x011e
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			/* HYS | FSEL_0 | No DSE */
+			MX91_PAD_UART2_RXD__LPUART2_RX			0x1000
+			/* FSEL_2 | DSE X4 */
+			MX91_PAD_UART2_TXD__LPUART2_TX			0x011e
+			/* FSEL_2 | DSE X4 */
+			MX91_PAD_SAI1_TXD0__LPUART2_RTS_B		0x011e
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			/* HYS | FSEL_0 | No DSE */
+			MX91_PAD_GPIO_IO15__LPUART3_RX			0x1000
+			/* FSEL_2 | DSE X4 */
+			MX91_PAD_GPIO_IO14__LPUART3_TX			0x011e
+		>;
+	};
+
+	pinctrl_uart6: uart6grp {
+		fsl,pins = <
+			/* HYS | FSEL_0 | No DSE */
+			MX91_PAD_GPIO_IO05__LPUART6_RX			0x1000
+			/* FSEL_2 | DSE X4 */
+			MX91_PAD_GPIO_IO04__LPUART6_TX			0x011e
+		>;
+	};
+
+	pinctrl_uart8: uart8grp {
+		fsl,pins = <
+			/* HYS | FSEL_0 | No DSE */
+			MX91_PAD_GPIO_IO13__LPUART8_RX			0x1000
+			/* FSEL_2 | DSE X4 */
+			MX91_PAD_GPIO_IO12__LPUART8_TX			0x011e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			/* HYS | FSEL_0 | No DSE */
+			MX91_PAD_SD2_CD_B__GPIO3_IO0			0x1000
+		>;
+	};
+
+	/* enable SION for data and cmd pad due to ERR052021 */
+	pinctrl_usdhc2_hs: usdhc2hsgrp {
+		fsl,pins = <
+			/* PD | FSEL_3 | DSE X5 */
+			MX91_PAD_SD2_CLK__USDHC2_CLK			0x05be
+			/* HYS | PU | FSEL_3 | DSE X4 */
+			MX91_PAD_SD2_CMD__USDHC2_CMD			0x4000139e
+			/* HYS | PU | FSEL_3 | DSE X3 */
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0		0x4000138e
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1		0x4000138e
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2		0x4000138e
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3		0x4000138e
+			/* FSEL_2 | DSE X3 */
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT		0x010e
+		>;
+	};
+
+	/* enable SION for data and cmd pad due to ERR052021 */
+	pinctrl_usdhc2_uhs: usdhc2uhsgrp {
+		fsl,pins = <
+			/* PD | FSEL_3 | DSE X6 */
+			MX91_PAD_SD2_CLK__USDHC2_CLK			0x05fe
+			/* HYS | PU | FSEL_3 | DSE X4 */
+			MX91_PAD_SD2_CMD__USDHC2_CMD			0x4000139e
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0		0x4000139e
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1		0x4000139e
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2		0x4000139e
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3		0x4000139e
+			/* FSEL_2 | DSE X3 */
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT		0x010e
+		>;
+	};
+};
-- 
2.54.0

