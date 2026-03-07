Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544723A4F4F
	for <imx@lists.linux.dev>; Sat,  7 Mar 2026 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898917; cv=none; b=muFssZykAiTXcLW3fvnonzLLn6bFEcOktL1hg9oSlujnM9Twvba0rN4eNwPqq31szdYq3x1cH5SYV2bI0Vn9jV2vAc/4W2R/944BkARHvUv/wMM8GBvOaXAfpXGcd7YEB96NS09DAt2dmq2wM7MC6GltdkKDIFougi7CY0yGS1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898917; c=relaxed/simple;
	bh=QT4IbwlNAm1QHdgTk1/doFRjJm7ZCtbktCMd9e4q2ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uKXKQ0SqYZ0R3uOUYLGMf4krZ5tPmMUrIWq1b+VdvTP7eVzqipkZ67sbwzjkpZrGtYU90OzQO3Dc78JZq/9vrrtGrxR9A7pb/sozpc2eeDIPHv/rOzc8J7KNY8apiy2T7kZlyeDucAO9Sa45uD7PZVdbDXnhA8k/PhD60hgba4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aP8da9hi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aP8da9hi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so5653075e9.2
        for <imx@lists.linux.dev>; Sat, 07 Mar 2026 07:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898915; x=1773503715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+K/4EeJCxe92O1jpes4D7vWhHNljpVjuEnxrJp6Jybk=;
        b=aP8da9hingTOuoWQ5Rx4XUhaOQRLE5t0AcswpYLhihbjQzY6zTajClSFsbw/sG+7FC
         clI/0JqZBoQn5WdgCbxiOZQTBo6VoHvdkDAJdKgLaBrApIwHxNERuRyOJ37EG2OJ2Woj
         V8hbeDaj6AFj26cplJ2OmrWdPZnE8Ck3tpLEdkdrjS7Vj1pal8a8zWHz+NERagvfgGAe
         AQBWDCFZFmpt3kVUOdA9IEJphXa8fVV53bTGAd64pA2vVv9v2d5bW7AfdFJ8RklVVA/j
         W/HlIQX9g8A88Enf7N739PkHJQioSgRlryCX8+1SQANZmrCmugBFp1FgVehetqx4MG8k
         Zo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898915; x=1773503715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+K/4EeJCxe92O1jpes4D7vWhHNljpVjuEnxrJp6Jybk=;
        b=NnQUbE0LpBYS30shg4EHnMecLOPkgzBRokqqmXdeF3jpWZHRpGG194AaJfxjL0L5mC
         vAZB91Pbkb2kYt5lMFt1nn96GiYgc7jW5uMWVCT/5Gb9skX/ucHb93nXYFqsmb1xVz7Z
         76LuoyNj94qjLmoYZAEzZYRW/Kez1gdSb6i09ruaiIXVbj86qE9DPjYDgqgpxiI3Xvds
         yuoHHsajYwsvFBFUrnjOcSwW71H40YjWK2CqPSeOtokxsQkX3Bvu1uKrfbQuDtTaJ3mJ
         euqMTWZAwOujL0zlMh2Lt0Q0CY9xllU3g5EaaWkXH5Q2YSYD7amvw3RxlTH5S9+BqRoJ
         Gztg==
X-Forwarded-Encrypted: i=1; AJvYcCVh3qUF3wIMEikZ4i3GMRR5+W2C8BQAOQpaA8n1pNQtrMjIeCFmv7khhSh3Gf6fdVwXe50=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuT6cBZW/klrqz2ijV7mOlG4lfngQYqOb0HXDnfrxO+uLBynRy
	P8BJHfS9ikPnKtpeouPYuXSXQ0D5NZOhy4712MGqCL6JRCwsCPlVSoNr
X-Gm-Gg: ATEYQzzrjkCNgIyrt1dkpJ8Ub1g8NIExNx3ME6i4PvHTO5iZU18AqijZ8bBsoYUw6Ef
	CC6TmemLB2hGRtTBC4p4Ifxeul15u5c1Ik6IoVLdU9Opmo64bEQzC1wHQxnpLdRHRsufITXC3uq
	E+UfrCeN6eTmjkxXQcWid4XYAc6RCRMynxvZHLU92FqIW0YIrEIoNy8dzruk8jz+a7cISzXXFiE
	92mI6B6zFPpsB9417qczfjkQe0XdJSna8ReWRVsL/7fe4gTcLlj0vYf9anyQjASdEUiNl7aXagD
	Qti/6c/afmFefAv9T2M+YDr11QDWV9cMbWSD7npf1EavRNvj3eYyLza2dtx5qkzE/YvlOycDzs0
	GBLHIDrQvqihel0P5j4rJ8tz9w8uIpxVAupldYck/LTSmSlyzZflIMI4BZAVCKzSR3Yi416+nuy
	UxUY7GhE6o7xyfJLlcKQvIWp0BS+h+YWc70WX7mENsD+ohA8aMJlgK5Vf5bE68/Pc1fTnLc0pq9
	pAabBc8dDNjONLDzBQY5tX1Gw==
X-Received: by 2002:a05:600c:a117:b0:483:7eea:b185 with SMTP id 5b1f17b1804b1-4852695aedemr76798135e9.16.1772898914633;
        Sat, 07 Mar 2026 07:55:14 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:14 -0800 (PST)
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
Subject: [PATCH v3 03/11] arm64: dts: freescale: imx8mm-var-som: Update FEC support with MaxLinear PHY
Date: Sat,  7 Mar 2026 16:54:39 +0100
Message-ID: <24d31e0ca71c9b2dcb64d39117a8501d85cf945f.1772898346.git.stefano.radaelli21@gmail.com>
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

Update the FEC Ethernet controller on the i.MX8MM VAR-SOM to match the
latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.

Add the PHY VDDIO supply regulator, adjust reset timings and add a
pinctrl sleep state for low-power operation.

The PHY LED signals originate on the SOM, but the actual LEDs are part
of the carrier implementation (RJ45 connector). Move the LED
configuration to the Symphony carrier device tree, matching the
evaluation board LED wiring.

The enet_rst GPIO hog on the carrier is kept to ensure a defined
board-level reset line state during boot.

Wake-on-LAN via magic packet is not supported at the VAR-SOM level and
is therefore not enabled in the SOM device tree nor in the official
evaluation carrier board configuration (symphony).
Designs requiring WoL support may enable it in their own carrier-specific
device trees if properly integrated at the hardware level.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - Moved phy LED configurations to symphony dts

 .../dts/freescale/imx8mm-var-som-symphony.dts | 27 ++++++++++++-
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 39 +++++++++++++++++--
 2 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 819707e6f3bf..712892edba8f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "imx8mm-var-som.dtsi"
 
 / {
@@ -71,7 +72,24 @@ led {
 };
 
 &ethphy {
-	reset-gpios = <&pca9534 5 GPIO_ACTIVE_HIGH>;
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
 };
 
 &i2c2 {
@@ -99,6 +117,13 @@ usb3-sata-sel-hog {
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
index da3c7332ec34..24924ee1e8c7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -24,6 +24,13 @@ reg_eth_phy: regulator-eth-phy {
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
@@ -99,12 +106,17 @@ touchscreen@0 {
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
@@ -116,7 +128,8 @@ ethphy: ethernet-phy@4 {
 			reg = <4>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <10000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy_vddio>;
 		};
 	};
 };
@@ -366,6 +379,26 @@ MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19
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

