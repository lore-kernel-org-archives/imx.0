Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E820940FD8F
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 15:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540116; cv=none; b=LqirVkdrr9ou7MJVjqD5W0oTe7x8PfEdcoleCCwOk7uDY1bTj/KI7B7X+Yx0yDx7xukn5dKoAknuRwXbqZ/X9AqzXjtPzGSr8PprVbKxPKkZGoAHEC0BJm6cGTVnJxRo4PUVDaxMU8jHHzNZscZp1wpEEK2xxw5NnEP/gmYuqdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540116; c=relaxed/simple;
	bh=5jiLa3WkxSiiqcBECRyocORN35PoLmmpg+RHjccUgew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qyjBYNGY9ksdBT4WA03Fjai2KuAhbY+id1hJGRV9xhJ5Pfg8yj1HW7jZZE3S5Zu61STWfOPcRvke078mR2uFhjZl9l2JotJBytUMGMDtT90KmgbUJWH0WyokqVK3fpBvoX6iyWqNKGowhztOAPwyTYtzxtkD242d+v47bS9FAI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxNqF2oW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxNqF2oW"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so731500f8f.3
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 08:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774540112; x=1775144912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfbjRbOr0qKbRa2Dy+NtgHq9Jy94mulwxTFaR2bd43Y=;
        b=qxNqF2oWQH3Bm8H3HKli7vc0PK8+grw8dHhKt7zrhx2hovEbuF/9HW0Pzy4O+9zRvO
         moQSOvr2b255d3nFputTDEy7fG5S87i6l5xfJxBx7UfsnizYbfPEI2fDsDZitk2/y9qn
         mxzpFJ131BC+aUIbROotRrYoRkMeX6kzUxQrlmnowjuIX/9a/OA0o1i981aKkkTa2D8M
         aUkpxIlbsz2r+C+Xer5j2zDS8JRHZoyLlquowOIyqPdKeNwKA5/JJ/y5uXGsd7sH7nOg
         zRGUu04DPiyxXNXyaNZmb4Ihq+allHmXZ3tHUjTCR1HvM0vbEQiYmyanPYTrz/NGimof
         lmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540112; x=1775144912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zfbjRbOr0qKbRa2Dy+NtgHq9Jy94mulwxTFaR2bd43Y=;
        b=c978RYc1c74vQvoyJrds4LSa3SIkn4xrRWIiyMG818H4YYWBKmAnTyaKxrHJd4I38i
         DOPrlA+t8IAl6vLawHTEVD58CTa1MA40L4jRp4nm5Glo777zSmsrSd2pC89kdUgoOeux
         fvhjaSYzNpm/m/qGu+edJVQzD6Uazqid7yJuC6c/DjNAH97CxETq7t0VPqTCJohz8hQ4
         DFcrOXwIBLFgfimWAv0Z5PUn0cmKQKJrXBFH1TpWzGIVtzQHblueBNfOqaqi76ygYjsH
         ocYs6xfZ0jiVxVz4H68wl1G4PCVRuMHbvjU1Mkppv6ngs00lhUf7fYDnB7mU4jS7PgCd
         GwKw==
X-Forwarded-Encrypted: i=1; AJvYcCU/QWzY0Kzw89JUy6EExGv5FXCMrdVypprRoTfjMulwo0VabVSio/mejXIH/hD7CpohHMA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUFjd9kgMNeHZEOzkOzyMGsW4H460y6QYYA9UTZfk8PTCyPOvy
	vR5M6p4jvlEUNhe0xxzYXI63O5oOKZs2Av45Yk35kNF26FuMh4PSY6Kg
X-Gm-Gg: ATEYQzzWWJHyXyEl5YXkdnnjdox0jeOd0jjOEGk59+RK9eIFpCnY5XkqwOuC+adM1n2
	QNX8gvbtSOppsCU5d/ykMQswz0c+J0RYr3LlOqZDwXnUYnQ5uBbeCbOPQNZzbIVxXmrtlJNMKXW
	yhLbPvxwHlqZikOIsS7p42hp/mT6f8gr1gaDoYgCjTNN/RdBHtKBgVfdTMk1PC+f78Tz/0vL6RL
	u1YQbrY20dgXgVOl3kt4Mpdfdi6XElp5U2DFAIfJLqbzlYhW1JMum9GFZ6qat+Fz4dJgcMxw3oZ
	eAu+zv7/TC3Y0lrvb3cmj7M7YX+IARfu1mga9x3LwbuN4FbtKKXlGxFbczYQKUE0EzpKKahga8q
	seOdbS+J6K5+2KFPam8RtKCw5gokbXDRlyvDOl4vETf7SmqUPlGGSoEEzL+5QRyfUEaL4zgrDzc
	3fvbuMPVhuOBp0xPewtN9r1YzIIy+QL2VhN1YYWH8LNIvBfSVgoHG9wKDhPh98DbthdLkjQomJq
	WLbwlFuN6Hf5qIaDXkmft0z+opqrLjsrtPeVQ==
X-Received: by 2002:a05:6000:2892:b0:43b:50d6:4f00 with SMTP id ffacd0b85a97d-43b88a0d20fmr12222931f8f.30.1774540111912;
        Thu, 26 Mar 2026 08:48:31 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942e52sm8831016f8f.9.2026.03.26.08.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:48:28 -0700 (PDT)
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
Subject: [PATCH v1 3/3] arm64: dts: imx93-var-dart: Add support for Variscite Sonata board
Date: Thu, 26 Mar 2026 16:47:19 +0100
Message-ID: <dfdc2f00d2e2ac0ff1c2978dedd6585a4ef86422.1774539301.git.stefano.r@variscite.com>
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

Add device tree support for the Variscite Sonata carrier board with the
DART-MX93 system on module.

The Sonata board includes
- uSD Card support
- USB ports and OTG
- Additional Gigabit Ethernet interface
- Uart, SPI and I2C interfaces
- GPIO Expanders
- RTC module
- TPM module
- CAN peripherals

Link: https://variscite.com/carrier-boards/sonata-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-var-dart-sonata.dts   | 654 ++++++++++++++++++
 2 files changed, 655 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2da6dc4f8a14..266eddd745c9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -487,6 +487,7 @@ imx93-tqma9352-mba91xxca-rgb-cdtech-dc44-dtbs := imx93-tqma9352-mba91xxca.dtb im
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
new file mode 100644
index 000000000000..5513d3b148a2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -0,0 +1,654 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Variscite Sonata carrier board for DART-MX93
+ *
+ * Link: https://variscite.com/carrier-boards/sonata-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include "imx93-var-dart.dtsi"
+
+/ {
+	model = "Variscite DART-MX93 on Sonata-Board";
+	compatible = "variscite,var-dart-mx93-sonata",
+		     "variscite,var-dart-mx93",
+		     "fsl,imx93";
+
+	aliases {
+		ethernet0 = &eqos;
+		ethernet1 = &fec;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		i2c3 = &lpi2c4;
+		i2c4 = &lpi2c5;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+		serial1 = &lpuart2;
+		serial2 = &lpuart3;
+		serial3 = &lpuart4;
+		serial4 = &lpuart5;
+		serial5 = &lpuart6;
+		serial6 = &lpuart7;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca6408_1 4 GPIO_ACTIVE_LOW>;
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
+		button-down {
+			label = "Down";
+			linux,code = <KEY_DOWN>;
+			gpios = <&pca6408_1 6 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca6408_1 7 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_leds_gpio>;
+
+		led-emmc {
+			gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+			label = "eMMC";
+			linux,default-trigger = "mmc0";
+		};
+	};
+
+	clk40m: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+		clock-output-names = "can_osc";
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_1v8";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_SD2_3V3";
+		off-on-delay-us = <20000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&gpio2 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ethosu_mem: ethosu-region@88000000 {
+			compatible = "shared-dma-pool";
+			reusable;
+			reg = <0x0 0x88000000 0x0 0x8000000>;
+		};
+
+		vdev0vring0: vdev0vring0@87ee0000 {
+			reg = <0 0x87ee0000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@87ee8000 {
+			reg = <0 0x87ee8000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@87ef0000 {
+			reg = <0 0x87ef0000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@87ef8000 {
+			reg = <0 0x87ef8000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@87f00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x87f00000 0 0x100000>;
+			no-map;
+		};
+
+		ele_reserved: ele-reserved@87de0000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x87de0000 0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+/* Use external instead of internal RTC */
+&bbnsm_rtc {
+	status = "disabled";
+};
+
+&eqos {
+	mdio {
+		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			reset-assert-us = <15000>;
+			reset-deassert-us = <100000>;
+			reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
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
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-1 = <&pinctrl_lpi2c1_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c1_gpio>;
+	pinctrl-names = "default", "sleep", "gpio";
+	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pca9534: gpio@22 {
+		compatible = "nxp,pca9534";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&pinctrl_captouch>;
+		pinctrl-names = "default";
+		reset-gpios = <&pca6408_2 4 GPIO_ACTIVE_LOW>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		wakeup-source;
+	};
+
+	/* USB Type-C Controller */
+	typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl-0 = <&pinctrl_extcon>;
+		pinctrl-names = "default";
+
+		port {
+			typec1_dr_sw: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		wakeup-source;
+	};
+};
+
+&lpi2c5 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c5>;
+	pinctrl-1 = <&pinctrl_lpi2c5_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c5_gpio>;
+	scl-gpios = <&gpio2 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&lpi2c7 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c7>;
+	pinctrl-1 = <&pinctrl_lpi2c7_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c7_gpio>;
+	scl-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pca6408_1: gpio@20 {
+		compatible = "nxp,pcal6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pca6408_2: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+	};
+};
+
+&lpspi8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi8>;
+	cs-gpios = <&gpio2 1 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* CAN controller */
+	can0: can@0 {
+		compatible = "microchip,mcp251xfd";
+		reg = <0>;
+		clocks = <&clk40m>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		spi-max-frequency = <1000000>;
+	};
+};
+
+/* Console (J10) */
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+/* Header (J12.4, J12.6) */
+&lpuart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart6>;
+	status = "okay";
+};
+
+/* Header (J12.11, J12.13) */
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	status = "okay";
+};
+
+&tpm3 {
+	pinctrl-0 = <&pinctrl_tpm3>;
+	pinctrl-names = "default";
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
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usbotg2 {
+	disable-over-current;
+	dr_mode = "host";
+	status = "okay";
+};
+
+/* SD */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+	status = "okay";
+};
+
+&wdog3 {
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO03__GPIO2_IO03			0x31e
+		>;
+	};
+
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
+		>;
+	};
+
+	pinctrl_extcon: extcongrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x31e
+		>;
+	};
+
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
+			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
+			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
+			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x37e
+			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x58e
+			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
+			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
+			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
+			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
+			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
+			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x58e
+			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
+		>;
+	};
+
+	pinctrl_fec_sleep: fecsleepgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_RD0__GPIO4_IO24			0x51e
+			MX93_PAD_ENET2_RD1__GPIO4_IO25			0x51e
+			MX93_PAD_ENET2_RD2__GPIO4_IO26			0x51e
+			MX93_PAD_ENET2_RD3__GPIO4_IO27			0x51e
+			MX93_PAD_ENET2_RXC__GPIO4_IO23			0x51e
+			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
+			MX93_PAD_ENET2_TD0__GPIO4_IO19			0x51e
+			MX93_PAD_ENET2_TD1__GPIO4_IO18			0x51e
+			MX93_PAD_ENET2_TD2__GPIO4_IO17			0x51e
+			MX93_PAD_ENET2_TD3__GPIO4_IO16			0x51e
+			MX93_PAD_ENET2_TXC__GPIO4_IO21			0x51e
+			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20		0x51e
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__CAN1_TX			0x139e
+			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x139e
+		>;
+	};
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			/* GPIO Expanders shared IRQ */
+			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10            0x31e
+		>;
+	};
+
+	pinctrl_leds_gpio: ledgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO11__GPIO2_IO11			0x31e
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			MX93_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
+			MX93_PAD_I2C1_SDA__LPI2C1_SDA			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c1_gpio: lpi2c1-gpiogrp {
+		fsl,pins = <
+			MX93_PAD_I2C1_SCL__GPIO1_IO00			0x31e
+			MX93_PAD_I2C1_SDA__GPIO1_IO01			0x31e
+		>;
+	};
+
+	pinctrl_lpi2c5: lpi2c5grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO22__LPI2C5_SDA			0x40000b9e
+			MX93_PAD_GPIO_IO23__LPI2C5_SCL			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c5_gpio: lpi2c5-gpiogrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO22__GPIO2_IO22			0x31e
+			MX93_PAD_GPIO_IO23__GPIO2_IO23			0x31e
+		>;
+	};
+
+	pinctrl_lpi2c7: lpi2c7grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO07__LPI2C7_SCL			0x40000b9e
+			MX93_PAD_GPIO_IO06__LPI2C7_SDA			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c7_gpio: lpi2c7-gpiogrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO07__GPIO2_IO07			0x31e
+			MX93_PAD_GPIO_IO06__GPIO2_IO06			0x31e
+		>;
+	};
+
+	pinctrl_lpspi8: lpspi8grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__GPIO2_IO00			0x31e
+			MX93_PAD_GPIO_IO01__GPIO2_IO01			0x31e
+			MX93_PAD_GPIO_IO12__GPIO2_IO12			0x31e
+			MX93_PAD_GPIO_IO13__LPSPI8_SIN			0x31e
+			MX93_PAD_GPIO_IO14__LPSPI8_SOUT			0x31e
+			MX93_PAD_GPIO_IO15__LPSPI8_SCK			0x31e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x31e
+		>;
+	};
+
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO02__GPIO2_IO02			0x31e
+		>;
+	};
+
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__TPM3_CH3			0x51e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
+			MX93_PAD_UART1_TXD__LPUART1_TX			0x31e
+		>;
+	};
+
+	pinctrl_uart6: uart6grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO05__LPUART6_RX			0x31e
+			MX93_PAD_GPIO_IO04__LPUART6_TX			0x31e
+		>;
+	};
+
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO09__LPUART7_RX			0x31e
+			MX93_PAD_GPIO_IO08__LPUART7_TX			0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK			0x1582
+			MX93_PAD_SD2_CMD__USDHC2_CMD			0x40001382
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x40001382
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x40001382
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x40001382
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x40001382
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK			0x158e
+			MX93_PAD_SD2_CMD__USDHC2_CMD			0x4000138e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x4000138e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x4000138e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x4000138e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x4000138e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK			0x15fe
+			MX93_PAD_SD2_CMD__USDHC2_CMD			0x400013fe
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x400013fe
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x400013fe
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x400013fe
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x400013fe
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CD_B__GPIO3_IO00			0x31e
+		>;
+	};
+};
-- 
2.47.3

