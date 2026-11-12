Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494303;
	b=QKCAwaBTvLryaEtJGyxCs9xznx+xBdsB44x3F/KIqwaYZifDwzmM4hkhF0g4x6BPG8Yp
	 f6+twSSyDKdfi+0F+C6w1Rd0AyPfOjiqCRiNK9tiB3MbCFO0Oftc7Q+cTFS5oWKqZKUrx
	 WDJ7XO3skb35dIs7yu78w7qPnxUgVSoN6ZDzwv+1yvGewDc0vs4PCpqgYJt1ve17W0uQw
	 7tAlfoWRnFPuhnn1SfMAWZhSprsQ1/As7wE8B+1MGxi86+JWmKm/o2yn/Jr7Ad7thv2tw
	 i4JAtkxAFtpxzyo+haAJD1w291E5i5W+hFk0CoJI+KR6dgdhrAPCJUs27/16rwsh+QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZVpuREB8xPMvnvzIHzSU5Q+SDBQM9PRI4uI6fRX5adE=;
	b=Lks21QXOluyRZAOchkwWQUGpDhnSTyxc+9PVzGDag4VPKTyzB+KJIT6UGCL2MHYj+cox
	 l4568+7au12VLzOadmmPvLMePyfYo5rUDu9z5GzH9Z9BuX8AdusNhL+L2bbhoy7MWPJit
	 KQQAPwshSGS/MZQQjWJxHUN87iPj8kJB3SpgiaRtigmS5SqdjcbJbCYtK1fcncxsk8DNQ
	 c77TE28gMtx8jPT0EGQ+ep9eeIR2Blnu2g7zUV8igwpHTqXb87bRWIghy4bZX6rvYgMza
	 kNC62toJpDJCZj4sGsLsK1mKBqzw2qBd0qlUi8Y8ychyt1FzdQEfzfnd/eEu3zG15FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Izx/3qtL";
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998EC606A321
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 14:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 998EC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Izx/3qtL
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d2e43ff4b4so788223137.0
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 06:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494302; x=1795099102; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVpuREB8xPMvnvzIHzSU5Q+SDBQM9PRI4uI6fRX5adE=;
        b=Izx/3qtL6QAg5g1FfVREuvFvwAdHee13Edx58ovshNgsP4PV5ME42e13upUT12jmtx
         wULUkFoeuedxWMOlwc1XPdZkg73K83Tz0cJngr+Wzg1yuayxQxCeYKvvRYkedAMvEOHS
         o5ftd0LQBli8DoXdAltb+OM6IitbeO+m647ZMgutKiNh6NRlDh35ACddOgvlkU/zw1ef
         YMTbSHo7Z02J9y/0gIs4mnUGr8STiyBvjZWIQJX5m0fLx8bjNlpJfJnJ4NyR9vyz4XHF
         L2jx3v0JhqDB/RVVE0zuRfPFv4uh6aXpEmkWVQyphQCR36L+RGpQYyuYETgm4d+bwcGR
         1VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494302; x=1795099102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVpuREB8xPMvnvzIHzSU5Q+SDBQM9PRI4uI6fRX5adE=;
        b=0qh7xdtu4X1tpA/zyuIcgCGQXS+LufUCFeC4jEv0e7bYO10/4Fk1dbAcLqoDo+lGwO
         aVoRVYZwR3qgVbrAf+HJdYeHqeYQnmFjwPAwuC7FELQv9ZzHyv1M5+yv0BzgrXNOdDjP
         wVUt0gSw+oE3Yk3FajKarCldukU8CX1Y7R2anG2gbEqmTfHqOUxMIDUjsWoA1DV77HMx
         kel/xdoaoMb28LTQp42G0BGI7IpGbmJfcQa/DivZ2pF5rof5QFTbFCRg/VzcK90/Gxm8
         lX2uS6hpNv/czbzwUiSWizTnkZbYHIOD7xiHWV3kvN/5NmZBmeOWL1yHpDQOrEtgArFA
         M7FQ==
X-Forwarded-Encrypted: i=1; AL+hErHZTsewI9z27LYXxS8ryHiuKYX9HkWwLet75n0hM7g6bnEiqx6nESWzurjOTPERzn2wN8M=@lists.linux.dev
X-Gm-Message-State: APuU4Z/JMmMnDg55lidyttaqFT0DQ6iRorFx+CXcobdytRVujDAI00eK
	+17c454WmkEYQRQAoUri5usdlDWzvIhpO9ssURP+48qgzhL8XXluKqa3
X-Gm-Gg: AYBFou3OoenBShfxIOYh4w994UYAdstAGkV0T3IDGCTxFon3gr0GlT+nZLwPQQZOJ+f
	22gMsFnaOEoRbvERwJpKnE6L75hcs0HC/xCfIt7TkIyxvWIVhYBtU23Q30r12NB6z5CLI4UtP6p
	w4kW6EIy5oNPrRAuzXzcAtZUoauIhuD6uUmgmYsynhWAMqmpFk+GStlLbKlN22V7QR/p/0r5JRg
	lIa6IsYl41gaWPK4lYnhiSks+m5WH4iBDNXOSG/89Su8nRTl/6FmAjAzeSqDwrgOoRZb7Jbi6m5
	v8L40vXDI9tI3ZCklSJa6aYRpUEeHFbHPYlK19H/ac8TZivQWchh7xkRa40hng3intDVy3d6VKL
	b2YaX3blLf2FNXItiex6GIQNwAEAejBVdnSM76ww5676XTchhc8O/uEUiELEOfz+F8hCB2H/q0V
	R5Jd8pvEfKxMKgApSoHqdq1lb7eZjgWZ/M3mRx3YVUUlvShxj81VLRqI7KhbSvcq+hNa+khUJOZ
	nYBD8flPn7ccpboK6o71xUvG7szHUIjIsaKMAaWo0dzr6qomuaR5kBfjuhy8AX0a+pUA5bcYZG/
	eHSl+Chfu9Fc9T2tzHBNmvGFkR08iFdE3Q==
X-Received: by 2002:a05:6102:6884:b0:7bd:ce85:b00f with SMTP id ada2fe7eead31-7d631812c87mr733923137.40.1794494301320;
        Thu, 12 Nov 2026 06:38:21 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:21 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Thu, 12 Nov 2026 11:37:35 -0300
Subject: [PATCH 3/3] arm64: dts: freescale: imx95-aquila: Add Lotus Carrier
 Board
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-3-ca150bb4b0f9@toradex.com>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=9267;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=oRQABbPT78J3ds1qH6YAq8U3BmoCtY9BHxeZLI5mJEk=;
 b=x5X4+BTojUPJqFVMsqkAXbnN1gfkUoK8ry+6pKywK5Vs5kCilmqp6sWUb1yAeDrOPAThxGnqR
 f8wSBDdKHGUDXbqReXc+4F2zU78uoVow5ibIJa/44ft+yjdeJ9TtQgj
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add support for the Aquila iMX95 SoM mated with the Lotus Carrier Board.
Lotus is a carrier board for the Aquila family featuring a small form
factor (Nano-ITX 120mm x 120mm) and built for volume production.

I2S_1_BCLK, GPIO_07 and GPIO_08 are used as digital input readbacks for
the Isolated Digital IOs on the Lotus Carrier Board. Add pingroups
muxing these pins as GPIOs in the Lotus device tree, with no pull-ups or
pull-downs, since the Isolated Digital IO circuit includes external
pull-downs for the readback pins.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/lotus
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-aquila-lotus.dts      | 365 +++++++++++++++++++++
 2 files changed, 366 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb56..60ab650f04279 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -965,6 +965,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-lotus.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-osm-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
new file mode 100644
index 0000000000000..4ae600636106b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
@@ -0,0 +1,365 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/lotus
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx95-aquila.dtsi"
+
+/ {
+	model = "Aquila iMX95 on Aquila Lotus Board";
+	compatible = "toradex,aquila-imx95-lotus",
+		     "toradex,aquila-imx95",
+		     "fsl,imx95";
+
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	dp0-connector {
+		compatible = "dp-connector";
+		dp-pwr-supply = <&reg_dp_3p3v>;
+		type = "mini";
+
+		port {
+			dp_1_connector_in: endpoint {
+				remote-endpoint = <&dsi2dp_out>;
+			};
+		};
+	};
+
+	reg_dp_3p3v: regulator-dp-3p3v {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_21_dp>;
+		/* Aquila GPIO_21_DP */
+		gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "DP_3V3";
+		startup-delay-us = <10000>;
+	};
+
+	sfp: sfp {
+		compatible = "sff,sfp";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_19_dsi_1>, <&pinctrl_i2s_1_sync_gpio>,
+			    <&pinctrl_i2s_1_d_in_gpio>, <&pinctrl_pwm4_dp_gpio>,
+			    <&pinctrl_i2s_1_mclk_gpio>, <&pinctrl_i2s_1_d_out_gpio>;
+		i2c-bus = <&lpi2c2>;
+		los-gpios = <&gpio5 13 GPIO_ACTIVE_HIGH>;
+		maximum-power-milliwatt = <4000>;
+		mod-def0-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
+		rate-select0-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
+		rate-select1-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+		tx-disable-gpios = <&gpio4 26 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+/* Aquila ADC_[1-4] */
+&adc1 {
+	status = "okay";
+};
+
+&dsi2dp_out {
+	remote-endpoint = <&dp_1_connector_in>;
+};
+
+/* Aquila ETH_1 */
+&enetc_port0 {
+	status = "okay";
+};
+
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	managed = "in-band-status";
+	phy-mode = "10gbase-r";
+	sfp = <&sfp>;
+
+	status = "okay";
+};
+
+/* Aquila CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+/* Aquila CAN_2 */
+&flexcan2 {
+	status = "okay";
+};
+
+/* Aquila CAN_3 */
+&flexcan3 {
+	status = "okay";
+};
+
+/* Aquila CAN_4 */
+&flexcan4 {
+	status = "okay";
+};
+
+/* Aquila QSPI_1 */
+&flexspi1 {
+	pinctrl-0 = <&pinctrl_flexspi1_4bit>,
+		    <&pinctrl_qspi_cs1>;
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-max-frequency = <66000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+};
+
+&gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_8_dig_in_rb>;
+};
+
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_1>,
+		    <&pinctrl_gpio_2>,
+		    <&pinctrl_gpio_3>,
+		    <&pinctrl_gpio_4>,
+		    <&pinctrl_gpio_7_dig_in_rb>,
+		    <&pinctrl_i2s_1_bclk_dig_in_rb>;
+};
+
+/* Aquila I2C_2 */
+&i3c2 {
+	status = "okay";
+};
+
+/* Aquila I2C_1 */
+&lpi2c2 {
+	status = "okay";
+
+	fan_controller: fan@18 {
+		compatible = "ti,amc6821";
+		reg = <0x18>;
+		#pwm-cells = <2>;
+
+		fan {
+			cooling-levels = <255>;
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
+	};
+
+	gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names =
+			"DO1_EN",
+			"DO2_EN",
+			"DO3_EN",
+			"",
+			"DI1_EN",
+			"DI2_EN",
+			"DI3_EN",
+			"";
+	};
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp1075";
+		reg = <0x4f>;
+	};
+
+	/* USB-C OTG (TCPC USB PD PHY) */
+	tcpc@52 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x52>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+
+		connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			op-sink-microwatt = <0>;
+			power-role = "dual";
+			self-powered;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec_con_hs: endpoint {
+						remote-endpoint = <&usb1_con_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec_con_ss: endpoint {
+						remote-endpoint = <&usb1_con_ss>;
+					};
+				};
+			};
+		};
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Aquila I2C_4_CSI1 */
+&lpi2c4 {
+	status = "okay";
+};
+
+/* Aquila I2C_6 */
+&lpi2c5 {
+	status = "okay";
+};
+
+/* Aquila I2C_3_DSI1/I2C_5_CSI2 */
+&lpi2c8 {
+	status = "okay";
+};
+
+/* Aquila SPI_1 */
+&lpspi6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi6>, <&pinctrl_gpio_5>;
+	/* Aquila SPI_1_CS (Aquila D09), Aquila GPIO_05 (Aquila C21) */
+	cs-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>, <&gpio4 18 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+
+	tpm@1 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_6>;
+		/* Aquila GPIO_06 (Aquila C22) */
+		interrupt-parent = <&gpio4>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <12000000>;
+	};
+};
+
+/* Aquila UART_3, used as the Linux Console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* Aquila UART_4 */
+&lpuart2 {
+	status = "okay";
+};
+
+/* Aquila UART_1 as Non-Isolated RS-485 */
+&lpuart3 {
+	linux,rs485-enabled-at-boot-time;
+
+	status = "okay";
+};
+
+/* Aquila UART_2 as Isolated RS-485 */
+&lpuart7 {
+	linux,rs485-enabled-at-boot-time;
+
+	status = "okay";
+};
+
+/* Aquila PCIE_1 */
+&pcie0 {
+	status = "okay";
+};
+
+/* Aquila PWM_1 */
+&tpm3 {
+	status = "okay";
+};
+
+/* Aquila PWM_3_DSI. Don't claim PWM_4_DP, as it's used as SFP+ RS1 */
+&tpm5 {
+	pinctrl-0 = <&pinctrl_pwm3_dsi>;
+
+	status = "okay";
+};
+
+/* Aquila PWM_2 */
+&tpm6 {
+	status = "okay";
+};
+
+/* Aquila USB_2 */
+&usb2 {
+	status = "okay";
+};
+
+/* Aquila USB_1 */
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	status = "okay";
+
+	port {
+		usb1_con_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
+&usb3_phy {
+	orientation-switch;
+
+	status = "okay";
+
+	port {
+		usb1_con_ss: endpoint {
+			remote-endpoint = <&typec_con_ss>;
+		};
+	};
+};
+
+/* Aquila SD_1 */
+&usdhc2 {
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	/* Aquila GPIO_07 without internal pull-up or pull-down */
+	pinctrl_gpio_7_dig_in_rb: gpio7diginrbgrp {
+		fsl,pins = <IMX95_PAD_ENET2_RXC__GPIO4_IO_BIT23	0x11e>; /* Aquila C23 */
+	};
+
+	/* Aquila GPIO_08 without internal pull-up or pull-down */
+	pinctrl_gpio_8_dig_in_rb: gpio8diginrbgrp {
+		fsl,pins = <IMX95_PAD_PDM_BIT_STREAM1__AONMIX_TOP_GPIO1_IO_BIT10	0x11e>; /* Aquila C24 */
+	};
+
+	/* Aquila I2S_1_BCLK without internal pull-up or pull-down */
+	pinctrl_i2s_1_bclk_dig_in_rb: sai2txbclkdiginrbgrp {
+		fsl,pins = <IMX95_PAD_ENET2_TXC__GPIO4_IO_BIT21	0x11e>; /* Aquila B20 */
+	};
+};

-- 
2.43.0

