Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC88337F315
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 16:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910286; cv=none; b=s0prFZ1axpyoGjm9P8cU0nkPWvIDdGL5aLmJW2YheNdaZvmG8uNW2rE5Qu3uVIpMDdMdbX+NSkqrQXFw5F6oUsDcWpmtAv4Hjt+lj1DZvR/xE2z0lmBp880o72Ehas5lnDLcV5oRcP9IZHdn5qYio80lOlhACqKJXQiudhOPIr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910286; c=relaxed/simple;
	bh=6ir+lnAO3bNg1lXKqI2vz7x7sgZJDcYXYNMnbh+AQFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VvDWU1cbj0ofSZxTfYJ7zfaphcgV/u4yQ7PJ9zvVQ6Zls/X/4c87l/vE1hOcnvqIWIi7WGY7SEOj6iPUCe+gTWjHJc7u2u0V2XglQw0J1QNgT5Zimk9llG+klI891v9SdOxXyHiBH4C83Brr2uVH0KyNzXzWY/J68fujEqgrFYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecTSXNd4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecTSXNd4"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso629114f8f.0
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 09:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910282; x=1785515082; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4GlmrO2wvSEO/h8L9kCT2VN9gDvXyxGV+hLNuzvXEk=;
        b=ecTSXNd4hjZ/5j2B5xfWJyx8jvef6jOmZdk6IVIckdCcAidIWzxsBYKTRACtv1tZy+
         mpF7PWAOiqtJC/csgQmFLxsXwD9M6ZaFDInELcRMDYJTmrOcMj6GBx83sVeGibP+Wux2
         Mzxz+KTDBOQaBzGUfNhkgNWImAt4OSYDab44CqE4QwhEBq8cBbB2ffn/V1mTHXsUjVE3
         a7pTBzjYqd5b7zFX/3TQfkC+n/NJ4ujZp/PNy+bT541h0QKqsrzwjxGLHGH/UFIG1i1j
         bistMiirMy9p/F1PNmeLSseWRnmZv0scDag0Wime8JVgqPXMxc8/sFyQ+Uhdag+4XRQU
         YJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910282; x=1785515082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4GlmrO2wvSEO/h8L9kCT2VN9gDvXyxGV+hLNuzvXEk=;
        b=TZLZL0WWz/3QXeP4yN5OiHboKLfeR+89toM7hByCDDF1U/gDdRj/qBUhm01sJr5iHN
         JhyVZah3kaZU1bdn5g59Pxh/zl4aah3lCetZF4HUZoHqZBux9nPn1AZIAW8CWMP9PQaR
         x3vLgR7gc1YmtpaIe8tqc7EPhe+6byzbSL0jqC4KoL1dceuaBJmmT6xy/CtBcP4b/cRo
         x5tjCu4X5dNOakTQxCLWtsSELo07CsNzQBhlhUHxkkeOxBX8LamaWvD65Zq1xsd/guWj
         HnN68eURInhh3KWb+XaYWiDsT9iS+nNjvQUWMcPyHKF/Zl/8715OIxU+WJ4IGlPWaGoF
         uAqg==
X-Forwarded-Encrypted: i=1; AHgh+RrZ5fmnEDZXrEeV9xzJt7IVpcHRwhQMCXAIoRweOw25OZd794jhHHTDtgWOcKjvVoXRPyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr0Koyr+D5M3yBWM0W5/WdsNA1pBjeGmR1mfT/TI5fuea+wH2G
	U5VFhoVB2TD2bOyvk5nD3FVJcuKLCohRWg7bC1YRNpEjo487OELghXDc
X-Gm-Gg: AR+sD13HCDnAOCbwctZCWtE2sPXuBn7SCyhNFFHX5GR48fwxmgv9HUbbc+SE46QFbYM
	MhuCKHTB3xvE10ohthpuRu4Ki1x4b7KlPQbrie0Gnrau8CIVTH79N5B9vlPbcw3qQ5nkLqOvNHw
	Ou4d2gHvbD9Ob8PL+x6knLjb4e0vAlYIhNMfPgVvkBs+mGKAlE8YJPNpNuLl6IXc2Z6l9/x0USU
	QyowbDXmvsHaXvSGAe4hiWH8VLuYel25anMJh8A8JDrj/vzj582ptwFDHfxLYlOcFfOXz8iXqeG
	n2dHnHBJNrI3Xf8Hhy0Uyh/DaLqHMczKPSo/YU6MMRSOvkVZUf8MuzyOY8genoO75/FB9iYl7vk
	GQ0904q6XJhmFVKA1iL2c/YK5Unr9xTxETLtE+i6PHUh8w0jk7+dV7cvTOEUiW8IE1s4gzHxcHG
	PAI8IvXWCkCJzmgjc8gRqB7AMl5nQp4HG0VywgNxUEZfThqN7WEahxxO0CQk7rqBbZP4vqvh+B3
	C0otljlLSb9hUl/
X-Received: by 2002:a05:6000:4305:b0:47f:93e1:e7d0 with SMTP id ffacd0b85a97d-47f93e1ee92mr7483001f8f.36.1784910281885;
        Fri, 24 Jul 2026 09:24:41 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:41 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:28 +0200
Subject: [PATCH v2 2/7] arm64: dts: freescale: imx8mm-verdin: Add DSI to
 HDMI adapter overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-2-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex DSI to HDMI Adapter, an
accessory that connects to the Verdin DSI_1 interface and provides a
full-size HDMI Type-A output. The adapter is based on the Lontium
LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the Verdin iMX8M Mini carrier board
device trees to provide ready-to-use DTBs for the Dahlia, Yavia and
Development Board carriers, in both WiFi and non-WiFi SoM variants.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 13 ++++
 .../dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso   | 88 ++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index dcc0464b4e80..f55c570cb3e3 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -178,21 +178,34 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-zinnia.dtb
 
+imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
 imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso
new file mode 100644
index 000000000000..507d0bbb5935
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to HDMI Adapter on Verdin DSI_1.
+ *
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	reg_dsi_hdmi: regulator-dsi-hdmi {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&hdmi_connector {
+	status = "okay";
+
+	port {
+		hdmi_connector_in: endpoint {
+			remote-endpoint = <&dsi_hdmi_bridge_out>;
+		};
+	};
+};
+
+&hdmi_lontium_lt8912 {
+	vdd-supply = <&reg_dsi_hdmi>;
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
+			dsi_hdmi_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			dsi_hdmi_bridge_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	clock-frequency = <10000>;
+
+	status = "okay";
+};
+
+&lcdif {
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
+/* Verdin PWM_3_DSI (SODIMM 19) repurposed as HDMI HPD GPIO */
+&pwm1 {
+	status = "disabled";
+};

-- 
2.43.0

