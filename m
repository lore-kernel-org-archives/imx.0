Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009672;
	b=SZdpdf+6jX8a8m9Cg/4Uf46bDDE6w3pX+1ic8fzzNbqnfDb3bfchSLb/ViCBPCWLsw8a
	 tsWkREXhbX5RCTrgJQXmQRr1jfXRFRY4q4S5SvAPu/snmhF8jrjkCJc80wWwQHRhdXqRW
	 rnEvIeUvPscakNdf+UddiP6KWPDCFQ/j6vckHpaFD/tUI0bMUFiP26fxjMa9STt9SlqYb
	 5jgj7QIVmYaJcuSTDd9pB+RBxE0UvvVXWNQTmtWvbLkg/cqRBqL6kBlxjnvMnFRakCGPa
	 3Fz9LdK7yLE4EzSb9X7RXTD2loM1GWNev3YA11deIT5F6nWyR4OVEnJ5+YhDbaeHN4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=LYT4qnsyxafx/l9LYQg7BsWMfeGrcGwjTkvojDxY8FU=;
	b=xS7gsO1hIctrrTg0q2LEXcR9QERt4EOft3iDBAcQaSKYnpa19L2+VpLLsFr9rEQEs0t2
	 YMMDIJ63vDrfUkZ0U7npxP+k3eP6jrdLmMlnIcC9JhtyZEsUDWFQ9xM2/Edor3NsIom+4
	 23Hgnknz8F9VYmxhKPoU3wZUMlXscl5+ei+6W0ffKm2/+/tNnJloivoEFCTSl0dgzxAPt
	 QJyNL+uWCoNr/Lgwn1Xqx2y7kf6uKfDSX2oWa55c/maQfiLwiCDcpSWeEL/FTLHL1t/Zk
	 ltVV4FfVOXxPwpnLrPEbyxmY9cUf6vcZuGbHMhbCUk2UMermov81UBZ7PtGG3/rnUXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FytFhRiJ;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E729E606A31B
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 10:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E729E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FytFhRiJ
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso556230241.2
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009670; x=1793614470; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LYT4qnsyxafx/l9LYQg7BsWMfeGrcGwjTkvojDxY8FU=;
        b=FytFhRiJQ/JeBhAemYDs4M3DRG3xGBelfnkzgD1kqtLuACQgaDNcijQS+Q8BOPiVTk
         k+EnH3dz9vXy+Qwh2holsgoIVuZpFdFJTjw1i6iwPIv1udj/Ji9tesK5JFkrvumF15G6
         NDbD/cYRKXaq9HsbT8fhZUK3mvzIyxtaIADiqyZ+UtcFr247NHCbj7FVCOTxXpSexCyj
         RSMZYRtW0EecVDJ8yy8mVZkKkAOE6y1PAKQpCAtvY0cIqID+dygoFE2RKAo45fg90iKe
         6UiW4OPNbgzg89jPdaNo+i1oFZIJxUwWlsZzOEgDwBUZMqHUeOBm0aA5mLZHiADOCgi2
         36Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009670; x=1793614470;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LYT4qnsyxafx/l9LYQg7BsWMfeGrcGwjTkvojDxY8FU=;
        b=FOYSRZoCY4QQ03kvHUjvk740gLnQ9Sqadi65HihCBxL348fuSnumri45xd+lASKWDf
         T198jRbYRB4f/PLU4WQYSePX7Qa0RZiWxoIVsF0OMTBUhlND9PRpznV8DlbUoc+oKmFS
         w2IcUjatruRIy1zTgSHHvYkVS3JfPG4EciV/IvQksqrwv5AmqOqlI0EU/hWeiLSxj16H
         DVCkMWgQ2ed1FN8sQT9OpVWwQGj9s6ra+leRouu20Co90vmTRPme+Um6JszXumRNgPV0
         39qF2N2nqKZfkdRjSq6PTll0izxnB3vX6dw1D0VlPDKOkENiCuFPoOnDQjBbiiQ08ccu
         sccw==
X-Forwarded-Encrypted: i=1; AKwUvBwFONoHyCQMDfZT9lUI2N5fKYByHVc9iUw6z23D/Txg5scsk4Z2eMwm7VfVodzIOV3uyJA=@lists.linux.dev
X-Gm-Message-State: AFq9FYIGAN6uRzb19ifqZTXx1MSRwZJ/cOlvVKL0jaBMVdETc3YQeIuF
	I5z1dy1i/9axJxdawFw3D+y5j5FCXLdU4ly+Yx9IXqi/Z5TePnsmHFV6OlvRWGNu
X-Gm-Gg: AYBFou2r0Vn3egsQO6bJFzK/r48pfWThfbOL/qVgqaWY2BHTmF5qBi6SyTuF/WeZ3b9
	QXByaJeOXfk02fvOQCa3ptbls2pMKHRn/WP8dKRpNOXxERMNtj3tpjm9Qli/+q/g0dfYxVtcuwV
	WZEfi++GlLvXU2wHBTL2RFKT2FveRzXs+LJO3rxtIWRUht4VPFm378A20NnubVEG5ofQ03z0+Hy
	Sg55HlBcKHDJuY4ZrkUYfDzBziwoWDnqKK9lLw4g0JiIPqqf2klDzd3Vpu4VK6eSbGQTYSqFAGP
	7D/x2cntxZgcH0RsSVS1L9pLlLOARW8lYswCMjefpCXzyR2p8qFB69aAQFqnMAQmBNQ+5x/GGvZ
	x2OgZbTCMDn00p+JlbFZN+0PYsO2M1eJ7M990z6Ts7AS6xqyMAarkN+rmUGp/A/FNeYDUsI8a0O
	1fH9MkQu9HVEsWnrJLjoWcbo/04Y5qOIpEMq0UG3u2mEhWvZyksZKEFTo4sz2G6OVS6ubX6Zu6k
	0aNNbn7o4O45GoYr2QLh2hNT28OdiTUAX1oXrwnlbGd4GM81kgQLdwQUlYE
X-Received: by 2002:a05:6102:14a3:b0:7cc:28a6:ee1c with SMTP id ada2fe7eead31-7ce5ca1e4bbmr1849285137.2.1793009669485;
        Mon, 26 Oct 2026 03:14:29 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234a940bsm7549112e0c.15.2026.10.26.03.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:14:28 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 26 Oct 2026 07:13:26 -0300
Subject: [PATCH] arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex
 Capacitive Touch Display 10.1" LVDS V2
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
Message-Id: <20261026-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v1-1-9e8bef9b13ba@toradex.com>
X-B4-Tracking: v=1; b=H4sIAMYn32oC/x2OywrDIBBFfyW47oBa6OtXSheDM7aCxjATxBDy7
 5XszoED9+5GWRKreU27EW5JU52HuMtkwg/nL0Oi4cZbf3PWO2gOUArQqhCFWQPm0ZT+KAusVZC
 4gxaUAEgEuZECJV0ybgq1sZyA/n7lp+UYiMyYWoRj6ueN9+c4/vIXLsyWAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793009661; l=6126;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=u/Bc4IIPj0XbmMSFY+ai/Y9DOy3qq0yjkSExtBotmVo=;
 b=ngMwqUQ/9OTzcsZpCu5XUiDjMR13gCY0595b6OwqVq/NkcYBWAZmNTzQanHzpmbIfM0DI6wPU
 IKQK1q/A2iYC9tHaZUn4HP43EazzxqVp322urQ7zglp1IkpShilGAym
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
V2 on the Toradex SMARC Development Board LVDS0 interface. The panel is
an Opto Logic SCX1001511GGC49 10.1" WXGA TFT LCD and the touch input is
provided by an ILITEK ILI251x capacitive touch controller.

The overlay is also combined with the Toradex SMARC Development Board
device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
This change depends on other patch series, and should be applied after
it:

- https://lore.kernel.org/all/20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com/T/#u

  Adds the other overlays for SMARC iMX8M Plus. This series is required
  because it adds the 3.3V power regulator used in the panel node. It's
  also needed for the patches to apply cleanly.
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 +
 ...radex-smarc-panel-cap-touch-10inch-lvds-v2.dtso | 98 ++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 1310b34178e5..94d39af8b8c9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -715,9 +715,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inc
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
@@ -729,6 +731,8 @@ imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := imx8mp-torade
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
+imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-v2-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 000000000000..0235aa1acbac
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" V2 connected via Toradex SMARC
+ * Development Board LVDS0. Connect the panel to J48 and the touch controller
+ * to J49.
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
+&{/} {
+	backlight_lcd0: backlight-lcd0 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD0_BKLT_EN (SMARC S127) */
+		enable-gpios = <&som_gpio_expander 5 GPIO_ACTIVE_HIGH>;
+		/* SMARC LCD0_BKLT_PWM (SMARC S141) */
+		pwms = <&pwm2 0 6666667 0>;
+	};
+
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_lcd0>;
+		power-supply = <&reg_carrier_3p3v>;
+		data-mapping = "vesa-24";
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
+/* SMARC I2C_LCD */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		/* SMARC GPIO6 (SMARC P114) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_RISING>;
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
+	 * This display uses 64.5 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 64.5MHz, or 451.5 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <451500000>;
+
+	status = "okay";
+};

---
base-commit: 4aeb54e451181c68bb1135f761281b6391fcb5a5
change-id: 20261021-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-a273e90efcdd

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

