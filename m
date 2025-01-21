Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A67E1B4156
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737452029; cv=none; b=rLO6eCohETZb2v199ljmszGk3uV4T4BOttdCMLIIpoaKF4+8Zu5rrsKdkdqDXPrIVDMbjetdKdWKkPU5/JjCRFf0D0/mnQOIAYZf6g162sKu0zP+l+Nx3qq3wQ7swNeT1mfeGgrlbWQGzxbbPvkX9CW19AliS+2l5B5Bz0ChEII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737452029; c=relaxed/simple;
	bh=BTIzuQbnMS+OtEqnJARQ5LRLVFwr0QGuCi0VAZkGrPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PdmaOshV+1VA3R2KN/A2xaoeM5P0tmwEU5fCtnlEnKmfJ89UwjYIM8yvUt0raXTPy8p06mI8+b4MGMfTyeh0J2+WjG8K5+10jEdbdKxMeQTkOdOvdRJxDVJlTqq5FaYOQdtTeTeFqCZT/z+1zf9gBBMcaSxumBxQ7mcsHEHadA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LCoPZeG4; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LCoPZeG4"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16E701C000A;
	Tue, 21 Jan 2025 09:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737452020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3wSQ5rFfWCcO/omlaL/2PsW86IT3L4681+uR0Sfrj4=;
	b=LCoPZeG4SWeNCyV+PRSsf7K/mut75UifZiEhmY+t94EKmNCyNm8pPa7a9D0KfA4KjydIGu
	d9W01jDnpU4DZUZsMp+d7HxEeXFiSZ2fXoLuseOX8kKYfiKbR0WIDfkxANvDCf4nkh1MKU
	95W8HOHjqePefDjK/KXZka57F2zPREWKBs/d43Xmtk/d9pSO4El7znFFyGhrsU5OY8BalU
	1djjcvr0z2yjKxu2AsdCkcLOALrwd4Asp/d2eShZPxzHCageirhhJ/eeZ2kWjnQJz43HgB
	Tec3VhHrWe5kYAyFXabvnfzJX0x5CoRZ7vofdESoSktdOLxVJzsJ9if/7bmrXw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 21 Jan 2025 10:33:28 +0100
Subject: [PATCH 2/3] ARM: dts: imx6ul: Add Variscite VAR-SOM-MX6UL SoM
 support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250121-varsom6ul-concerto-dts-v1-2-eb349acf0ac6@bootlin.com>
References: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
In-Reply-To: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7927;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BTIzuQbnMS+OtEqnJARQ5LRLVFwr0QGuCi0VAZkGrPI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnj2nyuJBjsfaey2mkVUcOBnBpQVyEI0wSFiZDv
 6bag+JqmnSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ49p8gAKCRDRgEFAKaOo
 NujAD/9wsQpONBAj1MkthOFqWznHLVnuBHRz+3I+zKNQl05HqTKxVcQe2Fc5pRGGJaaq4ba5jx2
 FQHCpTMyW3GLsb5q1jl3oawAN8xH78qBSaAYFN4yOlsOvihsN/uOHbKl/eTCYB2/Hj0ZYwfCcEq
 q8GEisPxoNAckfztrJMFvk9VvUAcPBfdE0Jlrek0eOvjBl7wng7khjzU7qzw8UllibFoCOr0++6
 VasZ4EsDbiCU3KN4yZt+hkv+oHOMDox1E6boBJXxK0YMpvj5S7FT0ei+Vyl4nKW3HpXL4XVtIJh
 58xxx/iUwNeUtqQBlltD9fPmL4nrjKiQceFcTAeL+lAsvZLJ0IHnnulVHdwxwmDehEpkcrWJVws
 fdaZkyfpJTmvzIqpgkMU+vCulAsEcogsNkRaBc9Kh4TKbJM4ARM9YJTFo1+PxjCLgWWL/CW85OB
 VvSC8B3wEiLSZO3MQhKxj3ROt950CQQhMJUbLpPLylBzONGUJdZ+5w8qRNkTBjTazNVUQFPXIl9
 2Qd52q5WWryprxQ1GDyCv2MHC0YGHhws3DhSZBjJHDVuZ9AYOymxWhuq6ogYCaZlfKdx4/aLH4P
 CU7SuCawm5+LhbrOnVoyKOdrcs984+W6AO/KbICE3eMGgKuHq03WZYbwVGZItGEURQ6GgQbmfGl
 Do3bRomi8oYXWCw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com

This patch adds support for the Variscite VAR_SOM-MX6UL SoM with :
- NXP i.MX6 UltraLite SoC
- 128–1024 MB DDR3L
- 8–128 GB eMMC
- 128–512 MB SLC NAND
- Camera Interface
- LVDS / Parallel RGB interfaces (not configured)
- Touch controller (not configured)
- Ethernet RMII interface (not configured)
- On-SoM Wi-Fi/Bluetooth with CYW43353 on SDIO Module (not configured)
- SD/MMC/SDIO interface
- USB Host + USB OTG interface
- I2C interfaces
- SPI interfaces
- PCI-Express 2.0 interface
- on-SoM Audio Codec (not configured)
- S/PDIF interface (not configured)

Product website: https://www.variscite.com/product/system-on-module-som/cortex-a7/var-som-6ul-nxp-imx6ul-6ull-6ulz

Support is handled with a SoM-centric dtsi exporting the default
interfaces along the default pinmuxing to be enabled by the board dts
file.

I tested this on a VAR-SOM-6UL_G2_700C_512R_8N_IT_REV1.3A, which is why
some of the features above are mentioned as "not configured" (I couldn't
test them).

This file is based on the one provided by Variscite on their own kernel,
but adapted for mainline.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 232 ++++++++++++++++++++++++++
 1 file changed, 232 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..6eda5726f2f17acfc5f705b9de524f8195c63845
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Support for Variscite VAR-SOM-MX6UL Module
+ *
+ * Copyright 2019 Variscite Ltd.
+ * Copyright 2025 Bootlin
+ */
+
+/dts-v1/;
+
+#include "imx6ul.dtsi"
+#include <dt-bindings/clock/imx6ul-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Variscite VAR-SOM-MX6UL module";
+	compatible = "variscite,var-som-imx6ul", "fsl,imx6ul";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reg_gpio_dvfs: reg-gpio-dvfs {
+		compatible = "regulator-gpio";
+		regulator-min-microvolt = <1300000>;
+		regulator-max-microvolt = <1400000>;
+		regulator-name = "gpio_dvfs";
+		regulator-type = "voltage";
+		gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+		states = <1300000 0x1 1400000 0x0>;
+	};
+
+	rmii_ref_clk: rmii-ref-clk-grp {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "rmii-ref";
+	};
+};
+
+&cpu0 {
+	dc-supply = <&reg_gpio_dvfs>;
+};
+
+&clks {
+	assigned-clocks = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <786432000>;
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_enet1_gpio>, <&pinctrl_enet1_mdio>;
+	phy-mode = "rmii";
+	phy-reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+	phy-reset-duration = <100>;
+	phy-handle = <&ethphy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			micrel,rmii-reference-clock-select-25-mhz = <1>;
+			micrel,led-mode = <1>;
+			clocks = <&rmii_ref_clk>;
+			clock-names = "rmii-ref";
+			reg = <1>;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT Enable */
+			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029	/* WLAN Enable */
+		>;
+	};
+
+	pinctrl_enet1_gpio: enet1-gpiogrp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0 /* fec1 reset */
+		>;
+	};
+
+	pinctrl_enet1: enet1grp {
+		fsl,pins = <
+			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b031
+		>;
+	};
+
+	pinctrl_enet1_mdio: enet1-mdiogrp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
+			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
+		>;
+	};
+
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
+			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
+		>;
+	};
+
+	pinctrl_tsc: tscgrp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0xb0
+			MX6UL_PAD_GPIO1_IO02__GPIO1_IO02	0xb0
+			MX6UL_PAD_GPIO1_IO03__GPIO1_IO03	0xb0
+			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04	0xb0
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
+			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1
+			MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x17059
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x17059
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x17059
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x17059
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x17059
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x17059
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x17059
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x17059
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x17059
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x100b9
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x170b9
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x170b9
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x170b9
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x170b9
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x170b9
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x170b9
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x170b9
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x170b9
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x170b9
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x100f9
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x170f9
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x170f9
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x170f9
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x170f9
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x170f9
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x170f9
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x170f9
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x170f9
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x170f9
+		>;
+	};
+};
+
+&pxp {
+	status = "okay";
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
+			  <&clks IMX6UL_CLK_SAI2>;
+	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <0>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&snvs_poweroff {
+	status = "okay";
+};
+
+&tsc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tsc>;
+	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
+	measure-delay-time = <0xffff>;
+	pre-charge-time = <0xfff>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	bus-width = <8>;
+	no-1-8-v;
+	non-removable;
+	keep-power-in-suspend;
+	wakeup-source;
+	status = "okay";
+};

-- 
2.47.0.2.g7caf9f4c55.dirty

