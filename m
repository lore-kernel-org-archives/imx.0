Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2578D41F7C6
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330506; cv=none; b=YcV9XEiGgMf1qgRLPzf3LmECbZ+ocwIomTA88ix6vMVhIL3/me0j1Irlkz1YaVc2aRhhpnJzTK966uQ3uzuka0r5sKoIqevSjO6zIyRDcjfuYAB+fFiMYSVQjFO7AUL69iT1Ba9zUocOzuyRtpB6SGFeh4LHPor51AAix5Gun0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330506; c=relaxed/simple;
	bh=2WLpuBc/ObZMdsxva51SzL8lzN0MxES9k4ot0lwT4rE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OniZMZW24jPfOe9NjYA8vBrJAtICT066l9ljNQirJMY/g29idHZk7P1gzvSKMhlOahg3+h1vdsBcrJOtElEU5duaNlVX5DqdrLR/Ar1dgfk9I54E6vu1YxBkFIgOTzSg/JChj8YfuDXVs5ZVINfRR6sMOvYZcGn59+K1L9mK3sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNFhrWD1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNFhrWD1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so17672635e9.1
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330497; x=1783935297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1E6upsvne5jwrnGnndBKXWLBOzbDPqaqq+E/51rCoP8=;
        b=tNFhrWD1oua/wCSXHtq3/ugv76RJW6BfS6738E6VQGqwhnSnwjZjbkIBG0So4cx+6S
         C9hMqdMYQLHL44kBIulNlFs/c4lWLCaR3msX8Y5El9eZVjikgzoVB2s9ilDoKbTf0EYp
         +hmjB5ucM4EyM3Q2jXgxWwHzFwVkuI+ny1WSLBISwIGXd1mLrTEIgNPpy4j2mq8eYf3H
         lspxigyEIc/h1eVKvr2zJd75DRaZI+2Zyzs7dmvafST7DNPD4EzMJtAZud53iuOh2kyf
         K1U/0uN5D+HGi9+2PzejLsHQRd9gWVOEn8LdVTp1ORZgno9izpLQni2hpEKJcAz41yPS
         tcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330497; x=1783935297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1E6upsvne5jwrnGnndBKXWLBOzbDPqaqq+E/51rCoP8=;
        b=mM4pteAW/0rEzwgl4BAluAstTH+oTLoIpNMqmJM8DMuK5dPSk/W9Z7FUjDCbUhFrAW
         kiKU5e2xsw5YwkeENgCm7CVKMckqCpOMb5NDrSjC76EI5b/YQK/sSuGKMo18SC5H6ky/
         6rJSg3OE9dx0Q3ZbceuDGNcP5q4RIBaxdR+fns7KC/Fdl0wK+iersiilHSpuR2GzRLEt
         xwZpG/gdw3ldGN7pEQBhwxg55lP7NIyZTlC028MHQObl81OplTh02FyOPnInNgoVhIpZ
         tnHt0YvrNCeDJoXFTV4yY9529MbaR5Cs4wLDRuqnRiO20jMaagqw63nOl2of45TCny4T
         nJnQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVZx8ay3I84EV7cJTsNZw0IaUZ1ESKxrSk8VmgnixrpwPIc7Z/eJpWs1CrqFZIIR3O5/4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNkkS6MSU8bCFmYqRG0SAcAdXzgccv8Qy3Fm0OJWTKBTiKWN/I
	dMa3q0LT9SpFzHbrVYDVhCQ4ga7jZNDobdiAiVTYa9aU6GrVDugcr6kW
X-Gm-Gg: AfdE7cmWmdIPyZuV+0T9qmTqvcFoNzODH7T4Bra1wiWFosDtG6TYz9tOzEJcrP0pFUT
	huFIW7FcMYrs18GQJ9ciqi0WlCdXyB+xzTwPzpigMKVvDRQhiSXB6c0mSvAUtQQsTwI8fatNsIt
	D2+nNTQMbTem/pTpkkTkI54Ba1h77gYFkOmiyAN7vGvAVEixbkKYmlPkiapIginfoiPCIhjHUqK
	PezOWM3LTsL2D3qF/YcMHoZNRTs+eFkIkaSKmOeIgN3ATuBUAPpccc4rGUbn3vIlTSGE2bzIEyO
	fFEDdiTVCtgdJkBqAmVQ6eOcVaj8DuaPIbmfdQWkmTZGA49B/TCW2sPHsnfR2uzaqBsysJG6kbs
	4JLvfLkeBMZn4abiOdUmVsFzrS8ZCxqkXyGBzaC/qGMigcbfzES/r+60Do/qSl/z4MPyu9JsnmN
	cOAM1eoolpAne3TRhaDO0vvRSXcsdxiCbxuS0tfqnPrcEmiKIX9bN8dsYdNG4ixneXiwHn8pDCc
	mNSUl7KOPB9wlNPQjkfxLteXw==
X-Received: by 2002:a05:600c:8a1a:10b0:493:d117:18a8 with SMTP id 5b1f17b1804b1-493d149a38amr69499795e9.9.1783330496583;
        Mon, 06 Jul 2026 02:34:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:56 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 05/15] arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio codec
Date: Mon,  6 Jul 2026 11:34:35 +0200
Message-ID: <4487a350b0e4667816c3fe62e9fd6df2696c18cf.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

Add the WM8904 device to the appropriate I2C bus, enable the SAI
peripheral, and introduce the sound node to expose the sound card to the
system.

Add I2C3 recovery gpio properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Fixed I3C to I2C3 in commit message

 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 98 ++++++++++++++++++-
 1 file changed, 95 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 09146ab76385..e2e04ad2fbb6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -16,6 +16,14 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0x40000000>;
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
@@ -42,6 +50,34 @@ reg_phy_vddio: regulator-phy-vddio {
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
@@ -246,18 +282,55 @@ eeprom_som: eeprom@52 {
 
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
+		clocks = <&clk IMX8MN_CLK_SAI5_ROOT>;
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
 	};
 };
 
+&sai5 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai5>;
+	assigned-clocks = <&clk IMX8MN_CLK_SAI5>;
+	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <1536000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -375,6 +448,13 @@ MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
 		>;
 	};
 
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C3_SCL_GPIO5_IO18		0x1c3
+			MX8MN_IOMUXC_I2C3_SDA_GPIO5_IO19		0x1c3
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL			0x400001c3
@@ -400,6 +480,18 @@ MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
 		>;
 	};
 
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SAI5_RXD1_SAI5_TX_SYNC		0xd6
+			MX8MN_IOMUXC_SAI5_RXFS_SAI5_RX_SYNC		0xd6
+			MX8MN_IOMUXC_SAI5_RXD3_SAI5_TX_DATA0		0xd6
+			MX8MN_IOMUXC_SAI5_RXD0_SAI5_RX_DATA0		0xd6
+			MX8MN_IOMUXC_SAI5_RXC_SAI5_RX_BCLK		0xd6
+			MX8MN_IOMUXC_SAI5_RXD2_SAI5_TX_BCLK		0xd6
+			MX8MN_IOMUXC_SAI5_MCLK_SAI5_MCLK		0xd6
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x140
-- 
2.47.3

