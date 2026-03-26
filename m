Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC6340627D
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540112; cv=none; b=PiqCx6G1q7p+e+0pfzcWY6QkEaFkOjVycPjIqOWogWyIFil2SKNbv8E1e8xRWwIpu+yWO8e8oa91KMbzahPvoajri0XcNNuknXYLt5wYb6OT05CQk869oMJkN9xXTZ9PDmOrrNrOdPvSJqaMWbZLetqB4463ihy1knOZFmd/vCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540112; c=relaxed/simple;
	bh=Y5leyueyKU1ptbyrOg+xpR8FtztlWLu/gAli2ntyE+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGp/brMJ2+2CcTvo/iEJxbtm/QMuqj7SbQjishk0HiKGRi8d8y7YmUDjXiAfovVrHl29g5nIAgrICrrlVMz/XIdlB2oNM9Pf6jHq+nDyvZjyMCvyRaSJUv7+pK48NuO6cnqSTygsTrWq7w8kkeo1Pu2sc5RwMrN83+lRYR2SBss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJP9bOjn; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJP9bOjn"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b7c2788dso701342f8f.1
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 08:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774540108; x=1775144908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLwr0lPskazevmbTOnohmNUhdi0kSqHX7TJsZ7wqJGA=;
        b=SJP9bOjn83QoY4nHDR2fGgRu3iIxA1ZrIA8B8tX7FcmiKVohAuVzxgAdwHTehHiOhn
         K8xN4jOr8WIWP1VXn6LNI/CSlynQH3us3qb+wIKPXJj7nyIuBSlfPJzo5EKntynjIuH1
         PUdSm+SByxl0v7Ez9WxxzJacchsCHtNhiUSnTVS/OTo7l5CfVY8Pnpv/4nxvbes0lnwp
         hkvM6ZJNYIyWC74yfHaZi84rVeBj1LCYBWXg/9FNxeZ5S1SkIMoPQWuZO09fZRveobCN
         x6fBJ2C2Bl8FBBeiuA/zJVuI3a4Y2SjU0EiXDnelHc6Tx8rHm0PouVYYggY3ouJ72T7a
         kRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540108; x=1775144908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QLwr0lPskazevmbTOnohmNUhdi0kSqHX7TJsZ7wqJGA=;
        b=bJDyeIIC2L20pLPXtSobFQvB1WY+T+yBcm3DN0LlHGAJG6B070uVH1szRLpZGSb21l
         QI0GJ5RBc7V2vXaKNqnrS39oNKIL962hziJ1vXiLW7qRyl0m3VJZ8UTMMeod86y49S3N
         KenPchfhY4JwqMaPmyl1NnloKVCw5zG1siFwLobPHxmon/ZwlzUyWzArI5OmIfQ6Qad3
         19EamkBWzXf8k8T8BjAi/ui7DJeFd3yPf4VIpLFjk2M665TNfhxMR4cHsJ9TmzAtBIUg
         u1kKUfFY9N7B9gxfGXK21M4CTnklTZjjAwcHgm8FH9zTR/dmgoHvunJVmKURZktq53AM
         CxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQAfxeID+HFRDLrdh4XCT1FE23/OHLu7Dhje4h0KQIJ7opWEOgx6dVUcNgFCK1HzVDHj0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCmQZzRcUG7I+to7n8lj1dROx0kz6oCjUukAjzUjoAYM+9CAz/
	ZUt8nshKE5B9Hc1CTgt2bi2zfaw2CKWfqWSMtuWUyUYPSJhGhxP8dGbN
X-Gm-Gg: ATEYQzx/9SjL/WFf6i7kwQHRCpvng4cGnjRAx1ZK3FVvCqBdk2nfq1EzhjkeFkkF4kN
	r7XQWXspXK9y6XGWmFAbxnVUWDkpqbAm9CLtJ21/DA9EXU+AU890FZ7HCgb90QAy8wnwpnN/Ffk
	T9Sg0sL3KpGys+67qFnU5qLdEnse7AK2egC8Jm74m3klILqtwDsLBj1kgMM5ZB/J1AOX1UBuHr7
	eWSTs/+4++vhgFnzi9T0inGZCDwYVyOZXNchuPGwAxs7Dff6xTwKI5cciHNpTTx2qjFeUVBG7Qj
	NgmTvl8JuhU0M3S8qgBbw1bNmmbsM0Fk2NXV+q9Q52HVPo2kEICjot73W246jbVkXYn42vzXldG
	9fzARbCh2OCsb0d23lAGRIMDutONZFP6DynC7eFrlhiZAWez4rj+96IUoZedZBO9ay9Tc9YqBP/
	TFGxsFmZSaXT3ZMbkTb40WLVw1sMx+m3i1BdygVlsjdpI+s0I4dPMTy4E5A8z9QK9uQgmMBhy0f
	TUNiRo90LIvlm+VUcnucqzFh4aSyT+FQAQ1Ug==
X-Received: by 2002:a5d:5d0e:0:b0:439:ca9b:1f61 with SMTP id ffacd0b85a97d-43b889a4a1bmr12495591f8f.17.1774540108198;
        Thu, 26 Mar 2026 08:48:28 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942e52sm8831016f8f.9.2026.03.26.08.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:48:27 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite DART-MX93
Date: Thu, 26 Mar 2026 16:47:18 +0100
Message-ID: <304e5edc9ed11a552ac96c28d1046e4b13d5f960.1774539301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774539301.git.stefano.r@variscite.com>
References: <cover.1774539301.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite DART-MX93 system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- NXP i.MX93 MPU processor
- Up to 2GB of LPDDR4 memory
- Up to 128GB of eMMC storage memory
- Integrated 10/100/1000 Mbps Ethernet Transceiver
- Codec audio WM8904
- WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-93/dart-mx93/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 462 ++++++++++++++++++
 1 file changed, 462 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
new file mode 100644
index 000000000000..bfed6625f5ab
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite DART-MX93
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-93/dart-mx93/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/usb/pd.h>
+#include "imx93.dtsi"
+
+/ {
+	model = "Variscite DART-MX93 Module";
+	compatible = "variscite,var-dart-mx93", "fsl,imx93";
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
+			sound-dai = <&sai1>;
+		};
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio4 14 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio3 7 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+};
+
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1>,
+		 <&mu1 1 1>,
+		 <&mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	status = "okay";
+};
+
+&eqos {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-1 = <&pinctrl_eqos_sleep>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	snps,clk-csr = <5>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		clock-frequency = <1000000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+		};
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clk IMX93_CLK_SAI1_GATE>;
+		clock-names = "mclk";
+		AVDD-supply = <&buck5>;
+		CPVDD-supply = <&buck5>;
+		DBVDD-supply = <&buck4>;
+		DCVDD-supply = <&buck5>;
+		MICVDD-supply = <&buck5>;
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
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
+	};
+
+	pmic@25 {
+		compatible = "nxp,pca9451a";
+		reg = <0x25>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <650000>;
+				regulator-max-microvolt = <2237500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <2187500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck4: BUCK4 {
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5: BUCK5 {
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+/* BT module */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>, <&pinctrl_bt>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&mu1 {
+	status = "okay";
+};
+
+&mu2 {
+	status = "okay";
+};
+
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+/* WiFi */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	keep-power-in-suspend;
+	bus-width = <4>;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_bt: btgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDIO__GPIO4_IO15				0x51e
+		>;
+	};
+
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
+			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
+			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
+			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
+			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
+			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
+			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
+			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
+			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
+			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
+			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
+			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
+			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
+			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
+			MX93_PAD_UART2_TXD__GPIO1_IO07				0x51e
+		>;
+	};
+
+	pinctrl_eqos_sleep: eqos-sleepgrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_MDC__GPIO4_IO00				0x31e
+			MX93_PAD_ENET1_MDIO__GPIO4_IO01				0x31e
+			MX93_PAD_ENET1_RD0__GPIO4_IO10				0x31e
+			MX93_PAD_ENET1_RD1__GPIO4_IO11				0x31e
+			MX93_PAD_ENET1_RD2__GPIO4_IO12				0x31e
+			MX93_PAD_ENET1_RD3__GPIO4_IO13				0x31e
+			MX93_PAD_ENET1_RXC__GPIO4_IO09				0x31e
+			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08			0x31e
+			MX93_PAD_ENET1_TD0__GPIO4_IO05				0x31e
+			MX93_PAD_ENET1_TD1__GPIO4_IO04				0x31e
+			MX93_PAD_ENET1_TD2__GPIO4_IO03				0x31e
+			MX93_PAD_ENET1_TD3__GPIO4_IO02				0x31e
+			MX93_PAD_ENET1_TXC__GPIO4_IO07				0x31e
+			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06			0x31e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e
+			MX93_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3_gpio: lpi2c3gpiogrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__GPIO2_IO28				0x40000b9e
+			MX93_PAD_GPIO_IO29__GPIO2_IO29				0x40000b9e
+		>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK				0x31e
+			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC			0x31e
+			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00			0x31e
+			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00			0x31e
+			MX93_PAD_I2C2_SDA__SAI1_RX_BCLK				0x31e
+			MX93_PAD_I2C2_SCL__SAI1_RX_SYNC				0x31e
+			MX93_PAD_UART2_RXD__SAI1_MCLK				0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1-sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__GPIO1_IO12				0x31e
+			MX93_PAD_SAI1_TXFS__GPIO1_IO11				0x31e
+			MX93_PAD_SAI1_TXD0__GPIO1_IO13				0x31e
+			MX93_PAD_SAI1_RXD0__GPIO1_IO14				0x31e
+			MX93_PAD_UART2_RXD__GPIO1_IO06				0x31e
+			MX93_PAD_I2C2_SDA__GPIO1_IO03				0x31e
+			MX93_PAD_I2C2_SCL__GPIO1_IO02				0x31e
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX			0x31e
+			MX93_PAD_DAP_TDI__LPUART5_RX				0x31e
+			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B			0x31e
+			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B			0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK				0x1582
+			MX93_PAD_SD1_CMD__USDHC1_CMD				0x40001382
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0			0x40001382
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1			0x40001382
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2			0x40001382
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3			0x40001382
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4			0x40001382
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5			0x40001382
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6			0x40001382
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7			0x40001382
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE			0x1582
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK				0x158e
+			MX93_PAD_SD1_CMD__USDHC1_CMD				0x4000138e
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0			0x4000138e
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1			0x4000138e
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2			0x4000138e
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3			0x4000138e
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4			0x4000138e
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5			0x4000138e
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6			0x4000138e
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7			0x4000138e
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK				0x15fe
+			MX93_PAD_SD1_CMD__USDHC1_CMD				0x400013fe
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0			0x400013fe
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1			0x400013fe
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2			0x400013fe
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3			0x400013fe
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4			0x400013fe
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5			0x400013fe
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6			0x400013fe
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7			0x400013fe
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK				0x1582
+			MX93_PAD_SD3_CMD__USDHC3_CMD				0x40001382
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0			0x40001382
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1			0x40001382
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2			0x40001382
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3			0x40001382
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK				0x158e
+			MX93_PAD_SD3_CMD__USDHC3_CMD				0x4000138e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0			0x4000138e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1			0x4000138e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2			0x4000138e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3			0x4000138e
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK				0x15fe
+			MX93_PAD_SD3_CMD__USDHC3_CMD				0x400013fe
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0			0x400013fe
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1			0x400013fe
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2			0x400013fe
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3			0x400013fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3-sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20				0x400
+			MX93_PAD_SD3_CMD__GPIO3_IO21				0x400
+			MX93_PAD_SD3_DATA0__GPIO3_IO22				0x400
+			MX93_PAD_SD3_DATA1__GPIO3_IO23				0x400
+			MX93_PAD_SD3_DATA2__GPIO3_IO24				0x400
+			MX93_PAD_SD3_DATA3__GPIO3_IO25				0x400
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3wlangrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDC__GPIO4_IO14				0x51e
+			MX93_PAD_SD2_RESET_B__GPIO3_IO07			0x51e
+		>;
+	};
+};
-- 
2.47.3

