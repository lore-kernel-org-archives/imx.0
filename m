Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F8F2DE1FF
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171981; cv=none; b=eV92ehH+XfkEy+dYgReYqG5YpwOKeHgnIUJ0R3rjMzvyNVQbHYM/cVtHInZF83up2jZEEuarSMBVOpWZ3tMCLfzkwRLPrakVEc/lczqNMjUpsY5zO3YZ0DseFy/og8zvZ4KJL53exOOPuIFFR328J1cEHns2/W3xMYreLfczx5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171981; c=relaxed/simple;
	bh=VAfKq6qGNL7z+ko22Uplbze1TDDi2TapEsClIC4UEsA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BCo5DvUCAIx1/yoY1D+AfagL3deTJyh2iaLThXA9h/xN5v8TsLuwyqPgYvS+gcv4qdWaFuMDVK/xeq0u23WuR1WEq44lfillqG0N85W8sBEahILpQM5z++tiJZVYic2E+mB883pU2Xpztl6VvjvsrwXdU2yUqYl9PeUc3cQGxYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgcHj4eh; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgcHj4eh"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ade30256175so1149580266b.1
        for <imx@lists.linux.dev>; Tue, 17 Jun 2025 07:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171978; x=1750776778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtW5JtQayEuGFuLB8bwS6fi5taZNSc9e/Z9Cc1Nt+Y0=;
        b=MgcHj4ehz3rGWMgxwR3v7hY0eYjKGHzuCdskIwS0cKiV9jayykB7cXhm9tQT05xJxR
         8mxXQjcdccTxPX70CVGS+ZrCHuVrTPrqZCefslErQgL1eredh412MNuwq3CodFZI5hmE
         T29EgyoG8A5kUNpK/Ec/HRi1uJ2PSxM4chB+nTabZocbbL4709rOVbtxCKufWUVqqPJy
         ckteJrduN82bZ/CedF4Fay9MkYFI69Cj0P4iwGXgkGmMcx8YyS+8lUOYsW8Hzq9Q00Ub
         WvHAeJNF3ks3aFdIIcHK9XUwf5/E1+XxJcyfYOsc1xJxln/s2ABXuVlbJtbNPKIN2bYh
         0qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171978; x=1750776778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtW5JtQayEuGFuLB8bwS6fi5taZNSc9e/Z9Cc1Nt+Y0=;
        b=gjpfrPwOxbdVu2PwPY0f3VhYiZ0ohfLvHoFv4X5kckPz+Xg34hYbUyP+lOUIZL5cuY
         biRhWydDsjWZVsc3LdEsDDSIQCUAXNZSnl0igJ01GdpMT1JqJ4a+xjpjJ9TOl2/lI+rr
         bk1sxKcWF4q5wJlGxzEK6mr+CbpCx3K+mh5lUKfweQK4V2N4iAOFRNPz7TFXTAtIfNCF
         9IdQECSVqsq3xDoG6PvMQDuungLrdEGi69ek7Z2wWLXqvp7HGleVEq6GfHH/F6lWDlkm
         UlIRe2Q0V1UZPM9yktVW1zGxsksKEo5b3Q0Hn8mh9DqalJ/sM1UA5/FCu80WXtt1Lu4y
         axeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPaK1m5TW3rJXka/Rh87n1PBfN3qW+P8I6/RPFDvTu8KwNL9AHZVyaQRIJPNTiRUNHD8A=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBEjvVlhLOGNa8QWxCXAaqHM2mTGWOUTABDMeI35QrYkNgjSpR
	3XrF3b8MhVXvbfUxIuHzwRcQMaSjWTgxWOMS3t2XFW2EsIryjGsn4GyQ
X-Gm-Gg: ASbGncsDXpqRuLXKCjplRKzLxq0qa0QNtVAgptdDuFLOJAHNSaJjYrkQx7ElwlRsauP
	85ptkdKg4waXAXvWuqbOFTECqyaEfMmsaWU5VbqxabVnSQ84GlKujwwrlmPhUzjjDRTkkMRi4EQ
	vQoB4EPA/YidnEusCHaQxlOcZ+Ix/VQ4giJ369x9tG48ab+QXPh6t/BxRrn4rUWVnqW1epmgOXo
	eG5jryGqNJ6FbNEFNTOTniaK4hS7cyP4n4O2hG9Zn1QkBif1c8pZP6VImKXQGTnE/t6B1hQJ7Bz
	sj2mbu46tEpKWaO5YPEFxXR4G9TDlsvkJwEBpxLorzKCguDEZ/ugtt5h1ztFCKlQicbiER2W/zp
	IQsbU+1yc/uimWfVq6xvSO6g=
X-Google-Smtp-Source: AGHT+IH4znlknzxjUuzAcuPGkxhqPfS4ORXrTA1d31lol12/rKTAlx/Bqtho85nLPCL5G4FiwkKZNA==
X-Received: by 2002:a17:906:f584:b0:ad5:3a7b:de91 with SMTP id a640c23a62f3a-adfad34ae98mr1370234266b.27.1750171978175;
        Tue, 17 Jun 2025 07:52:58 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8153573sm869775666b.21.2025.06.17.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:52:57 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx8qm-mek: support revd board's wm8962 codec
Date: Tue, 17 Jun 2025 10:52:20 -0400
Message-Id: <20250617145220.1131165-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617145220.1131165-1-laurentiumihalcea111@gmail.com>
References: <20250617145220.1131165-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The i.MX8QM MEK RevD board is a reworked version of the i.MX8QM MEK
board, which includes some sensor and component changes. One of these
components is the WM8962 codec, which is meant to replace the WM8960
codec present on i.MX8QM MEK. To avoid having to introduce a devicetree
overlay or another DTS, the WM8962 can be supported by using a virtual
I2C MUX since both of the codecs share the same I2C address.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 101 +++++++++++++++----
 1 file changed, 81 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 353f825a8ac5..e1023ca55929 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -131,6 +131,72 @@ lvds_backlight1: backlight-lvds1 {
 		default-brightness-level = <80>;
 	};
 
+	i2c-mux {
+		compatible = "i2c-mux-gpio";
+		mux-gpios = <&lsio_gpio5 3 GPIO_ACTIVE_HIGH>; /* needs to be an unused GPIO */
+		i2c-parent = <&i2c1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			wm8960: audio-codec@1a {
+				compatible = "wlf,wm8960";
+				reg = <0x1a>;
+				clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+				clock-names = "mclk";
+				assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+						  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+						  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+						  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+				assigned-clock-rates = <786432000>,
+						       <49152000>,
+						       <12288000>,
+						       <12288000>;
+				wlf,shared-lrclk;
+				wlf,hp-cfg = <2 2 3>;
+				wlf,gpio-cfg = <1 3>;
+				AVDD-supply = <&reg_audio_3v3>;
+				DBVDD-supply = <&reg_audio_1v8>;
+				DCVDD-supply = <&reg_audio_1v8>;
+				SPKVDD1-supply = <&reg_audio_5v>;
+				SPKVDD2-supply = <&reg_audio_5v>;
+			};
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			wm8962: wm8962@1a {
+				compatible = "wlf,wm8962";
+				reg = <0x1a>;
+				clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+				assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+						  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+						  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+						  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+				assigned-clock-rates = <786432000>,
+						       <49152000>,
+						       <12288000>,
+						       <12288000>;
+				DCVDD-supply = <&reg_audio_1v8>;
+				DBVDD-supply = <&reg_audio_1v8>;
+				AVDD-supply = <&reg_audio_1v8>;
+				CPVDD-supply = <&reg_audio_1v8>;
+				MICVDD-supply = <&reg_audio_3v3>;
+				PLLVDD-supply = <&reg_audio_1v8>;
+				SPKVDD1-supply = <&reg_audio_5v>;
+				SPKVDD2-supply = <&reg_audio_5v>;
+			};
+		};
+
+	};
+
 	mux-controller {
 		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
 		pinctrl-names = "default";
@@ -314,6 +380,21 @@ sound-wm8960 {
 				"Mic Jack", "MICB";
 	};
 
+	sound-wm8962 {
+		compatible = "fsl,imx-audio-wm8962";
+		model = "wm8962-audio";
+		audio-cpu = <&sai1>;
+		audio-codec = <&wm8962>;
+		hp-det-gpios = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
+		audio-routing = "Headphone Jack", "HPOUTL",
+				"Headphone Jack", "HPOUTR",
+				"Ext Spk", "SPKOUTL",
+				"Ext Spk", "SPKOUTR",
+				"AMIC", "MICBIAS",
+				"IN1R", "AMIC",
+				"IN3R", "AMIC";
+	};
+
 	imx8qm-cm4-0 {
 		compatible = "fsl,imx8qm-cm4";
 		clocks = <&clk_dummy>;
@@ -511,26 +592,6 @@ &i2c1 {
 	scl-gpios = <&lsio_gpio0 14 GPIO_ACTIVE_HIGH>;
 	sda-gpios = <&lsio_gpio0 15 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-
-	wm8960: audio-codec@1a {
-		compatible = "wlf,wm8960";
-		reg = <0x1a>;
-		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "mclk";
-		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
-				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
-				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
-				  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
-		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
-		wlf,shared-lrclk;
-		wlf,hp-cfg = <2 2 3>;
-		wlf,gpio-cfg = <1 3>;
-		AVDD-supply = <&reg_audio_3v3>;
-		DBVDD-supply = <&reg_audio_1v8>;
-		DCVDD-supply = <&reg_audio_1v8>;
-		SPKVDD1-supply = <&reg_audio_5v>;
-		SPKVDD2-supply = <&reg_audio_5v>;
-	};
 };
 
 &i2c1_lvds0 {
-- 
2.34.1

