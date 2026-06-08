Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135C73DD86F
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929701; cv=none; b=AXaHPE/TGUNeUXTsf2hupdZO3D/woGws5Gm4knGd6QG3p9HdZQTDtujPJfuEZoJ8z6eSYZWOMXx53lARH0yB9DHKvnswhfNuCiVv6lmut4WbjcHh1ock5Wca5qwKBd64CHnYSy9SBBvO0ersgxrQsvi5wJ9roH5uyAADzdatMnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929701; c=relaxed/simple;
	bh=YQ3Ts2N7Y7C9SSwL8dwogmxLISVQdcuieA6twL626d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E31AQtQeFEZQdUUB1yWDi9LpiBWpEowGSgDXFUViUtSPvYFT6nBK4EofyFR+KXMt5LUhwLEtkTbJpihKqqWMuaQNc7sttF5xPQF/9cPKbG30hGcfaIAitY5BmRQwcZyqb0DP3DamrRXmQLQLGIOLzCxKYovP/I27gL/wr4BGN0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awautaUe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awautaUe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so29002675e9.0
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929697; x=1781534497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgF2+FSMMZyB7xSc2hmicWFUfptsUmJ1dBy4jYz3nPg=;
        b=awautaUeiQOGVM5KKvz8kiou56JPA4LP9dzhXKiGNXOzDUR4Y7t5kRYBBKB6fIpsK7
         HTFIj+yanUx4A2Q3xqu7vOxV4ODzHzdA5dUTmpMHgw6lL8Q5xSqujuPzIDO92eK1RGf4
         GEql3iDRyxmMm1s3FL97ogcxxLnaKGX3oiEXoFqegt3GYWp+D9TyTU5U+VAoMKFD9ag7
         7+6SJ2AYHQMbaODrW9NNOh/DkrvYm5egm4PDmxRaUXa+KNcak0ad9n/jEnpvbD+EL4/O
         Nqx5CotCuscj4tBT/3wDftcsAHAFnJDpq/BI0nuPih1QtVGdvUCQaeFt87H4wQp0wtsX
         VvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929697; x=1781534497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zgF2+FSMMZyB7xSc2hmicWFUfptsUmJ1dBy4jYz3nPg=;
        b=fblm8HreHhkC406ZpRWj3kS5IwO6YlE4sBWtu7zlc+EiC4Y50HK9lJXTPmdvaixvBH
         1Uri8k1uEvgMxH6FRHvydR/DqV9AW4KDXP1PlrXzkP6gRwZiCrQgY0Ge0J0tSCzgnDqY
         slvaICE4lhkktwRsu8XG2hpgJFrWPgn97XaLpapeR/26NAZz3BVzOOQM1cYLO/5jMcAE
         LH8iDYU/K5eQwU8N3UkeUBBW/Na8a2IkqPnbxrSCMzW/dR7rK4+rPRppDWbJOswd+1gm
         RyfgTH2iRNR8L0EIRJ2FuZ0zALwQP141qaZeFBXqEu6JkSk1Q/pmX8c9NDps9vpZ7Fao
         JMIA==
X-Forwarded-Encrypted: i=1; AFNElJ8rsLN1OKkMSjLzsxvQwrOsO0BtzFkfbvEWVh3ZIBeLJ6ON9twGqmAGksAfNckrBZWem7w=@lists.linux.dev
X-Gm-Message-State: AOJu0YynyhFknLRLVbmOeaQgW2WKMgG4hfvlfafxsQDGl+Oa+X/AVE/Q
	gvmytWuUC59klBH5Y7KtS9xXphM/wq5mjTjKVnLhXrUA2nNWflmsbnxx
X-Gm-Gg: Acq92OFQlsqngpPrMcuAr6tq/ezlKWX6RkEZaZ2zkFOPvIDwkjq8FEX7VFCOOAPUm0N
	BzsUnbXTTfHnIRqJpISGTndIB6Apzp2/PoaP8NFjYoJkV6wzG1xS2wHmcC1BaoCOb0tCbZedYqM
	bRReWQ6PIO6ohQWLTWxzLc5b2W1FBxVtrM75sPqML2b+EWJngRJbNU9sGGZGAzmIDad6tdnCfYj
	7cWKL2wf2thJvwclqcnJr8T73D+w5FTb4kpqUFg0YTR77D+rvZZs+Elw6T4X0BhHhBioao8q5C1
	ykXCRgMXS+rhhNe2mfg4fkeCbnkLGJs3pCrqO9nStAwOb74byCxn4Rk0cfnLea91ZmoHixkO9Ca
	z53RygWccjpurgJSHwe6bzGQnyou7ket4QA2uKANVUEy8ackTSz1byH5Bhzphgx38XRfnK0SWPV
	7qCH2vDWg3iWBkE1+qO3w4XqqJY4sH/gKfo/5l/hPFe1WKgG0Ix+R07sQ91OLz7WPYqDotzUwhS
	w00Mv68aVDYZAhmXxN2scfoO2f8aT5oFdnGHVKh4Q5JX9pO
X-Received: by 2002:a05:600c:6087:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-490c25b0231mr276473505e9.11.1780929696365;
        Mon, 08 Jun 2026 07:41:36 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:36 -0700 (PDT)
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
Subject: [PATCH v5 13/14] arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
Date: Mon,  8 Jun 2026 16:41:14 +0200
Message-ID: <7bcfeb748665154245f5dc3294b82ab79d96e4a1.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the second Ethernet interface available on the Symphony
carrier board.

Enable the FEC controller, add the MaxLinear MXL86110 Gigabit Ethernet
PHY on the MDIO bus, describe its reset and power configuration, and add
the required RGMII pinctrl settings.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Remove regulator-always-on and duplicated vddio node

v3->v4:
 - Fixed eth regulator

v2->v3:
 - Add FEC controller and MaxLinear MXL86110 PHY support

 .../dts/freescale/imx8mp-var-som-symphony.dts | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 93dee9ec0b9b..e928a3d44b1d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -66,6 +66,16 @@ pcie0_refclk: pcie0-refclk {
 		clock-frequency = <100000000>;
 	};
 
+	reg_fec_phy: regulator-fec-phy {
+		compatible = "regulator-fixed";
+		regulator-name = "fec-phy";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-enable-ramp-delay = <20000>;
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -106,6 +116,33 @@ &ecspi2 {
 	status = "okay";
 };
 
+&eqos {
+	mdio {
+		ethphy1: ethernet-phy@5 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <5>;
+			reset-gpios = <&pca9534 5 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <20000>;
+			vddio-supply = <&reg_phy_vddio>;
+		};
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy1>;
+	phy-supply = <&reg_fec_phy>;
+	status = "okay";
+};
+
 &flexcan2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan2>;
@@ -363,6 +400,23 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
 		>;
 	};
 
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0				0x90
+			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1				0x90
+			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2				0x90
+			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3				0x90
+			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC				0x90
+			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL			0x90
+			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0				0x00
+			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1				0x00
+			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2				0x00
+			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3				0x00
+			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL			0x00
+			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC				0x00
+		>;
+	};
+
 	pinctrl_flexcan2: flexcan2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART3_RXD__CAN2_TX					0x154
-- 
2.47.3

