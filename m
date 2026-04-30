Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB674266B1
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555314; cv=none; b=qCdE4EDHcvbLVVmDAz0ID+JYzmmenc/Nen3uBDYcnHaBu6yMfSnutbFrUPK7PKRvj6B+re/fLkQIJKTheUbEyASd3iQSG/xXj9lKV6JXa1d9wetZPGzzN5wKWczDsDQDz4SZPf48r+KORkHPPvJco6Lh0gyR7MIrLPZCXhP3Lgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555314; c=relaxed/simple;
	bh=dB3yigQ6YUHEcC9mAWpx6FOMHhhRXxfxkIG0pTelrcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KxC9YHxt0C9hb51TJgWgjHKaVA7u+K4PF9qt7PO3U2kPDieWEitzJXEMp/k+ovp8lPui8fywaVHglButGWqdlEHD4CzDKMD5jx0anEPYdk4MNpX3D5jFM4qGYoP2fQJKVSpJqfdzF67K+OCqMBRAJdv5qh/dtrnv8tcgpWmSiPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=bmsGbZ8p; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="bmsGbZ8p"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48896199cbaso8033335e9.1
        for <imx@lists.linux.dev>; Thu, 30 Apr 2026 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777555308; x=1778160108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MkL0qgeSar4YBymhXUpa8B2jXGEQhu5KS9oOv9c4/s=;
        b=bmsGbZ8pC79ZVBWulaQTgHCox9MuqlvW4JEx2K1FDFGcB71LQdVTIaIDvkIBlze2PC
         IJURX+FKRZlw1vlEPnStDXk43KzDuH1mWXiTd1/SrDoxfO1DsYqySSzMh5o8wnMoTNGH
         atLCLlzIq5kRkf77qZCe03SD/ODMZAyGcPybE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555308; x=1778160108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3MkL0qgeSar4YBymhXUpa8B2jXGEQhu5KS9oOv9c4/s=;
        b=WtIjKcHzbqSpYSDYzJrKOlL6sMQ734YZsrMgelKnreeF/znUIOFtOC9et1YsR2pS2d
         q97CK3FSJrkgijg7V816DjamqfERviibo0VAJ1jRCE9aU6edq2uizD8dsCF+BRmzCdWk
         8hcHW1Gw84lXr/Px+Fzu1hJZnkklQqytEIqbzhj1CurPhEXctFXII8GqI03gtoI37U6B
         9WHpECmBsQ5ID7H4o68H4MdhoAUGov23kShIyM+5gedtYsFl4qaGS9C9uaSZlVaYbtmS
         P/zDut9TImxN6s9fpggTZImahAWR0BM/hr2XhilkVmw0+pcY7NAuSKRZNObXXQ38ILvR
         V+HA==
X-Forwarded-Encrypted: i=1; AFNElJ8uvnQMZKIIgAbVtePU1ALB0T9J5WVGcqIFCVRfrHAlnElPEbBuamJwSHoLi/THfbn62eo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPmidofoOiV9FZUzGND4xg6qN+2RljaU7g1g2M7Hm6PpT86s96
	mKheS7lj5gA3dV70kRo+RduBhc27by2hoij1FQlYO+OH680adygcK2jW3d+cP8arVmw=
X-Gm-Gg: AeBDieuI9/52YJOGa2zINNxzc33uyar0+zZ0MtLl6wx/dWAxoaQgYeiglOWTzpaETTo
	xAjEu73rNMxOdaIrVqBvUpeqg3PQ9xk0iVHw4x6vM8+tlhOHwDB4yQgzdfaxz71B3x5Z7KBosFr
	py9r7MQsCW9qMQ+O9l4tfH8wMFPp6HFK5vQlh2zEWPuSbhJeUuHcIx9egO36x5zJL4Wo4xCX0V7
	2SsBJ1yPVr+86uL6j30NUp1ohhZUUBBAoWyrvKLy/y6iWdon9P7LSJcKy53drHJCfbzHS5FPlZq
	8aFt3dKL3TtK6SfYtuCAUKdmUlon5NVEMwGCu8w1GupCM/Oy3yWTNN+4jPayLdr2VegoZHUuJYU
	5pP+JArG3EBtVtPbhFI21GmnqIAcxt+LzpNrNeZCm596f8hZ9zmRAqdq+FRJaWtYdwhl8Rq0Vvm
	aFpmQKrGYMTMghPiSAYC0FNWct4Ymky6LoT2dlAux1R4MT6AwjHtFSryzVDRtBxk6uREw=
X-Received: by 2002:a05:600c:8289:b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48a8444495cmr53979535e9.16.1777555308060;
        Thu, 30 Apr 2026 06:21:48 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm106210325e9.13.2026.04.30.06.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:21:47 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	m.facchin@arduino.cc,
	dmitry.baryshkov@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 3/3] arm64: dts: qcom: imola: add support for media carrier board
Date: Thu, 30 Apr 2026 15:21:40 +0200
Message-ID: <20260430132140.30369-4-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Riccardo Mereu <r.mereu@arduino.cc>

Media Carrier is an expansion board for Arduino UNO Q.
It adds two CSI connector, one DSI connector, 3 jack connectors for
headphones, earphone and lineout and 4 RGB LEDs.

Current devicetree overlays support:
 - imx219 based cameras (both with 4 lanes and 2 lanes)
 - Waveshare 5" and 8" touch A DSI displays.

As can be noticed DTBOs are split and no overlay is performed in the
Makefile. Overlaying is handled in user-space guiding users to configure
the system matching what it is connected to the Media Carrier.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 arch/arm64/boot/dts/qcom/Makefile             |   8 ++
 ...rrier-media-camera-imx219-csi0-2lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi0-4lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi1-2lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi1-4lanes.dtso |  49 +++++++
 ...10-arduino-imola-carrier-media-common.dtsi |  46 ++++++
 ...a-carrier-media-panel-5in_touch_a-dsi.dtso |  80 +++++++++++
 ...a-carrier-media-panel-8in_touch_a-dsi.dtso |  80 +++++++++++
 .../qrb2210-arduino-imola-carrier-media.dtso  | 131 ++++++++++++++++++
 9 files changed, 541 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e89a0e77072b..441a217371ac 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -195,6 +195,14 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-base.dtb
 
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-panel-10in_touch_a-dsi.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-video_sound-usbc.dtbo
 
 qrb2210-arduino-imola-dtbs := qrb2210-arduino-imola-base.dtb qrb2210-arduino-imola-video_sound-usbc.dtbo
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtso
new file mode 100644
index 000000000000..5b1d3cdc693a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&camss {
+	ports {
+		port@0 {
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&imx219_0_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&cam24m>;
+		status = "okay";
+
+		VDIG-supply = <&cam_pwr_csi0>;
+		VANA-supply = <&cam_pwr_csi0>;
+		VDDL-supply = <&cam_pwr_csi0>;
+
+		reset-gpios = <&pca9555 0 GPIO_ACTIVE_HIGH>;
+
+		port {
+			/* MIPI CSI-2 bus endpoint */
+			imx219_0_ep: endpoint {
+				remote-endpoint = <&csiphy0_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <456000000>;
+			};
+		};
+	};
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtso
new file mode 100644
index 000000000000..0d76786bd925
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&camss {
+	ports {
+		port@0 {
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx219_0_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&cam24m>;
+		status = "okay";
+
+		VDIG-supply = <&cam_pwr_csi0>;
+		VANA-supply = <&cam_pwr_csi0>;
+		VDDL-supply = <&cam_pwr_csi0>;
+
+		reset-gpios = <&pca9555 0 GPIO_ACTIVE_HIGH>;
+
+		port {
+			/* MIPI CSI-2 bus endpoint */
+			imx219_0_ep: endpoint {
+				remote-endpoint = <&csiphy0_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <364000000>;
+			};
+		};
+	};
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtso
new file mode 100644
index 000000000000..d74b63876e87
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&camss {
+	ports {
+		port@1 {
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&imx219_1_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&cam24m>;
+		status = "okay";
+
+		VDIG-supply = <&cam_pwr_csi1>;
+		VANA-supply = <&cam_pwr_csi1>;
+		VDDL-supply = <&cam_pwr_csi1>;
+
+		reset-gpios = <&pca9555 2 GPIO_ACTIVE_HIGH>;
+
+	   port {
+			/* MIPI CSI-2 bus endpoint */
+			imx219_1_ep: endpoint {
+				remote-endpoint = <&csiphy1_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <456000000>;
+			};
+		};
+	};
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtso
new file mode 100644
index 000000000000..87db9ed386af
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&camss {
+	ports {
+		port@1 {
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx219_1_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&cam24m>;
+		status = "okay";
+
+		VDIG-supply = <&cam_pwr_csi1>;
+		VANA-supply = <&cam_pwr_csi1>;
+		VDDL-supply = <&cam_pwr_csi1>;
+
+		reset-gpios = <&pca9555 2 GPIO_ACTIVE_HIGH>;
+
+		port {
+			/* MIPI CSI-2 bus endpoint */
+			imx219_1_ep: endpoint {
+				remote-endpoint = <&csiphy1_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <364000000>;
+			};
+		};
+	};
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-common.dtsi b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-common.dtsi
new file mode 100644
index 000000000000..9670fecf6a89
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-common.dtsi
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	cam_pwr_csi0: cam-pwr-csi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam-pwr";
+		startup-delay-us = <100000>;
+		gpio = <&pca9555 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	cam_pwr_csi1: cam-pwr-csi1 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam-pwr";
+		startup-delay-us = <100000>;
+		gpio = <&pca9555 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	clocks {
+		cam24m: cam-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <24000000>;
+			clock-output-names = "cam24m";
+		};
+	};
+};
+
+&cci_i2c0 {
+	clock-frequency = <100000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pca9555: gpio@26 {
+		compatible = "nxp,pca9555";
+		reg = <0x26>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtso
new file mode 100644
index 000000000000..cd9c533ad3a4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+ /dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&{/} {
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_vcc: regulator-panel-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-vcc";
+		gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&cci_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touch: goodix@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpio = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	dsi_panel: dsi_panel@0 {
+		reg = <0>;
+		compatible = "waveshare,5.0-dsi-touch-a", "himax,hx8399c";
+		reset-gpio = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		iovcc-supply = <&panel_iovcc>;
+		vcc-supply = <&panel_avdd>;
+		backlight = <&wsgpio>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtso
new file mode 100644
index 000000000000..41e7a254dbe7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+ /dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&{/} {
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_vcc: regulator-panel-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-vcc";
+		gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&cci_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touch: goodix@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpio = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	dsi_panel: dsi_panel@0 {
+		reg = <0>;
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reset-gpio = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+		backlight = <&wsgpio>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media.dtso
new file mode 100644
index 000000000000..217a84199e9f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media.dtso
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&camss {
+	status = "okay";
+
+	vdda-csiphy-1p2-supply = <&pm4125_l5>;
+	vdda-pll-1p8-supply = <&pm4125_l13>;
+};
+
+&cci {
+	status= "okay";
+};
+
+&leds {
+	led1-blue {
+		label = "media-carrier:blue1";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_BLUE>;
+		gpios = <&pca9555 14 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led1-green {
+		label = "media-carrier:green1";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pca9555 15 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led1-red {
+		label = "media-carrier:red1";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_RED>;
+		gpios = <&pca9555 13 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+	led2-blue {
+		label = "media-carrier:blue2";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_BLUE>;
+		gpios = <&pca9555 11 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led2-green {
+		label = "media-carrier:green2";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pca9555 12 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led2-red {
+		label = "media-carrier:red2";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_RED>;
+		gpios = <&pca9555 10 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led3-blue {
+		label = "media-carrier:blue3";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_BLUE>;
+		gpios = <&pca9555 8 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led3-green {
+		label = "media-carrier:green3";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pca9555 9 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led3-red {
+		label = "media-carrier:red3";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_RED>;
+		gpios = <&pca9555 7 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led4-blue {
+		label = "media-carrier:blue4";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_BLUE>;
+		gpios = <&pca9555 5 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led4-green {
+		label = "media-carrier:green4";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pca9555 6 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led4-red {
+		label = "media-carrier:red4";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_RED>;
+		gpios = <&pca9555 4 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+};
-- 
2.53.0

