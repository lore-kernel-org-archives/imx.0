Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB3348C4C
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 15:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955219; cv=none; b=Qdw4ivDpBwtAE44/bYitioR0af1o2fYNWQuzKRHJH61H25W+P1oIYBkrUz/guod8sY6y+JSDLciZilZRchZdSkwEeRE+XuTiPM5GgYfyiKdEfIvDYGl1peNkzCtJ1++ng0Og/AZLi/h5xSxnoWrnANqBfuqKP0L/Xf/TUIfeGs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955219; c=relaxed/simple;
	bh=bMg/vLWwhUy8geanlNCnExCD5EW8GlUfUGhIxFrMMHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AHkLN2n/OcYa5hRVlwSJQkcPLuSwFge77mIqMNa1ogem5pzZSWOnDMaN8poumvZKLg1T3O/WZOEzX6EcbFaqmqgMISBH/1kGsvOSYcsyiGK5HFDedOENYHjqLsOBiv5EpV/pn1twR9gbvS4Bypl1cqPaBGpI90cue4L3TBG+334=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTW0ytv2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTW0ytv2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4720d22c94aso2735563f8f.1
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 08:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955215; x=1784560015; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AcskjGdqN6uWnXhGp/YW0UcRAdBQsz7qHR+c6jChdw=;
        b=mTW0ytv2pzzM27w42vSOT2f3nfjxi79jOS2YvoTTdyzcM9AfDx6/66HbLkSbQxUnT4
         yS2QN/p3EKkrtCLhX8bLSnkbwKzc0paA1puUMg7pWtW8kFnW0N2Bnfz++RNLC8bJmSqk
         MIIEv8NI5qBua+8oOnSb/qsrV4ArIl34XmQM3146pbRgOwTXODDo37DJaEngUJMcMzf2
         hToFY7hJUg0yrQ0kKZtN9Oawtzmwc0RWa3N33MsjF+ZqTeymvhOkyPawYqfC6cLvIm9R
         ox3qB6DZbbpWdvIj6E6er0fjKrK88dvtLd4AknC9tn778bUbwuO9gu7IDn0YjBEuNDRi
         xeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955215; x=1784560015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AcskjGdqN6uWnXhGp/YW0UcRAdBQsz7qHR+c6jChdw=;
        b=YvY/UkxyFjbrjsFb9Uo2oEcfLaySIzmSyQQOwJjiSoRi13LY2VmLmN49YPJkOaapqn
         lgwiPRwo4fUxgFWRGkv4BqwcReRuwewLcjBFnjHc4ZAd+FFEIlVe6e6fgsKq9LNW+Tk0
         ULiiQZNKsSPZWq8psH4I9F7nDRlht0kLFo40zJrWIe4t/HExxjkSVG6R6+eKrLdbfuB6
         FQfoQE/TRviVslaiWRe4cu9VzDuy0b5GnJeVdL6F81DkZ6IDGi6+cmu2ECsM5nKcZq64
         Pt6l6SwBt5uZrkh5rq5fA3/0+YMqjJKJn+KMdcUOY4Ip2xYh8oCg+/I+28Efx+g8bBzJ
         xKoQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBJxPNTpSDFHTLPn+HXYuVv4/ci5dvdSUK70uY+Bw6bFajhh1LgH6VtqRi5+aKEUBemNI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+DFncb0lFTkTlnCgjLe8Hwa2HDdusrM/mv9ceZA/1Ih0bkqyd
	nF5n9/hkzc8R3u2FTfM79w3c47+0EsUPhI84iQnx9pCMc/EefmyIsEae
X-Gm-Gg: AfdE7ck9JSH+HF4LThwEcNuc/K+IvlNO9KO/ALDEOgvHjTCj4F0q4U9HZJkVh9qHmkH
	wQyAOGHKNLWbu3PyQKtwFuz3xPgEEuq3jU0OSMCJwD+xJAn6RE6Ys0Uh4gLETMaPKXQlJGTt1m1
	MYV06SWPgBG2570WTn0ruzcEH1qiB3w0I6YvM/fOTaiv09JEdZNMS44I9qtExnqL34wVPCJSC0v
	GG05IWkCx1OSVYEv0NRkaHjKbwTjWj7Tv7lF450ANIxtxISXfn8Ve52KynhW/cr3Nk2BajNMZ3v
	uyJtGrMHmgX9I3n1fsVtoUbV8lMowtYpYxxoMssUUXwP+z33lqrRzwe7KNCOQK8hFqVuPTRs+Hj
	jb0L5u5l2ZvrpZpl9kQZIMWisIqBX0PZu0Fd9mAgrwC8sdurBRtL3ytsspfcCR35P6FKVYLV0t3
	bATZ0trpYZToPH3QKKaGzG67Ha0V7EEZhE2ZMyE0SWHGKONO4dZ4kIUcBzIl1+ytHUwhXnf5VZZ
	wH0c9B2bE4rqdUL
X-Received: by 2002:a05:6000:1868:b0:47a:d4d6:a21c with SMTP id ffacd0b85a97d-47f2dcb600dmr11333820f8f.2.1783955214366;
        Mon, 13 Jul 2026 08:06:54 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:53 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:24 +0200
Subject: [PATCH 3/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI
 to LVDS adapter with 10.1" display
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-3-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA IPS
LCD panel. Touch input is provided by an Atmel maXTouch capacitive touch
controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 ...-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso | 104 +++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index e8a1e015ca77..9fdcc1a4c1e8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -178,6 +178,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev-dsi-to-hdmi.dtb
@@ -190,6 +191,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
@@ -203,6 +205,8 @@ imx8mm-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dev.dtb imx8
 imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..2c253018893b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1". Used on Dahlia (X17) and Development Board (X48) that expose DSI_1
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
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_dsi_1_bkl_en>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT (SODIMM 46) - DSI_1_BKL_EN_LVDS */
+		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3p3v>;
+		/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+		pwms = <&pwm1 0 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_pwm3>;
+		power-supply = <&reg_dsi_lvds>;
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
+		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&atmel_mxt_ts {
+	vdd-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+};
+
+&lcdif {
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

-- 
2.43.0

