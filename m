Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982FB31619A
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 19:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774379047; cv=none; b=ZSqmVt5KYjH7l0RYiuZBM6ptWd7gy0XWAVsGP3+t6kdcZyPSyiBDEK0Tkxn6n8aUIunto09xhG918htrSkcxBoqypLDKsXK2MyRJjdZuHuTwQHLYVgncSTHuNXYU7jCNtii2Tk2wqcLgmphKiTvIABWLI72toeWAQ8LElMqA76s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774379047; c=relaxed/simple;
	bh=rr0QtRKZdikrkYJ4hikUXlopkVJJPmPU4w4s7bJv6cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aXtFlfBqxa50vgeCX7bfq++KdmprU+JNW32IDaQC1TC6cM4xuTGNUpyZ2INDQveP04VzmowaFmCPAs5VN7pxdVJU05k2lu9tHG/LI93AO+LawFRw3EkfG8o5TH9LjJE6BiCXg9nbfDQDUl682HoASMbSG/le8OV6vl1PIKyJMvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=U6Vkgc1O; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="U6Vkgc1O"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5FE5112201;
	Tue, 24 Mar 2026 20:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1774379042; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=LRK+Pbk+JcjIEgkJ8gJovXilJoSLfy1esd2Vmrus+/Y=;
	b=U6Vkgc1OrledZh7vrd+LEgH5Bf1pv5L/6rIB+B+Yirhmev7YoBWP9VjHeGAB+Uu0q+W2oz
	uHjnpNJMunYfhPCqCxkvA1ZLIPSiS3rO2OuoK8CDLZnFJ3jgjBIruDJBDzfeFvizFz/kQ+
	M8pameULZxpjuUy7KtoJe0fLFWuGhzlDrFm980z74HGDxNM3M0mLi7CT5fCAYS3Pjvc53y
	mrcKLM9iHU7DY4kJ55qHdjDvoysQYN0zj9WcAMUXzEHc7nRPH0uBgquBEBRZxD1FNFWFq8
	9VIYpojgArHAhqB5UQoc7y/30dTIgXnm+8mQnzagaKVrqic0TWHBN110pui0NA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: imx: Add DT overlays for DH i.MX6 DHCOM SoM and boards
Date: Tue, 24 Mar 2026 20:03:11 +0100
Message-ID: <20260324190356.74293-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT overlays to support DH i.MX6 DHCOM SoM carrier board expansion
modules. The following DT overlays are implemented:
- PDK2:
  - DH 497-200 Display board in edge connector X12
  - DH 505-200 Display board in edge connector X12
  - DH 531-100 SPI/I2C board in header X21
  - DH 531-200 SPI/I2C board in header X22
  - DH 560-200 Display board in edge connector X12
- PicoITX:
  - DH 626-100 Display board in edge connector X2

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: - Update copyright years
    - Sort compatible and reg
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 37 +++++++++
 ...l-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi | 75 +++++++++++++++++++
 .../imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi  | 61 +++++++++++++++
 ...mx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso | 28 +++++++
 ...-pdk2-overlay-505-200-x12-ch101olhlwh.dtso | 26 +++++++
 ...mx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso | 32 ++++++++
 ...mx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso | 32 ++++++++
 ...mx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso | 39 ++++++++++
 ...icoitx-overlay-626-100-x2-ch101olhlwh.dtso |  8 ++
 .../boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi   |  6 +-
 10 files changed, 341 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index de4142e8f3ce8..856c9f21bd703 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -58,6 +58,31 @@ dtb-$(CONFIG_SOC_IMX53) += \
 	imx53-voipac-bsb.dtb
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
+
+imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
+	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
+
+imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh-dtbs := \
+	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtbo
+
+imx6qdl-dhcom-pdk2-overlay-531-100-x21-dtbs := \
+	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtbo
+
+imx6qdl-dhcom-pdk2-overlay-531-100-x22-dtbs := \
+	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtbo
+
+imx6qdl-dhcom-pdk2-overlay-560-200-x12-dtbs := \
+	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtbo
+
+imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh-dtbs := \
+	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtbo
+
 dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-alti6p.dtb \
 	imx6dl-apf6dev.dtb \
@@ -179,6 +204,18 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-cubox-i-som-v15.dtb \
 	imx6q-dfi-fs700-m60.dtb \
 	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtb \
+	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo \
+	imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtb \
+	imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtbo \
+	imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtb \
+	imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtbo \
+	imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtb \
+	imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtbo \
+	imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtb \
+	imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtbo \
+	imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtb \
+	imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtbo \
 	imx6q-display5-tianma-tm070-1280x768.dtb \
 	imx6q-dmo-edmqmx6.dtb \
 	imx6q-dms-ba16.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi
new file mode 100644
index 0000000000000..90259785126ba
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx6qdl-dhcom-overlay-panel-dpi.dtsi"
+
+&{/} {
+	lvds-encoder {
+		compatible = "onnn,fin3385", "lvds-encoder";
+		pclk-sample = <1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_bridge_in: endpoint {
+					remote-endpoint = <&ipu1_dpi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lvds_bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+};
+
+&display_bl {
+	pwms = <&pwm1 0 5000000 0>;
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <16384>;
+		touchscreen-size-y = <9600>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&ipu1_dpi0_out {
+	remote-endpoint = <&lvds_bridge_in>;
+};
+
+&panel {
+	compatible = "chefree,ch101olhlwh-002";
+};
+
+&panel_in {
+	remote-endpoint = <&lvds_bridge_out>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi
new file mode 100644
index 0000000000000..48d346b6b484b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021-2026 Marek Vasut
+ */
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	display_bl: display-bl {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 16 22 30 40 55 75 102 138 188 255>;
+		default-brightness-level = <8>;
+		enable-gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+
+	lcd_display: disp0 {
+		compatible = "fsl,imx-parallel-display";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interface-pix-fmt = "rgb24";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ipu1_lcdif>;
+		status = "okay";
+
+		port@0 {
+			reg = <0>;
+
+			ipu1_display_in: endpoint {
+				remote-endpoint = <&ipu1_di0_disp0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			ipu1_dpi0_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+
+	panel: panel {
+		backlight = <&display_bl>;
+
+		port {
+			panel_in: endpoint {
+			};
+		};
+	};
+};
+
+&ipu1_di0_disp0 {
+	remote-endpoint = <&ipu1_display_in>;
+};
+
+&pwm1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso
new file mode 100644
index 0000000000000..a5cb77b351af9
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx6qdl-dhcom-overlay-panel-dpi.dtsi"
+
+&display_bl {
+	pwms = <&pwm1 0 50000 PWM_POLARITY_INVERTED>;
+};
+
+&ipu1_dpi0_out {
+	remote-endpoint = <&panel_in>;
+};
+
+&panel {
+	compatible = "dataimage,scf0700c48ggu18";
+};
+
+&panel_in {
+	remote-endpoint = <&ipu1_dpi0_out>;
+};
+
+&touch_som {	/* TSC2004 */
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
new file mode 100644
index 0000000000000..3e02031b74d0c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi"
+
+&{/} {
+	gpio-keys {
+		/* BUTTON1 GPIO-B conflicts with touchscreen reset */
+		button-1 {
+			/* Use status as /delete-node/ does not work in DTOs */
+			status = "disabled";
+		};
+	};
+
+	led {
+		/* LED7 GPIO-H conflicts with touchscreen IRQ */
+		led-7 {
+			/* Use status as /delete-node/ does not work in DTOs */
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso
new file mode 100644
index 0000000000000..84a498833674d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&ecspi1 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@1 {
+		compatible = "microchip,25aa010a", "atmel,at25";
+		reg = <1>;
+		address-width = <8>;
+		pagesize = <16>;
+		size = <128>;
+		spi-max-frequency = <5000000>;
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@56 {
+		compatible = "atmel,24c04";
+		reg = <0x56>;
+		pagesize = <16>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso
new file mode 100644
index 0000000000000..9ff0771c6abf9
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&ecspi2 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@0 {
+		compatible = "microchip,25aa010a", "atmel,at25";
+		reg = <0>;
+		address-width = <8>;
+		pagesize = <16>;
+		size = <128>;
+		spi-max-frequency = <5000000>;
+	};
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@56 {
+		compatible = "atmel,24c04";
+		reg = <0x56>;
+		pagesize = <16>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso
new file mode 100644
index 0000000000000..9f5814e7a04f2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx6qdl-dhcom-overlay-panel-dpi.dtsi"
+
+&display_bl {
+	pwms = <&pwm1 0 50000 PWM_POLARITY_INVERTED>;
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dhcom_e>;
+		/* Touchscreen IRQ GPIO-E conflicts with LED5 GPIO */
+		interrupt-parent = <&gpio4>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>; /* GPIO E */
+	};
+};
+
+&ipu1_dpi0_out {
+	remote-endpoint = <&panel_in>;
+};
+
+&panel {
+	compatible = "edt,etm0700g0edh6";
+};
+
+&panel_in {
+	remote-endpoint = <&ipu1_dpi0_out>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso
new file mode 100644
index 0000000000000..5c380572c4092
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi
index af0d95396cd51..74dfb92f15147 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Copyright (C) 2015-2021 DH electronics GmbH
- * Copyright (C) 2018 Marek Vasut <marex@denx.de>
+ * Copyright (C) 2015-2026 DH electronics GmbH
+ * Copyright (C) 2018-2026 Marek Vasut
  */
 
 #include <dt-bindings/pwm/pwm.h>
@@ -303,7 +303,7 @@ ldo2_reg: ldo2 {
 		};
 	};
 
-	touchscreen@49 { /* TSC2004 */
+	touch_som: touchscreen@49 { /* TSC2004 */
 		compatible = "ti,tsc2004";
 		interrupts-extended = <&gpio4 14 IRQ_TYPE_EDGE_FALLING>;
 		pinctrl-0 = <&pinctrl_tsc2004>;
-- 
2.53.0

