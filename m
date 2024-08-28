Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AF716A934
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 09:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724839008; cv=none; b=FAab+BdhJnLgkKiHPARCyUtiFa/iwO1+TiR6jHMK2fiipDcaDoHQH0hdBviZxUa0VB1ftadOI8uAOpH0231ewP1CZZZhyGsJjxr/5v8hYmT7TXL8sQAZrfiOOGxTX9Khg/9wg59ha/VDO9md4lrXiKHNpZHMQ/7sIF6K4bmbVlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724839008; c=relaxed/simple;
	bh=1iMd1q7rX6vsSXbhj3ohXTZxeKdF4WYLhtuXkH6hUqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZ8wTwLydrdxluyI0sSIYbgbIaScUn6HjJTf4FXkFLNH4P1g6g+DX4d5shI5oXOfFmt1hMJQg02L6pGBctkdJFnHA3yb80B4coQxb+SgAA/29PjfMq1nG+7ta45ApL9F8xgxVNM67ab526nIY/C5Ssb6ov4PHCP13VV7TwandsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t3FxzqUY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t3FxzqUY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-371b2a51746so196398f8f.3
        for <imx@lists.linux.dev>; Wed, 28 Aug 2024 02:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724839004; x=1725443804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5svEi1xLQ8wE+GfQEbQrZ0tIUKTdgCq1EM5fOzmkKVA=;
        b=t3FxzqUYSoMyRoP9dV4/c0ScHWJsoIqQOQMmZzYy0ZNE4fLRMY+MeicwksUB6PmVGH
         lQIyu6sHt2XZKIMC71GzrYdhEM+3rSHVzCM5Oqhz6vPtzntousEdkt6X1GYHIC5vY2MJ
         WkSqpcd+rLGxX2tbOjgzGbdiSoaUl4EpYqjEXFDchvdIxRZYVCgvhOztVohobUzq9wJP
         GKBntC99B4rh2D/5+9+9MbeP24ID8PXBShMD0tvn2HkJ17Hv3DyUNdWU+w//WQUYqGRY
         ROQFDKkX59IFF5IrZJnC56ffLzaeEP1R+/BjbUzIAaYE8VLn/IhHo3hw4kvwrYPDYS6F
         phKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724839004; x=1725443804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5svEi1xLQ8wE+GfQEbQrZ0tIUKTdgCq1EM5fOzmkKVA=;
        b=XzJtYSnMNX8rH1dnzlzNFTbLYOVwTYuX30CI4rBdLFIf5utxaDyyI5OAhpUDOo0pxQ
         5JeKPtyBViKtMroOoNnLII8ZVPhqjg6G1GcUUMOzC5fTOYvAw/i9xeUMeeMbJucguz4c
         JshlSnKnhYGrJyGacJtC3SdR1b3HgtFWGXEimw//ctUlQC1EGyogtfmiisRQgdSqe9e9
         RyAsAr7/0yHmwZ+0+nRzeanJW+ob9oyKvlNWVxotvG5QZQcKyBzlrYGnXLKPsk56c3sN
         Wi5PXVx1wig5EqCiasvSEfkEmRmN6c7O1jeRrjc9Zf7BC8xUaD9dfBiXOS6I4iIQsQdl
         JiwA==
X-Forwarded-Encrypted: i=1; AJvYcCU4S2RxbMcvEiXzZKlXzs4KOLSi68Vc0lDYVoi9TMz6V/gfQXxY0HK/rpJnuBy4kdJAzak=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwBd0l/t5qU8Dwu1P0Q1s/BqAH/+nrKjBfCr9es5mRoV61+sim
	zRVLTHsz9E5J3+1aeYXQ2hfkTa5k773Shm7NmvuK37BWAqKjGuTnvDKfubG0r3A=
X-Google-Smtp-Source: AGHT+IFn2UqZNMBnO7/rGTPmAwR15v5XtKMxrhTo+jLaSB2mrMfJC92+R+D9ZMAI1bvVzUBHw2ThpA==
X-Received: by 2002:a5d:6c6f:0:b0:367:90a8:4d3b with SMTP id ffacd0b85a97d-3731185b259mr6637991f8f.3.1724839004510;
        Wed, 28 Aug 2024 02:56:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730810fb33sm15067077f8f.13.2024.08.28.02.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:56:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] ARM: dts: imx7: align pin config nodes with bindings
Date: Wed, 28 Aug 2024 11:56:37 +0200
Message-ID: <20240828095638.231569-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828095638.231569-1-krzysztof.kozlowski@linaro.org>
References: <20240828095638.231569-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bindings expect pin configuration nodes in pinctrl to match certain
naming:

  imx7s-colibri-eval-v3.dtb: pinctrl@30330000: 'lvdstx' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
  imx7s-warp.dtb: pinctrl@30330000: 'usdhc3grp_100mhz', 'usdhc3grp_200mhz' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi     | 20 +++++++++----------
 .../boot/dts/nxp/imx/imx7d-remarkable2.dts    |  8 ++++----
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts      |  4 ++--
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 9fe51884af79..62e41edcaf1d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -903,7 +903,7 @@ MX7D_PAD_LCD_VSYNC__LCD_VSYNC		0x79 /* SODIMM 82 */
 		>;
 	};
 
-	pinctrl_lvds_transceiver: lvdstx {
+	pinctrl_lvds_transceiver: lvdstxgrp {
 		fsl,pins = <
 			MX7D_PAD_ENET1_RGMII_RD2__GPIO7_IO2     0x14 /* SODIMM 63 */
 			MX7D_PAD_ENET1_RGMII_RD3__GPIO7_IO3     0x74 /* SODIMM 55 */
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts
index 9c6476bda4a0..7ee66be8bccb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts
@@ -419,7 +419,7 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog_1 &pinctrl_j2>;
 
-	pinctrl_hog_1: hoggrp-1 {
+	pinctrl_hog_1: hoggrp {
 		fsl,pins = <
 			MX7D_PAD_SD3_RESET_B__GPIO6_IO11	0x5d
 			MX7D_PAD_GPIO1_IO13__GPIO1_IO13		0x7d
@@ -665,7 +665,7 @@ &iomuxc_lpsr {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog_2>;
 
-	pinctrl_hog_2: hoggrp-2 {
+	pinctrl_hog_2: hoggrp {
 		fsl,pins = <
 			MX7D_PAD_LPSR_GPIO1_IO02__GPIO1_IO2	0x7d
 			MX7D_PAD_LPSR_GPIO1_IO03__CCM_CLKO2	0x7d
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi
index 8d5037ac03c7..a1574ccec89c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi
@@ -444,14 +444,14 @@ MX7D_PAD_SD3_RESET_B__GPIO6_IO11		0x1  /* Ethernet reset */
 		>;
 	};
 
-	pinctrl_can1: can1frp {
+	pinctrl_can1: can1frpgrp {
 		fsl,pins = <
 			MX7D_PAD_SAI1_RX_DATA__FLEXCAN1_RX	0x59
 			MX7D_PAD_SAI1_TX_BCLK__FLEXCAN1_TX	0x59
 		>;
 	};
 
-	pinctrl_can2: can2frp {
+	pinctrl_can2: can2frpgrp {
 		fsl,pins = <
 			MX7D_PAD_SAI1_TX_SYNC__FLEXCAN2_RX	0x59
 			MX7D_PAD_SAI1_TX_DATA__FLEXCAN2_TX	0x59
@@ -499,19 +499,19 @@ MX7D_PAD_LCD_RESET__GPIO3_IO4		0x14
 		>;
 	};
 
-	pinctrl_pwm1: pwm1 {
+	pinctrl_pwm1: pwm1grp {
 		fsl,pins = <
 			MX7D_PAD_GPIO1_IO08__PWM1_OUT	0x7f
 		>;
 	};
 
-	pinctrl_pwm2: pwm2 {
+	pinctrl_pwm2: pwm2grp {
 		fsl,pins = <
 			MX7D_PAD_GPIO1_IO09__PWM2_OUT	0x7f
 		>;
 	};
 
-	pinctrl_pwm3: pwm3 {
+	pinctrl_pwm3: pwm3grp {
 		fsl,pins = <
 			MX7D_PAD_GPIO1_IO10__PWM3_OUT	0x7f
 		>;
@@ -563,7 +563,7 @@ MX7D_PAD_ECSPI2_MISO__UART7_DCE_RTS	0x79
 		>;
 	};
 
-	pinctrl_usbotg1_pwr: usbotg_pwr {
+	pinctrl_usbotg1_pwr: usbotgpwrgrp {
 		fsl,pins = <
 			MX7D_PAD_UART3_TX_DATA__GPIO4_IO5	0x14
 		>;
@@ -581,7 +581,7 @@ MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x15
 		>;
 	};
 
-	pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {
+	pinctrl_usdhc1_100mhz: usdhc1-100mhz-grp {
 		fsl,pins = <
 			MX7D_PAD_SD1_CMD__SD1_CMD		0x5a
 			MX7D_PAD_SD1_CLK__SD1_CLK		0x1a
@@ -593,7 +593,7 @@ MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x15
 		>;
 	};
 
-	pinctrl_usdhc1_200mhz: usdhc1grp_200mhz {
+	pinctrl_usdhc1_200mhz: usdhc1-200mhz-grp {
 		fsl,pins = <
 			MX7D_PAD_SD1_CMD__SD1_CMD		0x5b
 			MX7D_PAD_SD1_CLK__SD1_CLK		0x1b
@@ -631,7 +631,7 @@ MX7D_PAD_SD3_DATA7__SD3_DATA7		0x59
 		>;
 	};
 
-	pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
+	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
 		fsl,pins = <
 			MX7D_PAD_SD3_CMD__SD3_CMD		0x5a
 			MX7D_PAD_SD3_CLK__SD3_CLK		0x1a
@@ -646,7 +646,7 @@ MX7D_PAD_SD3_DATA7__SD3_DATA7		0x5a
 		>;
 	};
 
-	pinctrl_usdhc3_200mhz: usdhc3grp_200mhz {
+	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
 		fsl,pins = <
 			MX7D_PAD_SD3_CMD__SD3_CMD		0x5b
 			MX7D_PAD_SD3_CLK__SD3_CLK		0x1b
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
index 92cb45dacda6..eec526a96311 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
@@ -508,7 +508,7 @@ MX7D_PAD_SD2_DATA3__SD2_DATA3		0x59
 		>;
 	};
 
-	pinctrl_usdhc2_100mhz: usdhc2grp_100mhz {
+	pinctrl_usdhc2_100mhz: usdhc2-100mhz-grp {
 		fsl,pins = <
 			MX7D_PAD_SD2_CMD__SD2_CMD		0x5a
 			MX7D_PAD_SD2_CLK__SD2_CLK		0x1a
@@ -519,7 +519,7 @@ MX7D_PAD_SD2_DATA3__SD2_DATA3		0x5a
 		>;
 	};
 
-	pinctrl_usdhc2_200mhz: usdhc2grp_200mhz {
+	pinctrl_usdhc2_200mhz: usdhc2-200mhz-grp {
 		fsl,pins = <
 			MX7D_PAD_SD2_CMD__SD2_CMD		0x5b
 			MX7D_PAD_SD2_CLK__SD2_CLK		0x1b
@@ -546,7 +546,7 @@ MX7D_PAD_SD3_STROBE__SD3_STROBE		0x19
 		>;
 	};
 
-	pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
+	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
 		fsl,pins = <
 			MX7D_PAD_SD3_CMD__SD3_CMD		0x5a
 			MX7D_PAD_SD3_CLK__SD3_CLK		0x1a
@@ -562,7 +562,7 @@ MX7D_PAD_SD3_STROBE__SD3_STROBE		0x1a
 		>;
 	};
 
-	pinctrl_usdhc3_200mhz: usdhc3grp_200mhz {
+	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
 		fsl,pins = <
 			MX7D_PAD_SD3_CMD__SD3_CMD		0x5b
 			MX7D_PAD_SD3_CLK__SD3_CLK		0x1b
diff --git a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
index 7bab113ca6da..af4acc311572 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
@@ -459,7 +459,7 @@ MX7D_PAD_SD3_RESET_B__SD3_RESET_B	0x19
 		>;
 	};
 
-	pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
+	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
 		fsl,pins = <
 			MX7D_PAD_SD3_CMD__SD3_CMD		0x5a
 			MX7D_PAD_SD3_CLK__SD3_CLK		0x1a
@@ -475,7 +475,7 @@ MX7D_PAD_SD3_RESET_B__SD3_RESET_B	0x1a
 		>;
 	};
 
-	pinctrl_usdhc3_200mhz: usdhc3grp_200mhz {
+	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
 		fsl,pins = <
 			MX7D_PAD_SD3_CMD__SD3_CMD		0x5b
 			MX7D_PAD_SD3_CLK__SD3_CLK		0x1b
-- 
2.43.0

