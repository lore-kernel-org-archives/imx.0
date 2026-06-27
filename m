Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA03AE6FA
	for <imx@lists.linux.dev>; Sat, 27 Jun 2026 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782571592; cv=none; b=SoNRkmZAFxbU+PWdPDtFmyLoO4gKUWW9TEsOXFIcGnsmmD3BqSci/7AXpY5eZrbMGgaWUOBqBh2BHwdAMsXpy6htgccc5KGg3vAsA3QAnmE0X2UsqICJzbDWDuC5unq/9vaijS8T3acwdFMFf98kQ8x8iI05AsLD0cG0XPaJCD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782571592; c=relaxed/simple;
	bh=v6phTh/vQBJe9ZssYxXP99q6lbKuzAP6bpcvmePPW28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNwV4JJnrXPPQRmB2eveQt/TWxMWuyIEiCrHwCYx7qNuY2RX+lxKyeNnBRxsH965GmoyA/hvfUE59FGfw37uJ1hPnkgQKDwiTkkHdljnBq3LYYjXS00RAlQUw9thmqEz4XdUykuW8aQrYxMg39AuxT1s+c6xBsTtWUhKbHopDCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQ9ga6RO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQ9ga6RO"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so9886785e9.3
        for <imx@lists.linux.dev>; Sat, 27 Jun 2026 07:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782571588; x=1783176388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFv8NIkKdbNaFiQ1ETxfxk/IXJoxx9o35rkX4PGT8fI=;
        b=hQ9ga6ROcvptd84zK9uRpcvu1VpnTjGQByKKdmLQUiE1KIjkDFwN8bQ9DcOtP1v625
         FxzBQA+GJz4xC7Q0qOGV8nvmP8uanH/Pfs++kO4LfSSqVdli/cCUx2ZZfTd2dEdSOa2U
         UKXoeMYQ461OpjeZbt54g3cuRLwck8ZY8DlVdU/dUGcQgy2C5EiduMHV/nmgRk29D7GV
         aA9vxc0Oy0wPZhttPByI4YbIjjZfGPZgBG7+35LQuYiBP4AEnKADay9qftNs7uaRUBs0
         JnQIB4u/eq3DwIpYaw0DdYIqm/sOkIqWm4g2JAymak7ICkBeI3SeKF0dudrXvQtBzslh
         vlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782571588; x=1783176388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VFv8NIkKdbNaFiQ1ETxfxk/IXJoxx9o35rkX4PGT8fI=;
        b=Wnmk4w8toV3hxXdR1WmWlsIzvV7EE59NzvK6dEIuJZ7BAXnB5Pec4dIw5mZ8x2r3tt
         ISbkh5gkNsElbwJos0zqF0KNRKfEdULSqAAuDnTVOCbnJpn5Ga+f2S8n/I05il+TlG5s
         VDT/kuZmNTEnL2bZf2f8eF2dqtyUuLd1hSHnSdDTtsoepa4fZ1YsFHKopycHQpYS3FWL
         0x1KuQQz8Y0A+7GHEXMd+GUFqsUAksvXhPLkQQojJGX8TGOSuRgmmNXxB99TaoZUaqfi
         L6p7n4KxSKSQyObKHFJHQevpPl7esMoTgZ+fZI0c4+uSac2FH2eMp2cm+Gglx75mJYJf
         x1+A==
X-Forwarded-Encrypted: i=1; AFNElJ9f9HqCdrBtlsU9rWyrzZF/4JWGXSejZb1LyXcc1lJZUppSoZZfpjR8OHn+myQacyZiGlA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsKl99E3X/mqMZdKUdIJSAZzwjARl5tPcmDyDLK34qvekzIZdg
	gaZ6bDacFpGXnU44tTrZeTPRtBbambFcAF8oOZiiP8eGviHigmUAxW7D
X-Gm-Gg: AfdE7cl5V0SJlvWYGuDHwAak1Ntn7GnnWo6dV9akY6W8tZUbypnd6TMF3Aa6p6dtJxr
	lwsx22zk/5V+kE5MOq+gQxknlT8wSWJ2Yf/KHZ+r5ujFs4kWXgTFQ/TNpyEj49hmYvYuntYI87J
	xQB+5gUW9bTK1z5kzTPFwoeFkmqMyO677mKcCMcQZb23DhFkapT9v8MKWHJQplZ6MhEb2CFJ4xj
	MAxwIF3DIW8+yOTfExJxAppLVvA9ji7OHiUoVFGjaHFlpi6/FDQSRyyHccG22YE28bcwVi9G9q5
	KAfc7YR24GLt4ZlgcRdRvevbkqfqaRHL3mWFs0a8W9nwnt5iK7h85seHPZgZf38IlZryybZNkFX
	mXO+AD0i+UZHRpc9Y16IYSd1BKdptW3EDyvNgas9Ja9q+vAuTCqIT6fPsTo1cAIUUUqIwu3xv/x
	cSd84VrV/+o4ZZIXLdGkiy2qttytI1mSt4RZAf07yrg9+ZaYE0UoYPno6cGh80tp9eyVZ6oq2bJ
	mLJT7c7dWO16D0fUoHGCHdu2Q0=
X-Received: by 2002:a05:600c:820a:b0:492:6eda:4296 with SMTP id 5b1f17b1804b1-4926eda42afmr77310295e9.8.1782571588337;
        Sat, 27 Jun 2026 07:46:28 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm98709035e9.4.2026.06.27.07.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 07:46:27 -0700 (PDT)
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
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
Date: Sat, 27 Jun 2026 16:46:12 +0200
Message-ID: <17f248241982c2d421e83475d7e0f8b61ba50198.1782571383.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782571383.git.stefano.r@variscite.com>
References: <cover.1782571383.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite DART-MX8MM system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- NXP i.MX8M Mini MPU processor
- Up to 4GB of LPDDR4 memory
- Up to 128GB of eMMC storage memory
- Integrated 10/100/1000 Mbps Ethernet Transceiver
- Codec audio WM8904
- WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-mini/dart-mx8m-mini/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Fixed eth regulator

 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 558 ++++++++++++++++++
 1 file changed, 558 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
new file mode 100644
index 000000000000..2324063f8fd9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite DART-MX8M-MINI
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-mini/dart-mx8m-mini/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx8mm.dtsi"
+
+/ {
+	model = "Variscite DART-MX8M-MINI Module";
+	compatible = "variscite,var-dart-mx8mm", "fsl,imx8mm";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0x80000000>;
+	};
+
+	reg_audio_supply: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_eth_phy: regulator-eth-phy {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_eth_phy>;
+		regulator-name = "eth_phy_pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-enable-ramp-delay = <20000>;
+		gpio = <&gpio1 7 GPIO_ACTIVE_LOW>;
+	};
+
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	sound-wm8904 {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 20 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
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
+&fec1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_fec1>;
+	pinctrl-1 = <&pinctrl_fec1_sleep>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	phy-supply = <&reg_eth_phy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy_vddio>;
+		};
+	};
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
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		rohm,reset-snvs-powered;
+
+		regulators {
+			buck1_reg: BUCK1 {
+				regulator-name = "buck1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+			};
+
+			buck2_reg: BUCK2 {
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
+			buck3_reg: BUCK3 {
+				// BUCK5 in datasheet
+				regulator-name = "buck3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck4_reg: BUCK4 {
+				// BUCK6 in datasheet
+				regulator-name = "buck4";
+				regulator-min-microvolt = <2600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5_reg: BUCK5 {
+				// BUCK7 in datasheet
+				regulator-name = "buck5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6_reg: BUCK6 {
+				// BUCK8 in datasheet
+				regulator-name = "buck6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1_reg: LDO1 {
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			ldo5_reg: LDO5 {
+				regulator-name = "ldo5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			ldo6_reg: LDO6 {
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
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clk IMX8MM_CLK_SAI3_ROOT>;
+		clock-names = "mclk";
+		AVDD-supply = <&ldo5_reg>;
+		CPVDD-supply = <&ldo5_reg>;
+		DBVDD-supply = <&reg_audio_supply>;
+		DCVDD-supply = <&ldo5_reg>;
+		MICVDD-supply = <&ldo5_reg>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+	};
+};
+
+&mu {
+	status = "okay";
+};
+
+&sai3 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MM_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <1536000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+/* BT module */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>, <&pinctrl_bt>;
+	assigned-clocks = <&clk IMX8MM_CLK_UART4>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth_iw61x: bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+/* WIFI */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	non-removable;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc3 {
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
+
+&iomuxc {
+	pinctrl_bt: btgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6		0xc1
+			MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5		0xc1
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
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
+			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
+			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19
+		>;
+	};
+
+	pinctrl_fec1_sleep: fec1sleepgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_GPIO1_IO16		0x120
+			MX8MM_IOMUXC_ENET_MDIO_GPIO1_IO17		0x120
+			MX8MM_IOMUXC_ENET_TD3_GPIO1_IO18		0x120
+			MX8MM_IOMUXC_ENET_TD2_GPIO1_IO19		0x120
+			MX8MM_IOMUXC_ENET_TD1_GPIO1_IO20		0x120
+			MX8MM_IOMUXC_ENET_TD0_GPIO1_IO21		0x120
+			MX8MM_IOMUXC_ENET_RD3_GPIO1_IO29		0x120
+			MX8MM_IOMUXC_ENET_RD2_GPIO1_IO28		0x120
+			MX8MM_IOMUXC_ENET_RD1_GPIO1_IO27		0x120
+			MX8MM_IOMUXC_ENET_RD0_GPIO1_IO26		0x120
+			MX8MM_IOMUXC_ENET_TXC_GPIO1_IO23		0x120
+			MX8MM_IOMUXC_ENET_RXC_GPIO1_IO25		0x120
+			MX8MM_IOMUXC_ENET_RX_CTL_GPIO1_IO24		0x120
+			MX8MM_IOMUXC_ENET_TX_CTL_GPIO1_IO22		0x120
+			MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x100
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1-gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_GPIO5_IO14		0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_GPIO5_IO15		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3-gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18		0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19		0x400001c3
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8		0x140
+		>;
+	};
+
+	pinctrl_reg_eth_phy: regeth-phygrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7		0x41
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_RXFS_SAI3_RX_SYNC		0xd6
+			MX8MM_IOMUXC_SAI3_RXC_SAI3_RX_BCLK		0xd6
+			MX8MM_IOMUXC_SAI3_RXD_SAI3_RX_DATA0		0xd6
+			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC		0xd6
+			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK		0xd6
+			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0		0xd6
+			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ECSPI2_SCLK_UART4_DCE_RX		0x140
+			MX8MM_IOMUXC_ECSPI2_MOSI_UART4_DCE_TX		0x140
+			MX8MM_IOMUXC_ECSPI2_SS0_UART4_DCE_RTS_B		0x140
+			MX8MM_IOMUXC_ECSPI2_MISO_UART4_DCE_CTS_B	0x140
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x194
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d4
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d4
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d4
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d4
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x196
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d6
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d6
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d6
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d6
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d6
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0xc6
+		>;
+	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20			0x140
+			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10		0xc1
+		>;
+	};
+};
-- 
2.47.3

