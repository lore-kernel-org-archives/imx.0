Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C323EBF05;
	Thu,  5 Mar 2026 18:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734153; cv=none; b=m2+F2VmgX427z/QM4RjCUm8bC3WzYs1/DWIgMyv1DCAcdQwTCD+VOW1ZudMTNCIOiiFDDzdIuLFGxFWPyJiFVvCTqKpbMJuzvCDKhsJnfu73FjqIx62i1TMOIEAmyYb4xH1sOOFd9Wyp3+7mAf6P0I/+jlLKoPpy5Prp/cmVxOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734153; c=relaxed/simple;
	bh=rjKao/0Y1I3GMYjs9Y1sLlnWo8NV1OEz9mqkuYtGSjc=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=qC5bartXBKiDYokor49TR4GksjIwHuRI/l6lwCKmxcV7zcyzGtBWxjVBwzF0JtxADfzsObVjU9nqDeMSDmBHhKPQ+1PCBK7MmSC03YLmRY7/HR/UdIeWg493GMCL6TNLF3Mb33BZoR5DuWIEs8HO5Ocy3kPTVbp4vEwCnSS0WyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=lqlBFHzH; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="lqlBFHzH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=adH7Yx0sIn9M3KOK46MS0Z5Gi0nhXo0SQhj7OZo/qJ8=; b=lqlBFHzHucqbX23Z0gYNkhbOT+
	B8TsSyatYJkNNTvIsn8Cn7eGTpr2KuboOyI6uaPultdmhp7TNeuqTG30MMfh7dFgJXSDaEriFaFLf
	J5HMNj4uA9IIHKbEodePvg9Gw8gptAwbEXsB+m/+1M+p8KXi+O36ZqxGzO6Z+wGgTaas=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37706 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyD89-0002aR-5o; Thu, 05 Mar 2026 13:09:02 -0500
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
Date: Thu,  5 Mar 2026 13:06:30 -0500
Message-ID: <20260305180651.1827087-16-hugo@hugovil.com>
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
Subject: [PATCH v2 15/15] ARM: dts: imx6ul-var-som: add support for LVDS display panel
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Add support for the LD configuration option (LVDS encoder assembled on SOM)
so that the LVDS display panel on the concerto EVK board works properly.
Not all VAR-SOM-6UL SOMs have the LD configuration option so factor out
this functionality to a separate dtsi.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../imx/imx6ul-var-som-concerto-common.dtsi   |  35 ++++--
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  |   1 +
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |   1 +
 .../nxp/imx/imx6ul-var-som-lvds-panel.dtsi    | 112 ++++++++++++++++++
 .../nxp/imx/imx6ull-var-som-concerto-full.dts |   1 +
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |   1 +
 6 files changed, 139 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
index f099ca5d0e8f0..e5637310ba632 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
@@ -44,6 +44,29 @@ led-0 {
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	lvds_panel: lvds-panel {
+		compatible = "sgd,gktw70sdae4se", "panel-lvds";
+		data-mapping = "jeida-18";
+		width-mm = <153>;
+		height-mm = <86>;
+
+		panel-timing {
+			clock-frequency = <35000000>;
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
+			pixelclk-active = <0>;
+		};
+	};
 };
 
 &can1 {
@@ -98,12 +121,6 @@ MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
 		>;
 	};
 
-	pinctrl_pwm4: pwm4grp {
-		fsl,pins = <
-			MX6UL_PAD_GPIO1_IO05__PWM4_OUT		0x110b0
-		>;
-	};
-
 	pinctrl_rtc: rtcgrp {
 		fsl,pins = <
 			MX6UL_PAD_JTAG_MOD__GPIO1_IO10		0x1b0b0 /* RTC alarm IRQ */
@@ -139,12 +156,6 @@ MX6UL_PAD_GPIO1_IO01__WDOG1_WDOG_B	0x78b0
 	};
 };
 
-&pwm4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pwm4>;
-	status = "okay";
-};
-
 &snvs_pwrkey {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
index 64a3cbd8b7c38..725f34d6b7ee9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
@@ -14,6 +14,7 @@
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
 #include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
index 9c5cb96beeb17..c249e15772b82 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
@@ -14,6 +14,7 @@
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi
new file mode 100644
index 0000000000000..996b37d35d6e0
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * LVDS panel support for Variscite VAR-SOM-6UL module.
+ *
+ * Copyright 2019-2024 Variscite Ltd.
+ * Copyright 2026 Dimonoff
+ */
+
+/ {
+	lcd_backlight: lcd-backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm4 0 2000000 0>;
+		pwm-names = "LCD_BKLT_PWM";
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+		status = "okay";
+	};
+
+	lvds_encoder: lvds-encoder {
+		compatible = "ti,sn75lvds93", "lvds-encoder";
+		power-supply = <&reg_3p3v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_enc_in: endpoint {
+					remote-endpoint = <&lcdif_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lvds_enc_out: endpoint {
+					remote-endpoint = <&lvds_panel_in>;
+				};
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_lcdif_ctrl: lcdif-ctrl-grp {
+		fsl,pins = <
+			MX6UL_PAD_LCD_CLK__LCDIF_CLK		0x79
+			MX6UL_PAD_LCD_ENABLE__LCDIF_ENABLE	0x79
+		>;
+	};
+
+	pinctrl_lcdif_dat: lcdif-dat-grp {
+		fsl,pins = <
+			MX6UL_PAD_LCD_DATA02__LCDIF_DATA02	0x79
+			MX6UL_PAD_LCD_DATA03__LCDIF_DATA03	0x79
+			MX6UL_PAD_LCD_DATA04__LCDIF_DATA04	0x79
+			MX6UL_PAD_LCD_DATA05__LCDIF_DATA05	0x79
+			MX6UL_PAD_LCD_DATA06__LCDIF_DATA06	0x79
+			MX6UL_PAD_LCD_DATA07__LCDIF_DATA07	0x79
+			MX6UL_PAD_LCD_DATA10__LCDIF_DATA10	0x79
+			MX6UL_PAD_LCD_DATA11__LCDIF_DATA11	0x79
+			MX6UL_PAD_LCD_DATA12__LCDIF_DATA12	0x79
+			MX6UL_PAD_LCD_DATA13__LCDIF_DATA13	0x79
+			MX6UL_PAD_LCD_DATA14__LCDIF_DATA14	0x79
+			MX6UL_PAD_LCD_DATA15__LCDIF_DATA15	0x79
+			MX6UL_PAD_LCD_DATA18__LCDIF_DATA18	0x79
+			MX6UL_PAD_LCD_DATA19__LCDIF_DATA19	0x79
+			MX6UL_PAD_LCD_DATA20__LCDIF_DATA20	0x79
+			MX6UL_PAD_LCD_DATA21__LCDIF_DATA21	0x79
+			MX6UL_PAD_LCD_DATA22__LCDIF_DATA22	0x79
+			MX6UL_PAD_LCD_DATA23__LCDIF_DATA23	0x79
+		>;
+	};
+
+	pinctrl_pwm4: pwm4-grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO05__PWM4_OUT		0x110b0 /* LCD BACKLIGHT */
+		>;
+	};
+};
+
+&lcdif {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lcdif_dat
+		     &pinctrl_lcdif_ctrl>;
+	status = "okay";
+
+	port {
+		lcdif_out: endpoint {
+			remote-endpoint = <&lvds_enc_in>;
+		};
+	};
+};
+
+&lvds_panel {
+	status = "okay";
+
+	port {
+		lvds_panel_in: endpoint {
+			remote-endpoint = <&lvds_enc_out>;
+		};
+	};
+};
+
+/* PWM LCD */
+&pwm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm4>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
index 2e1f75d5f25a6..1b7c1a3383eec 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
@@ -14,6 +14,7 @@
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
 #include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
index 43a477db652fa..9c9d16eb1a11e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
@@ -13,6 +13,7 @@
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
-- 
2.47.3

