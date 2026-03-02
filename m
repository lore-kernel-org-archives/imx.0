Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9422F375ADF;
	Mon,  2 Mar 2026 19:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772478669; cv=none; b=DOprR+vrNnq6JEBHGs84Y4PMKgeCE5j0v04vzHRayfVYKvIophlI0vujWjvQfuTj7cICdEqeFk6bxX5ypRPSrqVw3mm6bOGRQIOmLsq62rnAGlS9cLwTEGxmkjh0njZaUdwO5AV2Rze3zmUcQa9ZLAov7PdeXN+RjzGxAsYiK4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772478669; c=relaxed/simple;
	bh=uWqsPWoLceRWOTX5AmqN/UfPTuVA30jbJoTOEzmazHM=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=a/M+RIcl+n7G+0b8bYdRmEiVo8lkgATc/9gu6Kx9K01L4k+wQNFnfMb9MU7fT36T3MpHAofZpVqYVF6bn7o+ihkBt/1awY8M1dnkcH951Ph8u4nglgjoV2gVVmPp0DnGXoutPtpc+9pynHOFMM+qXfy6ZvpbowQbeQKewegBL2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=aPp+X/NY; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="aPp+X/NY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=h1VF0DyJM4S3khhBiKZ2azH4+q+TwqF38A3z4Da2QfU=; b=aPp+X/NYXUa8OpoMHOESMRmH00
	DsBNEm8htHaWoOEBWIJ6mAKCKc3NWtHUS6rh2ikLFAfu858mMzhbrCLENhFxpZy5otaN/L9FvljLg
	EZ7/yUX7hbGuTYh8by3+Yw07IPfcU1/Igoc1MsK+jKvH9yMeyEXRiSah9UKtaNxU0E7c=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:59962 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vx8fN-0007Wl-TA; Mon, 02 Mar 2026 14:10:55 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Mon,  2 Mar 2026 14:03:45 -0500
Message-ID: <20260302190953.669325-10-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302190953.669325-1-hugo@hugovil.com>
References: <20260302190953.669325-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Subject: [PATCH 09/14] ARM: dts: imx6ul-var-som: add proper Wifi and Bluetooth support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

The existing configuration of the optional Wifi/Bluetooth module was
copied from the original Variscite kernel tree, and requires custom
scripts to properly configure the Wifi/Bluetooth module.

Add proper support for the optional Wifi and Bluetooth configuration on
VAR-SOM-6UL so that it works out of the box, without any custom scripts.

The SD card interface cannot be used if the Wifi/BT module is in use.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  2 +
 .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 18 ++---
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  | 18 +++++
 .../boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi | 75 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 15 ++++
 .../nxp/imx/imx6ull-var-som-concerto-full.dts | 18 +++++
 .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi | 15 ++++
 7 files changed, 151 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index bc534d0fb1412..c7f24ee63071f 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -339,6 +339,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-tx6ul-0011.dtb \
 	imx6ul-tx6ul-mainboard.dtb \
 	imx6ul-var-som-concerto.dtb \
+	imx6ul-var-som-concerto-full.dtb \
 	imx6ull-14x14-evk.dtb \
 	imx6ull-colibri-aster.dtb \
 	imx6ull-colibri-emmc-aster.dtb \
@@ -377,6 +378,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-tqma6ull2-mba6ulx.dtb \
 	imx6ull-tqma6ull2l-mba6ulx.dtb \
 	imx6ull-var-som-concerto.dtb \
+	imx6ull-var-som-concerto-full.dtb \
 	imx6ull-uti260b.dtb \
 	imx6ulz-14x14-evk.dtb \
 	imx6ulz-bsh-smm-m2.dtb
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
index dd4ecff1eb786..af8c5d2db53d4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
@@ -19,6 +19,14 @@ memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
 
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_gpio_dvfs: reg-gpio-dvfs {
 		compatible = "regulator-gpio";
 		regulator-min-microvolt = <1300000>;
@@ -68,9 +76,6 @@ ethphy0: ethernet-phy@1 {
 };
 
 &iomuxc {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_hog>;
-
 	pinctrl_enet1: enet1grp {
 		fsl,pins = <
 			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
@@ -97,13 +102,6 @@ MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
 		>;
 	};
 
-	pinctrl_hog: hoggrp {
-		fsl,pins = <
-			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT Enable */
-			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029	/* WLAN Enable */
-		>;
-	};
-
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
new file mode 100644
index 0000000000000..519250b31db24
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
+ * Variscite SoM mounted on it (6UL CPU variant).
+ *
+ * Copyright 2026 Dimonoff
+ */
+
+/dts-v1/;
+
+#include "imx6ul-var-som.dtsi"
+#include "imx6ul-var-som-concerto-common.dtsi"
+#include "imx6ul-var-som-wifi.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
+	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
new file mode 100644
index 0000000000000..6d16ff7909dab
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Support optional Wifi/Bluetooth on Variscite VAR-SOM-6UL module.
+ *
+ * Copyright 2019-2024 Variscite Ltd.
+ * Copyright 2026 Dimonoff
+ */
+
+/ {
+	reg_sd1_vmmc: regulator_sd1_vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VMMC1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <10000>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_brcm_wifi>;
+		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&iomuxc {
+	pinctrl_32k_clk: 32kclkgrp {
+		/*
+		 * For TP option, an additional oscillator is assembled on the
+		 * SOM to provide 32 kHz to the WiFi module. Without TP option,
+		 * this pin is configured to provide the 32 KHz clock to the
+		 * WiFi module.
+		 */
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO03__OSC32K_32K_OUT	0x03029
+		>;
+	};
+};
+
+&tsc {
+	status = "disabled";
+};
+
+/* Bluetooth UART */
+&uart2 {
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_brcm_bt>;
+		shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&reg_3p3v>;
+		vddio-supply = <&reg_3p3v>;
+	};
+};
+
+&usdhc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_32k_clk>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_32k_clk>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>;
+	no-1-8-v;
+	non-removable;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	vmmc-supply = <&reg_sd1_vmmc>;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac"; /* LWB option: Sterling LWB5 */
+		reg = <1>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
index 35a0c0b3603fd..b4e6a9316dd81 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
@@ -15,3 +15,18 @@ / {
 	model = "Variscite VAR-SOM-6UL module";
 	compatible = "variscite,var-som-imx6ul", "fsl,imx6ul";
 };
+
+&iomuxc {
+	pinctrl_brcm_bt: brcm-bt-grp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
+		>;
+	};
+
+	pinctrl_brcm_wifi: brcm-wifi-grp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
+			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
new file mode 100644
index 0000000000000..7c0e313603630
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
+ * Variscite SoM mounted on it (6ULL CPU variant).
+ *
+ * Copyright 2026 Dimonoff
+ */
+
+/dts-v1/;
+
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-var-som-concerto-common.dtsi"
+#include "imx6ul-var-som-wifi.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
+	compatible = "variscite,mx6ullconcerto", "variscite,var-som-imx6ull", "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
index ba482a97623b2..3067ff6a1bc74 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
@@ -13,3 +13,18 @@ / {
 	model = "Variscite VAR-SOM-6UL module";
 	compatible = "variscite,var-som-imx6ull", "fsl,imx6ull";
 };
+
+&iomuxc {
+	pinctrl_brcm_bt: brcm-bt-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
+		>;
+	};
+
+	pinctrl_brcm_wifi: brcm-wifi-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
+		>;
+	};
+};
-- 
2.47.3

