Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1DB2BE02D
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765710359; cv=none; b=QWlGbOEEekYiE3sIb+cvX4+cK4s37dkC+8e/Se67gHyit/Jj3KIoyEHt7EaRXFRbldkBc/EL8QOuJQfbkPAym8GQ6MBXiiFRPgZwFnXRAzdWGWFis/IHULMr8I7IeSfvqmdu7rshtiaMqfjxua18jVxcoe4fniePxaaTN0MfDBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765710359; c=relaxed/simple;
	bh=9KUtdwNzjKPOlpkRFydDU5oxTYkDvAsUbiyPboaBOYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4My4A7VLg9d3n2cEa58qtvx64/eQ/RJJ9MJ+61pQ9mRSfNW6NZ8OwDEEQms6a23VWc2UYWvgU7kamti9TUh9B4bxQ5k/LE71a8YytfFx6vRoKAJoP276UAfryE5gu77CkUHkKFs0fCRKowFzp6jZDEw9Zsn+/0oyrlS/CfejxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIpMeN9W; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIpMeN9W"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so277675f8f.3
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 03:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710354; x=1766315154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Tdn9gV/6JqfNO9pbAvhWxvcOUTKXJcAnzs6w4PTTfM=;
        b=AIpMeN9W4aUxnyegxJ57dwrjKfa1x/bxi1L6J/rK+3JIywY2FKcEdCj+NO/E/bKNBH
         8ABaDVSYCOJ9hf9jK0KrrIUbXKZN25/Z1ZRtD0oKf+TUjY42sPykpNuuxwbULWGOg+8d
         JCQDM+vqeVEqULnD4CiVBHLsOHKj0W7wxkftJ+Eg5c71386KcS+avtyAEL7xJI8Mo3Nz
         M/++gH8RIkaUM5MsCfIuaL1DgEqESDgXjLqTxxeJbDsV/o1hbSsVKCQ0oXzHP4J+YKB4
         k1Nm7VL9Tk/ciY01PY/jEGciFEwNme/BMuzFrQ9kuP5W9LPWweR/D1OWhdJUTtMc5cs7
         O+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710354; x=1766315154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Tdn9gV/6JqfNO9pbAvhWxvcOUTKXJcAnzs6w4PTTfM=;
        b=AMHApH+Ni690Xl/eajFM2u1bJH9ZjX6AjXniYwqkaxOvE2uiULdSl2ApogJTMH7NZH
         G1dmsYRxOx31FmmqDhQ2HoDFvak+hsEZMIg5vGCFn04shdKMbBupNfPz56QzSBPMK7fR
         n8cnUwbQNNBoouvcRneck0jHPWMiBZ6R+IBnFrCLHwkJ7LOlgpVQzizck8QnwAJlrpWE
         HwgQdsGAYBV2YXDyRBhlnMXAmvwew8QGsGQPnxahkJqVLc6Bv+PBBVtlJ7cGHTEA6H+S
         lgu0gMMojSa8fOCMlEUeKprFgn3CQ4A7V1a0RW1e/QYidvWLD9bq4KafImxj2r1yEye8
         FVNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX35JjaH5CB+KQPxJosgH6ubsCfk1WCd4KKi1lxaK7kSzaDnQm5VRfHcfpXvejZYPcf81U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9Ojq2A7MtAw7VbrwtIx/iTvl4Ixj/blbv49aHNLbFZvvPGSvb
	yEw45SC9eUB6CmN0yUrm3320ctnHNDqYgFLfESyIy4b+3wOBIbnBpq3m
X-Gm-Gg: AY/fxX65KiJFybwQ/Qo/neeu5fY0qWt60PbDGFZs60GQKb4ilw+gnCTfTlPKnXmzIOs
	GlUJornPr5l4rFFLXtndEt9tUx/HPSJg+l3/cwPLEfDgW4J3nO5C1Ob4xLhEZj9Dyf6xnLqZYaJ
	wGB2CsnfD5gjTU13rrCfQAt9gf1Qbj6mAqkL4BqdzmwxWO0x7PQXbFjgHkauKapYsBUaiADT7eY
	8q/ilbWA+4SwdyAWJIyf3CABNN93ttktIBwtux6jYabSAxDyiytAveFGYeObecGfp+F2c6faCgb
	VxawA3kgeQCi0VDQCG/J7kc1LkzgBpFZjT3ea1dxUIj/+o0EU/6PN3J5KHSLN+dyWhY53/TO4KZ
	aUx+I3rYg7SFvGc7j0l8DCqKM36uO2q7LQIgA1Bqsbt0BAFLOu7bdVe+Mmq3RLhIVjyopwWdgVU
	pWa5XvgdcLSVmb4Wt0fEDDVKiKikrkKmNVQ3FJAwVHu9PqLq3AxnXaw2BlpOh81GSHi/mH6aFAR
	vopeJG33iHHRrk=
X-Google-Smtp-Source: AGHT+IGeqYYayrctUVALbM1jIq5AYJF2P1OR7ZsvHOKipQ+Hka2ZZeQLSrX95lMDzzqOQr0xV+TXpQ==
X-Received: by 2002:a05:6000:178d:b0:3e9:3b91:e846 with SMTP id ffacd0b85a97d-42fb44a242dmr7690371f8f.10.1765710354204;
        Sun, 14 Dec 2025 03:05:54 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:53 -0800 (PST)
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
Subject: [PATCH v3 5/6] arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
Date: Sun, 14 Dec 2025 12:05:28 +0100
Message-ID: <20251214110531.9475-6-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214110531.9475-1-stefano.r@variscite.com>
References: <20251214110531.9475-1-stefano.r@variscite.com>
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

