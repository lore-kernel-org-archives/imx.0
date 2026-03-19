Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13D53DD514
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 18:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945718; cv=none; b=DTrEb630dEDWR5guBuf5V0UHkxMJi8K7LWTAQ0aezlHBmZtgiZTdjQKlJAHRixBJOK2p3V24FyoCc0fYhYeDV/gWgbAXfy8AqlMG85JIU0xpG1vPSpGuF1V9yAzPpetmL//R7NYE8Xac/p5irF0yLfxQmQIrhDqkO1Dlm36lLuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945718; c=relaxed/simple;
	bh=hLLpvx4fWfaISY1k8IjnB/a57kf/mIgsX/Z73kiBW4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X7xmKxwgwtTQJmhiN/o+0I4v6okAz/vK44C623wn6LuLFF6OCoTat2TubucXRDrAIIvn3pCnBZ923gUW2m/MjKxvpMPjFm+fQvh5l6gJWA9N/TIUF20fbbKQiCl/UNwmrEj/5xr8LOyYF9kpEPDGbh4gep3MlEEKHVQN4wsGA3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSGD7wZr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSGD7wZr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fd27754bso5099195e9.3
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945713; x=1774550513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsRjlpj8112gDvVfzgcWIwNrv5kQelDCvuBWHshniGY=;
        b=NSGD7wZrXEC6h05rCLMLvouxVj+FJ1QklrpeBvcki0q2dFvE1lMeI7Ewtw0MlcQMhL
         wBhndygyIxLAAXOaatoME46MOHtXVC8IIDi3Je5gu2hABcR3Po5DhvqEICdHc7YlM8B+
         jHlLaefz/li09je0ivpmas2YB7R4gTDs161kWR2ahHYCm5k2I2NXixI3UuMyTEVLTTzz
         pLpWCry4GYPR4KWS+jrI0aR6JhjyJ4VUPoVnOUk5oBZZosuwEgYETd0oTqZwzBlyUEEd
         glAXLq7+Lzn0Ui4DP8dYT4iJrigUkGoVhDA4gneiTJKgJ1aH+pdCRV/TTdKopVsYRkLN
         fJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945713; x=1774550513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hsRjlpj8112gDvVfzgcWIwNrv5kQelDCvuBWHshniGY=;
        b=XXEAvFDMpaE1Yb5q7oH6iPUAbbdINz6Wabqquib4e/Ob9+LbF5WAGDLal6i0W0Wstd
         Gsi36YOJoBajOqyOkdW9uX/N52d4gtZpy8d+lOhSFwv22ppK6nuc8YYdKkR1uBw4+MrV
         HuBQCyK1hD2J9chyVRJZnyt5IhEayxT6czRBHScuqAmshZKk7BiZ3LCtzFjd+MaESNtn
         zpFyAIo29TVYsH9IJMeEzh4BuN+YtJ7Beft3vhmXd1rLClLln7PScWxhmik/92MEtIqV
         1QY2koR6+mGP+brPfPxiHZWaB2hBmu1c/v6lQNo7WOVYOT/bloxSob//obpWBUgiEHVe
         PD9w==
X-Forwarded-Encrypted: i=1; AJvYcCXWAdvtljQsR8g8kBIfTHOqhLPbDIKnTiwTtZlBtMBVdbMlzsF3dbcb6z7q5l9PBz3idEA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxM6Es5sjinpPVZJqwK50Ea1xfGEhWnTh5eCU7BflgL52on/4/y
	HEky6wHSsV/IfXJOYt+I6FePMCLO+XQTqhicD5CG/LvWCGVWIjAaJBtz
X-Gm-Gg: ATEYQzzUr/eigFcsgSZfKpbuVBAJj2uZ2rIrIhzXi+g/LhwxTsjEyYaI5N6qSl3eUiV
	syoRRWyrpEjXWPOhVY3C2grkRrGH3s94LXF2YnLTeXS7XFBKeSNuo218fG+0wNgcooqrCO8AePh
	ToTbBHKEtbrxz+wEYJEnfmahMJnsT+lTGFCCApFieOGHpwz6NT5AY270fk9crnNYLURNpPCDhIW
	zXAjnydr0cmjXGUptlSwdUwDQlJyGWr5504pWr4KYDuDvxXsn6xbNKByx8Rj76kHl747Om9Lbd6
	6viXpNg7BkzcQ3FKuO8DnRnrFgdX1mK/V3y1ZRZ5ND0tHJU97LuSMnkDjcO8rCwgTvihqgRIO3i
	4HY3g+kM28wSv3rMbnweH2zTv900scOFdfV7AQ1GcVcLBq8mj7gZ3JjAizIgxppmADZDC+vlofg
	GYpPd4pKjx2mEwRrYs81yGpgl6hyU61AtJOFVI3ZuNqtAFRb/fcqs6nev766WGC/PYgHoUEZ8m+
	iqO2h3C/tknty56nf282KUy9R8ACA493RJXBoo=
X-Received: by 2002:a05:600c:4750:b0:485:3812:36dc with SMTP id 5b1f17b1804b1-486fedbd0bbmr2722735e9.9.1773945713116;
        Thu, 19 Mar 2026 11:41:53 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:52 -0700 (PDT)
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
Subject: [PATCH v4 03/11] arm64: dts: freescale: imx8mm-var-som: Update FEC support with MaxLinear PHY
Date: Thu, 19 Mar 2026 19:40:23 +0100
Message-ID: <7f26d7a437b76a60475fa5373803eeb2bea125b0.1773944896.git.stefano.r@variscite.com>
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

Update the FEC Ethernet controller on the i.MX8MM VAR-SOM to match the
latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.

Add the PHY VDDIO supply regulator, adjust reset timings and add a
pinctrl sleep state for low-power operation.

The PHY LED signals originate on the SOM, but the actual LEDs are part
of the carrier implementation (RJ45 connector). Move the LED
configuration to the Symphony carrier device tree, matching the
evaluation board LED wiring.

Wake-on-LAN via magic packet is not supported at the VAR-SOM level and
is therefore not enabled in the SOM device tree nor in the official
evaluation carrier board configuration (symphony).
Designs requiring WoL support may enable it in their own carrier-specific
device trees if properly integrated at the hardware level.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Remove wrong enet reset gpio hog

v2->v3:
 - 

v1->v2:
 - Moved phy LED configurations to symphony dts

 .../dts/freescale/imx8mm-var-som-symphony.dts | 20 +++++++++-
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 39 +++++++++++++++++--
 2 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 819707e6f3bf..9f4e004f0a37 100644
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

