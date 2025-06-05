Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297A41FF1BF
	for <imx@lists.linux.dev>; Thu,  5 Jun 2025 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749113985; cv=none; b=YTL7SM0DLLQ0R7fN0araPdOvdrHCMjGkhLJjQN/NnO05MccLZ5gijDjvHpNA3BeyS4jT/ggLVJdeX+M11u8tIBksIy5gudpTNUAsKogwMu47FsO0D7T44euERC/JlWPRDZKW0pQPQofDEEEDrhf2pGmwwhpJGegS/0ogOAhQIuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749113985; c=relaxed/simple;
	bh=1IQrU1iDuiWW/Hfm8bkjda3OSF3yBkVGdgW8iJKSHIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B8qOQdeAZRcapoh5cde0EnspVdf1j3yz4CIK6HXylIjhyc92fwQ2IGqxR7EIr+pQIRGIH+rjJ1bRS4nOxDee/t83Kva4qX42WCPsKWEYyMmf+lGwrERz1o6Jpx4D//t/DaHWbPWZBf1CyLEF/fi+BZ29AQ4rvQ0NVr1dBgc3C44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIR0ZpXc; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIR0ZpXc"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4f71831abso669904f8f.3
        for <imx@lists.linux.dev>; Thu, 05 Jun 2025 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749113981; x=1749718781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ogjVDhDiMnU/s3WI4h7hVLm4gcfXJF8zSM1Pe2+EESo=;
        b=VIR0ZpXcAOIbl75L8Ok0tv4cefRirgHKp/mLYLvB4nPkkbv8g5io1Y3Rm5yuF0virN
         XhEIr97TDwNBoe2xjmbUaud9euAykbFX6Zhelis9XWf2p8fv04Rv+rKn92rWzd0Az4hH
         3PbHNvgIDeY8/WnLWYp2rayT3P/hkZrnqPOZFx6H91nlHevg9l+C4lmfKJdN3/TUDfwd
         TW54OKVQBMUtbvFWx4OuhX/xUC02DC6MAPI4ictMq36cXjFXZ5GdACd7Xdz7sIRcskej
         ateDEYJIh4jRNheA70ltXRpQ6nFlFvIMXzcwhkMH7vYUgU+JG/LL1GfoIzprj8MOXFub
         wP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749113981; x=1749718781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogjVDhDiMnU/s3WI4h7hVLm4gcfXJF8zSM1Pe2+EESo=;
        b=RtGtFeeMa7H7YbG2K/thL+pC7C4BCPKz0XJzCpiSfPGCB+Uzal339Mxfky1ve03w/W
         WIAzGcdT4XS+AjfQJohhHlwE2Ns9rr/wxZbRnHbOkadGAsXS0wLUw37n41R9YA6TBzQo
         vXWRZqGyQXbGdmVvbkSSl+9kHveKf+W+zerVK83ZwWe0BCZWSO187yNZ3pHn1Aga2jl6
         Slcq4g0CMED2yGrUNFPQ5pWVGmSWgQ8fd/o5wYPPQHE0X8bypaG8kTRs38OLPtDCkLsC
         BSod5K5hOjdBKJOPiW6by6fcDa/0CWD7iYp/UxL+FU1cxMpqxVijjsciIfkL31iMNQzj
         08Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUcSl1btxg9h6RVP9whX2GrnAX/PBnVUzNyZDrmP+LElhq8hNHK+nym+yBJ+giR9sjIBIM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGLruRyXAJJiSVEGgammDDn3Y3UdYVLS1RT1D54WT4qTDd7aAN
	c4JUMEj3e4uo23rBuNppO/QFGnNtdPeHnFRQ50dDhurQOZGKzJOsPbje
X-Gm-Gg: ASbGnctYTzXRuZVACyVtn/bwHwkEJiKbZAJCtE6G7SwpEoRE3xgrfz93vMewAy+iDQD
	8tgNElvCWcCkSvj+nNMvc1H8KGPls1LikSqgkP/Ag5iWYekRBW/3rlg7ObNyoyj9H+N8oH8Lbyu
	I8O0LC0kA0xg1G6yJyEqSXUuMvmZDUEQUaJQcJmFmsaUlyw5+HAuX0gk7uBeR0VIaeoKV2uXEFt
	hMcdtNoBKlAo/temK0M1PC/pW5GefMX2p1/xRyzsqXl3f4RI5D4tTtZZF+GNZtD4ZM7mg1jn0c8
	YPHocczM8za9yQ35IrMiJvQaabwbkj4cbTjty9Yb57sacBExE1CdGlVBlLEZZtdPfI+xsEgrHn+
	WsoqWF0ppX6rEnykrite0Kh3n3whRs5j+Fjs=
X-Google-Smtp-Source: AGHT+IEzo/+1PtqXUJzfqQ4rzJBMvCxovxZsMpL2szL116m7MitSuowtYBLWA/qIIb6W6jeKzOII8w==
X-Received: by 2002:adf:edc3:0:b0:3a5:2465:c0a4 with SMTP id ffacd0b85a97d-3a52465c359mr3054884f8f.20.1749113981006;
        Thu, 05 Jun 2025 01:59:41 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a00d4sm24281167f8f.92.2025.06.05.01.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:59:40 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: othacehe@gnu.org,
	andrew@lunn.ch,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] arm64: dts: freescale: imx93-var-som: update eqos support for MaxLinear PHY
Date: Thu,  5 Jun 2025 10:59:04 +0200
Message-ID: <20250605085904.12199-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variscite has updated the Ethernet PHY on the VAR-SOM-MX93 from the
ADIN1300BCPZ to the MaxLinear MXL86110, as documented in the
August 2023 revision changelog.
Link: https://variwiki.com/index.php?title=VAR-SOM-MX93_rev_changelog

Update the device tree accordingly:
- Drop the regulator node used to power the previously PHY.
- Add support for the reset line using GPIO1_IO07 with proper timings.
- Configure the PHY LEDs via the LED subsystem under /sys/class/leds/,
  leveraging the support implemented in the mxl86110 PHY driver
  (drivers/net/phy/mxl-86110.c).
  Two LEDs are defined to match the LED configuration on the Variscite
  VAR-SOM Carrier Boards:
    * LED@0: Yellow, netdev trigger.
    * LED@1: Green, netdev trigger.
- Adjust the RGMII clock pad control settings to match the updated PHY
  requirements.

These changes ensure proper PHY initialization and LED status indication
for the new MaxLinear MXL86110, improving board compatibility with the
latest hardware revision.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
v3:
  - Add "PATCH" to subject line.
  - Fix wrong reference to previous PHY in commit message.

v2: https://lore.kernel.org/imx/20250604153510.55689-1-stefano.radaelli21@gmail.com/
  - Clarified the use of 'rgmii' mode by adding a comment in the DT,
    explaining that hardware delays are already implemented on the SOM PCB.

v1: https://lore.kernel.org/imx/20250603221416.74523-1-stefano.radaelli21@gmail.com/

 .../boot/dts/freescale/imx93-var-som.dtsi     | 45 ++++++++++++-------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 783938245e4f..cea8d792328c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -19,26 +19,19 @@ mmc_pwrseq: mmc-pwrseq {
 		reset-gpios = <&gpio4 14 GPIO_ACTIVE_LOW>,	/* WIFI_RESET */
 			      <&gpio3 7 GPIO_ACTIVE_LOW>;	/* WIFI_PWR_EN */
 	};
-
-	reg_eqos_phy: regulator-eqos-phy {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_eqos_phy>;
-		regulator-name = "eth_phy_pwr";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		startup-delay-us = <100000>;
-		regulator-always-on;
-	};
 };
 
 &eqos {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy0>;
+	snps,clk-csr = <5>;
 	status = "okay";
 
 	mdio {
@@ -51,6 +44,27 @@ ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 			eee-broken-1000t;
+			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
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
@@ -75,14 +89,15 @@ MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
 			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
 			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
 			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
-			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x5fe
+			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
 			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
 			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
 			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
 			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
 			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
-			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
+			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
 			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
+			MX93_PAD_UART2_TXD__GPIO1_IO07				0x51e
 		>;
 	};
 

base-commit: a9dfb7db96f7bc1f30feae673aab7fdbfbc94e9c
prerequisite-patch-id: 2335ebcc90360b008c840e7edf7e34a595880edf
-- 
2.43.0

