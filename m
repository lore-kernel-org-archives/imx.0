Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8776C48123D
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 11:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781304; cv=none; b=bw2TLYmkwyj+y/Hmtsk71mz5fT1oGWuPBrugWQnkAHBqCFDFI6CXMK0thgebaKj6xwqNsY7lMu1pGawGbxL3M721EKyIe80Dmm40qjuI2o3CA/GndXHvLKappwxXH4tTQ+EbW/IqC4UWvIWhLlddLzhnMeAACb28g7Ygtj3I3yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781304; c=relaxed/simple;
	bh=d3zc5KONouSaxNAebSf7KqoLmQC2RcTXj8P9Ljcss9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLJjySZOZgpSfFHp+Hj9M31b1qjA/1phHO3kYjDqvPsRZ/Tz3i7YnKp8t9MWAxBOWsCNYB2iirjsH6pp2RZggNpCxpAkC2ZGMsnZBAPNG+03HPJjhmrxJqSLzZTiXWpu6V2CnQ0Ni4TrHx14dCZ2n0V8JVBQhdcaTdpsxt9aWT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbQpJh/v; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbQpJh/v"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4858269e3d9so252121f8f.2
        for <imx@lists.linux.dev>; Mon, 07 Sep 2026 04:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781300; x=1789386100; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1yQZRT1NDiSBMDYApICTKX6DjUaKvxFXJuDnDEjfIo=;
        b=NbQpJh/vpVZKEnui+T8uuneK8HkwAfUkWotV9MQXoVpwDdjOtqBl0spHkgE2ieMYk2
         o7Vf4gSwWxTNHalCDbUk03wSazue9frXKHCrQjcdB3S4oM9g6Jb7HlSs6K+3hGkeTGCp
         +g//KYdxn+W22E+6x+5D3AD96zL/gS1kovixcKsR9fHKovROOD4tNCKaqj8ApB7cT8c/
         stJxeKyke6kUfWTALRGammo/n7WqjXIJp1fPjDFX3CZAawBO+X+XQg9q8AV7k0Rm8dZ0
         MSzQHylyZf0BaJ10PWVIr+N+tDgGZy6PuTTAJFf+L4DOdUHztKom1BCe9eNoMX961b7p
         UqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781300; x=1789386100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1yQZRT1NDiSBMDYApICTKX6DjUaKvxFXJuDnDEjfIo=;
        b=ZfgBN4s62kSjSgf1eb2yUXJQ5jxdY5zsXg+4IKn7Qp6WWvsC/zPetNXZKoDXIcmJpo
         6VCuBU+3MdzKI9roXUhCe9mD064fY3QtHRJrQsdlh3bzetIqdAtX2avmG0b3w3o/QAbt
         cBUiFK1X5FyLT0cukb9vQXxNUkiVvv8cZotF8p5XoL4WblbA82Z70kaDm+B5FPfzUAjd
         m3q4fRbNGaZZGRQUqrbL5Nt4mbvQsSu/211DfVZ3QIZNQYfWx3RnrUZXWkLsaH8pj+lv
         9h7faMotLtzClZ5aU2yqupLept2bFcQbVvhQjMZidJlewUqVomGcgKEwOI0rTnv//roO
         rtvw==
X-Gm-Message-State: AFuF++k0dWemRdiN6hmAqQrH8LU/d09VKvoTs1PGRBOYH5XohK1dVm0z
	3jw1BQE3mgpHrEhD5ZkPgsVnF9mCP88vMyIoJ6M1eqxMNUNLXU0uLMtL
X-Gm-Gg: AYBFou1/KfOKYeFqWUfrrVdVgZBdvZNIVNPQKxHERkFVKcLFGAjOMb1vwees2ElEaMb
	0jKxTG98ytgzh55pH3G4PKSC6/MyUXiAhLf641Hi4EY8zN6T0Qrh78+4/0/nzcI3oYJiRFzzmc1
	nejD9StObnl9H0m26hq9k4oVuQt21ANePm3cjUpdd8Ia0ZS/TxbqAVgCxLF7BDx813Z1bd0noAg
	BVH8IfYspnSDcLxIJyF+uByn4YLPGcCT5JLGqROzWDsBRHoiksb0EW0kszxVTJazNSCd6FUJnE7
	iGGbPKoe9bvbuu4SnDiAvSPcHAFmd/LkpK+TwHr/uyJdQEIxPNw2vZiHypY9C/G3dMPBNxhNV++
	oxEMsMyHDlGVMz3H+GDbJ1R1e7IeWnJgtluYC5fUKV8JPfOX+1kTqGZ5/pCeEQ8Ww1qa8ap0Id9
	QIvYrijAjq9pmsZ7OszHrkyQNQe5N9FtBY08qBjwPk7hZYBBvYsg+KUeabncuQ39ENrLHkZySXW
	4qpRhTNBXB4btwh7uJo6B0D3FbZ8npxoaZ1RLbv/FPYZCZrrG8Ucp3J8Ahj3ZA=
X-Received: by 2002:a05:6000:612:b0:485:8e19:1979 with SMTP id ffacd0b85a97d-4858e191d46mr35494206f8f.11.1788781299615;
        Mon, 07 Sep 2026 04:41:39 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:39 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 07 Sep 2026 13:41:32 +0200
Subject: [PATCH 3/4] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" DSI
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-3-ca0c63c2994f@toradex.com>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
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

Add a device tree overlay for the Toradex Capacitive Touch Display
10.1" on the Verdin DSI_1 interface. The display features an internal
Texas Instruments SN65DSI83 DSI-to-LVDS bridge driving a Riverdi
RVT101HVLNWC00 10.1" WXGA IPS TFT LCD panel. The touch input is
provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the Verdin iMX8M Plus Dahlia carrier
board device trees to provide ready-to-use DTBs in both WiFi and
non-WiFi SoM variants.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   7 ++
 .../imx8mp-verdin-panel-cap-touch-10inch-dsi.dtso  | 132 +++++++++++++++++++++
 2 files changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 715235b62912..14ea662bdcfd 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -731,6 +731,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
@@ -739,7 +740,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
@@ -751,9 +754,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
 imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb \
+	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-dahlia.dtb \
+	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
 imx8mp-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 000000000000..a2cba3d5a0fc
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" on Verdin DSI_1.
+ * On Dahlia (X17) and Development Board (X48), DSI_1 is exposed via a
+ * Samtec LSS-130 connector and requires the Toradex DSI Display Adapter
+ * to convert to FFC/FPC connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-dsi
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-display-adapter
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
+		compatible = "riverdi,rvt101hvlnwc00", "panel-lvds";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		/*
+		 * Use a combined horizontal sync and back porch of 96 pixels. The
+		 * panel data sheet value of 88 pixels results in unstable display
+		 * output with the Verdin iMX8M Plus display pipeline.
+		 */
+		panel-timing {
+			clock-frequency = <69300000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <64 64 64>;
+			hfront-porch = <72 72 72>;
+			hsync-active = <0>;
+			hsync-len = <32 32 32>;
+			pixelclk-active = <1>;
+			vactive = <800>;
+			vback-porch = <15 15 15>;
+			vfront-porch = <15 15 15>;
+			vsync-active = <0>;
+			vsync-len = <8 8 8>;
+		};
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+};
+
+&backlight {
+	/* Verdin PWM_3_DSI (SODIMM 19) */
+	pwms = <&pwm3 0 6666667 0>;
+
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_10_dsi>;
+		/* Verdin GPIO_10_DSI (SODIMM 21) */
+		enable-gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				dsi_lvds_bridge_out: endpoint {
+					remote-endpoint = <&panel_lvds_bridge_in>;
+				};
+			};
+		};
+	};
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2132";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>,
+			    <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
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
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};

-- 
2.43.0

