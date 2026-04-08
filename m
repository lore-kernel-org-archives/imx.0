Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1653D75D4
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 17:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775670050; cv=none; b=ZQROcY56nn+rZuc4XvPOXbvWABXl1jFYRlyDj+4LJQX+ifbiXegiUMpkLDHmi4nFiBoxAVaIy9gC+XKiHE+liXjO86/qaHqn6i8sstjxsJFUtf2HzlBYbb21Fl4oHO6mqyj/MtswcYGW7MD0WEVVuJJlv01bFT0qbuHOJAJL/Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775670050; c=relaxed/simple;
	bh=mdiMFRcn8tE+s33EdB4fI0E3plCerbCdlc3Ol3CoJh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ac3gilRWJvm3g3fROxcOEFjRZ5SYlNQ7+dC7XSTGoh5mZJylcivAlJfrPb5rW34EgtwEHKsTOFWvUzUegS8uSORhzakKBgWjIvdW5CI8jQyJbMBI/8rscmL92dU/t4XGN2rH+7eVTGhXHWnhbbeNP3/1bSaDR1idtzAKJCjuWx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ml+TJTEx; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml+TJTEx"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so40611f8f.3
        for <imx@lists.linux.dev>; Wed, 08 Apr 2026 10:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775670043; x=1776274843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz0vzP1D30PokxiYoiKqdXRrwUr+2nbje60yFONn7/A=;
        b=ml+TJTExMHR7llxIttzXi9AqTzNS05zjc1PvQGzF4bbFoXwHdlItdY3qGVu0wLDTgY
         m57TUrXBwDqsPq/Yk7qlGzBlPetQ+k+PSWWxYUkWOvnSjGVKF3XcXb8vABcCkZySzlSc
         VE0qWTz1pFEUeZ3g/7HQkJC1azX+LeJP3JS5IV64srMdZkO9n8GhFU90Y2E2Sr3N+ACt
         87vb9xbAdjByiV0EpCJDHTbPoHCkSVcuCoSJts/UwQoEeVlULv8/Eg2dGLamD2/BqHg7
         8zUKvu5lN78AgOS6+v1Jh2wLu0reS4fWxI/XIhiXMtiGM+YmBc3DNIeZHmkq4dohzMKb
         p2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775670043; x=1776274843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fz0vzP1D30PokxiYoiKqdXRrwUr+2nbje60yFONn7/A=;
        b=VLXepHYgYcxcX36ZnT+RMHJWaOgDA8yYu2X3YOceS2fzz0Ox94OMlQdBaR5btCndv/
         nZuQYjULP03CWEGx6HkRt5Buvi5EZ+m5k3NlNbJqZlW0pKGQlftQjpTnYd1k/P2wk6CV
         dmS+z0ShwjKMyLtuCOYFFbf4Oy924mNX9rxSXtRaYhhsldyR+5wLL911vulFo9rXxBUz
         AjpzNsvrP4TmHkfY/xmmh6mHuKrkfFL2ixXx+QoC/tnDBISQlb9wHfinFlEwsGs6LuHQ
         EcVdC1XsQe50jXhy/MGCK2HAejrU7phMTeBHmu4sADtZfJFhlMza5QwsL6RSPnrgcaO2
         VSCg==
X-Forwarded-Encrypted: i=1; AJvYcCUbkJTSNDqPqqO/xIaNynYF/VrcNYA6ySRqhH/fhetghwtCxqn7KlaMXunOdTbB7OZy/ls=@lists.linux.dev
X-Gm-Message-State: AOJu0YztCiErT1bjYeBwu+DKEOZSPqPcgG+gOdLoeyIjHAE8TY2rPcRa
	osqnUWixQgfHjJp2fAQlbLfeUBOoSpS3uLhTbiSJEjzV3XmY2O8w1EdE
X-Gm-Gg: AeBDievaco953Ne2SDEbUeHvVTHswE5ehFntW5FP8cxvc8RPjMGBEqfLCimyt4qf7CH
	V1jubC0TM9EjMTiHyCwD48lwxUxTeEFroIJ47mTMdOlbmgPE6xkFkLzCrLGMWVn1F2qGIy/y4ez
	CqYgxnVeBMl4h0uVcYUcR5b6qXj74K1pGGUyWr68Ig2bWG3aQDBjs0U9sbXQ/9xDx4gWwvIlj+R
	UUhNQ2TnnxKAlqiL+FzLy4zx6uwkqbvJkmXNHCsH+Ij5MvDk0Cm91qY7sQfSKvd+vT06pc1ixtk
	rbCBNGqRU70J0FGb7VTPYHI3w+XzANxoOhyw9blwDqGRNlEhjiabYozl6BRj6ZtscnhV7EPtP13
	4sbBJc3wBCAkrMeeZ1NNV0sQL/sGPSXWltLYIogNpMf1wiVa7GiGRFauy4u1y7xrW20Mu6QX/xT
	MDjGCJfudxgz22wAixE7N+NuHp+3gMI1so5U2bo/xZMLcB+tdhNVAYi4CUqXACpVpK09aNg5mnH
	9jlSSqYb31Q9W6qEWpAO2QbeFoGn7TFgT26jQ==
X-Received: by 2002:adf:f0d1:0:b0:43d:2fc7:4816 with SMTP id ffacd0b85a97d-43d2fc74868mr19937830f8f.0.1775670043291;
        Wed, 08 Apr 2026 10:40:43 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm61774659f8f.0.2026.04.08.10.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:40:42 -0700 (PDT)
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 3/3] arm64: dts: imx91-var-som: Add support for Variscite Symphony board
Date: Wed,  8 Apr 2026 19:39:46 +0200
Message-ID: <b04a0ef709cea1ffb2a01232c07caf24d23d71ca.1775669847.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775669847.git.stefano.r@variscite.com>
References: <cover.1775669847.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite Symphony carrier board with
the VAR-SOM-MX91 system on module.

The Symphony board includes
- uSD Card support
- USB ports and OTG
- Additional Gigabit Ethernet interface
- Uart, ADC and I2C interfaces
- GPIO Expanders
- RTC module
- TPM module
- CAN peripheral

Link: https://variscite.com/carrier-boards/symphony-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx91-var-som-symphony.dts  | 527 ++++++++++++++++++
 2 files changed, 528 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c99..646176ff95c9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -449,6 +449,7 @@ imx91-tqma9131-mba91xxca-rgb-cdtech-dc44-dtbs := imx91-tqma9131-mba91xxca.dtb im
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx91-var-som-symphony.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
new file mode 100644
index 000000000000..ac9fed58357e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
@@ -0,0 +1,527 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Variscite Symphony carrier board for VAR-SOM-MX91
+ *
+ * Link: https://variscite.com/carrier-boards/symphony-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include "imx91-var-som.dtsi"
+
+/{
+	model = "Variscite VAR-SOM-MX91 on Symphony evaluation board";
+	compatible = "variscite,var-som-mx91-symphony",
+		     "variscite,var-som-mx91", "fsl,imx91";
+
+	aliases {
+		ethernet0 = &eqos;
+		ethernet1 = &fec;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		gpio4 = &pca9534;
+		gpio5 = &pca6408;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+		serial1 = &lpuart2;
+		serial2 = &lpuart3;
+		serial3 = &lpuart4;
+		serial4 = &lpuart5;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-back {
+			label = "Back";
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_BACK>;
+		};
+
+		key-home {
+			label = "Home";
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOME>;
+		};
+
+		key-menu {
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
+			gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	/*
+	 * Needed only for Symphony <= v1.5
+	 */
+	reg_fec_phy: regulator-fec-phy {
+		compatible = "regulator-fixed";
+		regulator-name = "fec-phy";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-enable-ramp-delay = <20000>;
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_rgb_sel: regulator-rgb-enable {
+		compatible = "regulator-fixed";
+		regulator-name = "RGBSEL";
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca6408 6 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <20000>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ele_reserved: ele-reserved@87de0000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x87de0000 0 0x100000>;
+			no-map;
+		};
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x40000000>;
+			reusable;
+			size = <0 0x10000000>;
+			linux,cma-default;
+		};
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+/* Use external instead of internal RTC*/
+&bbnsm_rtc {
+	status = "disabled";
+};
+
+&eqos {
+	mdio {
+		ethphy1: ethernet-phy@5 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <5>;
+			eee-broken-1000t;
+			reset-gpios = <&pca9534 5 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <20000>;
+			vddio-supply = <&vddio1>;
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
+
+			vddio1: vddio-regulator {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
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
+&fec {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_fec>;
+	pinctrl-1 = <&pinctrl_fec_sleep>;
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
+&lpi2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-1 = <&pinctrl_lpi2c1_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c1_gpio>;
+	scl-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	pca9534: gpio@20 {
+		compatible = "nxp,pca9534";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pca9534>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-source;
+	};
+
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pca6408>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&reg_rgb_sel>;
+		wakeup-source;
+
+		tpm-enable-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "tpm_en";
+		};
+	};
+
+	/* USB Type-C Controller */
+	ptn5150: typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_NONE>;
+
+		port {
+			typec1_dr_sw: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+	};
+
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		interrupt-parent = <&pca6408>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
+	/* DS1337 RTC module */
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
+};
+
+/* pins conflict */
+&lpspi8 {
+	status = "disabled";
+};
+
+/* Console */
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&tpm4 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_tpm4>;
+	pinctrl-1 = <&pinctrl_tpm4_sleep>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	disable-over-current;
+	status = "okay";
+};
+
+/* SD */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
+	bus-width = <4>;
+	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+/* Watchdog */
+&wdog3 {
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX91_PAD_ENET2_RD0__ENET2_RGMII_RD0		0x57e
+			MX91_PAD_ENET2_RD1__ENET2_RGMII_RD1		0x57e
+			MX91_PAD_ENET2_RD2__ENET2_RGMII_RD2		0x57e
+			MX91_PAD_ENET2_RD3__ENET2_RGMII_RD3		0x57e
+			MX91_PAD_ENET2_RXC__ENET2_RGMII_RXC		0x5fe
+			MX91_PAD_ENET2_RX_CTL__ENET2_RGMII_RX_CTL	0x57e
+			MX91_PAD_ENET2_TD0__ENET2_RGMII_TD0		0x57e
+			MX91_PAD_ENET2_TD1__ENET2_RGMII_TD1		0x57e
+			MX91_PAD_ENET2_TD2__ENET2_RGMII_TD2		0x57e
+			MX91_PAD_ENET2_TD3__ENET2_RGMII_TD3		0x57e
+			MX91_PAD_ENET2_TXC__ENET2_RGMII_TXC		0x5fe
+			MX91_PAD_ENET2_TX_CTL__ENET2_RGMII_TX_CTL	0x57e
+		>;
+	};
+
+	pinctrl_fec_sleep: fecsleepgrp {
+		fsl,pins = <
+			MX91_PAD_ENET2_RD0__GPIO4_IO24			0x51e
+			MX91_PAD_ENET2_RD1__GPIO4_IO25			0x51e
+			MX91_PAD_ENET2_RD2__GPIO4_IO26			0x51e
+			MX91_PAD_ENET2_RD3__GPIO4_IO27			0x51e
+			MX91_PAD_ENET2_RXC__GPIO4_IO23                  0x51e
+			MX91_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
+			MX91_PAD_ENET2_TD0__GPIO4_IO19			0x51e
+			MX91_PAD_ENET2_TD1__GPIO4_IO18			0x51e
+			MX91_PAD_ENET2_TD2__GPIO4_IO17			0x51e
+			MX91_PAD_ENET2_TD3__GPIO4_IO16			0x51e
+			MX91_PAD_ENET2_TXC__GPIO4_IO21			0x51e
+			MX91_PAD_ENET2_TX_CTL__GPIO4_IO20		0x51e
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX91_PAD_PDM_CLK__CAN1_TX			0x139e
+			MX91_PAD_PDM_BIT_STREAM0__CAN1_RX		0x139e
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			MX91_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
+			MX91_PAD_I2C1_SDA__LPI2C1_SDA			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c1_gpio: lpi2c1gpiogrp {
+		fsl,pins = <
+			MX91_PAD_I2C1_SCL__GPIO1_IO0			0x31e
+			MX91_PAD_I2C1_SDA__GPIO1_IO1			0x31e
+		>;
+	};
+
+	pinctrl_pca6408: pca6408grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO04__GPIO2_IO4			0x31e
+		>;
+	};
+
+	pinctrl_pca9534: pca9534grp {
+		fsl,pins = <
+			MX91_PAD_CCM_CLKO1__GPIO3_IO26			0x31e
+		>;
+	};
+
+	pinctrl_ptn5150: ptn5150grp {
+		fsl,pins = <
+			MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10            0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX91_PAD_UART1_RXD__LPUART1_RX			0x31e
+			MX91_PAD_UART1_TXD__LPUART1_TX			0x31e
+		>;
+	};
+
+	pinctrl_tpm4: tpm4grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO05__TPM4_CH0			0x51e
+		>;
+	};
+
+	pinctrl_tpm4_sleep: tpm4sleepgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO05__GPIO2_IO5			0x51e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK			0x1582
+			MX91_PAD_SD2_CMD__USDHC2_CMD			0x1382
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0		0x1382
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1		0x1382
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2		0x1382
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3		0x1382
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK			0x158e
+			MX91_PAD_SD2_CMD__USDHC2_CMD			0x138e
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0		0x138e
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1		0x138e
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2		0x138e
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3		0x138e
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK			0x15fe
+			MX91_PAD_SD2_CMD__USDHC2_CMD			0x13fe
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0		0x13fe
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1		0x13fe
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2		0x13fe
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3		0x13fe
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_sleep: usdhc2sleep-grp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__GPIO3_IO1			0x51e
+			MX91_PAD_SD2_CMD__GPIO3_IO2			0x51e
+			MX91_PAD_SD2_DATA0__GPIO3_IO3			0x51e
+			MX91_PAD_SD2_DATA1__GPIO3_IO4			0x51e
+			MX91_PAD_SD2_DATA2__GPIO3_IO5			0x51e
+			MX91_PAD_SD2_DATA3__GPIO3_IO6			0x51e
+			MX91_PAD_SD2_VSELECT__GPIO3_IO19		0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CD_B__GPIO3_IO0			0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleep-grp {
+		fsl,pins = <
+			MX91_PAD_SD2_CD_B__GPIO3_IO0			0x51e
+		>;
+	};
+};
-- 
2.47.3

