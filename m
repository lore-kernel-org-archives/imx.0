Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584697;
	b=gDBCNMhX/25einHbuwAPZULBBUl40UUD6BHFAO1c0SFvCGBjZ+IdykNGy4EE0omuVTG2
	 B22pKrTo9uy2Jhc8SHpyylGH44uTv6JH3PsDpvAQ2SE9HucT41Ep+u9UgpZltWFlGmTUm
	 Tq9SKwx1kVft6bmih5NJolddybGn/wXCtUxHrf5dWq+/Qbn7r/5IAeon6a4hPq5mPtTG6
	 b2lbXerCzFEv8+IVivJcOl6MPqSTLXq5Oy+lTNVob0qEuimF2z/jRm47DHtzBfMWmXcdH
	 Ern5hWRF+S914QpEXejXqKG+dq4EUFODJHGRdG/GCp/Cf+JTcmaOU0fjhp9eHD+Hopw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=HzZaPDLW6Ok2/D816MTzOvdhBrNsHMyuYZFKk6EjbIE=;
	b=aWTUhtcrt4cYiILF5euwFkAFX42NaYnNeKXh8wMPnxdZQWqTmFQ/cgGPAR20THE0kW6I
	 y0n8yMX7NR5wB2lN3hm/Zrzr3BnFFA4gkBFMezE/oLB+GYRNLgVRqsB7pgX04q1c65NHv
	 +DFjY8t2V5pxU8myGuKFhgakjNze6H8I1TddwuTh8VEqz+tYTPBSg89Ci8CzcFAnyLavu
	 o59uzxPZAh/ruZohLrcBBPrLEuGjrdly2pq5LWq5rPP9PvF6luoLPdyxeUOArE1QcSkbw
	 5FwUe1xgtd27RXxXP6ywzcr3qp3mkmniP4hSI76qvR2p+iPRSNGT0ZJXxRy+zwZtqlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+rhnrI7;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EEB606A339
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 15:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3EEB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+rhnrI7
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4a15c84c5so10591997b3.1
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584696; x=1795189496; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzZaPDLW6Ok2/D816MTzOvdhBrNsHMyuYZFKk6EjbIE=;
        b=w+rhnrI7HGxyCImmeS9Q2vTIvXu+squ6ydZemEDTa2Nw57p9NMZL7W3KGSvFAtxYH0
         +qyrvwCVoWgvTovctu/fGo33iAk18y/yAQlPrGoxFT/70DFCR1S9/b0kSmJCP58PMJOq
         WL/a5wtKt8foaRaHDEdMa8feyilfswHsM7/MiKLp3HGvEvRYP7XVeXVqXqE6E6he6YIh
         QUTlN2AYPFmuxYncvxpecgML0wsBruqUZMNKre4d84xnPTUh+viX3PErXzht8yq6XO3u
         R1B0Iwcq6IzWcfV0dDMvzgiEjZJ4z6GKfdSP+Hy65ls5SpEnhcqyfMEjD0oxwcCiYO1h
         Cc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584696; x=1795189496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzZaPDLW6Ok2/D816MTzOvdhBrNsHMyuYZFKk6EjbIE=;
        b=liNVsX1os8UsajHHSk1fSp3uwfMyyHytsN2usx2Vtz9iv7+ReOl76pKVhfy/mFE1vT
         KLiVqX4JhNLDJIoeUlr8CgyWeLrLht945wxQDCC+8uMROyJu4UNVI4LiYfbC56AyIjF/
         q2/E14r4fINctPkGMESJBygkD4Tnrj/EUZ17H/45jO+fuy6zvkAmeBRveiTCuek/GN9E
         y1kNQfnw0E7B67p+z2McdTwS/ng+c1MDEFIP8LAYkSAvXjPNMWLmA0xvZedCHK7RJA0A
         d5INatNirK8PU/R1U5fNMa/mjMEAyxLSOsOyhMnF7fHqavFr5H0dMW/Zgr5o+R3rUMAQ
         eNHA==
X-Gm-Message-State: APuU4Z9cb6BsM7I1jG3OoFbHi2vWCl0gYjLpiHeLzJ3dfNBRLBbC9EVw
	OQdvFC5YEPP2uR9XbneDiYFTa7XCQp89UhbdJuZ+bzak4BzXBXcqzXp8
X-Gm-Gg: AYBFou1/cFrtxReBe6c1yqk139eXVBTiLgRPv0NwAD9aXzpMHhKGBSAvqF2FRH3qyPr
	et3zT+2ef9PMNsmIqEqjsD+p1+UStX9SQD4Z9Zc6Dq2QdnWLTHpm8J2MWluGfKFkqzvlXlPcegS
	4WCWd8TDSoLaxx+5kqYnYdGvQ8EGeR5cqp0GAXO96J/iCreVp0WiaTzaMoHflQBvKrjR6CCPXdU
	mg52hl116/kfCtHNiwpzCZZiiQrOezUd2RlwMpKUdhIoIrWFuR2p4RXoAY5haqOheVlm7DD0Y7W
	xMUnwTWISrodDAtNcgVlpgtaqrIXMOv+sUOzbnVGvqRhDzxLaUxPIBHtutAkKfq4tdOfx3aDLU7
	25faWILTEkCzzRa/IrOBCbz8+ZGv5CYzE4iwKt9VM3RqVpIhZtI3ih1vBrc80py0IWsNJ4N6co+
	vjCtlztiFshPhXsdu3lxtv0KjJUzysV4dVQYZ5xcDsXKbUrcnnpm+amzGrDl4dWbNrXVnC8lSUc
	Q+vcjCorZhXRJrUcMtfa8V3cn7uCrfE2aDe1HBDRFeWYknmmqlER7yz9JlRF6dX25Hoaj6X2zt0
	4c5UO2pOgp3vsdcZ22Tz1HEI+XSB5cVJ
X-Received: by 2002:a05:690c:f8a:b0:8ab:485b:9bc8 with SMTP id 00721157ae682-8b4aa257b89mr17110137b3.24.1794584695620;
        Fri, 13 Nov 2026 07:44:55 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:55 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:08 -0300
Subject: [PATCH v2 2/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 DSI to LVDS adapter with 10.1" display
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
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-2-59c45f0a0d8e@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5177;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=T1cPEZIk+cuERyGphRtG8eWr+AAKWp75eJwZYeMfJY0=;
 b=LHKy+f8d1gKR/GQgJynp2HgVYUNYmk0XOSunC+OOaw980MREimd2/L5xubXvJDkIdWBDQcgh4
 uRE4lIFrIVkD1TX4bIvf5s3tzcG6LCXacLKXzfpm83SN8yT2NiDNGMi
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA LVDS
panel. Touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso | 94 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 79ba27665f4d2..4cd72926b80e0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -731,6 +731,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
@@ -740,6 +741,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
@@ -749,6 +751,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
 imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-tdx-uart-mcu.dtbo
+imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
new file mode 100644
index 0000000000000..da05a02568893
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1", used on Dahlia (X17) and Development Board (X48) that expose DSI_1
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
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
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
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
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
+&backlight {
+	status = "okay";
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

-- 
2.43.0

