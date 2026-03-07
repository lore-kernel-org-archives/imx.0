Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2AD3A5E9D
	for <imx@lists.linux.dev>; Sat,  7 Mar 2026 15:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898925; cv=none; b=HsDfwD2Qivm//wXn4aZMqEwEiPL+DRtaAu7kbaXszmvTg7MV+e43SQiDeOsE9OjiBsVlMkfAGLtJm59xlfNryc/9fvOn/uCjMvkETEai2/8HBuvXyN9KRHpI149W0fTgne5y+ZA655YlUF0UI8cdLc2TSU2sxtWPGnwbuujlM+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898925; c=relaxed/simple;
	bh=ES/dDbdOUY4TThZS59n5O4LrRIDlPipGzElDy90ZzxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WkGPiz9VX9iGPVVDJDnr54+6NpIS9OrMMCLTOWoTpWYrTESb8vbjFd+FCrqtyC+e+7KKOCIwwoBmkdICbOJhm306vCxvR7dVo8LhTHyMBH3Xp91TeDkLT1fBIR7LMgXGNU2IlnoL86NXvyUo57PhDpWGiP18c4je066zhpiHXcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxhETWvj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxhETWvj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439af7d77f0so6215262f8f.0
        for <imx@lists.linux.dev>; Sat, 07 Mar 2026 07:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898918; x=1773503718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqERNMY4MAVo+Bai5DjLuN+rk8zi9rJwE/isIysK0Iw=;
        b=GxhETWvjbH70ltllqRI4JeC3PmQEwd0C+xpt42rYbHm6IyVOebwJYy3dAtAH6VAe63
         V/bC14Ie8MjQJHrsz4KfFLxTn5AkyGxAaKLsoRlTqqRLFWw9eLHP7HSGnfPEU1Edyn2N
         QqV4JsJOXS3V8mR5WCYZPaRFW0ApBrByp7Ec3eBMfcQhlEzfP5NyAbOkT5njJ/y1gWZR
         ZaUugl6R3OgL5n7vZBW/SJQV9cjy2FPEsDuq4SmS/0angovepVVUsa1ArKbhzTCOe1kx
         JvqeXoudOQggWnhk0/BaP/tCPQHLxAlRSgbJDnADAQFbUjQXTBqjcfi8r3qqZSgm46pv
         UphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898918; x=1773503718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kqERNMY4MAVo+Bai5DjLuN+rk8zi9rJwE/isIysK0Iw=;
        b=DjsEkHuHU12GRJZ9DynvC/B4Mzlj983+BE8JNKRGsEnQUvQG/IGfBFUUmu2+9r4YCp
         ky5tjGKdO2tM5lqVtb5kMl5CEpiVy7AbJ73fby2ID8M0HqOgdsDhZiDcGX9Np+vqVtHV
         ws3wnDiQ+a+yGsdZ4zQwy+ne6vlsq19HUIgpGSIf2oCTEE2wua4w5qmJVYoZTDo4WRG7
         pHao/VBoKveiwHrFhKhP8pL0m1cBXXt0WGf7DbpMLLU8T0dbNFmS7EzcsQisfISA1kWw
         u1CKHaWwVkT4Faqd9UfHgrEQNdzJTvqHx/5ACMJBEzFmB2Et3DFHFLAP4ARRZUAzPwUa
         1o2g==
X-Forwarded-Encrypted: i=1; AJvYcCW5aQOSzb9fdE9QAA9HU0Gq8H3Cubugvqa5LG/ZDrKXJxEFYAuhwnpgHNUEv+kPOzsPdUQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzXRWkQZI7WdLKlTAgB6rV4evbF8Cipef3TBXN/scOY7q674LD
	wWhs1HM8kRgCpkSdFqPNAonDpia77AuSvbbCuQhEcAyXQH1h5f8iY3oI
X-Gm-Gg: ATEYQzxSRtrQl94GvOCwSTdz2EqbeRwqxL2oKleo7X6zmwKC1uXRjxsbSn8PsoiCfur
	7KGqVikfaRrnpZbqfv+ahLJsFTdQxpPRcJUVRBNltPnOelQsG4FeLq9BSOplReudLSC9FUyBlg9
	VqMpJf+WYixDDxsxmKx5bdf9REiEBTQp3KI57iYhwvGiy7x8WgUt4C2mg/Ay02MjCt1PZDu1gZP
	B6g18X/sfLXZTLn3cMxTC8+iDu6JW7zbnhEM+XloDs+8jRXLbFmIwG1HlmkiIg0OkCY2edV6wVo
	oZcUUNirDiF+FtRVnFfAkaa7S+bj17mgEc16UYgCswswj/uABkDcIt66SGiUs00H7z1vvPZQCyC
	qJ/c550BHOZe1MBGujZxnIwZ+SOFL57/fq37GRfUS8i4MI6E/qk8kAMt6EJiE9Qs9HIsdEWw2nF
	wkddK+ofFJD2fYQpKmrkZES+bo2yBh8bQMgkXwg6MQ4KcqH4VpHWYpjSmkwa7tVDC0ESWM5Hg7E
	Foif4U1AuZEdo2K7r8frpNW5Q==
X-Received: by 2002:a05:600c:5303:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-4852695aa55mr100781825e9.22.1772898917935;
        Sat, 07 Mar 2026 07:55:17 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:17 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v3 06/11] arm64: dts: freescale: imx8mm-var-som: Update WiFi/BT with variants
Date: Sat,  7 Mar 2026 16:54:42 +0100
Message-ID: <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

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
v2->v3:
 - 

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

