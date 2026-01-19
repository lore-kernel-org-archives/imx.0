Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C2E38A9D9
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 18:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768847791; cv=none; b=Z1c2XU1SOUnv9u5CruwtCeuZK84Q3DqveIgycd5wYDOPtQoDetkeNeemxCmzZs49YCLg5sWLKykprZP9+N00j0444ANOVqmj2b7D5oqETGebmRnQsXB5QVto4BunBbmgCVdU5btLfkPdbdMciQ/4d04H6/Jdot3TovQB2E4SrWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768847791; c=relaxed/simple;
	bh=IbPzE0WDAwJ/P6nIIRVOCCn3M9FZ9ll11bSo201ohY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JIs+kjNtko/Xu3flPmuNMxWTZhvU1JiO+wzt0ISnyfnBNCnqRXRdarq3AXwezH3wWbPUX4I4VV1AidaEWejF0l4Qz6M+L7cNrG20pwR8qg8pju0kESVzWGwyBM/IGWJzKrmS6l33QAd0KRP3rttXx+DUZsm/Z/MuzXYP7peMF24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hqf2K8uZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hqf2K8uZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so19040155e9.2
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768847783; x=1769452583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amP5gd+LJhguQG1i9nBrQhhbf/whKzSJNPG/Nahgwto=;
        b=Hqf2K8uZmDdZvQXFWaBQDPn09tZ5lXGOFQysD6nlZAmzhREczoHdIe3d9Q92jHZL1K
         55PutlRvTVA84Vp7Ebz14hOQRju5PLtm66q3JD7x/GmmXIN9N71aHgRU4Y91/AqsXrAc
         xBPQZUjT1WEhZu/VY409KrKfwFAyolVvCWJ7oGXMEbmOsQkR9w5/6MB6Gmi85UCyewVB
         ASTeMCr4WlatSVSN9BcZLoFj2DQA5SXJofEnmHZd9hm+IH1FKxcpx6o4TnC9L8eIYr7z
         Nd3QEycvdW9nznNtlp97qUZ1NDHT1LvPA4mGDr6LDwu2/A40ejvyewEU+ekikVpcK5vK
         jqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768847783; x=1769452583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=amP5gd+LJhguQG1i9nBrQhhbf/whKzSJNPG/Nahgwto=;
        b=bKRYY4Rb3BbXihY4T6+eggw7SXw9mwprF/z2Kbjfg2qMV/wtk8xjQ0oPjfQY9/iOpi
         5rvVyJolnbcB98BwyQGlYSFw84O/KlAFRPAGuVRx/4/F7pO/cou7PgiXC1/vPvt6mWPq
         OMkMh7twlx04+cutVglq7W0Ax9hZtkzT1IXDdFwrqYwYLm3OA2NyhYddtU4l29FMcMOU
         uq1XQMBNGMpaUVaUHQ/Yi0FjrhtbxszuJjqmYWNNK09v93ZeD8dEFUehgVKNhKDm+EsZ
         VPza9I4Nl0WZQqLGqz+WQEsjgTUAh/P11YU16UbDH+Ctio8BjFfJqYkcHSkjAupsb+Ly
         65iA==
X-Forwarded-Encrypted: i=1; AJvYcCVxuWdbrXDr+R5f0XVQOC9ksGYuFtfx85Te/I64xNoWH+AMgmzqM+BFSMqkd4Odlzgqgvo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+9VLd26GkaGS/PQGwzGSPb8EfgNE7Bj0otvMHdS7etki3Z4lg
	IbIsRNHQqfhShXQjyhcyKCARXOmsQ361B51CnIOQIJCqPXg09nDAqjh7
X-Gm-Gg: AY/fxX626qxNpwy847kiLRMZZF1Uguy5nB0OJ4JL95j+qlilcatDDb8p/40JhJKF3l5
	ZP0WabyF39RGw3fdWVIpChWd6Ui2jPYmpT2NGXZnRvnQy0KskPCRCj6j1ND+rLidUvyJzsfxIhU
	WzN6RkDxa/Sg5UVO2kPqvEvvV4lxU9x1apI3Mv2TFOBPt+88MBJgcwp6IIP/DuXkmyeo4u1mSW7
	oZ/oNulTyiyZnsd2k9k4MebhX+h2n2gfmh05KPHIKM89TB84F2jEtu9mDeA4A6uwovpCElcFjsK
	6tauOVxceaVrIwQGWoTQnikVY//bq707kQyuA+9l5LURf+ywHUFe/TU66WfiBnog8eyuIo8JEWN
	SnXqBEmbqA+tOWMnlXRvZkwCJXtsFaWoTp82iKBeqglfylTRM/kloIkuaJF6TBphGgjwkV4Qv8J
	GPIonVrRhu88hw6ANSGM5AbfiGSqlW81UqRhmXwd9+nYPSIz38q5yKy6E/i+nxD5k0Vilwl/DOZ
	wZtZ8FpZozkdkHGyFIR9MEcsQ==
X-Received: by 2002:a05:600c:8207:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-4801eb11027mr160099335e9.31.1768847782467;
        Mon, 19 Jan 2026 10:36:22 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm203965015e9.12.2026.01.19.10.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:36:22 -0800 (PST)
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
	Yannic Moog <y.moog@phytec.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/3] arm64: dts: imx95-var-dart: Add support for Variscite Sonata board
Date: Mon, 19 Jan 2026 19:35:55 +0100
Message-ID: <20260119183604.88192-4-stefano.r@variscite.com>
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

Add device tree support for the Variscite Sonata carrier board with
the DART-MX95 system on module.

The Sonata board includes
- uSD Card support
- USB ports and OTG
- Additional Gigabit Ethernet interface
- 10Gb Ethernet SFP+ connector
- Uart interfaces
- OV5640 Camera support
- GPIO Expanders
- RTC module
- TPM module
- PCIE support

Link: https://variscite.com/carrier-boards/sonata-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v5:
- Fix newlines and nodes order
v4:
- Add GPIO_OPEN_DRAIN to i2c gpios
- Move pinmux to eof
v3:
- Fix specific node names with generic ones
- Remove fixed-link property for SFP
v2:
- Add SFP cage node for enetc_port2 following sff,sfp.yaml binding

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-var-dart-sonata.dts   | 591 ++++++++++++++++++
 2 files changed, 592 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0..411f86013ec6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -404,6 +404,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
new file mode 100644
index 000000000000..840eaa274b8c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -0,0 +1,591 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Variscite Sonata carrier board for DART-MX95
+ *
+ * Link: https://variscite.com/carrier-boards/sonata-board/
+ *
+ * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include "imx95-var-dart.dtsi"
+
+/ {
+	model = "Variscite DART-MX95 on Sonata-Board";
+	compatible = "variscite,var-dart-mx95-sonata",
+		     "variscite,var-dart-mx95",
+		     "fsl,imx95";
+
+	aliases {
+		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port1;
+		ethernet2 = &enetc_port2;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	typec_con: connector {
+		compatible = "usb-c-connector";
+		data-role = "dual";
+		label = "USB-C";
+		op-sink-microwatt = <0>;
+		power-role = "dual";
+		self-powered;
+		sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+		source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+		try-power-role = "sink";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				typec_con_hs: endpoint {
+					remote-endpoint = <&usb3_data_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				typec_con_ss: endpoint {
+					remote-endpoint = <&usb3_data_ss>;
+				};
+			};
+		};
+	};
+
+	clk_osc_can0: clock-osc-40m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led-heartbeat {
+			label = "Heartbeat";
+			gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca6408_1 7 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-up {
+			label = "Up";
+			linux,code = <KEY_UP>;
+			gpios = <&pca6408_1 5 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca6408_1 4 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-down {
+			label = "Down";
+			linux,code = <KEY_DOWN>;
+			gpios = <&pca6408_1 6 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VDD_SD2_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <12000>;
+	};
+
+	reg_phy1_supply: regulator-phy1 {
+		compatible = "regulator-fixed";
+		regulator-name = "SUPPLY_PHY1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca6408_2 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <10000>;
+		regulator-always-on;
+	};
+
+	sfp0: sfp {
+		compatible = "sff,sfp";
+		i2c-bus = <&lpi2c3>;
+		los-gpios = <&pca9534 1 GPIO_ACTIVE_HIGH>;
+		maximum-power-milliwatt = <2000>;
+	};
+};
+
+&enetc_port1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enetc1>;
+	phy-handle = <&ethphy1>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	status = "okay";
+};
+
+&enetc_port2 {
+	phy-mode = "10gbase-r";
+	sfp = <&sfp0>;
+	status = "okay";
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	status = "okay";
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
+	scl-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pca9534: gpio@22 {
+		compatible = "nxp,pca9534";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+
+		pcie2-sel-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "pcie-clk-sw";
+		};
+
+		sfp-sel-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "sfp-sw";
+		};
+	};
+
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		reset-gpios = <&pca6408_2 4 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
+	typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
+
+		port {
+			typec_dr_sw: endpoint {
+				remote-endpoint = <&usb3_drd_sw>;
+			};
+		};
+	};
+
+	/* DS1337 RTC module */
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-source;
+	};
+};
+
+&lpi2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c4>;
+	pinctrl-1 = <&pinctrl_lpi2c4>;
+	status = "okay";
+};
+
+&lpi2c8 {
+	pca6408_1: gpio@20 {
+		compatible = "nxp,pcal6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pca6408_2: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+	};
+};
+
+&lpspi7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi7>;
+	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* Resistive touch controller */
+	ads7846: touchscreen@0 {
+		compatible = "ti,ads7846";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
+		pendown-gpio = <&gpio2 24 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <1500000>;
+		ti,x-min = /bits/ 16 <125>;
+		ti,x-max = /bits/ 16 <4008>;
+		ti,y-min = /bits/ 16 <282>;
+		ti,y-max = /bits/ 16 <3864>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,pressure-max = /bits/ 16 <255>;
+		ti,debounce-max = /bits/ 16 <10>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,keep-vref-on;
+		wakeup-source;
+	};
+};
+
+/* Console */
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+/* Header (J12.4, J12.6) */
+&lpuart8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart8>;
+	status = "okay";
+};
+
+&netc_emdio {
+	ethphy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
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
+&pcie0 {
+	reset-gpio = <&pca6408_2 3 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie1 {
+	reset-gpio = <&pca6408_2 2 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&usb2 {
+	dr_mode = "host";
+	adp-disable;
+	hnp-disable;
+	srp-disable;
+	disable-over-current;
+	status = "okay";
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
+		};
+	};
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb3_data_hs: endpoint {
+				remote-endpoint = <&typec_con_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			usb3_data_ss: endpoint {
+				remote-endpoint = <&typec_con_ss>;
+			};
+		};
+	};
+};
+
+&usb3_phy {
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default","state_100mhz","state_200mhz","sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			/* GPIO Expanders shared IRQ */
+			IMX95_PAD_GPIO_IO37__GPIO5_IO_BIT17				0x31e
+		>;
+	};
+
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13				0x31e
+		>;
+	};
+
+	pinctrl_enetc1: enetc1grp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK		0x57e
+			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL		0x57e
+			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3			0x57e
+			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2			0x57e
+			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1			0x57e
+			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0			0x57e
+			IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK		0x57e
+			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL		0x57e
+			IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0			0x57e
+			IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1			0x57e
+			IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2			0x57e
+			IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3			0x37e
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			IMX95_PAD_PDM_CLK__AONMIX_TOP_CAN1_TX				0x39e
+			IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_CAN1_RX			0x39e
+		>;
+	};
+
+	pinctrl_gpio_leds: ledgrp {
+		fsl,pins = <
+			IMX95_PAD_CCM_CLKO2__GPIO3_IO_BIT27				0x31e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO28__LPI2C3_SDA					0x40000b9e
+			IMX95_PAD_GPIO_IO29__LPI2C3_SCL					0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3_gpio: lpi2c3gpiogrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO28__GPIO2_IO_BIT28				0x31e
+			IMX95_PAD_GPIO_IO29__GPIO2_IO_BIT29				0x31e
+		>;
+	};
+
+	pinctrl_lpi2c4: lpi2c4grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO30__LPI2C4_SDA					0x40000b9e
+			IMX95_PAD_GPIO_IO31__LPI2C4_SCL					0x40000b9e
+		>;
+	};
+
+	pinctrl_lpspi7: lpspi7grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO04__GPIO2_IO_BIT4				0x3fe		/* j16.4 ADS7846 */
+			IMX95_PAD_UART2_TXD__AONMIX_TOP_GPIO1_IO_BIT7			0x3fe		/* j14.4 MCP2518FDT */
+			IMX95_PAD_XSPI1_DATA4__GPIO5_IO_BIT4				0x3fe		/* j25.2 spidev */
+			IMX95_PAD_GPIO_IO05__LPSPI7_SIN					0x3fe
+			IMX95_PAD_GPIO_IO06__LPSPI7_SOUT				0x3fe
+			IMX95_PAD_GPIO_IO07__LPSPI7_SCK					0x3fe
+		>;
+	};
+
+	pinctrl_ptn5150: ptn5150grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14				0x31e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7				0x31e
+		>;
+	};
+
+	pinctrl_restouch: restouchgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO24__GPIO2_IO_BIT24				0x31e
+		>;
+	};
+
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO32__GPIO5_IO_BIT12				0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX			0x31e
+			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX			0x31e
+		>;
+	};
+
+	pinctrl_uart8: uart8grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO13__LPUART8_RX					0x31e
+			IMX95_PAD_GPIO_IO12__LPUART8_TX					0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0				0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK					0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD					0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0				0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1				0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2				0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3				0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT				0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK					0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD					0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0				0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1				0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2				0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3				0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT				0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK					0x15fe
+			IMX95_PAD_SD2_CMD__USDHC2_CMD					0x13fe
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0				0x13fe
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1				0x13fe
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2				0x13fe
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3				0x13fe
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT				0x51e
+		>;
+	};
+};
-- 
2.47.3

