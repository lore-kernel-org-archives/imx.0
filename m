Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB83CF21F
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913396; cv=none; b=rnqRYXe9uB+8VzBjOvCi3gq3YKu2Vln7uayNUG8tZ+cMAI1UxOEsFPYlV/3wqvSuuh83yET2gI6USMabo3T0VXmtXBXrsK7Y8+NNx+LFi3clqAqNfHObYue4PvIlXks1jfYt6d3qrjJzukunnpYY/kxrAGGCTngYl88KqagS2CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913396; c=relaxed/simple;
	bh=a7g87jezxjhzlogqQlFoiz7UOw1n6QOOw9H1s+yqYYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHl6CsSRO0hmDG9wX1TS1Dr5Vghzk1RyDGteO9UnzX21llKoXYGnd35kGEdw0vnudZEJ1L/Nvi1SADIPLwd3iW85xaqhY8h5jj26iFtUObQEkyjEkzvMWoJHQQ9bcOnoveLvpVPzA3HCR6CGNZKi892wpJcEke3trYfgToK2kNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8IXFKmL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8IXFKmL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef616daf6so3707825f8f.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913392; x=1781518192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROhWAzt0nmjg7jEU5/oWSczs/XecwX3hU3s4az+MIks=;
        b=A8IXFKmLqsxvqjdEqdp0pq1395TeUHE5pwC2gGPmU2oB6WIl6E9e6f8Po8+KvCT3JA
         709rcd3RkoyqtaYYQmhkYbD9Br+5O3l3WkFQ8iwEnA2FWItVoXc6S60B2QTFR5U1rANN
         hRWNyM2xwvDo8mlV6hg7BGxQPj6vipZAF0pu1S1L/eu9bbFzDQ2cDo3uoCQO5RnT0Np4
         PB7B0H6SPv79Yx9wM+vh7lKlM5TwL1GiCJOlaP2PVggSJ7+BnqNVw/gyWfOfoej9juca
         B33WogMacm0ocEzlxJkcCeSGeogGE/exTI3W98pwsL8JXz2yleQELcLGIvQDkMBGSn/4
         wvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913392; x=1781518192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ROhWAzt0nmjg7jEU5/oWSczs/XecwX3hU3s4az+MIks=;
        b=bm0Mu+qY5+A/IYwUEMSuoZY533mYzEabMiKLZ678weUHH2aM8eWDp+CslOQeglUHGG
         wTLT6t/auwR0oBJpjklenLxQlCVLS+X6VyddKQ9pB/u4ME7dXpKjte220QIY3HCeT6uK
         BcFAwg5ruy8xJV7FjK2iv9XuqyEL91JU3jb6zBgZBgXQ6U8uKOnkwc9I+SHzIAbo8g7B
         QnA19fbA19+NTEtqcqtzmww7Dh1K6wKWMoOBO+E3sjXVDO8F2LmLr3y9Vja0jcEZ4NcU
         /QfWgo68GgWkoffG6ZG1azLpztuNr7LBaRpRQBJBo7vbkWZ5HApPvDy+WexcEZCIQ5IH
         qaWw==
X-Forwarded-Encrypted: i=1; AFNElJ86YNH7AwspCEDiw6eQnyNSOPbpAryF8aoJ35IsZty8vjfKxKgGeBKLUFWVHVzS+fNM6sY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKr5TsM2vtPFiarY357UTprKkitTinf+2IL8Z0rOKAnoGV4c7z
	xhd27w9TUpnOtxFiTm8fLH2Ox+twKa3W8vN6+XOL0EuPkR/mYlMOGX1X
X-Gm-Gg: Acq92OENCNOn2U4QDBe9X5KcjvztnvvRapsC1aI7Qn+EOnooYiVUBz/6tnf58YZHweW
	Fx+iHOLbR/ry3KTIaqamRn+vDk7TWA9l6qmvdpBRyMOJhIzTg/C+ntNAXG2rR3tBbewaADwWtFL
	kOPyZjbHNnOYjGHanM4drpptBgmh7n4eo3tb9F3LrUS9iQU/4YdE+1dmfNhGgMPO82yUEf9OJmG
	VtTBdrzOBrcXm/rd+uiXnL0u7yWREXrLaVIFp+nax5YpMGCZaNgAwnJ91UkF71ErT3aibfmtnP+
	wvYlLVUT7iHfL3xuWaDHOp58asGVUp/CGy00Aix7vw74b79tEzN5Kr86Ebd/oazAi1L6f8Obc9a
	dbAmmrSdl2zuqznnxA3wo/CearM6cx594qllCTUzWMZhMSiKeLSyltH1+hOqEKcSRiVuH6gJLcd
	EnRGLpQDnfYerjlZZ3KXToF+tUQZMlbTFLVgskemmnl7FCpR9Rx8gQggQjQHwSTWQZJfy1uOVz8
	WIAQi6daisn6qsdoh7/RH6E2bq9me8fgo+IjN/B1a1vITE8
X-Received: by 2002:adf:fa89:0:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-46030501f74mr15797982f8f.25.1780913392055;
        Mon, 08 Jun 2026 03:09:52 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:51 -0700 (PDT)
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
Subject: [PATCH v4 13/14] arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
Date: Mon,  8 Jun 2026 12:09:31 +0200
Message-ID: <302638ba16d4684c5b0bf8660a42615dad67f3eb.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
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
v3->v4:
 - Fixed eth regulator

v2->v3:
 - Add FEC controller and MaxLinear MXL86110 PHY support

 .../dts/freescale/imx8mp-var-som-symphony.dts | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 7ad57caa0f1c..c5a38018d494 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -66,6 +66,24 @@ pcie0_refclk: pcie0-refclk {
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
+		regulator-always-on;
+	};
+
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -106,6 +124,33 @@ &ecspi2 {
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
@@ -363,6 +408,23 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
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

