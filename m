Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D321C23817D
	for <imx@lists.linux.dev>; Sun, 21 Sep 2025 23:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758497754; cv=none; b=u3xBa/hdfxsE0NtJtFt7isHvh5xmt0Uq8XskQjRsHMFnj6+d66/jJGbz7+1F1H3xCK7CKF97JqKstSN1nAOKd80erwX6q3i6xxKrw+78cN7FOfiBQDy7Qb3Gy0J8pHoUp+RH0GXk6jMnKa5fNTAYTPKGa1BTtF9wz5DzS70ZqJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758497754; c=relaxed/simple;
	bh=AHidsI5RoYVti2WriFKFuRRpkhiX23TQW2Ea6SqRYyA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O3eevWPA4l7PTEbkQ54y4JrH+jy8KkJ0POm4I0/SRGR9R/l3JB/njj81F5IT06qbC3VdusTEyFnJKePPico59gOXz3x7GP1kgEjrg3GiaZrESEAmMBQC/abWvGAoOPWAGJ0T6DBV1nTRGD8YaceHBwPEWhcdtlGk4lhFVI4JeUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COH4pS0r; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COH4pS0r"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-816ac9f9507so464271585a.1
        for <imx@lists.linux.dev>; Sun, 21 Sep 2025 16:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758497752; x=1759102552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq/XbpxEcTTBwM2uie3A5y3PRK50AFwXMuVecv5w7Mg=;
        b=COH4pS0rW5NT7drRhu/5B6duSYXNXxoJLvs3XyTa0slpTnZMmBQISt2PetlL2cY0RQ
         6DHq/0RFWlT/c2Ps6OH1HXSvEURgJkIGubyFui395G/+tLOS4z501KKREmftwKzf88X7
         9N4acZa2ZwTDlacfxcSvEThas2uVpNPJCys9Smmd+beBfbhKZJrD8zkUTmErxx3brkzY
         BPkV1EMJpKUZXdmkDWPN79G2dMTQHPx6IAjE1356kO+ST6LHSRQZUFWQzAXxFFNMGzy1
         KX9y4uD0FTFBP8MeB1GzmzrSBUnsFPWs02teMgJqJSlCYGHac58OmqSdrBLG79HqUKz1
         /2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758497752; x=1759102552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aq/XbpxEcTTBwM2uie3A5y3PRK50AFwXMuVecv5w7Mg=;
        b=ppm16/k2GVgRM7KRNmmW0Mc/yvO9egasAJ3P8qi03SNyRUMRZmNyFF4+vOHbTDweCZ
         Jf9tOSfQ11iRQR+vExgSWqn4g5izX30Dvi3KTbqUm++8SCe47IkexGZgsNumdz9mZgG9
         v9IW+iwJUcb6AUHrjE4Sx1+933YLBmUBjK0lhUqGpLrzhgpVcVOWvB1U2W1xJi+867KQ
         gjXSpzAv5XFj+jgdNXO0XTZ9jjuZdaOFg5cCyXtYT59fU9sw7ue/yC+TMKf7ehj8iBh8
         h+2bkD/YbUhfaZIwlHDkmiItP+nqoP1okiav6dn5yv1jlV6DmmIktHyUs2hb+lHHRwhn
         wzQg==
X-Forwarded-Encrypted: i=1; AJvYcCX7iT0XZ0wWXmhDLE8MNzf0XZN4WNWzTXGfnvK7VnIGXgykhSOc7+86DGXOg5sLfjVB58E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLOax/AgQRk/IuvjllyQDJ5S0qVI8Kzc3oyX5KsH7WkJEA652J
	xq8LVlUTMRS1mBBcsuJRTHVcyNRQsDKpt/5SooelNTFVPxQeF9278H/pj4tjPyAZIhT4hQ==
X-Gm-Gg: ASbGnctzDw6MRtq/DbpoBQFm2rxnVDK1kdLzE6WrEiZM53wJtA4h7BdhNgpad/qVifd
	UH66vOD41BXdFdDuNT4D2fzQ3WlPp+gWHcggjcn5nlqbfLqyh/AcJmZuZ5vvvaebFlMGyPo9REJ
	rqSfTV6e0kCS1KSIzN0ZieJ37m2UwyPl8xtyzczT5TWpC4Wzgn8aqwKmHPN4ahC/pPFFW7/UmZj
	CWYyWWVfjb/uq/QYNtlcks4GUNYA9Smxhs0vnmAmJm2q40eYA4iFIkVDU0fTS9ax24kWpqKmIyz
	Tx0sh9U2nxa8UQDtD2XgvkaqWpik0Qn9ShYkYaYfQ3hQDaLRkI6+zMib8VfAZI2UsE6EC5c087B
	wVJY3etiVeWSsAoQlnbcBpi3md17Lutfk9cRW/vLJxrCAdJYa7FI=
X-Google-Smtp-Source: AGHT+IHtWr8BYWk0a543mLVk9jLcs4xheLhrEKiEs3MLNZwTHVl4JwO0HGo3p2pbvEb6k8kswMAtLg==
X-Received: by 2002:a05:620a:372b:b0:7e8:8086:cb83 with SMTP id af79cd13be357-836393287f2mr1839104185a.28.1758497751546;
        Sun, 21 Sep 2025 16:35:51 -0700 (PDT)
Received: from rogerio-laptop.home ([184.148.194.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83631a8095esm725949085a.49.2025.09.21.16.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 16:35:51 -0700 (PDT)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: xiaofeng.wei@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	marex@denx.de,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rogerio Pimentel <rpimentel.silva@gmail.com>,
	Anson Huang <Anson.Huang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Daniel Baluta <daniel.baluta@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
Date: Sun, 21 Sep 2025 19:35:34 -0400
Message-Id: <20250921233534.838680-2-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250921233534.838680-1-rpimentel.silva@gmail.com>
References: <20250921233534.838680-1-rpimentel.silva@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FRDM-i.MX8MP is an NXP development platform based on the i.MX8M Plus
SoC, featuring a quad Cortex-A53, Cortex-M7 co-processor, 4GB LPDDR4,
32GB eMMC, Wi-Fi 6/Bluetooth 5.4/802.15.4 tri-radio, Ethernet, HDMI/MIPI
display interfaces, camera connectors, and standard expansion headers.

Based on the device tree found in the NXP repository at github
https://github.com/nxp-imx-support/meta-imx-frdm and on imx8mp-evk
board kernel mainline device tree.

This is a basic device tree supporting:

 - Quad Cortex-A53
 - 4GB LPDDR4 DRAM
 - PCA9450C PMIC with regulators
 - Two NXP PCAL6416 GPIO expanders
 - RGB LEDs via GPIO expander
 - I2C1, I2C2, I2C3 controllers
 - UART2 (console) and UART3 (with RTS/CTS)
 - USDHC3 (8-bit eMMC)
 - SNVS power key (onboard power button)

Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
---

Changes in v2:

 - Fixed dt-binding schema warnings
 - Renamed nodes 'red, green and blue' to
   'led-0, led-1 and led-2'
 - Renamed led labels 'led-0, led-1 and led-2'
   to 'red, green and blue'
 - Added Reviewed-by and Signed-off-by tags

 
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 355 ++++++++++++++++++
 2 files changed, 356 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 525ef180481d..d861e576779a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -206,6 +206,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
new file mode 100644
index 000000000000..9138c65739aa
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2019 NXP
+ */
+
+/dts-v1/;
+
+#include "imx8mp.dtsi"
+
+/ {
+	model = "NXP i.MX8MPlus FRDM board";
+	compatible = "fsl,imx8mp-frdm", "fsl,imx8mp";
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "red";
+			gpios = <&pcal6416 13 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-1 {
+			label = "green";
+			gpios = <&pcal6416 14 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		led-2 {
+			label = "blue";
+			gpios = <&pcal6416 15 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0xc0000000>,
+		      <0x1 0x00000000 0 0x40000000>;
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&reg_arm>;
+};
+
+&A53_1 {
+	cpu-supply = <&reg_arm>;
+};
+
+&A53_2 {
+	cpu-supply = <&reg_arm>;
+};
+
+&A53_3 {
+	cpu-supply = <&reg_arm>;
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	pmic@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+		regulators {
+			BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <720000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			reg_arm: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <720000>;
+				regulator-max-microvolt = <1025000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			BUCK4 {
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3600000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			reg_buck5: BUCK5 {
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <1650000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <1045000>;
+				regulator-max-microvolt = <1155000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1650000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO3 {
+				regulator-name = "LDO3";
+				regulator-min-microvolt = <1710000>;
+				regulator-max-microvolt = <1890000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
+	pcal6416: gpio@20 {
+		compatible = "nxp,pcal6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcal6416_int>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names = "CSI1_nRST",
+			"CSI2_nRST",
+			"DSI_CTP_RST",
+			"EXT_PWREN1",
+			"CAN_STBY",
+			"EXP_P0_5",
+			"EXP_P0_6",
+			"P0_7",
+			"LVDS0_BLT_EN",
+			"LVDS1_BLT_EN",
+			"LVDS0_CTP_RST",
+			"LVDS1_CTP_RST",
+			"SPK_PWREN",
+			"RLED_GPIO",
+			"GLED_GPIO",
+			"BLED_GPIO";
+	};
+
+	pcal6416_1: gpio@21 {
+		compatible = "nxp,pcal6416";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcal6416_1_int>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names = "P0_0",
+			"P0_1",
+			"AUD_nINT",
+			"RTC_nINTA",
+			"USB1_SS_SEL",
+			"USB2_PWR_EN",
+			"SPI_EXP_SEL",
+			"P0_7",
+			"W2_HOST_WAKE_SD_3V3",
+			"W2_HOST_WAKE_BT_3V3",
+			"EXP_WIFI_BT_PDN_3V3",
+			"EXP_BT_RST_3V3",
+			"W2_RST_IND_3V3",
+			"SPI_nINT_3V3",
+			"KEYM_PCIE_nWAKE",
+			"P1_7";
+	};
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usdhc3 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
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
+&iomuxc {
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL	0x400001c2
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA	0x400001c2
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL	0x400001c2
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA	0x400001c2
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL	0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA	0x400001c2
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x000001c0
+		>;
+	};
+
+	pinctrl_pcal6416_int: pcal6416_int_grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16	0x146
+		>;
+	};
+
+	pinctrl_pcal6416_1_int: pcal6416_1_int_grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x146
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX	0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX	0x140
+			MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS	0x140
+			MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS	0x140
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d6
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d6
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d6
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d6
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d6
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d6
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d6
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
+		>;
+	};
+};
-- 
2.25.1

