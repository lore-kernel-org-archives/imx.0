Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615273;
	b=fjGqluMhDVlKuNtU7eq+xPUyILlT+VcksoItd93swdGd8KT0iQ66/EqItCA7tErUByX/
	 MKRoqllcfqesPcdz4yRs8eCRnG8/ux1a2jkLfr/VKPvYCqF3knwkzxM2t0GzJj4rrX+FU
	 7Ke58pe1qn/4CvTmRG1QZGKEtPhNYjEA3p3AbgmgB69KC5QeLIujQnx2+v6RFKHZ2oRgU
	 gzAxCqbP6JIcsPO/tEFwysah7urNYY9jxGBCi41m1+v9Hf8otIAQwYIXt5+f2mRP5Ywqj
	 7Oz3tAVdbQvqM7wCLUjshcU/WB4PT6NulErYkpsmxaP18rXdTcr3nsfOsFfDD0jriMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mrNq0ZRBvQ+zprkdb1UnBV4ag8e9ryaPGCvBvx+AW1Q=;
	b=zm2xn2CUzycdDI/3yQZOiDhJ/NKDp+dC9SeS6ltcbtDF7PunZ7IzuYJAVZHrOMcGiXtA
	 zs3hH+sm9j5FVDvG1y7OSJ4vaxOELF+AqNvuAWrGxAido1zH1aH6mOEvGtzkUAsSCDf5b
	 5hGR3kBY70ETRGOIkx94bRavEaMmGt2ZO/19fqsZQLDj1xhzmYwLzmM5EehusTJkuquRb
	 /Hm1H53UV7mhmZa6H130d7AQR4s6I6N9eH3YS689NTMb8pmwB4dkowBatuRXM3/j2C/gM
	 RZKkXgXoaezIknflaaoRCIjBUglzGHPhDOOjrqXSDzf0Y5xEMyod6760tXuA2cAEKOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pcjj/Pyw";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857CE606A326
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 10:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 857CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pcjj/Pyw
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14394530ec6so3422938c88.1
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 02:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793615272; x=1794220072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrNq0ZRBvQ+zprkdb1UnBV4ag8e9ryaPGCvBvx+AW1Q=;
        b=pcjj/PywvE0lAWHsj8bUupKqNVDrIvoz271gsVbv8ytkoofnPb6E6yUs/I9j2Ymc9K
         V4ZPPw9B189AEAgvxJ2F5+B7T8+Y+b+aBBD3OQSHP0w3refHd9MjAYCup8SaWKC6Xbgj
         Pq+lzdVAx5rp9Dyu0YtqzKL0rZWt4kabK9L5gPfRQZf7XIMGs7vWlMUPxni7aw1q1uX6
         7zpb4bFYav3aEiFbtKwfh2Axf0l+sZjvzOj0flgUon/vdmJF7vNmgf2+c8uGmnwGnHHR
         BXB+YbSPHPddgdXRUaGoeE+kKZ5u3ro0aoyogetgFR9TYVgxx9XbNaE5pxz6JasTFA3y
         nYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615272; x=1794220072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrNq0ZRBvQ+zprkdb1UnBV4ag8e9ryaPGCvBvx+AW1Q=;
        b=YzJSbzyWs4O+f6sRUZemYCRSFgjgxw3wtwrPmA837ZLDhMtRlToURMQquduBbLVUm6
         J+D55IBIoA2HW/qHvvtBD2KwPhKZIFqr8VyJoJd6BnVjxbBee9NtyoFfRitmawPJBX7L
         2VlQ1/TvOpDyE2axaPT0qHZnK4J6VxLrbxZpezHzLEnQr8a5C69tox+EDN6FByMb4bZj
         IlJlGmUmXIJlGiYAXUPW3M5c3b6u0bNByrmG06zq63SMFljUqVAqiHfRTxin3TqCT3Mg
         0e9Zbm7/KQXvy//sLxkA0p6co0hi3KjEOUwR4Lr4FJ6drexhVH3JGOd4B1qCSBGhlE+N
         Xmhg==
X-Gm-Message-State: AFq9FYLRTcU7bJTcxr4rAg5HsM1xMDPHd5B11OBBz2++hSDANAB4ERLT
	VJfE1MWgptG+0VfrJBbffKEYWSE2p4VQBuyLtReQMVRLYMY/jJrXIsTB
X-Gm-Gg: AYBFou3b/TWfcvETbMO/TR0tWY1/3+NbJ3+XmuIYfeO6VJhWcLf5B9I6Z5MtRWpFgtZ
	L7sM+nQERDtsAlvwlZJYU6DThikpyWcTSr9/zV8w8eeCbiihq+1hz+BAlcN97hhXLvP3y6+EPB5
	PPDhfovlJWIfVf0MHIcaTEq9RjAD3BeBgVY/cvq/iehAeh2GTdJvAhPRqhL6AnCvCQnXeTIIglg
	FUreNM9SesrrtNQChT/TvLvXZqfwZQS6kWma07Ob7/BxcVHbM+HwFvmHl0gEQJKBkFgJARcQZ7K
	EGCsaqWhD4QYEV5hLC6adFgoe+DPo8nOaCSFFBuKF7mwkr+Byj/xTDtfGPcXlmDsGrt9InFRC8N
	StmMp+x2h9NX/gXGsw0V1rypJ0ow5QVqAzI7J2vFJKu6b9X1lon4XQf2wAsMv8ZvVhRdx/sulas
	oVtYch9EO+QjZu25bx/fXmchklZFIdX8tlQ49Y8JQtOHC5kg0lC/aRq3iTIEIJ7v6sqCMkao7L3
	bUr/zjMshfLH6RQO25gU+Lq7eWJ6+2a7BDWm+oeX218Xf0jI9aF8nKa9UHcr5SkaJYOYlObMP30
	sVPAnN+YgwGYQ7jkC0YlpRoxp/LAGHVA6cJdQOFJfbg=
X-Received: by 2002:a05:701a:c907:b0:16a:1fa:58cb with SMTP id a92af1059eb24-1ac56d95460mr14072256c88.1.1793615271404;
        Mon, 02 Nov 2026 02:27:51 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm56946724c88.7.2026.11.02.02.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:50 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
X-Google-Original-From: Dinesh kumar v <dinesh.v@adlinktech.com>
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
	Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: [PATCH v2 3/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 board support
Date: Mon,  2 Nov 2026 15:56:53 +0530
Message-Id: <20261102102653.272056-4-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102102653.272056-1-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-1-dinesh.v@adlinktech.com>
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

Add the common device tree description for the ADLINK LEC-iMX95
module and the I-Pi SMARC Plus carrier board.

Describe the onboard peripherals and carrier-specific hardware
connections.

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 237 ++++++++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 414 ++++++++++++++++++
 3 files changed, 652 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..26b432127faa 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -983,6 +983,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-lec-ipi-smarc.dtb
 
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts b/arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
new file mode 100644
index 000000000000..9a77bff42b22
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
@@ -0,0 +1,237 @@
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
+};
+
+/* Ethernet SMARC GBE0 */
+&enetc_port0 {
+	pinctrl-0 = <&pinctrl_enetc0>;
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+/* Ethernet SMARC GBE1 */
+&enetc_port1 {
+	pinctrl-0 = <&pinctrl_enetc1>;
+	phy-handle = <&ethphy1>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+&lpi2c2 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* U1000 SX1509BIULTRT_SEMTECH */
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
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio4>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_sx1509q>;
+		pinctrl-names = "default";
+		semtech,probe-reset;
+
+		status = "okay";
+	};
+};
+
+&lpi2c3 {
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&lpi2c8 {
+	pinctrl-0 = <&pinctrl_lpi2c8>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+/* SMARC SPI0 */
+&lpspi6 {
+	cs-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>, <&gpio2 24 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_lpspi6>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+/* SMARC SER1, used as the Linux Console */
+&lpuart1 {
+	bootph-pre-ram;
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&lpuart2 {
+	pinctrl-0 = <&pinctrl_uart2>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&lpuart5 {
+	pinctrl-0 = <&pinctrl_uart5>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+/* SMARC SER2 */
+&lpuart6 {
+	pinctrl-0 = <&pinctrl_uart6>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+/* SMARC SER0 */
+&lpuart7 {
+	pinctrl-0 = <&pinctrl_uart7>;
+	pinctrl-names = "default";
+
+	status = "okay";
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
+	ethphy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <1>;
+		eee-broken-1000t;
+		realtek,clkout-disable;
+	};
+
+	ethphy1: ethernet-phy@4 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <4>;
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
+/* SMARC PCIE_A */
+&pcie0 {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	supports-clkreq;
+
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&i2c2_gpio_expander_71 6 GPIO_ACTIVE_LOW>; /* PCIEA_RST#_3V */
+};
+
+/* U1900 AW-CM276NF */
+&pcie1 {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&i2c2_gpio_expander_71 7 GPIO_ACTIVE_LOW>; /* PCIEB_RST#_3V */
+};
+
+/* SMARC USB0 */
+&usb2 {
+	dr_mode = "host";
+	hnp-disable;
+	adp-disable;
+	srp-disable;
+	disable-over-current;
+
+	status = "okay";
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "host";
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+&usdhc1 {
+	status = "okay";
+};
+
+&usdhc2 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-lec.dtsi b/arch/arm64/boot/dts/freescale/imx95-lec.dtsi
new file mode 100644
index 000000000000..60d68c146ae4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-lec.dtsi
@@ -0,0 +1,414 @@
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
+		serial0 = &lpuart1;
+		serial1 = &lpuart2;
+		serial4 = &lpuart5;
+		serial5 = &lpuart6;
+		serial6 = &lpuart7;
+		spi0 = &lpspi6;
+		usb0 = &usb3_dwc3;
+		usb1 = &usb2;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x01 0x00>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		bootph-pre-ram;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		enable-active-high;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		regulator-name = "VDD_SD2_3V3";
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
+			reusable;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+		};
+	};
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
+&usdhc1 {
+	bootph-pre-ram;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	bus-width = <8>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	no-sdio;
+	no-sd;
+	non-removable;
+};
+
+&usdhc2 {
+	bootph-pre-ram;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	bus-width = <4>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+};
+
+&scmi_iomuxc {
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x50e>,
+			   <IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x90e>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x50e>,
+			   <IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x50e>,
+			   <IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x50e>,
+			   <IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x50e>,
+			   <IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e>,
+			   <IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	        0x58e>,
+			   <IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e>,
+			   <IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	        0x58e>,
+			   <IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e>,
+			   <IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e>,
+			   <IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e>,
+			   <IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e>;
+	};
+
+	pinctrl_enetc1: enetc1grp {
+		fsl,pins = <IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x57e>,
+			   <IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x57e>,
+			   <IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x57e>,
+			   <IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x57e>,
+			   <IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x57e>,
+			   <IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK	        0x5fe>,
+			   <IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL	0x57e>,
+			   <IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK	        0x5fe>,
+			   <IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0		0x57e>,
+			   <IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1		0x57e>,
+			   <IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2		0x57e>,
+			   <IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3		0x57e>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL		0x40000b9e>,
+			   <IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA		0x40000b9e>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e>,
+			   <IMX95_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e>;
+	};
+
+	pinctrl_lpi2c8: lpi2c8grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO13__LPI2C8_SCL		0x40000b9e>,
+			   <IMX95_PAD_GPIO_IO12__LPI2C8_SDA		0x40000b9e>;
+	};
+
+	pinctrl_lpspi6: lpspi6grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO00__GPIO2_IO_BIT0		0x1fe>,
+			   <IMX95_PAD_GPIO_IO24__GPIO2_IO_BIT24		0x1fe>,
+			   <IMX95_PAD_GPIO_IO01__LPSPI6_SIN		0x3fe>,
+			   <IMX95_PAD_GPIO_IO02__LPSPI6_SOUT		0x3fe>,
+			   <IMX95_PAD_GPIO_IO03__LPSPI6_SCK		0x3fe>;
+	};
+
+	pinctrl_pcie0: pcie0grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO32__HSIOMIX_TOP_PCIE1_CLKREQ_B		0x4000031e>;
+	};
+
+	pinctrl_pcie1: pcie1grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO35__HSIOMIX_TOP_PCIE2_CLKREQ_B		0x4000031e>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e>;
+	};
+
+	pinctrl_sx1509q: sx1509qgrp {
+		fsl,pins = <IMX95_PAD_ENET2_MDIO__GPIO4_IO_BIT15		0x1fe>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX	0x31e>,
+			   <IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX	0x31e>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <IMX95_PAD_UART2_RXD__AONMIX_TOP_LPUART2_RX	0x31e>,
+			   <IMX95_PAD_UART2_TXD__AONMIX_TOP_LPUART2_TX	0x31e>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <IMX95_PAD_DAP_TDO_TRACESWO__LPUART5_TX			0x31e>,
+			   <IMX95_PAD_DAP_TDI__LPUART5_RX				0x31e>,
+			   <IMX95_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B			0x31e>,
+			   <IMX95_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B			0x31e>;
+	};
+
+	pinctrl_uart6: uart6grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO04__LPUART6_TX				0x31e>,
+			   <IMX95_PAD_GPIO_IO05__LPUART6_RX				0x31e>,
+			   <IMX95_PAD_GPIO_IO07__LPUART6_RTS_B				0x31e>,
+			   <IMX95_PAD_GPIO_IO06__LPUART6_CTS_B				0x31e>;
+	};
+
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO08__LPUART7_TX				0x31e>,
+			   <IMX95_PAD_GPIO_IO09__LPUART7_RX				0x31e>,
+			   <IMX95_PAD_GPIO_IO11__LPUART7_RTS_B				0x31e>,
+			   <IMX95_PAD_GPIO_IO10__LPUART7_CTS_B				0x31e>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e>,
+			   <IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e>,
+			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e>,
+			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e>,
+			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e>,
+			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e>,
+			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e>,
+			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e>,
+			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e>,
+			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e>,
+			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK			0x15fe>,
+			   <IMX95_PAD_SD1_CMD__USDHC1_CMD			0x13fe>,
+			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe>,
+			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe>,
+			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe>,
+			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe>,
+			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x13fe>,
+			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x13fe>,
+			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe>,
+			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe>,
+			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e>,
+			   <IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e>,
+			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e>,
+			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e>,
+			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e>,
+			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e>,
+			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e>,
+			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e>,
+			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e>,
+			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e>,
+			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x158e>,
+			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x138e>,
+			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e>,
+			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e>,
+			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e>,
+			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e>,
+			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x158e>,
+			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x138e>,
+			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e>,
+			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e>,
+			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e>,
+			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e>,
+			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0		0x31e>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x158e>,
+			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x138e>,
+			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e>,
+			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e>,
+			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e>,
+			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e>,
+			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
+	};
+};
-- 
2.25.1

