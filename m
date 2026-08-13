Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07D747F2DD
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 13:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628091; cv=none; b=sNZJrd3wOPYWTVDvuKpGounx70Ye18NMJRBfRuWl21RQUv4RGgrHGxRC2I/JL1QzptyeU09+mlsKAeE+VuZ0HzX3GtzdtIwZTE2h5/vZqAzTM9vEP9Sa6jyvQ7c6LDJutIzg+FB7JLgOR2jqZlwrbsrSj19qKWaFe0GLxczXiGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628091; c=relaxed/simple;
	bh=VoqeMMcIsWKd8KmvgEjNw4KkgfC+M98Bdu+RywmIT/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUbVKoSMymQFjdiNENDkrtX1DABipvt+IpIA7ZbITi6uFjd/UPsqLnxf7Mqa3yVGzax98dSR7ATXPZgOqCLjfMq2bgyM/eHn7a+fbrOqDIEsi88GX4rBwU/FKm628tNT1wK+J/5L/wV2uNug5LViY2F1U6oxWmB9Wgk2D93PSi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUpFeUj0; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUpFeUj0"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbedda4c154so1357975a12.1
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 06:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628089; x=1787232889; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VTj5OSqqn1KbxjYRZ/gK5NtAndnbAvST9Z9adSq3CM=;
        b=GUpFeUj0eEgq1c/sKY3VQgTvVn09akNC0f4wf0/38NUoMO69P+3qZo5NNQVThzx7hf
         q72yx10m6xC++95VlLbfydyq85ytZKHSkHSiXUJNRbiNMMcTO0RfaUzSIZjAQMj4d7gu
         2nCTGdqIpGmvJKDgxtv2+Qe0ubXalFxq24HsyfdVWBUC+otwSb4c+KB/fZWe41yWG2MH
         J+Rx87VIqDP5lmVj93CO2UFPRJ7hfpXNEPcAYhBN+WMHU3XPhCTw9GdLHWJJetFA7n0i
         VQai/HFMi/B1x7GFSjnIujX+7+hu0FYm0juEjSnK/g+nPrgyBioxUPAaAmyB0JPoZ6ln
         bhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628089; x=1787232889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9VTj5OSqqn1KbxjYRZ/gK5NtAndnbAvST9Z9adSq3CM=;
        b=CrmiIbtRojT0mAt5xrQIalul8CPuyJFZq1tbcVB8a4iowPkiUGV5U+sbv8S5zGtr09
         58BYRKqj0afkTYd8mnQ7Y1FSIjS56JI9w7dzpAeYehueAGsAVG5etz5WmeXEf9nTuWo5
         7swhMN6gNJj8QSuO0vvReLEddbeMIbw44Qpb2LqcJC3l2bvN/oYfMfzOvwm3V1QsYoHs
         RaAhAVD6rqsKzobotpwY0YaJ0zMSKPaPhXeQpnGB+4zZfAZKgotTFY0jRc5KQgOx2cRJ
         N7JTcAyvQ6SOc/NiP3PS5LxhmsyNEku5w2b0BR6VDuxwf64mWQgONl3GhPOKJVpx0BTC
         uNLQ==
X-Gm-Message-State: AOJu0YxQfA4qIVun+mkg0YejAM3iABhrJe0fHcrouEmCIuB56FTCXmb/
	upfynJqxxt8Hl5g0yN5cD/9d8N3vDXqEPsqJG/z5iyzWrk4lt2bS7Pbk
X-Gm-Gg: AR+sD12IjXWA41I4JlbCrniqgKgcXqcBF8fcGVCf6rAwP8ZzfaAvfnaSFoGv0lL88eT
	61eINOOLt1okJlzGQfQBFd0vxwsKv4DGlkhdXc4rjm4PATKbRsnjzRNedNBofNnwkMVX33pMkUH
	ZXf0geBSzO+H/Rj6ypiuSVSnh0MgiOcT61o43k5tHi5FszD2CzF+24nU4ruu+Jt9khnH/84JxyG
	eFLiS56Smhtyo22DwNtkvAgbdUvgf7W430aaGM8/rPe/qELTydZHLraW1b30WETzHeMe5EXStVx
	NbEoNlaAA01a6M6rmx7yvLxCABdlTkxvWPyWsuTY8bbNErC8j9DSWWUL1xNCsFHJkVDWA+L6cBg
	VUry2DKaa9UkJ3gd70JEF/E9C5xEkFyUxbqW+Dmf78Pk12+TBLhmAtIuyAtFDCgFeNjoieh0PWd
	/J5Sr1hMBiIPLtt+LDkH51UwiBvWXUgZBdSBmr4domjnyg9Qx+uic6nCsNXeASmHeNZDs=
X-Received: by 2002:a05:6a20:3d1c:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3cc550cb92amr8355198637.6.1786628088759;
        Thu, 13 Aug 2026 06:34:48 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:48 -0700 (PDT)
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
Subject: [PATCH 3/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS
Date: Thu, 13 Aug 2026 10:33:32 -0300
Message-ID: <20260813133335.1941580-4-leoreis.costa@gmail.com>
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

Add a device tree overlay enabling the Toradex Capacitive Touch Display
10.1" LVDS on the Verdin Development Board with Verdin iMX8M Plus
Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
on the Mezzanine LVDS interface (J10). The panel is a LogicTechno
LT170410-2WHC 10.1" WXGA IPS LCD and the touch input is provided by an
Atmel MaxTouch capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  5 ++
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso | 71 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c55269a0532a..37ae0954d02f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -508,6 +508,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
@@ -519,6 +520,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
@@ -528,6 +530,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..ce426288081c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS on the Verdin iMX8M Plus
+ * Mezzanine LVDS interface (J10), used with the Verdin Development Board.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
+ * https://www.toradex.com/accessories/verdin-imx8m-plus-mezzanine
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_mezzanine>;
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
+&atmel_mxt_ts_mezzanine {
+	status = "okay";
+};
+
+&backlight_mezzanine {
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
