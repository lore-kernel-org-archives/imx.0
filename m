Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065EA376A03
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955222; cv=none; b=DHwSwM2FPOxG0CGFDC1pLOV6sv53emcafoaHJnt9v80Al+pDjjt/tfHACIjsnO1MWCde+mwAEktDVTao/kg1/sG0xykIoD9UNtzSQK4tcc1ThTaT0f2BcEfMRajjHmXC/Rnqbkauuv1a1+aJWayfpulp87/LG45KWZMjYMvVphM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955222; c=relaxed/simple;
	bh=oq1RDQch7XDQCxVytynqdyl257LxBs0wfvfHQxKljrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sE8ETKs+QJe2u+mX7x9FkXQMOgLPeEzORv1hLBrQmiNJDaUi/kNW6I5uLdS2aauRi+zQZNo+8IBLwaSuZi8gP0b2mh/Sj2CjP92U6DhSPWxz1XCZb7MDXr0o/jmoNmnQosj3H3rREq4HoQnIRzFd77OdAKeMpr/8op0hRPGqza4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3b+BY5Z; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3b+BY5Z"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47df6a5202bso1934414f8f.0
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955218; x=1784560018; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKycMxkJUjKVffGUmXn6hazDZ6CipwefkSIIp/tO8Gc=;
        b=i3b+BY5Zve3/RTk740xOATslU4F5qf1u6IFDC6jKqkIZoZDSfzElx/H6CKDab/3zin
         m2hK5eD4X4th3eYAXboSNBgDRNUlukn68S5EjgfrynWO83gW0fcjGblmVPATgBeGmiCu
         enaau9TVbXMU/g6US8DpcHch75+tKAevJdOyX+4CJQlOjevbqRt5vqxBmPjvk08MGI+n
         1cjOdmLVhJVtBE1oD9oGIvaEFRavjw5fTngFmgiP9B5WkQ09Da7XdomKO9iGC+bKtuxz
         9rp4kLaZqdiWfsBEoVn6MVb3q3gRnMwAS232bYty7sZheXnwnjuqLZX435UlcxkFbZEf
         /Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955218; x=1784560018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKycMxkJUjKVffGUmXn6hazDZ6CipwefkSIIp/tO8Gc=;
        b=jHsxwNGOsai00zcyyIXuXcJFpAyvJtLDxYUi1JVR8udoCqXrZ6AEn6cXW9EVD+aj/P
         dKPHG4GPpSf+Kd1RL6VNy31lQTCNqfu6Mn+xLLmLduCfNDKglbMavWlA1K0eIbmyly7V
         asgi3oeEGPBkkDYAlqstwdk0UEVQS/6vh6ILYAEp/xDkkdqHmYfUbqL80JrghF3arjZ8
         z8BpPHOgET9IrYgvA4o6jKX552F99w2WBOMp+paCHvtbU1Dmy8yo4Lu8gE+1XTz/bKHW
         Bd5u+vWajrb7nlX47/TmpprYIR7PhuaTahS/0luRELRvJ+6nVxHytJo49CHaHNk+RaZ3
         NJCA==
X-Forwarded-Encrypted: i=1; AHgh+RojVL0872y/kJ6cUsFM7clb4mBuzfjOtOwvvuY5vaSU6LERkW4t4EdsFCUD+OW49O/Sn2Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGq8T85wHjK5oV1gDEb5aRlVgVRa6cPc+PaRIjL1k56oK0UDVA
	fE8kjwWGB68iMnaNHGjRF+m5zS0xYbz2qlv828CiLvezuhkii6Ku8F4a
X-Gm-Gg: AfdE7ckI8WFvv0gdHx2XVzJZ5bsg2PgTAZqkaKKd2t2APryjnCP3SZyjps1EcacnZMt
	MuQfD4WNppINt97B/oELn6CyA9TWdO2jrCA55V/C5bM+ecJuNzn2fnfmiuMpTKOXlqinsqV353y
	O/xFFDBGooD63mK28T74maXwmJD8HPhBqWQ5hTK0qjrRaxJ01PXwMG/NNz6XS9RgyQgcRn/zztM
	s09UM8NgCfs3R1yffeQ5MUvUSCOF/u439gX1oJoBhupb0gxzTBYHcbEzPxAvQFt5iC1ZFF4Cj3n
	H7Ia45EMSHvDYiOOL1/3lH7gfUxr2YrX0oD3RDuSBgmFssMTmzSRyknEfndeJo4Hf3VERjVGIwa
	qxtg4Uj3jyXaRjJhbe5/UrN5HzuVHupkLJcbovT1r2+dGBckxTWW1BMqUk0xDaLjXHiNXT1p6i3
	1sbgCykCLx+WAcf2ZXNoOHUDET9wWXrOKBU1rpXsw0MUgWZtEXjwWrF0WvtQBh9QeZWFWqgQPs2
	MdDj+sDxwUZmMly
X-Received: by 2002:a5d:64cc:0:b0:472:d154:fac6 with SMTP id ffacd0b85a97d-47f2dce975amr10204164f8f.35.1783955218269;
        Mon, 13 Jul 2026 08:06:58 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:56 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:27 +0200
Subject: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.

The default overlay describes the current CSI Camera Set 5MP OV5640 with a
27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
camera module.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://www.toradex.com/accessories/csi-camera-ov5640
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  6 ++
 .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
 4 files changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c465aa19e526..ed3d678e7c5e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -189,6 +189,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
@@ -197,6 +199,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
@@ -217,6 +221,8 @@ imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ver
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-ov5640-24mhz.dtbo
+imx8mm-verdin-wifi-dev-ov5640-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-ov5640.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..f479b709c151
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on Verdin CSI_1.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-verdin-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtsi
new file mode 100644
index 000000000000..0632bdb1b679
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on Verdin CSI_1.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clock_camera: clock-camera {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	regulator_camera: regulator-camera {
+		compatible = "regulator-fixed";
+		/* Verdin GPIO_8_CSI (SODIMM 222) - CSI_1_PWR_EN */
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&csi {
+	status = "okay";
+};
+
+/* Verdin I2C_4_CSI */
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio5>, <&pinctrl_gpio6>;
+		clocks = <&clock_camera>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera>;
+		DOVDD-supply = <&regulator_camera>;
+		DVDD-supply = <&regulator_camera>;
+		/* Verdin GPIO_6_CSI (SODIMM 218) - CSI_1_PWDN */
+		powerdown-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+		/* Verdin GPIO_5_CSI (SODIMM 216) - CSI_1_RESET# */
+		reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_to_mipi_csi2: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&imx8mm_mipi_csi_in>;
+			};
+		};
+	};
+};
+
+&mipi_csi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			imx8mm_mipi_csi_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_to_mipi_csi2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtso
new file mode 100644
index 000000000000..d56234913b61
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Verdin CSI_1.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-verdin-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <27000000>;
+};

-- 
2.43.0

