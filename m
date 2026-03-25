Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AD53F9F4E
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 14:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449999; cv=none; b=KsdlN4kDW2QHMQ+QeLytFovdYgFMDctOY6GZ69MSVog5dKEaO4/XJRpkzBXLGJsSeO39zms8+2TIXnKUNmoefl1+ZfiWp9ISJ4yBA+uYm2J+M/tTWvtHYPcGY0Cjs+978Ip+buTdhrxqV7pH41KxXQv+rg+JVWEWn7xYtCYCAfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449999; c=relaxed/simple;
	bh=0M8bC8s4CQRoL47kiXxXJsMthW3oUTt23PyDFJOgaNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qB4aDGwybxBwrDxPYN/746kjiw6PO8tp66aV4XoE0MYOfftQR32688SX7D5zH11cs9IBptFFb5pCt4lEf39NGajpSL+RktS03E2ihyC4K6VpeLR7zCMIT5LKxG/Pqmdwo6BHL6lmfYFSChvB+1gm0eQkLg7ZajGdeXeCBtK9McM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEpOlzgV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEpOlzgV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b48ac2727so1809664f8f.3
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 07:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449994; x=1775054794; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K56QdSgJZYNMBcYP6tlC/3xyKloobCMQ/93giVqKRL4=;
        b=cEpOlzgV0fwqhWaV5PhMtaNSkMOMhlRQZwj6Eu2fNUe9QFwC7UWpU7YEGUFXCHmKkX
         I4HpcfCOd8gop+2IDC0Soz6cpXpmV6q/mQHJpNlqZkaA55YaVvMF61l4Hg4UjkFRAM/0
         b5Rqy70GQKKobfMaVxyvqpYUr3kBr8++x0LJry9IvEI0TPrLw3O5ARWEAZ1NGu8Alf6c
         zhISkKPynApjKIaHhEJdGnbpAyU+c+IIshHJymTnRhReE5FO6HIEdPu0aj4QlWmSPmTL
         /lhS6jsot9BN1Se1ISAhxt2j3Iwc/qnwem5iNd5a3+KgkMYNPm3QcJN2ABzICe28xynB
         srUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449994; x=1775054794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K56QdSgJZYNMBcYP6tlC/3xyKloobCMQ/93giVqKRL4=;
        b=dmJRWHWoOHK0l8mANgzPj7sndd9I6CxrXRn43Cprl4zX6MeVlPsxAzYLdyK7ODLCsf
         KkA7tslEpXCsVX0HhkpwtWs7bXSaeEmLOZouOEGZBEAEx1kf7gTE+2suFx+22ejfmlTz
         +sIKyN1Yqfp0Od/feOq6fPllq3GrQLU/dvZcN1bO8VvZrRrckiQq3QPmAGZCtIVqRjS8
         upSzgeleaCvqacemlSJHx/oAh5ttQGnMdRawp3b/XFynm4KILkUxuzWXez42nlWsF1qL
         plBoCrQv2mnzGSJib3U2chyk+nurIKmzkoHrw8PT1tMdwirqrM6H+ytSGGrDsocrBees
         KfWA==
X-Forwarded-Encrypted: i=1; AJvYcCVeXBZqPBS08Wr83pLUgLgRb0OH/2x6F9lQY7ODV47YuJjehFFxudwe70iPGqmcxtDAZkY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxB/issap6J/OAHdq3Wayb+d3XJqctEm9hBFKKye7otrwMFktsj
	9JXI0AACJrJ8DSLILiTlVuDMTdIPhcsZOv8PToacL5yueOcGaUXTZbWnTwGaOtQb
X-Gm-Gg: ATEYQzwUDJKoywG7xV9HwqAYk4+8DdlHcG0Gnz+ipJd22D8vI1XyzjmT/MmMdZwLGX/
	z0GOuqMLPwkyU3tnhogD3sIVBH2WJXaXNxohQIQBMfIkrpaUwbeqHxsLELvi5KNkGU98pefSm17
	LHc8M2qJhHA9GmzUUFeVXeuN/sNOXZwnzGrYonAKGkxfal8Y1YxRdQe+WiZN4KOsMcM7ZTh2oxm
	cY2WvsytWcC7cO6EsQoF9yDeE/eMFELYFaa9oe38OeDhI5zSDmldGwnzICJ30Y6h6CyDN5W36fA
	7WVWBaFMDOqcQ+pEINiu6sHgg0MPcUmT4zhnb7J2T8Laasg+scSUA7iS/l9MfBfYQiHp1f6WmK9
	vLMoFCnNujnQnbSvNDLLVKdkV2YRdLXa0uIwCJwk3DQzUou5EciKq2tjtU1JXtehpcqGURZm8A4
	DBf8PtuEPVa9tckGzMeonXjEfCxyzBwMatXNnryNrAC0KG9pAwMfuw8dnfFIsB52dDpYClc3ahY
	+g1Tp0ti3V3HREpvH468xeP+dZnxc7OUNnIqg==
X-Received: by 2002:a5d:5270:0:b0:43b:88e9:588 with SMTP id ffacd0b85a97d-43b88e9083amr4001503f8f.37.1774449994187;
        Wed, 25 Mar 2026 07:46:34 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm304592f8f.8.2026.03.25.07.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:46:33 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 25 Mar 2026 15:46:04 +0100
Subject: [PATCH v3 3/6] arm64: dts: freescale: imx95-verdin: Add Dahlia
 carrier board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-verdin-imx95-upstream-frank-li-base-v3-3-b2b5221a8077@toradex.com>
References: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
In-Reply-To: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add support for the Verdin i.MX95 mated with the Verdin Dahlia carrier
board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: Rebased
v2: Reordered nodes alphanumerically by node name
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-3-823fad02def9@toradex.com/
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../boot/dts/freescale/imx95-verdin-dahlia.dtsi    | 270 +++++++++++++++++++++
 .../dts/freescale/imx95-verdin-nonwifi-dahlia.dts  |  21 ++
 .../dts/freescale/imx95-verdin-wifi-dahlia.dts     |  21 ++
 4 files changed, 314 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c46059cd2331..bcf54b4ed66c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -497,7 +497,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-dahlia.dtsi
new file mode 100644
index 000000000000..889b71aa3de0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-dahlia.dtsi
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin iMX95 SoM on Dahlia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	reg_1v8_sw: regulator-1v8-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "On-carrier +V1.8_SW";
+	};
+
+	reg_pcie: regulator-pcie {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "PCIE_1_PWR_EN";
+	};
+
+	reg_usb_hub: regulator-usb-hub {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "HUB_PWR_EN";
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "verdin-wm8904";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"Microphone Jack", "MICBIAS",
+			"IN1L", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904_1a>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
+	};
+};
+
+/* Verdin ADC_1, ADC_2, ADC_3 and ADC_4 */
+&adc1 {
+	status = "okay";
+};
+
+/* Verdin ETH_1 (On-module PHY) */
+&enetc_port0 {
+	status = "okay";
+};
+
+/* Verdin CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+/* Verdin CAN_2 */
+&flexcan2 {
+	status = "okay";
+};
+
+/* Verdin QSPI_1 */
+&flexspi1 {
+	status = "okay";
+};
+
+&gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio1>,
+		    <&pinctrl_gpio2>,
+		    <&pinctrl_gpio3>;
+};
+
+&gpio3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio6>;
+};
+
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio5>;
+};
+
+&gpio5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio4>;
+};
+
+/* Verdin I2C_3_HDMI */
+&i3c2 {
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&lpi2c3 {
+	status = "okay";
+};
+
+/* Verdin I2C_1 */
+&lpi2c4 {
+	status = "okay";
+
+	wm8904_1a: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sai3_mclk>;
+		clocks = <&scmi_clk IMX95_CLK_SAI3>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_1v8_sw>;
+		CPVDD-supply = <&reg_1v8_sw>;
+		DBVDD-supply = <&reg_1v8_sw>;
+		DCVDD-supply = <&reg_1v8_sw>;
+		MICVDD-supply = <&reg_1v8_sw>;
+	};
+
+	/* Current measurement into module VCC */
+	hwmon@40 {
+		compatible = "ti,ina219";
+		reg = <0x40>;
+		shunt-resistor = <10000>;
+	};
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp75c";
+		reg = <0x4f>;
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Verdin I2C_4_CSI */
+&lpi2c5 {
+	status = "okay";
+};
+
+/* Verdin UART_3, used as the Linux console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* Verdin UART_4 */
+&lpuart2 {
+	status = "okay";
+};
+
+/* Verdin UART_1 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* Verdin UART_2 */
+&lpuart8 {
+	status = "okay";
+};
+
+/* Verdin PCIE_1 */
+&pcie0 {
+	vpcie-supply = <&reg_pcie>;
+
+	status = "okay";
+};
+
+/* We support turning off sleep moci on Dahlia */
+&reg_force_sleep_moci {
+	status = "disabled";
+};
+
+/* Verdin I2S_1 */
+&sai3 {
+	status = "okay";
+};
+
+/* Verdin PWM_1 */
+&tpm4 {
+	status = "okay";
+};
+
+/* Verdin PWM_2 */
+&tpm5 {
+	status = "okay";
+};
+
+/* Verdin PWM_3_DSI */
+&tpm6 {
+	status = "okay";
+};
+
+/* Verdin USB_1 */
+&usb2 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usb3 {
+	fsl,permanently-attached;
+
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	usb_hub_3_0: usb-hub@1 {
+		compatible = "usb424,5744";
+		reg = <1>;
+		peer-hub = <&usb_hub_2_0>;
+		vdd-supply = <&reg_usb_hub>;
+	};
+
+	usb_hub_2_0: usb-hub@2 {
+		compatible = "usb424,2744";
+		reg = <2>;
+		peer-hub = <&usb_hub_3_0>;
+		vdd-supply = <&reg_usb_hub>;
+	};
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+/* Verdin SD_1 */
+&usdhc2 {
+	status = "okay";
+};
+
+/* Verdin CTRL_WAKE1_MICO# */
+&verdin_gpio_keys {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dts
new file mode 100644
index 000000000000..16975ae12fcb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-nonwifi.dtsi"
+#include "imx95-verdin-dahlia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 on Dahlia Board";
+	compatible = "toradex,verdin-imx95-nonwifi-dahlia",
+		     "toradex,verdin-imx95-nonwifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dts
new file mode 100644
index 000000000000..bafbe1179ec8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-wifi.dtsi"
+#include "imx95-verdin-dahlia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 WB on Dahlia Board";
+	compatible = "toradex,verdin-imx95-wifi-dahlia",
+		     "toradex,verdin-imx95-wifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};

-- 
2.43.0

