Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585138;
	b=2TYASufYGmjEstLA4Gb96PXniuI/Suohhp1vfLbQy21INRJ+gFXS6kT9itLFKVgoEHoU
	 OqHG3I/+ZHVmHyJ+Os2PvdunHlUvvrsqxFePeFolG7fjXBUFKcaHPB9SM+aoU+pG09Toh
	 SKiYPdCuR6RBISr8WEtcu2eMC94tSRSOsPuqSR51CNscSANjmDxCnKlXoG4uEkYZ4xFIy
	 Ad9v9du5+WaAiUKJ0oOKDKpdIs4knKk9fHW1zDDH8D9euy9gNh9ss/V6NtYw51r80KhIb
	 v8wa5ML34Ij3YW6tbfHTSt03oz+KqeIGMEXkZHDgP+Ipyk/WrZtnWvaYS2QaOtDDqiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DWMbNnBwrSvxR91OdU/d68rdNUGtXeSdpUo+91mTRCQ=;
	b=WpkEPzqduoTUz1LKsA8zLoQP7T1u5vmkoNHkKrXMD39hOZhbTk0RpAwZGZx8AuJ4zZMq
	 b+sJH7WIHdXBnOBgV7ywkATcJ+vSX03O72/ts4wre7Ol2+Owz/jmyIsuAppgaw7cGnuG+
	 YALEX7NA5BivgPHC5SoFyi78KAErLk0Wp6Qyhx+iV+gGadgGwXN9Nw1WnISd4n7Q5MVek
	 K3syDLAzPfLDWkm8UvDK4ul5JDamUFasJyidVjjaMESsICC57/+vMHbK6O2OJO2aJ7wnZ
	 G6LB0j/DuEU3u0VKfskEQLrXsnEdpbVevw3wK/l1P8dFGP9tOkT+NLG0aoLovsA+8Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nOpXTTYS;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8230D606A331
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 15:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8230D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nOpXTTYS
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so3128880241.0
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585137; x=1795189937; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWMbNnBwrSvxR91OdU/d68rdNUGtXeSdpUo+91mTRCQ=;
        b=nOpXTTYS2PUOGLoU4q+RnqFyleOLN24LdYjaqi6HUoSQjzG2lVuV9vXgFMEdp/4HVb
         gZARi1VpWH03Ta4nlCF7Xht7kSwbZn4uRGlLjXr2rXNQZL/Ow+7oyVPqGrgD5yy7Q86e
         LlPFcKdnHyoGVhtWYr17tvDXKDzQVb9QSDDYHhyn2oVBGuPgnroT1fQ0LrPz8c8H9stu
         ovnnNvqkdg6e+xvSJfmE6uowT1LttuF6L9CmhJ34g8Xjvk+Nhpo1GxIpfy5V8TliDUhh
         hLHefmP0Qs6UU9rDaMKBZPnwpJyBSm+WGojtYHCvwLRasT6Zi283drEZAr00f0nP1IIt
         tngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585137; x=1795189937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWMbNnBwrSvxR91OdU/d68rdNUGtXeSdpUo+91mTRCQ=;
        b=ynaJQqzPseABPb5L4daNEDhdQn7z8bn2ar48ir9ipl1WFJNOepUaB8vv0Ab360te+b
         lx7XfdRLvAW+MHm5KUG1D3rZMTAaurvkWDeki9ELUxvbLIAKdFDYiiMoMzwHDjPwhZZx
         a5cwMXqfaZY4sWNFu19dlB+iTo0NIH3ksJ/rz1Mb7JgQm9qTZu/PCptZ7kXEE9fPSohW
         jsKMOWkgNK+kW2kFO+8lsiCQrOBKWfIow7PCpWSRYFhX6dTEXCRrXN24NxdHu+zPMdCV
         +n1rT5Oxsb9x52d3d7hXUBsBgUshpEIXJR7iLHFNdXX07SIvaWR0W4nTMWJg2ZJmqs3F
         wBZg==
X-Forwarded-Encrypted: i=1; AL+hErHpK/obGmcDSuwgd8BE6xn4lCm5Zp5fR3lt3WaNj04Ha4v2NfpJNxB/Rc6bX2+TUYWUDoM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/12X7dtXJu4h3BYPnITUFkgtkXsy+TiCV9bM5sGrLdr9a6F0wJ
	zQs60qLM786Xpf1ItwDuJ+5FPKsKNgKisQgBCbVWJ1yO8/EN0W++DzNZ
X-Gm-Gg: AYBFou2RjnuVO053ZJtVGdnuyN2antL0mFhHLP/iES8sF2Auc9KEKG9h4BMCYJFyekc
	vKfZJiXL9ylSlRjMqcF7Y7Vdn+OeTcs5KouYHoYhwF57/947xTNdsVPQnQd1ijZG1tU2rOIpO8o
	HLyD5q/2QLILoQzNKcIldqU4JbknfGiN49yX2Tg/9/03inmLmu1FpkymYZYw/m6pabyCgM9S5Ow
	gCJPLvBqGbks4WtKwJjnQBSzoPvB2YiDMw4R5bSVCgmojT1FPwV9Pi9Z/D0R6WUgpB8MArNYjiL
	0i5WmVBCbRQdSJVa67EQmtwRnEXp3qL3OuiZT8U024503TJ67MYSQusTAGfdBYMYrmOBlJ2g9u5
	ubLufCb5l/ouoozvK8NV/yXaLs+CO5sLb5ntlI6XmuUPHGRVmPigSb9UFayoNVsT9vaup5js/Ax
	hlZbwF4xbRYWBGa+d00wLL3jXPgy8A3w+E/net9pmiUBQz00+ggEojdXK9KsaKADEdwZQkws0zp
	7hATU1O8zmuU8sPUKOj0WavcjNZkvlc4oj4zE0V4fxFkofKkD05baDELZUc1bnyEiSNGPup0T0m
	9PPAJx19zgRoFeumPLwxQXoCZDqTQYBq
X-Received: by 2002:a05:6102:5cc2:b0:7d3:133e:a37 with SMTP id ada2fe7eead31-7d6317565eamr1801920137.11.1794585137127;
        Fri, 13 Nov 2026 07:52:17 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:16 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:13 -0300
Subject: [PATCH v2 2/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 10.1" DSI
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
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-2-327f5d37a9c5@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=5963;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=8tSv2NTD2MUtmsbvIWyNFuTbONv2OsskqyqrqbBXQSY=;
 b=k97Ha0Tg8b/3D2ikrlVa+2pF4Eg8qVw8z5phEKBeB7NU9nPtGSNUsGI6qPB83Wyvg/v2RS8J9
 47IVK5ghI1tB1wTWX0t/Pm4nENKKvZaK4CNT2JYUD+kZCh1q9YxJZzV
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display
10.1" on the Toradex SMARC Development Board DSI connector. The display
features an internal Texas Instruments SN65DSI83 DSI-to-LVDS bridge
driving a Riverdi RVT101HVLNWC00 10.1" WXGA IPS TFT LCD panel. The touch
input is provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 ...arc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso | 123 +++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 3c424071f8fc0..b147b93b2a067 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -710,6 +710,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
@@ -717,6 +719,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
+imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 0000000000000..170411a705233
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" DSI connected via Toradex SMARC
+ * Development Board DSI connector J44 through the Toradex DSI Display
+ * Adapter. Open J95 to select the carrier DSI route.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-dsi
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
+		compatible = "riverdi,rvt101hvlnwc00", "panel-lvds";
+		backlight = <&backlight_lcd1>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		/*
+		 * Use a combined horizontal sync and back porch of 96 pixels. The
+		 * panel data sheet value of 88 pixels results in unstable display
+		 * output with the i.MX8M Plus DSI display pipeline.
+		 */
+		panel-timing {
+			clock-frequency = <69300000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <64 64 64>;
+			hfront-porch = <72 72 72>;
+			hsync-active = <0>;
+			hsync-len = <32 32 32>;
+			pixelclk-active = <1>;
+			vactive = <800>;
+			vback-porch = <15 15 15>;
+			vfront-porch = <15 15 15>;
+			vsync-active = <0>;
+			vsync-len = <8 8 8>;
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

