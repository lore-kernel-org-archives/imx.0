Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0550480320
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628096; cv=none; b=tEPOEQ2D+mDU+KLdLQ3jbBfD2UtQ9a56Ywew9fR13Y/erCTgXJYdyHkJ3J/I6Gt97+af//RE8JakWIWO25RhmW+dAPvwN9blIq1zJZLzbShQdxzVnT2O6dJlmvh1WIKVW7cm0u9Opdd1UDvUftuQKnhCXW6nC+8riy3ZGmsetD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628096; c=relaxed/simple;
	bh=tcWGcZuZwcYpU4WzmQxEA0aipo99WwRl2r9Ygz+Zz1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ouVSyaa1ulZZWBffESrCjGHdLo7fl2TYC3u3Sz4p42/10dpSBwjtCbeBmS7pN7/koL1NiNOws6Ify7rhiz9Ss+0OELdlCWle9desru4tKqyaPTinnoxJzcp5k/dWmzxw0wsStHP2lcgIgRBevcxrmjfSooWZLYHDt/sQRYSNb2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGoVnYFH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGoVnYFH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cab973140bso12210345ad.3
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628094; x=1787232894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=76pkAusEOm/VkUOJ6R3g1tJxf2NW1RkLVmy3ipv7D0g=;
        b=DGoVnYFHkvd70cCPV1Htc1YrfLMpEurFoPANM3QiPu2fL6dEXuEeaX+0G96PBhgsL8
         KSwNU7yGzmK1Gr5xA6uv1GnThm9yk+5OdTHowXcAcpG9d/xkn5OkxwZ+NpbUnoFMDo6Z
         GlhBdP0eGEXTJQrv8kpnRyOJs9So9En/Oee8mfQXYQkRy37wa77soemuo4ccY0s8GJLm
         EZC66SOaXtnAGbR7339rNz1iwLIjkHr1zZNovpIetQMfNqbi8vqr3Iwkk9xFqOhY8LK2
         03nDhOa2Enlf4LGjoQ8JjmI3Fe7GWfu/X3ymLcLtYFe998DtsYVYmuxPMZ4j4lAI44do
         T6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628094; x=1787232894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=76pkAusEOm/VkUOJ6R3g1tJxf2NW1RkLVmy3ipv7D0g=;
        b=Xr0+zMUAyXIy8D+jxUTl04z4TSJd0MI+sys7UPNfrId6L+Df2U2MWh0alyryIYzzd3
         A+XNhncchuPNqPLMG8iaJWIrNsDv4jPX+tT5wyiu5XZQ6mIQ1WGrRRqeegntq8fXHssl
         lQnZNXmKLYqH2/FsYGm9gfXC1NNWwIDHZygf6UmZAfUjocjK4+t/+rXQ6BuLbZnGal74
         JYJkBQnLXACPYBpYROPl+BCAmQKPvivUToAFuKsH4sppoBFWs/Ia9002UkW95tWfWvqB
         7OI7DXW+5otLQOzytkjOWF1YAP33/M3w5R2pzyi13EreyEHC8hYF4bybt2pE0e7FqHOV
         SlJg==
X-Gm-Message-State: AOJu0YzrCswUMuxYEuxH+m1INKtZE+vsNGmHHHeUz/1aW1e87B+qr6FK
	N0GM8dHngaAd3WbpaMZd6hazHclcZDwu1pSFjgDmQWq4AlQbVqxSlaQk
X-Gm-Gg: AR+sD11/gf/unfI/V92GUxYaI3C2N2n2ZCc+VmgaRvBdVnH5p5ZJBngNQNV5X+aA4BD
	WfiixDFx9Uy+Ba01D/NUUSKW0tImTKLAfnF3jg9FyIefYiRMXp1ub6kmYfFyUUaJxRQrGki3t0w
	rPVuTMRZTLRjVN+Mdx8cq/rMfl6rp0fCACTO5GkRiNt1/IzQXGUDv7ydz7UkWBv67ZEtZ24Ha9w
	Bm6FmGS7fNwDmiHxNxUHcewmK0tiEg0liFUemfOtW7FkfXxkTkujhFWLOLxIrK0+CNGIHye7Fzf
	EJWoadR8+RspgZ1yVvVv/ZIjkLpbx+Z+BB+r2AXTEOq7DSxTFhEQs0OONFB8DJy0UYCfuc+7zoD
	MthCGFwj34QuZtKbywn3Th2voNPi3fpRBZLq7n28rKqOu6n8BqGYAUR8sUaeAEjWHAhvBBeVeae
	JP3KL80kMh9UGcJe/tJhSzmGcmYOldGZTeAVQEUk6vGaSFy1zXgQkGVMUbOMRSdTTt0fiGFqqjG
	2IY0A4=
X-Received: by 2002:a17:902:cece:b0:2d1:1a18:4d0a with SMTP id d9443c01a7336-2d37d695848mr54856575ad.9.1786628093944;
        Thu, 13 Aug 2026 06:34:53 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:53 -0700 (PDT)
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
Subject: [PATCH 4/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V2
Date: Thu, 13 Aug 2026 10:33:33 -0300
Message-ID: <20260813133335.1941580-5-leoreis.costa@gmail.com>
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
LVDS V2 connected via Verdin iMX8M Plus LCDIF on carrier boards exposing
LVDS interface (e.g., Mallow). The panel is an Opto Logic
SCX1001511GGC49 10.1" WXGA TFT LCD and the touch input is provided by an
ILITEK ILI251x capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   5 +
 ...verdin-panel-cap-touch-10inch-lvds-v2.dtso | 118 ++++++++++++++++++
 2 files changed, 123 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 37ae0954d02f..2bfed5ac66ac 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -517,6 +517,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
@@ -524,6 +525,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inc
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
@@ -536,6 +538,9 @@ imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
 imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
+imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	imx8mp-verdin-wifi-mallow.dtb \
+	imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 000000000000..6b0c1a10ae2a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" V2 connected via Verdin iMX8M Plus
+ * LCDIF on carrier boards with a Toradex standard LVDS display connector
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
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight>;
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
+&backlight {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 0>;
+
+	status = "okay";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
+			    <&pinctrl_i2s_2_sync_gpio>;
+		/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+		interrupt-parent = <&gpio4>;
+		interrupts = <31 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+	};
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
