Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E706443E5E
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 21:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786397721; cv=none; b=YqXitlND0C2hW/ScXvh9p+hfOoofG3VhIobg+z5k1ZKv+V9dho3REZpo9luIEo84iLedlrDRhqhtiBsbFZ9OwBUEygATUpGr+7vSe0BfDH5TQ5ru2JkXpDuoR8H9xdxyHQkQ504oLQAH2IVKakBVEmU9K+oTyayZ9qkiPqG7H3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786397721; c=relaxed/simple;
	bh=Zn28nsH8jNhI1FFVTqn/pw4dkNiDLa0Jmas0Ypm1JaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LdiTPHyDWIm56ZSsOuasXP/5RK27wsAIsMNVQReUIYaet5ytCCpjADPa/pjwOUAFJHMiZjzcb/4GOv6c01Jk8HQDTilY1d9VAns4c2aGUUuStKhOGz/rPoWVuar8WGgn2VRz3Hg8ybrq54xKYuff2csRk+ihPFS9118M5qHQejA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=YjGLapGB; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="YjGLapGB"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC97611B8AC;
	Mon, 10 Aug 2026 23:35:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786397713; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ryp3/PB4vcj0KtZaTMI5+VyehhpTjHATZ/hJV75Vuiw=;
	b=YjGLapGB2AS4LGMSUTz3zNmU2ssjHIl9NOGVg6sqBmnrJYqqHUzdI/jTk3X4siHV0LmJBQ
	efz2VR1VcxIByepeXnnOubhja6DV4vXUxyULTpMB77zH5WeZEWKwn9vBsBipnvBQUsPLPM
	FOsyZnMGat+uXDyDk1+ry0CuU4gXS64KdsOnoQtaSET2haGU5+kbBncPFu4KOHzeLarIwN
	8aBoBUWYXnXXAU7f1rUbx/ANAW0tm/heb6oPYdp+aQBGTaraw0wwtQmG5Z2opjIWQmO9b6
	3fW5rTyYCMcf+pcZ4oLLpRQNJBGqJpamhDRzri7eIBQ0ZdvohAhCnPH0fMoQ2Q==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Fedor Ross <fedor.ross@ifm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx8mn: Expand EEPROM description on ifm VHIP4 EvalBoard
Date: Mon, 10 Aug 2026 23:34:39 +0200
Message-ID: <20260810213456.1268831-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810213456.1268831-1-marex@nabladev.com>
References: <20260810213456.1268831-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Describe the EEPROM write protect GPIOs and labels on VHIP4 EvalBoard.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Fedor Ross <fedor.ross@ifm.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../imx8mn-vhip4-evalboard-common.dtsi        |  3 +-
 .../freescale/imx8mn-vhip4-evalboard-v1.dts   |  8 ++++++
 .../freescale/imx8mn-vhip4-evalboard-v2.dts   | 28 ++++++++++++++++---
 3 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-common.dtsi
index aaf9761703aaf..73b1ed2632a39 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-common.dtsi
@@ -142,8 +142,9 @@ &i2c1 {
 	pinctrl-0 = <&pinctrl_i2c1>;
 	pinctrl-1 = <&pinctrl_i2c1_gpio>;
 
-	eeprom@51 {
+	cfg_eeprom: eeprom@51 {
 		compatible = "atmel,24c128";
+		label = "ifm-deviceinfo";
 		reg = <0x51>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
index a8f7c226a61f8..98dd241a9d5ce 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
@@ -13,6 +13,11 @@ / {
 		     "ifm,imx8mn-vhip4", "fsl,imx8mn";
 };
 
+&cfg_eeprom {
+	/* Shared with logging EEPROM on v1 hardware */
+	wp-gpios = <&gpio5 20 GPIO_ACTIVE_HIGH>;
+};
+
 &ifm_led {
 	pinctrl-1 = <&pinctrl_gpio_led_v1>;
 
@@ -90,7 +95,10 @@ temperature-sensor@48 {
 
 	eeprom@50 {
 		compatible = "atmel,24c128";
+		label = "ifm-logging";
 		reg = <0x50>;
+		/* Shared with configuration EEPROM on v1 hardware */
+		wp-gpios = <&gpio5 20 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
index 43fd4d0041ef3..04fa43b12d2b5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
@@ -20,6 +20,12 @@ multi-led {
 	};
 };
 
+&cfg_eeprom {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_cfgeeprom>;
+	wp-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+};
+
 &ifm_led {
 	pinctrl-1 = <&pinctrl_gpio_led_v2>;
 
@@ -87,7 +93,11 @@ temperature-sensor@48 {
 
 	eeprom@54 {
 		compatible = "atmel,24c128";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_logeeprom>;
+		label = "ifm-logging";
 		reg = <0x54>;
+		wp-gpios = <&gpio5 3 GPIO_ACTIVE_HIGH>;
 	};
 };
 
@@ -103,6 +113,13 @@ &ifm_pmic {
 };
 
 &iomuxc {
+	pinctrl_cfgeeprom: cfgeeprom-grp {
+		fsl,pins = <
+			/* CFG_EEPROM_WP */
+			MX8MN_IOMUXC_SD1_STROBE_GPIO2_IO11		0x140
+		>;
+	};
+
 	pinctrl_ecspi1_cs: ecspi1-cs-grp {
 		fsl,pins = <
 			/* KS8794 nCS */
@@ -143,12 +160,8 @@ pinctrl_i2c1_gpio: i2c1-gpio-grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SD1_DATA4_GPIO2_IO6		0x56
 			MX8MN_IOMUXC_SD1_DATA5_GPIO2_IO7		0xd6
-			/* CFG_EEPROM_WP */
-			MX8MN_IOMUXC_SD1_STROBE_GPIO2_IO11		0x140
 			/* RTC_nIRQ */
 			MX8MN_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5		0x116
-			/* LOG_EE_WP */
-			MX8MN_IOMUXC_SPDIF_TX_GPIO5_IO3			0x140
 		>;
 	};
 
@@ -166,6 +179,13 @@ MX8MN_IOMUXC_I2C3_SDA_GPIO5_IO19		0xd6
 		>;
 	};
 
+	pinctrl_logeeprom: logeeprom-grp {
+		fsl,pins = <
+			/* LOG_EE_WP */
+			MX8MN_IOMUXC_SPDIF_TX_GPIO5_IO3			0x140
+		>;
+	};
+
 	pinctrl_mcp2518: mcp2518-grp {
 		fsl,pins = <
 			/* CAN0_CLKO */
-- 
2.53.0

