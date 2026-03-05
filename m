Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DA13EB7E2;
	Thu,  5 Mar 2026 18:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734123; cv=none; b=teiKXU0KhCt6ZATLjACU1r7S+JGVzXpqpoh/+YKBPCvQ44s7NH6LuG3Hhr6r65lFAupMPP7u8TasHSWrF4Iqt220BJjTi3jz/z/5ZLzQtiGQOG0/vX3DQpHfwMcZtyvEOMUDwsyh125pna1ohT93tYKcTwa9Fm4Ggey9lVuljOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734123; c=relaxed/simple;
	bh=2bsJafVsX2m4CwYwS6u8LpyZ9Xkk/w7J9d6+A9aQOv0=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=SFztdR7A5jn1I8opLEka/PXkZPh+HoQMJNJqViTyQ9O5EkIOMVmam0LhRCynjCJIpQC24mKE1cvlIi+EpUft6THiSwosVZsPxqXGW5N/9nKoOA/BBAW9PpmwBi0qyeOJerv9D3aqw1ts716sNhJrkllQV1Cpr1qzl9GKARTZYXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=bznC0nFm; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="bznC0nFm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=Vy/XuW2Q9mTguchUrKCnkbDb6YVoO0nfxGbZ8UlBMXQ=; b=bznC0nFm7kEm/OdSyKoK64Yhr+
	v2v7PdLwrRzMHkxatGkYIY1skP8Q0KbMD41cPdilCcs0/PTKEFr5YZWzQwW3vekBFjlxRj3rOl1cM
	uwfJb3jl42vFAs7TCCFEjZQEJgaLK681S0XV+F60hWfaFiHxI35xFu6MBwnZcy0Ug4js=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37706 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyD7e-0002aR-N2; Thu, 05 Mar 2026 13:08:31 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Thu,  5 Mar 2026 13:06:21 -0500
Message-ID: <20260305180651.1827087-7-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305180651.1827087-1-hugo@hugovil.com>
References: <20260305180651.1827087-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Subject: [PATCH v2 06/15] ARM: dts: imx6ul-var-som: Factor out common parts for all CPU variants
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Factor out the parts on the Variscite VAR-SOM-6UL [1] that are common to
all CPU variants (6UL, 6ULL, etc). This will simplify adding future
dedicated device tree files for each CPU variant.

Link  https://dev.variscite.com/var-som-6ul [1]

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 ...ar-som.dtsi => imx6ul-var-som-common.dtsi} |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 214 +-----------------
 .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi |  15 ++
 3 files changed, 18 insertions(+), 217 deletions(-)
 copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som.dtsi => imx6ul-var-som-common.dtsi} (98%)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
similarity index 98%
copy from arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
copy to arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
index 7259526e2b884..2072e8ba4d469 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
@@ -1,14 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Support for Variscite VAR-SOM-6UL Module
+ * Support for the common parts shared by all the different CPU options on
+ * Variscite VAR-SOM-6UL Module
  *
  * Copyright 2019 Variscite Ltd.
  * Copyright 2025 Bootlin
  */
 
-/dts-v1/;
-
-#include "imx6ul.dtsi"
 #include <dt-bindings/clock/imx6ul-clock.h>
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
index 7259526e2b884..35a0c0b3603fd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
@@ -9,221 +9,9 @@
 /dts-v1/;
 
 #include "imx6ul.dtsi"
-#include <dt-bindings/clock/imx6ul-clock.h>
-#include <dt-bindings/gpio/gpio.h>
+#include "imx6ul-var-som-common.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL module";
 	compatible = "variscite,var-som-imx6ul", "fsl,imx6ul";
-
-	memory@80000000 {
-		device_type = "memory";
-		reg = <0x80000000 0x20000000>;
-	};
-
-	reg_gpio_dvfs: reg-gpio-dvfs {
-		compatible = "regulator-gpio";
-		regulator-min-microvolt = <1300000>;
-		regulator-max-microvolt = <1400000>;
-		regulator-name = "gpio_dvfs";
-		regulator-type = "voltage";
-		gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
-		states = <1300000 0x1
-			  1400000 0x0>;
-	};
-
-	rmii_ref_clk: rmii-ref-clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <25000000>;
-		clock-output-names = "rmii-ref";
-	};
-};
-
-&clks {
-	assigned-clocks = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
-	assigned-clock-rates = <786432000>;
-};
-
-&fec1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_enet1_gpio>, <&pinctrl_enet1_mdio>;
-	phy-mode = "rmii";
-	phy-handle = <&ethphy0>;
-	status = "okay";
-
-	mdio {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ethphy0: ethernet-phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
-			reg = <1>;
-			clocks = <&rmii_ref_clk>;
-			clock-names = "rmii-ref";
-			reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <100000>;
-			micrel,led-mode = <1>;
-			micrel,rmii-reference-clock-select-25-mhz;
-		};
-	};
-};
-
-&iomuxc {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_hog>;
-
-	pinctrl_enet1: enet1grp {
-		fsl,pins = <
-			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
-			MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x1b0b0
-			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
-			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
-			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
-			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
-			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
-			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b031
-		>;
-	};
-
-	pinctrl_enet1_gpio: enet1-gpiogrp {
-		fsl,pins = <
-			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0 /* fec1 reset */
-		>;
-	};
-
-	pinctrl_enet1_mdio: enet1-mdiogrp {
-		fsl,pins = <
-			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
-			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
-		>;
-	};
-
-	pinctrl_hog: hoggrp {
-		fsl,pins = <
-			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT Enable */
-			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029	/* WLAN Enable */
-		>;
-	};
-
-	pinctrl_sai2: sai2grp {
-		fsl,pins = <
-			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
-			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
-			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
-			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
-			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
-		>;
-	};
-
-	pinctrl_tsc: tscgrp {
-		fsl,pins = <
-			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0xb0
-			MX6UL_PAD_GPIO1_IO02__GPIO1_IO02	0xb0
-			MX6UL_PAD_GPIO1_IO03__GPIO1_IO03	0xb0
-			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04	0xb0
-		>;
-	};
-
-	pinctrl_uart2: uart2grp {
-		fsl,pins = <
-			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
-			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
-			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1
-			MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
-		>;
-	};
-
-	pinctrl_usdhc2: usdhc2grp {
-		fsl,pins = <
-			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
-			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x17059
-			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x17059
-			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x17059
-			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x17059
-			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x17059
-			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x17059
-			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x17059
-			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x17059
-			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x17059
-		>;
-	};
-
-	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-		fsl,pins = <
-			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x100b9
-			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x170b9
-			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x170b9
-			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x170b9
-			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x170b9
-			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x170b9
-			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x170b9
-			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x170b9
-			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x170b9
-			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x170b9
-		>;
-	};
-
-	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
-		fsl,pins = <
-			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x100f9
-			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x170f9
-			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x170f9
-			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x170f9
-			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x170f9
-			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x170f9
-			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x170f9
-			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x170f9
-			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x170f9
-			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x170f9
-		>;
-	};
-};
-
-&pxp {
-	status = "okay";
-};
-
-&sai2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_sai2>;
-	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
-			  <&clks IMX6UL_CLK_SAI2>;
-	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
-	assigned-clock-rates = <0>, <12288000>;
-	fsl,sai-mclk-direction-output;
-	status = "okay";
-};
-
-&snvs_poweroff {
-	status = "okay";
-};
-
-&tsc {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_tsc>;
-	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
-	measure-delay-time = <0xffff>;
-	pre-charge-time = <0xfff>;
-	status = "okay";
-};
-
-&uart2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
-	uart-has-rtscts;
-	status = "okay";
-};
-
-&usdhc2 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc2>;
-	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
-	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
-	bus-width = <8>;
-	no-1-8-v;
-	non-removable;
-	keep-power-in-suspend;
-	wakeup-source;
-	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
new file mode 100644
index 0000000000000..ba482a97623b2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Support for Variscite VAR-SOM-6UL module with imx6ull CPU
+ *
+ * Copyright 2019-2024 Variscite Ltd.
+ * Copyright 2026 Dimonoff
+ */
+
+#include "imx6ull.dtsi"
+#include "imx6ul-var-som-common.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL module";
+	compatible = "variscite,var-som-imx6ull", "fsl,imx6ull";
+};
-- 
2.47.3

