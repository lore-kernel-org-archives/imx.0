Received: from mx-relay186-hz1.antispameurope.com (mx-relay186-hz1.antispameurope.com [94.100.133.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355E534A789
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 13:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892466; cv=pass; b=hWzUqiHX+uSGqZZXZqhYy5gGhVNfOXsjZFmWsafMcfzvr+rIwcy3eD7RLCMY+eNen1W1IoAMecip+e/5rPVz9wY7pc5jZFHhFDV/c4QOPVOiQiTyieCUIlp+cSmHkeK0UTtyp8md7J16DuGVx+CcOfBKmSBTrOg1b4nExffxOWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892466; c=relaxed/simple;
	bh=ZVwXYQDLhX+snpzP7zDTjm80JBthkRMPulHnycCGpdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAEaxDxSzyWrZdWTPL1o1o5swe7uXJFL5LA5e1fEVJ13jtClyVeZpwK0VuDyiezRHmREScqGj8b/6zvAs7DjBLpW7rnFuax2gA8p4hsYWO5IMZRz1o//XjgRRKjD8dH7pEUE5eLs+SDmRwzOXHnkHWGydHQekU/bjdgKhw3JE+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=ew.tq-group.com; spf=unknown smtp.mailfrom=ew.tq-group.com; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=QwiWqnsw reason="key not found in DNS"; arc=pass smtp.client-ip=94.100.133.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="QwiWqnsw"
ARC-Authentication-Results: i=1; mx-gate186-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=y/NNmCOZpOKOo1L5GaD1X3K8BzLVRcnpiik60MQSZsk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765892397;
 b=SrRCJsgX6alxPwM901pSzNX1aIhGPrweNFDKTJbFcajG+kyoBuWe+x8mX2SWIqvW3lD/9KgT
 YkTK8/neqJJYMZsGyQnTH9X5QgpxbcIGytsqdOMBEBj0ZBXvY1WG1+RBKf1b6DMRy6fTWw8HSos
 odqrWSN2z171337cI9R1sjAgWdG7wZKED5G+FOXBdzSLAyItb7Z+teGX2m6g/lBoej1f8BKczNs
 FMiZbcJpyZaqNNEsbAX63FSq00H8ELZKmoXLvXZPaIdUy6xeV41TDuTLMFhAgPsdDm+35uHg4QY
 fVqnSl5AzSFTpLSfckBzRVHSR6d9+SnLYbW9KbyBge50Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765892397;
 b=ADe2LR1ZldH1CfTUYQU15S9magauVwH8fSCm23qsHUsHJu4yd92pDzGnThp4/rhOE9RMVrvz
 8KFbXK8kwhaAX7cx1ZpKF4rZd371RUymg1TPBYfkNgAl+rXudx2XZFYADe4TjFDJFMDkSwJXEwG
 fh+VccCiiDfrHBeKQcVm9qzL2xmlt3rvgIxPnVtZNSuFMe4i0uuqD8H6vV093d1vNiwkXl4s3/b
 MjQiQW+EnyRXrMBXm76KeaqGXOTkMczhbwkTM3SKqNKCSeK1YMaTmxK099bcc1FHA6Xly7Zmh7D
 X6sCCCoNU31QTa7cRUlgI1Fouze6W+v2Uaw5Ks6rrkj1w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay186-hz1.antispameurope.com;
 Tue, 16 Dec 2025 14:39:57 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A7BE65A167D;
	Tue, 16 Dec 2025 14:39:46 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 3/3] arm64: dts: imx8mn-tqma8mqnl: fix LDO5 power off
Date: Tue, 16 Dec 2025 14:39:25 +0100
Message-ID: <20251216133927.913039-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133927.913039-1-alexander.stein@ew.tq-group.com>
References: <20251216133927.913039-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay186-hz1.antispameurope.com with 4dVyhz3009z3f2J0
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:368384c713b76e7f27c528b6b2e25988
X-cloud-security:scantime:1.996
DKIM-Signature: a=rsa-sha256;
 bh=y/NNmCOZpOKOo1L5GaD1X3K8BzLVRcnpiik60MQSZsk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765892396; v=1;
 b=QwiWqnswut4QW6mlM/AjHrSOglk0dAjOaqi3QaqW752NkmlPXxvMpV3xL54krIYTpI3UR92Q
 C1oYX2s/tquFo1B08dH8eC0dsinS6U5GnxBvxfg9o9RdgU+BBbum05COFMmSyWCl2wq05Kw3DD6
 YYlMdFcpjhNXWvtuEpXE81rk6EHeRGK/vUiiQ8J3A5isxvxNNRIv/Oduo2Jpub0Z0oxm0FJHLOu
 /jrHL/ZB7LxoHNpC2xZygZtvAC7di77JYicUsv17LZM+nwkYJo+7P/jYF2dYdnknD5pdP+MrfWe
 UDAJuRrGw4gJPxEhVG1wXOgV34g2o5x1y3uPzRoKYc2wQ==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Fix SD card removal caused by automatic LDO5 power off after boot

To prevent this, add vqmmc regulator for USDHC, using a GPIO-controlled
regulator that is supplied by LDO5. Since this is implemented on SoM but
used on baseboards with SD-card interface, implement the functionality
on SoM part and optionally enable it on baseboards if needed.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts | 13 ++++++-----
 .../boot/dts/freescale/imx8mn-tqma8mqnl.dtsi  | 22 +++++++++++++++++++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
index d7f7f9aafb7d1..0d009f4be804e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
@@ -69,6 +69,10 @@ &mipi_dsi {
 	samsung,esc-clock-frequency = <20000000>;
 };
 
+&reg_usdhc2_vqmmc {
+	status = "okay";
+};
+
 &sai3 {
 	assigned-clocks = <&clk IMX8MN_CLK_SAI3>;
 	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
@@ -216,8 +220,7 @@ pinctrl_usdhc2: usdhc2grp {
 			   <MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4>,
 			   <MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4>,
 			   <MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4>,
-			   <MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>,
-			   <MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x84>;
+			   <MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
@@ -226,8 +229,7 @@ pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 			   <MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4>,
 			   <MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4>,
 			   <MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4>,
-			   <MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>,
-			   <MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x84>;
+			   <MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
@@ -236,8 +238,7 @@ pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 			   <MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4>,
 			   <MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4>,
 			   <MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4>,
-			   <MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>,
-			   <MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x84>;
+			   <MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>;
 	};
 
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index ac6ce5d814c50..31a3ca137e636 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -15,6 +15,20 @@ memory@40000000 {
 		reg = <0x00000000 0x40000000 0 0x40000000>;
 	};
 
+	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
+		compatible = "regulator-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vqmmc>;
+		regulator-name = "V_SD2";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x1>,
+			 <3300000 0x0>;
+		vin-supply = <&ldo5_reg>;
+		status = "disabled";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -218,6 +232,10 @@ &mipi_dsi {
 	vddio-supply = <&ldo3_reg>;
 };
 
+&usdhc2 {
+	vqmmc-supply = <&reg_usdhc2_vqmmc>;
+};
+
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc3>;
@@ -272,6 +290,10 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <MX8MN_IOMUXC_SD2_RESET_B_GPIO2_IO19		0x84>;
 	};
 
+	pinctrl_reg_usdhc2_vqmmc: regusdhc2vqmmcgrp {
+		fsl,pins = <MX8MN_IOMUXC_GPIO1_IO04_GPIO1_IO4		0xc0>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x1d4>,
 			   <MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d2>,
-- 
2.43.0

