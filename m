Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F183630A9
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775115271; cv=none; b=DWUKcU4Gwc6GEWx7RgaNmFsH6l1Ra8rvYtp+zs1olE6Zy55SjPzDXQEbnG49o5fKDY10wfqo41KrGjET9saQGQdTMH44jUUtdtTmOMQkSkoJDK2zbpzYFgqEwqH+pxjTmDV0sIykb0JDkFri3/pHvgYEX5B4AO/BkmjX9yh+19Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775115271; c=relaxed/simple;
	bh=rzzkKf4oIOaxuQfMysZjuDxgmfTsrSEVh/poxZ75x2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nd8QDV+Wx0pBOvB7zbo1po6FKoxu+7PPHIkaYc84ayo+G7Gt0R1H50MX4E7VUej94k9Axe+aph25B8sGKlA4mqK/+HqDTRsQZM/ncHOUYiG7DAJ3nAFXei31vOcxaEDUN4OWFlQw2FY6p99AvnnezIw6ELcGbEr84Bfg3nA87ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=cyT+P6Cc; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="cyT+P6Cc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dS8vowZvjq9bju2bbkwpviKelLcrJ8LMcmYx/wTclnU=; b=cyT+P6CchtzDeBIAmZzB4qEbEm
	3KSNaTBRHYf811vuNdIFSI1WYnRGKze9uOk0Ye5HbkQY4OxQjobYnyssHLAbbnkoPa4P6OOQoFWxn
	rOhvVj0yevoIvtFWUywVBP8UFmLFxg8E/mojqGHAw3PLkHCr46K6ofmJHvrqmyIvn00vS9wqRh+nb
	kK3KaXVmEJqbFOjZpQ69r6WfByM0VKm0d99bCcFAaRpg7IHhLNw0aCgCkB6ZLP3zzWse11NbTqDzF
	b0mLNBkaDd9fOoj2qmCwyQnBCZmrVt2pNkkvrZ3dgfZT5VhTRpa1FULd29+tVRZWbfKPPsRanB0fU
	It6kvYLQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:33206 helo=florijan-nb..)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <florijan.plohl@norik.com>)
	id 1w8CAG-00000009Vv6-27S1;
	Thu, 02 Apr 2026 09:08:27 +0200
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
Subject: [PATCH] arm64: dts: imx{91,93}-phyboard-segin: Add peb-av-18 overlay
Date: Thu,  2 Apr 2026 09:08:26 +0200
Message-ID: <20260402070826.970012-1-florijan.plohl@norik.com>
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

Add overlay for the PEB-AV-18 adapter on phyBOARD-Segin-i.MX91/93.
The supported LCD is Powertip PH800480T032-ZHC19 panel (AC220).

Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 .../imx91-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++
 .../imx93-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++
 3 files changed, 288 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bae24b53bce6..8f5b3996b678 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -437,17 +437,21 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
+imx91-phyboard-segin-peb-av-18-dtbs += imx91-phyboard-segin.dtb imx91-phyboard-segin-peb-av-18.dtbo
 imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
 imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
 imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
 imx93-phyboard-segin-peb-av-02-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-02.dtbo
+imx93-phyboard-segin-peb-av-18-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-18.dtbo
 imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
 imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
 imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin-peb-av-18.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-pwm-fan.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-02.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-18.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso
new file mode 100644
index 000000000000..ec6ef2e5a11a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso
@@ -0,0 +1,142 @@
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
+#include "imx91-pinfunc.h"
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
+
+&iomuxc {
+	pinctrl_lcdif: lcdifgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x50e
+			MX91_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x50e
+			MX91_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x50e
+			MX91_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x50e
+			MX91_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA0 	0x50e
+			MX91_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA1		0x50e
+			MX91_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA2		0x50e
+			MX91_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA3		0x50e
+			MX91_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA4		0x50e
+			MX91_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA5		0x51e
+			MX91_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA6		0x50e
+			MX91_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA7		0x50e
+			MX91_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA8		0x50e
+			MX91_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA9		0x50e
+			MX91_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x50e
+			MX91_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x50e
+			MX91_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x506
+			MX91_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x506
+			MX91_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x506
+			MX91_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x506
+			MX91_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x506
+			MX91_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x506
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
index 000000000000..189b0f0472d2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso
@@ -0,0 +1,142 @@
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
+#include "imx93-pinfunc.h"
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
+
+&iomuxc {
+	pinctrl_lcdif: lcdifgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x50e
+			MX93_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x50e
+			MX93_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x50e
+			MX93_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x50e
+			MX93_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA00	0x50e
+			MX93_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA01	0x50e
+			MX93_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA02	0x50e
+			MX93_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA03	0x50e
+			MX93_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA04	0x50e
+			MX93_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA05	0x51e
+			MX93_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA06	0x50e
+			MX93_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA07	0x50e
+			MX93_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA08	0x50e
+			MX93_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA09	0x50e
+			MX93_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x50e
+			MX93_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x50e
+			MX93_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x506
+			MX93_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x506
+			MX93_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x506
+			MX93_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x506
+			MX93_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x506
+			MX93_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x506
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

