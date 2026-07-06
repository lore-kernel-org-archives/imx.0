Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCE8480952
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330501; cv=none; b=OJf2gmrcNDKeIdgO5nuXyXwXQoveZ/vSod4mCMATFdJn2LFQMNYJvAu/8Z0bq/tltfSpT/Sa9v7AY+TlreFbebSDFEwrAX13Novm4LaEC0tbL3XXd2qGTOdk6MwBI0Tvp1rnstcllrmyetHdqn0lMetp8x8vMUlXtZt5jXEewV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330501; c=relaxed/simple;
	bh=NX34dqGyV75T5hg1xrnFDf9YiMGGtsH5OyQYePQX794=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlyFno5z0kKWtjGwQDoF4fw9WhdPPudGxccymprQPojDF0ZjEJ8uIlZF40s872Xa784O6tRYS1NcL0POojn5LUwi5q9figq4xXjz03NNaMIYECBo+7hk+rR08aZc8FrAgIyoZySZXXlJ597GEZ993i24Vbm5Badp06CgxQk4+Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfWXWo1W; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfWXWo1W"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so30624525e9.0
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330495; x=1783935295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcLdsxNIFOZhQkIiIBWMcl6LlY0cWDmbztEcoRQjzXg=;
        b=IfWXWo1WIAuFXPee/u61oAKYLF4K0H8CO3MOM3Zwtfp1u306zJXKKL6OmaJBpCAGdr
         bqftNhbOw0noZqTWnSimF+JTyUkc8APrSvHe5UIMnG+jAVOQd1XpddnXShu/cRl5dK31
         +fyxZieVhXkVNWL/kFURX7eanq/OETHlJEvin8qFMPTHNlhkAZ9eoNK3TKQOuQNNuufT
         6sMEpvney4CFP31BXUgfIKWvlufX1GwkHfTKAzJf3+OK9i2HAVkgjRQ5rImu5NLuaidj
         mNQDupTvHm2yqIQnpjDgL00V2Nc7jeAl9o2YR0bOdZN3fU7ilhY2WrovNvwPSgYg6QXw
         pGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330495; x=1783935295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wcLdsxNIFOZhQkIiIBWMcl6LlY0cWDmbztEcoRQjzXg=;
        b=AxXuI739hXcx3Cc5/UkS3GbM4Rpjwk/4B5EqJ0Wg2M08ggxGIj+8Dn0W9vkiJOSykn
         7LqxQys9KddWfk1/ViyyCukyEyhJR/Hbo+biNy9zGTNk3vjL+nEP+uo1xfFYrxy98BJ3
         T7oIWwRcz82tDjWH4sC6fPTB33iRSbUtjE1Lzt+JplPEjqDIo6hiDFqR8UFvZIuEYg35
         mR4NnVBwlJMLwJHTYjiA1NSlDSdCtF4DuIjD1OBM08SLDd4zIfO1+esrPlYyMD9iZhm3
         s5GTu/hDI7nr1XP9A4NFLBn44Fr6gCWTUhE0fEXfJgBiXJuiPy3WMF5/m0dxMetbrB/O
         LHOg==
X-Forwarded-Encrypted: i=1; AHgh+RqAKK9qZbeM37QsBlxg1/pTEl7gmTQCLLTg+gRX7phu3zH+dRTcJ4kkh1yEXMZrHTr9Clg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIDnK1kX3DB6r8z67iB58xhTn6CFRXiFF2FbkyMAcOhpb7G9/H
	GLrrrtAvjMCfr8BjoSKlJYuIWCgaHl78sQaWdSV5HgYkpqrYWgEdEto4
X-Gm-Gg: AfdE7cmxp1XmwE00WU1CPMnCUxIttRrIxjJ+7T3XokvO54dQj6l7iZSZreWVrWvOiQm
	M/4k8lZZsJv2aOO9hFpG5PdlwE6NLVr/ejtwCoupOAmXcq8EECjxj3fLq3MHCEJ0KZpptFyraV4
	oqbzXm+G+nhWlYczUz8fG9QjQ/RO+Bw/+/jhEQ8qau3bYcrPalXpyCPig84lyJnIXHXIXT7EDdO
	pZLYnlYGaXzqKD5VUEbBfXiE4up7vGpThYLzRVVAUOy+SPKtDvyaADBAq2oiRD5nHggueJ5Lemf
	fpJYwtUAOzr/jDbIzZz+ygEhSmq/VKNkO57Vb8akmbxLR4LUdWl17KoYC6Qfiw9hw102nmN3+Ns
	80hM1+GEZGUQs9EdF7Ya81oalolVpMQ1vx0j3QnZrOjaNws5cs6FNYuBNpVz2FCp3xMFQZ+AOty
	fFSyDaUm47/YY3sRfFowqDeDz5VTphKQ1upSmGc5aNCAVXyH5oPIi2cdrU6iBEaqPyM1xHXMoFn
	GzL1Hulf/x4py3jZH5uqFpteQ==
X-Received: by 2002:a05:600c:a01:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-493d11ced23mr113677845e9.3.1783330495380;
        Mon, 06 Jul 2026 02:34:55 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:54 -0700 (PDT)
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
Subject: [PATCH v2 04/15] arm64: dts: freescale: imx8mn-var-som: Update FEC support with MaxLinear PHY
Date: Mon,  6 Jul 2026 11:34:34 +0200
Message-ID: <8fdacc1d5c213685db8552460d04c44e515e85ea.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Update the FEC Ethernet controller on the i.MX8MN VAR-SOM to match the
latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.

Add the PHY VDDIO supply regulator and adjust reset timings.

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
v1->v2:
 - Fixed commit message

 .../dts/freescale/imx8mn-var-som-symphony.dts | 20 ++++++++++++++++++-
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 20 ++++++++++---------
 2 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 7308613a48b2..520aff23e587 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx8mn-var-som.dtsi"
 
@@ -74,7 +75,24 @@ reg_per_3v3: regulator-peripheral-3v3 {
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 71a2f0866822..09146ab76385 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -35,6 +35,13 @@ reg_3v3_fixed: regulator-3v3-fixed {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
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
@@ -96,24 +103,19 @@ &fec1 {
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy>;
 	phy-supply = <&reg_eth_phy>;
-	fsl,magic-packet;
 	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ethphy: ethernet-phy@4 { /* AR8033 or ADIN1300 */
+		ethphy: ethernet-phy@4 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <4>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			/*
-			 * Deassert delay:
-			 * ADIN1300 requires 5ms.
-			 * AR8033   requires 1ms.
-			 */
-			reset-deassert-us = <20000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy_vddio>;
 		};
 	};
 };
@@ -342,7 +344,7 @@ MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
 			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
 			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
-			MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x159
+			MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19
 		>;
 	};
 
-- 
2.47.3

