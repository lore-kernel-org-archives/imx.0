Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9A4446BE0
	for <imx@lists.linux.dev>; Fri,  2 Oct 2026 07:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927812; cv=none; b=b7NwMi8CXG9t5UbFvDI/1RnCV+kOhZhpGfvXA+ZKmL6xXJVEWHWxHqRPodaOAEUKm0eljBKU7e4obGi3Fs17Ef+/cAQkLmbAIb6BfXqY/60PvFt2muwzMKMaX6iQpQlmdUcE2J3S0BcqMCYjGwf4g4MGaalWUOj4vohgdF4Yvjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927812; c=relaxed/simple;
	bh=8YdLh4ZCnwDwZQ/aIKC8ya5+UfbTiD6xxi99nvSGj8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZlGmbczDfwvS+gy6QiYlqaKdsS0b8yVFKYU9814kZByo6liRLRyMlrgvBZGmttBSC5pJlIiz/sjRUUj6+x0KGauCXSMejOHx9IVLeuXmbWKcR0JxUNnSoArh8kdSe8ifpbcXEJmTQRP1RmFL9Vhwqwh2B3of7c2tK9GapFREj5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gv2mlqTm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gv2mlqTm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so55730615e9.2
        for <imx@lists.linux.dev>; Fri, 02 Oct 2026 00:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927808; x=1791532608; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKeQ7pMRDpSMvOsTqMY3Sd6L9YDjUesHcennVqLoo8U=;
        b=gv2mlqTmmX0zt430UP7XHQEXeQrnRfEPIS+radNLNtmGpeR7ja+Lf/mXRbkWLTCB8C
         ZBClUZ0OzGSuRvVKQ0e0oIlfMfD4899+4Xx3aMnmBWLf/evsvpCn1WGTMzaVgO+r83Nn
         VAzkyl+/ORCPT+HVHqGcCMZ0q58ZGNJeDcvOagxVHJd5RZekPkcrZWm25aO/F/fp9aLZ
         kiauee+11rxKUkzxgsal/ZiOvJFkxZfd6lPoqs0b7qqw5498lo4cjnvTbo4+sSpGLAxF
         d1NWxPPi+D7PLqFUivi43vv9CpAJCndesjJE8JjIE7BdnBz0nYfcR1Zf1cmpaZA9ckG/
         ncDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927808; x=1791532608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKeQ7pMRDpSMvOsTqMY3Sd6L9YDjUesHcennVqLoo8U=;
        b=YLfW0tNHRFkDvFyVfSCI78wh5T3OUpeZF9WrD3J1CZn25RLccDKTGVI5Ro3dYlEL+N
         op7Ownt8FxzMbaBM+QRit9zbJYuS8xoy/y8DAhn12BLGwbobM4UE2Qu9yR78Wg2VY9d9
         pLjymG4uafGeox6jOwfPe/7nLigYJlZqv/kCG348VvroobmD5BulPxYYSDQDeeL2xXsq
         /qLWNQoveVhM2TL02xzv77789qIzPNPaJ6sSxWzfXV3Nsv/4zSq6MIdmswVMkZH7d8tm
         qHXio13fVKgq0X4y0Aw1hpaeDJ4H+tqw0rrkSZfWhMeKEET5KH4S3P3UcOiOvtaSDQO8
         8+GQ==
X-Gm-Message-State: AFuF++kHBYtq2e7nvzi3f5RKYRNq5OXKeh8zr14sybhbXhJ/wCnHYXpc
	TIosVY2JHUEvbRoHDETH0SwESl8mZJtay6HS1T6/1cGqpJdp1Q86mhBu
X-Gm-Gg: AYBFou3jaNaHeh135S5Q8M5X1BzlIjsw87YSgoKwGGN9CxMgs0RqYGjt0f2AkV6ueys
	FqdMsy1zu+3GuJDCgGIRyckX5miWdwYXfV1sGLDuiFNs3gy/fdv1paZx3InhiYsJ+iYpU/90EBf
	eR5A1YIyrPY3E8wXvSeidjle5vasyuR2JcKn+KHt05i4cBJB88a6m8rBY6fOnSSiOOPrbZA1HAD
	wiBVK6sggau8MQP9DYn4GHOrfegrUcX9eAVQoFRBqGM7CZqt1xY0SyBifIrfaPUqKug/lpXQLGL
	cn+i9Zer9957RuhkajA4VrVDv1IhpeTI0qaokyArRAjB0ALM1RKQARLCBtKrRBG92y2IF2c4m93
	cGhrDSnKj8lfQEwNrFexJdVCXrMRJwWKQwAPmn48pk5EJ77p3YXqLj9gtxubekkR8pBgTHjE6sK
	t3b8sksGluXWRvtqEUhIX7LG3fdEUXFdRoVS3X/4mkrENvq1LC7vqTKyYubyTMapiOCWHqZCIng
	a1lHRyndju2KCl5GHmepUV9c48tOMKxSizNgJX5TBJNKRhDyhDkEa+y5IZYxNmSXC3YY/Vkso4I
	HbcFaS5A
X-Received: by 2002:a05:600c:4f04:b0:4a0:a34:6e7d with SMTP id 5b1f17b1804b1-4a027564c91mr37915915e9.18.1790927808420;
        Fri, 02 Oct 2026 00:56:48 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:48 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 09:56:41 +0200
Subject: [PATCH 5/5] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 7" DSI
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-5-f578c63fb676@toradex.com>
References: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
In-Reply-To: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 7"
on the Toradex SMARC Development Board DSI connector. The display
features an internal Texas Instruments SN65DSI83 DSI-to-LVDS bridge
driving a Riverdi RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel. The touch
input is provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 ...ex-smarc-adapter-panel-cap-touch-7inch-dsi.dtso | 124 +++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2ec50811ee1a..1310b34178e5 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -710,7 +710,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
@@ -722,6 +724,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
 imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
+imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..bbf945997703
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" DSI connected via Toradex SMARC
+ * Development Board DSI connector J44 through the Toradex DSI Display
+ * Adapter. Open J95 to select the carrier DSI route.
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
+
+&{/} {
+	backlight_lcd1: backlight-lcd1 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD1_BKLT_PWM (SMARC S122) */
+		pwms = <&pwm1 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "riverdi,rvt70hslnwca0", "panel-lvds";
+		backlight = <&backlight_lcd1>;
+		data-mapping = "vesa-24";
+		height-mm = <86>;
+		width-mm = <154>;
+
+		/*
+		 * Use a combined horizontal sync and back porch of 160 pixels.
+		 * Treating the panel data sheet's 160-pixel back porch separately
+		 * from the sync pulse results in unstable display output with the
+		 * i.MX8M Plus DSI display pipeline.
+		 */
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
+/* I2C on DSI Connector Pins 52/54 */
+&i2c_dsi_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		/* SMARC LCD1_BKLT_EN (SMARC S107) */
+		enable-gpios = <&som_gpio_expander 7 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_carrier_1p8v>;
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
+		/* SMARC GPIO8 (SMARC P116) - DSI_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+	};
+};
+
+&lcdif1 {
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

