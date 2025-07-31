Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719B421B182
	for <imx@lists.linux.dev>; Thu, 31 Jul 2025 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953434; cv=none; b=Yik3rXFC1AAOln/fKDkPv/5n++ZZh18x6ImobQLgv/2h8j2quJTAnQd6zbtuHUfra9WztO0qgmRMo/hOiJLPS7jjFsAL9u2rPhb3neFZVWH0H9/f01rkct/A0d2uPRobW06IHzkM94kK2VEKYHWfBYt8RktX5uODdZEVu1PrAPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953434; c=relaxed/simple;
	bh=a3OliG1vrbEaOCXKWiY3rdTSqViJJ0y9oCtiQGwzsX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pkHP2h4J5LQu+GzEIvCVtpKcEhsqu8hFv4rrlC1XrwG1wvwwimjpAX/NZRFsZlQ0FihsuH+/F0utRFekmn+XgZKnaJoQ7q4BeS3IUMZZqqNLp50dcI+1JVwpsVsAzFka9UeDe8CD7uZcgAAwwGoHW6CnHLjh9N4Rg3TMI28JAKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=KhJvC8V3; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gyfGocUe reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="KhJvC8V3";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gyfGocUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753953430; x=1785489430;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kLKtT8JZ6dODcbUKgfZeCB5jr/fQZczVXqQkqrWvrQk=;
  b=KhJvC8V3qh5z20AA4ejwqVtNF5RqqEBbkAwo8jsrUgcW9Jbe4x9Z9DIW
   eOL8fYYGzeglsx5ILjleZmLOLb8uqEpYTa775dR9D4srmw/9NjlAZs2fQ
   emIrfM1AQs2N/asw9gRpUNtSAUxqPb9Dm+qe0kal77f+5pDjhXtlBX24+
   bpui7aYKhsGwrtoox5FYJfie3Bk21L6uwtvJKRi4qN4umygWdFkn7Znw6
   pHIvQYdzr33IOKSd7nFUlUn1+l61av1Acq2LkHIHeyN7nlSKohLOrdcg3
   xUIE8/Af4hxOuSptUxob3CRz/xeCAjL3zjGv0KioOCucj4MeH9nYQ3Yxn
   w==;
X-CSE-ConnectionGUID: ij/sogzaRoir3oVu13BriA==
X-CSE-MsgGUID: CGxTcfeDRdyKGUD0CdhahA==
X-IronPort-AV: E=Sophos;i="6.16,353,1744063200"; 
   d="scan'208";a="45516517"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 31 Jul 2025 11:17:07 +0200
X-CheckPoint: {688B3493-1E-943DFC15-D71A48EE}
X-MAIL-CPID: 5A07E1B3BC8A0778C3A5FDBFD2D5B31C_5
X-Control-Analysis: str=0001.0A002121.688B3439.0079,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 204D516B722;
	Thu, 31 Jul 2025 11:17:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753953423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kLKtT8JZ6dODcbUKgfZeCB5jr/fQZczVXqQkqrWvrQk=;
	b=gyfGocUebJ0GY86x8QMGn0scMnn3B87qZHtHT5A2901xiNDkgOlpUrFg6eob75W0YRrec5
	h60M/4bjHMQVNdP0h4W0A2VbObgUwK0fuyfxskTqn5qSC+EhhB5aSOsN2vT931n623uJ6X
	2r1xfV8WUpBCkDisYCpIdntPwpb9tI3ZTsd+t6NG5toR0N/RyleTf9aO3jhGGFTunKOA4G
	aRMW6vd4BYf1fHNWbVZiNm+fNuw9UMVEzuij1o3Y75cZWhDq6ld48YxfcYgVZK1tPZloZD
	FrPxEFa83jdrFvMuxDHCKW/q7ow7NgKq7lb4RHO+HX9RQ0gz8Bgls7lkC8FyWQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: imx8mp-tqma8mpql: fix LDO5 power off
Date: Thu, 31 Jul 2025 11:16:52 +0200
Message-ID: <20250731091655.2453107-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Fix SD card removal caused by automatic LDO5 power off after boot:

LDO5: disabling
mmc1: card 59b4 removed
EXT4-fs (mmcblk1p2): shut down requested (2)
Aborting journal on device mmcblk1p2-8.
JBD2: I/O error when updating journal superblock for mmcblk1p2-8.

To prevent this, add vqmmc regulator for USDHC, using a GPIO-controlled
regulator that is supplied by LDO5. Since this is implemented on SoM but
used on baseboards with SD-card interface, implement the functionality
on SoM part and optionally enable it on baseboards if needed.

Fixes: 418d1d840e42 ("arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../imx8mp-tqma8mpql-mba8mp-ras314.dts        | 13 ++++++-----
 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 13 ++++++-----
 .../boot/dts/freescale/imx8mp-tqma8mpql.dtsi  | 22 +++++++++++++++++++
 3 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index d7fd9d36f8240..f7346b3d35fe5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -467,6 +467,10 @@ &pwm4 {
 	status = "okay";
 };
 
+&reg_usdhc2_vqmmc {
+	status = "okay";
+};
+
 &sai5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai5>;
@@ -876,8 +880,7 @@ pinctrl_usdhc2: usdhc2grp {
 			   <MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d2>,
 			   <MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d2>,
 			   <MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d2>,
-			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d2>,
-			   <MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0>;
+			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d2>;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
@@ -886,8 +889,7 @@ pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 			   <MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4>,
-			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>,
-			   <MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0>;
+			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
@@ -896,8 +898,7 @@ pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 			   <MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4>,
-			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>,
-			   <MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0>;
+			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>;
 	};
 
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 33cd92e63c5d5..4eedd00d83b9f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -604,6 +604,10 @@ &pwm3 {
 	status = "okay";
 };
 
+&reg_usdhc2_vqmmc {
+	status = "okay";
+};
+
 &sai3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai3>;
@@ -983,8 +987,7 @@ pinctrl_usdhc2: usdhc2grp {
 			   <MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d2>,
 			   <MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d2>,
 			   <MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d2>,
-			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d2>,
-			   <MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0>;
+			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d2>;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
@@ -993,8 +996,7 @@ pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 			   <MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4>,
-			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>,
-			   <MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0>;
+			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
@@ -1003,8 +1005,7 @@ pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 			   <MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4>,
-			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>,
-			   <MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0>;
+			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>;
 	};
 
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
index fd70b686e7efc..b48d5da147273 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
@@ -24,6 +24,20 @@ reg_vcc3v3: regulator-vcc3v3 {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
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
 };
 
 &A53_0 {
@@ -184,6 +198,10 @@ m24c64: eeprom@57 {
 	};
 };
 
+&usdhc2 {
+	vqmmc-supply = <&reg_usdhc2_vqmmc>;
+};
+
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc3>;
@@ -233,6 +251,10 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x10>;
 	};
 
+	pinctrl_reg_usdhc2_vqmmc: regusdhc2vqmmcgrp {
+		fsl,pins = <MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04		0xc0>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x194>,
 			   <MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d4>,
-- 
2.43.0

