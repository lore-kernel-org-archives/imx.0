Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8656A3A874F
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628081; cv=none; b=Pp/1Er2LHPuhPreImjYRNFcGhaVyR0GEY1IKFLVHwSpDamUYELJgaHrW3tTHJeyXar3pDFuurbKpi4yGt1X8h6RqdQsL0ye+wD51OOJ9gO3M8eynNPYrBbtV4GX6qjdod+hQbO2HZnR4QSrWreoBc1OPujvTD4Qyrts4Mqueg2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628081; c=relaxed/simple;
	bh=yXPfYRTq13Z13hnY9M2vWLNPXxCxTlshRWn6pLaBIyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kiG6LUKJiuk0TlyDLjlXX6U8eovX8ySS2L8Q85n/WTIzlqqlA6IFJXO0c8EY1Gh6hHI2nTB2yJcprMhZXGqs0ctU5pzugz3SdOUbAn4jiL/c97A8kKaMi1RL/IrxTOk3efJLjAgukGjrayZ/spXT61ZqbEotUY7M3gcIoZwDIlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSAOGPMc; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSAOGPMc"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so941591a91.0
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 06:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628079; x=1787232879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6StSRmQ3TXpbzmYjkKhFphWCpJTIb1eQDdlKaP58Ns0=;
        b=SSAOGPMcsoAAJksrIdlaslz1tF2wtvspU3L2JyeCoxKs8CFGk1xJt06+zfnNIZF7ip
         iCIu27YBJ6LsDgVGQ6uXlPP9ItbDY9ZWCYoYwT40MLMxfoJqgOWZaR4yU6P51FhpdLbC
         ZibPvPk8O4jTaZB1sJJY65g7if2CwGrGSDzCs+oLid8uJvZBbOcFjrPZgKIGOx49WDIk
         KoVCbrNaw9RE2uFgEh6yzfEvdu/9JociNkUjbhA1SHyXy3Qi0dOXaGnXvcccymq/VUKo
         OXiq4lX4dVEbjyciPoGiqFrqGEHLoq+Pxlw+BFmgSX0L795AvzEvqagGtoCcsn1nxe8U
         p8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628079; x=1787232879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6StSRmQ3TXpbzmYjkKhFphWCpJTIb1eQDdlKaP58Ns0=;
        b=S8bINgG+hIZEQL/uRNtHr9xcyQxu8RjbyqJaTcVAMfFuGZPTUXm1WT9lKru3C0OnbI
         UtnMVCfJ58rB0DTKN4MsOu3o6cvY/MkyRjO8vUFJJW029GK37rzInOwNXrEpL8rewOrH
         Zo/svEA5sA1cDh7YM2Kz0SDNGT+hoJUuVwilwryFA8eBZeMIvoG2wRNfBDuPZooFu7l5
         i8Xwn5U8wL7DxzgBT7czQcoqLeqEoGGngS/S7w/wLw5HQc8By05GbkGWwd1FYNKLcPLz
         5ycRxv/tqQxVwp1K0S20QjuAXAl/sh0NC2i5GMKZEyFYh1WADG+pUKpT2ygIlDHcOS3N
         Ru6Q==
X-Gm-Message-State: AOJu0YwbBeOrOsj1UiMclnsQKzHAKg8Pse8FdQUX61QOrtBzK7hMPco/
	HfM4suJkUblG0fAAsMg1cDFRhMeR2D6gFEru4U4LDdpBlYprv78B+HEf
X-Gm-Gg: AR+sD123yYwPu0PDMjBizyarx/OKHVJGP+Vs1YGWv6smyi0AGtxJgrHr3WNKv8mEfso
	M77mihdInPpd+BHn0Bxy34p8IG9vg8j9gn7QzwvAVz0lJc0TomyIjwUrtfvM9Cd6HPL+UFxl7mj
	uQ1UyAbChNMUwhP7stipFq2axB95+P6qEgQtAVmdae9ZTO9OOaEkDSzvDkB3L+skYWqyF486Zhm
	9+IRw2m5QSQ3uEtylVJkS1z0z65IYGoi/59khstl+iIVTEEmrKUxtK+yIua6kR47QKDafFTLpyj
	KaBWce2Wo33YnOhK87rVc7LSfYbzMCtJ96WgtujFHMollofEsagrgXRTQPdWeer3ar+xnU2d5EP
	AuhF4uizu6nPgPHqmO/Z8u6KJgPHslCVBmQ05/9EQbpj5Bo7MfPI2G14mzi5YuhhPZVauQR/ouw
	ayxVsAZetwCT0jiomWPpJ84x+gozjR+kQpWc+vdGyyuBd4J3lj2fSkRK0Qv1tZ7oudkfD3Nn5Hh
	CAIpIU=
X-Received: by 2002:a17:90b:4fcd:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-3931e23aa93mr6950170a91.11.1786628078271;
        Thu, 13 Aug 2026 06:34:38 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:37 -0700 (PDT)
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
Subject: [PATCH 1/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Thu, 13 Aug 2026 10:33:30 -0300
Message-ID: <20260813133335.1941580-2-leoreis.costa@gmail.com>
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

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via Verdin iMX8M Plus LCDIF on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is a LogicTechno LT170410-2WHC 10.1"
WXGA IPS LCD and the touch input is provided by an Atmel MaxTouch
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  6 ++
 ...mp-verdin-panel-cap-touch-10inch-lvds.dtso | 95 +++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 201460ee5669..d643f85baa7f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -514,13 +514,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
+	imx8mp-verdin-wifi-mallow.dtb \
+	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..9079c6284dfa
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Verdin iMX8M Plus LCDIF
+ * on carrier boards with a Toradex standard LVDS display connector
+ * (e.g., Mallow).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_3p3v>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 PWM_POLARITY_INVERTED>;
+
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_i2s_2_d_in_gpio: gpio4io30grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;	/* SODIMM 48 */
+	};
+
+	pinctrl_i2s_2_sync_gpio: gpio4io31grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31 0x184>;	/* SODIMM 44 */
+	};
+};
+
+&atmel_mxt_ts_mezzanine {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>, <&pinctrl_i2s_2_sync_gpio>;
+	/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+	interrupt-parent = <&gpio4>;
+	interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+	/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+	reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+	vdd-supply = <&reg_3p3v>;
+
+	status = "okay";
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
+	 * This display uses 71.1 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 71.1MHz, or 497.7 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <497700000>;
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
