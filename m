Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468EE2F60C4
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 06:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763103353; cv=none; b=VVW9RxS0J+KqGL89S11akc9tXSHGvU+UsscaJZxxay5yUVZaCfTPq6I8g9FoNZKqWtN7vCbhSB/Zk1dbiZDqpmDykcS/B3E6cp+PaC57AHKhXK9W5RpOY5m45nVYf6wA+9zBeX1Jqg7ra/ILl/g4iX5jMaoKblvutzB3RTSbbFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763103353; c=relaxed/simple;
	bh=+kawbzoCURWpzatChfXoFQXZGHgy0d4I5MkJgxuhw+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J3YXymMGrLVGjTXUnMwy3lMx/32YV5oPMV63KBBln8Kbe3/aHaPcQm9T9R3xVf5De4Jnitvo4UfLksrJ5jihkMtrgK79o+6u+CZ/Rwux8dtbbOafLjZ9dXFlpNvicItrAsVVVh36U4dc7Ya5zUMVdUSKUS1r6IB9iSiZ1i2k48A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 038C01A0D3D;
	Fri, 14 Nov 2025 07:55:43 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 973731A0CE8;
	Fri, 14 Nov 2025 07:55:42 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 6A0C61800096;
	Fri, 14 Nov 2025 14:55:40 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Fri, 14 Nov 2025 15:55:32 +0900
Subject: [PATCH 1/2] arm64: dts: freescale: Add FRDM-IMX91 basic support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-imx91_frdm-v1-1-e5763bdf9336@nxp.com>
References: <20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com>
In-Reply-To: <20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Justin Jiang <justin.jiang@nxp.com>, Joseph Guo <qijian.guo@nxp.com>, 
 Tom Zheng <haidong.zheng@nxp.com>, Steven Yang <steven.yang@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763103338; l=24032;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=+kawbzoCURWpzatChfXoFQXZGHgy0d4I5MkJgxuhw+s=;
 b=cNGgb/GiOWj/tApixTQ9JX4RR6gIfd0olT2N+zMR+aDB+PcviFmnygc6A/9LW7JG94Gm/j+dp
 eoyKoEYJAyjBuJQdUTKO+grVG9SAmsq55sFCZcb3o3zKoji12DZM2c0
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

The FRDM i.MX 91 development board is a low-cost and
compact developmentboard featuring the i.MX 91 applications processor.

Add FRDM-IMX91 board support.
- Enable ADC1.
- Enable lpuart1 and lpuart5.
- Enable network eqos and fec.
- Enable I2C bus and children nodes under I2C bus.
- Enable USB and related nodes.
- Enable uSDHC1, uSDHC2 and uSDHC3.
- Enable MU1 and MU2.
- Enable Watchdog3.
- Enable MQS

Co-developed-by: Tom Zheng <haidong.zheng@nxp.com>
Signed-off-by: Tom Zheng <haidong.zheng@nxp.com>
Co-developed-by: Steven Yang <steven.yang@nxp.com>
Signed-off-by: Steven Yang <steven.yang@nxp.com>
Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts | 823 +++++++++++++++++++++
 2 files changed, 824 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 525ef180481d331e9c4decd092b7b831c497b67e..89c3fab6c270f4da1b3f196c2c412b6e3b64eed8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -344,6 +344,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
new file mode 100644
index 0000000000000000000000000000000000000000..423d522c57636eb8eb84d65b4989b7a2d16a3f4c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
@@ -0,0 +1,823 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/usb/pd.h>
+#include "imx91.dtsi"
+
+/ {
+	compatible = "fsl,frdm-imx91", "fsl,imx91";
+	model = "NXP FRDM-IMX91";
+
+	aliases {
+		ethernet0 = &fec;
+		ethernet1 = &eqos;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		mmc2 = &usdhc3;
+		rtc0 = &bbnsm_rtc;
+		serial0 = &lpuart1;
+		serial1 = &lpuart2;
+		serial2 = &lpuart3;
+		serial3 = &lpuart4;
+		serial4 = &lpuart5;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "vref_1v8";
+	};
+
+	reg_can2_stby: regulator-can2-stby {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "can2-stby";
+		gpio = <&pcal6524 23 GPIO_ACTIVE_LOW>;
+		enable-active-low;
+	};
+
+	reg_m2_pwr: regulator-m2-pwr {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "M.2-power";
+		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VSD_3V3";
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "WLAN_EN";
+		vin-supply = <&reg_m2_pwr>;
+		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		/*
+		 * IW612 wifi chip needs more delay than other wifi chips to complete
+		 * the host interface initialization after power up, otherwise the
+		 * internal state of IW612 may be unstable, resulting in the failure of
+		 * the SDIO3.0 switch voltage.
+		 */
+		startup-delay-us = <20000>;
+	};
+
+	reg_vdd_12v: regulator-vdd-12v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <12000000>;
+		regulator-min-microvolt = <12000000>;
+		regulator-name = "reg_vdd_12v";
+		gpio = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_vexp_3v3: regulator-vexp-3v3 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VEXP_3V3";
+		vin-supply = <&buck4>;
+		gpio = <&pcal6524 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_vexp_5v: regulator-vexp-5v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "VEXP_5V";
+		gpio = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x30000000>;
+			reusable;
+			size = <0 0x10000000>;
+			linux,cma-default;
+		};
+	};
+
+	sound-mqs {
+		compatible = "fsl,imx6sx-sdb-mqs",
+			     "fsl,imx-audio-mqs";
+		audio-codec = <&mqs1>;
+		audio-cpu = <&sai1>;
+		model = "mqs-audio";
+	};
+
+	sw-keys {
+		compatible = "gpio-keys";
+
+		K2: user_btn1 {
+			interrupt-parent = <&pcal6524>;
+			interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+			label = "User Button1";
+			gpio = <&pcal6524 5 GPIO_PULL_UP>;
+			linux,code = <BTN_1>;
+		};
+
+		K3: user_btn2 {
+			interrupt-parent = <&pcal6524>;
+			interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+			label = "User Button2";
+			gpio = <&pcal6524 6 GPIO_PULL_UP>;
+			linux,code = <BTN_2>;
+		};
+	};
+
+	usdhc3_pwrseq: usdhc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&eqos {
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-1 = <&pinctrl_eqos_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy1: ethernet-phy@1 {
+			reg = <1>;
+			realtek,clkout-disable;
+		};
+	};
+};
+
+&fec {
+	phy-handle = <&ethphy2>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_fec>;
+	pinctrl-1 = <&pinctrl_fec_sleep>;
+	pinctrl-names = "default", "sleep";
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy2: ethernet-phy@2 {
+			reg = <2>;
+			realtek,clkout-disable;
+		};
+	};
+};
+
+&flexcan2 {
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-1 = <&pinctrl_flexcan2_sleep>;
+	pinctrl-names = "default", "sleep";
+	xceiver-supply = <&reg_can2_stby>;
+	status = "okay";
+};
+
+&lpi2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pcal6408: gpio@20 {
+		compatible = "nxp,pcal9554b";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		vcc-supply = <&reg_usdhc3_vmmc>;
+		status = "okay";
+	};
+};
+
+&lpi2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pcal6524: gpio@22 {
+		compatible = "nxp,pcal6524";
+		reg = <0x22>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&gpio3>;
+		pinctrl-0 = <&pinctrl_pcal6524>;
+		pinctrl-names = "default";
+	};
+
+	pmic@25 {
+		compatible = "nxp,pca9451a";
+		reg = <0x25>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&pcal6524>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2237500>;
+				regulator-min-microvolt = <650000>;
+				regulator-name = "BUCK1";
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK2";
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck4: BUCK4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK4";
+			};
+
+			buck5: BUCK5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK5";
+			};
+
+			buck6: BUCK6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK6";
+			};
+
+			ldo1: LDO1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1600000>;
+				regulator-name = "LDO1";
+			};
+
+			ldo4: LDO4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+				regulator-name = "LDO4";
+			};
+
+			ldo5: LDO5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "LDO5";
+			};
+		};
+	};
+};
+
+&lpi2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio3>;
+
+		typec1_con: connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			label = "USB-C";
+			op-sink-microwatt = <15000000>;
+			power-role = "dual";
+			self-powered;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
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
+					typec1_dr_sw: endpoint {
+						remote-endpoint = <&usb1_drd_sw>;
+					};
+				};
+			};
+		};
+	};
+
+	pcf2131: rtc@53 {
+		compatible = "nxp,pcf2131";
+		reg = <0x53>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&pcal6524>;
+		status = "okay";
+	};
+};
+
+&lpspi3 {
+	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_lpspi3>;
+	pinctrl-1 = <&pinctrl_lpspi3>;
+	pinctrl-names = "default", "sleep";
+	gpio = <&pcal6408 0 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	spidev0: spi@0 {
+		compatible = "lwn,bk4";
+		reg = <0>;
+		spi-max-frequency = <1000000>;
+	};
+};
+
+&lpuart1 {
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&lpuart5 {
+	pinctrl-0 = <&pinctrl_uart5>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&mqs1 {
+	clocks = <&clk IMX93_CLK_MQS1_GATE>;
+	clock-names = "mclk";
+	pinctrl-0 = <&pinctrl_mqs1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sai1 {
+	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <24576000>;
+	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&usbotg1 {
+	adp-disable;
+	disable-over-current;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usbotg2 {
+	disable-over-current;
+	dr_mode = "host";
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	status = "okay";
+};
+
+&usdhc1 {
+	bus-width = <8>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	status = "okay";
+};
+
+&usdhc2 {
+	bus-width = <4>;
+	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&usdhc3 {
+	bus-width = <4>;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	vmmc-supply = <&reg_usdhc3_vmmc>;
+	wakeup-source;
+	status = "okay";
+};
+
+&wdog3 {
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX91_PAD_ENET1_MDC__ENET1_MDC				0x57e
+			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
+			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
+			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
+			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
+			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
+			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC			0x5fe
+			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
+			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
+			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1			0x57e
+			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
+			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
+			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
+			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
+		>;
+	};
+
+	pinctrl_eqos_sleep: eqosgrpsleep {
+		fsl,pins = <
+			MX91_PAD_ENET1_MDC__GPIO4_IO0				0x31e
+			MX91_PAD_ENET1_MDIO__GPIO4_IO1				0x31e
+			MX91_PAD_ENET1_RD0__GPIO4_IO10				0x31e
+			MX91_PAD_ENET1_RD1__GPIO4_IO11				0x31e
+			MX91_PAD_ENET1_RD2__GPIO4_IO12				0x31e
+			MX91_PAD_ENET1_RD3__GPIO4_IO13				0x31e
+			MX91_PAD_ENET1_RXC__GPIO4_IO9				0x31e
+			MX91_PAD_ENET1_RX_CTL__GPIO4_IO8			0x31e
+			MX91_PAD_ENET1_TD0__GPIO4_IO5				0x31e
+			MX91_PAD_ENET1_TD1__GPIO4_IO4				0x31e
+			MX91_PAD_ENET1_TD2__GPIO4_IO3				0x31e
+			MX91_PAD_ENET1_TD3__GPIO4_IO2				0x31e
+			MX91_PAD_ENET1_TXC__GPIO4_IO7				0x31e
+			MX91_PAD_ENET1_TX_CTL__GPIO4_IO6			0x31e
+		>;
+	};
+
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX91_PAD_ENET2_MDC__ENET2_MDC				0x57e
+			MX91_PAD_ENET2_MDIO__ENET2_MDIO				0x57e
+			MX91_PAD_ENET2_RD0__ENET2_RGMII_RD0			0x57e
+			MX91_PAD_ENET2_RD1__ENET2_RGMII_RD1			0x57e
+			MX91_PAD_ENET2_RD2__ENET2_RGMII_RD2			0x57e
+			MX91_PAD_ENET2_RD3__ENET2_RGMII_RD3			0x57e
+			MX91_PAD_ENET2_RXC__ENET2_RGMII_RXC			0x5fe
+			MX91_PAD_ENET2_RX_CTL__ENET2_RGMII_RX_CTL		0x57e
+			MX91_PAD_ENET2_TD0__ENET2_RGMII_TD0			0x57e
+			MX91_PAD_ENET2_TD1__ENET2_RGMII_TD1			0x57e
+			MX91_PAD_ENET2_TD2__ENET2_RGMII_TD2			0x57e
+			MX91_PAD_ENET2_TD3__ENET2_RGMII_TD3			0x57e
+			MX91_PAD_ENET2_TXC__ENET2_RGMII_TXC			0x5fe
+			MX91_PAD_ENET2_TX_CTL__ENET2_RGMII_TX_CTL		0x57e
+		>;
+	};
+
+	pinctrl_fec_sleep: fecsleepgrp {
+		fsl,pins = <
+			MX91_PAD_ENET2_MDC__GPIO4_IO14				0x51e
+			MX91_PAD_ENET2_MDIO__GPIO4_IO15				0x51e
+			MX91_PAD_ENET2_RD0__GPIO4_IO24				0x51e
+			MX91_PAD_ENET2_RD1__GPIO4_IO25				0x51e
+			MX91_PAD_ENET2_RD2__GPIO4_IO26				0x51e
+			MX91_PAD_ENET2_RD3__GPIO4_IO27				0x51e
+			MX91_PAD_ENET2_RXC__GPIO4_IO23				0x51e
+			MX91_PAD_ENET2_RX_CTL__GPIO4_IO22			0x51e
+			MX91_PAD_ENET2_TD0__GPIO4_IO19				0x51e
+			MX91_PAD_ENET2_TD1__GPIO4_IO18				0x51e
+			MX91_PAD_ENET2_TD2__GPIO4_IO17				0x51e
+			MX91_PAD_ENET2_TD3__GPIO4_IO16				0x51e
+			MX91_PAD_ENET2_TXC__GPIO4_IO21				0x51e
+			MX91_PAD_ENET2_TX_CTL__GPIO4_IO20			0x51e
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO25__CAN2_TX				0x139e
+			MX91_PAD_GPIO_IO27__CAN2_RX				0x139e
+		>;
+	};
+
+	pinctrl_flexcan2_sleep: flexcan2sleepgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO25__GPIO2_IO25				0x31e
+			MX91_PAD_GPIO_IO27__GPIO2_IO27				0x31e
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			MX91_PAD_I2C1_SCL__LPI2C1_SCL				0x40000b9e
+			MX91_PAD_I2C1_SDA__LPI2C1_SDA				0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			MX91_PAD_I2C2_SCL__LPI2C2_SCL				0x40000b9e
+			MX91_PAD_I2C2_SDA__LPI2C2_SDA				0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e
+			MX91_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e
+		>;
+	};
+
+	pinctrl_lpspi3: lpspi3grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO08__GPIO2_IO8				0x3fe
+			MX91_PAD_GPIO_IO09__LPSPI3_SIN				0x3fe
+			MX91_PAD_GPIO_IO10__LPSPI3_SOUT				0x3fe
+			MX91_PAD_GPIO_IO11__LPSPI3_SCK				0x3fe
+		>;
+	};
+
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			MX91_PAD_PDM_CLK__MQS1_LEFT				0x31e
+			MX91_PAD_PDM_BIT_STREAM0__MQS1_RIGHT			0x31e
+		>;
+	};
+
+	pinctrl_pcal6524: pcal6524grp {
+		fsl,pins = <
+			MX91_PAD_CCM_CLKO2__GPIO3_IO27				0x31e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_RESET_B__GPIO3_IO7				0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX91_PAD_UART1_RXD__LPUART1_RX				0x31e
+			MX91_PAD_UART1_TXD__LPUART1_TX				0x31e
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX91_PAD_DAP_TDO_TRACESWO__LPUART5_TX			0x31e
+			MX91_PAD_DAP_TDI__LPUART5_RX				0x31e
+			MX91_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B			0x31e
+			MX91_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B			0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK				0x1582
+			MX91_PAD_SD1_CMD__USDHC1_CMD				0x1382
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x1382
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x1382
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x1382
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x1382
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x1382
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x1382
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x1382
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x1382
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x1582
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK				0x158e
+			MX91_PAD_SD1_CMD__USDHC1_CMD				0x138e
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK				0x15fe
+			MX91_PAD_SD1_CMD__USDHC1_CMD				0x13fe
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x13fe
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x13fe
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CD_B__GPIO3_IO0				0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio_sleep: usdhc2gpiogrpsleep {
+		fsl,pins = <
+			MX91_PAD_SD2_CD_B__GPIO3_IO0				0x51e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK				0x1582
+			MX91_PAD_SD2_CMD__USDHC2_CMD				0x1382
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0			0x1382
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1			0x1382
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2			0x1382
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3			0x1382
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_sleep: usdhc2grpsleep {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__GPIO3_IO1				0x51e
+			MX91_PAD_SD2_CMD__GPIO3_IO2				0x51e
+			MX91_PAD_SD2_DATA0__GPIO3_IO3				0x51e
+			MX91_PAD_SD2_DATA1__GPIO3_IO4				0x51e
+			MX91_PAD_SD2_DATA2__GPIO3_IO5				0x51e
+			MX91_PAD_SD2_DATA3__GPIO3_IO6				0x51e
+			MX91_PAD_SD2_VSELECT__GPIO3_IO19			0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK				0x158e
+			MX91_PAD_SD2_CMD__USDHC2_CMD				0x138e
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK				0x15fe
+			MX91_PAD_SD2_CMD__USDHC2_CMD				0x13fe
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0			0x13fe
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1			0x13fe
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2			0x13fe
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3			0x13fe
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK				0x1582
+			MX91_PAD_SD3_CMD__USDHC3_CMD				0x1382
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x1382
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x1382
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x1382
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x1382
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3grpsleep {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__GPIO3_IO20				0x31e
+			MX91_PAD_SD3_CMD__GPIO3_IO21				0x31e
+			MX91_PAD_SD3_DATA0__GPIO3_IO22				0x31e
+			MX91_PAD_SD3_DATA1__GPIO3_IO23				0x31e
+			MX91_PAD_SD3_DATA2__GPIO3_IO24				0x31e
+			MX91_PAD_SD3_DATA3__GPIO3_IO25				0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3wlangrp {
+		fsl,pins = <
+			MX91_PAD_CCM_CLKO1__GPIO3_IO26				0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK				0x158e
+			MX91_PAD_SD3_CMD__USDHC3_CMD				0x138e
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x138e
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x138e
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x138e
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x138e
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK				0x15fe
+			MX91_PAD_SD3_CMD__USDHC3_CMD				0x13fe
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x13fe
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x13fe
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x13fe
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x13fe
+		>;
+	};
+};

-- 
2.34.1

