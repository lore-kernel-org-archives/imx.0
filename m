Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D770411FAD
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628110; cv=none; b=c5JiD/oHaAy2rKeHIhMrA+XakVcVcX6aFRisZPw12nlBbSLNhYTEI8YiPY0PUs5Bw8s64TlXKuH8XusjGnNja6GWhJuKg4iuESXPUcYwF6tu11A7DH/9f54n5V50wdM8Jbt1iryUGhOktVsbjlRXdad22dkLUPtg22kVPyyXFmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628110; c=relaxed/simple;
	bh=GR4jVlyQnp7gCPiGkn/RPUMhf9bZEDscrhtGWGy5YwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYrwiUrlQHDD2u9p/qu7AOf4c222J+G1QI7UyyRIFZfokO3f6kXWLiQ8P3mlGh+bDSPw8p/1Q+rbDo/RMIBkNKeGDgLFHLGhzfS+Yia99PUgNtRzfUhlVwhYrG7PmmzOAd3I2GD0RzvHkdPWiUoK3LcleIzoKbxiElRdT1zfLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfjQ34zN; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfjQ34zN"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dcbade417so2349549a91.1
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 06:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628109; x=1787232909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VK36CbOGVcOzaatP6Iu4YWlcyKL8YIDa/uuP+k8f9qM=;
        b=SfjQ34zNm9g05dmh0UiVuzpPECDq1V2bRSpMiJ/wXmE+u6l7S81yQ/0Ez57jM4p9vE
         s3uYO1aMlg74H39RCxAIlYW5npDhlRpyqg8fThKsXdiI2hmiyftNzgYe3r4zUV2aA/U6
         d7ECdAHPt3HOedtDe2mCWxkHZ1Yww712b9YcmLLXV6AwiKaT/oCxSaFhywOzquxVhyXn
         iZeyHKkxKW/B+N/SheX/4dyhaeC/UX+mIMvcDZjKP+cRSDhO3IjGgAmM5qyxZYjYwiId
         /EdOMl07ZNWS9/eRYGTeNgMMoHdNeZsqHH2IVWpWpVyMu8EQVMV5SXMpO3M73Ci+bQDO
         knIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628109; x=1787232909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VK36CbOGVcOzaatP6Iu4YWlcyKL8YIDa/uuP+k8f9qM=;
        b=S54sG+uUpSlbY8tcAiASxzH0FvbHK1SUZ2WYoDtmOSYHvvhKtyElqbZ5uosHBkDpAE
         7EguHdhUem8fqNa1QqQOj1OsehbWKn9RBZUs0oE2CdNUAqzXTw2C+sMNWyVTKjim15Bn
         YrSRDJBW+WdBke3uUo7LMircnHrmPTR2hBJb1OPSpMEAZZNYIgofHVMGju1cS6R4AQy2
         DyGEwfjU1R1n7xK/YG7ehe39AlUSrm/OKHuI4pw+tIvsxKmSWKH2cUk7LgGSLd8An/Fa
         5BZqgGDCsWHBOv6AZbZHM3MLevCyzeDdP9dc+8hhlava7ymRFPSsMd0VmXwc2JD9xwXD
         XNTQ==
X-Gm-Message-State: AOJu0YxVbm9HeTo0KCjOz5uJIFB1f47KqFboSIyp0UsnTeX4DjWEWSJJ
	NFV3bAmWe3v33pXpsGwi9Ybw59rgeYsOPcNooIDgOpHAP6cYMrM2aKk8
X-Gm-Gg: AR+sD13jVvGRZ91jBki/fvcFwAyGjdreD/SJ30AAcNXUmUxtQstyc0T5OrN9NfvJj+w
	9nmJsYXP87oJw/pNGtCJUjxkVsYDn65UiwBXMhyoc1N+XCR9753E4sy+9C4Uk3xtw9Q69PbihUn
	ZPW1xeJPp2NRH82/mpTo3+IdgzKeYJIxKChxhveZSgOT3dRLgnOhCB9Pxa5p8jiYNOp3xqnF7+E
	c3ZnMVqn444KKPk8RCcWGhSkV/Xb3oEGx1MUVaxmdAnjW6eFgwwFoZrnKqXwF51ZkedoYq63ns8
	Yk1FcMVwDpNtyDyzE77hZErSQSX+th7X4BVU5HbTh+ZiDuV/IUUd9sbTwfckX4WWlrdkYmGvonM
	JwjuIzYHsSn9OuK3hbuizykSbDLSTPT0ddjyZ9svzoAK0srurFLxATGu0WfnSBZxKZJtrOab0Bj
	0jIgmydkDqD+v9UQvcHqgz/sg6FD9NsT9UltIuVv64z1O0booQtiaougwnH7CcZuKcY3A=
X-Received: by 2002:a17:90b:540c:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-3931e26c688mr6942633a91.16.1786628108491;
        Thu, 13 Aug 2026 06:35:08 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:35:07 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS V2
Date: Thu, 13 Aug 2026 10:33:35 -0300
Message-ID: <20260813133335.1941580-7-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133335.1941580-1-leoreis.costa@gmail.com>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay enabling the Toradex Capacitive Touch Display
10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
by an ILITEK ILI251x capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   5 +
 ...zanine-panel-cap-touch-10inch-lvds-v2.dtso | 107 ++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 236bfb6a1e19..39c5f0db5203 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -509,6 +509,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
@@ -524,6 +525,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
@@ -540,6 +542,9 @@ imx8mp-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := \
 imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtbo
 imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 000000000000..b78322907192
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS V2 on the Verdin iMX8M Plus
+ * Mezzanine LVDS interface (J10), used with the Verdin Development Board.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
+ * https://www.toradex.com/accessories/verdin-imx8m-plus-mezzanine
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_mezzanine>;
+		data-mapping = "vesa-24";
+		power-supply = <&reg_3p3v>;
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <64500000>;
+			hactive = <1280>;
+			hback-porch = <20>;
+			hfront-porch = <20>;
+			hsync-len = <2>;
+			vactive = <800>;
+			vback-porch = <5>;
+			vfront-porch = <5>;
+			vsync-len = <3>;
+			de-active = <1>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pixelclk-active = <0>;
+		};
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight_mezzanine {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 0>;
+
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		/* Verdin GPIO_3 (SODIMM 210) */
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin GPIO_2 (SODIMM 208) */
+		reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 64.5 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 64.5MHz, or 451.5 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <451500000>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_native_in>;
+			};
+		};
+	};
+};
