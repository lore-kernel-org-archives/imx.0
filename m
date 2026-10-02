Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7444A99BD
	for <imx@lists.linux.dev>; Fri,  2 Oct 2026 13:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947942; cv=none; b=E+Py/0d0/dPUumfcOdV2Fp1GHWYx944qV4K95OfoDRTBjHvBcNBpYlhLHPHOT8NyryRkVk3zTE14yOYENur+Ok1RDVKTwr2vDisOX8vThMyA8L40B8VQ2CK1EeSTVJbhHm7DpSKQwjPxVPjyLmU+JcNe9umG44n50MG+mWunrc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947942; c=relaxed/simple;
	bh=DiAB0qflJ662j+l2WxyGH79c8v/pnQ16HPWoCMXaodI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhzCrfaqQ2PA4jlWfoNznkHLP/j7lsa5uaTZyqJRp/p6w6snZ+djimSlIQORC81QYUpnjuphjK3N320lBbydPWuDEP9hNqyeosG2IDDSr953GjKU3pWWk3QiMvyxAu89DAQLmhpMQWQ4F8Yr9mTiTZ+6j7B2+62ITqoKyknsDng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qpw1Hm64; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qpw1Hm64"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afd5b1678so1687156f8f.2
        for <imx@lists.linux.dev>; Fri, 02 Oct 2026 06:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947938; x=1791552738; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zayP4WDTOu5O+niuDClNFcuxUww+7ip1Eh7ZVrZJwtg=;
        b=Qpw1Hm64IkbImbAMhgIDonm6kJ/5vGULQaYK9MXfYQz4motYy0uEz3GUOzBvmhDIPr
         0b//PTaVBr2LQG3yXYMC1h4WpwUbBCaa0Y6n3+P+23Z7Tpmui+/dtEmJ3osUf5NWH0Aq
         zzZlI3IEqe3/a8ClzEEQGcXWB9nDiqvjaA8L/BI2id0ESc7g9qcqogb4XgeUjOgjjItt
         gQ+mV5YPErkkmHkcytZk2sDsk2+dQBATwwTJz60AtdGh/W3Mo1dilJFNRlnbezeX9B/j
         GxEvBpmIVVmX8AzbqpL3i0he3EgExMHjAYgenh/9IwVT5aCB9aE4R+tw2ickUIHUiMWM
         /RHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947938; x=1791552738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zayP4WDTOu5O+niuDClNFcuxUww+7ip1Eh7ZVrZJwtg=;
        b=oFxoC603OUFKxcB/eU7W4ab96Jer0I2xCY2GoIVAzrzrfRxy+oABiNaqYyZdcks6t9
         8gUykcduDHSeNz/cfPCFODTexbPNnZocQ/worZ59DbDcTpheUtpyF1y1Nsx1zOuczAzR
         bFU/sD5BZDGh4jg+BqwY//kQQgv7mZeRV+wCLQy6sWMp9HiggoFubbWXWdGQr1lmzbfw
         r9gtIu+pPO/5Zzz4780dIxCaLZrh4n7OHe6n8uU/4lb6669Rpv3c+LE1UsEgeF9Y8VJS
         SxM00Kl4jVbz7uWK9YPVDjJWmsVA4VCcXK9/4FZYfkNaKrKuAm0rrtf5UOCjovqqIY9Z
         26pw==
X-Forwarded-Encrypted: i=1; AKwUvBx7HmeAKO6QBUSGwzFe2tUjqW2+gXDMcbHFvVJkbu/gDM2gG4ujn2VJ2pVGHm4eiLI8x5c=@lists.linux.dev
X-Gm-Message-State: AFq9FYIMcxbOo2ADWskkWB1R6X4XaybY8K598clj+3SMEst/QEoNVn1T
	QPaE6yQXq87ofdIT+Abt/6GIWFo+Plh2c1xiVvs/sWE9aR6Svsy3nXehhjz+rzM71wU=
X-Gm-Gg: AYBFou3YMrsXHnta2+09ubvfxF4LOndfwwoN0HSmiAyTV0W6hKJT33j7FUqpJiE4TFf
	CrR6hj/TW4lsIvQOidl1t7Uyb5PeV7l5E5IVYhvuT1O349btwuIM/rpS1zlsD3+YMLOQTbG7mxf
	I7/nQFSfXCOzqrG9JOMVyl8Gy4TMJh4jdQ3SIEGPqUE6AuShw3LYMRjUvJ2Wsa2biQzlDpfYHzG
	Y2WZpWMkSGoyqy/TTw0beIDdhchJfIipUm27ETE2KDM/ZRakNxTES6kQCcC4IfwPyayVfC6kKjc
	D7YqoadJuXL0eB7k4JTWSIv72Yj3mwhZRNwbBPj2YiM7F1HaCVGzyMGiNJ0Aji1zLcSuAOlAjgq
	HkKYSIHVJL0iwJghaUa9QSmM5DEXRuQj9VXux+T+KbLB4w9glQNMe2XCUEckm4RLQrpD/mvsBSD
	YnERBDu95+NZPe9EhVUX1vK3BpBVzgx35UPMHSgP1ZOs5cnaUdYv/H+w3ryMn8rgQyvKSPOMR9n
	OYAxYMFF0ko508QeO6Hh2JAzj5aWqKo0fG5uxu8X71/VtZP+6ya9ThZDG3fXlNAYWrp+bjoOA==
X-Received: by 2002:adf:fec2:0:b0:48b:3f2:2ec7 with SMTP id ffacd0b85a97d-48b1274a1a3mr4164575f8f.31.1790947938402;
        Fri, 02 Oct 2026 06:32:18 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm5809855f8f.41.2026.10.02.06.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:32:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 15:31:31 +0200
Subject: [PATCH 2/2] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 OV5640 overlays
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-v1-smarc-imx8mp-cameras-v1-2-a0e89182c625@toradex.com>
References: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
In-Reply-To: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add device tree overlays for the current 27 MHz and legacy 24 MHz
Toradex OV5640 camera modules connected to CSI0 and CSI1 on the SMARC
Development Board.

CAM_n_CON_PWRCTRL (pin 24) is an active-high power-up input of the
camera module, so it is described as an active-low powerdown GPIO.

The overlays are also combined with the SMARC Development Board device
tree to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 16 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi1-ov5640.dtso          | 75 ++++++++++++++++++++++
 5 files changed, 196 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 1310b34178e5..357d0afbd41f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -711,8 +711,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi0-ov5640.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi1-ov5640.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi0-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi0-ov5640.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi1-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi1-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
@@ -726,6 +734,14 @@ imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := imx8mp-torad
 	imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtbo
+imx8mp-toradex-smarc-dev-csi0-ov5640-24mhz-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtbo
+imx8mp-toradex-smarc-dev-csi0-ov5640-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi0-ov5640.dtbo
+imx8mp-toradex-smarc-dev-csi1-ov5640-24mhz-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtbo
+imx8mp-toradex-smarc-dev-csi1-ov5640-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi1-ov5640.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..7e6991b95dec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 with 24 MHz oscillator connected
+ * via Toradex SMARC Development Board CSI0 connector J45.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+#include "imx8mp-toradex-smarc-csi0-ov5640.dtso"
+
+&clk_csi0_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso
new file mode 100644
index 000000000000..23b155beec2a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 connected via Toradex SMARC
+ * Development Board CSI0 connector J45.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_csi0_ov5640_osc: ov5640-csi0-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
+
+/* SMARC I2C_CAM0 */
+&smarc_csi0_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_csi0_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_carrier_3p3v>;
+		DOVDD-supply = <&reg_carrier_3p3v>;
+		DVDD-supply = <&reg_carrier_3p3v>;
+		/* CAM_0_CON_PWRCTRL, pin 24 */
+		powerdown-gpios = <&smarc_csi0 3 GPIO_ACTIVE_LOW>;
+		/* CAM_0_CON_RST, pin 11 */
+		reset-gpios = <&smarc_csi0 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_csi0_to_smarc_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&smarc_csi0_rx_in>;
+			};
+		};
+	};
+};
+
+&smarc_csi0_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			smarc_csi0_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_csi0_to_smarc_csi_rx>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..f6bfc3d49f5e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 with 24 MHz oscillator connected
+ * via Toradex SMARC Development Board CSI1 connector J46.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+#include "imx8mp-toradex-smarc-csi1-ov5640.dtso"
+
+&clk_csi1_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso
new file mode 100644
index 000000000000..d78f46a764f8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 connected via Toradex SMARC
+ * Development Board CSI1 connector J46.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_csi1_ov5640_osc: ov5640-csi1-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
+
+/* SMARC I2C_CAM1 */
+&smarc_csi1_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_csi1_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_carrier_3p3v>;
+		DOVDD-supply = <&reg_carrier_3p3v>;
+		DVDD-supply = <&reg_carrier_3p3v>;
+		/* CAM_1_CON_PWRCTRL, pin 24 */
+		powerdown-gpios = <&smarc_csi1 3 GPIO_ACTIVE_LOW>;
+		/* CAM_1_CON_RST, pin 11 */
+		reset-gpios = <&smarc_csi1 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_csi1_to_smarc_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&smarc_csi1_rx_in>;
+			};
+		};
+	};
+};
+
+&smarc_csi1_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			smarc_csi1_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_csi1_to_smarc_csi_rx>;
+			};
+		};
+	};
+};

-- 
2.43.0

