Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E7343CEF7
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 19:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827127; cv=none; b=nB2ZpbMilv1Wqe0VrVDmNtPX8qud1suH9CtWDAT1mHud7de7Z+61yxakoi6qTBkzJQSDEcOR0SqHGIPFr3cx0vqxVmgRTgVNB8O3W+1EojOTwDf6TZ4LP+9NDUcJWBv42Zt9EkXlHBtxIeoPvU+bgkf+CxjHCZizy/Z0CQwXXQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827127; c=relaxed/simple;
	bh=RbHefVkgLW/juSY4reOUNZrIf52EgmBQR78zr0wC3AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HF1erErby+RfqNVKS1tZLgFm0XrUDLeXwLM7/5RFYuOiLXtCl2B3biVVgBXCfY2ue4uyp0W0Avq2V8D4lwew/3XNncrQ75GIknE7sDXPdgpB/BVPAcTM0RwYhAVP4H/AbxPxPMb4U5T2pLXiB/y1lTdhE7Jk/LrOG5llDbIeoD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loCvOmKD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loCvOmKD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48374014a77so115713205e9.3
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 11:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827123; x=1773431923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PabYKucFhlAPL24rWY9exRhx841+oNvFcXCQw1AMR9c=;
        b=loCvOmKDH6QBnznhQ+Or3VB7kMlzwsz0olH0XrE8acg4KFpcHTMSNqAqBuf56aGHYp
         n2YJtJsnJ4EM1gEmxJ/HiaWO2vPmRTbYZDX+vgRZKxEbAuVfczede9m33k028Hhawn3j
         0DOZmf24DVmObCGIPdxvlMi+vFbK10LzhAyaDQ0Opo7ix9PhbK7unZkukVcIupsL7jB7
         1FBM2njHPopo3DEV8F6i6rjPrmJ4/1189Z1eSSb4mbJTcycFetl3JrqFmL8scuzq5u9l
         /WbLBuxH9V6r7Lfby/uLCOlWyle2UjfDyj4cohDBLZKd/wzl1wVgn5aSjgmKbAf03VKE
         ROgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827123; x=1773431923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PabYKucFhlAPL24rWY9exRhx841+oNvFcXCQw1AMR9c=;
        b=FYaguFh4iDowj7vgEsxWnUuQiUez582hCZvcByCn+QD995a/4687KKVP6xuB6Jz+Yu
         0qlVOelZXp/QGn+VkjdmKlUsrOoOnSBle/v/htR/DLHAgNQCrhqpKqO4m1v7IoeUhIMs
         Hx5B8rUy4S1frW/myxhx3WMFfEVaB+E8Y3Lq1DE6+1VN7PBoc3mBS+yNEcS2AjVAjWL3
         dikliVWFdK714evJUnNYhPxml6/1ZW1asd4iizSLJlyi5G0BevqWkPTPhsyDn0QT9DQm
         terv8Dnfbgse2GXujNcn/4WOtTedkhYOydboMyvgubu/4zpEyIizG8kHewtAjqlNLMFy
         JYPw==
X-Forwarded-Encrypted: i=1; AJvYcCXHh68UybpD2lvblF6IUE5Mfgc71KdBoDrBU2b4AvIGADhtylFrvMM47/+QxOCUGLO9z50=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbRjl7+KQg+Yc/EtUcQhSiP2De2ksxu0gIKL1CuVJ2VjmKdSrF
	tzPFzpvlBn4dlpWV19qIrAexWa9r5l6c6EuV/CKQa0tUpMe2cTx0xZNI
X-Gm-Gg: ATEYQzy0pi5fj9shMjGmdHRxGhLf3ML9mOGlCabI81vV4WzOLZpQkXmmtGTOAszxZ5G
	dRFMJkAa/aAOzm+ySMaULEpvLZsEM/0T3ZRcWBfdePshVip8c4qA/EZApTtaIxbPg0ChB099kD0
	6a+YNtu5HP70JxcqGj14tuOyfsL+9UoL90alqGzUfl/xw9+owrUtjhzhWjJ57AXKbhTcqXk6Cbh
	F/75R7yDTQvrYyUxe+xeOPxqJjSSYa5i05Bmwz5Iw8QMy5wfUtXrocojiUmKCUEx5uC/doNPg+D
	Q3BP2WNiWF3vhjaa+wgN3/C+51baxNQAusO52MenV/hhlLAb6GMqhyhryckBCdBoYf/4/1gyewS
	1dzsQaAfQ56nfjHabKJLgQT/ZO9x/xGNh6QgubLhTpiX9k4zpa1yoXqmfgodqybEN0vGBDZLGBv
	gznlIN9pzISNWy+PoneDYpOMZYAoc9Alx5FtPB2wWxIaUTR/nQt1cGe4SpPqYbUA0q+lVGe5iDo
	xRER2XHDj7Jt6PKJbPmbR525REqbkOIV4wyqG8=
X-Received: by 2002:a05:600c:8a1b:10b0:485:2af3:3f91 with SMTP id 5b1f17b1804b1-4852af3406emr19423515e9.14.1772827123274;
        Fri, 06 Mar 2026 11:58:43 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:42 -0800 (PST)
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
Subject: [PATCH v2 04/11] arm64: dts: freescale: imx8mm-var-som: Add support for WM8904 audio codec
Date: Fri,  6 Mar 2026 20:58:23 +0100
Message-ID: <bb76d92b9bfb164827f53eafceada37fb3312145.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
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

