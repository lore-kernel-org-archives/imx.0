Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5BC1BCA05
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737452031; cv=none; b=kgxRNomaXdRPX+jOJGYFJbeCsCfGsOUuu5XW1YpNipfeGTpgy9bj8o3stqbApPFW6wMB//mpN4BcOJS39fGYs9CYXPtWDjE0Q33JKgCDWIScRmZFudH99tbT2EWZniesPxAKXq4JspuAs48ERsHk6aa5H449Atj/POTIKlZsV24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737452031; c=relaxed/simple;
	bh=+ihwOzBs88Kz0l7EXXckDoYLGwQNEqyIqcJ22pIy/EI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOw2GXKA/bg23x4Mxsr5J4O3rbh4C7hLmGZ7kfTIMyc40qevGI58iU+ZV2oeZ7z1aI4Rfgfe9kQFFJSm8FKrlFdw4i/DOGqKesa2T6IH1ClGzJdxJeNGe6HI0qVdtF3GlKp3RD2VgiI179hANXv4zRKF2qMwztbqPLk24naOI4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZEJgIAL6; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZEJgIAL6"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B33461C000F;
	Tue, 21 Jan 2025 09:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737452021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j9cM5eRFAusZTUhOOGGgl3Fv27Lw9KaLk8/uWGBfRt0=;
	b=ZEJgIAL6KtqjbAxpwgMzRXcFqIxwSiO79n6/+Awzn/RoYJ7qp9NW/gcL0EmHi9vkC1U/6x
	tPyQSwimfqkacRO+byXzYOTRDmlbSd5cPqSI9gDCJFLKYgTVyKLBxUxTa+9E5nqYpd866i
	bZk5wvxhZGyboDd9nbBXajB7da4wTIIuAOlR79tBlykLhHtxPx8AQkBvfELIR236bmnuej
	D9mv7mvHxJTZhUM6MmLtaB7xEyduZFvwfnLPv5Ty4N284YHME7Nl3qOr2qH3HDLJVBlU43
	6aOlKpvQ5/Flerp7e0iH03O8gxgdioGy2ZhHC88GK34sv4JHPYcgQSjq4nIEQw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 21 Jan 2025 10:33:29 +0100
Subject: [PATCH 3/3] ARM: dts: imx6ul: Add Variscite Concerto board support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-varsom6ul-concerto-dts-v1-3-eb349acf0ac6@bootlin.com>
References: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
In-Reply-To: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9399;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+ihwOzBs88Kz0l7EXXckDoYLGwQNEqyIqcJ22pIy/EI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnj2nybtNzRMN6EUyambGizOs/K94xoDw/1DGaj
 ZJeVL6DfBOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ49p8gAKCRDRgEFAKaOo
 NqhNEAC1cxcgSYasOMnuFSYe6CIDxZ/IyDtAn+FSjf8zwociOcvc0LUBV2NIfPaELgGo8/LaPJ1
 ewdUyJ2/+gYJan2oEajEqWm1cv8EqBcJQcrrZw+t33ogevb18HeDzjgZUgiWUvmwKxhgLzTx4Gy
 lSmcKFiuQ62xZ4I6ogYWIgVdV/iZEZl1vj0DZsM6T9cNMgkGo8onFPTKxkIKSeiF3JJJa9xK8a0
 4woIYEkk9OF64VkSksRyjBOiEhutOIlBNvQS7MurpHyn0wFVUdeNvWNGCvLaqPgpHLRi3ysE7Tt
 hIWaQ+wXaE4ddjYNg9HOIv5Jp7n5W1hd7XK4jq8MK69fo1ve/8g2HzSEH+YYNSG9Nfw2srxmf2R
 OXcYzi48kSUmS17V/ZFjAZfdAkpFOvOhCW/QHvNIKP6yrEl9aU3ZQy9f1ByqXf0kFX2u8CkUpzp
 xZBZPlBzR2cdX4bxFQVDCoPilksv77uMUM9pNlXBz/NSjAxILF89JGicvzRJm2UKSzCKyWoA7qM
 ARpGftpad/B6CMP7eA28YYT9wnXppaWNr4wGFXP3tLsWb4OGo68eAWSxBBrUmKviRxJGvRmUTed
 EsswzstNl2R1M/EvUBxzgBFrgrRvCLQl5rthWrBAPsikMMrA3Ir58gu98oKUPC9NARn3sb+IutT
 TvAXJ8GerZmarCA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com

This patch adds support for the Variscite Concerto Carrier Board.

This Carrier-Board has the following:
- LVDS interface for the VLCD-CAP-GLD-LVDS 7" LCD 800 x 480 touch
  display (not configured)
- USB Host + USB OTG Connector
- 10/100 Mbps Ethernet
- miniPCI-Express slot
- SD Card connector
- Audio Headphone/Line In jack connectors
- S-ATA
- On-board DMIC

Product Page: https://www.variscite.com/product/single-board-computers/concerto-board

This file is based on the one provided by Variscite on their own kernel,
but adapted for mainline.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |   1 +
 .../boot/dts/nxp/imx/imx6ul-var-som-concerto.dts   | 331 +++++++++++++++++++++
 2 files changed, 332 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 39a153536d2a2b8f75b5fbe4332660f89442064a..94c9bc94cc8e2daa1fb3b5686b0b58db1f6678b6 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -329,6 +329,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-tx6ul-0010.dtb \
 	imx6ul-tx6ul-0011.dtb \
 	imx6ul-tx6ul-mainboard.dtb \
+	imx6ul-var-som-concerto.dtb \
 	imx6ull-14x14-evk.dtb \
 	imx6ull-colibri-aster.dtb \
 	imx6ull-colibri-emmc-aster.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
new file mode 100644
index 0000000000000000000000000000000000000000..4289641d94c5a72ba985f339652039dbf13da40c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-MX6UL
+ * Variscite SoM mounted on it
+ *
+ * Copyright 2019 Variscite Ltd.
+ * Copyright 2025 Bootlin
+ */
+
+#include "imx6ul-var-som.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX6UL Concerto Board";
+	compatible = "variscite,mx6concerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm4 0 20000 0>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+		status = "okay";
+	};
+
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_key_back>, <&pinctrl_gpio_key_wakeup>;
+
+		key-back {
+			gpios = <&gpio4 14 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_BACK>;
+		};
+
+		key-wakeup {
+			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_WAKEUP>;
+			wakeup-source;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		gpled2 {
+			gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	status = "okay";
+};
+
+&fec1 {
+	status = "disabled";
+};
+
+&fec2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet2>, <&pinctrl_enet2_gpio>, <&pinctrl_enet2_mdio>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy1>;
+	phy-reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
+	phy-reset-duration = <100>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy1: ethernet-phy@3 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			micrel,rmii-reference-clock-select-25-mhz = <1>;
+			micrel,led-mode = <0>;
+			clocks = <&rmii_ref_clk>;
+			clock-names = "rmii-ref";
+			reg = <3>;
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	/* DS1337 RTC module */
+	rtc@68 {
+		/*
+		 * To actually use this interrupt
+		 * connect pins J14.8 & J14.10 on the Concerto-Board.
+		 */
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&iomuxc {
+	pinctrl_enet2: enet2grp {
+		fsl,pins = <
+			MX6UL_PAD_ENET2_RX_EN__ENET2_RX_EN	0x1b0b0
+			MX6UL_PAD_ENET2_RX_ER__ENET2_RX_ER	0x1b0b0
+			MX6UL_PAD_ENET2_RX_DATA0__ENET2_RDATA00	0x1b0b0
+			MX6UL_PAD_ENET2_RX_DATA1__ENET2_RDATA01	0x1b0b0
+			MX6UL_PAD_ENET2_TX_EN__ENET2_TX_EN	0x1b0b0
+			MX6UL_PAD_ENET2_TX_DATA0__ENET2_TDATA00	0x1b0b0
+			MX6UL_PAD_ENET2_TX_DATA1__ENET2_TDATA01	0x1b0b0
+			MX6UL_PAD_ENET2_TX_CLK__ENET2_REF_CLK2	0x4001b031
+		>;
+	};
+
+	pinctrl_enet2_mdio: enet2-mdiogrp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO06__ENET2_MDIO	0x1b0b0
+			MX6UL_PAD_GPIO1_IO07__ENET2_MDC		0x1b0b0
+		>;
+	};
+
+	pinctrl_enet2_gpio: enet2-gpiogrp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER5__GPIO5_IO05	0x1b0b0 /* fec2 reset */
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX6UL_PAD_UART3_RTS_B__FLEXCAN1_RX	0x1b020
+			MX6UL_PAD_UART3_CTS_B__FLEXCAN1_TX	0x1b020
+		>;
+	};
+
+	pinctrl_gpio_key_back: gpio-key-backgrp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_CE1_B__GPIO4_IO14	0x17059 /* Back */
+		>;
+	};
+
+	pinctrl_gpio_leds: gpio-ledsgrp {
+		fsl,pins = <
+			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
+			MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
+		>;
+	};
+
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO05__PWM4_OUT		0x110b0
+		>;
+	};
+
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_MOD__GPIO1_IO10		0x1b0b0 /* RTC alarm IRQ */
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX6UL_PAD_CSI_DATA00__UART5_DCE_TX	0x1b0b1
+			MX6UL_PAD_CSI_DATA01__UART5_DCE_RX	0x1b0b1
+			MX6UL_PAD_GPIO1_IO09__UART5_DCE_CTS	0x1b0b1
+			MX6UL_PAD_GPIO1_IO08__UART5_DCE_RTS	0x1b0b1
+		>;
+	};
+
+	pinctrl_usb_otg1_id: usbotg1idgrp {
+		fsl,pins = <
+			MX6UL_PAD_UART3_TX_DATA__ANATOP_OTG1_ID	0x17059
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO01__WDOG1_WDOG_B	0x78b0
+		>;
+	};
+
+	pinctrl_ft5x06_ts_gpio: ft5x06-ts-gpiogrp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER9__GPIO5_IO09	0x80000000
+		>;
+	};
+
+	pinctrl_gpio_key_wakeup: gpio-keys-wakeupgrp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER8__GPIO5_IO08	0x17059 /* Wakeup */
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
+		>;
+	};
+
+	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00	0x1b0b1 /* CD */
+		>;
+	};
+};
+
+&pwm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm4>;
+	status = "okay";
+};
+
+&snvs_pwrkey {
+	status = "disabled";
+};
+
+&snvs_rtc {
+	status = "disabled";
+};
+
+&tsc {
+	/*
+	 * Conflics with wdog1 ext-reset-output & SD CD pins,
+	 * so we keep it disabled by default.
+	 */
+	status = "disabled";
+};
+
+/* Console UART */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+/* ttymxc4 UART */
+&uart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usbotg1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb_otg1_id>;
+	dr_mode = "otg";
+	disable-over-current;
+	srp-disable;
+	hnp-disable;
+	adp-disable;
+	status = "okay";
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	disable-over-current;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	/*
+	 * To actually use ext-reset-output
+	 * connect pins J17.3 & J17.8 on the Concerto-Board
+	 */
+	fsl,ext-reset-output;
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
+	cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	no-1-8-v;
+	keep-power-in-suspend;
+	wakeup-source;
+	status = "okay";
+};

-- 
2.47.0.2.g7caf9f4c55.dirty

