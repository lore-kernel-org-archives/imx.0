Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97BD3DA7F5
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039045; cv=none; b=B2tJjmnI3nxiPy1Oa8UCazq06EyajtEsN0Rdm99QS4/RbvzriDXLdsuerhq8t31IU6WpV6rlpI6yyUgmOCobexV9j9gLzkP/8V9tbP8suhyCrW7mXM/fQiKd9exXcUKgWnqP24nwjTrcX8OlVHPVhOgNntV5FYWm3IFYtqnr76M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039045; c=relaxed/simple;
	bh=L1E3dWyWdDd7jZD1Ljd/tvmAAf/s8p29tGRQi/gW3oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VcrYLz5XtlxtrrGJFGE+C/5pdx/Tz0J5d3O+gfiURbaBNFYRZL1geQKIU4FpWidd+4l7hRsMP+xrcszGqKHvY8q/L676+63aJtBC+tMeLxCrdtx051K6zm8ytFRGHgFw4CckTyXfjnoExo2AjBnNLr5V6Y/Y7w0G9fJSNtM228k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDvtjRWZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDvtjRWZ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48371bb515eso87659015e9.1
        for <imx@lists.linux.dev>; Wed, 25 Feb 2026 09:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772039042; x=1772643842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q89IZ5f7lnuVieQ6fXoMMk/Jf/u8T4bXJfz9kjG6XDc=;
        b=GDvtjRWZBE+auiJSeWOkRFOQ5F3KqLQGA98YMV/ar5qvlfOFfQucJLJ5+9ypoDiQxT
         Rb/y730yQ5A2hicj25frwho1AVDX3QSzHHSfYvCciPuFHnvx/jhcSo27bCQFhBUqImKn
         eH+0ftZDK6e6QD+ltlDOw53FUFI2qsaIxvwTh1CHz5w5v9yB1wSD0+3ryGTEHjyMVLO3
         LYLAzxFtw5ZaWjtmhQ2AUQ1woDZeyvVckTRUhqYgmSIGkiwFuJ/3zchOczjRO4wDkRHA
         HveLbcoSgv2Fyy4EuZkKLXbW/8klJxrItIvOcA9H0WcPmRm5R8nMNDFnrs+4ovVQsuuf
         J17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039042; x=1772643842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q89IZ5f7lnuVieQ6fXoMMk/Jf/u8T4bXJfz9kjG6XDc=;
        b=b6yYg3y9ngBY4fPS/dm4h3ENzs3hQv2njPoE3VfSDvjGUt2bb++wkUSv53Tv1bUaYO
         p0/ePH1YN9HG1pcZ7wNaYzDoH0JlDphVYHz2RS/Bqh7fUXNuonYPo/ug1xpQkkcV0Vmk
         Xs8LhbK+E5nXgGtDlZScvBTIqGpyVYZfm7Q6u/CmpRsv/OmQeGYXwPHiBf2N7onGPqpw
         2jjBON26/FRzbGtnAVvIF0286UiuBxsfmtDmVdsQ5dPo+X9tBrrHZ1uXQ5PajGGCOXb6
         EPSGM33dXDcpfeLx0BCtMbV+YtUqmdLqk3dFmQ6OsSwjWCH0bYFCh6l+lV1VA99Qgfvr
         5F5w==
X-Forwarded-Encrypted: i=1; AJvYcCUTIbVAq4VpFjT4eeoH0AhQKq6YlQpjB24vJy1MD7Qw2osWqeMp9txxa4GdurIApZkR7ZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXGpnZeTWi4Kq+MQ/nRS6gCGNU5+uYqui37+FFmbI2TY4PDz0C
	Rmg+drWpsOtIC0dCF4FhQyLt1rjUKU0wyZCZipvrAkte4pOM5QwDzKYG
X-Gm-Gg: ATEYQzwKudVKxac0ijLHCRF4aExa2QrC/kXGlpuiAYjN8Mz1hGHGW0Mw++6izFitO6X
	DFQUxQF8JWQAAHlKqsY6/m9Qq75r/NZU5kSYY2nDYP1B/JVcjZhS1BDhSpwquoIdqiBMe4oJ4d/
	/UsK6tPypBseqYUHwroctcb0uwwUgPEt8jQq/y8/uowABg9WMnnTQd6aqyegG0yUCAIekEsFjTB
	udBkXx7oO3Kr9I7KYiSH3/U0vlZv74zosuQcSSmkEzMGaU8tBQSCbFsELHpljyfWs+TlMT6/C9q
	3Y2fG5t7pwA+0IFNPL8nAVo2neONY7OfdIH6NcB+ULkBNwyCuEEfOXwHksyWJde09GQt1hEWjAe
	T8SX+xsyT2JyESV0YjO0uDHe4AAxgoh1tAvkoHj8adQQ1hCd5fHBWeS1CNyKO/l+ooOsnwfEmLl
	zpwKYMCdW0NfuNp9S5LFxdhpwPr6SRvE2JMLJZW1WD3PzuUGVvjbT4n0uvPpKBwEg2bEsmBnYKH
	MZE2YEQ+bA71R6nxpAYu2VoGN0YeiVPDAe1PfsCrJ2g0o/vHQ==
X-Received: by 2002:a05:600c:1f8f:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-483a962e459mr317359385e9.16.1772039041787;
        Wed, 25 Feb 2026 09:04:01 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70b3f3sm88276935e9.6.2026.02.25.09.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:04:01 -0800 (PST)
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
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 2/3] arm64: dts: freescale: Add support for Variscite DART-MX95
Date: Wed, 25 Feb 2026 18:03:37 +0100
Message-ID: <20260225170347.77841-3-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225170347.77841-1-stefano.r@variscite.com>
References: <20260225170347.77841-1-stefano.r@variscite.com>
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
v6:
- Order by node name instead of by label
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
index 000000000000..588b283a4742
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
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_audio: regulator-audio-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904_supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
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
+	pinctrl_phy0res: phy0resgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO36__GPIO5_IO_BIT16				0x31e
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

