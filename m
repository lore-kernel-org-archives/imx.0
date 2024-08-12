Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F008416B38D
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 14:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473290; cv=none; b=FR553BMJFQhgLnHgYF5clC84j/vqt/WpfD7dqsRA3fgv2tBhbp+8vs5y4Kj+8LSkXY2wqIqV3l18cNnpUjsJ4vMInqMW4iKciiHwa57mODO97sggH117SCv45sdVIeFIaU2Q0IEo4XwdfiXMcjYINCdFIqZcpVV9ZfNFvbF3Sz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473290; c=relaxed/simple;
	bh=/D5ZicCTcOPh0dMwX0kyKzbM1L28/x10vy0TT+iOuQE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bDeSkkP8RcPifIZ9VH4WSj2upSd7ADbKMtBdwkqdzizXSyYik3FpgocqDMW/UsZKzdD/Dpe2Aw7Lr/Sk64evL/rsW9T7bn/oldbu8308pLR6KAQrg2ATKVTc2V23G/ZDLU9MEUUmrjnReA9+RELGRbDzZ053GEau7Epji/765AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=BqR+eCuZ; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=FEYNpy17 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="BqR+eCuZ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FEYNpy17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723473288; x=1755009288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n+GX9njJf2+wEra2a9+6xqEQnxszBt6DK1ycUJFWeQU=;
  b=BqR+eCuZxiLwKwTMIwzbKakcnzzTNrk6ZQ2HqTXBAU5QkJnkJg7o3PsO
   0r+g0wHaaif+q/UIfc78Eq8mUGjGysZqAwrwFeyNz+i0SAeB7Vlv33NO6
   rsXSkiMD+7XDf5tIXlLK8z9wfLNCIYVoJYFJPP/rvZ5DPG9Pez+ErqQdl
   z1+UvrezTHoLBNuOwNjL6P55uO7pkQsGPFau2TJr+xny5Ezbh2NypRlKx
   qzqqKpZuynrS/zY4uQlum/g7Oo3vvYTctAU+zQhd6iiBfVSNKzccUjPtz
   bGxkdO7r6EmnvY4NpF1NO04JSnSXh3tWcrjeMUXt0bVeonehh1ObYDmTt
   g==;
X-CSE-ConnectionGUID: M4kygtzqRKGnmKzdyZeIpA==
X-CSE-MsgGUID: yT1ABFCvRn6I7NHm+L04aA==
X-IronPort-AV: E=Sophos;i="6.09,283,1716242400"; 
   d="scan'208";a="38365804"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Aug 2024 16:34:46 +0200
X-CheckPoint: {66BA1D86-8-78509F09-E532FC2E}
X-MAIL-CPID: 5BC525311F392538224A80C21AB26B5D_1
X-Control-Analysis: str=0001.0A782F1F.66BA1D86.00E1,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1F17164600;
	Mon, 12 Aug 2024 16:34:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723473282; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=n+GX9njJf2+wEra2a9+6xqEQnxszBt6DK1ycUJFWeQU=;
	b=FEYNpy17LZHug4/NNiywZTH20z7qWcAWzxwrQ1Wm66Jv9GZxG7GJCL4wwcBva+QiDbHX/C
	H53kHh13+ooliMMKiXCn0NEBi+Xsqiz+ji8ZNSZFs2+ZkkMocBrLeF3Km+nJvXDGFdCbPU
	cpKRilUsGIHm5aRfw1fsc6Kg6j83eZlkfutpUx1tkTfdqhJ+isiL6YYJtW6q6Mlzo3W00K
	ngHg+JtV0oP6HPAJgx7EKC5a+rjC3/3OaJcxIRpdkpIG6/ga/7GSUt0Y0bTn/eByfZxAUz
	u3WOYlxlwzDSCR2W026RnGpW+PV1w/Vq7Vi50DM1+1ho9J7BLpkNDEzlXMZx8g==
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH 1/5] arm: dts: imx6qdl-tqma6: move i2c3 pinmux to imx6qdl-tqma6b
Date: Mon, 12 Aug 2024 16:34:27 +0200
Message-Id: <20240812143431.98323-2-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812143431.98323-1-Markus.Niebel@ew.tq-group.com>
References: <20240812143431.98323-1-Markus.Niebel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Move the pinmux entries to the variant where they are actual
used. No functional changes.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 14 --------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
index 344ea935c7da..6152a9ed4768 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
@@ -59,20 +59,6 @@ MX6QDL_PAD_CSI0_DAT9__GPIO5_IO27 0x4001b899
 		>;
 	};
 
-	pinctrl_i2c3: i2c3grp {
-		fsl,pins = <
-			MX6QDL_PAD_GPIO_5__I2C3_SCL 0x4001b899
-			MX6QDL_PAD_GPIO_6__I2C3_SDA 0x4001b899
-		>;
-	};
-
-	pinctrl_i2c3_recovery: i2c3recoverygrp {
-		fsl,pins = <
-			MX6QDL_PAD_GPIO_5__GPIO1_IO05 0x4001b899
-			MX6QDL_PAD_GPIO_6__GPIO1_IO06 0x4001b899
-		>;
-	};
-
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_RB0__GPIO6_IO10 0x1b099 /* PMIC irq */
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
index aeba0a273600..53e78f1aed38 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
@@ -33,3 +33,19 @@ eeprom@50 {
 		vcc-supply = <&reg_3p3v>;
 	};
 };
+
+&iomuxc {
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_5__I2C3_SCL 0x4001b899
+			MX6QDL_PAD_GPIO_6__I2C3_SDA 0x4001b899
+		>;
+	};
+
+	pinctrl_i2c3_recovery: i2c3recoverygrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_5__GPIO1_IO05 0x4001b899
+			MX6QDL_PAD_GPIO_6__GPIO1_IO06 0x4001b899
+		>;
+	};
+};
-- 
2.34.1

