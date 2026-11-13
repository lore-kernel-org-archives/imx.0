Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584692;
	b=wzMIvBjq50mTF/hq7YqFDMvHrXVvGDIqXme9fMcJdrY/SdHZVihsm7yHGXqdrD4uAgO5
	 kMTiiZPX17ntv+TdvFNoUFc9RObjPBuVFmCiNIRVkeJPYADKHeLnuCngEBFwxgLPpDlvW
	 6ftROO2n2oeYys7KG4GMl5NkGU9mCoAfXyIDVRNPNhhDO8myZgA4yPZgZFMSo7up/+Uzd
	 sFxP6RkyZCeMe1IOA7KwpaHfPxT4rvhbxNc49GHZxdeLfe3M1K7s1jW5j6Cln8Zo2yDkL
	 G7qlITrvd37OU2JH72S2f7vrPhFl8pd1DGA4dWZ+xJrFWoVmn7KfT2qDdDwochKIPXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Q0mk9TaZ4jjNeW0s27BsKd5edLJnpGl4TDx2zVL7cGw=;
	b=FsQN/TPabGcvgKGAnGlvDnRVkVW17CQCisj6IDIVjfAXzQhCBjzMJ0bm0XDJUBoDNLsb
	 u1kH+jwQZr9oRRbHga5HiiHGATP7s+eEEunPLS1TKlEQ2cf7S5ka2i3VlQ7AF4GpI7cSU
	 9JNBvOvuUYw4LIlGgY7fLGtLKUCaoUW//C72WyKv2Lf7w/ZAdYRuceS4XCayytErt1itV
	 VzcwbFO2J2QH/smKEarIOL4Fo1jcqALjg5jq0ns4BTbtENCMccq67zp6Q6AJebG9UJ3VK
	 3eEZrKLyuaPKpf022MUJXuYCuXLdCAK9wp3AgfsBGjcFT68r4fWzPdjG+PATkv1Qu6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXWJgP+n;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DF7606A8A9
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 15:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1DF7606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXWJgP+n
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b31448caccso9679817b3.1
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584691; x=1795189491; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0mk9TaZ4jjNeW0s27BsKd5edLJnpGl4TDx2zVL7cGw=;
        b=VXWJgP+nCkeLU7K/txkF5zZkTpYLtM4TMIa/cKXbMK5FZO+XDk2MOO9AsavMsm58SI
         AGPgw1UPZuV328aSdlw2A22DtsXqODQzZFOe+8zQEld3qQNkr+fSyw94CgDWYe4TEYlA
         9KeB+Oiz8qfF3yPy9v8wWmnA2WWvLu2zpt1meoF5SFMYUYy/DgKFDgR8OfAAI4wrzO30
         vh+SsVI3o6y6pTFcqgyyWdnBVNLJY4DsUn7A3bg/gUwkTTiel8CcWXL5D/qstZNHHEKw
         wMY9y6KYf6TdPQObkpUJuaXF02ULiTj0C0n47HeSJPhi+f2L5QiSVmZGQiBwTrWQdgE7
         LSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584691; x=1795189491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0mk9TaZ4jjNeW0s27BsKd5edLJnpGl4TDx2zVL7cGw=;
        b=OvhD+xrvgL0ubmkAF/HFnjfNKvknNSOd+/P8JmYhNzWDWFd5T8yMHGYb0Clf3nYtrk
         sb+a7AmrTkb0AYXiNHE/2u+NKZ51IJZNtj8S/X+CHEKC47hgBFxPD8/ZQ3ge4NiEQ8hA
         M04tZImbvrTgmQdbZVbxCwN4nvegPsV3bDN/onSyIJN7Y+IKJLxtB87siukOBemZhsqj
         wiVTG+nQzZBOh+EqVnqnctdjox8p/AHlc0gtv1JKV8MnTH4LY3vLG0dymBPZLQYzkeIB
         3LShvrXay/r/85mFpK+zstIwH+xW00lmsq6KJ4wSrcde9FmaLeKQsg0+AvU49d6Lh/54
         dNgg==
X-Gm-Message-State: APuU4Z+UeujJRXvch1GVtXHGV+cZj6Q76GHFwEx40o/y2/uEbmOXi1SG
	GH9tTWRIDDw/sV6GXdju8ucQOt3LpMP4NvdiogtM0G4xP5RHCr5W5xvV
X-Gm-Gg: AYBFou0gwjop+lNNUOaJ7CEbYJWqT2U0PIoIEdFlKcrb2Sm04xnoLOUwZYvW1ONkhoY
	dBC5p4Nj9UAsgb+FPYahDt8Y588KUrjU7GCH1RPjj3FFEuKLfnCgC++BD40RVdKJtUnvcvE+gRi
	fKhq7g7x18tjuPSoLSUpq+zhQJ8fUOw0czyPQhDXu2z4FrG4SwzOCuXPfSEY6BgtD6pffiQZSsP
	xvFdx7BrMmi9sUQN6ctA8EuN2e2oTAJfTYl3J3UvGvPxG919dbGuNKU++mOjjutsTKzpqEr+Ni5
	GDXaWXRo08SlrdHlGYVNfqptERLDCZYN1+SB0T08hxFHP+IzpwpCQ6/V0HJYvp5glgQw69oPQ5s
	IUxoM7l7JZUSlnXReqHLT0rIpdPKQN9YYSk2H6isBeCn3OQIY2hEHphkqu4n9ygbFeA/vPaDErU
	N1kBZ7sX7ZTQi6R3IXS6ABrV7i3VADig7JTFnwittF/SI9rPvw5/DRPNLbDwvrUM3O//W/jdANk
	ko2JrSxpPXGDfWA4SotvZvAk5yMzhiOO1R4ZBmQ2lpO6TiPpfNArwddsXAt+pvHf98fjmHV8z2r
	ieFZgaoQq/yF1E0FvRa6s/5krhPdagyV
X-Received: by 2002:a05:690c:e1c6:10b0:8b0:aba3:a3e2 with SMTP id 00721157ae682-8b4aa352b0bmr14048677b3.37.1794584690765;
        Fri, 13 Nov 2026 07:44:50 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:50 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:07 -0300
Subject: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS
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
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-1-59c45f0a0d8e@toradex.com>
References: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
In-Reply-To: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5076;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Tz5ERP1gVTN03h114IyqCZCKmbVPmIkPUTjRMol8SJQ=;
 b=wR+GtWb98MCONzVOGNbUDPA93mS4bj4kcZJot5NE7c145bcOglNZ86saT0GQG4JZBxBfB/aPs
 MpDCMjXDL1vDV2oWrh7/oK8mtUXQwPIjueZ32LyQJfdDqf2tNuswd+k
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via Verdin iMX8M Plus LCDIF on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is a LogicTechno LT170410-2WHC 10.1"
WXGA IPS LCD and the touch input is provided by an Atmel MaxTouch
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 95 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd5482843586..79ba27665f4d2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -738,16 +738,21 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
 imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-tdx-uart-mcu.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
+imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
+	imx8mp-verdin-wifi-mallow.dtb \
+	imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..9079c6284dfae
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso
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

-- 
2.43.0

