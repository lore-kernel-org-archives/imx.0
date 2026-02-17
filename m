Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B2C374176
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353812; cv=none; b=GOcJuMbmJEctJRAZaFw8U6wXaScdRAh1S6024YvnTYaWS1Zt8gPBaGL9eJExr3JyjQf+x3Zj44yh7klNO2Ec/h2mbEylYerC0VpXqbaRxLu2bByRgeQOTkOBqZV8R6jwD5xdYsEANzJlt7n0TwRtj0/YPsDxJq/k/Lgw9iMtxDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353812; c=relaxed/simple;
	bh=sH3g/D/feOy6HRPpZvgse1l8RLfsseXya0OCko0vim8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxBbL5WceJ7UvnhEcSc5wxQF+PJ/BPOXwEwpnTdfz8f0f7mqYbchFiG5VyezuEfr5lzEA9XouaN1j6sfPNaZ0mwM6X9L7iEpIVrK6U1nGPWr59IQi/UMjldvXwgKBXCb2DIUqnHBwg2oWjLUUjKcm6DGNodH802aTBOINhTVS8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiYuTXTU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiYuTXTU"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4376de3f128so3115097f8f.0
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353809; x=1771958609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsvZHHMHNdlwLacCrgd+fOKcEC9NeExJe/PUTUm5+0c=;
        b=LiYuTXTUC2OIO3+XglKZ+C/+Vd7sN1dSFxSlwCoQy8TiI93g+I0K1NK/K5uvz8II/z
         a6RMxGprF2nKuyyq0Vsqmb+rHoIGZZ4FGtAutOVjhMmzJ4KjX+BHoewFvi+1qoECjnEC
         Ho1M44qRE97LYCMZ45WBiAr2O039BNucb98p8gkzBFo0DCITFjQskfFzfne68+gBBg0K
         jBNcx4VDWNze2BosiqkcEG6kT2usF02+gDh0JXFzV3OKc8j+6EyUA9RZjhEo+zp2FJA7
         bPe0gLGrW9D8vuIs26erc5HfP/Q0lCBGecQgzoglsI2e1urxST2Bb5MCXtIUuXfLmOAj
         dc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353809; x=1771958609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zsvZHHMHNdlwLacCrgd+fOKcEC9NeExJe/PUTUm5+0c=;
        b=Ke1ekKYFBqkSv5xfWiHCsLFmchHlc1sNvxNyocuPa8Dh1pzUnzibFWYeA/f9wUuAQJ
         YNuJLzD43SQa+p6+SIYMT/8qf5vg6eBTli8QCMgAbuk7UvzkkaXRwB57ziugoxcT+nkJ
         9ll5zCAWS/v9ZujI5sMrQ2NxBg59FO0AnhLUr6Hh8doT0qDjY/Ruw9sFHig4VvVbR15v
         t2lCkbUmmkdg9T+RrWcCW15kSMNqIs6lPD+8Xc0HpII9wbyYRQb2KQuR0klLf93wr9Kx
         9t+knd/a/XaDNMu+kZ56K5Ol3oLL/yuUJB0ufAup0Y+ZfMXcTG+VTT08KqOjRQoORQof
         pX2g==
X-Forwarded-Encrypted: i=1; AJvYcCU+fafwHhly3NPONTcB3h0TCCk8gQWx9ESCcrGqA+K7dY1LYWba9VCi3cz09OsNO0kUqOk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjWCj4366kWSZxnAI0f9vneyPIiqz+pFPYfvrMuiZ8SyQlIWxi
	uG41nh6Nd/OpdMjY7g7ir5Ta4GgFwhFngolBSrUVFoOjhSr3Kz8qEgED
X-Gm-Gg: AZuq6aJIDUx+LCpIGawKEQsXLKbxkU+2tvEe884cWiE8e8hfZA7Ib5q8BjrMKYwwfU7
	7Y/scjdakRYloaK584mXRaAN1EKLl+9zTZKW6myqAhVgHje4iVFUG0wnE34IkdMSPs2gyI5D9IB
	uB0jO06rlOAhzqjkn3xr+/ttyNoQiomzYMkBfqvFnDIwYHg7BFxxCQMxeZl3SANYVxMfJHlW8OA
	lpgfTDq5XPyyYcblg9nzGpG6EGwx4ea9T3PDkgf2dRtiK1yOXzQmFXf29T1Ofg1pgdyalVVYCD/
	YxXr9TO48HpJEfKJSqoDxtpMgxy8JeMJBHLyyzFMIPXS4W1RAzuSXJWE5gM2R8M9LYYiT1jtGMU
	IfK+iDU01xAyyVTToHKwuPQ+3DdrWSK3oLCgI0M1TprAB3LTEYfPxApDnCWh+hnUgX9N64SrN8k
	dGhS9mjifJ1q4m5/CQaYhpMOLgHAdh7q6AB49RnNMowhrnTh6+zbsl7qs4ohhfolhP5MfljkV5s
	K94BTlPrc8uqBY6P5ld6XZLnARysJJe4dsTBFJ5
X-Received: by 2002:a05:6000:2f83:b0:437:6e0b:7147 with SMTP id ffacd0b85a97d-4379db352e5mr19506480f8f.7.1771353808829;
        Tue, 17 Feb 2026 10:43:28 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:28 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 03/11] arm64: dts: freescale: imx8mm-var-som: Update FEC support with MaxLinear PHY
Date: Tue, 17 Feb 2026 19:42:37 +0100
Message-ID: <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Update the FEC Ethernet controller on the i.MX8MM VAR-SOM to match the
latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.

This patch adds:
- PHY VDDIO 1.8V supply regulator.
- Proper reset timings for the MXL86110.
- LED configuration for link/activity indication via the LED subsystem
  under /sys/class/leds/, leveraging the support in the MXL86110 PHY
  driver.
  Two LEDs are defined to match the VAR-SOM carrier design:
    * LED@0: Yellow, netdev trigger.
    * LED@1: Green, netdev trigger.
- A pinctrl sleep state for low-power operation.

The PHY reset is now handled in the SOM .dtsi using the SoC GPIO.
The previous carrier-specific reset-gpios property in the Symphony
device tree is therefore removed.

The enet_rst GPIO hog on the carrier is kept to ensure a defined
board-level reset line state during boot.

Wake-on-LAN via magic packet is not supported at the VAR-SOM level and
is therefore not enabled in the SOM device tree nor in the official
evaluation carrier board configuration (symphony).
Designs requiring WoL support may enable it in their own carrier-specific
device trees if properly integrated at the hardware level.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-som-symphony.dts | 11 ++--
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 59 ++++++++++++++++++-
 2 files changed, 63 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 819707e6f3bf..689894405b27 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -70,10 +70,6 @@ led {
 	};
 };
 
-&ethphy {
-	reset-gpios = <&pca9534 5 GPIO_ACTIVE_HIGH>;
-};
-
 &i2c2 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -99,6 +95,13 @@ usb3-sata-sel-hog {
 			line-name = "usb3_sata_sel";
 		};
 
+		enet-rst-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "enet_rst";
+		};
+
 		som-vselect-hog {
 			gpio-hog;
 			gpios = <6 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index da3c7332ec34..23045f54e00e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -4,6 +4,7 @@
  * Copyright (C) 2020 Krzysztof Kozlowski <krzk@kernel.org>
  */
 
+#include <dt-bindings/leds/common.h>
 #include "imx8mm.dtsi"
 
 / {
@@ -24,6 +25,13 @@ reg_eth_phy: regulator-eth-phy {
 		gpio = <&gpio2 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
 };
 
 &A53_0 {
@@ -99,12 +107,17 @@ touchscreen@0 {
 };
 
 &fec1 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_fec1>;
+	pinctrl-1 = <&pinctrl_fec1_sleep>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy>;
 	phy-supply = <&reg_eth_phy>;
-	fsl,magic-packet;
 	status = "okay";
 
 	mdio {
@@ -116,7 +129,27 @@ ethphy: ethernet-phy@4 {
 			reg = <4>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <10000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy_vddio>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+			};
 		};
 	};
 };
@@ -366,6 +399,26 @@ MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19
 		>;
 	};
 
+	pinctrl_fec1_sleep: fec1sleepgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_GPIO1_IO16		0x120
+			MX8MM_IOMUXC_ENET_MDIO_GPIO1_IO17		0x120
+			MX8MM_IOMUXC_ENET_TD3_GPIO1_IO18		0x120
+			MX8MM_IOMUXC_ENET_TD2_GPIO1_IO19		0x120
+			MX8MM_IOMUXC_ENET_TD1_GPIO1_IO20		0x120
+			MX8MM_IOMUXC_ENET_TD0_GPIO1_IO21		0x120
+			MX8MM_IOMUXC_ENET_RD3_GPIO1_IO29		0x120
+			MX8MM_IOMUXC_ENET_RD2_GPIO1_IO28		0x120
+			MX8MM_IOMUXC_ENET_RD1_GPIO1_IO27		0x120
+			MX8MM_IOMUXC_ENET_RD0_GPIO1_IO26		0x120
+			MX8MM_IOMUXC_ENET_TXC_GPIO1_IO23		0x120
+			MX8MM_IOMUXC_ENET_RXC_GPIO1_IO25		0x120
+			MX8MM_IOMUXC_ENET_RX_CTL_GPIO1_IO24		0x120
+			MX8MM_IOMUXC_ENET_TX_CTL_GPIO1_IO22		0x120
+			MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x100
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
-- 
2.47.3

