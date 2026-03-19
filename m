Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182913F54CA
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 18:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945720; cv=none; b=h3Ldxi/E0mWefmbXmJ4BfNVAsfu2UgtDcwOx5okfJcY1i87T7xKoeBw5lBpWsCry4rzZ1wQRg8EEaZyebAeMDwoEUMVXPKlZi0mYXqPrWuMkF47Z7439fBzWzDUTAU4G+8vj8xkrDcUW8TZUiF9iKlJODv0PXppYmtH2UarfKNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945720; c=relaxed/simple;
	bh=j3OTduS6qdtjozm1GQe+8s0DcoESfABCWaPJ2XsNvtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CIUThhG1M/QuCPh24P7E/J1uYRgLeNgrUqewqAFjJ5z2kyk6kR6/ULUUMmsJfIU2GaUcwnxPrQQZWobtOJXGVemw1cCdMiVurt9r73G5xE9i/PjUD1qgEzn+158j/0HIImkP80GSbPKb4t82Y3xNHl+S2fJ5mDQ7lVzgowirv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJTM/0ta; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJTM/0ta"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so13042095e9.0
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945716; x=1774550516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUP3CmmT0cKyjmjrALm9nCkOSIQbk/SYoJc7MZ/IyOw=;
        b=CJTM/0ta6UqyPh3lG2dwwbYoacUjVSDQZGdBNd4GczdH9b8EwkK1m698BlpIsDmqNF
         QNh1/vN/jLhYRxeUbmA4BvAdTkNCxs48q0i1kYC5OEXdJdz8F6vLKvv0+zGSiI2OB5Tg
         GfFMMFmguihw2zsncFKVku+E4f4hSnJIHAtcxSayuTb9D3HywRD0H4OqgqGnOyaVcLOh
         eFNYa+VV3WbfXKk9HG0NXu8/vWcAy6H9adF/10rZITP9MeCrN7FcXV+qlL8md8CdeV7o
         y/2auFlvsNQPnk6pp+XrXACEFajJMJAnKtn5pYMtdUbbgdUP7Mwbnh/1/4BiftP00HrQ
         exAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945716; x=1774550516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OUP3CmmT0cKyjmjrALm9nCkOSIQbk/SYoJc7MZ/IyOw=;
        b=XDJ8dPgLQoH6784tyqEr/czvdXlae0lupCS3Tn5Y7C5fzKKd6WW7JjFERPTD986Nfh
         Ne0Bte4z5qO/Xm1mnJGrP9aKE1I8pNzcl/C+2gL6i+OnoG4ig487zOdUZUlwGjsbq6mK
         WklgFWbScFsXj0gIyLiKFhcnFLlRVLSdK0oKrrcn+mMuFwXs9RRfW71an4yp53vNIObZ
         WVgzfVHr/klz2BYTKzpcBL1yyCJDtooleO0imnntUobdxhOXnfF+ltKTR/kZc/iaOnIj
         Numq1MPLUF2kI1NjbKJ0l7iDjLxdnuggZspXs0pZpXD6/PGTkRiSzFOF6fPUeecVqc5H
         z2vw==
X-Forwarded-Encrypted: i=1; AJvYcCV2p3cDEgAv5ZtWZyu6MmV/+yWV8ti9EpHDrQ/8vJnHQ1GqojUk/9M9Tvom9wZDzM8lEWg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxM+JL53zMiUT4jIavYzVerkGkUfLKiOmD89Q9cOKDvqon4uqVp
	87SdkkBSWlJUqn7jA7E70SQhi/LmA11Fag8FO9B09s5S7yWBvcxzEOia
X-Gm-Gg: ATEYQzxljN9OZ5w3fWyUbKaiWFi6paIBdScrV0h6rMYJJLaik8aPgHFCt1VKJuozYv+
	7OZC5brjLKtJuTxqezThccaE163mMCGbp2nkJK25C0lRgGzSxUa7RJWIGuQ/RDiCvcgngyvjo2L
	txyvqzCE7JZ49228kFKUhXVOHRnXGmZ35cQVgrdShKk1gfZ7ETM26K19lnqnyKnI4l8+OQ036cL
	p9rZWfzbBKX00bEBQl+aWJ2wemboVkYZjgpxliB1UAdwd8yJvD6z2sjMFivQbP/rcXxo1tUJb2e
	HWf5dumNANY4O9fzvNqRNb4vpipzSqNz7xSWpRSBB2WY1c8bLY4VYXxbjMOM/cHSes4MMiyylDG
	A8q/e/qsexZnICZmXEiIEf1XSFTOdhhHvBu4iRRoyT59me3mJHzoMyf9BA9YF6QEHqujb37I3gm
	i1bVDD9z+tfQN5qMM2gOmiJhRhN/C7rIDvDeXUa+ZvvSV2tXgRpm10a2thi6+atR1B4NIbsvZfB
	0eI9REcgDV9kAR/N23c+R9nGiizOKfMNNwXmGo=
X-Received: by 2002:a05:600c:8b0a:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-486fee0fb9emr2226175e9.22.1773945716215;
        Thu, 19 Mar 2026 11:41:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:55 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 06/11] arm64: dts: freescale: imx8mm-var-som: Rework WiFi/BT and add legacy dts
Date: Thu, 19 Mar 2026 19:40:26 +0100
Message-ID: <9dfc7925f0acf5a655793eada5b1302b99d1407b.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
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

To preserve compatibility with older SOM revisions, add a separate
imx8mm-var-som-symphony-legacy.dtb, which disables the IW61x setup and
applies the Broadcom-specific configuration.

The Broadcom-based SOM revision is no longer in production, but support
is kept for existing users.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Add symphony legacy dtb to use old brcm wifi module

v2->v3:
 - 

v1->v2:
 - Added Wifi/BT dtsi variants for both iw61x and brcm legacy modules

 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../imx8mm-var-som-symphony-legacy.dts        | 19 ++++++++
 .../dts/freescale/imx8mm-var-som-symphony.dts |  1 +
 .../imx8mm-var-som-wifi-brcm-legacy.dtsi      | 12 +++++
 .../imx8mm-var-som-wifi-bt-iw61x.dtsi         | 45 +++++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-som.dtsi    |  6 ---
 6 files changed, 78 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bae24b53bce6..420b434bcd3a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -161,6 +161,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-legacy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw71xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw72xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw73xx-0x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-legacy.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-legacy.dts
new file mode 100644
index 000000000000..faa707402de9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-legacy.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Variscite Ltd.
+ */
+
+#include "imx8mm-var-som-symphony.dts"
+#include "imx8mm-var-som-wifi-brcm-legacy.dtsi"
+
+&bluetooth_iw61x {
+	status = "disabled";
+};
+
+&iw61x_pwrseq {
+	status = "disabled";
+};
+
+&usdhc1 {
+	/delete-property/ mmc-pwrseq;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 9f4e004f0a37..2b608470da8e 100644
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

