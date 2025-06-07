Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975BC221281
	for <imx@lists.linux.dev>; Sat,  7 Jun 2025 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288844; cv=none; b=ZKEpQNJOltJR4vsq/sMvYGEiNTPWIsYWOSXaxjNpW6rtA4j9Q3kqdmCA1oXzctsKxTQlf34s9UrqZ9I5UWDyBueeCsBcVsiAc5vreIhyEAVUx0rdcVQC06CYOO3f82NsnrfFXy+YneF86MYuiKg5UNH6hRAyHjSkyv7keevGRug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288844; c=relaxed/simple;
	bh=EnaaBSVIHASN/VvhxdKxZE1FQofT/VReabBoLiuFpnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ElMpAOoeax+wJQyaoMlt9u4GlQ49eZvVpPdontBiLINGYYnSImo16oUK4E3/GTmH+PMabGL660yksS//BVDVOmApsWuIxUFKPtqjSREZAAAhjd3UyglN+brw97uyPztf68cNkFBmchUKGavN56xP5eOLnADrxzS8A2+TWwtXnIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YS02hBVL; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YS02hBVL"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad89ee255easo510834866b.3
        for <imx@lists.linux.dev>; Sat, 07 Jun 2025 02:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288841; x=1749893641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BY5a2j93oXGkMU8803msBPZC+Hhuefek8iCrsedNGL4=;
        b=YS02hBVLjPqI4rDb9otIR2IOPggcVKYFT2Dvhu1E64puvAiH4IlyWw4MCFAhlMpmip
         b4kN6Fx6F9BajYl38/LrVmiBFbuvtdn5j82Rn9sf6yEFsKnFdbkdyMk4Dn/iCZhg6lCu
         f5w4LeNg9Xrjn7tNpzxjTdDECimihuyfL6XKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288841; x=1749893641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BY5a2j93oXGkMU8803msBPZC+Hhuefek8iCrsedNGL4=;
        b=YuEzW2IuGkpUoFjviA+LhEeiS5XaFqKj6sk+Eevmva/kZoOYx5b1llFT0ACzR5jLEW
         xFaViAWL0uMiKXVQwovU/uJD1/blpshh0IFVnFw+htpidrt8t+/4uecvps/v5WWewNiL
         /T8vU3xTyxo6ssrFC6MBTkN+J1GZb1HpHKh/OjX+cS8X+s3TvKKQDru5qFT6iOVDFINA
         4xTW9bYo2lp6WRItbN2D+WS2upKvfVVwu+26fewENjlNBOjpWW1ycn+Xy2fIZRrIq8u8
         uy4RxYOsZUU1lcgTxlznhqIIlXW2KdzlwcjbGVbDSgKhDaI/rf8n2da+jUMLFKR78TIm
         iF6w==
X-Forwarded-Encrypted: i=1; AJvYcCUn52BapFh29moa8FM0Phz6qR1WImFCMdV2oA4DqG09kKxwm4hNNQ3i/o/i9LfX8IU6ItY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhRK0yCm3FuX3nibIo6C6qr19jWkoahaCNI+uiKss4car+w55U
	4oVUI67Guc158qOQ74QfR5Z0xYuXA8FmCPQO4C1sUdMh0faSYO5cxstRp8zdyUfsCDI=
X-Gm-Gg: ASbGncvc8HgUzM57cJXwSQPJKbr0cbAaKXzsu3lQ9PKartqfEGvOUvOS65rE3UaMaI+
	ul+JlaOewBVvmsux84ODdKpdY6dyKONoFF+XoZCH7r3cTIkx28wMA64j2HoKaejQOkGiYkxSoIu
	u8DEAolI/XgKBiq7jMaSn4FvtvpMXGzNMwt49z+0dG+yo3emN9+wWE5pwpp41ytOeIE6eug5mQX
	PY54Q0ROwkYlWRnw1Rjd1XuvMpXdcduWReQCiDJh0g1wuDriMGKXhrtCaxkEQuRnEymFxKy/+dk
	QPC+HTbrF4hdtHTk5eTMc0PACX/9KpyLpxudtR9SQ2ZhylCxa2IAWPfTo73ATD9GRIUNhHdMgxY
	4sGW1g6V1VsSxHzdpvcTbKUFq+yiJRxPGDEixB+dOFJvEsKPt7YWmc6I8vWRh3ZhaAxxL6KhTU7
	HXBKBp+GgCpy06
X-Google-Smtp-Source: AGHT+IH+nnLe4nhY/KmC1nxcHmSMY3MeJ1Ohpe9/3X5P0YmlpM51ucnPzgCI+0Whb6pU1/wD56roKQ==
X-Received: by 2002:a17:907:970c:b0:ad8:a935:b905 with SMTP id a640c23a62f3a-ade1a905ae2mr485259166b.22.1749288840892;
        Sat, 07 Jun 2025 02:34:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:34:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/10] ARM: dts: imx6ul: support Engicam MicroGEA GTW board
Date: Sat,  7 Jun 2025 11:33:21 +0200
Message-ID: <20250607093342.2248695-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support Engicam MicroGEA GTW board with:

- 256 Mbytes NAND Flash
- 512 Mbytes DRAM DDR2
- Buttons
- LEDs
- Micro SD card connector
- USB 2.0 high-speed/full-speed
- Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/imx/Makefile            |   1 +
 .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 164 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 32dfd69b8d8b..de4142e8f3ce 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -357,6 +357,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-dhcom-picoitx.dtb \
 	imx6ull-dhcor-maveo-box.dtb \
 	imx6ull-engicam-microgea-bmm.dtb \
+	imx6ull-engicam-microgea-gtw.dtb \
 	imx6ull-engicam-microgea-rmm.dtb \
 	imx6ull-jozacp.dtb \
 	imx6ull-kontron-bl.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
new file mode 100644
index 000000000000..1c82ac08bfb4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2025 Engicam srl
+ */
+
+/dts-v1/;
+
+#include "imx6ull-engicam-microgea.dtsi"
+
+/ {
+	compatible = "engicam,microgea-imx6ull-gtw",
+		     "engicam,microgea-imx6ull", "fsl,imx6ull";
+	model = "Engicam MicroGEA i.MX6ULL GTW Board";
+
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_keys>;
+
+		user-button {
+			label = "User button";
+			gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
+			linux,code = <BTN_MISC>;
+			wakeup-source;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_leds>, <&pinctrl_pwrled>;
+
+		led-0 {
+			gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		led-1 {
+			gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-2 {
+			gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-3 {
+			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	usb_hub: usb-hub {
+		compatible = "smsc,usb3503a";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usb_hub>;
+		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&iomuxc {
+
+	pinctrl_gpio_keys: gpio_keysgrp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__GPIO1_IO13		0x0b0b0
+		>;
+	};
+
+	pinctrl_leds: ledsgrp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TCK__GPIO1_IO14		0x130b0
+			MX6UL_PAD_JTAG_TRST_B__GPIO1_IO15	0x130b0
+			MX6UL_PAD_JTAG_TDO__GPIO1_IO12		0x130b0
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
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
+			MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
+			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x10059
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
+		>;
+	};
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	disable-over-current;
+	status = "okay";
+};
+
+/* MicroSD */
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	vmmc-supply = <&reg_3v3>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+};
+
+&iomuxc_snvs {
+	pinctrl_pwrled: ledsgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER7__GPIO5_IO07	0x130b0
+		>;
+	};
+
+	pinctrl_usb_hub: usb_hubgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x17059
+		>;
+	};
+};
-- 
2.43.0

