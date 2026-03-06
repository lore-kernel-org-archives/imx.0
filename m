Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B546943CED7
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 19:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827131; cv=none; b=UNlQpyEIAEifWNxu/0w1RG4Fasa4BB2n4eXnmw67/Uu5pQ+N0vt3vSpVsGF4+TaOSbv3AOv8zgwDibwStcvmnoKdUCALEqPIJN+S07vyHEhd20VmwnaHrn7XKPhiK1SVU0wjGB15B004vtyqrfQ6eNPFg0wUtWIOS+SolTRp8BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827131; c=relaxed/simple;
	bh=FywE9I2jgu/E9dUJjkL1LNg3FZZX/2ACIJR6RrAbSZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VcpCppyCW1CRLGvnSixnkzjaGLXwrlt6U40K9McjuM8Rbg1ZMItmCaYP+6mbPHipwGaebfCTtOxUC3+u0QHjReNyCzsm2q/dxA62k5Q4GG5APKC18IUmTyA7vMpyrdRROPn21D0BUAc+7cmVkyAVGmYsjJlq77lwBTeBCxhOs5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THyTuywl; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THyTuywl"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439c4bde55cso2642430f8f.1
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 11:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827126; x=1773431926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q40sieppdqWC0Pb0LgkBOiCq1+WdogMkkdM87+FLk/0=;
        b=THyTuywlrqAb9fCji1ilIJSbvHUNC8aN/+h4D/T61Mq5d9ofY+VWbG91P8iIeXlHSp
         YknAO/39d4xMowhu3yNM/AJpgZACxYgg8U/O4BUW4F+Zxvq8D0f8/OqnUWbW2UBn4DpU
         D55nimF8+cOHZCLrDeBdXYm+f2SNF+dwiw7y/bqS7xQox6TbV/151pOH18en4XbdcoIj
         uP3aX0K2RSnqepoKVyNm44+87R9RBKPfq0XreqEEYMGkkcjKGAD6DHgN1TlUYkiAGGKX
         gxLVJi2ZfWWEEzNWMoQUo2goQnyHIg7BW3k8ats9qEmwo6JzklUY/ZC+ThG0ujGl5bD6
         ppKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827126; x=1773431926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q40sieppdqWC0Pb0LgkBOiCq1+WdogMkkdM87+FLk/0=;
        b=NxGDXU/Lx30lApJi3NkXtNDexl48Xdo+0PpJpraGL9YOpxVzXytT474D2OSeHIHYB+
         uUGXqHSg+XX5NDKZLcKCcie+lRKqozZsznOUWupExS5fdjwnXXpbcQlsrALsAqqXN186
         QgAwHLYhEDQwZNuTBzJ4uZmQT2XVFjdPGMUuhU2BuxON6gb3wvFSwaYz6tiSl0oAH7WL
         PlbvpH5W2URftXSYq7mse7JHZEo01wGn625WdbRB/5vUpEEmX0AWSlf/ymhm1E9nsWlh
         WUuoUqFqOCF/vp98vGs6v415KNuCHh7PPxMdUrq+N4ndVh7wa5oYgDoEnTlrznqKA6Dk
         sfbw==
X-Forwarded-Encrypted: i=1; AJvYcCXYRdb0c3P7OMXkGXfOOuqDTP7Q2GSPXhdOAqbpuiUMlwW6R9MQwhXOxci4rX1A+13zmL0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaCFNpg23FHMIm4S/pLC7bmO4GMa5ow01wKXQTNdnRZbgkISpx
	aGiZD1xSkrI2RAMIqVCpdeyJ/ZI2QDtiNK9aWC5YWbFLAFYu3ytkcAFK
X-Gm-Gg: ATEYQzyX0i/jzUGJRMlar9q4fCNq32PfxVh8zLWSeFLUzDxoGEtTvTd7A1atYKk/vL7
	56KtHTCmOBqtHvR5GzVdbowLN9sLRFMVIPXYz/xTB2la3yP1Ib6MOUU0gMz0nIVfLmO0PaZrnDV
	6tcpr2yO6GH57dZ7YFYjjM7M0dtmBTi0u0qPEbGNMVcPhP3QOm7klSKhhUorOI+JtfBwSn4sytj
	o4WHr1BYSgn6A0oHiz2ds80advZwvUQ+msqYeZVrC2BhOgZlG/Z3KO2UKiMA60HEOrYcg+0l3nA
	1CW7JMTu5NFbvJM4MFt6jDP4FFOIG1wSu8UQF9aj1CCxLcDt1Ue3MNUyayXVPrGmVOwQ+l1JFpx
	avzFghz+FqKt9tHS17ru6ZDX7MzUx5oT4oShq5VS0wnt0Y5wZud8O5uFGnx0QPqh+gJW3H5Rboj
	otmVhTn47dnPDt/B6KAcUSVGrRZX9UGbIlHcWbKmb1K4WQlGo161ir69PQUmqIaTynrGX+N1NM+
	cZ46k9CSi/Zcez6DEFIvUkYDNmW4OSR1A7zlCo=
X-Received: by 2002:a05:600c:8b0d:b0:483:c490:8ed with SMTP id 5b1f17b1804b1-48526982c54mr51288945e9.32.1772827126037;
        Fri, 06 Mar 2026 11:58:46 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:45 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 06/11] arm64: dts: freescale: imx8mm-var-som: Update WiFi/BT with variants
Date: Fri,  6 Mar 2026 20:58:25 +0100
Message-ID: <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MM currently integrates the NXP IW61x wireless module,
providing WiFi over SDIO and Bluetooth over UART.

Move the wireless module configuration out of the base
imx8mm-var-som.dtsi and provide dedicated variant includes.
The IW61x configuration is moved to imx8mm-var-som-wifi-bt-iw61x.dtsi
and used by the Symphony evaluation board device tree.

A separate imx8mm-var-som-wifi-brcm-legacy.dtsi include is added to keep
the configuration for the legacy Broadcom SDIO WiFi module used on
earlier SOM revisions.
The Broadcom-based SOM revision is no longer in production, but the
configuration is kept separately to preserve compatibility with existing
boards.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Added Wifi/BT dtsi variants for both iw61x and brcm legacy modules

 .../dts/freescale/imx8mm-var-som-symphony.dts |  1 +
 .../imx8mm-var-som-wifi-brcm-legacy.dtsi      | 12 +++++
 .../imx8mm-var-som-wifi-bt-iw61x.dtsi         | 45 +++++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-som.dtsi    |  6 ---
 4 files changed, 58 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 712892edba8f..51ac8ee34c3b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/leds/common.h>
 #include "imx8mm-var-som.dtsi"
+#include "imx8mm-var-som-wifi-bt-iw61x.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-MX8MM Symphony evaluation board";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
new file mode 100644
index 000000000000..f44a846ea6f9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Variscite Ltd.
+ */
+
+/* WIFI */
+&usdhc1 {
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi
new file mode 100644
index 000000000000..15990d141d2a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Variscite Ltd.
+ */
+
+/ {
+	iw61x_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 20 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+};
+
+&uart2 {
+	pinctrl-0 = <&pinctrl_uart2>, <&pinctrl_bt>;
+
+	bluetooth_iw61x: bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+/* WIFI */
+&usdhc1 {
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
+	mmc-pwrseq = <&iw61x_pwrseq>;
+};
+
+&iomuxc {
+	pinctrl_bt: bluetoothgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0xc1
+		>;
+	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20		0x140
+			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10	0xc1
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 21a4d87c0e26..c37badc4cf27 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -390,7 +390,6 @@ &usbotg2 {
 	status = "okay";
 };
 
-/* WIFI */
 &usdhc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -402,11 +401,6 @@ &usdhc1 {
 	non-removable;
 	keep-power-in-suspend;
 	status = "okay";
-
-	brcmf: wifi@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
 };
 
 /* SD */
-- 
2.47.3

