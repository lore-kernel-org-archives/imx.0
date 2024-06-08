Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3091BDDB
	for <imx@lists.linux.dev>; Sat,  8 Jun 2024 18:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717869916; cv=none; b=lsYwhAYkMuDTsgQzd8+e6ofhgIvfpTnBH3eSlzhGGkiQUrbFZDW1Ql5mgu7YzT/akxMZkpM+dgu50S9ln4nPnK5dujegeoo6VEqcAtvuazkCcYQpLwcE4TaIz9sg0JhFD48uksx8Rm22TKnzE7fbJ8EKAe8H4eHa1cEeIuZqhdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717869916; c=relaxed/simple;
	bh=b+vbyorzjSQbO3fn1Wf8E0LpPAA6jF3pd3Edxag4UBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hTZj8BH84ehVw9i2f7tqjAbEO13RmNrdtMCbj/I0jLXtz0xAJ4VdxKNPt5xAAOCRK4cjPtRHSFjQodwT2aL0VyRR6J29JBC9HaI4sqanHRGGSGeRU1kiLYBk5XlZmQvzsxXJwhGitpzovDeXfui+LRLOBMgkt5Js6XuFdO3ZULA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Owvkf74T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Owvkf74T"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 936FF4CA;
	Sat,  8 Jun 2024 20:05:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717869900;
	bh=b+vbyorzjSQbO3fn1Wf8E0LpPAA6jF3pd3Edxag4UBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Owvkf74Tx+qQV2jaOFHSnn57BMVu93AaY6uk050iPoPQwOd8GShVSS/ZgGOMO8W9a
	 UpYe/zD4abBWu0tfmC/mAmR7Cw5hDYVo/HVO/aWcdGrcD/T1Br3zVBiwSr9cpFJCSG
	 vXCzts3izFj4IuoGxzFgA5ycCRaJ5q1j+JbL9t1Y=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Marco Contenti <marco.c@variscite.com>,
	Nate Drude <nate.d@variscite.com>,
	FrancescoFerraro <francesco.f@variscite.com>,
	Harshesh Valera <harshesh.v@variscite.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v3 4/4] arm64: dts: freescale: Add panel overlay for Variscite DART
Date: Sat,  8 Jun 2024 21:04:47 +0300
Message-ID: <20240608180447.31378-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240608180447.31378-1-laurent.pinchart@ideasonboard.com>
References: <20240608180447.31378-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DT overlay for the Variscite i.MX8MP DT8MCustomBoard that models
the GKTW70SDAE4SE LVDS panel found in the evaluation kit.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Move Makefile changes to the right location
---
 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 .../imx8mp-var-dart-panel-gktw70sdae4se.dtso  | 99 +++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index e179cdd364a9..9812aa2e4bcd 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -197,8 +197,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
 
 imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
 imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
+imx8mp-var-dart-panel-gktw70sdae4se-dtbs := imx8mp-var-dart-dt8mcustomboard-v2.dtb imx8mp-var-dart-panel-gktw70sdae4se.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-panel-gktw70sdae4se.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso
new file mode 100644
index 000000000000..d5f61e157bc2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2020-2021 Variscite Ltd.
+ * Copyright 2023 Ideas on Board Oy
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm1 0 1000000 0>;
+	};
+
+	panel {
+		compatible = "sgd,gktw70sdae4se", "panel-lvds";
+		backlight = <&backlight>;
+		width-mm = <153>;
+		height-mm = <87>;
+		label = "gktw70sdae4se";
+		data-mapping = "jeida-24";
+
+		panel-timing {
+			clock-frequency = <29232000>;
+			hactive = <800>;
+			vactive = <480>;
+			hback-porch = <40>;
+			hfront-porch = <40>;
+			vback-porch = <29>;
+			vfront-porch = <13>;
+			hsync-len = <48>;
+			vsync-len = <3>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+		};
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	touch@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+
+		reset-gpios = <&gpio_exp_2 4 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-source;
+
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+	};
+};
+
+&lcdif2 {
+	/*
+	 * The pixel clock should be configured by the lcdif driver, but the
+	 * clock frequency propagation in the clock framework stops at the PIX2
+	 * clock and doesn't reach the VIDEO_PLL1 clock. As a workaround, set
+	 * the VIDEO_PLL1 rate manually.
+	 *
+	 * For a 60Hz refresh rate, the panel requires a pixel clock of 29.232
+	 * MHz. The LVDS clock frequency is 7 times higher, or 204.624 MHz.
+	 */
+	assigned-clock-rates = <0>, <204624000>;
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_in>;
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14				0x16
+		>;
+	};
+};
-- 
Regards,

Laurent Pinchart

