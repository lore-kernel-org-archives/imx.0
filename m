Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C643D7D86
	for <imx@lists.linux.dev>; Thu, 21 May 2026 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779383476; cv=none; b=dEJ0OlyWOX0S+fHhZ2Sf96Qr6TyMFb+EL3rIvYZ5rElm/0Emm7Kc84Hj88s9/Iqub1CENTt+58oqHrT9K/AX314XKP4/1D6rXGO0WiS3tEnq4YLF80hfeA3pfjzM1qMkUSWEvZaLbxvdHhqe62Jpt4HFbrmSsFRPIHDSfNuaB38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779383476; c=relaxed/simple;
	bh=l+Z/S9SLFL9uFx4apERbedhUF+sGfqVg2g5o8/0LSig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kNCawRP1jZ0Ynn6z7Hu+kkYjjyt3VCSQHd1YHznO+oKwu+LRySjNiw8UwCYxeKddr/q5r4snlH/t6auR0OgrOGRrl3Jdlc4P5xY4V0q3G4O0/ii9K1i+WNC0DjPf+hpz8yZknMm7adfMrc3iDMAQGT+V+LVqnfq7RJJrmBE38Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/d/cYDz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/d/cYDz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so9796495e9.2
        for <imx@lists.linux.dev>; Thu, 21 May 2026 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779383473; x=1779988273; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uzojvou9PreCyMqlKB0ITJHhjS8Bp2G8JTIzBhB3sKg=;
        b=g/d/cYDzEs6jgBO1MkvAWnMv8wtqSGwRmkQt90i5t/GMDmYnc5I/Ms5kTNMI9Yhob+
         73ihgmC9ZCTtmgoneX+jXDGo0wdqhS4hNrw1r4l7A5NScwOy4hGZh8I3jUmUwE05sewl
         gQfne181oOkZE/SnaXh2i4RnnVikKK15aLg/doUBYEEQAEsWkBj0Bbe4zKtQUjfQK8dG
         /PVjR8gxEkcL8LdUM9UNhjCGG0mYX1/HGqQODndY/fDNgZptNgHgccuPJKdgAI/VXprM
         7jWGSyOfs8LnSokwACSqgUR9wmQWQbeO/txg4L38ZXTEmEQGZIm7UWTXAP9p65XZMx8S
         Ssfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779383473; x=1779988273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uzojvou9PreCyMqlKB0ITJHhjS8Bp2G8JTIzBhB3sKg=;
        b=SOkTw/cG5Cb1CJ2BkxrvdZe2vc6MOKv/XeNHwycuB90DY46hpaQfNN1r1Sz1+uZwTZ
         RWkhIb/Pi/mFT4BSSPwd7mzy5KD7j9gVHzxDMwxrcPMp1T5aQrylP5VsT4bpbwyaNLhj
         PuE1D3W614vdNuPC8N75Z+uSr/awklTFPH3z7u3z8E0kj9pQhteAlddNNCnYJkEEhC1R
         1fAK6nSYK+bSarXzasMyME2PQ20aRGG5I3Wy8ZXXQGJX90NdODIRm84sNwDfP3RI+2yM
         4SQPaS2eyzN0kicEkJfBg8J1o7bMxnO6MJ+8SYzFO9JdlPOxSrDF2ehA2oqN8Z2N31vG
         29yA==
X-Forwarded-Encrypted: i=1; AFNElJ/8crh02JWzN+44Sb9QlUNcpJtoHfecgYTgCSiZmD+Bu5jRXQORg+dMO392M2Lxlu11bEA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw8lUiMVTbRV/VaZdYtEb2s3QTpxAjJ4GpXkS9nLKdIy6jdCHV
	6oUqsRKF9bv8WhcyFq05CaGjyfu1inluk4HVgjtjUhD7MHJg6rH6QAQW
X-Gm-Gg: Acq92OF10qfYXqb8curiMnYKtp8QO/+U8HC9f4iNw1ABqcxd4IecWqX4YzAUaOZCzKj
	8kuk4LpFfGYUk/HvHf6PLLRkrb2Cjox+jwF1G7q0fNfX7NHANjRCk1p88Z4Qggzdwc0MQbvhkrj
	aSt17fi09Rs2FhoEeGXEUvb+oZQ1PMJrLAeUanpB/5QorcANO7m2RXb0dhyABUAWdzHeD/1hV8t
	Pn13T1Kc2bw+RfTcUTeBF6vvR7xmnxEW5lupqu6cbATwmAs/o6hivnOJsV++myp/GXGjrZWS+yR
	iOspB43yypZpC9hZ4/2pe2XmIiMvGDScCSeUJi4nHOluErvj75k/ljm7huzXDZY2FNqL/QCYtOD
	UuW2FJvATppLZORS6oOD3OyJibkTOYEWGQW5AjAPi36NlNw6pfeXASx6Qg3XqHMuV9xhhuP28y1
	UQpgi+zRaypRly53Sk6ateNd/yizAU4dPKJForuHE87KeY+lif6+Xc1qVSEFs9hGR6XZ4zuNxKK
	TLgc9owRJ+37gvZ10YWoQZql9FKNfTeoBWGIW9KFHK0VpEEJQJiH5tLcky5Cn5R/sI0W3Bq3NFH
	TQ==
X-Received: by 2002:a05:600c:4649:b0:48d:35e:84a0 with SMTP id 5b1f17b1804b1-490360b366cmr35136805e9.28.1779383472821;
        Thu, 21 May 2026 10:11:12 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cd815sm6046116f8f.6.2026.05.21.10.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:11:12 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 21 May 2026 19:11:06 +0200
Subject: [PATCH v4 3/3] arm64: dts: freescale: imx95-aquila: Add Clover
 carrier board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-add-aquila-imx95-v4-3-5a7f86c824f5@toradex.com>
References: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
In-Reply-To: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.15.2

From: Antoine Gouby <antoine.gouby@toradex.com>

Add support for the Aquila i.MX95 SoM mated with the Clover carrier
board. Clover is a low-cost carrier board for the Aquila family
featuring a small form factor (Nano-ITX 120mm x 120mm) and built for
volume production.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v4: Removed som_dsi2dp_bridge node since SoC's DSI controller is unsupported
v3: Deleted the cdns,* properties from flexspi1
v2: no changes
v1: https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-3-69c8ee1c5413@toradex.com/
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     | 285 +++++++++++++++++++++
 2 files changed, 286 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c8697b6ae01c5..3ce082c121036 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -523,6 +523,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
new file mode 100644
index 0000000000000..fd93043314466
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/clover
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx95-aquila.dtsi"
+
+/ {
+	model = "Aquila iMX95 on Aquila Clover Board";
+	compatible = "toradex,aquila-imx95-clover",
+		     "toradex,aquila-imx95",
+		     "fsl,imx95";
+
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	dp_1_connector: dp0-connector {
+		compatible = "dp-connector";
+		dp-pwr-supply = <&reg_dp_3p3v>;
+		type = "full-size";
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
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "DP_3V3";
+		startup-delay-us = <10000>;
+	};
+};
+
+/* Aquila ADC_[1-4] */
+&adc1 {
+	status = "okay";
+};
+
+/* Aquila CTRL_WAKE1_MICO# */
+&aquila_key_wake {
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
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_1>,
+		    <&pinctrl_gpio_2>,
+		    <&pinctrl_gpio_3>,
+		    <&pinctrl_gpio_4>;
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
+/* Aquila I2C_6 */
+&lpi2c5 {
+	status = "okay";
+};
+
+/* Aquila SPI_1 */
+&lpspi6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi6 &pinctrl_gpio_5>;
+	cs-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>, <&gpio4 18 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+
+	tpm@1 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_6>;
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
+/* Aquila UART_1 */
+&lpuart3 {
+	status = "okay";
+};
+
+/* Aquila UART_2 */
+&lpuart7 {
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
+/* Aquila PWM_3_DSI and PWM_4_DP */
+&tpm5 {
+	status = "okay";
+};
+
+/* Aquila PWM_2 */
+&tpm6 {
+	status = "okay";
+};
+
+/* Aquila USB_2, optional Bluetooth USB */
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

-- 
2.43.0

