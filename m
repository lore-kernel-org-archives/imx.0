Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9419C30B51E
	for <imx@lists.linux.dev>; Fri,  5 Dec 2025 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764922324; cv=none; b=fL+sTLMyjvRAqzOJjpHlpvo9OL0XS4p/CDh3YX3YctsEpqEajbLwvxDXOKwDB4Md9+HO+jxksiqQ1Xk++RAGl6zSVhuyRojqkv64uQtlI0a9ngRUGH23Q9RtAJZ1U49PsmmX1TgdOcPHYdVDHaB/zBV+5Zli80WaPsOiANPqPzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764922324; c=relaxed/simple;
	bh=kxoq1T5QgmsyZYlO0muhuRH/nDp2ov80ploGnOnrEIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlYyS/8msZpdo8PgM9ns2SRgXvcKjWnxKwGVDTEWhyZDe/90qShytXugPqiF8TS8Hlw+zr+1pMskj/h9WfMrWrGv4sFEF1p6f42mVDkpV3xOtfa5gSi0qo94EgzClZ/0I916zKBQBvGxO5SKuct2+nqYRvS/ElNz2mj5PZ0GiFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C0EA41A3318;
	Fri,  5 Dec 2025 09:04:24 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5EF021A18F7;
	Fri,  5 Dec 2025 09:04:24 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1340B1800083;
	Fri,  5 Dec 2025 16:04:21 +0800 (+08)
From: "Yanan.Yang" <yanan.yang@nxp.com>
Date: Fri, 05 Dec 2025 17:03:59 +0900
Subject: [PATCH 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-imx91s-frdm-v1-2-afd6cd01c299@nxp.com>
References: <20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com>
In-Reply-To: <20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 yanan.yang@nxp.com, qijian.guo@nxp.com, justin.jiang@nxp.com, 
 Lei Xu <lei.xu@nxp.com>, Xiaofeng Wei <xiaofeng.wei@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764921858; l=21482;
 i=yanan.yang@nxp.com; s=20251205; h=from:subject:message-id;
 bh=kxoq1T5QgmsyZYlO0muhuRH/nDp2ov80ploGnOnrEIA=;
 b=e1hrEk0uFa2MAtENj2+SeYsZu5Z2JbxANK0AsmftPHZqIYS7trubbgBFPb/OrO6mcd0yd3M2K
 qwc99mjIU0eAmsU8lHpXo/h9rOkxSPGnWzw8nBCK/mu4KPO6OSwtTKc
X-Developer-Key: i=yanan.yang@nxp.com; a=ed25519;
 pk=d4hHTp5SW/PyyxexLEo/3c2RAaQDwym0zuYlifH95PI=
X-Virus-Scanned: ClamAV using ClamSMTP

Add DeviceTree support for the NXP FRDM-IMX91S development board based
on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
and differs in memory, storage, Ethernet, and PMIC configuration:

- 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
- 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
- Single GbE port (FRDM-IMX91 has dual GbE)
- PMIC PF9453 (FRDM-IMX91 uses PCA9451A)

This DT enables:
- ADC1
- UART1 and UART5
- I2C bus and children nodes
- USB and related nodes
- uSDHC1 and uSDHC2
- FlexSPI NAND flash
- Watchdog3
- Ethernet (eqos)
- FlexCAN
- MQS

Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91S
(FRDM-IMX91S board page)
Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91
(FRDM-IMX91 board page)

Co-developed-by: Lei Xu <lei.xu@nxp.com>
Signed-off-by: Lei Xu <lei.xu@nxp.com>
Co-developed-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
Signed-off-by: Yanan.Yang <yanan.yang@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts      | 692 +++++++++++++++++++++
 2 files changed, 693 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0..927bf76a05f3 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -368,6 +368,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
new file mode 100644
index 000000000000..0952a685c3f5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
@@ -0,0 +1,692 @@
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
+	compatible = "fsl,imx91-11x11-frdm-s", "fsl,imx91";
+	model = "NXP FRDM-IMX91S board";
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
+		i2c3 = &lpi2c4;
+		i2c4 = &lpi2c5;
+		i2c5 = &lpi2c6;
+		i2c6 = &lpi2c7;
+		i2c7 = &lpi2c8;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		mmc2 = &usdhc3;
+		rtc0 = &bbnsm_rtc;
+		serial0 = &lpuart1;
+		serial1 = &lpuart2;
+		serial2 = &lpuart3;
+		serial3 = &lpuart4;
+		serial4 = &lpuart5;
+		serial5 = &lpuart6;
+		serial6 = &lpuart7;
+		serial7 = &lpuart8;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&pinctrl_gpio_key>;
+		pinctrl-names = "default";
+
+		button {
+			interrupt-parent = <&gpio3>;
+			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+			gpios = <&gpio3 26 GPIO_PULL_UP>;
+			label = "User Button";
+			linux,code = <BTN_1>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		status {
+			default-state = "on";
+			gpios = <&pcal6524 7 GPIO_ACTIVE_LOW>;
+			label = "green:status";
+		};
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "vref_1v8";
+	};
+
+	reg_can_stby: regulator-can-stby {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "can-stby";
+		gpio = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	};
+
+	reg_usdhc1_vmmc: regulator-usdhc1 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "WLAN_EN";
+		startup-delay-us = <20000>;
+		gpio = <&pcal6524 3 GPIO_ACTIVE_HIGH>;
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
+	reg_usb_vbus: regulator-vbus {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "USB_VBUS";
+		gpio = <&pcal6524 15 GPIO_ACTIVE_HIGH>;
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
+			alloc-ranges = <0 0x80000000 0 0x20000000>;
+			reusable;
+			size = <0 0x2000000>;
+			linux,cma-default;
+		};
+	};
+
+	sound-mqs {
+		compatible = "fsl,imx6sx-sdb-mqs", "fsl,imx-audio-mqs";
+		audio-codec = <&mqs1>;
+		audio-cpu = <&sai1>;
+		model = "mqs-audio";
+	};
+
+	usdhc1_pwrseq: usdhc1_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pcal6524 18 GPIO_ACTIVE_LOW>;
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
+		ethphy1: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <4>;
+		};
+	};
+};
+
+&flexcan1 {
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	pinctrl-1 = <&pinctrl_flexcan1_sleep>;
+	pinctrl-names = "default", "sleep";
+	xceiver-supply = <&reg_can_stby>;
+	status = "okay";
+};
+
+&flexspi1 {
+	pinctrl-0 = <&pinctrl_flexspi1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <104000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				reg = <0x000000 0x800000>;
+				label = "bootloader";
+			};
+
+			partition@1 {
+				reg = <0x800000 0x800000>;
+				label = "env";
+			};
+
+			partition@2 {
+				reg = <0x1000000 0x2800000>;
+				label = "kernel";
+			};
+
+			partition@3 {
+				reg = <0x3800000 0x20000>;
+				label = "dtb";
+			};
+
+			partition@4 {
+				reg = <0x3820000 0xFFFFFFFF>;
+				label = "rootfs";
+				linux,rootfs;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX91_PAD_ENET1_MDC__ENET1_MDC                           0x57e
+			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO                      0x57e
+			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0                  0x57e
+			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1                  0x57e
+			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2                  0x57e
+			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3                  0x57e
+			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC                  0x5fe
+			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL            0x57e
+			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0                  0x57e
+			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1                     0x57e
+			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2                  0x57e
+			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3                  0x57e
+			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK  0x5fe
+			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL            0x57e
+		>;
+	};
+
+	pinctrl_eqos_sleep: eqossleepgrp {
+		fsl,pins = <
+			MX91_PAD_ENET1_MDC__GPIO4_IO0                           0x31e
+			MX91_PAD_ENET1_MDIO__GPIO4_IO1                          0x31e
+			MX91_PAD_ENET1_RD0__GPIO4_IO10                          0x31e
+			MX91_PAD_ENET1_RD1__GPIO4_IO11                          0x31e
+			MX91_PAD_ENET1_RD2__GPIO4_IO12                          0x31e
+			MX91_PAD_ENET1_RD3__GPIO4_IO13                          0x31e
+			MX91_PAD_ENET1_RXC__GPIO4_IO9                           0x31e
+			MX91_PAD_ENET1_RX_CTL__GPIO4_IO8                        0x31e
+			MX91_PAD_ENET1_TD0__GPIO4_IO5                           0x31e
+			MX91_PAD_ENET1_TD1__GPIO4_IO4                           0x31e
+			MX91_PAD_ENET1_TD2__GPIO4_IO3                           0x31e
+			MX91_PAD_ENET1_TD3__GPIO4_IO2                           0x31e
+			MX91_PAD_ENET1_TXC__GPIO4_IO7                           0x31e
+			MX91_PAD_ENET1_TX_CTL__GPIO4_IO6                        0x31e
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO28__CAN1_TX			0x139e
+			MX91_PAD_GPIO_IO29__CAN1_RX			0x139e
+			MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
+		>;
+	};
+
+	pinctrl_flexcan1_sleep: flexcan1sleepgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO28__GPIO2_IO28			0x31e
+			MX91_PAD_GPIO_IO29__GPIO2_IO29			0x31e
+			MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
+		>;
+	};
+
+	pinctrl_flexspi1: flexspi1grp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__FLEXSPI1_A_SCLK	0x3fe
+			MX91_PAD_SD3_CMD__FLEXSPI1_A_SS0_B	0x3fe
+			MX91_PAD_SD3_DATA0__FLEXSPI1_A_DATA0	0x3fe
+			MX91_PAD_SD3_DATA1__FLEXSPI1_A_DATA1	0x3fe
+			MX91_PAD_SD3_DATA2__FLEXSPI1_A_DATA2	0x3fe
+			MX91_PAD_SD3_DATA3__FLEXSPI1_A_DATA3	0x3fe
+		>;
+	};
+
+	pinctrl_gpio_key: gpiokeysgrp {
+		fsl,pins = <
+			MX91_PAD_CCM_CLKO1__GPIO3_IO26             0x0000031E
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			MX91_PAD_I2C1_SCL__LPI2C1_SCL                           0x40000b9e
+			MX91_PAD_I2C1_SDA__LPI2C1_SDA                           0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			MX91_PAD_I2C2_SCL__LPI2C2_SCL                           0x40000b9e
+			MX91_PAD_I2C2_SDA__LPI2C2_SDA                           0x40000b9e
+		>;
+	};
+
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			MX91_PAD_PDM_CLK__MQS1_LEFT			0x31e
+			MX91_PAD_PDM_BIT_STREAM0__MQS1_RIGHT		0x31e
+		>;
+	};
+
+	pinctrl_pcal6524: pcal6524grp {
+		fsl,pins = <
+			MX91_PAD_CCM_CLKO2__GPIO3_IO27                          0x31e
+			MX91_PAD_SD1_DATA5__GPIO3_IO15			0x31e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_RESET_B__GPIO3_IO7                         0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX91_PAD_UART1_RXD__LPUART1_RX                          0x31e
+			MX91_PAD_UART1_TXD__LPUART1_TX                          0x31e
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX91_PAD_DAP_TDO_TRACESWO__LPUART5_TX                   0x31e
+			MX91_PAD_DAP_TDI__LPUART5_RX                            0x31e
+			MX91_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B                   0x31e
+			MX91_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B                  0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK                            0x1582
+			MX91_PAD_SD1_CMD__USDHC1_CMD                            0x1382
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0                        0x1382
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1                        0x1382
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2                        0x1382
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3                        0x1382
+			MX91_PAD_SD1_DATA4__GPIO3_IO14		0x031E
+			MX91_PAD_SD1_STROBE__GPIO3_IO18		0x031E
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK                            0x158e
+			MX91_PAD_SD1_CMD__USDHC1_CMD                            0x138e
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0                        0x138e
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1                        0x138e
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2                        0x138e
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3                        0x138e
+			MX91_PAD_SD1_DATA4__GPIO3_IO14		0x031E
+			MX91_PAD_SD1_STROBE__GPIO3_IO18		0x031E
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK                            0x15fe
+			MX91_PAD_SD1_CMD__USDHC1_CMD                            0x13fe
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0                        0x13fe
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1                        0x13fe
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2                        0x13fe
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3                        0x13fe
+			MX91_PAD_SD1_DATA4__GPIO3_IO14		0x031E
+			MX91_PAD_SD1_STROBE__GPIO3_IO18		0x031E
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CD_B__GPIO3_IO0                            0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CD_B__GPIO3_IO0                            0x51e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK                            0x1582
+			MX91_PAD_SD2_CMD__USDHC2_CMD                            0x1382
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0                        0x1382
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1                        0x1382
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x1382
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x1382
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__GPIO3_IO1                             0x51e
+			MX91_PAD_SD2_CMD__GPIO3_IO2                             0x51e
+			MX91_PAD_SD2_DATA0__GPIO3_IO3                           0x51e
+			MX91_PAD_SD2_DATA1__GPIO3_IO4                           0x51e
+			MX91_PAD_SD2_DATA2__GPIO3_IO5                           0x51e
+			MX91_PAD_SD2_DATA3__GPIO3_IO6                           0x51e
+			MX91_PAD_SD2_VSELECT__GPIO3_IO19                        0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK                            0x158e
+			MX91_PAD_SD2_CMD__USDHC2_CMD                            0x138e
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0                        0x138e
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1                        0x138e
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x138e
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x138e
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK                            0x15fe
+			MX91_PAD_SD2_CMD__USDHC2_CMD                            0x13fe
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0                        0x13fe
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1                        0x13fe
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x13fe
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x13fe
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX91_PAD_WDOG_ANY__WDOG1_WDOG_ANY       0x31e
+		>;
+	};
+};
+
+&lpi2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pcf2131: rtc@53 {
+		compatible = "nxp,pcf2131";
+		reg = <0x53>;
+		interrupt-parent = <&pcal6524>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
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
+		interrupt-parent = <&gpio3>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		pinctrl-0 = <&pinctrl_pcal6524>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
+	};
+
+	pmic@32 {
+		compatible = "nxp,pf9453";
+		reg = <0x32>;
+		interrupt-parent = <&pcal6524>;
+		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3775000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK1";
+			};
+
+			buck2: BUCK2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK2";
+				regulator-ramp-delay = <12500>;
+			};
+
+			buck3: BUCK3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3775000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK3";
+			};
+
+			buck4: BUCK4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3775000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK4";
+			};
+
+			ldo1: LDO1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+				regulator-name = "LDO1";
+			};
+
+			ldo2: LDO2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1950000>;
+				regulator-min-microvolt = <500000>;
+				regulator-name = "LDO2";
+			};
+
+			ldo_snvs: LDO-SNVS {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <1200000>;
+				regulator-name = "LDO-SNVS";
+			};
+		};
+	};
+
+	ptn5110: tcpc@52 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x52>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
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
+&media_blk_ctrl {
+	status = "okay";
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
+	vbus-supply = <&reg_usb_vbus>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	status = "okay";
+};
+
+&usdhc1 {
+	bus-width = <8>;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&reg_usdhc1_vmmc>;
+	wakeup-source;
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
+&wdog3 {
+	pinctrl-0 = <&pinctrl_wdog>;
+	pinctrl-names = "default";
+	fsl,ext-reset-output;
+	status = "okay";
+};

-- 
2.43.0

