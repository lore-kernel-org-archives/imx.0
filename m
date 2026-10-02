Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D82371889
	for <imx@lists.linux.dev>; Fri,  2 Oct 2026 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927809; cv=none; b=AatlBo5Y+NjNWrMdB3ZKY3x3kazhuoTzNh+SVY7BQFCF0d6k5TyyOCH9oYL6lM8n2D2F60H8wNIhzdR4nwa0YshzfxplU2BNRvwDGbCpQ3dYCdGKDU4/7YOZH4g2+IGTl7DtX3K5ZLyVfbKwvdC2Jza4MQWeQIRflIv9n/sNvIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927809; c=relaxed/simple;
	bh=15KlGrAuHqAXKMBwWOYYGuttAHdXhkehH+S3oNKzL54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cURAD3xwSthxHcVY1BLQgbSFuSFtWjgEagByRbg+WvanI9AUvZVeKT7XlTF/NczYgG80WIgN6Zzc+zSm9G6vDuElDLKaexC1GWuGVQGTDc85gwPkVIYW1xTUzI478fYYKAlhH9VffGxLpiRv/GhSMQTQFPkqEfdcFoC2p50X4zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5gR9+dP; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5gR9+dP"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af9f88c95so1160098f8f.0
        for <imx@lists.linux.dev>; Fri, 02 Oct 2026 00:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927804; x=1791532604; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6LcBsrn3qmklfWXf6wHISNXjWe9EOmsJSpM+lvYuXY=;
        b=i5gR9+dPMxDRnyd3YeAM8heBOKHFsgFEGuSc5Rde+ABADx8qkYNHCoXW69zzFiz4ZS
         cTWyx0FU+c8KQG9yRwCiBqdFFGEB08f2uB2DsX1b83gxN3TCqu+uAJroj7ksWXvS1FPp
         GWVGYmtisLd0bv4hy+wbrW22mGAeFhP6cUOV7ldyjVI8KvoTn/5F8e6BzOP7K9tK8cLR
         AZ7G9wc/XFd1cwIDnp7/FblSDqaAE4MKGEnI1nx9HpLcMdMIhC88cBJfgSuRvszzPvWV
         bGIVs/8CLlD29vJ9ZOBRWuKiUjswE8d3i5oR/bxyy62FHU1c2zFUjVIDLMS+9iUHoqyb
         sbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927804; x=1791532604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6LcBsrn3qmklfWXf6wHISNXjWe9EOmsJSpM+lvYuXY=;
        b=aAbe4uIHZD73sQ1Sf7hIqatBU9stBcuX1P1KeigM/m3X8t8kaqJW106nejG65yDv7M
         6sPVWMG+XOTVcNH7gnzCuT15aZ5Ko1zxGm1nkg9cS4BB0MTjOTih7MJAxBuXUIX9dGY8
         2+S2GljIRCegfTHZRK3mA0NSLTo2JSbaZFtMgx49IM2HY4ldlK4+fXQ2iUkbxME9z/rc
         TTMeruP1QnPCypjQJKFiuH8C7iam06tEptqZCIE0a8oRim+lwViG2+x2mzZDzqN0e/Gr
         ZMk7Fd7S/kO92J3R6iFlTDCWRRy5VIlQlxn9w5XWKEh3WAq9cG3G31BFgcph7IXsumjY
         OTJA==
X-Gm-Message-State: AFuF++nmhL9mgRMIo0/uakjUPwRWsunDLX97EZ6RgkaHDuQ6u/oQphVJ
	fooGmyiYPw1Hw2XLnVa1hglENxF1+54G1YKTwrmoi84YVuHbbUjwjCac
X-Gm-Gg: AYBFou2KpI88xImDWOp+jPfEUvOm0CL+jQAbxNGdmoth71y/M0iZya1js3PeEFiGL1g
	hb1h2B5qkBIONBHiMf4avYH5BhDBRFJ4q48SXKdLkUrIqA79G09dWxmRIwtR9p8EZimM5GVsWYR
	RsrGUYk34Uf8SK8bk29F3o5UU7RA6N3IZS7d4CUhHECgP/PNGbaQ6MZl8rmKd4aNj63PoyORX3h
	dGSrp8ZnzGpSbL4oGu+wH0tD+Q2KsIkyNgRT6CC2SwG2ZEfnWzvqZzjuJfSC89FN+wIy+bUS1Pq
	kFoMagR3qs8To2ytTkTyox8h5B2/y8h6Fs+F73Uhjflig+QJI3dnnDPGR9CQELdq3Iq0DNrb9k1
	G0+nuTzPgbijl2tH91UMZJcRtbL3kyGdTy+mX40GzK0JhJ3np30io/t+dureiB1jWL3LUMR1AuV
	pxoXyLHCE+ZJVTYavGoL/LX+ftmrQLefUgviQQdHPoBTTuj4Gy943LQ6e9q2d+pvVeCyUCnvy/L
	mhFo8+usI5tY3xQrOOaYjhPSHwxCj2naqwEMHED0FXF86jvj18sLGXuk5TzlaZJPpi9R0na2A==
X-Received: by 2002:a05:600c:c102:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-4a027534963mr27502755e9.4.1790927803714;
        Fri, 02 Oct 2026 00:56:43 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:43 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 09:56:37 +0200
Subject: [PATCH 1/5] arm64: dts: freescale: imx8mp-toradex-smarc: Add DSI
 to HDMI adapter overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-1-f578c63fb676@toradex.com>
References: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
In-Reply-To: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex DSI to HDMI Adapter, an
accessory that connects to the Toradex SMARC Development Board DSI
connector and provides a full-size HDMI Type-A output. The adapter is
based on the Lontium LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..b5519fb36b5b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -709,11 +709,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
+imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
 imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso
new file mode 100644
index 000000000000..270cf567ace1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to HDMI Adapter connected via Toradex SMARC Development
+ * Board DSI connector J44. Open J95 to select the carrier DSI route.
+ *
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-hdmi-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	dsi-hdmi-connector {
+		compatible = "hdmi-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hdmi_hpd>;
+		/* I2C on DSI Connector Pins 52/54 */
+		ddc-i2c-bus = <&i2c_dsi_1>;
+		/* SMARC LCD1_BKLT_PWM (SMARC S122) - HPD */
+		hpd-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+		type = "a";
+
+		port {
+			dsi_hdmi_connector_in: endpoint {
+				remote-endpoint = <&dsi_hdmi_bridge_out>;
+			};
+		};
+	};
+};
+
+/* I2C on DSI Connector Pins 4/6 */
+&i2c_dsi_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hdmi-bridge@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48>;
+		/* SMARC LCD1_BKLT_EN (SMARC S107) */
+		reset-gpios = <&som_gpio_expander 7 GPIO_ACTIVE_LOW>;
+		vcchdmipll-supply = <&reg_carrier_1p8v>;
+		vcchdmitx-supply = <&reg_carrier_1p8v>;
+		vcclvdspll-supply = <&reg_carrier_1p8v>;
+		vcclvdstx-supply = <&reg_carrier_1p8v>;
+		vccmipirx-supply = <&reg_carrier_1p8v>;
+		vccsysclk-supply = <&reg_carrier_1p8v>;
+		vdd-supply = <&reg_carrier_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_hdmi_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dsi_hdmi_bridge_out: endpoint {
+					remote-endpoint = <&dsi_hdmi_connector_in>;
+				};
+			};
+		};
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
+	remote-endpoint = <&dsi_hdmi_bridge_in>;
+};
+
+/* SMARC LCD1_BKLT_PWM (SMARC S122) repurposed as HDMI HPD GPIO */
+&pwm1 {
+	status = "disabled";
+};
+
+&iomuxc {
+	pinctrl_hdmi_hpd: hdmihpdgpiogrp {
+		fsl,pins = <MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x104>; /* SMARC S122 - LCD1_BKLT_PWM */
+	};
+};

-- 
2.43.0

