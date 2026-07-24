Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A95A44780C
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910291; cv=none; b=UgcmNCUexyOTAz62Xm71j+rkIK/hSueFUHbU2oEV4pHh4AAFzA35FzAmYcdoo+1+S9pC8/9SvDkuNTmaL2TJICcikK3VLG36CIT6Sh4fX0GRlpIDCtynp3vfEfBoU1yK8M0su39JiahCqmt+eCrgQ0VTknOEtvjwxpVuR/4Ok5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910291; c=relaxed/simple;
	bh=1RgE2Er9DTxiDAHQ8ZotmKMXBYBHmo2VwuiFIkPk7vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IoaG2MNiJJ9RFJnJvE+g2HmPCjUp47ba58Z0kH9SBQ0oVL/pijEwyWHRHlgITeSDS4cw3a1TGwrFnA1YtDLi5REmbNPWBHf8/jwwhQYxs9Tik/9i0hCbIzJh9l+VAawsZ1KqBwUpBFGO+sR1ZICcyBlbAEHbGvdTr2a0tSa7DOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPcXK6kB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPcXK6kB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495635a85d2so5707285e9.0
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910287; x=1785515087; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9/qs/F9HobWdTc41kv/ETxwCjjDOI/YVDkVTNYkddc=;
        b=bPcXK6kBXlIKxdaKXRPIkLli3xQkNIQPyKL5ZawPlBKEyRRYiex+i8oH5oZiHB6NMB
         D2Ac2X01auXMqB+2NjJeV+2iAFRlq0G5/kjI32/y4XJXHPlQaXSMiq40fajD27ATf1R0
         fClK0mMAx+17+D8S8EwNrg1qwTQMKwAEjzIZATLtpPD3x2LTVeFrYSeeQvzpI/CiuD7P
         niCQ7nYeVWtw0GQ1CvNqADeWO84rQ/Q0PDCmoOq9mOM/6oVhCA1t1vIPswJQ1povULXl
         LmrxfRVyZMuQDOpU/LkDBsNc9I+IcUW5ttOTcCJRbcUaDrZpDIyV3vHaIpyoubzm2R/7
         VrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910287; x=1785515087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9/qs/F9HobWdTc41kv/ETxwCjjDOI/YVDkVTNYkddc=;
        b=myAd6M4qP/gj5Acx5RATXo2QjOSQFLoTtHKzA3/e3Rq4Clw3mfq3D6P89sbrnXztuq
         DcRH89B9x1nrPQTe7gM39aQJOpkY9zBh+Pp3IiimlwAg1pboOFiCRIDmcLuvfFkqNEjB
         sg44wm42AEW4g3G3fSIaHN5GGNKIUAAniW3tXUN7QosC3X5HXOHYXzcMjSlJn7bso2/V
         ilt6OSHkG+7pKcUsTC7bIoJKknPsR7x44vQtLdHgtEVJF5mgo2+b/jCA+w85aLoexM3q
         tZTyL9QuL2BmRzrGBb+n5PlTg68U4hSKN+Dh9Q6HcWewnOXb7L/t+xNup5PrJOKU0jLE
         XBQw==
X-Forwarded-Encrypted: i=1; AHgh+RrjUuOig/5o3ZGpTE79s3UIszT5zonaHyT/Lk0Ol6G1j3Vk2V+31lnnl7McJTNKd5cU3Kk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcqngvUk21t3Ll5CWXKIqfvrOTzL2fn167GV2ARpm3j7LNAoyC
	RSYsnzkCWs3RezyuzTcqTcsEJe0imSY7W8Sn4qi8y3h97QxnLOwUH1D7
X-Gm-Gg: AR+sD13VXeDv0fjzSskYYCHG0O1Or3yUMISacfaSBUK5Un/yAQn91ChHV/fKiSqrR/Q
	0XZ+zYRD5Cij8eCPNaz+Kgg1yMsvVQrEs66XX9DYDBcvM3d72AFB6b2DW7JLcRIPrAcpOYxE4RG
	A8T2lGIDJs1ftQZ35svq2G5sFOB0fU3hG7jLHytwENFDnQljkhb8hifdF343YebcdRQjwTaA+XB
	KSmyuVFVYkMZc8VJ5mME2WVrV917jzdERlxhkI4Jx6OM9EWxF+/8j1X0wtPYN74aFk9G976bRRU
	ttmnLz8T51LqoTAzQsz2CO4hndQom65ooIn2CGPzRnmY8aCSP7DvISRgjmaaT43gvEm5uWWUImq
	y6dfG5XbClgoDoOok9XLKnRQu6JjwnWcRUZ7oUNIzpn31I8FKr79CXq7jNqVl5iZY5JOuIfCTAe
	fJWcEdPDUJdb5VaSXq0zhmz40OMhHP/6wUKNyIGxVWT4B9YRFexlsRetRvM9M73n7fcJs5ni6Iw
	Wp2fw==
X-Received: by 2002:a05:600c:5246:b0:495:6482:9d8c with SMTP id 5b1f17b1804b1-49573d21d8emr93253455e9.37.1784910286651;
        Fri, 24 Jul 2026 09:24:46 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:45 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:31 +0200
Subject: [PATCH v2 5/7] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 Capacitive Touch Display 7" DSI
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-5-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 7"
on the Verdin DSI_1 interface. The display features an internal Texas
Instruments SN65DSI83 DSI-to-LVDS bridge driving a Riverdi
RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel. The touch input is provided
by an Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso   | 129 +++++++++++++++++++++
 2 files changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 00dc2893c754..fe261d7bdab5 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -191,12 +191,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
@@ -216,6 +218,8 @@ imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ver
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..0e15b4b3f3ec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" on Verdin DSI_1.
+ * On Dahlia (X17) and Development Board (X48), DSI_1 is exposed via a
+ * Samtec LSS-130 connector and requires the Toradex DSI Display Adapter
+ * to convert to FFC/FPC connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-dsi
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-display-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		power-supply = <&reg_3p3v>;
+		/* Verdin PWM_3_DSI (SODIMM 19) */
+		pwms = <&pwm1 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "riverdi,rvt70hslnwca0", "panel-lvds";
+		backlight = <&backlight_pwm3>;
+		data-mapping = "vesa-24";
+		height-mm = <86>;
+		width-mm = <154>;
+
+		panel-timing {
+			clock-frequency = <51200000>;
+			de-active = <1>;
+			hactive = <1024>;
+			hback-porch = <100 100 100>;
+			hfront-porch = <16 160 216>;
+			hsync-active = <0>;
+			hsync-len = <50 60 140>;
+			pixelclk-active = <1>;
+			vactive = <600>;
+			vback-porch = <23 23 23>;
+			vfront-porch = <1 12 126>;
+			vsync-active = <0>;
+			vsync-len = <1 10 20>;
+		};
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+};
+
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_10_dsi>;
+		/* Verdin GPIO_10_DSI (SODIMM 21) - DSI_1_BKL_EN */
+		enable-gpios = <&gpio3 3 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				dsi_lvds_bridge_out: endpoint {
+					remote-endpoint = <&panel_lvds_bridge_in>;
+				};
+			};
+		};
+	};
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2132";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>, <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio3>;
+		interrupts = <15 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};

-- 
2.43.0

