Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9C85304B2
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 15:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870081; cv=none; b=S6Qxmw5FKWvFLMwuzS7DvYbTMlPV6PhIfKnAZM+VDULy+2UTxsmitcHNzuiPSocp5bxJ2hMkno2Palv54VFR2R202vk1d675GQR869bjq0SW/6waGv8dLVnFMrHQLomynpZ0TX56LKV45iVayszQ2r/zzwMGcxs58sCaa3JrBlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870081; c=relaxed/simple;
	bh=VA7Ni/F1JgzgtUh3oFMKOt21KWPWBYus5Y/t5m1o+L4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ayRhZfOvRqVCi5sX3ZXDy5CE4H7396RNNcG3cS/42TSwcr+VZEY5xK/I4m9dEno4Hyc0ThECA7YTbd01jPwe0h34AF+jxGed/hfBG+BwuRppz8afIvWjuAG/pqKgS74wpO+KRUgmg5ulpETj0djfujHY0hkxt9pOxXOhjNSRRAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgWJxOyn; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgWJxOyn"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so4843860f8f.1
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 08:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870076; x=1791474876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAFC8H6SRbBYXziL4RWAUIvTgcktVHgnRCl/MLPP5e8=;
        b=DgWJxOynXeEFyf2syKbYFGL1A5jMzUlTZNsUrSN+8KOXLjklsQm0oysrdGtIzH5s7u
         DjeW+QxuT641k+vKO1L/FaCqivgUbs/VxRUIXvf8AVfLvgTkEQtYVhpLfXLwXa/pe86H
         yt0b2nB7oMI0GcZBw0nIehWM14aBIsqWT0lCmQBtYe3+QkO0uXmMq9NLfj/gTRq6/Hvw
         gGYO8NM+IwZYcyt8YyRzgyTyBfBkRNjwogfJ9/YlHMThGEIviwqHld8gLlyXlNn6aX3n
         nk62uS+bSDth+wb7K7Yr68a5D3HxxVg8QAgByfmp6njF723e+IjyDEUCjac7xqlGO1sQ
         zu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870076; x=1791474876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hAFC8H6SRbBYXziL4RWAUIvTgcktVHgnRCl/MLPP5e8=;
        b=GXNjaPg6HEPMZG5Zdgf+8CJtML8dyyc/XHoI4zsnM5EhCXE55/LcyCQQt6/v/4fSV+
         b3MnFmrwjuotaUwfHYjHc7KkL1+rLPKTBsEpV63JKmxT6URJzTfOzVGLzJJRz04eOUSg
         fjvD/K5gHc1LoL9kiSMDDY0S9yyBe5B+Yga3MDDGNOQg5ZUjC2GgbtACGfQSenSWLYE8
         SWnTK2oTFcYNEDcD/ZUf4I86LzJilF2CndR512H1JAs6K14Qp4wOoxqrQLHluivpx8Iy
         eNA4CruycUA66Ht5ZU54Vk8STUmMq5wqf8Ikk1Wa1PFB1BwyHy/ZTTcc6htUVJvFcyz4
         ZsEA==
X-Forwarded-Encrypted: i=1; AKwUvBywcs+Ni31smLVol5olnNrM+WTKwjhuf6jKFH0IgHirNNdJBFv7g4GKUVMF9qChMI4MLpQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYJkF0CqRznbvvhvrywWcX9WKBMubD5CxZNYRrXUCTMZO8lRuc6d
	yhxuQsxlf/3TDwV2BTIQ6vY2Z5Ft3q2X2ml9Kxb+yyeyMd2ZR4fw23d6
X-Gm-Gg: AYBFou0ZLQQ4wPH2rFYUqtDE+MLa5Dd546+T0F/yVjbniyHxi8NZv2l7zg31GT2Zapa
	X+P95ttBYAt/ePUaBiNmCAlhCiMjI/gHICkiD1eDp0C9oc3hkG5onMpadilZRylJKNv//D/1w9w
	di8rGdXqR014wzaeiZnOwlieKODY/NjHpdYlH0qXBtYSC58DRxV/9gXUqHDNf5H1W6Rt3n8hC0D
	W87Lph4qfpQT6K8oY5wQI6zvkxmJYhEOrt4rOfzACh/az0v+X1w9u8+a7WZPXdltmQ6O1LiGMUp
	hJecaxysNufBdununItqCIfAxtBJ0ht4nVplDsI3B245+CWFFGYiPzXDb2tJzAw/9Tl34cYZU41
	3aRNPQft3ubb4EYDQPqPdAzab/4uiCdcVkN9PmbZlnK32t+Lk8/1lCQJIab4CBgjA0wIwxmhjbm
	8zO6yp3nlXFdX29nwYXbAIBKV8c/jCki2v2pzrOcYWnhYElkBoolH3USz5TL5YaIZo2KsOuNz9u
	RKbgHhsiiMNfU1ZD7BBzvdAtA3iFj4qbgZ0apc9AZFr2uokx0I3K5QCriH7YmBRkTSkLQw9aDWE
X-Received: by 2002:a05:6000:250a:b0:48b:5e2:52dd with SMTP id ffacd0b85a97d-48b12739690mr25661f8f.11.1790870076043;
        Thu, 01 Oct 2026 08:54:36 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:35 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI Cameras
Date: Thu,  1 Oct 2026 12:52:57 -0300
Message-ID: <20261001155412.3177428-8-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

Add device tree overlays for the Toradex OV5640 CSI Camera on Apalis
iMX6 CSI.

The default overlay describes the current CSI Camera Set 5MP OV5640 with
a 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the
legacy camera module.

Remove the ov5640_mipi node from the Apalis iMX6 dtsi, as it is an
external component that does not exist at the SoM level. The camera
modules have their own on-board oscillator, so the sensor xclk is now
described as a fixed clock instead of the SoC CLKO2 output.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://www.toradex.com/accessories/csi-camera-ov5640
Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam/
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 12 +++
 .../nxp/imx/imx6q-apalis-ov5640-24mhz.dtso    | 17 +++++
 .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++++
 .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 +++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 73 -------------------
 5 files changed, 115 insertions(+), 73 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index cb2ad0756e7fe..9bb3bd9756d11 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -103,6 +103,14 @@ imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-hdmi.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-ov5640-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-ov5640.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.2-ov5640-24mhz-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-ov5640-24mhz.dtbo
+
 imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo
@@ -250,6 +258,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-ov5640.dtbo \
+	imx6q-apalis-ov5640-24mhz.dtbo \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
 	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo \
 	imx6q-apalis-panel-res-touch-7inch-parallel.dtbo \
@@ -264,6 +274,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-ov5640.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-ov5640-24mhz.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-res-touch-7inch-parallel.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
new file mode 100644
index 0000000000000..3e4bbb11ce203
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Legacy Toradex CSI Camera Module 5MP OV5640 on Apalis iMX6 CSI.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx6q-apalis-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
new file mode 100644
index 0000000000000..302f1ceb6a102
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on Apalis iMX6 CSI.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clock_camera: clock-camera {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	regulator_camera: regulator-camera {
+		compatible = "regulator-fixed";
+		/* Apalis GPIO4 - CSI Camera Connector pin 24 */
+		gpio = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clock_camera>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera>;
+		DOVDD-supply = <&regulator_camera>;
+		DVDD-supply = <&regulator_camera>;
+		/* Apalis GPIO2 - CSI Camera Connector pin 22 */
+		powerdown-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		/* Apalis GPIO1 - CSI Camera Connector pin 11 */
+		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_to_mipi_csi2: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&imx6q_mipi_csi_in>;
+			};
+		};
+	};
+};
+
+&mipi_csi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	port@0 {
+		reg = <0>;
+
+		imx6q_mipi_csi_in: endpoint {
+			clock-lanes = <0>;
+			data-lanes = <1 2>;
+			remote-endpoint = <&ov5640_to_mipi_csi2>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso
new file mode 100644
index 0000000000000..9cf7587c263bf
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Apalis iMX6 CSI.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx6q-apalis-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <27000000>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index e52b55a386f7a..ce160fad5ee06 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -36,12 +36,6 @@ backlight: backlight {
 		status = "disabled";
 	};
 
-	clk_ov5640_osc: clk-ov5640-osc {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -116,26 +110,6 @@ reg_module_3v3_audio: regulator-module-3v3-audio {
 		regulator-name = "+V3.3_AUDIO";
 	};
 
-	reg_ov5640_1v8_d_o_vdd: regulator-ov5640-1v8-d-o-vdd {
-		compatible = "regulator-fixed";
-		regulator-always-on;
-		regulator-max-microvolt = <1800000>;
-		regulator-min-microvolt = <1800000>;
-		regulator-name = "DOVDD/DVDD_1.8V";
-		/* Note: The CSI module uses on-board 3.3V_SW supply */
-		vin-supply = <&reg_module_3v3>;
-	};
-
-	reg_ov5640_2v8_a_vdd: regulator-ov5640-2v8-a-vdd {
-		compatible = "regulator-fixed";
-		regulator-always-on;
-		regulator-max-microvolt = <2800000>;
-		regulator-min-microvolt = <2800000>;
-		regulator-name = "AVDD/AFVDD_2.8V";
-		/* Note: The CSI module uses on-board 3.3V_SW supply */
-		vin-supply = <&reg_module_3v3>;
-	};
-
 	reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -690,30 +664,6 @@ adv7280_to_ipu1_csi0_mux: endpoint {
 			};
 		};
 	};
-
-	ov5640_csi_cam: ov5640_mipi@3c {
-		compatible = "ovti,ov5640";
-		AVDD-supply = <&reg_ov5640_2v8_a_vdd>;
-		DOVDD-supply = <&reg_ov5640_1v8_d_o_vdd>;
-		DVDD-supply = <&reg_ov5640_1v8_d_o_vdd>;
-		clock-names = "xclk";
-		clocks = <&clks IMX6QDL_CLK_CKO2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_cam_mclk>;
-		/* These GPIOs are muxed with the iomuxc node */
-		powerdown-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
-		reg = <0x3c>;
-		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
-		status = "disabled";
-
-		port {
-			ov5640_to_mipi_csi2: endpoint {
-				clock-lanes = <0>;
-				data-lanes = <1 2>;
-				remote-endpoint = <&mipi_csi_from_ov5640>;
-			};
-		};
-	};
 };
 
 &ipu1_di1_disp1 {
@@ -743,22 +693,6 @@ lvds1_out: endpoint {
 	};
 };
 
-&mipi_csi {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	status = "disabled";
-
-	port@0 {
-		reg = <0>;
-
-		mipi_csi_from_ov5640: endpoint {
-			clock-lanes = <0>;
-			data-lanes = <1 2>;
-			remote-endpoint = <&ov5640_to_mipi_csi2>;
-		};
-	};
-};
-
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
@@ -933,13 +867,6 @@ MX6QDL_PAD_DISP0_DAT23__AUD4_RXD	0x130b0
 		>;
 	};
 
-	pinctrl_cam_mclk: cammclkgrp {
-		fsl,pins = <
-			/* CAM sys_mclk */
-			MX6QDL_PAD_NANDF_CS2__CCM_CLKO2 0x00b0
-		>;
-	};
-
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
 			MX6QDL_PAD_CSI0_DAT6__ECSPI1_MISO 0x100b1
