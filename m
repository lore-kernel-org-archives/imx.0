Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595009;
	b=An30KdMnHJZtYaSMqMMRiASD0nUtvbFVbzq/H6I9pb5QNkQiyOr+lt9Y2c2fFPmLp93a
	 rTM1zNbNR1cYBC3VgTM8zT1YtiMtv2Vog7g3JoaTZEC8AJiyU4Gz6Co+dcVEAyQKXO2d4
	 OmrAyZTIO3GZm/u+gEVTfJJqe+ZCn8dWkE2qMg5dmgQQEkXXz/87pav/cfYZtEOKk3YD7
	 Rh0S1NFYkZZ3R4afgUJhtyyT/cuO9zG+O7Lnnmqcq381lR1PJNJ+8w+cvWF45J6qbCUpf
	 dhC2lEY36zKo1hfl+bhlMezoaYiOEb3FR9/ArDpi3hBtxSJZFy9tUgkmMoCWUT5BBDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uDjvPLdwbfA1f8H9+djRt9vnsR+aTQXy9FsU7ESVgr0=;
	b=Mftbh1rR/uNbiPxaPyxCwLQbRMKxYm4AfHpG+mQg6F6fKLYqWOcy1MNqItlppOdDMDwc
	 cFv/qeD2nBeI8Qk1zbk7ChT0TJ6KDJQYSYQBdhF0uN+oLso8DgIezj1giDXDn3UF2Dv/L
	 VhflF3yf7SVHQMRr43WiixNyr7HPvaPiUTyyP5Ng893J8LM6Wb4r/MHOSjFEbj4L09pIK
	 6PA7g+RtHg1FjEhWb3Z455ky8WC9hIhYa92b8yWirSs5WoQ7oOsYeAygOLG5T8zm4PNFt
	 xjQzAyCZytnLBd+yBJZvR6rr0JD2MaX/H8OO3w4YVMml8Bmgo1Z5qYWnp42NAM18CwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dfMsW29R;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527F1606A323
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 08:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527F1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dfMsW29R
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso11760734eec.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 00:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595007; x=1796199807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDjvPLdwbfA1f8H9+djRt9vnsR+aTQXy9FsU7ESVgr0=;
        b=dfMsW29RuXpduuwZtN9jt1NKTuAZ7rJFgnAuRvqha/5UacztAicAq/YD3jZHo0Bmy/
         1+W3Aisr2BDESfleufmgXWczkC8g600q+5A7WbsxiKFHQ1hlkRbcI9zAXswa0TR42U3V
         Ni0pHoVy/M2n1Z6k+hZ+3NBUZ2Ue164xgTv4hjGAxv8Ck9dxwn0QKSB+i9kdzWfM+WwE
         RGizJ1/ouwn/tzDkiD6M26707W55QfjQBqX36qT0Du1ul2KJvyw2nyrzQVPL3wN8oJCI
         m+5VGaR8hp2GKdy/0Ey6ZEz0RSMm0LPSFbjskKhYS8QKdU1kY1D9US8f21DhYVepvjIA
         0pQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595007; x=1796199807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uDjvPLdwbfA1f8H9+djRt9vnsR+aTQXy9FsU7ESVgr0=;
        b=uBhgiCxrPjsaeCQpwWaf3+CKWJV9QvzAOkYE5Hl5Ephm9u1+ngaPiI+8C/2POsOL4u
         RudCD9nWWLGpGkuQnCX7aiAcNofnxxC2dYe27IV4/cK2H5IHbajhaqpeT+GnXo3SUTtU
         EZxdtpzM0eL6V9znBgSjmhPOG6fOt0Q1UCHHWyKkVxTp434tnAlY4Tu4N91bpu2VqV34
         jEw57wrmRHldgYMqdBANzlyi4yG4A5pSwQonA9+9sYAiZoPPWzrWwal4Q7Fei4zQ/3oL
         HwJh1T5dEUqakNG2pRalkVL4D+8+sauLIkYpiz9kkhxcKuCg26k61xvaep2eU5Cuw5HN
         a0yA==
X-Gm-Message-State: APuU4Z8ovhxM/Bu6e3fQxLrvTlJLGhMm4sXca/D7c6ac1QfKpyclMxo1
	xoWZNH0IuXvTsABU5F5TLze7rif+ZQAjME7i+/4nTQev1l3djevVDDUa
X-Gm-Gg: AZFdTZdyLfggV2G8RhcCEFtxY2+Q2svBbNqPoMTJ5vY1/f0gxuJ5TaQvqc+u0yDNoup
	v3aqB53DVxPjnsgw6DYn1lQgVSq5B8pRfK5ZwlO6HJgkJWslToXBl9u1YtbBkhSY9D1KMdKBRZl
	ZBlw7lFN1RHhyvnTXTvO1jLcPlFQzdQwyARMyzji2RikaLQHuCnGUKFgrFrNnsA4RhtNRBXyilk
	ZK2hz2XESYWGqr4AGZPC6Q9KB5rKtPg+fjDeZh5WA8Tyct3zX7qXtBjc/E2UX6Sv1hEIDqBH3BE
	vTZtDWal6Kp94zRPVV+wZBkzPjA3CMfPbI1DJaCnYRh6tJOb8ee7bFoQ2wgQrkyOG1dTBQQh7wL
	QPvhrlOLX8kMThM9H9lahjykm0riOfBvtP5E47UORfwEiSRdf6t3F8DUs8uuey0OMa79e7E2Mg0
	IgU+PUHMFLf0u0yTQz4Xf+gHMU0ogAKqo+MqOcDP+lZZgevd5GtC1SVdWV33aFobTF6o1qFXaHw
	BH4LT2bD8DAAkaX3m4bvd5qmEAUld92HgyN/Ff1frRMlk3IQye9qD/HP6oTylpSzYJP+oqvbmjT
	Dh07WeboF1XbLW6Jeqke/mWNE7tGoWxIoguaqWLqygpfuu+InUYaJmt6IzVB5RstQoDNwyXq
X-Received: by 2002:a05:7301:152f:b0:381:c532:3d88 with SMTP id 5a478bee46e88-3857093c38bmr19438887eec.23.1795595007236;
        Wed, 25 Nov 2026 00:23:27 -0800 (PST)
Received: from adlinkccoe2-Dell-G15-5511.adlinktech.com ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm50919906eec.23.2026.11.25.00.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:23:26 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v3 3/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 board support
Date: Wed, 25 Nov 2026 13:52:22 +0530
Message-Id: <20261125082222.136238-4-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125082222.136238-1-dineshkumarv85@gmail.com>
References: <20261125082222.136238-1-dineshkumarv85@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree support for the ADLINK LEC-iMX95 module
with the I-Pi SMARC Plus carrier board.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 147 ++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 631 ++++++++++++++++++
 3 files changed, 779 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..bb02809bb225 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -965,6 +965,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-lec-ipi-smarc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-osm-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts b/arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
new file mode 100644
index 000000000000..3301931e2522
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (C) 2026 ADLINK Technology Inc.
+ *
+ * https://www.adlinktech.com/products/Computer_on_Modules/SMARC/LEC-IMX95
+ * https://www.adlinktech.com/products/computer_on_modules/SMARCStarterKits/I-Pi_SMARC_IMX95
+ */
+
+/dts-v1/;
+
+#include "imx95-lec.dtsi"
+
+/ {
+	model = "ADLINK LEC-iMX95 on I-Pi SMARC Plus Carrier Board";
+	compatible = "adlink,lec-imx95-ipi-smarc",
+		     "adlink,lec-imx95",
+		     "fsl,imx95";
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+};
+
+/* Ethernet SMARC GBE0 */
+&enetc_port0 {
+	status = "okay";
+};
+
+/* Ethernet SMARC GBE1 */
+&enetc_port1 {
+	status = "okay";
+};
+
+&lpi2c8 {
+	status = "okay";
+
+	/* SX1509(2) U1001@IPi SMARC Plus */
+	i2c8_gpio_expander_3e: pinctrl@3e {
+		/*
+		 * GPIO Expander 2 Mapping:
+		 * - 0: E_GPIO1_0	<=>	IPi SMARC Plus CN101_PIN29: E_GPIO1_0
+		 * - 1: E_GPIO1_1	<=>	IPi SMARC Plus CN101_PIN31: E_GPIO1_1
+		 * - 2: E_GPIO1_2	<=>	IPi SMARC Plus CN101_PIN32: E_GPIO1_2
+		 * - 3: E_GPIO1_3	<=>	IPi SMARC Plus CN101_PIN33: E_GPIO1_3
+		 * - 4: E_GPIO1_4	<=>	IPi SMARC Plus CN101_PIN35: E_GPIO1_4
+		 * - 5: E_GPIO1_5	<=>	IPi SMARC Plus CN101_PIN36: E_GPIO1_5
+		 * - 6: E_GPIO1_6	<=>	IPi SMARC Plus CN101_PIN37: E_GPIO1_6
+		 * - 7: E_GPIO1_7	<=>	IPi SMARC Plus CN101_PIN38: E_GPIO1_7
+		 * - 8: E_GPIO2_8	<=>	IPi SMARC Plus CN101_PIN40: E_GPIO2_8
+		 * - 9: TP1002		<=>	IPi SMARC Plus TP1002
+		 * - 10: TP1003		<=>	IPi SMARC Plus TP1003
+		 * - 11: TP1004		<=>	IPi SMARC Plus TP1004
+		 * - 12: TP1005		<=>	IPi SMARC Plus TP1005
+		 * - 13: TP1006		<=>	IPi SMARC Plus TP1006
+		 * - 14: TP1007		<=>	IPi SMARC Plus TP1007
+		 * - 15: TP1008		<=>	IPi SMARC Plus TP1008
+		 * - 16: OSCIO		<=>	IPi SMARC Plus TP1001
+		 */
+		compatible = "semtech,sx1509q";
+		reg = <0x3e>;
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		interrupt-controller;
+		/* GPIO2_IO22 (module FAN_PWM_1V8) is the expander IRQ on this carrier */
+		interrupt-parent = <&gpio2>;
+		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_gpio_exp_3e>;
+		pinctrl-names = "default";
+		gpio-line-names =
+			"E_GPIO1_0",		/* 0 - CN101 Pin 29 */
+			"E_GPIO1_1",		/* 1 - CN101 Pin 31 */
+			"E_GPIO1_2",		/* 2 - CN101 Pin 32 */
+			"E_GPIO1_3",		/* 3 - CN101 Pin 33 */
+			"E_GPIO1_4",		/* 4 - CN101 Pin 35 */
+			"E_GPIO1_5",		/* 5 - CN101 Pin 36 */
+			"E_GPIO1_6",		/* 6 - CN101 Pin 37 */
+			"E_GPIO1_7",		/* 7 - CN101 Pin 38 */
+			"E_GPIO2_8",		/* 8 - CN101 Pin 40 */
+			"",			/* 9 - TP1002 */
+			"",			/* 10 - TP1003 */
+			"",			/* 11 - TP1004 */
+			"",			/* 12 - TP1005 */
+			"",			/* 13 - TP1006 */
+			"",			/* 14 - TP1007 */
+			"",			/* 15 - TP1008 */
+			"";			/* 16 - OSCIO / TP1001 */
+		semtech,probe-reset;
+	};
+};
+
+/* SMARC SPI0 */
+&lpspi6 {
+	status = "okay";
+};
+
+/* SMARC SER1, used as the Linux Console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* SMARC SER3 */
+&lpuart2 {
+	status = "okay";
+};
+
+/* SMARC SER0 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* SMARC PCIE_A */
+&pcie0 {
+	status = "okay";
+};
+
+/* SMARC USB0 */
+&usb2 {
+	dr_mode = "host";
+	disable-over-current;
+
+	status = "okay";
+};
+
+/* SMARC USB1 */
+&usb3_dwc3 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+/* SMARC SDIO, microSD slot */
+&usdhc2 {
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_gpio_exp_3e: gpioexp3egrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO22__GPIO2_IO_BIT22		0x1fe
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-lec.dtsi b/arch/arm64/boot/dts/freescale/imx95-lec.dtsi
new file mode 100644
index 000000000000..079639b8736b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-lec.dtsi
@@ -0,0 +1,631 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (C) 2026 ADLINK Technology Inc.
+ * https://www.adlinktech.com/products/Computer_on_Modules/SMARC/LEC-IMX95
+ * https://www.adlinktech.com/products/computer_on_modules/SMARCStarterKits/I-Pi_SMARC_IMX95
+ */
+
+#include "imx95.dtsi"
+
+/ {
+	aliases {
+		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port1;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		gpio4 = &gpio5;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		i2c7 = &lpi2c8;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		rtc0 = &rtc_i2c;
+		rtc1 = &scmi_bbm;
+		serial0 = &lpuart1;
+		serial1 = &lpuart2;
+		serial2 = &lpuart5;
+		serial3 = &lpuart7;
+		spi0 = &lpspi6;
+		usb0 = &usb3_dwc3;
+		usb1 = &usb2;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x1 0x00000000>;
+	};
+
+	reg_pcie0: regulator-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "RC210_EN_3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&i2c2_gpio_expander_71 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		bootph-pre-ram;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-name = "VDD_SD2_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <12000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux_cma: linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x7f000000>;
+			size = <0 0x3c000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+};
+
+/* Ethernet SMARC GBE0 */
+&enetc_port0 {
+	pinctrl-0 = <&pinctrl_enetc0>;
+	pinctrl-names = "default";
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+};
+
+/* Ethernet SMARC GBE1 */
+&enetc_port1 {
+	pinctrl-0 = <&pinctrl_enetc1>;
+	pinctrl-names = "default";
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+};
+
+&gpio2 {
+	gpio-line-names =
+		"SMARC_SPI0_CS0#",	/* 0 - GPIO_IO00 */
+		"SMARC_SPI0_DIN",	/* 1 - GPIO_IO01 */
+		"SMARC_SPI0_DO",	/* 2 - GPIO_IO02 */
+		"SMARC_SPI0_CK",	/* 3 - GPIO_IO03 */
+		"",			/* 4 - GPIO_IO04 */
+		"",			/* 5 - GPIO_IO05 */
+		"",			/* 6 - GPIO_IO06 */
+		"",			/* 7 - GPIO_IO07 */
+		"SMARC_UART0_TXD",	/* 8 - GPIO_IO08 */
+		"SMARC_UART0_RXD",	/* 9 - GPIO_IO09 */
+		"SMARC_UART0_CTS_B",	/* 10 - GPIO_IO10 */
+		"SMARC_UART0_RTS_B",	/* 11 - GPIO_IO11 */
+		"SMARC_I2C_GP_DAT",	/* 12 - GPIO_IO12 */
+		"SMARC_I2C_GP_CK",	/* 13 - GPIO_IO13 */
+		"UART3_TXD_1V8",	/* 14 - GPIO_IO14 */
+		"UART3_RXD_1V8",	/* 15 - GPIO_IO15 */
+		"SAI3_TXC_1V8",		/* 16 - GPIO_IO16 */
+		"SAI3_MCLK_1V8",	/* 17 - GPIO_IO17 */
+		"SMB_INT_B_1V8",	/* 18 - GPIO_IO18 */
+		"LVDS0_BKLT_PWM_1V8",	/* 19 - GPIO_IO19 */
+		"SAI3_RXD_1V8",		/* 20 - GPIO_IO20 */
+		"SAI3_TXD_1V8",		/* 21 - GPIO_IO21 */
+		"FAN_PWM_1V8",		/* 22 - GPIO_IO22 */
+		"LVDS1_BKLT_PWM_1V8",	/* 23 - GPIO_IO23 */
+		"SPI6_SS1_1V8",		/* 24 - GPIO_IO24 */
+		"",			/* 25 - GPIO_IO25 */
+		"SAI3_TXFS_1V8",	/* 26 - GPIO_IO26 */
+		"TPM_INT_N_1V8",	/* 27 - GPIO_IO27 */
+		"SMARC_I2C_PM_DAT",	/* 28 - GPIO_IO28 */
+		"SMARC_I2C_PM_CK",	/* 29 - GPIO_IO29 */
+		"SMARC_CAN1_TX",	/* 30 - GPIO_IO30 (SMARC CAN1_H via transceiver) */
+		"SMARC_CAN1_RX";	/* 31 - GPIO_IO31 (SMARC CAN1_L via transceiver) */
+};
+
+&gpio3 {
+	gpio-line-names =
+		"SD2_CD_B",
+		"SD2_CLK",
+		"SD2_CMD",
+		"SD2_DATA0",
+		"SD2_DATA1",
+		"SD2_DATA2",
+		"SD2_DATA3",
+		"SD2_RST_B_1V8A3V",
+		"SD1_CLK",
+		"SD1_CMD",
+		"SD1_DATA0",
+		"SD1_DATA1",
+		"SD1_DATA2",
+		"SD1_DATA3",
+		"SD1_DATA4",
+		"SD1_DATA5",
+		"SD1_DATA6",
+		"SD1_DATA7",
+		"SD1_STROBE",
+		"SD2_VSEL_1V8",
+		"SD3_CLK",
+		"SD3_CMD",
+		"SD3_DATA0",
+		"SD3_DATA1",
+		"SD3_DATA2",
+		"SD3_DATA3",
+		"CCM_CLKO1",
+		"CCM_CLKO2",
+		"DAP_TDI",
+		"DAP_TMS_SWDIO",
+		"DAP_TCLK_SWCLK",
+		"DAP_TDO_TRACESWO";
+};
+
+&gpio4 {
+	gpio-line-names =
+		"ENET1_MDC",
+		"ENET1_MDIO",
+		"ENET1_TD3",
+		"ENET1_TD2",
+		"ENET1_TD1",
+		"ENET1_TD0",
+		"ENET1_TX_CTL",
+		"ENET1_TXC",
+		"ENET1_RX_CTL",
+		"ENET1_RXC",
+		"ENET1_RD0",
+		"ENET1_RD1",
+		"ENET1_RD2",
+		"ENET1_RD3",
+		"RTC_INT#_1V8",
+		"IOEXP2_INT#_1V8",
+		"ENET2_TD3",
+		"ENET2_TD2",
+		"ENET2_TD1",
+		"ENET2_TD0",
+		"ENET2_TX_CTL",
+		"ENET2_TXC",
+		"ENET2_RX_CTL",
+		"ENET2_RXC",
+		"ENET2_RD0",
+		"ENET2_RD1",
+		"ENET2_RD2",
+		"ENET2_RD3",
+		"CCM_CLKO3",
+		"CCM_CLKO4";
+};
+
+&gpio5 {
+	gpio-line-names =
+		"QSPIA_DATA0",
+		"QSPIA_DATA1",
+		"QSPIA_DATA2",
+		"QSPIA_DATA3",
+		"SKU_CONFIG1_1V8",
+		"SKU_CONFIG2_1V8",
+		"SKU_CONFIG3_1V8",
+		"SYS_STATUS_1V8",
+		"SD2_WP_1V8",
+		"QSPIA_SCLK",
+		"QSPIA_nSS0",
+		"SYS_RST#_1V8",
+		"PCIE1_IMX_CLKREQ#_1V8",
+		"MCU_INTB1_1V8",
+		"MCU_INTB2_1V8",
+		"PCIE2_IMX_CLKREQ#_1V8",
+		"ENET1_INT_B_1V8",
+		"ENET2_INT_B_1V8";
+};
+
+&lpi2c2 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+		pagesize = <64>;
+	};
+
+	/* U1000 SX1509BIULTRT_SEMTECH on module */
+	i2c2_gpio_expander_71: pinctrl@71 {
+		/*
+		 * GPIO Expander Mapping:
+		 * - 0: ENET1_RST_B_3V		=>		U2001
+		 * - 1: ENET2_RST_B_3V		=>		U2101
+		 * - 2: SERDES_RST#_3V		=>		SMARC S77 PCIE_C_RST
+		 * - 3: RC210_EN_3V		=>		U1300, RC21008B001GND
+		 * - 4: LT9611_RSTN_3V		=>		U1500
+		 * - 5: HDMI_INT_3V		<=		U1500
+		 * - 6: PCIEA_RST#_3V		=>		SMARC P75
+		 * - 7: PCIEB_RST#_3V		=>		SMARC S76
+		 * - 8: TPM_RST_N_1V8		=>		U2400
+		 * - 9: LID#_1V8		<=	R1005	SMARC S148
+		 * - 10: SLEEP#_1V8		<=	R1010	SMARC S149
+		 * - 11: CHARGING#_1V8		<=	R1007	SMARC S151
+		 * - 12: CHARGER_PRSNT#_1V8	<=	R1011	SMARC S152
+		 * - 13: BATLOW#_1V8		<=	R1014	SMARC S156
+		 * - 14: TEST#_1V8		<=	R1015	SMARC S157
+		 * - 15: DSI0_TE_1V8		<=	R1087	SMARC S144
+		 */
+		compatible = "semtech,sx1509q";
+		reg = <0x71>;
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		interrupt-controller;
+		interrupt-parent = <&gpio4>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_sx1509q>;
+		pinctrl-names = "default";
+		gpio-line-names =
+			"ENET1_RST_B_3V",	/* 0 */
+			"ENET2_RST_B_3V",	/* 1 */
+			"SERDES_RST#_3V",	/* 2 */
+			"RC210_EN_3V",		/* 3 */
+			"LT9611_RSTN_3V",	/* 4 */
+			"HDMI_INT_3V",		/* 5 */
+			"PCIEA_RST#_3V",	/* 6 */
+			"PCIEB_RST#_3V",	/* 7 */
+			"TPM_RST_N_1V8",	/* 8 */
+			"SMARC_LID#",		/* 9 */
+			"SMARC_SLEEP#",		/* 10 */
+			"SMARC_CHARGING#",	/* 11 */
+			"SMARC_CHARGER_PRSNT#",	/* 12 */
+			"SMARC_BATLOW#",	/* 13 */
+			"SMARC_TEST#",		/* 14 */
+			"DSI0_TE_1V8",		/* 15 */
+			"";			/* 16 - OSCIO */
+		semtech,probe-reset;
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	rtc_i2c: rtc@32 {
+		compatible = "epson,rx8130";
+		reg = <0x32>;
+	};
+};
+
+&lpi2c8 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_lpi2c8>;
+	pinctrl-names = "default";
+};
+
+&lpspi6 {
+	cs-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>, <&gpio2 24 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_lpspi6>;
+	pinctrl-names = "default";
+};
+
+&lpuart1 {
+	bootph-pre-ram;
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+};
+
+&lpuart2 {
+	pinctrl-0 = <&pinctrl_uart2>;
+	pinctrl-names = "default";
+};
+
+&lpuart5 {
+	pinctrl-0 = <&pinctrl_uart5>;
+	pinctrl-names = "default";
+};
+
+&lpuart7 {
+	pinctrl-0 = <&pinctrl_uart7>;
+	pinctrl-names = "default";
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-0 = <&pinctrl_emdio>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* U2001 RTL8211F */
+	ethphy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <1>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&i2c2_gpio_expander_71 0 GPIO_ACTIVE_LOW>;
+		eee-broken-1000t;
+		realtek,clkout-disable;
+	};
+
+	/* U2101 RTL8211F */
+	ethphy1: ethernet-phy@4 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <4>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&i2c2_gpio_expander_71 1 GPIO_ACTIVE_LOW>;
+		eee-broken-1000t;
+		realtek,clkout-disable;
+	};
+};
+
+&netc_timer {
+	status = "okay";
+};
+
+&netcmix_blk_ctrl {
+	status = "okay";
+};
+
+&pcie0 {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	supports-clkreq;
+	vpcie-supply = <&reg_pcie0>;
+};
+
+&pcie0_port0 {
+	reset-gpios = <&i2c2_gpio_expander_71 6 GPIO_ACTIVE_LOW>; /* PCIEA_RST#_3V */
+};
+
+/* U1900 AW-CM276NF Wi-Fi/BT on module */
+&pcie1 {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_pcie0>;
+
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&i2c2_gpio_expander_71 7 GPIO_ACTIVE_LOW>; /* PCIEB_RST#_3V */
+};
+
+/* SMARC USB1 */
+&usb3_dwc3 {
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+};
+
+/* eMMC on module */
+&usdhc1 {
+	bootph-pre-ram;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+/* SMARC SDIO */
+&usdhc2 {
+	bootph-pre-ram;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+};
+
+&wdog3 {
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x50e
+			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x90e
+		>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x50e
+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x50e
+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x50e
+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x50e
+			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e
+			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e
+			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e
+			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	0x58e
+			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e
+			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e
+			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e
+			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e
+		>;
+	};
+
+	pinctrl_enetc1: enetc1grp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x50e
+			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x50e
+			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x50e
+			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x50e
+			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x57e
+			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK	0x58e
+			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL	0x57e
+			IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK	0x58e
+			IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0		0x57e
+			IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1		0x57e
+			IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2		0x57e
+			IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3		0x57e
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL		0x40000b9e
+			IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
+			IMX95_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c8: lpi2c8grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO13__LPI2C8_SCL		0x40000b9e
+			IMX95_PAD_GPIO_IO12__LPI2C8_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpspi6: lpspi6grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO00__GPIO2_IO_BIT0	0x1fe
+			IMX95_PAD_GPIO_IO24__GPIO2_IO_BIT24	0x1fe
+			IMX95_PAD_GPIO_IO01__LPSPI6_SIN		0x3fe
+			IMX95_PAD_GPIO_IO02__LPSPI6_SOUT	0x3fe
+			IMX95_PAD_GPIO_IO03__LPSPI6_SCK		0x3fe
+		>;
+	};
+
+	pinctrl_pcie0: pcie0grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO32__HSIOMIX_TOP_PCIE1_CLKREQ_B		0x4000031e
+		>;
+	};
+
+	pinctrl_pcie1: pcie1grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO35__HSIOMIX_TOP_PCIE2_CLKREQ_B		0x4000031e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e
+		>;
+	};
+
+	pinctrl_sx1509q: sx1509qgrp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_MDIO__GPIO4_IO_BIT15			0x1fe
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		bootph-pre-ram;
+		fsl,pins = <
+			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX	0x31e
+			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX	0x31e
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			IMX95_PAD_UART2_RXD__AONMIX_TOP_LPUART2_RX	0x31e
+			IMX95_PAD_UART2_TXD__AONMIX_TOP_LPUART2_TX	0x31e
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			IMX95_PAD_DAP_TDO_TRACESWO__LPUART5_TX			0x31e
+			IMX95_PAD_DAP_TDI__LPUART5_RX				0x31e
+			IMX95_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B			0x31e
+			IMX95_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B			0x31e
+		>;
+	};
+
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO08__LPUART7_TX				0x31e
+			IMX95_PAD_GPIO_IO09__LPUART7_RX				0x31e
+			IMX95_PAD_GPIO_IO11__LPUART7_RTS_B			0x31e
+			IMX95_PAD_GPIO_IO10__LPUART7_CTS_B			0x31e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x15fe
+			IMX95_PAD_SD1_CMD__USDHC1_CMD			0x13fe
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x13fe
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x13fe
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x13fe
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x13fe
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x13fe
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x13fe
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x13fe
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x13fe
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x15fe
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		bootph-pre-ram;
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x138e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x158e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK			0x15fe
+			IMX95_PAD_SD2_CMD__USDHC2_CMD			0x13fe
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0		0x13fe
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1		0x13fe
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2		0x13fe
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3		0x13fe
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		bootph-pre-ram;
+		fsl,pins = <
+			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0		0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		bootph-pre-ram;
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK			0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD			0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0		0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1		0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2		0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3		0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
+		>;
+	};
+};
-- 
2.25.1

