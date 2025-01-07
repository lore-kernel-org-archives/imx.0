Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A92D1F1929
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 14:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258518; cv=none; b=H61L+peE34DTBHKbw0lqjJqqCOaXGfKbT59h07YyDNu9kW3I/3b0H9v8WzIX+Wo1IJX7YfZIu+I0Qnqoi5n6ghJrMMe6huuYuwvH0U1dORROdg5OMeCanwThxGgKJlQ4oEaVn2g1p6Btpf+ZtnNgDZguQKiAcTcbRIVJv+vKmbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258518; c=relaxed/simple;
	bh=emq4I8poCRzxXlLNiXctPcFQbuOrpyrDpdbtRdDP6+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y/pu4xH+1BzfIByCc3yM8aFLZGTB3IDRZYY3ll9lhr3m0IiHDLPKFX1LJrdWNAPjy6Jpfwy8J8X6Lj33SukItXT0sAkA5Zdf44iqshKVMTDr/MKky0kAV2O5yGyE2YUki13LaJaBdRDlWf6bZcCagHIpO1BZZ26JlpNXiHFardk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=LSqihZ5+; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=HGdfjwK4 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="LSqihZ5+";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HGdfjwK4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736258509; x=1767794509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u+m2gfDVhQV2u3o7sl05GzerTgcPQ9MIYG1lSSy1s58=;
  b=LSqihZ5+Pq/0fx/27/A3FYdeezBUvP5f52Msg0/r7v+HsKR5FKXR3HWe
   fYn5vH5G6ecAYh7qyUDALQlPRF6XbwhdFT5Umgx4jPeHDlEbPYJo8f/lP
   V4AuMNPcy/cw3uPocTbTQ+Y4ZP/42eziDrK8dJ9RRNTmMDbD2/nD+jXg7
   egOWIIPTXABPD/xWSO71YyRuNmRe9i69BZNCx3vg1ZINtHOoOsssWyrU4
   VOTUOrwsYB6bMCAoW8EonpBsGaSgkaQfalyKdIyAQoqxJYYV8gHYbAsE5
   hDvFNwPLFDuKlf9zrydlBjx7FhGKlRhRLADOfpQKQrLF6uMnAu8ki0xg7
   w==;
X-CSE-ConnectionGUID: g2Lg8GdfQIuZbOlKyGRR7g==
X-CSE-MsgGUID: YD7ho+dbTQWHox3vQoozww==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896230"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:01:47 +0100
X-CheckPoint: {677D33CB-3C-1CE016C0-E589DA3E}
X-MAIL-CPID: FD2C55157575331A5F84E96D4CD20098_1
X-Control-Analysis: str=0001.0A682F1E.677D33CB.00BC,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8325A164BC3;
	Tue,  7 Jan 2025 15:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736258503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+m2gfDVhQV2u3o7sl05GzerTgcPQ9MIYG1lSSy1s58=;
	b=HGdfjwK4NDupW3qBR5pTl8OrOgU6T00bOwteSkxdhpojr8EqQ/3V6bV9fO6kb9kn306E48
	VUJzpDOidwafTM0ONOsX3sCTzFiSThWLJ+XwczzL8gZjLIlLQM239CO6SAEK26ibjqGU7I
	YuvT+Z/XAqY5ZHq82SJfvsPTujLJ0J0ZGewFtcOttXR08ZX9C4m0iLGYNRADDmSu6YPY/x
	qiFeQ1s9y2EbxkbFs5oCkmrWa4OKVC+OCTzDoggIU3KxEviAeJV0rnfVNzm2g6VfDutF5k
	EIDW/n5uId3Ibhng+eCWDXF2qN9XlzWCsFpcH7OwG6+tYl1WyhkqnDP4cU71kg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 5/5] arm64: dts: mba8xx: Add PCIe support
Date: Tue,  7 Jan 2025 15:01:10 +0100
Message-Id: <20250107140110.982215-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add PCIe support for TQMa8Xx on MBa8Xx board.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8xx.dtsi | 32 +++++++++++++++++++----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
index 276d1683b03bb..117f657283191 100644
--- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
@@ -36,6 +36,13 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	/* Non-controllable PCIe reference clock generator */
+	pcie_refclk: clock-pcie-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -208,6 +215,12 @@ &flexcan2 {
 	status = "okay";
 };
 
+&hsio_phy {
+	fsl,hsio-cfg = "pciea-x2-pcieb";
+	fsl,refclk-pad-mode = "input";
+	status = "okay";
+};
+
 &i2c1 {
 	tlv320aic3x04: audio-codec@18 {
 		compatible = "ti,tlv320aic32x4";
@@ -309,7 +322,16 @@ &lsio_gpio3 {
 			  "", "", "", "";
 };
 
-/* TODO: Mini-PCIe */
+&pcieb {
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	pinctrl-0 = <&pinctrl_pcieb>;
+	pinctrl-names = "default";
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	disable-gpio = <&expander 7 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcie_1v5>;
+	status = "okay";
+};
 
 &sai1 {
 	assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
@@ -467,10 +489,10 @@ pinctrl_pca9538: pca9538grp {
 		fsl,pins = <IMX8QXP_USDHC1_RESET_B_LSIO_GPIO4_IO19	0x00000020>;
 	};
 
-	pinctrl_pcieb: pcieagrp {
-		fsl,pins = <IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00	0x06000041>,
-			   <IMX8QXP_PCIE_CTRL0_CLKREQ_B_LSIO_GPIO4_IO01	0x06000041>,
-			   <IMX8QXP_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO02	0x04000041>;
+	pinctrl_pcieb: pciebgrp {
+		fsl,pins = <IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000041>,
+			   <IMX8QXP_PCIE_CTRL0_CLKREQ_B_HSIO_PCIE0_CLKREQ_B	0x06000041>,
+			   <IMX8QXP_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO02		0x04000041>;
 	};
 
 	pinctrl_reg_pcie_1v5: regpcie1v5grp {
-- 
2.34.1

