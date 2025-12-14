Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925DE2798EA
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 21:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765749192; cv=none; b=dEHaMRpadN44TeVsIolgtJkYNytCaNgl3sTybuhndNNxeCA3OOe4Z9zdSnDm2H47v+aHnJHgyxm6qMAnr31SUrmTXhC8LDkrKibwhfUMnkpWZDmnYJ9GbzQpBfS6PmhnGNSIK1HaUqU70axkR3bh1ixeW62crykd7BRjxf5j9SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765749192; c=relaxed/simple;
	bh=9KUtdwNzjKPOlpkRFydDU5oxTYkDvAsUbiyPboaBOYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7nou/2PksuI6xaffFMk7eO9D0SbhH12BCNWXnZhE5JlNSZnd62QoPlrq7wg199zS2lePBIW6sQ6kCe0KA0IMMV+Ra9XzfJd03pftwb6HaO1+x0xE6LogcIGCE+MPB7GeQPIFr3Yh2gMVqCCGUpmbzboeCZkB6mAi9z5w3GF+PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwRaGfsQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwRaGfsQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbab737f5so1123363f8f.1
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 13:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765749189; x=1766353989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Tdn9gV/6JqfNO9pbAvhWxvcOUTKXJcAnzs6w4PTTfM=;
        b=MwRaGfsQd7bN0DWOXUsMDkBJ3gZkswq6eMrrxFu2qONhM5e7y/1DIkw4LdEq7bVgWc
         l4zsbxPlVVjvJTC3CTE1vPDvLa5E26RJ7O+Ksm2p24+8pUrrL0re2L92UlyRIPQDe7O2
         aB4Jm2PZpNVRcLJ4RNs+ozJhM5h9K0WLrTr5oUCUrhxNKxcrb/J0b3UDvdJzldaUU5il
         yvpes8eN8dWfXVUA32IGJ2ifqzmM4l/pjteoQAv3Wy9vNwiEmpjlaefNLdPAI3C5NroS
         bOFkYkaZnbzO77Rq4kET8ptyt6h1KA60Y0lMI2iDWgL11rvJ9uoZiCYAZTz0DKj+3BAu
         /L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749189; x=1766353989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Tdn9gV/6JqfNO9pbAvhWxvcOUTKXJcAnzs6w4PTTfM=;
        b=FjU+mxjpUlTqEsvwk28zkbqJeoCetP1seBbAA602qDiCy6kIidtXwrzBIItuBvjEr6
         HFJuUuFJI3uNsfmdf7r5aAnA7ZUSpG7gHBrbHwWFXIc7Wbh52zWmGlDe8nA2CLXh/kkz
         Wzg/95bxKice7IjBU4K+9Mu55sIriclYscbhS0xJX0Xp+0afbHvIxc5BoBfxiQVycwUH
         UUMrs+TxoDyu14vfEb03gySDEdaxrfS9Bs+dQASij5FnfdK7hTS+j/9bJNBZIPjEVVUY
         pYIKX6TFXlzRL0iOU2AIvlW8H0WrplTm2cd7P56RWWgadj482vtCG6InUfnQP/CVDebd
         YyVw==
X-Forwarded-Encrypted: i=1; AJvYcCX4qIx8zEPydr6r5J1DZe+Zuqdas++Xv6PLhnUPeUrqBYPOle6BlBNNBulAB7tgUHz8fqk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSb0Tuv31n4udkbs2slKg7DXeqH4iLl+ZEgWDE5Cby//DF0i6W
	qJGZ50wHPOmqFsGe2kMNCJcvIH8Do6bOuTYLIb7AVCpRbfkaZ7E7epIh
X-Gm-Gg: AY/fxX7G/t/cD5Iyl2ssIAAc0Z9QscG2IzDNmURRENzZdPi0Fnd1kCfdyzokBbHMGqy
	ydkvJ9vn33XRaXGXgISdUkeu8j0zFnnD2KwDYzLlLR2fV0Q2b1gQ4TeONbL0C0r7osfnwMl3otW
	+yoTaNAyB2gu4ruSd7ZK5cgLRT6QM0PM7tSqnhwUnvIgyfOI2fKis3sCLEU7Cv83NdqSEOz/H+N
	87WSF0F/CYhrWhnHoivb7z7zCUksjPjRZtlE4X4R+pA90eKETjpZToSzoF4lADlmoPwb92m0Sax
	8PVO4YUsixUxsU47K/N6ZPDe8G1AJPqwLHUTmeX33vkaHzp5YUF+KcUJB9x1uSq6IHU+f0QFZdl
	skLMI/90ZcSZQh8s29NkPuvoEiAIQRQOf1AhWdotBA6w2lkGAO77TGiw+F6iQ7tyzlfwqIdUlWq
	i2FxkbVuOKSpWZdYz+O9xjbMN6WP/ia/4xkYKmgmzspcCEZY5YQjWb77sox0dk+zGsLcKOSqH99
	GRltz+wW3onujc=
X-Google-Smtp-Source: AGHT+IG+rgfgN+Ap9RYxSwhweoK+D05CCHg0wt/q7sG4diqCgX52kzMUBhkWGakUvtMafmHzyyuIVA==
X-Received: by 2002:a05:6000:24c4:b0:411:3c14:3ad9 with SMTP id ffacd0b85a97d-42fb3ecd768mr9691867f8f.21.1765749188732;
        Sun, 14 Dec 2025 13:53:08 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6a42c8csm7625568f8f.16.2025.12.14.13.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:53:07 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 5/6] arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
Date: Sun, 14 Dec 2025 22:52:52 +0100
Message-ID: <20251214215256.5812-6-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214215256.5812-1-stefano.r@variscite.com>
References: <20251214215256.5812-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VAR-SOM-MX8MP can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

This patch adds the WM8904 device to the appropriate I2C bus, enables
the SAI peripheral, and introduces the sound node to expose the
sound card to the system.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 2c49d53e30c3..6da5df11c44a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -29,6 +29,14 @@ iw61x_pwrseq: wifi-pwrseq {
 			      <&gpio2 19 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
 	};
 
+	reg_audio_supply: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_phy_supply: regulator-phy-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "phy-supply";
@@ -46,6 +54,34 @@ reg_phy_vddio: regulator-phy-vddio {
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
+			sound-dai = <&sai3>;
+		};
+	};
 };
 
 &A53_0 {
@@ -208,6 +244,52 @@ ldo5: LDO5 {
 			};
 		};
 	};
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_audio_supply>;
+		CPVDD-supply = <&reg_audio_supply>;
+		DBVDD-supply = <&reg_audio_supply>;
+		DCVDD-supply = <&reg_audio_supply>;
+		MICVDD-supply = <&reg_audio_supply>;
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
+};
+
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <11536000>;
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
+		<&clk IMX8MP_CLK_DUMMY>,
+		<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
+		<&clk IMX8MP_CLK_DUMMY>,
+		<&clk IMX8MP_CLK_DUMMY>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
 };
 
 /* BT */
@@ -299,6 +381,18 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC                   0xd6
+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK                    0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00                  0xd6
+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00                  0xd6
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK                      0xd6
+			MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI3_RX_SYNC                   0xd6
+			MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI3_RX_BCLK                    0xd6
+		>;
+	};
+
 	pinctrl_uart3: uart3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX                          0x140
-- 
2.47.3

