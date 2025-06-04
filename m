Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48C33595E
	for <imx@lists.linux.dev>; Wed,  4 Jun 2025 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749051405; cv=none; b=aBnwI+4iOLNl8dlI4He8mblXBNaPzizri/CiBvMsqLuQ50X8DN0CYNcwXSuNruVoJRiNCwjOkZzAltWDX3qVNd8z5e0YbiZ11VzzraJ+w1lsDPyP5tJAJpVhazlom7wbkvPElrnKQ2pS2fKR9XS+zF4ZEmuTBc1UFvGvg2S/Aiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749051405; c=relaxed/simple;
	bh=VAVBXJfyud+eYn9s3sAYWNbfc3RcXs5f9i6EwU+Eguk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D2hQH+7/q1WVdtO4AoMFnxl7pTggHcNAipGYUO2zhlPU6qcskoSZd1HEtlwSd904O0lU5JajkhzbD5p7Gw+jmdQYCjFQnSRryKvX6GUuL+paEc4ohp9aDdahZkoDrJMIIVF1GcYvLG+4J4bhKH3A3qKd9NPJFiOx3eWTG7FeVz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsKtTlxj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsKtTlxj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so298265e9.0
        for <imx@lists.linux.dev>; Wed, 04 Jun 2025 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749051402; x=1749656202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=po4hRDSGCZuh9pjG/L2z6feCTEmaDMC+4+ptAw6xPXg=;
        b=YsKtTlxju76PTnNukWdKaNF4mBEfYThaD4ooYjzXkYq3+4GLPScMO9nuyJ5JP7vUVr
         MBv/ZpAl11hMPRZYObvfXBnzzWTj1aV+8DlB3M2cmV8Wc8jlsZvlKx9X+vNBPoN0J1Ul
         GGQoZ1jEQqx/fLlwRnd0GmuFJnXKLcNEY0wkUFZq/uawd2aiiboizMd+lVk47Wi75dKW
         x0yphidQ3JbE43X475Cm8IhT69CWKHu1UCastJcLtLkM9TKRyq6Dcmh9gZyJl5sbWT+x
         41JskgfFkT5hFbCDYuvyokLht+n6XemC3GXOPdEsPz55MmAJukNqVuJ36ApILXkAEo4o
         an7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749051402; x=1749656202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=po4hRDSGCZuh9pjG/L2z6feCTEmaDMC+4+ptAw6xPXg=;
        b=PtJQ66fn9XdVzdD9U6TOkzeMwz3vIEhffOJFA1hWqFWEtDhWxrVeOKuHzNdxkGxvwM
         S7HRMUeB8Ci3XXt+gaxkKWHhfYc5eCIS9ZtLE/dyaBlopPX//qXmFy/qfIpSplThPRml
         NkX6lW7cMtg3sEodA3ZiL0cYKxjRrm7AxKZPOAKJExFDrC55WXAN8qp6pZNq4e1OqnCe
         7BCwDCmTVBGE4+IszmaYfZAjodycHqE3PYdSyE+6uBKmj2dKmXb/vQZNN1QFfU5cB99O
         /+ldgkZUqjJ2Zcq7rH8g7yw0K5GflKrE2zpIz43DcJfwo/ZyWQfS6HuXHLQDieEUDXWD
         QDgg==
X-Forwarded-Encrypted: i=1; AJvYcCU9hi1TeIP7ji1LjsB2fYviyyx7UbyQEsCuDmw0DhFdpwr+THUFM2/RKxISRpgYoBLFmUk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlKZvM1i2O3JFYR/atqfs1t3uDm4ARajq1hYpTHJTkz0SCNYr1
	/BaVWsOvuwWk03Zdr3DVymemJwJ6ORLwmCAcRdGPhzt3vXo6xClUwCCv
X-Gm-Gg: ASbGncs2kSbEajXkwopu3iceBFORyPjsuuw7YDrnVmAIULSxLjldirAJ1HrOqFBBqMH
	gMH0CPzjEAAc5w/n8LxHJzjs1MHGkFlZlcyS+7wKFvDClk69BQ+gKvaGi0/VbHhsi17eJBlD+2X
	slc4DKu3AUd7DCaQHUa7unVSE1MYaDjiVV4GHKbdYkGDTLUOo+edHAeyuvaED+yfIPgkXMc1Zh/
	hWxZK2E3dRg8+T39vicjymsP6W50vpPf5sG+iLufBCu12sclpBz+o4ae556YreFn1XP67qJeVSW
	f9gYy/2OVSWLnnLXNL4LDvpZxmNjOqCF9xrI3t4ILXNMc3Vt+NgeMH+NQVEotQB+uaCQtj2h+nV
	psFdw5RxcN6LEcHSdlT/XVbaB4pI3qdU4HJnk4j3GAQuQSA==
X-Google-Smtp-Source: AGHT+IEiuiACGB5AsupJRC8pwPtzuBvDCDBA2W8wfZMmUi90dxJ20Ue6vRcyhVvfN7K/S5TF5w2O8g==
X-Received: by 2002:a05:600c:8b26:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-451efe946acmr30208025e9.10.1749051401531;
        Wed, 04 Jun 2025 08:36:41 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8012b09sm200711165e9.37.2025.06.04.08.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:36:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: othacehe@gnu.org,
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
Subject: [v2] arm64: dts: freescale: imx93-var-som: update eqos support for MaxLinear PHY
Date: Wed,  4 Jun 2025 17:35:09 +0200
Message-ID: <20250604153510.55689-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variscite has updated the Ethernet PHY on the VAR-SOM-MX93 from the
Murata CYW43353 to the MaxLinear MXL86110, as documented in the
August 2023 revision changelog.
Link: https://variwiki.com/index.php?title=VAR-SOM-MX93_rev_changelog

Update the device tree accordingly:
- Drop the unused regulator node previously used to power the Murata PHY.
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
v2:
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

