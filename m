Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FE537418C
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353813; cv=none; b=JDgz8NycJ+P86R7UNy4ZSgnHx9udk+XN4pdRg2QnQB/xMSun3Jvilx1U6w5bhdR/reG4rxKajElJNN0vy0dYoBzg4ir3SiDkgr3fEeMCc/9+jiMk10bQ7ymqKQov9AIsL/7Vqaf0D8rqw+VPiwdT5Ey3roMpva63HDVATWMCnH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353813; c=relaxed/simple;
	bh=F1nqFwPFcHn39UBTbO+2hgcr8CLJ1N7+vn6YXCqREiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLfs/m8hZHqiUhqVV3IFfKVJ8ShGMe2Q/NRRXSZRWJkuOfIXNh77nNqgCPE7eHGKinZTbkSV2FjoMxwpY7PODh0oJasKiJaDYtARt7BEljgGC+INSawlTFs1+B8lv/V0manOuwE372Ee0Pqei++cAYganlmtRtaRagp3Cmy2nSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUUGxrXU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUUGxrXU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so24383875e9.3
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353810; x=1771958610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0AdkHdlH8x10dXncHHYDtwK0rBVyA/j0o4uymvMJoc=;
        b=FUUGxrXUC/uLOwve4raVwEZ6/mfJ0bgs/SWVC/1A/+bv0yoFLeoot1zrU/a8sihKGC
         IdcAodViiLlkJ6HuSdm+Ms7jIy8+cWSIL4ojZi4qy7ICjY0jS6dIkmrs6WnieQtMQHke
         43D4/LJ+UxWMfy1fqa3HmQtQQXDgsNrqt13hunZNQMJ5fWcDSByYO1lXjAm+gKy257Xj
         GZje4FHh/umcgsXQjvi8yWKRNU8HsBBqTAaR2bEHyTGYkTOWUTsuWriOk148mv+/S0Fp
         liZSFrT5WPHReF+ipdjOpwqXHwNFbE76/nu+xFGezuTo6v+bcMMJ5/q9YTifvDhBYtKG
         awow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353810; x=1771958610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0AdkHdlH8x10dXncHHYDtwK0rBVyA/j0o4uymvMJoc=;
        b=l62ISHsWBQkoLemCwQG2SKCC8QRuWAdpaNE/KYvnu4Dlahve3Z6Lvowdgj11rO/5Jo
         rXNqF7uAxtX4YSzqWVtTUy9pF+df4E/zM8WD/CMDO8kkV+gti+/ee/FLZ+zI3aflzUdl
         Ez+VVSC69qeY5sHGbgGcQuHzjqIFYGRk7vv+yVAVlGD7+iplk4r5OuaPWEV0Rv0jUQYS
         S9KdAvJ43QoIHKngaY3PiDHrFITsZ3YPL1Y/z6Zt/xh/A1iaPNWo41yRcd1jMzFMnNAH
         IVhel6WZE3U7pf2Du++lNwgPWVLC95zrMoG+/ha3PhQj36d3y5BB/ldgiavzo816iXo6
         wemw==
X-Forwarded-Encrypted: i=1; AJvYcCW0rqhbJe2KnJgBl/6pOUSyUSPXsEEV6PFylScJJauOTeIqWbZpZiTZZonQuK1yHwZMyy0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8OcBNBQbkaQwxik2rvLueSzORKA00bg51TNppl24K54jrMPCr
	SEVds0El7twzxgef/pirazbjRPqcbYy/DzkA19+i84iw5Vm4JIhophux
X-Gm-Gg: AZuq6aL+eR+2d5xUGA1vYDRU1iXKq9E8PaUSgFbvqt8Wbu/A+015UyaOzeTappPEeC0
	0ZxDQIhU7b2fnxQMfwWUuxHd5qO13CooC1HOPbefCc8HpZuhV08xT4c4XKq3+k/FSZo6Xqdq3fW
	a4MwvuK8PdvC8T6/lnvhOFffWKKrhh9YbQd/H4Ighj2raOGKWIYL4A81XSUrg+9koDjZgYIhTPo
	XiEUTIUFenZSX25KqHiVpz2uarB6Jx1xyNPyB7zOBqaz3YanZ8wttugtJSaXpKBP+FVBvnc1Chw
	1LODVWny/EPbz5Mxh66BvIRntHC6uK5/a6HIWUj/JTZHWk1OcCeYW7m+uLvHrvqNqp3PcdFR4h/
	1a6ABeZRXfi+ZHsK0hVLkdTwuDEdKZFVLm4OnpH73jnlImHY7JZRmkwDk/1iRGTLW0jyPZrmswl
	qb9HBC4xCK74QIKsd3FvIXbw1In1p69ZJYG3SXlXH4Ylhpp0Py8EIbstXn4w/d6jwp0cDdbQ64+
	xuUqwaKwpMbUGRmbsw7qlPIDvjHz4E8HXAdJ2wez02aWLC37sE=
X-Received: by 2002:a05:600c:1c12:b0:480:49ce:42cc with SMTP id 5b1f17b1804b1-48373a02cfbmr289063715e9.9.1771353809715;
        Tue, 17 Feb 2026 10:43:29 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:29 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 04/11] arm64: dts: imx8mm-var-som: Add support for WM8904 audio codec
Date: Tue, 17 Feb 2026 19:42:38 +0100
Message-ID: <8d437d36b24d184945c478fb727e93ffb0719c91.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MM can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

This patch adds the WM8904 device to the appropriate I2C bus, enables
the SAI peripheral, and introduces the sound node to expose the
sound card to the system.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 101 +++++++++++++++++-
 1 file changed, 98 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 23045f54e00e..e52080490ddf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -15,6 +15,14 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0x80000000>;
 	};
 
+	reg_audio_supply: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_eth_phy: regulator-eth-phy {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -32,6 +40,34 @@ reg_phy_vddio: regulator-phy-vddio {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai5>;
+		};
+	};
 };
 
 &A53_0 {
@@ -277,18 +313,58 @@ ldo6_reg: LDO6 {
 
 &i2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
-	/* TODO: configure audio, as of now just put a placeholder */
 	wm8904: codec@1a {
 		compatible = "wlf,wm8904";
 		reg = <0x1a>;
-		status = "disabled";
+		#sound-dai-cells = <0>;
+		clocks = <&clk IMX8MM_CLK_SAI5_ROOT>;
+		clock-names = "mclk";
+		AVDD-supply = <&ldo5_reg>;
+		CPVDD-supply = <&ldo5_reg>;
+		DBVDD-supply = <&reg_audio_supply>;
+		DCVDD-supply = <&ldo5_reg>;
+		MICVDD-supply = <&ldo5_reg>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		status = "okay";
 	};
 };
 
+&sai5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai5>;
+	assigned-clocks = <&clk IMX8MM_CLK_SAI5>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <1536000>;
+	#sound-dai-cells = <0>;
+	dmas = <&sdma2 8 25 0>, <&sdma2 9 25 0>;
+	dma-names = "rx", "tx";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -433,6 +509,13 @@ MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
 		>;
 	};
 
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18		0x1c3
+			MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19		0x1c3
+		>;
+	};
+
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8		0x141
@@ -451,6 +534,18 @@ MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
 		>;
 	};
 
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI5_RXD1_SAI5_TX_SYNC		0xd6
+			MX8MM_IOMUXC_SAI5_RXFS_SAI5_RX_SYNC		0xd6
+			MX8MM_IOMUXC_SAI5_RXD3_SAI5_TX_DATA0		0xd6
+			MX8MM_IOMUXC_SAI5_RXD0_SAI5_RX_DATA0		0xd6
+			MX8MM_IOMUXC_SAI5_RXC_SAI5_RX_BCLK		0xd6
+			MX8MM_IOMUXC_SAI5_RXD2_SAI5_TX_BCLK		0xd6
+			MX8MM_IOMUXC_SAI5_MCLK_SAI5_MCLK		0xd6
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x140
-- 
2.47.3

