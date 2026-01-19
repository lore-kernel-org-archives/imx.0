Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE0C366DD7
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 18:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768847783; cv=none; b=DFO+ipES3houASXSE+Q9kSl2QKwrB5AtzWbDpcB/Xp7pqhdLFW5meqSuleV/9zshsOTRkD2c+3AyxgCZleK/wALFv0WY3QohIL+GuQH/SfmeRN353JlIpT/cV9TX61SBzVpVEUYRguG7AsJpGC/y4uXb25VW37JlnTTgPj3J5PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768847783; c=relaxed/simple;
	bh=mMmx1xk8J6bzNExY8RF3JAgwlwfZEIL/QOPFqOskA1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTmUlQnj9swKqusAKRHT7wJoddmhv2AhMPvEWyOYaXtLVlO/4MuvZmeJfRjzz8zDCZarUWG9E2v44yMupTCkCoIvQrIdf860iGyL2YwUpO4ZheJqBawH5TOJy8ncY85lmJVgw/NM//YCVTJHy/jMkh0KKPDW9Sdl6419f/yl92E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpTP2jxq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpTP2jxq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so25389575e9.0
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768847780; x=1769452580; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCGG38wXimoqcJqw4uGBpvIPxBpbZ4VH6uQEUzGkvoY=;
        b=dpTP2jxq0VExcxHU1zxcOvTMwc10sEH4K0E8tv9Gaoc9TgbmemNRT9yuLqrvvck5lI
         +mZpQVo7XRGM89aw0cp2wHx2zQnHD/RYm0/rcyXZTOKXdMNqU0M35rcVLks9RJ33OjIi
         ZSPo1A3PCvcjQFLPjUHfABH0ciSUA47yz9kY63yljXls96bumOmEPnx90xFk1gTG1SaX
         VHYDYk+Gb3G929Jxg7G1tigkyysobkPJxGbA/EuKYasLCVnm0Bnd+nlruxEQHKyodHej
         STjXJXC/8xjIadJqxMJm6qJmuvtjL6pw1pkFzIm54Gbz/zGqP4e2oKSQL18G+Sm54VpJ
         i15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768847780; x=1769452580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VCGG38wXimoqcJqw4uGBpvIPxBpbZ4VH6uQEUzGkvoY=;
        b=qH+Eiw+VXfA4T05/R5IMMQvcgf/c+eFUHEisc7e9UX+otnyW5+rlHszmtvMhLtD1zV
         P7BZyMWuFqE0l1FrrhqdfNrw7s8xF51EbByL80pJ1Q4T3AZWtChCzGL5hpH0wwS12KJk
         wOHeqNMMPWO+GtOeOF7iKndhXhQ9V/YzY2Ov0YjO03SjooCevO9hmJyXeLlCzR7W4Ck9
         6DKK0d1x8WDpJU80iePWzWM8aMtgEReKSs1sNSzx6eiqay55G6YYD9bDREq7xLt8UTyE
         yv9sNYeTkYZcsmWhYCcZLql9msaBmnButK4+Uh2RZx189TFuyaz29Vmatu3dHBDmGTTj
         MLnA==
X-Forwarded-Encrypted: i=1; AJvYcCU5wrHrgv2k5+NIERdetCbp5VcQh5S5FUeIuKq3xza7n37F81HxdF8k3OQ6/WhgkB3MOlw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxI7/adzKPJMSg21cgWcRvhxsWe7TiIc5+HPugUFzbFP35ziiO1
	P4hQ6GcY6MtDkJgp+tyz9c1NonyXtCSgJnN9DTWZ6XEJElgOlSOgc7np
X-Gm-Gg: AY/fxX4Kiq4BckaPB6zkXNQkXXfGEiBWA3Z78ajLFZIGEOXJfMTy4p74rdpuwjhS08Y
	UT6YLgn5kCzEldcWJSxqnxB/xcENZ4KTdzHipXGXSpYb1PFPCS25aS4GJ71C0JYt1GHgLdNNcG2
	eRKQxPig/6jeRlSF3q3drGaQHMdjB5oL9TT0QoWTfeSCIkidjohw8HGoqjqpFro9Wm+UoaearEY
	w4A986EmKF17jho66cihSyPAG36moQ5yh5f3fFqeyq4Gcf3/lLF0MH76TuvSfWaqEEk4esYvyA3
	Pgl/KGcppaKsqjU2gTXVpYAOa7jBm8kfIgUmPBP3dZzM4NSyiyl/sF19FR5JgSMs/x1N9ceV5Wx
	IEwC764/dinw5wnxeV1vyjhL669i8KJIX92piCLNxG5Ny2MNeImunnqC+4UN1GSuDCgkSu0J6YS
	gAmC1iE+SO7pXcR7PChB+jTYIAs9wEH0F4+d53VyV97IxD3TAHG2J/OIxPjWyDMD/GvMeYRc3fb
	cQlVIb3JeM09WwKxfIIUSZMdJOSICfoK019
X-Received: by 2002:a05:600c:45d5:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-4801e33c197mr156513735e9.19.1768847779538;
        Mon, 19 Jan 2026 10:36:19 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm203965015e9.12.2026.01.19.10.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:36:19 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/3] arm64: dts: freescale: Add support for Variscite DART-MX95
Date: Mon, 19 Jan 2026 19:35:54 +0100
Message-ID: <20260119183604.88192-3-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119183604.88192-1-stefano.r@variscite.com>
References: <20260119183604.88192-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite DART-MX95 system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- NXP i.MX95 MPU processor
- Up to 16GB of LPDDR5 memory
- Up to 128GB of eMMC storage memory
- Integrated 10/100/1000 Mbps Ethernet Transceiver
- Codec audio WM8904
- WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-95/dart-mx95/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4:
- Fix typo in spacing
- Remove vpu and cm7 reserved memory
- Add GPIO_OPEN_DRAIN to i2c gpios
- Move pinmux to eof
v3:
- Fix specific node name with generic one
- Audio regulator cleanup

 .../boot/dts/freescale/imx95-var-dart.dtsi    | 425 ++++++++++++++++++
 1 file changed, 425 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
new file mode 100644
index 000000000000..923c4e6b848d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite DART-MX95
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-95/dart-mx95/
+ *
+ * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx95.dtsi"
+
+/ {
+	model = "Variscite DART-MX95 Module";
+	compatible = "variscite,var-dart-mx95", "fsl,imx95";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0 0x80000000>;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "+V1.8_SW";
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "+V3.3_SW";
+	};
+
+	reg_audio: regulator-audio-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904_supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux_cma: linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x7F000000>;
+			reusable;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+		};
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
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 27 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&enetc_port0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	phy-handle = <&ethphy0>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	status = "okay";
+};
+
+&lpi2c8 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default","gpio","sleep";
+	pinctrl-0 = <&pinctrl_lpi2c8>;
+	pinctrl-1 = <&pinctrl_lpi2c8_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c8_gpio>;
+	scl-gpios = <&gpio2 10 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 11 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&scmi_clk IMX95_CLK_SAI3>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_audio>;
+		CPVDD-supply = <&reg_audio>;
+		DBVDD-supply = <&reg_audio>;
+		DCVDD-supply = <&reg_audio>;
+		MICVDD-supply = <&reg_audio>;
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
+/* BT */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>, <&pinctrl_bt>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&mu7 {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_emdio>, <&pinctrl_phy0res>;
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		reg = <0>;
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reset-gpios = <&gpio5 16 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <100000>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_YELLOW>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+		};
+	};
+};
+
+&netc_timer {
+	status = "okay";
+};
+
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc1 {
+	pinctrl-names = "default","state_100mhz","state_200mhz","sleep";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+/* WiFi */
+&usdhc3 {
+	pinctrl-names = "default","state_100mhz","state_200mhz","sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_gpio>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	wakeup-source;
+	keep-power-in-suspend;
+	status = "okay";
+};
+
+&wdog3 {
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_bt: btgrp {
+		fsl,pins = <
+			IMX95_PAD_CCM_CLKO3__GPIO4_IO_BIT28				0x31e
+		>;
+	};
+
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC			0x57e
+			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO			0x97e
+		>;
+	};
+
+	pinctrl_phy0res: phy0resgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO36__GPIO5_IO_BIT16				0x31e
+		>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3			0x57e
+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2			0x57e
+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1			0x57e
+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0			0x57e
+			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL		0x57e
+			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK		0x58e
+			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL		0x57e
+			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK		0x58e
+			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0			0x57e
+			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1			0x57e
+			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2			0x57e
+			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3			0x57e
+		>;
+	};
+
+	pinctrl_lpi2c8: lpi2c8grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO10__LPI2C8_SDA					0x40000b9e
+			IMX95_PAD_GPIO_IO11__LPI2C8_SCL					0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c8_gpio: lpi2c8gpiogrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO10__GPIO2_IO_BIT10				0x31e
+			IMX95_PAD_GPIO_IO11__GPIO2_IO_BIT11				0x31e
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO17__SAI3_MCLK					0x31e
+			IMX95_PAD_GPIO_IO16__SAI3_TX_BCLK				0x31e
+			IMX95_PAD_GPIO_IO26__SAI3_TX_SYNC				0x31e
+			IMX95_PAD_GPIO_IO20__SAI3_RX_DATA_BIT0				0x31e
+			IMX95_PAD_GPIO_IO21__SAI3_TX_DATA_BIT0				0x31e
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO00__LPUART5_TX					0x31e
+			IMX95_PAD_GPIO_IO01__LPUART5_RX					0x31e
+			IMX95_PAD_GPIO_IO02__LPUART5_CTS_B				0x31e
+			IMX95_PAD_GPIO_IO03__LPUART5_RTS_B				0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK					0x158e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD					0x138e
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x138e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK					0x158e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD					0x138e
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x138e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK					0x15fe
+			IMX95_PAD_SD1_CMD__USDHC1_CMD					0x13fe
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x13fe
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x13fe
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x13fe
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x13fe
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x13fe
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x13fe
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x13fe
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x13fe
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x15fe
+		>;
+	};
+
+	pinctrl_usdhc3_gpio: usdhc3gpiogrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO27__GPIO2_IO_BIT27				0x31e
+			IMX95_PAD_CCM_CLKO4__GPIO4_IO_BIT29				0x31e
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			IMX95_PAD_SD3_CLK__USDHC3_CLK					0x158e
+			IMX95_PAD_SD3_CMD__USDHC3_CMD					0x138e
+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0				0x138e
+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1				0x138e
+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2				0x138e
+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3				0x138e
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD3_CLK__USDHC3_CLK					0x158e
+			IMX95_PAD_SD3_CMD__USDHC3_CMD					0x138e
+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0				0x138e
+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1				0x138e
+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2				0x138e
+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3				0x138e
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD3_CLK__USDHC3_CLK					0x15fe
+			IMX95_PAD_SD3_CMD__USDHC3_CMD					0x13fe
+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0				0x13fe
+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1				0x13fe
+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2				0x13fe
+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3				0x13fe
+		>;
+	};
+};
-- 
2.47.3

