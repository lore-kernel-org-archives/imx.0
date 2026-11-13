Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585147;
	b=FPe5xNY1Oq2TqLAz611Nyq/ONzUk+s/7vdkhxAvkif43p+UTOHmsMwNoaQXY81CURoOt
	 tgwDIX6JFuCRwEBQp1Kg4gPSnSO+PjKsgspYIKMlogdDP692hztlfk1FrZrbVfNa5Emdx
	 KOxXBn7t+i+WWFSZmz+5lAlx593nDyiLbHqJjMIG2UqE4FizHVRNXA1+bIthioyw8AbLT
	 dEgK1g8nHsijiRDrRJjvCHkog8FscjPvdl5bFFJf3AdjoAMLS7SsexkV2hTCg23dMAn3d
	 GXOectcVIO7PSYPtBhZnBcnniBz+cn3XKRYZKoDyM/ZUTTskBSAYeR6mXRlomWmdwzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zIWRN9vLoPyHTcFB7Jp/w2r6/s827ZL0kNYZ9k2LMNg=;
	b=jX4rYYw/Ca7fBWgHaPnYBrKLqBpu7BnETUvLW8ZxoPKtHalf/r5VurxkMpo3lyyM+5mN
	 vE9LVhSHtOCrFeZ3yb+2N7JZ2sl/vHAMTZLbNaNCEFRZA6rAplM0KQwTtwkpT8WRjYTU+
	 1rOHI02U96q3Q7wbw10uWfvNjemj+HrEGbVtfVLCRK96EKBIbEwi6K9FBvvXAONal6N/X
	 P+GqPGio9UslDZ2X39faXxzfp3l0KAiMeccoBCr9h1K70jCpnxaxSh0Mhmn/FeqtlCw6A
	 Q1RCdOIP2g8GxEnUMIS9zi8VcoFaHQWZ5cZtaatXjtBcqscaGHSyU2rEntE2QP7MilQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eAD0N6At;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7835E606A33B
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 15:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7835E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eAD0N6At
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ecde8e8e5bso344235e0c.2
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585146; x=1795189946; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIWRN9vLoPyHTcFB7Jp/w2r6/s827ZL0kNYZ9k2LMNg=;
        b=eAD0N6At2vslew5D5wwqp9Utp3w+xa8CZ9MjLgIqoZW60BGpNgwGfxfX9C8WKex4/p
         WuYistse7oEs9PzwiX1d3Ir1TAzu9dr44apFWdutEmpIc6MaMdATUVrOL2DIfVPfefJB
         E2KZaOeZZcZekOW8j4k9olkQSMFVVUwxTwZ4V8bRH7ch9zLgnq5BKKKcCsoEq7Ya503s
         Y2dksftoxXFHFRJ8yVZKgLD6IHeFd+qWrE095ndyLlx3XmVDwI4JcGVuhmng2WgpZeMv
         NVEzI2DKeqxIXCHu3MWJ+YlZt+0TtRSgwuYtwR7XqCwz+nroPuKwZk8PV53pl3b7iYFt
         4aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585146; x=1795189946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIWRN9vLoPyHTcFB7Jp/w2r6/s827ZL0kNYZ9k2LMNg=;
        b=BTyO53U6rMqlylQcESGxkcmP1SFGXIkxyago7b17JIc388AwC/4MB4FDn9BziC0as3
         g/+/4MvhJ38uYklFaPOR6NksGcxKbbskVxzsDeU3k50BidG3h0BlKWpUExAROShG3rov
         S17rS89VELAsYb780p/LuO6+0XeodlIbHSaiZzNFCPrWs+QIynQyOlz+jcd2fXAUtp3E
         GvdG8s2J7YzMGzgVfIw+Wlkh8RDBR0htCQjWhiriFfvEX1axz+RLvpnhZ7W0IooDDotW
         kbIzeDnS8ku3iaRMe7TNm/+qqvxA1PupZjwrDV5rQhV7TZ8wFkcpiWvWaSlGzNFp/Cc8
         q5GA==
X-Forwarded-Encrypted: i=1; AL+hErGm9KVHkJHM056j/X61xvIc6+KAT+igSTkBOOoVs86QtY0bK0Yp+oWCFJmS71YkqArBDEg=@lists.linux.dev
X-Gm-Message-State: APuU4Z9amWJsSXvuvZY6VmQ27wAMYB3nAMg6XMstriX72Ld/UTyu8EiJ
	tM1x/xOqbiUejIjYAo2l431NGEE5ZWE3+IN3+bANUIDwfGVCbe/i3FrH
X-Gm-Gg: AYBFou2ir0e+uppb65v8FLH6iLkiRenjGV3k48ToLuOq+oVe7UI7I/KtiNg2KRgmk5V
	kJb1A6rur1yxs3rn+TfXqjwALMNpO39N94MDM+hoD5xpQFS/APaWMCpZ3X7FcjGMokVpR3AqYfH
	6ljwHKrgRSeymtgFewIVahrOZ2uAq+5tdPeDGBhjuyHlMOPekyrg2G9ygLPfoOyAMi0zd8n3Fn2
	ehykktJbRT0XRAwZlUx2okVsCgMHLGgn3m0fm/WS3r2xKASSoxcZkYW4hxKh/9ownlkei/Fzc+h
	RMyX6uWy4sp8nhW/PsyIh+pP6g/gPELbaMcDCXw+mTM5sg2OLZoWqTjY0oRyfrNNsMit53Dpb5B
	gORhfuBmb35K6dwIqTJj1rxSTJc6vzcv48N8V9rfkzOHjkcR/kuSrCuU2oVvkyv01H4rmgMaCge
	V93GksbinFb6bmmwwYYGfvKDKOJ9ZWiMu8UlyOb1c2BKIdy6rknYR8pgv7wrsfL3imQCZis1UfX
	jJ6+f0EO0glUW5RWqA4hRQTrzICfcqn+Sv6mge36lNnlseEm0Euta8nOhjlUgBvP4G9r0RTMMkA
	Ih9/cngi2bi6rdQVSmrC3d9l1lO53GbS
X-Received: by 2002:a05:6102:3e8e:b0:7cc:23e7:e74a with SMTP id ada2fe7eead31-7d64d7454e6mr798389137.14.1794585146176;
        Fri, 13 Nov 2026 07:52:26 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:25 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:15 -0300
Subject: [PATCH v2 4/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 10.1" LVDS
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-4-327f5d37a9c5@toradex.com>
References: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
In-Reply-To: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=5136;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=qBu6AF0oDnpXjHX9V9XIiZrMULpT0BgZODCiPSH/VuU=;
 b=ahR6En2etBvCKOtaQfJtXALIXppt4UGBMA5qhBII05IfV4TUQf5OfmbYr7WbIYp8KjD+SMqRb
 TMgC4/CTUM9Bi0UcVUo4aj+qatRT6GhLyEicl53UdjGXCC1cgIMKO4k
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display
10.1" on the Toradex SMARC Development Board LVDS0 interface. The panel
is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the touch input is
provided by an Atmel maXTouch capacitive touch controller.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 ++
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 80 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b147b93b2a067..604bb35675930 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -713,8 +713,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
@@ -722,6 +724,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..a177cf61cc383
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Toradex SMARC
+ * Development Board LVDS0. Connect the panel to J48 and the touch
+ * controller to J49.
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
+&{/} {
+	backlight_lcd0: backlight-lcd0 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD0_BKLT_EN (SMARC S127) */
+		enable-gpios = <&som_gpio_expander 5 GPIO_ACTIVE_HIGH>;
+		/* SMARC LCD0_BKLT_PWM (SMARC S141) */
+		pwms = <&pwm2 0 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_lcd0>;
+		power-supply = <&reg_carrier_3p3v>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+/* SMARC I2C_LCD */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		/* SMARC GPIO6 (SMARC P114) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
+		/* SMARC GPIO4 (SMARC P112) - LVDS_RST# */
+		reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_lvds_native_in>;
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 71.1 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 71.1 MHz, or 497.7 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <497700000>;
+
+	status = "okay";
+};

-- 
2.43.0

