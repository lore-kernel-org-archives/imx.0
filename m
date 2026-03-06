Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03A343C077
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 19:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827126; cv=none; b=ncZgUJh8AOyqmUoDWHcgqGX9b5dO+G6NOZIK6yO743Pvvaf3Id3CWueC+Y/hBasOYL/ndn5ZI+UCXioa52ThraR19aQ5tAZsLlVCUfPVcH8t+Hc4ReCOLKwdy4+dOK5/y88srBxpgIJDGMNwk09pRLkaW2cCYOwknl8OSrIrVZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827126; c=relaxed/simple;
	bh=Bo6uHmKoCW74XA+zkV2qEgtT7A07fBiZFYjxTVWXfkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YrIlY4WBXhYKA7q9ePKIcwMR6vbejOfwDtD8f1Iqd36TAQFvjaoMI27D6Mm1IQWD1Te5f+E1dbYZO+PRI9kvJR+n0FAGudeLkR523hJnqyyoeQIh39YsX1i5UL6GGZzoqxDOqqR4YNLOcyoS3faIGfR8vi+nX0RQ0p/rc1bbUws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2J1NuQI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2J1NuQI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso89984575e9.2
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 11:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827122; x=1773431922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdG08ZWm+hlT9FVxwUh/CwAknI2CF8I/yIBQ6VyRzCY=;
        b=L2J1NuQImRQeAjX2n4e4c/kwUMEEIYQ508dlDyIPeBvO/faVh6KiuK+gyoHQ5saJXH
         K2TpqSiswaPi4WBCerlqBXY/S07tGYn9pzVdmlIgSlhMFKwLC5HQED6KqhsUTsJBgqQN
         f6gyC3cu4xL2q5cx/wl3KrZ5kZbCWqkpU6tcAvpfII/HUoNXowyubwIbccOdxwwnzWHZ
         S5WJe24sz5DpC88F6XQ0uUDrAAyOl4gDEH44PW0GEmFTsFwL7VOmvdi462GW2YGou3w2
         bfcSdIY6XfRjVCCfld2G6k7RFyZsPLq4xCxqvfXaXMEXtTzesw7rScExuGjt0rdrrv7+
         aBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827122; x=1773431922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MdG08ZWm+hlT9FVxwUh/CwAknI2CF8I/yIBQ6VyRzCY=;
        b=dZQiH5/Q0zPfERpaCxfFC2dh4N8n27uPjmHX86+0HHRXQWMS5Tx7AThM5umHqn5CfD
         q9eCT86bybfxelNCslslFVPxNVDqOOm6pdWTQrx1bUSnPl8YWw/9KzkbNwjMsGMxWdKC
         vAs6113KCzzfBYkJA7FCFEUM+SCNDmaKPOQKY3IWYTjN+xu/oSKAYUCBO6f668WHzfqS
         iC65dhpDHUkaqm65NPsOowR07pJ5Gv5mPawiLJCP/7ru1u+eFAPVuxGIyaxDOXo/02ut
         O+4T4mFH4475unYHc3V4T1ZcpJBk3kc48xtSnoxsRiXLogzp6/Tn775Gyfm5zX7BZyvm
         N3YQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0olIA7syYsyoFdKr3rZi5MLmNJPSBi//MPcqIfPamnM0urSL74fkFop9pk91jRfA4ldg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNj7HyCXO1WJj6OL4cWw1Q9L7z4m40VCTVvNe45+h4IyNqPKs7
	O/wlNfudWidEAcbrWmvLh+jxia3SycmhOFo6voKjFdr10Rzfd+Wq2+zO
X-Gm-Gg: ATEYQzx9MzZ0Ue1Ti3NjLQqG8NPMVjrhdzY+t8XTRros7UuXLVS/PDsJkIVSuKX3NI1
	quSd/is9B7lngklyDwSDK5KiV585ILu6zFqCO4Fch61dvWrEial4iTIhrolBhTewIhQMTm5PACm
	8hRadN6mlalkUEL0OsCDohtfVEM69vyGTeHoRorBBMmfwBbdInxmMHL8MZKXsTbpDd19vP016k8
	FbOVQ2xj/7AZcQRvkQCSKWrByz+xCshMp3SP8A1nsWpjp15t/+31SiWBqMcxnj4jgaXs0gNSRKF
	O7RELa5ck1T9CSB3GsjLwkKhMcJzr+Yu9DITnsiF8bUdm/QKCR/U5y3wLWoKsfmpanEBty07w5e
	BINfjRb3s+1Xqt44gQZJ6FT6UsdjrIl+BGK2z54wQCWho6OfU7HafgvyF7XX5mU9S7tce4p/KYW
	3HSUByNnbZ9O+Q4CuFTOi1wGQm2ZfO2mV1AJqhIyAiM8q7drtoqE8PNY96lzfRe+mCRj06fQ7KN
	X+Z98NH6m3xtnwD2Lxmwz/rKSv5b41yODanTCOvfcx73MvTyg==
X-Received: by 2002:a05:600c:3596:b0:483:709e:f22d with SMTP id 5b1f17b1804b1-48526964c5bmr54934365e9.27.1772827122339;
        Fri, 06 Mar 2026 11:58:42 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:42 -0800 (PST)
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
Subject: [PATCH v2 03/11] arm64: dts: freescale: imx8mm-var-som: Update FEC support with MaxLinear PHY
Date: Fri,  6 Mar 2026 20:58:22 +0100
Message-ID: <24d31e0ca71c9b2dcb64d39117a8501d85cf945f.1772826534.git.stefano.r@variscite.com>
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

