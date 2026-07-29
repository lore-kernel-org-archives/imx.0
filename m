Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA28C433E9E
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 21:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361696; cv=none; b=K2Yaqk360j4IpVns1YaCL6+s2VLir+gftdRbw6gDIW9RfCS/o1COaBTQ7hvb6GxMw7vR6wCkUl3mf/dgbKDzPnj5HhC2SwzHlIHhKiQzDBVNmo2zF1GcELztGj2U4rnmajz1xWgwZnwj03bzeXLSod87lrErJq4/Sh/Yg3fyOvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361696; c=relaxed/simple;
	bh=93WAmXkWXkrADa0Eb3ucQNRmNnxU3vYqDdaP3skk9Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9ygJhngaSCwAoeLAxlY+Sky60fvyHP6/0kR9UrSUwUC7YXShb21+8ul7Da+mOJuf64bqYGudF38hH5BKkxKvyMtK6AV5Ua9AVzSGlkQ3yWl9znqSmCg2PMqLgL7TV8ZXE5FI9GukQ6h/oqeYDPnddMZLEkUHM20jt6rTRTOxEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Ir7iWdwz; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Ir7iWdwz"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FF2211B734;
	Wed, 29 Jul 2026 23:48:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785361683; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=JgHg6qrFNc1c7ZMG57/Glpi5JaQA1CEgr4dBGID5k5Q=;
	b=Ir7iWdwzEc6wKxsbuSSY/cb48fgsdiUi4r/rA0iai/ZzoJQNr5axMFFWrKU7wUF02JNbKh
	5PcZllkT4HjKRi6NNfetTERTCE/HT2fbuef81w16ugUvsXfzxabUVpIL4Ztk0Vs5oQI9qv
	SkJ2FCUGKYhDFZTddGRFTWyUmy/ZG77rMYWEmI04/b9lmsU4NxCUvNM/zWLMH6yfCebTRU
	MQcOfY5rqgrglFhehE72ykJwoSrrmWaaSsbNkslpmetpI+OLefOkCRsJaMRDT5ODvyltEH
	2GOnoCW3MQZHoaVn2mlmFoJ3twIl3bdCMAUPllg+g/SSP48gGMVZpSemguElDA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Date: Wed, 29 Jul 2026 23:47:16 +0200
Message-ID: <20260729214723.557461-7-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729214723.557461-1-marex@nabladev.com>
References: <20260729214723.557461-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1-Audio
providing additional UARTs, CAN, PWM Beeper, I2C, SPI, GPIO breakout and
SGTL5000 codec. This adapter can be optionally populated onto the eDM SBC.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Deduplicate the DTOs further
V3: New patch split from the original megapatch
V4: Rebase on next-20260703, drop dependency links which have all landed now
V5: No change
V6: Move compatible and reg properties to the beginning of sgtl5000_fio: codec@a {} node
V7: No change
---
 arch/arm64/boot/dts/freescale/Makefile        |  12 +++
 ...sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi | 101 ++++++++++++++++++
 ...sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso |  74 +++++++++++++
 ...sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso |  62 +++++++++++
 4 files changed, 249 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c23be9fc3a224..8800b35a63eb5 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -128,6 +128,10 @@ imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-dtbs := \
 	imx8mm-data-modul-edm-sbc.dtb \
 	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo
 
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtbo
+
 imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
 	imx8mm-data-modul-edm-sbc.dtb \
 	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
@@ -169,6 +173,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-cm4.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
@@ -357,6 +363,10 @@ imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-dtbs := \
 	imx8mp-data-modul-edm-sbc.dtb \
 	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo
 
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtbo
+
 imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
 	imx8mp-data-modul-edm-sbc.dtb \
 	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
@@ -442,6 +452,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-cm7.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
new file mode 100644
index 0000000000000..01cf5c89dbff4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&{/} {
+	can_osc: can-osc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <20000000>;
+	};
+
+	sound-fio {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "SGTL5000-FIO1";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&codec_dai_fio>;
+		simple-audio-card,frame-master = <&codec_dai_fio>;
+		simple-audio-card,widgets = "Headphone", "Headphone Jack";
+		simple-audio-card,routing = "Headphone Jack", "HP_OUT";
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		codec_dai_fio: simple-audio-card,codec {
+			sound-dai = <&sgtl5000_fio>;
+		};
+	};
+};
+
+&ecspi2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	can_fio: can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		clocks = <&can_osc>;
+		spi-max-frequency = <10000000>;
+	};
+};
+
+&i2c_feature {	/* Feature connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sgtl5000_fio: codec@a {
+		compatible = "fsl,sgtl5000";
+		reg = <0x0a>;
+		#sound-dai-cells = <0>;
+		clocks = <&sai5clk 1>;
+		VDDA-supply = <&buck4_reg>;
+		VDDD-supply = <&buck5_reg>;
+		VDDIO-supply = <&buck4_reg>;
+	};
+
+	gpio_feature: io-expander@20 {
+		compatible = "nxp,pca9554";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio5>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"GPI0", "GPI1", "GPI2", "GPI3",
+			"GPO0", "GPO1", "GPO2", "GPO3";
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clock-rates = <24576000>;
+	fsl,sai-asynchronous;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&uart2 {	/* RS422 J12 */
+	linux,rs485-enabled-at-boot-time;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* UART4 is blocked by RDC and used as CM4 console UART */
+&uart4 {	/* UART to 1-Wire J5 */
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
new file mode 100644
index 0000000000000..4a02bd026ac16
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mm-clock.h>
+
+#include "imx8mm-pinfunc.h"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi"
+
+&can_fio {
+	interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&iomuxc {
+	pinctrl_codec_mclk: codec-mclk_feature-grp {
+		fsl,pins = <
+			/* GPIO4_IO27 */
+			MX8MM_IOMUXC_SAI2_MCLK_SAI5_MCLK		0x2
+		>;
+	};
+
+	pinctrl_sai2: sai2_feature-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_RXC_SAI2_RX_BCLK		0x90
+			MX8MM_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0		0x96
+			MX8MM_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0		0x90
+			MX8MM_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC		0x96
+		>;
+	};
+};
+
+&pinctrl_hog_feature {
+	fsl,pins = <
+		/* GPIO5_IO03 */
+		MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3				0x40000006
+		/* GPIO5_IO04 */
+		MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4				0x40000006
+
+		/* CAN_INT# */
+		MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25			0x40000090
+	>;
+};
+
+&sai2 {
+	assigned-clocks = <&clk IMX8MM_CLK_SAI2>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	fsl,sai-bit-clock-swap;
+};
+
+&spba2 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	sai5clk: clock-controller@30050000 {	/* SAI5 */
+		compatible = "fsl,imx8mm-sai-clock", "fsl,imx8mq-sai-clock";
+		reg = <0x30050000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX8MM_CLK_SAI5_IPG>,
+			 <&clk IMX8MM_CLK_SAI5_ROOT>;
+		clock-names = "bus", "mclk1";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_codec_mclk>;
+		assigned-clocks = <&clk IMX8MM_CLK_SAI5>,
+				  <&clk IMX8MM_CLK_CLKOUT1_SEL>,
+				  <&clk IMX8MM_CLK_CLKOUT2_SEL>;
+		assigned-clock-parents = <&clk IMX8MM_CLK_24M>,
+					 <&clk IMX8MM_CLK_24M>,
+					 <&clk IMX8MM_CLK_24M>;
+		assigned-clock-rates = <24000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
new file mode 100644
index 0000000000000..90c2dd1e67248
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+#include "imx8mp-pinfunc.h"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi"
+
+&can_fio {
+	interrupts-extended = <&gpio2 10 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&iomuxc {
+	pinctrl_codec_mclk: codec-mclk_feature-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_MCLK__AUDIOMIX_SAI5_MCLK	0xd6
+		>;
+	};
+
+	sai2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI2_TX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI2_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI2_RX_DATA00	0xd6
+		>;
+	};
+
+	uart1-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__UART1_DCE_TX		0x49
+			MX8MP_IOMUXC_SD1_CMD__UART1_DCE_RX		0x49
+			MX8MP_IOMUXC_SD1_DATA1__UART1_DCE_CTS		0x49
+		>;
+	};
+};
+
+&sai2 {
+	assigned-clocks = <&clk IMX8MP_CLK_SAI2>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL2_OUT>;
+};
+
+&spba5 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	sai5clk: clock-controller@30c50000 {
+		compatible = "fsl,imx8mp-sai-clock", "fsl,imx8mq-sai-clock";
+		reg = <0x30c50000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
+			 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>;
+		clock-names = "bus", "mclk1";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_codec_mclk>;
+		status = "okay";
+	};
+};
-- 
2.53.0

