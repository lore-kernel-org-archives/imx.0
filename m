Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A71F50A
	for <imx@lists.linux.dev>; Wed, 25 Oct 2023 16:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r5nGp8M4"
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAEF91010;
	Wed, 25 Oct 2023 18:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698252644;
	bh=Vstx2/uLnLoK3+ATkIxZe9Jtui8pXM6YKsGUNqaLrb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r5nGp8M4wV+kZ94TOPY3zt38Kq4MvhrSQz62C5cYIcvBW/lEixjPqD6fjdiirIGkk
	 3oCCQcoDNxSWP9nT+QBdz3o5BuCtjWnIhVHxAVY/pYlNmaCBYwPVWwjARpz7Akva5z
	 581j8QjqG5wHXwDC7AZVyRTGHH589DfCcCIFz+4k=
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
	Harshesh Valera <harshesh.v@variscite.com>
Subject: [PATCH v2 4/4] arm64: dts: freescale: Add panel overlay for Variscite DART
Date: Wed, 25 Oct 2023 19:50:58 +0300
Message-ID: <20231025165058.31697-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025165058.31697-1-laurent.pinchart@ideasonboard.com>
References: <20231025165058.31697-1-laurent.pinchart@ideasonboard.com>
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
 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 .../imx8mp-var-dart-panel-gktw70sdae4se.dtso  | 99 +++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 19637302397f..20514cb1c505 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -150,6 +150,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 
+imx8mp-var-dart-panel-gktw70sdae4se-dtbs := imx8mp-var-dart-dt8mcustomboard-v2.dtb imx8mp-var-dart-panel-gktw70sdae4se.dtbo
 imx8mm-venice-gw72xx-0x-imx219-dtbs	:= imx8mm-venice-gw72xx-0x.dtb imx8mm-venice-gw72xx-0x-imx219.dtbo
 imx8mm-venice-gw72xx-0x-rpidsi-dtbs	:= imx8mm-venice-gw72xx-0x.dtb imx8mm-venice-gw72xx-0x-rpidsi.dtbo
 imx8mm-venice-gw72xx-0x-rs232-rts-dtbs	:= imx8mm-venice-gw72xx-0x.dtb imx8mm-venice-gw72xx-0x-rs232-rts.dtbo
@@ -162,6 +163,7 @@ imx8mm-venice-gw73xx-0x-rs422-dtbs	:= imx8mm-venice-gw73xx-0x.dtb imx8mm-venice-
 imx8mm-venice-gw73xx-0x-rs485-dtbs	:= imx8mm-venice-gw73xx-0x.dtb imx8mm-venice-gw73xx-0x-rs485.dtbo
 imx8mp-venice-gw74xx-rpidsi-dtbs	:= imx8mp-venice-gw74xx.dtb imx8mp-venice-gw74xx-rpidsi.dtbo
 
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-panel-gktw70sdae4se.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw72xx-0x-imx219.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw72xx-0x-rpidsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw72xx-0x-rs232-rts.dtb
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

