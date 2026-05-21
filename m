Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE4B36C0DC
	for <imx@lists.linux.dev>; Thu, 21 May 2026 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354238; cv=none; b=PLnIBG/n8HpDe4w3i5bATOtqFobNi9sKcPNSDmlpomdQCh6T0jtju2VGFaE7CytNesWXTUaxnlz30Qs5bf2obyqr93uMoVIDVvK3XGJ/WV7SW1IUxv1lnGw3Hy7mZbMDMYSMMAP/BvZBxjr4KQcDB9jJng6bcu9YpxUecCekXaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354238; c=relaxed/simple;
	bh=xlgIbakHpJWlfb88GgrtOWV5MkVbOQWhi8kTZqbHiBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gq+Bp+pbhAYKsn5e3DTsCe6xwKgaWgzAGBBFLZupj4o97BzQ4rWhJK49xiclwE69jjK9qnWPY0gctc4+OoyeBsR6R8UnJfi3YRxv3sJxxcgqWhKf4P7fupI1ad98vDSzm+N6EhBkdr9E5L1H0OAOhvO3b4fJV8orYKkTRWqL+7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTUyxwy6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTUyxwy6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44e1860558fso3737053f8f.0
        for <imx@lists.linux.dev>; Thu, 21 May 2026 02:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779354233; x=1779959033; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Y36SgBQ9cIMBn0I5RWu40X8SISnSEeAXBBuc0ToW2E=;
        b=PTUyxwy6ckweVkRaYKCEoCFnXemrFpDoeFC5RjgvoWd0rUek91hsqUasAnzKEhtIio
         mpGLQSF8oXEBRNwOdc6Zb6n6h+TkLAZbWsIX4p93Wo4Xa0eI7FtPZSdsjoY/FMDtTgFi
         pTc3dF++mpNkf+F07NPom1SyRgcLyj9lBQ3f3L4b1ufLkf4Eb7CnBQLOX+qcUhZyr1u5
         QhMawrsSRmGsd37ZAbWeCkAmcCiwerm+LFSOSyTlQ3i/QbUlXpaaEoRIn0RONZiUJFUY
         mQHBQugh+GVctL5bxlVYgF6pPImUcG4qy2dMW4WoyHjNMIdLnEB3tcxeHDNDgjhc3ZgS
         86Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354233; x=1779959033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Y36SgBQ9cIMBn0I5RWu40X8SISnSEeAXBBuc0ToW2E=;
        b=lBGD+xkVp0TFQRJdcjEiJ5wrLBHaQhpP70iIBc9R26DBw946vVptJ1U3YUjfg1Mq5G
         Q2BGdjP9SHIwTyXIWvu+e7EmywMDT1dPlesf6uXy1XID4+jW9TS7H9IwTq+NtIBJzZUO
         T1+UAG715wIVb7TbEvjy/Q1HVDndZWW2zeB/1KKXc11BN/PjZTKNolFmvv+SdcSkuwwk
         7+3/kHi12zYDDQdaylJ5ANuHvQ5xxEzREiR4qRXLFe+/mU8NN0PlgmFjnJI8aGL47L0F
         gq6mj3WJDd4mk45jYll5C2p0gUgTdkgItr3J2j13Llzq58DYuildgYMchkwX3A9hL+Ks
         IUAw==
X-Forwarded-Encrypted: i=1; AFNElJ+U4eio5DTzuejlWtQBICaWo9YeezeogcmdQWxn3dt3lWcC43dydetXgu1u3ZPh/UIZRVU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8SuAkZ0k2E/79YQwYdUWlM20y9jak5R+A18l1v2qgJdTzgKwF
	gJfE3qsCSCbTtttMfLecCaBPkcTV3NV4Y9oQiQlaFW06VLho1zU1/zFH+dGcQ639
X-Gm-Gg: Acq92OEK+ie58f/se/OWigb1QwlwV/ASfoj/Czw47fDCbxRveAt2hqPBHesmnWaE2N5
	DG8TGwzbjdZ5Wz90CeXMJKXN7QyaSbWcSJjGM4YaHX07cg2CcL5bNzINdvJNgjvyfpq1q2dv9Yi
	sla6Xxs/gP+vvyCXEODfrPc9dXt1QcCrVhyP9fZXST3GX0t3MIiT6/XPGg7wPujAVPBJdbzueb3
	7LsqEY0cyTNFXAi4EQlCwlS+ShvqANtGI5peTII/BY+U4Wtc4Q38tQlkWOvzyzpeLrlX5Lw93FJ
	qJ7Tniso7Gw0GsVqaZeOH+k0VqmwRuaktaMQTO9syA3fciOF1x4HtrvqNxPp0neCbHJqIKr2Jk2
	3FIQNqwdKRwyk0AE5i519c1Un1fWc/RL+haCE1RschNYlX9CfK+Y2eHhatY//rB0ZcyFYQJHLA5
	Unh1dovofJllCNrrpEV+hup7JtFdkahHSEMCQaMEqD/NQltZXZ289uHkPt6ayY5rAjkAPI5a+ND
	RyLkIhGKUhgTaMkVYNsuMhqokgHRmetDRLNqAVnKaCgxYcDJXMJZ+LhTozaVEXGQ+XPddjl1nBs
	rg==
X-Received: by 2002:a05:600c:4d98:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-4903607ced6mr16564025e9.19.1779354232294;
        Thu, 21 May 2026 02:03:52 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c72c78sm16151525e9.3.2026.05.21.02.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:03:51 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 21 May 2026 11:03:47 +0200
Subject: [PATCH v3 3/3] arm64: dts: freescale: imx95-aquila: Add Clover
 carrier board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-add-aquila-imx95-v3-3-621843807def@toradex.com>
References: <20260521-add-aquila-imx95-v3-0-621843807def@toradex.com>
In-Reply-To: <20260521-add-aquila-imx95-v3-0-621843807def@toradex.com>
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
v3: Deleted the cdns,* properties from flexspi1
v2: no changes
v1: https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-3-69c8ee1c5413@toradex.com/
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     | 289 +++++++++++++++++++++
 2 files changed, 290 insertions(+)

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
index 0000000000000..751232e6fa8dd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -0,0 +1,289 @@
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

