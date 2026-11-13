Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585133;
	b=I6CiU9Xl5zAWnQuJLW/JT6fyP8u4HpGstdB0LQfZtF9/V50hoHFDF0IpYj8EHoGOFlDo
	 Dv60CV+SVefGOR3IdpI5HsKVDhggAFmer8BiNnA5HB1GS5eyrPig2rucM5O+6Dvouy6Ug
	 K1SCoUEBq3mL+dV41Pb+rPlDx+H5eZx8oorIq4ibart5ZB7VFuIs7BSHB41sCDK/vfw2Y
	 UqHChmrumqpgNKi7x9YlkLaGeIMbBYTKberk/IVOfPxA7t7lw7nMHLznFXJVhUMdWQqYb
	 4JwXxJnJfErJ8Mxq/9abIdiMI1XD9tGtqXPTM/NPX/JlK4IfDx3PxhB7MHskq1PEaWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+Ik0gHsfdd16nhHnjQyqDcxvqmph40nuj+OLJYJgm3k=;
	b=EHl766uDxJW1/aVpa23L6SI4oAPF/OEK7Dl0IwPvZUx0WcQYe5DwsiejHBPbg1Vi63KY
	 e9Y/MNOuiE6qThiWiSbw11RFHHln1r8cHLhmT6Ha+5rWm3V6ucfLXeWS5uRUYEvogi5fG
	 xexT7xZhwvYJHEscnbG7KwWEY6FuIVFaQN5SX9WKp5P+EHJ4GmoHBUuzm3IBVCVIiNtyt
	 slndTBs9QnqXHwAJ8ki0SyX0sM4cadB8Df08mHtP+yzontLNphEmSgEsnceV7BJWpjhHj
	 UWX1MdPAltP+KEXiQrtPwl0XCp0CwS2+nF0oaQMPsrOKa6XOQSz9DXzn8e0TxdoEfPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ehSC8qf6;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865C0606A331
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 15:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 865C0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ehSC8qf6
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7a6e560f580so1951598137.1
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585132; x=1795189932; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Ik0gHsfdd16nhHnjQyqDcxvqmph40nuj+OLJYJgm3k=;
        b=ehSC8qf6HLlzjndwOzzvNMYwEpTNhzkMXgTkzIs3rHOEHspnvBWLx/ltdW1MNZZy2W
         iwYZvphBzGEIx8Nm9mAnF/zxbAjg5yE8BOKenn/0Rh0amn9BHQeeCHBIFacaVsTF9rgk
         rPCiLXPjZnApaAdhmdSamWgGdivrZXvPpG8v1241CnAh6XNGG5J85xg8YQ8WMosAvVk1
         YlqpJAhXTR09tcn6PboXIbZdE1NZi/Kk07sOtCceUAlRJsEKEM1hnN3oGW1djOx3HZhX
         5T1dvhZZx1cCYsWdqAEko8h6TTyycHDZM1T87jMx+AvJkX2CJv1Q7X0NDj4fvTdXhd9R
         QPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585132; x=1795189932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Ik0gHsfdd16nhHnjQyqDcxvqmph40nuj+OLJYJgm3k=;
        b=MnTkTwzGR6WJ7plyYO18YPubfjTnziEB5mpikUN3vbVzi1SFjh7PbhGySUJeyebS89
         OZBu1Iwgapupjy5D6AKydLEmkcQRZy21q+K/7U/+8CqjotOjJDATpgpa/HFf4fDElffP
         AkaLuzPB7JzyZZ+hABIAlXGUMzyJ8MJjsWMhugsCLV69LLR4Aj+AoUCIynvwv3s5NXDa
         8Jg+OaXJT4T4ItvvpozbIJyTEFh3JsAYguYXReyiRV5p9bNqKf1k7LVkm9MIyXN1Iskw
         hmv88FJ82Fiag//WaE9utw964650bxXoyF93ohtwik66TNBUTJDBE80NYT0K983PVGla
         b55w==
X-Forwarded-Encrypted: i=1; AL+hErGjJhMk0/SqM0f3a7On0zYhoZw1Fp41eSafu+QP41HfD4lKa4ttPVBLJzingR943XpXjBE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Zl01YvekC5ki05o0DC/144Mb8WuXj+TsOEaI7wsEJkp9i3vf8
	HwEE0EdBjnA7ImnMZxM5a8sGcQC4JhffEoNAYbiNd3MHpCXst96As8rh
X-Gm-Gg: AYBFou1Im2LZD7eA4wR0jSYG9VFp5ALe2VrAGA8xJYewDYubQBOr3YwXwnME2x/w/eb
	lFzPYHTagZHJ6tQ7ZtgOiniKG5ncHnuaZLTOZhhUjCPoNbPoAAVCz1m77No/hBV9ItbF6jZssVm
	5sd8hjowfyuesrcLYyU7E9Ktxwz8TjMhluj7shbRJs7zU6yMSJ7UK9UU8i7L8fjSaUiCb5S139i
	pZj7stwEIG77Gy24jI0bhFDk5yKEZEsPC3kD1Z9ilPAXrLc1UQmI7x4yL2aM6t6ySaEcG45rJXK
	4znYw6CUMYKagJwOUi0H++3WvSi/807X19dgHms9RPA5jlwhHVt3QT1d+GOfhIVvgSVo0CP1VEp
	ajxEzQhxOhlqqOii3KRGWyDiQYoAIxeFRDy+vSg+blMOsOal6G1KH8S0vmxNHKtNHqO7Lm+9MHS
	OkKl8CPl+4zNz0/v6LRGDbK2M2w/U0fNr35n9tsJPLXTTAt8gurEhC9Bmw8rfcRPZjgDPhNypfi
	Z6Wy97LPU3gA6kVlISti37JmbXhpMZfqZC/Q+WKv3JxoS1WGjGBRuOCmMZxwn1lzhz8BS9+JfVm
	FIB7ew+K9nbBpxNYbZrO95UZv12U3Xid
X-Received: by 2002:a05:6102:6c4:b0:7d0:6cf3:d8f0 with SMTP id ada2fe7eead31-7d64d6f8a81mr959235137.18.1794585132255;
        Fri, 13 Nov 2026 07:52:12 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:11 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:12 -0300
Subject: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 DSI to HDMI adapter overlay
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
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-1-327f5d37a9c5@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=4733;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=6gWisAoRL3n8veatx12VoVaqY4HAjgDwneKFrMNA53o=;
 b=YbAc7Dfi9KrryWwhYmgXbDasotxsHNMYCe2MqmRznTR9jWWd4uQiWoDUXcz/S9ifj05cVTsJk
 JBmp86tv4QrD8nPztn7gFCNOjifwXoLzo/61UqDUJ4/POQT8g+Tz7xD
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex DSI to HDMI Adapter, an
accessory that connects to the Toradex SMARC Development Board DSI
connector and provides a full-size HDMI Type-A output. The adapter is
based on the Lontium LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd5482843586..3c424071f8fc0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -710,11 +710,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
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
index 0000000000000..270cf567ace1c
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

