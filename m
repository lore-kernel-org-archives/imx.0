Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814383A4F3F
	for <imx@lists.linux.dev>; Sat,  7 Mar 2026 15:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898919; cv=none; b=Kv4z02OEi8UYHsnJXu3u9KGH4v9qdcxlwLKHvRCU78G8HjAAUjLT50mJP5gzh6iquRyUd144tPcC2x1cyFjMrWJfWY6oSywjbNN8lnXptY1ZgZCTKIHa1xQXS8osGoiwGOXUBtBybl3oxVKmTo62Rq+ZPTe0agBJqYkukiXlLKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898919; c=relaxed/simple;
	bh=VPyDTnvLeRqiDgmW6qES5qmQu9LuQ9ur/YJohfW0aUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZ39S+0xME2sislUua137C4PoVqcpr9uc5mmI+bcdhtYsApKu/+9aeMcJmqiAqzm5CcSl7Fah9LdJRCi+CKkSF+Pd6DORNCHpUMOP6lRGA3PW2V/zIZT7OCu/s27QnSAtnQcVCw+O7aqEEbXNQ1uLm8iPznYFd1QZj7Cxftech0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipmGUfjI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipmGUfjI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so6047985e9.0
        for <imx@lists.linux.dev>; Sat, 07 Mar 2026 07:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898916; x=1773503716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76UifUem1CcpJi2DmZ9pX1KLlPf7UqUfrwIn74xAbJ8=;
        b=ipmGUfjIrfkCTxSz0l9RX5SDq1GVQPZYS84CM9KBi4t4+mrTvLH0nPyaoNsvPi55ut
         PG98G+sArwKgc4zGwqihpeCO6C6gAoN/i7XMV0Cwn5M/jHj9SekH4Tj9PCeAojWV+mNV
         jukremUfnihkowYos4JH+ZApef4PyBKdjG5Aw2kiUifHG2JUQgUDl+/5qPZxo/E4wUUz
         PTzPoObunXaN+fH5VDXuWTpreVLMEKnK+MKQVcNHZjIn2Lhmtn0ROCym2xbwdfvab2qf
         Tq4LDDKgLdVFWkn0m4PpuBsg1r0E6TST9P6hhgtxndxwqvJIa8SICUC4hCFR7QFmGqi4
         /DfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898916; x=1773503716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=76UifUem1CcpJi2DmZ9pX1KLlPf7UqUfrwIn74xAbJ8=;
        b=Rfn3KkmVFZRvmB4Zi9UMidlO5fwbtlB3AkUO4AxGauHzLDaqCCgyxFfgzzEecwttWc
         IGnixa+/op2xBMiH6Zf9Nmkj1kfJ+6e8KmZ5leDC23GIDf0S0CaRfPZjbSmw/zuN1Pz8
         KDXTTRK+3/7/ZklzTwj3vK6KTiuo/uK9kV8SauCSWyhI9rc2IOmWVFlD0t6XYJdGJe8G
         Kb3N3aMC9o5XM4U49Fibs52DO12XFj/SqtIlxtfyDQ0RAMtV2QldefEnjnYP033MMJOE
         UrIdPnXawxFfkHLkrSAcuEJp2DV7GBDPO2jdEMfP3dezbGWF2ZRsDx3sIsLcKgMX3f+/
         tdbA==
X-Forwarded-Encrypted: i=1; AJvYcCXplN4xlSzOh09c1CmOiB4x0wBVcyk3oLrAg+BIgZQj8g+TqQlJd92h2EXCJDNKntRYviA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCfUQxDjqWH9iZmrtc/U2RZhFRrBa0p78inmtBvc6F/Xn04wQq
	kmic4B3td/POuIS5YigTkPxdfxQV6uO2Wf10kv8mplzxrQBfMxIIs5dM
X-Gm-Gg: ATEYQzxj0LAgLcPSetfu7dBUtT6TRtz11TPMzhR9ZHnJTAVOV/h7HN3soyhdvkDNBVV
	FXaEgVejZJyi3G3PIx15fmVk/QxMLGZPfGJLBi+V1VyWWJ56+q3U4NuEl2etPPSETfTm32JU5XF
	kXudjUiQGBc2nLxxp7/Vc4PSoxyCliiafqGXKTboJFuaQV8Oby75WHhJyePvUujS/Rw80OqwnrU
	IAQrpQPorGUJqcpg83jzjd8gam7784n7Q+srCP8bBA3I/qQUcGRXSaV02kuqR2NLW6WvXEESbI6
	T1HcVYl8P8N00yooIfURiUMiNuRRfLAW8c5+qSirUE0AC/c2PSlvkS8C3JTZREkesModZZ+5+9B
	t13WQV+LcTioQgeWjFoz0DQmldcvOAeCGzh+Hjiz4iaPPFQucgmi/YieHAoxmMGdoTNdlLG0ljB
	rlDtx+fjV/1WFWS/+Z3FZjM0lZzhDmEOKWJcNxEUXPy7Ad6V5N35YJOu81Ozb56/3G0dvZQvGoV
	f1ho41KPeHTKUuMpNafpv9tbw==
X-Received: by 2002:a05:600c:3acf:b0:483:6f37:1b33 with SMTP id 5b1f17b1804b1-48526978d48mr102487035e9.30.1772898915750;
        Sat, 07 Mar 2026 07:55:15 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:15 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v3 04/11] arm64: dts: freescale: imx8mm-var-som: Add support for WM8904 audio codec
Date: Sat,  7 Mar 2026 16:54:40 +0100
Message-ID: <bb76d92b9bfb164827f53eafceada37fb3312145.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MM can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

This patch adds the WM8904 device to the appropriate I2C bus, enables
the SAI peripheral, and introduces the sound node to expose the
sound card to the system.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 100 +++++++++++++++++-
 1 file changed, 97 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 24924ee1e8c7..7cedef8add32 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -14,6 +14,14 @@ memory@40000000 {
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
@@ -31,6 +39,34 @@ reg_phy_vddio: regulator-phy-vddio {
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
@@ -257,18 +293,57 @@ ldo6_reg: LDO6 {
 
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
@@ -413,6 +488,13 @@ MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
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
@@ -431,6 +513,18 @@ MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
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

