Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C427359FA3
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 19:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761766156; cv=none; b=QDzyoxCRqP1dc/Xkg8cTSqDTh6lMycgyb1vnvr5sclBVpoYmB65c+lws/e+dq+VsNQX/ILkGETFcRU8G/Ojp21BE5mv8tmnJCKjN21NTE/Yo/h+2jdg0x60UBqtwMKTz6yzRkp78S9z3vHfgX1arabZl09ompwTYVHFD8VnW+sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761766156; c=relaxed/simple;
	bh=L4cc62I8VBtR9WYn3KE48vIMlnYDeTk5okhOWpkUMz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPlp+cBrfi/RDPT5uU6No2qeQewhgSLZ9LT52Pqyzsnzuw/d1DOAzyNqNekCgHIR0pHOaC47kuQJOTwqBpdTaFrcvfllYtt+wwVDNAzOIU9VYm0O4np876Gr+Zw0vSy6PXCQhEyX+C5RF7inr3vD7PhR3CMYJsY5My20g7UC5o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dn17WQie; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dn17WQie"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b5a8184144dso39992966b.1
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 12:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761766153; x=1762370953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QiFp/LdLdfHAJfOJPJO9VTxDlMuNiD8Zbuk8ezHLYs=;
        b=Dn17WQiehTexWN91N1YZOccMsVRD12huNp1b8X9QrBKoD4x8tCKG6EyLLVsH4yHWSf
         aFKus2mApLvZaGaZwwXARr/KBAExmJ26hw2brRuovHqA4zO5u7pFNYgr66BxI0g408UQ
         YVTDo18P6tvukaMltAQgwgzPlZ0wd7rXrLySCuu1tj6dGT0k7l2rPuGESTlC4KuL+Kxm
         lzxY0pTxXGt4k2M8/qu8QlTLXS74YHPcxIvJC2pAem0XIME/Ut3YskG1+jRW6Cs7uLmO
         69nyHiPRfItIojQsPo8Su9rFJwvzXkWf2S/mQvjex7/TVNVH9vXNg+fg8LwlC/LdFh6g
         uoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761766153; x=1762370953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QiFp/LdLdfHAJfOJPJO9VTxDlMuNiD8Zbuk8ezHLYs=;
        b=mjl2uj8MvvOVoVgXK5gtw+9kx/mCmBpCqE9m6LhExptn3UwyAGVmKkK7rei4OxJFFD
         +zvJsJDV7gEfV7HNfFp1XtVMCF/rYuBuewJQk/6Wb03Z7aLLtftXxVVeqKReWZHqgmr/
         QnnK/VaBt3Eg/wXb/JtPqgb3Ms9danIJs98tBMoO6Ekn2lWw9Fkmce5eeNaCRcsrmhia
         4ksQ1kOfj5nEXae/ZEDGJXwTZk7zVfgoYcGTFtXeQlzlwDB41+BdMXOXeK6NAm9kFr1w
         6Qps3h4sJjXa+U/pUxhnoGKUvUdhRVN5a6ulmtjvTgqkCvz4qyBIg7KG/yybIhPLH0NA
         ozcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFMvfwjmLUXrws3qV3kVunEMeSoA83HLVkRcV41HwE32ZEkdzYnOzFPrme1tubteQOFj4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlNf17xYWan256dmkmUoGpR0qncaGYJNgGHvBZiKE9jCPDye9c
	P22EFTSHJ1VxlIXX+Avt/VFiODHsxfRSaE71BPxNdV8hzAW3/dw69fJa
X-Gm-Gg: ASbGncs4CpDVbQgdzsjOV5VyfceH0X8VrHrHB/TKIj8ZUxm1+CR0o5xn+N/AmO+rhPl
	DYRt+4xy1DH1lEJn8Cu9c4cfeSK93hp24XfZbEGVBl/UFbc5iMTwT/NNZJrBWAjhGi82cWwkR2k
	Qf/uDuaTgwJV/IypIKHx01z7MFoR7vd+9wilYQuMsnG6lrLH1Tgzu5hb2KtxI+M6aus7X69Yf88
	/jyeCm8TsTVlC/b6mrBnGIV7mfopQ7hSFOw39l7+Vc5mR2eG/BzpNChFm9HUvqru3I/OL3SRCsg
	RGj5GT5InFelfAN7mp9yeJoFKp5BmXbdAN0M+O2jBU2sCVIgAUIqZKtCzWaWRbBd+LegAg1gGrl
	MqPm2mI1+11OZF9j9lTLwz0wiGjt9OT5t2wyXVweI+2UuP+UOrg+4VqYjrG8vCdxxBqnob31KUA
	rAEK7wTjr5EuVMkVB9SuiNZiZhPdwMnI8atIkX2i0awSWVEt4wzhdJSa+swDswyg==
X-Google-Smtp-Source: AGHT+IFMO9AToKhALDtmsrq81s5iqoQxzOiv7HbkBgHJatpEZpryGrj89HkqN9nJYwlK5nQZ6d5XOA==
X-Received: by 2002:a17:907:c0f:b0:b6f:9da9:4b46 with SMTP id a640c23a62f3a-b703d5333b1mr421529766b.43.1761766152587;
        Wed, 29 Oct 2025 12:29:12 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548eda6sm1496673266b.75.2025.10.29.12.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 12:29:12 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/4] arm64: dts: freescale: imx93-var-som: Add support for WM8904 audio codec
Date: Wed, 29 Oct 2025 20:28:48 +0100
Message-ID: <20251029192852.656806-4-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
References: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VAR-SOM-MX93 can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

This patch adds the WM8904 device to the appropriate I2C bus, enables
the SAI peripheral, and introduces the sound node to expose the
sound card to the system.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 .../boot/dts/freescale/imx93-var-som.dtsi     | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 368530f5831f..d94b40d1d804 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -12,6 +12,34 @@ /{
 	model = "Variscite VAR-SOM-MX93 module";
 	compatible = "variscite,var-som-mx93", "fsl,imx93";
 
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
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
+		simple-audio-card,mclk-fs = <256>;
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+	};
+
 	usdhc3_pwrseq: mmc-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		post-power-on-delay-ms = <100>;
@@ -152,6 +180,36 @@ ldo5: LDO5 {
 			};
 		};
 	};
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clk IMX93_CLK_SAI1_GATE>;
+		clock-names = "mclk";
+		AVDD-supply = <&buck5>;
+		CPVDD-supply = <&buck5>;
+		DBVDD-supply = <&buck4>;
+		DCVDD-supply = <&buck5>;
+		MICVDD-supply = <&buck5>;
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
+	};
 };
 
 /* BT module */
@@ -166,6 +224,17 @@ bluetooth {
 	};
 };
 
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 /* eMMC */
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -247,6 +316,30 @@ MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B  0x31e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK                 0x31e
+			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC                0x31e
+			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00              0x31e
+			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00              0x31e
+			MX93_PAD_I2C2_SDA__SAI1_RX_BCLK                 0x31e
+			MX93_PAD_I2C2_SCL__SAI1_RX_SYNC                 0x31e
+			MX93_PAD_UART2_RXD__SAI1_MCLK                   0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1-sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__GPIO1_IO12           0x31e
+			MX93_PAD_SAI1_TXFS__GPIO1_IO11          0x31e
+			MX93_PAD_SAI1_TXD0__GPIO1_IO13          0x31e
+			MX93_PAD_SAI1_RXD0__GPIO1_IO14          0x31e
+			MX93_PAD_UART2_RXD__GPIO1_IO06          0x31e
+			MX93_PAD_I2C2_SDA__GPIO1_IO03           0x31e
+			MX93_PAD_I2C2_SCL__GPIO1_IO02           0x31e
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
-- 
2.43.0

