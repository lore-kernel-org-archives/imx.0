Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7763447DFBA
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628085; cv=none; b=JqGAFYN2BBxv9upJSAcLxMKQHo7o0Af8SuQNjMcpAfJjd9ZXem1cCYC6YWjRpQw6QMK4QDYGytuCeSMAYrIOerxdraaw6CY/ihvimKgz+wFXEiORi36RZgNCTDJ4pwsKIp9k6R6e1ur6PnmhxNf/8A1jahlBKSX2Ef0nfB24Hcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628085; c=relaxed/simple;
	bh=Zmo7S6bpxRsPyMkFnvRz5xeNTlw3cAjr0pSXsb5n+QI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAYA5qCZF3kCGOGdNkhXr+37nucsR3LBH3SjLG0TsdHH3ovQjX2HQQB/iA+pdZ0Hn/74YkUBxLNIDWGCGQCpntQTQmVjAh6x/ITeiR4cJ+ZrGnpJPYM320DTI1ohoGW/f5E/stB2SykdztSSdsPZvCLAJcp+NZDzzoAODL6tPkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5MTEFld; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5MTEFld"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e347638adso928225a91.0
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 06:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628084; x=1787232884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=089KQAiVoNPGKgHJpaInzv/69PucbNyqkb0494Vo8Ak=;
        b=g5MTEFldrlwAGucN7oWlBPXn7GoQXlDR/VI/jrYZHul5brmYBtCRFaZE47ag4GwwrB
         JaFNal/JHziluxSpb/wdavyS36Uvt4W8/z1uXcuyGErzvzhH7sVGgrjeSP6y6WxlMHpd
         u5789ohdm/w5XQlXKkuJBf/khbFtvpOu5+K/QmHwr32uZliy1JU2IsxWT3/mU2VSr/Pb
         IyqHnpa1yVpak2mE9DFmjuCSSoUU0NV2iD1UgqjBt8L0ynCgbMdyBqChOwyy5lACXcB8
         TssgtUaXkjlBJ70wihTheL7gLgyJyVvJnzgWwMLphy5xqc2o8PCI3Bb9xiSiqvnTdD7t
         PWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628084; x=1787232884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=089KQAiVoNPGKgHJpaInzv/69PucbNyqkb0494Vo8Ak=;
        b=fSF4jpfMvvdR5scj4+Rwb/KMe+xuz5aBEd/D/ulJvxYixqWK+AqD/RNf9SjYRh/fnM
         YEsdfhUbhYbgmn6NrJVr7Q7R+RKpoghrbHTeT+TuoRzosHuXfKrCf/tI8lDMahn3DQcC
         mjZTVUBjbPJtoAqAUoW6MddftyOAoQFyA5UJ/nTYkB/lQKDXN71LdjZMo4Rgthm6I7DL
         sse0qL8oEvjeY0/VA4KFj8HE+TwN8bMfy9eH+/Oaq9RMbuCm+SNXPe69iS08mBKUqfjr
         t/UtoYisT8053SAjp7qjZY4mPDeTeL//ScNo1LMYnty6YU9d37QFeaey9280gY8EGaaU
         bjkg==
X-Gm-Message-State: AOJu0Yzx2cohYi1RiIC700YWOndKhziQx+xE3YkzL/M5347w93+x8TOT
	qp7BD/USP7m7RrrXKsYWt2KnLAcZI6GXz+JQGknGv3aJ2pUfVqt2NqoN
X-Gm-Gg: AR+sD135BTrkbmSE7SeNSmo6blhpyt1YIwqHgIkS42RNGxSvm3nzBx6ofQ8GHWrz7x3
	4fcXIAp3jEnF9BaqbtPjaT2Nsiz+LIyr6il+P9Q/BRb+1vonsS/rxX9Isdq1uz1sHBgE6C1IFUZ
	I4yFlaWQETFHMmQHflyyO/D5rpwkjnOWm69qNjRa5V8iPrUyX3kxJb5HxRPCR+Assj3cYRXHmdJ
	EaPHSCvC3VC9EIj+UzaNnztENNYSeXN8OLLw++7dk43m5ddabZbMz4x+vy6FAj+WST6X/H1/5Ji
	GqFczCbydnjhiePiYUQUnUU1Ea0cQOFpOnzXwpbJgyIRfTRzQAZEFgvtCKQYEJhphzBC87AQ8Tn
	Dlnx5CY5WslmPh0gJLYmAS2R0jQwfnp0b8E8aE/OzyjGVA0uZUFmq0Gw9GcGlXGpayaJV1lA7cr
	cO+dYYVJkIqlSDYJUbEwGBqZkZXyFO/3/78DLloUkaKecaUrAJ3shVRBTwGKVQf1gVI78=
X-Received: by 2002:a17:90b:5310:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-3931e0fcad7mr6769440a91.10.1786628083440;
        Thu, 13 Aug 2026 06:34:43 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:43 -0700 (PDT)
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
Subject: [PATCH 2/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
Date: Thu, 13 Aug 2026 10:33:31 -0300
Message-ID: <20260813133335.1941580-3-leoreis.costa@gmail.com>
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
Toradex Capacitive Touch Display 10.1" LVDS. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA LVDS
panel. Touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  5 +
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso | 94 +++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index d643f85baa7f..c55269a0532a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -508,6 +508,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
@@ -517,12 +518,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..da05a0256889
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
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
