Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E806B47F2F6
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628104; cv=none; b=efEW/mibyh7PDZEVDQ+B0/c0txjSIhwxHnXJaNyiLM3/dm0ME/4h2ZDUFi4Ul3nPvWlzWzVVSAO30c3qtfIfJ9kmBoaGUZ2bsiTye+pdSmIXdhVjWNq6F0ZGjmsSLmfWP69FCgKFlk3BP/dWvWeBsG/uJgRVMsriln3mqGmHHg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628104; c=relaxed/simple;
	bh=zZoKzN8tl/pLMaQsHBiSwOGEOXk0cIHPZ4G0xdfxhGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BcabYdMEV1+o1MYpfb8S6rzKexSw4yzvpRfEVNGsb/ZotxITaLslIBPW7GKibxpUx2ENgezUT64VwLFzibA8YEaFjdwqTiBntYIyHZsjtFefu+0x5opOLgMTFSNftTPO4Aqid4piz5ytXvnC8FuavjQG34mYCn7jLOEIlxnnUpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzQKnLtk; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzQKnLtk"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso1380885a12.2
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 06:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628102; x=1787232902; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpCX0meP81IgLMRKrMih3dFzB8TrFYkEOwnV4YJCCJ4=;
        b=dzQKnLtkmhT18/S3KBqNseMhBfLOX+8C19msnZg19bQ7CCiWEPZstGroaHaXig8HWq
         q3Lcq6YTgU7bpiPHhVu75pALPYo+UUXPCxz5r9PcjGsir75D8nSlWUkIRjYljT4VTZv0
         aPGOQhwXbVMQBV5xSBb50yLUCh9ehXvVkWAf2V41Y1/3A7yZTSGfhQFlFCKHynYsOzX6
         rf3RE1lJ/77Ky1WC6AjH9mUAVjLPbTZfVv5h2oibqR6qp7dE54YJmy8LA/tjeLcMdHkU
         FmIt7q25oruXEjdw5rKqhRY+y9NU2SvWlWcGPyxO/lQhQrEhavhu45beNDVzz25vf6vN
         /oyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628102; x=1787232902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TpCX0meP81IgLMRKrMih3dFzB8TrFYkEOwnV4YJCCJ4=;
        b=JfBpDBNobpB2PH7rfTSGDfuJLtE5XlgVdd4gOFHSf2dw6bwSkrwChmlTTr8C5uRpIY
         L8SG53b2nbW/PhZbuiQt8UuzwaUkJKTW+u1qgRQ47IwNrlZ/q21VZ4XY3YwGz7HJ2PQm
         qTu3zmTyEjme19XqaufIt44RqyQYEsFtRycfwOdTobADHFy9n6mv4iozF7lbnmP06uXo
         oPYQazMVZHafBsIrvHLb6T6j8RAdIZdkXIfFl46QhNIIz1bJOyhKEdbLx24noouELpiT
         UgkyG/GZVNDjE4XFomuZZQOQAkKFx5c6OGydZrhb4Aa0WTx6XVzPpRg/Un//27Ss/Kw5
         zpdg==
X-Gm-Message-State: AOJu0Ywce5rftsPHNAclA+ARUJfatUxV59/XeYZfyjD+UBZDJre34V+q
	CDXJf2Rz2IBOykr2GNZi7YzB3+kI54+assYczczz2+esX57HmGuXuLVl
X-Gm-Gg: AR+sD11IItukG2N0Bza1h71wziU4T1U1Mja1huq6TTld+WqM6aLiwZTP7Kn7LFAhTnY
	BTDHx4uu7DAeLo2mo4SSqAZ7e7cudI8bbe9j27FenNZWfXux7p0LQK3EJciz901guiwSLTD/k9+
	SZg2QQjX6vrmZ8VkDk9gHjFDG+JfwWrtKRcAaWezQFMnxDbJO5Lr+a5agr4gHsVWCih9UvNoxQ8
	WaqYBuKeJrq4UlBJK4NneGd/0V2PY2JeHYywmcQoYX4UaO1/9flp1HbVkC3W0mkbmGjHcnubaeH
	lm8i0Md8EwWSnbeVwFZNACpkh6il2cnqZzQt/cJnfIT4Km5Amd6QrbDc4P2BvkeNTxB+ghnrZOQ
	pWQ2mAo6KqUiHv327XgpLJ5h3HBERODXzRpkIIEEOewFIiYEAlPh4WjBzh5L0ELo+Db6ctN/gqb
	vbDi9n4LgEDDaV6qbDg0xxLCqMxQytrqOCa2uTSzu8A+3pMMXTh73dlnWfCS8ocJbxVFY=
X-Received: by 2002:a05:6a20:2d26:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3cc5539719bmr7639940637.22.1786628101706;
        Thu, 13 Aug 2026 06:35:01 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:35:00 -0700 (PDT)
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
Subject: [PATCH 5/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Thu, 13 Aug 2026 10:33:34 -0300
Message-ID: <20260813133335.1941580-6-leoreis.costa@gmail.com>
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

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
touch controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   5 +
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 129 ++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2bfed5ac66ac..236bfb6a1e19 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -510,6 +510,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
@@ -521,6 +522,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
@@ -532,6 +534,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+imx8mp-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..32828e9bc534
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1" V2, used on Dahlia (X17) and Development Board (X48) that expose DSI_1
+ * via a Samtec LSS-130 connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-lvds-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	panel-lvds-bridge {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+		power-supply = <&reg_dsi_lvds>;
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <70000000>;
+			hactive = <1280>;
+			hback-porch = <55>;
+			hfront-porch = <55>;
+			hsync-len = <45>;
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
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_dsi_lvds: regulator-dsi-lvds {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&backlight {
+	/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+	pwms = <&pwm3 0 6666667 0>;
+
+	status = "okay";
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>,
+			    <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&lvds_ti_sn65dsi84 {
+	vcc-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dsi_lvds_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			dsi_lvds_bridge_out: endpoint {
+				remote-endpoint = <&panel_lvds_bridge_in>;
+			};
+		};
+	};
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
