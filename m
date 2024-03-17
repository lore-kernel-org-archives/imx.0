Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAD71CD13
	for <imx@lists.linux.dev>; Sun, 17 Mar 2024 16:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710694143; cv=none; b=t9VP3DyzNV1Q+tAG6sKuWCvqT8JHxhfsDdn5PbJ4kpP5W1nfKc61nxS3C5CgAG2ihgYrx0vVGDInfzNf1NjSt+dmqVA5MOj2tgqKXf14JKeT3Hmv+dCINvmh4iHtj2oEHUiuaVs7DHtWRDolIuLG2UwLQC+KxfAVCP0jCxYcxfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710694143; c=relaxed/simple;
	bh=3vvp4YGroBZPPJL/vGg6IQrn0WY0Oy9stoRafyY1KKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gxf6v+MNe/4rl5KQJjFamOGRK2pmZrjLSk6l2M9jw1dveGIvnmBEpK9+C/BbfFbiIT++dBZoMhraWg8m/nGC2gJl8cVtvtFO6TKJoi+Yy4s25GlPHNqKBgK3Vp+0El8rizgxkSnKiwtfz6SBB04IRKqUty28Kypuy1d8X61LGI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RjoBbxA8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RjoBbxA8"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E9C31815;
	Sun, 17 Mar 2024 17:48:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710694114;
	bh=3vvp4YGroBZPPJL/vGg6IQrn0WY0Oy9stoRafyY1KKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RjoBbxA811EkveEVI/zeqWBiurYJ4eNLs4En5GzaskkXc8cxWsXrXnkq/4mytZ5CF
	 cR2PGgjw518YbIr8idN7h01A6Z3evYoAY0c9ify4h8gbKZV/fngzdqmCVmYWZ87llK
	 qEXn6C4uvDDSsHsNxu4D8BtXdIH+df+dmsTemtQ4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: freescale: imx8mp-sb-ucm: Add DSI panel overlay
Date: Sun, 17 Mar 2024 18:48:50 +0200
Message-ID: <20240317164850.32708-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
References: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SB-UCM-iMX8MPLUS kit is shipped with an external DSI panel. Add a
corresponding DT overlay.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 +
 .../imx8mp-sb-ucm-panel-kd050hdfia020.dtso    | 81 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-sb-ucm-panel-kd050hdfia020.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 02efa97fc464..d7432ce6a7bb 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -165,6 +165,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-sb-ucm.dtb
+
+imx8mp-sb-ucm-panel-kd050hdfia020-dtbs := imx8mp-sb-ucm.dtb imx8mp-sb-ucm-panel-kd050hdfia020-dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-sb-ucm-panel-kd050hdfia020-dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-sb-ucm-panel-kd050hdfia020.dtso b/arch/arm64/boot/dts/freescale/imx8mp-sb-ucm-panel-kd050hdfia020.dtso
new file mode 100644
index 000000000000..fdad943c1554
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-sb-ucm-panel-kd050hdfia020.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2021 CompuLab
+ *
+ * Device tree overlay for KD050HDFIA020-C020A panel connector to Compulab
+ * SB-UCM-iMX8PLUS.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&dsi_backlight {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+
+	touch@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dsi_touch>;
+
+		interrupt-parent = <&gpio4>;
+		interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
+
+                irq-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pca9555 5 GPIO_ACTIVE_HIGH>;
+        };
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	samsung,esc-clock-frequency = <20000000>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "startek,kd050hdfia020", "ilitek,ili9881c";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dsi_panel>;
+
+		reset-gpio = <&pca9555 4 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_3v3_per>;
+
+		backlight = <&dsi_backlight>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mipi_dsi_out>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			reg = <1>;
+
+			mipi_dsi_out: endpoint {
+				remote-endpoint = <&panel_in>;
+				data-lanes = <1 2 3 4>;
+				lane-polarities = <0 0 0 0 0>;
+			};
+		};
+	};
+};
+
+&pwm1 {
+	status = "okay";
+};
-- 
Regards,

Laurent Pinchart

