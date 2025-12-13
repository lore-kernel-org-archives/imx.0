Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83A32F12AF
	for <imx@lists.linux.dev>; Sat, 13 Dec 2025 23:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765667378; cv=none; b=AV3ppEqkvsmrA4lEgsTKxyS2qNhZw6VmDNkXp4T5gbphRqXLLF/3iPXaMeCRynCHld0MyqPZ8AHHUI3uAl414biQoIDgqrVfMYu0mxNixnibz9HoKpR2ic0ywZa/UY8T2tU9+0wYMo7R+xVXqLipjOsLcwlP/P0GKjbg/VNxpek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765667378; c=relaxed/simple;
	bh=2BUPsrNioNxK4+IHCCv/2w8ycDCSKi9sjQBr9y1shEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3z1gcgBoCteg+7Edwat8bKIlL9XinloQpxTSkxaaEK5ceYlUjFUHlx4Rhg4qtafbYzH6OJ3Ur6UxVbre1v0bbXnyJ7PvVhGY8nYLD6/wbBoFyS3wHXtvJceqoYNEMn+684bRV8+kEj4fcy4JIQupkVKmhFipgzOy4aROBZsecw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8cGtl9g; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8cGtl9g"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47755de027eso16673915e9.0
        for <imx@lists.linux.dev>; Sat, 13 Dec 2025 15:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765667375; x=1766272175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOpZh7LYAA8Dtx9qfwir93rZZO8/sCuUlp6Rdd8i9AU=;
        b=L8cGtl9gdTLLxlchMJU63US19n3szzmFHEHMQ0l8GppUhGa+GqiqxRLxshtVAxJlRN
         IlsG57iu2QyV7sVKuNMSBLyBwNkY4kH6HbmLJY6ogr11vzwods4+hF3L1/tOLOYbUbeo
         zSoi1KoYrxYFSC/SiD6S1Dl+9xeJauj4l4vPvylBWYqgykANJ+eEant6TvMpiv1rW9Jx
         URXY6zhCyORyaHVl2Qv1OzH9Yd6qu1T63Wa89jxoHEMM1bVPVmLNlU2j+fYiLsXULT5l
         W8nWEXbi0u9qGZtc4up+vt3jdvn1j9YuxX2foaSkK7zBNNpuZBX9pRQy9FaHDxQudz+G
         cKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765667375; x=1766272175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WOpZh7LYAA8Dtx9qfwir93rZZO8/sCuUlp6Rdd8i9AU=;
        b=ZOrJmVS8BtZ3ZKqOwECQG3JYNIdmDJ6I/ECRWS+vFtFffLeXAev4lctSUstihOVIbG
         MD6C46cUlA3lavdOqH/j1f2+fZxMfnA0imQcyk3hxx21xs2/BmleZ80RL9MJcfhfeIOe
         f5OrXYtkQjEp5wPg58x9JWf2sMMy0zWIKrgVt0ZJxSzKVV7CNTKCq1hBvTyJsvfGKfBb
         fEpDepStX0hTjSGP2b0abW/srdMvVswdYihD1og6RDqhU89srZeueXv9/r8L3TNAGcQm
         ZyvGANaQqQsRG/FioVsGetNCVA4/aIJF2QDlrn9Exd6hhPzSTuvff3PH3gWYgAAEcMFa
         GdcA==
X-Forwarded-Encrypted: i=1; AJvYcCV3vHPreAM4VDr1rJCU6CiPpF6nYdpjeqT3cZzoXJL/9k8X7JUIulUjehEsI1F8USLbwX0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+1oQFkmxtarUQcD3nNR0N3DjpXuI7kaEl/b4QHDphDzom2WYW
	71m6cWAv7hvDHC9fv2pfzXUpjaUWHo/v7KmFH5CQuNIfPg2ISA4DHbw5S+Sb4s5N
X-Gm-Gg: AY/fxX73seSVztKqEarvvkaoNyA3rFYDvW3YR9voCPcyJ33ReA98Vlqz97NQ244yRWP
	y0nLdaLmyB0V3dPnYY+O0r5K0Vnf7n565OGRV4PpWQUQWVWtKkDqZGVjdDZF0AfQAbrdd5vW6R/
	eGJJY4sXdOCsiDqKsesR73/UKsIuCapCIqMaUMIv4r8pEqW5wXmaH6UKrb5DL9ctJte0a0ffkFw
	vxXJnYaY6ptijStyuuhK5w2GN7SFE4fF9VLOzOmRCljBUtd2TIIxBpW8kOClrI4wVQ+lc+/74Sk
	10b7angVKCL4aNZDu6MCzs8q/69n2mB+LAqmIEQFDFSYkxEOrdYgg9BNtw39TQxmiWj7GoArxro
	BO7N3N/HGEXkbSUDLNKmmOXe1ziTQ/S7/5ZASNyGmKN+nBHfRRiURYD/9JhD5YUbF78pnnhylkq
	Y6MOH5WNlksp6v7s+qvqY4q3roQP12f51LKL/r/vTExJcYC7ofBYKFsijXCr23F9WiU+hB0Z33n
	ti8rQVqWUtTbKU=
X-Google-Smtp-Source: AGHT+IFh/ZiZ9L++4UdOLlAP7bnIG/paHtZaS1ZXQpXk440Sin8Fz6Voei7JBvcemO+FNI3s4UJtDQ==
X-Received: by 2002:a05:600c:37ce:b0:477:9574:d641 with SMTP id 5b1f17b1804b1-47a8f903a23mr65879575e9.22.1765667375035;
        Sat, 13 Dec 2025 15:09:35 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm106040995e9.11.2025.12.13.15.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 15:09:34 -0800 (PST)
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
Subject: [PATCH v2 5/6] arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
Date: Sun, 14 Dec 2025 00:09:05 +0100
Message-ID: <20251213230909.16810-6-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213230909.16810-1-stefano.r@variscite.com>
References: <20251213230909.16810-1-stefano.r@variscite.com>
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
index e7f5ec10cbac..169fc6a9c8cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -30,6 +30,14 @@ iw61x_pwrseq: wifi-pwrseq {
 		status = "okay";
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
@@ -47,6 +55,34 @@ reg_phy_vddio: regulator-phy-vddio {
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
@@ -209,6 +245,52 @@ ldo5: LDO5 {
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
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_CLK_DUMMY>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
 };
 
 /* BT */
@@ -300,6 +382,18 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
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

