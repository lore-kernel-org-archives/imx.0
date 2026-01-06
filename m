Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4356C32ED4D
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 13:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767704926; cv=none; b=cXB8/RSYALXMUi7FMBKXpou7t/N/jOlnCk3f8e8RpNuU4A6zo71IMVaExmm9a2LoPqCEUjW43ziWEiAdzJ/HUHb8NUGSDbi7ASBGAMdCWbkuBDTz5C7WeGiWwoS/vhWFBwvvwGBFNyHGs+p+ZlG2HupV/MogTQxY+BweDPpE2sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767704926; c=relaxed/simple;
	bh=UChh67pGF1QyWY8TUdkjBHidGuA4PNhYwNW3Bafp0MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqezCuq2qG0BOM3Oxato/kdEqkqKSVdm+ze3vrt19EqX6ORE/0trFy61lXuw1ml8cqnMC3mvtV9PofHQV/X4eSNUnPFiGl1e56lIiOGHAM5r58aLXBalLIqG2uSNkp5IKgJNkkMK0hLbcGMzag2K7db2GXk8b0ctI4SiB7ocsJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlGvVhWq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlGvVhWq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47774d3536dso9005175e9.0
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 05:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767704922; x=1768309722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHnvndAAZ6K4yrczd5CXYVwvTXt+TN2/6fVDq/QRG8I=;
        b=MlGvVhWqKmKqpYeElWq0HhG5un8+6QVs5gfpvhcPjUh6aezcquRT3h3tLdQI2JTlW8
         IvYxE+gjPkZ1XapgIh8Fd7lz7hSm2tkicRI8N5uFPNv+nW7pZKcWqck12ro+CzVBA4ZJ
         19KYxryyZFsmP/Mt8+zz3/S8TF4kjnyZ1Vz4r3WBshrSvRPxWaUzegDDskx5Eh4dEItu
         QnzsY9VZ0S2uTr7eIzFCf8xGYmcHEiATIXsfxDPDcmXhLgBGCz35vMI6xztos9Lb4GLb
         svT8TBUx+q5qRj216LswbGUbpPkZ2A6M01ExWi23dck6jb6IqltDx86QDv6rl2bbJYo6
         uZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767704922; x=1768309722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MHnvndAAZ6K4yrczd5CXYVwvTXt+TN2/6fVDq/QRG8I=;
        b=nJKWL4lNhxBLPEtRXSxhWRK/Iklek+F5W3gRSQ2HyF8Um13HjWncuYoGyl275aV+Nx
         Rj9bxv24DdweoTDadEzpb9dWtHXUCSBjXhzpUy61f421uiaWUGpdr9pE5aAutb3uMnlM
         WgzuYszhXzYkZXulH/ab9ngNCMc5g55Fg74UnqrK2phK83L1yEg/5FVoIzFXQwzGfFN/
         Pqao3Uc5U1TEIMeYgTqa12vLJjc6LFfyYNjd9ViqDYgTHk8gWhcJLsHrpFxEbcqe8u7G
         ZEDbAnx4zGYvF0dV5Kd4PFH0K88kKv/fUYwlldgu2DR8BCe51SKI2fs6HJ80tOY/S6RW
         f8jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlIZkF73+bLnItdHZcQKVYJNoe4V7FyamLKrsuauS0oKa1+4pW6PkJ20MHesb2mjqww7E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFQZrpNYJgwm9yPtKC+fQHpKJ0XUt78IRiXnYP/wI95p+NquHC
	rfOdwa3/ho5OUKV4+MAWV1Ur/z3Kw01qbhNgrV5h9FlH/8nhYMUGthr1
X-Gm-Gg: AY/fxX5M/XpuZSfb4/1q1Cw6Ny7jdpxQPtpJGvKuW8cZWb25vgi96RdYKWZq3MdV8l+
	LUrDtga9d9OnG4w3F6EZ98ZntsDRup9PsIE9oaD0gi36f9TbVOQEZrC4ltFgbvEX979Uo+Tl123
	EWW3tDuTUN3nq5aY8K4jaTB6T64q5c2ChoeSLU98yw8840oCE/jcpVMGp2P9Iq2J3dYS3cns8IO
	mNNenW93DVxDjLNJMCcz5+EbUYo5vjeu05YAkPITJvx1tlNFEZtCwPW3GDNhUi9thKW2hPHknKA
	bLPNfIfMEdDbJdDMbQgkCYcentriSvEkT1eJ4r2khcywSg4QPcLfAd7mUZH+I8Aga3XQ0TRwaPe
	P1KhZEUdYPxXbK4x1lczpcHypGQkjrBwY/LcfhJTA2GawLWTNFc/MBJwgYK/bwpEvMC9iOrihsi
	734UdTyK+Ubm8I1sgY48yliuJ40kPZ9fZeCcGVL3D/s9mDHhHXmp+jWAuGqr1NgBsziDqus4UJQ
	p8pWgbGco4/E3+6RoyYdmKhLg==
X-Google-Smtp-Source: AGHT+IEGSsL15/eZK5Z7zGWpunv1bzJvw9eiUe74rAA90FbbGb21F3Joo5mqm3h3LMdjpHbMF0UpKQ==
X-Received: by 2002:a05:600c:46c3:b0:477:a2f7:74de with SMTP id 5b1f17b1804b1-47d7f404854mr40888625e9.3.1767704922354;
        Tue, 06 Jan 2026 05:08:42 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f70bc4fsm41601635e9.15.2026.01.06.05.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:08:41 -0800 (PST)
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
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/3] arm64: dts: imx95-var-dart: Add support for Variscite Sonata board
Date: Tue,  6 Jan 2026 14:07:32 +0100
Message-ID: <20260106130741.91532-4-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106130741.91532-1-stefano.r@variscite.com>
References: <20260106130741.91532-1-stefano.r@variscite.com>
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
v4:
- Add GPIO_OPEN_DRAIN to i2c gpios
- Move pinmux to eof
v3:
- Fix specific node names with generic ones
- Remove fixed-link property for SFP
v2:
- Add SFP cage node for enetc_port2 following sff,sfp.yaml binding

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-var-dart-sonata.dts   | 590 ++++++++++++++++++
 2 files changed, 591 insertions(+)
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
index 000000000000..d36d62243a36
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -0,0 +1,590 @@
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
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port1;
+		ethernet2 = &enetc_port2;
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
+		off-on-delay-us = <12000>;
+		enable-active-high;
+	};
+
+	reg_phy1_supply: regulator-phy1 {
+		compatible = "regulator-fixed";
+		regulator-name = "SUPPLY_PHY1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
+		startup-delay-us = <10000>;
+		enable-active-high;
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
+
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
+			IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3			0x37e /* Enable pull-up to strap MXL86110 MDIO address */
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

