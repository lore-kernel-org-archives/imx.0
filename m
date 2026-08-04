Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772CD4749EE
	for <imx@lists.linux.dev>; Tue,  4 Aug 2026 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860629; cv=none; b=oEOqZN9gmnCtY1mJqrys7rDnyeUdAe4Hv7lkcKYhVpZk5ye9OCsKyyfC0HS88kC32FYpCC78EHD3XBghy8Kkax64pAIX0ho5ha+Oz1QG/o7BJIBmPgx7X25RNktgs6i4L/09KwbMeo4KPuzOKRqpLWdT57RhzavzH2J9EZL4ICQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860629; c=relaxed/simple;
	bh=yaZiCbWGSWxhhccKCtBwQmfieRCuMFAgYSqim538X0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WmTheG2wA+eGbDdV0cDpcwootK4ncOCruKVfA08xtzRI2zJkr1YkNpifohfJWtyPlQmWHaNzGDBcVqlqy5X9QiiGzMsvhhx0ykP1f7RMKCQDU9runGsc49ljZigDs5QE2mEPTMPyQUsmcfkvDS7MRaHQsdanBhdOh2wWKBkeLw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=J2QCvL6B; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="J2QCvL6B"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAF211195E2;
	Tue, 04 Aug 2026 18:23:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785860621; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=h3lXd5j+BcKsbAsXQUhvmjCC7vgStNH8ne0hUP3sU8o=;
	b=J2QCvL6BfyE0PW1dqhUhERndQajeZSokf1owN9Q0Jbfwdb98WxyIKKU7XhfksdIbSood0g
	SJcWFN/91502NypK3CjnosQjcf9Ey6tFGT0htCa89TUcAx39dmCcXTFP/jDisfo6DMin9J
	T2lkLu8k6O4Pn/Ew4evlhUDJCBsuygzt/RGuaMPc8mcZd9M4EP2V5JrxA3JtIqwF5eQOeh
	Kt5XnXQ2Iyu9nQmu2lTS1bST2I8xhVCLBTwubUnpzg1P2iW+3hKOVuFsNEMT3qKYudW/+R
	Aczoy+lbbXi3NARlOgnh5JoT81GU/ozxk7lTqeqdxJF50i/4LLEFB4dvd+HlXg==
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
Subject: [PATCH v9 6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Date: Tue,  4 Aug 2026 18:22:50 +0200
Message-ID: <20260804162310.24374-6-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804162310.24374-1-marex@nabladev.com>
References: <20260804162310.24374-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1
providing additional UARTs, CAN, PWM Beeper, I2C, SPI and GPIO breakout.
This adapter can be optionally populated onto the eDM SBC.

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
V4: Rebase on next-20260703
V5: No change
V6: Move compatible and reg properties to the beginning of gpio_feature: io-expander@20 { } node
V7: No change
V8: No change
V9: No change
---
 arch/arm64/boot/dts/freescale/Makefile        | 12 ++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi | 69 +++++++++++++++++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso | 59 ++++++++++++++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso | 46 +++++++++++++
 4 files changed, 186 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 5689c461ede81..c23be9fc3a224 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -124,6 +124,10 @@ imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
 	imx8mm-data-modul-edm-sbc.dtb \
 	imx8mm-data-modul-edm-sbc-overlay-cm4.dtbo
 
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo
+
 imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
 	imx8mm-data-modul-edm-sbc.dtb \
 	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
@@ -163,6 +167,8 @@ imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900-dtbs := \
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-cm4.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-cm4.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
@@ -347,6 +353,10 @@ imx8mp-data-modul-edm-sbc-overlay-cm7-dtbs := \
 	imx8mp-data-modul-edm-sbc.dtb \
 	imx8mp-data-modul-edm-sbc-overlay-cm7.dtbo
 
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo
+
 imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
 	imx8mp-data-modul-edm-sbc.dtb \
 	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
@@ -430,6 +440,8 @@ imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902-dtbs := \
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-cm7.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-cm7.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi
new file mode 100644
index 0000000000000..905db21d57c21
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi
@@ -0,0 +1,69 @@
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
+};
+
+&ecspi2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	can_fio: can@0 {
+		compatible = "microchip,mcp2515";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		clocks = <&can_osc>;
+		spi-max-frequency = <5000000>;
+	};
+};
+
+&i2c_feature {	/* Feature connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	gpio_feature: io-expander@20 {
+		compatible = "nxp,pca9554";
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_expander>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"GPIO1_output", "GPIO1_input",
+			"GPIO2_output", "GPIO2_input",
+			"GPIO3_output", "GPIO3_input",
+			"PCA9511A_READY", "";
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+};
+
+&uart1 {	/* J500/J501 */
+	status = "okay";
+};
+
+&uart2 {	/* RS485 J302/J303 */
+	linux,rs485-enabled-at-boot-time;
+	uart-has-rtscts;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
new file mode 100644
index 0000000000000..ad410db5f5b76
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-pinfunc.h"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi"
+
+&{/} {
+	beeper {
+		compatible = "pwm-beeper";
+		beeper-hz = <1000>;
+		pwms = <&pwm3 0 250000 0>;
+	};
+};
+
+&can_fio {
+	interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&iomuxc {
+	pinctrl_can: can-feature-grp {
+		fsl,pins = <
+			/* CAN_INT# */
+			MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25		0x400000d6
+			/* CAN_RST# */
+			MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26		0x6
+		>;
+	};
+
+	pinctrl_gpio_expander: gpio-expander-feature-grp {
+		fsl,pins = <
+			/* GPIO4_IO27 */
+			MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27		0x6
+		>;
+	};
+
+	pinctrl_pwm3: pwm3-buzzer-feature-grp {
+		fsl,pins = <
+			/* Buzzer PWM output */
+			MX8MM_IOMUXC_SPDIF_TX_PWM3_OUT			0x100
+		>;
+	};
+};
+
+&pinctrl_hog_feature {
+	fsl,pins = <
+		/* GPIO5_IO04 */
+		MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4			0x6
+	>;
+};
+
+&pwm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm3>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
new file mode 100644
index 0000000000000..0eccb7f7c0a8c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-pinfunc.h"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi"
+
+&can_fio {
+	interrupts-extended = <&gpio2 10 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&iomuxc {
+	pinctrl_can: can-feature-grp {
+		fsl,pins = <
+			/* CAN_INT# */
+			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10		0x400000d6
+		>;
+	};
+
+	pinctrl_gpio_expander: gpio-expander-feature-grp {
+		fsl,pins = <
+			/* GPIO4_IO27 */
+			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27		0x6
+		>;
+	};
+};
+
+&pinctrl_sai2 {
+	fsl,pins = <
+		MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_SYNC	0xd6
+		MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI2_TX_DATA00	0xd6
+		MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI2_TX_BCLK	0xd6
+	>;
+};
+
+&pinctrl_hog_feature {
+	fsl,pins = <
+		/* GPIO5_IO03 */
+		MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07		0x40000006
+		/* GPIO5_IO04 */
+		MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08		0x40000006
+	>;
+};
-- 
2.53.0

