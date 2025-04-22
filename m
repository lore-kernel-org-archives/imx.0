Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68E2221FAA
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319427; cv=none; b=GGyuBWTcUrx+rUmAUMSOrJak2QEXP3Qof/a1l/1sovMaOIptAjY0sHkDfyhdYU102l+Vu9eRgHCmf6kPvg7GLPGbJaXQbai81AZa/bGprojcrqrz6+egi9xbwIuYDN6l1ppIg0NEfPdz1+Z6D0tItR3uVDuo34ak8CX/LhwRBY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319427; c=relaxed/simple;
	bh=4rk8ZjJXSdfnDpcAN2tiAnxnWPbcYbDQyMD2sbmMyCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t7j+DDiNiPekVQ4eAfKxFg+GSsiuA9OjGPrVjyMyxzDnzcpZbf+vIU9WB+975wZwqG1tPwHpMNptmIiYqCbZpmWPY3z3T4TGxT12dQ9wCYqZ3Tgp8AdCylDwvDWB35DlkqSsTtZe776rDp6mVKbnbQproxBazOWOYP3qb66wbVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=i4PGnYv3; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="i4PGnYv3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ndA5tE1Ke7DiZcyoW8ITRVTl+fv8+uLlzHEH+GwX2XE=; b=i4PGnYv3FAB29va/76rrrxOHWn
	u2lBw1u6rvoRu7bfM/AcdDEA7ZhzFudswKVpz7kCf9X+UpxrMjbSLXPl8Nqhgw23OD6xzYw08+M4Y
	BCF0OXMSxsikGQVUXwnkzakYfzx2sNJpNbp/F6X4RUky96h37sT2TCXwCd4EKP6aurcjPOSbrSbEe
	Pvw65NcyiK+KhyLt15JmyxToP7mIczBL5oE5IBijLTt/R0ruyiVSN0UmUAYK4+evQw+c9WruujF+f
	P9fk3CfecxfNtLHYcC79hn+pwtF9p2HJcmtuYUp9XY1ll9tC6VTkalFMBDcHntF6pFjA6ybcsQSR5
	UomfiuqA==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BJI-008kyr-0i;
	Tue, 22 Apr 2025 12:57:04 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v4 13/15] arm64: dts: freescale: imx93-phyboard-segin: Add I2S audio
Date: Tue, 22 Apr 2025 12:56:42 +0200
Message-Id: <20250422105644.2725168-14-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422105644.2725168-1-primoz.fiser@norik.com>
References: <20250422105644.2725168-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add support for I2S audio found on phyBOARD-Segin-i.MX93. Audio codec
TLV320AIC3007 is connected to SAI1 interface as a DAI master. MCLK is
provided from the SAI's internal audio PLL (19.2 MHz).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes in v4:
- no changes

 .../dts/freescale/imx93-phyboard-segin.dts    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index e4f959f665b2..54e084e69706 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -35,6 +35,20 @@ flexcan1_tc: can-phy0 {
 		enable-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
 	};
 
+	reg_sound_1v8: regulator-sound-1v8 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "VCC1V8_AUDIO";
+	};
+
+	reg_sound_3v3: regulator-sound-3v3 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VCC3V3_ANALOG";
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -45,6 +59,34 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "VCC_SD";
 	};
+
+	sound: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "phyBOARD-Segin-TLV320AIC3007";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,frame-master = <&dailink_master>;
+		simple-audio-card,widgets =
+			"Line", "Line In",
+			"Line", "Line Out",
+			"Speaker", "Speaker";
+		simple-audio-card,routing =
+			"Line Out", "LLOUT",
+			"Line Out", "RLOUT",
+			"Speaker", "SPOP",
+			"Speaker", "SPOM",
+			"LINE1L", "Line In",
+			"LINE1R", "Line In";
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+
+		dailink_master: simple-audio-card,codec {
+			sound-dai = <&audio_codec>;
+			clocks = <&clk IMX93_CLK_SAI1>;
+		};
+	};
 };
 
 /* CAN */
@@ -62,6 +104,17 @@ &lpi2c2 {
 	pinctrl-0 = <&pinctrl_lpi2c2>;
 	status = "okay";
 
+	/* Codec */
+	audio_codec: audio-codec@18 {
+		compatible = "ti,tlv320aic3007";
+		reg = <0x18>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_sound_3v3>;
+		IOVDD-supply = <&reg_sound_3v3>;
+		DRVDD-supply = <&reg_sound_3v3>;
+		DVDD-supply = <&reg_sound_1v8>;
+	};
+
 	/* RTC */
 	i2c_rtc: rtc@68 {
 		compatible = "microcrystal,rv4162";
@@ -80,6 +133,17 @@ &lpuart1 {
 	status = "okay";
 };
 
+/* Audio */
+&sai1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai1>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <19200000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 /* USB  */
 &usbotg1 {
 	disable-over-current;
@@ -148,6 +212,16 @@ MX93_PAD_ENET2_RD2__GPIO4_IO26		0x31e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX93_PAD_UART2_RXD__SAI1_MCLK		0x1202
+			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC	0x1202
+			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK		0x1202
+			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00	0x1402
+			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00	0x1402
+		>;
+	};
+
 	pinctrl_usdhc2_cd: usdhc2cdgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
-- 
2.34.1

