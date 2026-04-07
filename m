Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8434137C91A
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 21:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775596740; cv=none; b=CJZ+JBVLfJsbk5W2/05L4h48jWlYYvlZBJJ07cqy0Y4DhTvENrij/TdS4uzbC2r8YEYW2UVRML6tDcvogp5PiO0ZfheY00uCJmVpatJ24qXc3AR1ZejWkVHaqH8eT8qI2NaL38Fm9iITYZRUYwa5Udv2kXh3fXI6XcuIjuuLM/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775596740; c=relaxed/simple;
	bh=J6EWVxurceztpOBsxc5zZevaNL+OyTx8lfTxmxef0Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGcBfgKx4r3GvLtN2kfc0RCk1gK1m9VOOMIFELxWx+V0Nf76e4peqorQUiUOebj2uaIEMZD5j6V1j3G9QuFagFa5pt2twk40w1aOOfmWps+4qRE8ck00JJ100FzHc4hX4mSSyZhzmtJaqV3R+v31MOtbXjozq9w5UOdSNQPnwQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=RndNeFm/; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="RndNeFm/"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D7C2113407;
	Tue,  7 Apr 2026 23:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775596736; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=V09GZmRVkgobQ4KodWmzSPPlzuE3ztbAiUslccGT6Rw=;
	b=RndNeFm/mszwtXWMzwqNfhrG+JONZtP2BSBdOHtd95qdCOfMT2Q/NWdcvKQs/DJUuBkSuO
	iupTh/dDIci0VXgl2SL9yIXcx8EZDy8QliOi5mx7fcmCiyBNka7jYCjquFCgCCzpTZlTyV
	jjRZBbuQQnSBiaj/yScf/Eklbl1u8234GwW6m5JTq3/CPi9Csdu1tC6UQVvEhMHXoyNKzL
	ct0fbPL7DJ0rsJ9slA67z/e+5ZhLk4TYLcw7UrJrTPc1ShO8RT78vIW2C2o043EejnnCmZ
	U88qgJWn2VtueJCqoXS75CtI9D2KiMrSH67IaqmpXwzXl7tsrPUwhd3WmdU/dA==
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
Subject: [PATCH v3 3/6] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Date: Tue,  7 Apr 2026 23:17:29 +0200
Message-ID: <20260407211850.79881-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407211850.79881-1-marex@nabladev.com>
References: <20260407211850.79881-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT overlay for the DSI-to-HDMI adapter eDM-MOD-iMX8Mm-HDMI populated
with Lontium LT9611 bridge. This adapter can be optionally populated onto
the eDM SBC.

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
---
 arch/arm64/boot/dts/freescale/Makefile        | 12 +++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi | 94 +++++++++++++++++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso | 17 ++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso | 17 ++++
 4 files changed, 140 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 09ea330884ad4..679346cd35d95 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -116,6 +116,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
+
 imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01-dtbs := \
 	imx8mm-data-modul-edm-sbc.dtb \
 	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
@@ -149,6 +153,8 @@ imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900-dtbs := \
 	imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtb \
@@ -288,6 +294,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
 
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
+
 imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01-dtbs := \
 	imx8mp-data-modul-edm-sbc.dtb \
 	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
@@ -363,6 +373,8 @@ imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902-dtbs := \
 	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
new file mode 100644
index 0000000000000..c0f2aa462104f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&{/} {
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+};
+
+&i2c_display {	/* Display connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	lt9611_codec: hdmi-bridge@3b {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_expansion>;
+		compatible = "lontium,lt9611";
+		reg = <0x3b>;
+		vcc-supply = <&buck4_reg>;	/* X400 pin 55, +3V3_S0 */
+		vdd-supply = <&buck5_reg>;	/* X400 pin 51, +1V8_S0 */
+
+		/* Audio I2S not described */
+		#sound-dai-cells = <1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mipi_dsi_bridge1_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&iomuxc {
+	/* Free &pinctrl_panel_expansion from hog for lt9611_codec above */
+	pinctrl-0 = <&pinctrl_hog_misc>, <&pinctrl_hog_feature>,
+		    <&pinctrl_hog_panel>, <&pinctrl_hog_sbc>;
+};
+
+&mipi_dsi {
+	/* HDMI 148.5 MHz x2 (DDR) x3 (24bpp / 8) */
+	samsung,burst-clock-frequency = <891000000>;
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			mipi_dsi_bridge1_out: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				/* Clock and data lanes have DN/DP swapped */
+				lane-polarities = <1 1 1 1 1>;
+				remote-endpoint = <&lt9611_a>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
new file mode 100644
index 0000000000000..334ba299a3541
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi"
+
+&lt9611_codec {
+	interrupts-extended = <&gpio2 3 IRQ_TYPE_EDGE_FALLING>;
+	reset-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+};
+
+&lcdif {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
new file mode 100644
index 0000000000000..d8114fd869b54
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi"
+
+&lt9611_codec {
+	interrupts-extended = <&gpio4 19 IRQ_TYPE_EDGE_FALLING>;
+	reset-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
+};
+
+&lcdif1 {
+	status = "okay";
+};
-- 
2.53.0

