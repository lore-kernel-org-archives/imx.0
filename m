Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EF13CB56C
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182000; cv=none; b=St+FeIt6PMccy8GJUdDd+4q0OeFBGHDEE4pUsiQiTktEQsJy62m9pARufbgIgHAbpKE/+u5zkYGjjLZ5ugZHjIDUl+w9NFRCf58ono3zRIjDQhCJxLPYo3sJE7YuFj81PoCywfloXSHKBUyAmUCd0sQWIQ0MLQppFRojt3D57f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182000; c=relaxed/simple;
	bh=/z0LhbF0E5JkQhchpWJWWS+JSdR5uzKwrqJ6Qm0GYpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDepO+jxMzJLkTxp8t6R3+TgEerzVAChu27nlxseg5wDYk/b0/C90tEhg5Tnu0SatEjPsnebd+Suk4T4r2nJfWSbZaY4D47/oWXkcQq5J/0Ps1WOn1WANbvguN2aOrDlNVmt7WoHlL170yYVw6rJ65fU+sG3qAaaxdrfC4D78sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=OHMSQT8w; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="OHMSQT8w"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6911C1190A8;
	Mon, 27 Jul 2026 21:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785181991; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=RHD3V5CYCLImrNY+O1UECCNLG3MEF7p1k7Eb+bK0g8o=;
	b=OHMSQT8wmgxiMLDAvcKg6HoPhKljDar4RMWdu3z21tOIYuuKNn6+FKtm/+XLEyJ8q/Cnjo
	JDRzLtXRvC5A/WBHokbHkm+sVOFNigaTSrESJRoNaNJWN8fLgkFum6kpF322QCPrO5V4ZU
	IujTjotRgpi8xnYyZalIo5hITOUEMdOvA+Xpjtxd/vT9vyq8lw1mejjyiJwM/r1ekDnlcZ
	eZAW4F0dSSaD5GY+t1tmagEI9cpwM/5WH+d6QYcEBAXqj/eZ5vPyCU9vkcJ17jYSIfVxsj
	VgEmfB6alHmdGbrHgrsi1zHmjht00winJz0UMpCaOSCBvSV6eQvtaHBV9svdRw==
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
Subject: [PATCH v6 4/7] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Date: Mon, 27 Jul 2026 21:52:19 +0200
Message-ID: <20260727195244.78199-4-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727195244.78199-1-marex@nabladev.com>
References: <20260727195244.78199-1-marex@nabladev.com>
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
V4: Rebase on next-20260703
V5: No change
V6: Move compatible and reg properties to the beginning of lt9611_codec: hdmi-bridge@3b {} node
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
index 28fb374bacb22..5db524708aaf1 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -120,6 +120,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
+
 imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01-dtbs := \
 	imx8mm-data-modul-edm-sbc.dtb \
 	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
@@ -153,6 +157,8 @@ imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900-dtbs := \
 	imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtb \
@@ -296,6 +302,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
 
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
+
 imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01-dtbs := \
 	imx8mp-data-modul-edm-sbc.dtb \
 	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
@@ -371,6 +381,8 @@ imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902-dtbs := \
 	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
new file mode 100644
index 0000000000000..59f15d5a33a28
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
+		compatible = "lontium,lt9611";
+		reg = <0x3b>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_expansion>;
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

