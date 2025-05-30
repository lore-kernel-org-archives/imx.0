Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D4B2367D5
	for <imx@lists.linux.dev>; Fri, 30 May 2025 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621283; cv=none; b=uMEYk8IxGev0pNWTqTXoJO6J8YBTCW3O6pxMnZs5+2XLNW2mY6zn9yYxXu0maJpv1lOEfZXuKrEenPNig2aASqex6HZ/4lqo48N0XLyvMwD16IwJ1ytYGOYySQnizKevXIv1/HxRbkJVPyccYYJtRkUe5x0bwgqCKXo5R/7BryM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621283; c=relaxed/simple;
	bh=HWMxUggGR5pcU4OlcxF9I0pKvla2nbUqa9tKlffBeOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OpnPwYWtqnZ2DVgDAZnTggs7ruNt5Z3tkXcOQyhEQEgs0QomyMufQkAgepIUuA0RYdOxYfF1yAP+eX3GWePjWS/nlAFSog5/mIENiPBI33AWQmmNssnuLC2m97fc1XVlHWkBzBnDdm+tDunW4qR+/aHvkAHP9YSWzUe4BhFTG/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=EmICfBcn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="EmICfBcn"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4c6c0a9c7so1462745f8f.3
        for <imx@lists.linux.dev>; Fri, 30 May 2025 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621280; x=1749226080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l894PeLhCnHWtvaFDMX04QLLQsDnpUfxOwJIfvuYEXM=;
        b=EmICfBcnwBG/jTSS9xpwlnAmxwCHRQOEAP81mDuZ9t7xRYTHab+ndiF6gku6JsQJPE
         lLWcyAZyRmrLgXgig3U5HOp0JtEin5ez0V+A2jTtrYf1gO37UQnN/QSuRsF1kaqNAJjZ
         iK24S91dzsPtd8c4DMz1zJcQmZqFxL9G8Al0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621280; x=1749226080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l894PeLhCnHWtvaFDMX04QLLQsDnpUfxOwJIfvuYEXM=;
        b=qVtrfSPKByt2AZX5aU6adojld68k59lkeI8K6Mz/QjV4edGlYk5BzuTOecghjZk9OY
         h1rIXPp+g5NS90aQi7BXAGyLElmGpZISt1JDI4IXH+OfWtZ1xuXNzvqw+n5CRQzjMbVm
         s1t+I73Ft1Gg15AqxM+skGqcK+CZU/5i2V25rQ4NU2Rsjv4yN0qvEsYnuP7m972PsjiD
         27clf/e8pU8Xu9jQQduVTmAAt8VfSqHhhzcxP6HK/T2n4No4DfDF0iOIxXGyWTkM+yA1
         lj51SPi+SyBEj4ykDxK+82HCDlHL35yue/p4Kbw6tbyt8PaVNqOSM4sizZcJ6ECoLVco
         GCHA==
X-Forwarded-Encrypted: i=1; AJvYcCXinpD384DmZYgq7GPASRGHRpT7kkRCcaXj0WjRLhzKH9B8/UEmgL6Ktyz6vwwUvl0sUec=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA8MyIWAP9NnXv6zAMJy+Zi+ezMvlIaZ96dWNyiZrUhvtUSpzQ
	wDix53oyn2/PY2sfQGtg2xw2EiYDGNRDqy7bB+hpimY5EPf2VrgDiIbgPIOtwZuWxLg=
X-Gm-Gg: ASbGncsHXK47X6pYrnd9POFwgtrdGXfJ0lPHndYvdCk8ljzNKvFQZphVtq6ukUJgVaN
	9BxuuQNA97K4tKJnmtzpLgVnjF+/OwJHeUHX8KZ5xiuN8TJKfh0kwevKxU1+O4GwBF7EYWHvkVi
	5zUPmOTZFxRl8v/Gd+8kb1HT1nx6fLMra+fhZk11fEyDEOtphk6hE1G1Oi7MqHCKWe4QYtO36Ak
	R9Cu0N6U8yL6P3woA93nzDBJHI7nJZiTtEX/eYrZaDiTrqW17zG4BaSpiFKT59HUbhpLvOUWV7a
	i29/acVt/yp28HtFKnnXt4s9l0UsEZLTBcTyZ1PpjPkh3zn05GlYVg9eL061tMV9v/dICbO/lgd
	/JXHrIprSw6RF6SHyT6k5EKMfiYBIJ8gJqUB0Kw1CKlWnRCW+W84=
X-Google-Smtp-Source: AGHT+IFe1157slM2L/0F4loUxgaapU7fSOOZIUoCHVf3faHDhRUbgD7OUdhTGj/jG9uiNTzghP2gcA==
X-Received: by 2002:a05:6000:178e:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a4f89dee77mr2690497f8f.36.1748621279661;
        Fri, 30 May 2025 09:07:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:07:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v5 4/6] ARM: dts: mxs: support i.MX28 Amarula rmm board
Date: Fri, 30 May 2025 18:07:35 +0200
Message-ID: <20250530160748.2476088-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board includes the following resources:
 - 256 Mbytes NAND Flash
 - 128 Mbytes DRAM DDR2
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- Drop #address-cells from gpmi node

Changes in v4:
- Drop label property (deprecated) under the leds sub-nodes.
- Add microSD comment above the ssp0 node.

Changes in v3:
- Drop xceiver-supply property from can0 node.
- Rearrange the order of specific nodes and properties
  alphabetically.

Changes in v2:
- Replace '-' with '@' for the pinctrl sub-nodes.
- Replace edt,edt-ft5x06 with edt,edt-ft5306.
- Drop LCD reset hog pin.
- Add correct #address-cells and #size-cells to gpmi node.
- Replace edt-ft5x06@38 with touchscreen@38.

 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 300 ++++++++++++++++++
 2 files changed, 301 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

diff --git a/arch/arm/boot/dts/nxp/mxs/Makefile b/arch/arm/boot/dts/nxp/mxs/Makefile
index 96dd31ea19ba..d72ba702b6fa 100644
--- a/arch/arm/boot/dts/nxp/mxs/Makefile
+++ b/arch/arm/boot/dts/nxp/mxs/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_MXS) += \
 	imx23-sansa.dtb \
 	imx23-stmp378x_devb.dtb \
 	imx23-xfi3.dtb \
+	imx28-amarula-rmm.dtb \
 	imx28-apf28.dtb \
 	imx28-apf28dev.dtb \
 	imx28-apx4devkit.dtb \
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
new file mode 100644
index 000000000000..af59211842fb
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+/dts-v1/;
+
+#include "imx28.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "amarula,imx28-rmm", "fsl,imx28";
+	model = "Amarula i.MX28 rmm";
+
+	memory@40000000 {
+		reg = <0x40000000 0x08000000>;
+		device_type = "memory";
+	};
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 4 5000000 0>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <255>;
+		power-supply = <&reg_5v>;
+	};
+
+	beeper {
+		compatible = "pwm-beeper";
+		pwms = <&pwm 7 100000 0>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&leds_pins>;
+
+		led-0 {
+			gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-1 {
+			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-2 {
+			gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
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
+		regulator-always-on;
+	};
+
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_fec_3v3: regulator-fec-3v3 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&fec_3v3_enable_pin>;
+		regulator-name = "fec-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <300000>;
+		vin-supply = <&reg_5v>;
+	};
+
+	reg_usb0_vbus: regulator-usb0-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb0_vbus_enable_pin>;
+		regulator-name = "usb0_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb1_vbus_enable_pin>;
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&auart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&auart0_2pins_a>;
+	status = "okay";
+};
+
+&auart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&auart1_pins_a>;
+	status = "okay";
+};
+
+&can0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can0_pins_a>;
+	status = "okay";
+};
+
+&duart {
+	pinctrl-names = "default";
+	pinctrl-0 = <&duart_pins_b>;
+	status = "okay";
+};
+
+&duart_pins_b {
+	fsl,voltage = <MXS_VOLTAGE_LOW>;
+};
+
+&gpmi {
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg>;
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins_a>;
+	status = "okay";
+
+	touchscreen: touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&edt_ft5x06_pins &edt_ft5x06_wake_pin>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <19 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
+		wake-gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&lradc {
+	status = "okay";
+};
+
+&mac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mac0_pins_a>;
+	phy-mode = "rmii";
+	phy-supply = <&reg_fec_3v3>;
+	phy-handle = <&ethphy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			max-speed = <100>;
+			reset-gpios = <&gpio3 28 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <4000>;
+			reset-deassert-us = <4000>;
+		};
+	};
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hog_pins_a>;
+
+	edt_ft5x06_pins: edt-ft5x06@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_GPMI_RDY1__GPIO_0_21 /* Reset */
+			MX28_PAD_GPMI_CE3N__GPIO_0_19 /* Interrupt */
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_ENABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	edt_ft5x06_wake_pin: edt-ft5x06-wake@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_GPMI_CE2N__GPIO_0_18>;
+		fsl,drive-strength = <MXS_DRIVE_16mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	fec_3v3_enable_pin: fec-3v3-enable@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SPDIF__GPIO_3_27>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	hog_pins_a: hog@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power */
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	leds_pins: leds@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_SSP0_DATA7__GPIO_2_7
+			MX28_PAD_PWM0__GPIO_3_16
+			MX28_PAD_PWM1__GPIO_3_17
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	usb0_vbus_enable_pin: usb0-vbus-enable@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	usb1_vbus_enable_pin: usb1-vbus-enable@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA6__GPIO_2_6>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+};
+
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm4_pins_a &pwm7_pins_a>;
+	status = "okay";
+};
+
+/* microSD */
+&ssp0 {
+	compatible = "fsl,imx28-mmc";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_4bit_pins_a &mmc0_sck_cfg>;
+	broken-cd;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&usb0 {
+	dr_mode = "host";
+	vbus-supply = <&reg_usb0_vbus>;
+	status = "okay";
+};
+
+&usb1 {
+	dr_mode = "host";
+	vbus-supply = <&reg_usb1_vbus>;
+	status = "okay";
+};
+
+&usbphy0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
-- 
2.43.0

