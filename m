Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D7737DEA1
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 08:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068377; cv=none; b=Qf7QtD1PKDEqx3K9y52Q90efpuZSC+v/mLzOCCytvVjnG5aCQ+v0Td/x7ncPSithN6dBPdO/mN2RxiyeDyQUhLTXVwlzreG86nqrbbmoLpxVFnK09j76GVUJ/3u4vCAx6HLHpaMnWbnYfnTuCBXiWMeAoXUwYjO+iKBYPRCqoss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068377; c=relaxed/simple;
	bh=CHVuDcmthljhm/+QuQQ7+dOlRBMF2WQBn3NwgyY5x4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRj8dqRYc/3eN871zkJ+IupmNTVVIfH0zOiwnZG/F071OedF7nuYLz4ivY0/PK0JkoO/fS8FKQ66iwR/yYfRbkiSeh57qi92Rwbxk/7ds80SesjxgvgIY9wwQLr1hscUhROnELXb06fAmO3vHI4KsFWhIUG2rxNZkBh3CasM9Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDAy7ONv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDAy7ONv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493be1b9682so2341485e9.2
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 01:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068372; x=1783673172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVUtoItzoPm0+8nMg3WUJmehJ16QEtEOKQagUMReJZE=;
        b=qDAy7ONvRnnnr+Akw14Y7EuiO9lmb66/LKsdM1upA976NlwByHokYlHB8A5DGH6QzP
         FQkzrj5w9ZrK0KtTrTYlpaVm3fKN7VB65ZOC9Mm9/yH+YbYC4XMslpqdXxmCewgIJeP/
         yuc2EFXs0aq/CI61I9JDEPxYiEjwfqP5kMHpyjnSEMz8nhgSUm+L6pk4eY0xbpedT3Pe
         jveQe0kJ3qEawkrZBYygkoQp9ilhLc8GOCEKwRT84Sg+6tqJYs75TEa1Lx6HGAvkcwEP
         YyHuZc1ftFkWNjoMBLnmp+lqH9ZsmvfnABSlrOv0K3tWcw1H3tA1ts7bY9SJASzrxSsg
         PRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068372; x=1783673172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fVUtoItzoPm0+8nMg3WUJmehJ16QEtEOKQagUMReJZE=;
        b=EQcE09QYo3Gpy+NxrqojRAvnsuav9uPNWeIj20RKYV3J7evBiauOreaOzo7aISLszC
         Ng4CF6m1ShmrB3RemuhZV7NMdNufdCFnU3temPusl7C2iLswr6l5RMu0PtfTDaVRNFyd
         czJJcRQ7FlnHlRGyk/0DDmq63UqnSGf7qL2wOUPRyLy/5vYxP2SKX2rRUnIEfqWeT7qT
         N/9HhnX1xGDTC8vrAQD5lrdq+XDeT8CgSYGBXBT8Lif56oCBip3PxuUPlCXMRv0+GXT2
         ig3hCD92+f1OO9x3w1psgJQKEgX/13hNX9TVfYBM5K56mAi8JmqCwP+nqXqKbRAIeG4h
         N0IA==
X-Forwarded-Encrypted: i=1; AFNElJ/OJekVSmIoi8qQWZv/FrIEWoK1x0wvjYlGVYDxsAlMFyWwXZVelqaqUwSZlohbfQPJ2/c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo5aruOkQNTxLWHHVaIW6Cqb76G3weRtO3Vo5RbsAj67A8bElb
	5BsKIEYoyriA/WOXrDVJDX1fqCGqrO2Ng6iPmkkILZcNm+p73ejGUPKF
X-Gm-Gg: AfdE7ckw7VBp1Dd2Ev9VZAg03JoitDEK6xNkU/+mackeSy7XPJdhEiBvhpDSQHaYqe6
	rZO2KEz86DgliPNx+z8chO0TIawuRbuLveuNaQm0HS6zoBIHnMaz58J8U0zJt/S5bWxr1c/9nxB
	zwn4SYO7sX3dEydlOvzZ0EgpI4DrBc3tr/s6RaN/whw03zb20l4P6xCACatxqyoHY6gDz97SI01
	7WvxCVEX70/ni78Oe6vQS14pnEQU3ffmgEv4sNqK0zpmjEMypbqU5T+CmEi9rAIwFsqJaWuJCQ1
	HjD7m0WnRKaVhsxN/Z0OXV2m2j45JRWCq0zRDw+2W3wb4DgrYEGQHX2ueRnK8F7IMsuCqpW2/Z3
	MjY4v16DwdNwpxkvoV2P72kNQzyobBreJeKm3smy5wnvaOoAqnQ6UIgoxE9XlU/WHXX2Myxtpft
	VNhkQ3pd2m+GXD3Z4KVCs/Iptgq1nLmP4pZLqnRv/SJqGcs7c/P1VlJ6j/Y8JM8uDKaNI9Ex4qq
	/LFrGJvanrSWALKv75lGoSpDQ==
X-Received: by 2002:a05:600c:c118:b0:492:62d9:4e57 with SMTP id 5b1f17b1804b1-493c2b382c2mr105386325e9.2.1783068371937;
        Fri, 03 Jul 2026 01:46:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:11 -0700 (PDT)
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
Subject: [PATCH v1 04/15] arm64: dts: freescale: imx8mn-var-som: Update FEC support with MaxLinear PHY
Date: Fri,  3 Jul 2026 10:45:51 +0200
Message-ID: <bd2a524c39372518dcdf128220f3bb210afa290b.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
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

