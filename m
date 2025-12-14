Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEFC315D2E
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 21:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765749186; cv=none; b=r8h7b6ZwHs8MqFZyL90l8BrTtmC6Y+HEQXpq7oq8N7WZtofszTiR0IiDB3otOtYxPQGknzx0h9nHyFpAcKJedIX9jcxXQN5n2C9DJ0OBJr/vYGp5NguF4Ohf0VjZ5S3dWRdRuyHkeCRxKgJ/ZL24Fmb59MXFwXq++VCuEiIonFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765749186; c=relaxed/simple;
	bh=uYZSnZuRrwJRAmm9rMjS2CEsXeIqm8YEwy7l+zm6we8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZfBsMsDQghS2Cli4Bf6DoUMK/gKibZmFs2EuVR4LkMpc7K0F97QuvayjBxcg8lAlNgfrZV/H1v6Z21P8sTxMkxfkX0ZnZfFiaExW9M0vx4PGJCMegm1Ic3G2bKQamqdNp8d7vFP2nvmQbLgrHITH9uLQ8WONVJBh3oOVWT/Uo6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZi752J+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZi752J+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so32585285e9.2
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 13:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765749183; x=1766353983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=;
        b=gZi752J+4LcWGUPjW9QuJ8POePDluDZBlWx2rz7icGJw/G805ThH6VEbeUTqEIcnuD
         AXrbmlUJof/x3KXG8rj0nwTeXJoJsupV0w1pvFl4RhVNvXqZDrcsAnzo1M+amcNl1ipx
         qvwBz2BZQrLgizN1Mnptfa4TShB9b9lhEbiE5A01F+FpxeXr99DePpiYXhVayaSx87Nq
         UJKHxb9hkHFdrxNq2TOnvGliiaYbiAGQ82Dpx4FBxv+2U+BiijSkZu1nSduHj1ZtIA5o
         k4MSFJrIChwQiUC8I57l+H++dGYCTFXDtoIVhR/dlKs4LVmfzKONBRnacVNsbS/saT+A
         Z/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749183; x=1766353983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=;
        b=H1lAQVsIlFk92vJsjlfKCERpEkjHwdm44Lufx2wz5f7B4vch5d7okXQMNYE3T0NSlP
         TW65A98asOfBc9SXzer9kuMM5E4qpmSqcyCJjtwEvBE2OFwcjk9OA+hbgefskgHPkTeV
         C3tp/zNGeAdCjlcW2Wl2el5/WGhG+cxUSHFhoLbM7KcvwG5lIf8DLfScb46w/2QvUOUp
         4DHJgncCKttZi2/0WGwPFo+rKoDcjE5M0fqB7Hdqi4mK6Y88YUk2JJtBrwhcxz9D+koV
         V3UrZTZ6+8YkAcWJoORv7B2XvzNDn80ZKLtyIo1i5OEQOP7nxEx4JCGY5apbfeSV4rK6
         Xq5w==
X-Forwarded-Encrypted: i=1; AJvYcCVGILgY+RUeeHpPo9Kus2Pd0bzqT+Zw+JuZ+58GnQjNZKp/ZyBoDTJ2SkEUcjOgaC4QSR0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSWg7xmchEUkA6cmYNlv9Leav5uG30UavRmmcdkLlLAccsyZMg
	vjWZQDnD0VbiO4/bmI+uJeMONuZGe/zMf+II919bfdr0cclQ9x43PLSc
X-Gm-Gg: AY/fxX7acWpon9GJugwPZ0DwX5raWSL62AI0JDB7V6FQK5fKytqL2PftU11lYk/Pcdt
	E2POSjbseOfjjw6pDwtH6C9UTwp5S9aq4Xo6dhosCP5dkzkCXytny3aDVA5gy0jELc6H3csK6kC
	TqXRBKSsoALXC3i/0aK33lcx/Mo/MLCWvRCmrzu6UnwHUew1Og2Z1Et1BmFVhH/xeSd0XgUlmp6
	QVGYaKTOLSGKkucP3OcVpHhkOdoqu75oSTiSUpdDYhPyb8SPjxAU+i8omNN69H/aJcQoZxFlB6+
	aEH4woSvO9Obn44J1ZhgxU+CjFttpmoWgi0vSwtozKDbkE9Av69i8NmMvmZIwd7ATb8YegGPcL7
	1ppGzYMo7whFHjL9ZfZiDqRkHYNigUBlYnhYgvyaTIpSHeIqXj+FFlSSuijDsLX3fDlquAQwcQ3
	yBwP5K2n7Y/vt9iQgv2Sqd438mS7NGGMPZh3njL8ovv6lQ5IwBtX0Xtu7AIFTRkuJxkLcyF9vgT
	LASo030hojBEF7Y2baQT32NUw==
X-Google-Smtp-Source: AGHT+IHlwvUwhglREyCe2v0pBDkwpLJw4hn2MzBwpG419jFwAHwhdlcI6pbWRQtcoEeM5mlvwGC+Zw==
X-Received: by 2002:a05:6000:1a8d:b0:430:f742:fbb8 with SMTP id ffacd0b85a97d-430f742fd90mr2518662f8f.21.1765749182731;
        Sun, 14 Dec 2025 13:53:02 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6a42c8csm7625568f8f.16.2025.12.14.13.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:53:02 -0800 (PST)
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
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/6] arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony carrier
Date: Sun, 14 Dec 2025 22:52:49 +0100
Message-ID: <20251214215256.5812-3-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214215256.5812-1-stefano.r@variscite.com>
References: <20251214215256.5812-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VAR-SOM-MX8MP module does not include the PCA9534 GPIO expander nor
the LED connected to it. These components are present only on the
Symphony carrier board and may vary across custom carrier designs.

Move the PCA9534 GPIO expander node and the associated LED definition
from the SOM device tree to the Symphony carrier DTS, ensuring the SOM
dtsi describes only hardware present on the module.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 50 +++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 50 -------------------
 2 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index ea3c193bb684..361e6122bdc3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -9,6 +9,16 @@ / {
 	model = "Variscite VAR-SOM-MX8M-PLUS on Symphony-Board";
 	compatible = "variscite,var-som-mx8mp-symphony", "variscite,var-som-mx8mp", "fsl,imx8mp";
 
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_POWER;
+			gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -31,6 +41,33 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	/* GPIO expander */
+	pca9534: gpio@20 {
+		compatible = "nxp,pca9534";
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pca9534>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-source;
+
+		usb3-sata-sel-hog {
+			gpio-hog;
+			gpios = <4 0>;
+			output-low;
+			line-name = "usb3_sata_sel";
+		};
+	};
+};
+
 /* SD-card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -45,6 +82,19 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                                 0x400001c2
+		>;
+	};
+
+	pinctrl_pca9534: pca9534grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 949d9878f395..158a78ec9656 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -19,16 +19,6 @@ chosen {
 		stdout-path = &uart2;
 	};
 
-	gpio-leds {
-	        compatible = "gpio-leds";
-
-	        led-0 {
-	                function = LED_FUNCTION_POWER;
-	                gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
-	                linux,default-trigger = "heartbeat";
-	        };
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0xc0000000>,
@@ -216,33 +206,6 @@ ldo5: LDO5 {
 	};
 };
 
-&i2c3 {
-        clock-frequency = <400000>;
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_i2c3>;
-        status = "okay";
-
-	/* GPIO expander */
-	pca9534: gpio@20 {
-	        compatible = "nxp,pca9534";
-	        reg = <0x20>;
-	        pinctrl-names = "default";
-	        pinctrl-0 = <&pinctrl_pca9534>;
-	        gpio-controller;
-	        #gpio-cells = <2>;
-	        interrupt-parent = <&gpio1>;
-	        interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
-	        wakeup-source;
-
-	        usb3-sata-sel-hog {
-	                gpio-hog;
-	                gpios = <4 0>;
-	                output-low;
-	                line-name = "usb3_sata_sel";
-	        };
-	};
-};
-
 /* Console */
 &uart2 {
         pinctrl-names = "default";
@@ -298,19 +261,6 @@ MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
 		>;
 	};
 
-	pinctrl_i2c3: i2c3grp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-	                MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                                 0x400001c2
-	        >;
-	};
-
-	pinctrl_pca9534: pca9534grp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-	        >;
-	};
-
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
-- 
2.47.3

