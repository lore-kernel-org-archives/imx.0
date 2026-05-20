Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581DC3DD50D
	for <imx@lists.linux.dev>; Wed, 20 May 2026 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276652; cv=none; b=s5lxjjhLpiwtc4Pelb8LKpT65OZ/XldXXyKUXPA5ZzPUguhXi0aMo64pwNmBu3AD1S6CDo++jjHe6edTL8Pzy7mVaOb8HVvfX0L9we0Uz/vNMsMnDadugH0fEALM5zj4uwJKNGQkeH5nj7OK/hVuKkCy1uPOsQnZY8hLGekTQY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276652; c=relaxed/simple;
	bh=2e8b0M4uNeWedv6NB/3GyL8xLLu1YJtlv19qlyMXonw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWZpA03A734f6GzBhZEylPm3g5Rwt2P1nxNA+4tZX+rwKdjmYzzKU+MVIRHMyupKnMdFMIkoKZDIzAwrEBTEFW64Kko9DqGnXqlNVFJSrfuVd3n+KVhn5KH6nDmAi12pFPxvv2T/v7vaIVTvi+vVKisVXbm9ZbQpSa57tV8fyGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1vm5rCW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1vm5rCW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48909558b3aso50272205e9.0
        for <imx@lists.linux.dev>; Wed, 20 May 2026 04:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779276649; x=1779881449; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75AeIr75fobPYjOr1b7dv2ioRyiyydGt2gFhT2IfAuY=;
        b=i1vm5rCWMQu+Fzy9IGmDN4hg3KQSXs8AjvcOI5X6c2jhaHlv11UT9cEbcWiWuB+ZLT
         odzLBYlOsD1av5I6/sc+9fvtEW4xSuO0ZQTqd22rX71L62dDiPQGVJvFOaWHQPxbuPl2
         uftvDqLL3sqbPOx92VtnnosmXCyc0aMU1vP/YObGBzm9x7ZgFKTCj0VHTEWDI3FpaiGu
         5wx1onBWXYY2SL/Qtj5f1qbkLLcIqtNAJvIXuh7CSxW4fsM4VpRjWFm9RPd6MypXznJm
         ATJGs79br2GByg3iuOLkobmMiOO7j4D81Z+0uhipX6Sh7ho1BuBBvDFrr5tf+Dvu/vlY
         5tKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779276649; x=1779881449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=75AeIr75fobPYjOr1b7dv2ioRyiyydGt2gFhT2IfAuY=;
        b=mjN/rWUdWXOASoAZbj6zTFBhssx2zv4lKZUU9bCwBiEFeVBJP1rrxve0esQ9h8TbVj
         mbfMvjIQq2newTOqt0ZqBN0Wtb1ySEnaaaA0kFch7Ln+8jH6O0ASg8iZDYb7WhnDw6k9
         SnMVplsMdxZR3C8lUvgTLaKpsqCsZjE0sdCNJ8K70sJRLbLNnxmEWjr0RFXepPZOgSMd
         QwQJjoSk8PCCXI+chp2N3bMwyEq588I5z6xNsPa9zhpZuJAGHel2v+wDZyUl6muWcogP
         4HNseos6cQ82JZlxHQ5K0XhfJ+ZyUGXNYVW0UmO9dWAly8fg8+HN8hqv2ZR0NY//PmKM
         fsXg==
X-Forwarded-Encrypted: i=1; AFNElJ/pTLYn9ZYVsHzA7myIn7WurpW5a9HOhi64v76tZCCVGpC9GijYmsCr/PzyjqDgASPzRpg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNoGUrjJN3IT/CN+YaD+1wyCi20LaSLaAqAeO878kd8tDt+qnj
	cJCqqp99bkdteUj2ndJRb7/R6LofKHdPOhPk7y4sMKYrnGJF05aBGv/T
X-Gm-Gg: Acq92OGjf7bpMk4sgs7RKeJp0DAgpjj5lGySMIuDatZtdYst4q9MXG9BXyPiSnXB+cz
	gADuJ8D9bxR4DfshZNznb3gmVM4qNYBy7YYbr5prLRP8LhnChliwI6h5tqhRdiKHgVcOC54Jy8j
	C5vP98VgJmtpSZ/nONTpp3qtqctoQqHDfcfqMmnYf4soPb8vLC2Wc8xb/XUuIU0PLGsouw1sv5k
	gw3fBONBWPIgZg4hyRr6bofks0o45NruYNJ2plmlw8s51q7/b9DkWRWW1yiqqKYKTahLNLSJwiV
	AmMBRatvPgrirdHqWsXA12LVlmsAfPAcwywnGGq4tTlRqHSDQxpRoGjKWySYjuKdgLV7SzTBdP4
	QVaHqQDvZY8QjEstwnreVi+nUk6kA4GKzoHLzW3co3AuHlBesIpySz4RtKr1WmxploZRDnCw3kv
	wGXlOzr7UthPWGKu9Kat9n4RGsPu06YTiBJDk6T28BkUwFp4rKnnfFd6f+jJ1Y1xRQj+GNudUNv
	rFBdF3pLlt0XGMqkrDsVkV3r+Ss3dj9oyZVY8zPcXJ5jgeP8EnW6r8sQ+FlAn/WfgAVhwXYkhML
	nglRrPolFuTn
X-Received: by 2002:a05:600c:4fc9:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-48fe60e58ecmr337661595e9.10.1779276648507;
        Wed, 20 May 2026 04:30:48 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab3977sm430363315e9.9.2026.05.20.04.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:30:48 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 20 May 2026 13:30:34 +0200
Subject: [PATCH v2 3/3] arm64: dts: freescale: imx95-aquila: Add Clover
 carrier board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-add-aquila-imx95-v2-3-06424a51e33a@toradex.com>
References: <20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com>
In-Reply-To: <20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com>
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
v2: no changes
v1: https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-3-69c8ee1c5413@toradex.com/
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     | 294 +++++++++++++++++++++
 2 files changed, 295 insertions(+)

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
index 0000000000000..021d437763412
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -0,0 +1,294 @@
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
+		cdns,read-delay = <0>;
+		cdns,tchsh-ns = <3>;
+		cdns,tsd2d-ns = <10>;
+		cdns,tshsl-ns = <30>;
+		cdns,tslch-ns = <8>;
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
+&som_dsi2dp_bridge {
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

