Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1347E394EB7
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 06:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469321; cv=none; b=qTle4HD+ulqYJRpgqL6RB0/5+8dRufB1dibY3HPd35KlER6+dc0SFPRCyPfpjTWN3FZT4i5OdRfkB72DhP+KBfYnK1SBCCSL4CspKkFcxIOYZMOi6CuH9+AVT0R0yOsHhwWxQpexoQrnzbqYoN+26nUJMEnngHamNt0vyYujaio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469321; c=relaxed/simple;
	bh=R6mYurVSngnDC42d0BRjIhMQ+eUy9yfltEFAqUJDvVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gj43hyrnFfWZHsDvSTj/r+JdYrayfHEfx/Gj9R5Scgk8T2PQYBRsEnkaJlJlOyIW3PZlM3gcJ0+J3ABsalDQueKhibH6W7P7rGS9pVPJgW5RudQxJ1H12Um7qIYrDFIIU7EAMRCECSnz1VwmdeD3CCpnjQ3vyJNiwq6R59lQblM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=Xa55WF9p; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="Xa55WF9p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dbX87z8LjPJwQt55Q5pDLHPc+DkK4Jni9A43QZIbxnk=; b=Xa55WF9p5Oja3fEwvjBjL+hgxr
	p2b9jhSDVWiE/Ig+Rs2H6HQZ65AnMMPbI6TIFsGZEOIR+rSz5nas0fpKXtIWwuC2MMbXV/ZZ6fm8V
	avPmC5j+84WHT60jNFWxpQDfdhBappDEmzOBBzKyR7BT7laWwmkAC3oEAtKXVqn/HLZMTNrjz6v6U
	mN5ysrSrfQII2OFtzIpc2QqjPQZ7KR2eEtjvkA/kix6VRiFNt5iw2eFLzJJBeclErZnFVkUy+i3Wv
	0fH9k3IEiHUxtH5Jf8AUNzqdlFXyQ9GzxqBkvm1FvPbYe5fo7wQH7mWJ6FCsSI1b+dI6mgCAs8PEK
	rjjtEgLg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:48996 helo=florijan-nb..)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <florijan.plohl@norik.com>)
	id 1wUeuu-00000009fV2-32RJ;
	Wed, 03 Jun 2026 08:17:28 +0200
From: Florijan Plohl <florijan.plohl@norik.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v3] arm64: dts: imx{91,93}-phyboard-segin: Add peb-av-18 overlays
Date: Wed,  3 Jun 2026 08:15:01 +0200
Message-ID: <20260603061726.2908262-1-florijan.plohl@norik.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: florijan.plohl@norik.com
X-Authenticated-Sender: cp2.siel.si: florijan.plohl@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add overlay for the PHYTEC Audio/Video adapter module PEB-AV-18 on
phyBOARD-Segin-i.MX91/93 boards. The supported AC220 display is
Powertip PH800480T032-ZHC19 panel with a backlight and Ilitek
touch-screen controller.

Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
---
Changes in v3:
- Link to v2: https://lore.kernel.org/all/20260409090432.130489-1-florijan.plohl@norik.com/
- rebase on top of v7.1-rc6

Changes in v2:
- Link to v1: https://lore.kernel.org/all/20260402070826.970012-1-florijan.plohl@norik.com/
- Improve commit message to clarify what PEB-AV-18 is
- Move imx91-phyboard-segin-peb-av-18 dtb entry next to
  the other imx91 phyboard-segin definition in Makefile
- Introduce common imx91-93-phyboard-segin-peb-av-18.dtsi
- Adjust drive-strength values

 arch/arm64/boot/dts/freescale/Makefile        |  6 ++
 .../imx91-93-phyboard-segin-peb-av-18.dtsi    | 93 +++++++++++++++++++
 .../imx91-phyboard-segin-peb-av-18.dtso       | 57 ++++++++++++
 .../imx93-phyboard-segin-peb-av-18.dtso       | 57 ++++++++++++
 4 files changed, 213 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-93-phyboard-segin-peb-av-18.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c99..e87cf999e0a5 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -442,6 +442,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
+
+imx91-phyboard-segin-peb-av-18-dtbs += imx91-phyboard-segin.dtb imx91-phyboard-segin-peb-av-18.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin-peb-av-18.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
 
 imx91-tqma9131-mba91xxca-lvds-tm070jvhg33-dtbs := imx91-tqma9131-mba91xxca.dtb imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtbo
@@ -474,6 +478,7 @@ imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jta
 imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
 imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
 imx93-phyboard-segin-peb-av-02-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-02.dtbo
+imx93-phyboard-segin-peb-av-18-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-18.dtbo
 imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
 imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
 imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
@@ -481,6 +486,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-pwm-fan.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-02.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-18.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx91-93-phyboard-segin-peb-av-18.dtsi b/arch/arm64/boot/dts/freescale/imx91-93-phyboard-segin-peb-av-18.dtsi
new file mode 100644
index 000000000000..53d5cbcd798b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-93-phyboard-segin-peb-av-18.dtsi
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ *
+ * Author: Florijan Plohl <florijan.plohl@norik.com>
+ */
+
+#include <dt-bindings/clock/imx93-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <5>;
+		power-supply = <&reg_vcc_3v3_con>;
+		pwms = <&pwm7 0 5000000 0>;
+	};
+
+	panel {
+		compatible = "powertip,ph800480t032-zhc19";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel>;
+
+		backlight = <&backlight>;
+		enable-gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_vcc_3v3_con>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dpi_to_panel>;
+			};
+		};
+	};
+
+	pwm7: pwm-7 {
+		compatible = "pwm-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwm7>;
+		gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
+		#pwm-cells = <3>;
+	};
+
+	reg_vcc_3v3_con: regulator-vcc-3v3-con {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC3V3_CON";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+};
+
+&dpi_bridge {
+	status = "okay";
+};
+
+&dpi_to_panel {
+	remote-endpoint = <&panel_in>;
+	bus-width = <18>;
+};
+
+&lcdif {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lcdif>;
+	assigned-clocks = <&clk IMX93_CLK_VIDEO_PLL>;
+	assigned-clock-rates = <27272728>;
+	status = "okay";
+};
+
+&lpi2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio4 1 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		wakeup-source;
+	};
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso
new file mode 100644
index 000000000000..35edf9b0fb0f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ *
+ * Author: Florijan Plohl <florijan.plohl@norik.com>
+ */
+
+#include "imx91-pinfunc.h"
+#include "imx91-93-phyboard-segin-peb-av-18.dtsi"
+
+&iomuxc {
+	pinctrl_lcdif: lcdifgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x57e
+			MX91_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x51e
+			MX91_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x51e
+			MX91_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x51e
+			MX91_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA0 	0x51e
+			MX91_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA1		0x51e
+			MX91_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA2		0x51e
+			MX91_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA3		0x51e
+			MX91_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA4		0x51e
+			MX91_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA5		0x51e
+			MX91_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA6		0x51e
+			MX91_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA7		0x51e
+			MX91_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA8		0x51e
+			MX91_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA9		0x51e
+			MX91_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x51e
+			MX91_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x51e
+			MX91_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x51e
+			MX91_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x51e
+			MX91_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x51e
+			MX91_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x51e
+			MX91_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x51e
+			MX91_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x51e
+		>;
+	};
+
+	pinctrl_panel: panelgrp {
+		fsl,pins = <
+			MX91_PAD_CCM_CLKO4__GPIO4_IO29			0x1133e
+		>;
+	};
+
+	pinctrl_pwm7: pwm7grp {
+		fsl,pins = <
+			MX91_PAD_CCM_CLKO3__GPIO4_IO28			0x1133e
+		>;
+	};
+
+	pinctrl_touchscreen: touchscreengrp {
+		fsl,pins = <
+			MX91_PAD_ENET1_MDIO__GPIO4_IO1			0x11e
+			MX91_PAD_ENET1_RD2__GPIO4_IO12			0x1133e
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso
new file mode 100644
index 000000000000..11f7d7502be4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ *
+ * Author: Florijan Plohl <florijan.plohl@norik.com>
+ */
+
+#include "imx93-pinfunc.h"
+#include "imx91-93-phyboard-segin-peb-av-18.dtsi"
+
+&iomuxc {
+	pinctrl_lcdif: lcdifgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x57e
+			MX93_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x51e
+			MX93_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x51e
+			MX93_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x51e
+			MX93_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA00	0x51e
+			MX93_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA01	0x51e
+			MX93_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA02	0x51e
+			MX93_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA03	0x51e
+			MX93_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA04	0x51e
+			MX93_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA05	0x51e
+			MX93_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA06	0x51e
+			MX93_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA07	0x51e
+			MX93_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA08	0x51e
+			MX93_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA09	0x51e
+			MX93_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x51e
+			MX93_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x51e
+			MX93_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x51e
+			MX93_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x51e
+			MX93_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x51e
+			MX93_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x51e
+			MX93_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x51e
+			MX93_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x51e
+		>;
+	};
+
+	pinctrl_panel: panelgrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x1133e
+		>;
+	};
+
+	pinctrl_pwm7: pwm7grp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x1133e
+		>;
+	};
+
+	pinctrl_touchscreen: touchscreengrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_MDIO__GPIO4_IO01			0x11e
+			MX93_PAD_ENET1_RD2__GPIO4_IO12			0x1133e
+		>;
+	};
+};
-- 
2.43.0

