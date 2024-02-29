Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B0C13C9F4
	for <imx@lists.linux.dev>; Thu, 29 Feb 2024 23:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709249772; cv=none; b=WYNdCnxdytc/RXpCe0+20bqjiobyTgunMwRfAik3nE9S2Vmjkm8kf09CjgVUtuxZdvJY2Iup7X44LpRTd/0E3CvYuLBsbjS2C0Lkr/oY7FuTrvvPKYJnYSQpjIbIeZpyX1394OhitFUFY2v3qrj9Tpz5/eMOIR4p26Ze4nt4ezI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709249772; c=relaxed/simple;
	bh=sbdwlifiN6TQX37CANALuKwRq4qcVl/xA8MlOkG3rE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sM6AnScd/SHgyS8OxxOdPi5SAsS4NAw+HUafEvZdWwNif40EP+IoN9hcRZ/+B942yC9u4wRaB25It87JU7EdO8lVAzWGmLsNKAIUTKlxBW5nVQ58hSAPCUHCEFmw/+4DdQb4pz/fS/EnfPKUFpaf5Rjt9S2lqOUJHF4yOUVSgY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrVsfNAK; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrVsfNAK"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-364f791a428so8014315ab.3
        for <imx@lists.linux.dev>; Thu, 29 Feb 2024 15:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709249770; x=1709854570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0Ig8cWW0xOB22oHG7WVbhrtiV1AkK22ZMx8ROiAXXA=;
        b=YrVsfNAKVhWXRFLg7fF77cn8RUKozRBwpRdaa2VQ4l/ISkr3XzBcJXAgjt69Ohy+At
         3ZrbXdFxOgUp/c1EDOeRqouLUGlNJtAXba+wbp7O1EZzWSYXt7jYiUg1faYIn3jXXr/I
         cc7J+jzLaLwUnlo7UG//4eaF9x6fE8Ai56z+HFQLHqh18g2vkWMq7vFAYEf6KzRVHMW+
         LiYI6o05dd6s/PNtnhEw1ueVaCVsM1fyChuKcikM7/lAY6sVkNHZ0MtteLuLy2NLhjPs
         sH72DGyp9DFgzMNh9+BOo7nvcxnkNmVPZfvAF/izMEwjnycmJ68ivcLvqdLKykpRywxz
         43WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709249770; x=1709854570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0Ig8cWW0xOB22oHG7WVbhrtiV1AkK22ZMx8ROiAXXA=;
        b=GqnNYU5ifzq07aQFyk+hfvr6OS3GSHxLSXGWDUT5IFR0OlukLm/XkPzwGT+1G5l+xQ
         ZMUsSAELsFn5QufbGa0ooI0yh2c/oazoFBMG2T9fv3dFxKSf1Kv56pXoQIfH3MjDPQAR
         kVY2kQ8dMMfI4yp4wTZbAGDDiqOvhJbj2/k3vJN4UT919X2cxz9H1oim1t88idRf6+Z9
         E+SZ0eheGNobjLQ/RCltOh6ncHOcU23aJ5+eA3Eic4xafVQvNtnt9xISVO+mGQcTp36R
         chEEs9skaWsSbAVygdzbBT3Hz0tOhzUeK3AEwX9SozcVx2d39Mfejguc9qYyJqKU73TT
         QwOw==
X-Forwarded-Encrypted: i=1; AJvYcCU1nTlLnxT/eb7QLk7YKzqKuzLzJpc9Uorjg7ycU59AUaYCJ4Fs5kQGfGE3siaYcwFzljERstlzriz4DY3G3pJOQTdF
X-Gm-Message-State: AOJu0Yz2UpEnocgUAI8B4RIyu+d5j3mPIDo9XeG6anDFMdS/WFV9Q2pP
	IFnQ4zZY1Fmkw4y8JfxcWpIQ9u8QNzzgb9yi8SgzJzQb6pvBCsDT
X-Google-Smtp-Source: AGHT+IGhaVKIJe0LnTK6LmXIG0SAEJYhhBGCSiIuC00weRqkOsIJvHsV9vMBU6VkGt/rYec7uNAayg==
X-Received: by 2002:a05:6e02:1747:b0:365:3a69:1e1a with SMTP id y7-20020a056e02174700b003653a691e1amr236417ill.0.1709249769634;
        Thu, 29 Feb 2024 15:36:09 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:c0ab:242c:2712:ad44])
        by smtp.gmail.com with ESMTPSA id j5-20020a056e020ee500b0036576880ffcsm584260ilk.85.2024.02.29.15.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:36:09 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx8mp-beacon: Enable LVDS-1
Date: Thu, 29 Feb 2024 17:35:55 -0600
Message-ID: <20240229233556.116944-2-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229233556.116944-1-aford173@gmail.com>
References: <20240229233556.116944-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Beacon has an LVDS display that can connect to one of the
LVDS ports on the baseboard.  The display requires a 30MHz
clock to display properly, and the LDB needs to run at 7x that.
With the audio CODEC now moved to the AUDIO_PLL1, the AUDIO_PLL2
is now available to source the LDB at 210MHz and the DISP_PIX2.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index 1f827ef38e36..731ee2667060 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -19,6 +19,26 @@ aliases {
 		ethernet1 = &fec;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm2 0 100000 0>;
+		power-supply = <&reg_lcd1_reset>;
+		status = "okay";
+
+		brightness-levels = < 0  1  2  3  4  5  6  7  8  9
+				     10 11 12 13 14 15 16 17 18 19
+				     20 21 22 23 24 25 26 27 28 29
+				     30 31 32 33 34 35 36 37 38 39
+				     40 41 42 43 44 45 46 47 48 49
+				     50 51 52 53 54 55 56 57 58 59
+				     60 61 62 63 64 65 66 67 68 69
+				     70 71 72 73 74 75 76 77 78 79
+				     80 81 82 83 84 85 86 87 88 89
+				     90 91 92 93 94 95 96 97 98 99
+				    100>;
+		default-brightness-level = <80>;
+	};
+
 	chosen {
 		stdout-path = &uart2;
 	};
@@ -135,6 +155,38 @@ led-3 {
 		};
 	};
 
+	lvds-1 {
+		compatible = "panel-lvds";
+		power-supply = <&reg_lcd1>;
+		width-mm = <223>;
+		height-mm = <125>;
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+
+		panel-timing {
+			/* 800x480@60Hz */
+			clock-frequency = <30000000>;
+			hactive = <800>;
+			vactive = <480>;
+			hsync-len = <48>;
+			hfront-porch = <40>;
+			hback-porch = <40>;
+			vfront-porch = <13>;
+			vback-porch = <29>;
+			vsync-len = <1>;
+			hsync-active = <1>;
+			vsync-active = <3>;
+			de-active = <1>;
+			pixelclk-active = <0>;
+		};
+
+		port {
+			panel1_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+	};
+
 	reg_audio: regulator-wm8962 {
 		compatible = "regulator-fixed";
 		regulator-name = "3v3_aud";
@@ -144,6 +196,25 @@ reg_audio: regulator-wm8962 {
 		enable-active-high;
 	};
 
+	reg_lcd1_reset: regulator-lcd1-reset {
+		compatible = "regulator-fixed";
+		regulator-name = "LVDS-1 reset";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca6416_3 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_lcd1>;
+	};
+
+	reg_lcd1: regulator-lcd1 {
+		compatible = "regulator-fixed";
+		regulator-name = "lvds-1 power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca6416_3 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -457,6 +528,38 @@ &lcdif1 {
 	status = "okay";
 };
 
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_AUDIO_PLL2_OUT>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL2_OUT>;
+	assigned-clock-rates = <210000000>, <210000000>;
+	status = "okay";
+
+	ports {
+		port@2 {
+			ldb_lvds_ch1: endpoint {
+				remote-endpoint = <&panel1_in>;
+			};
+		};
+	};
+};
+
+&media_blk_ctrl {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_AXI>,
+			  <&clk IMX8MP_CLK_MEDIA_APB>,
+			  <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
+			  <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
+				 <&clk IMX8MP_SYS_PLL1_800M>,
+				 <&clk IMX8MP_VIDEO_PLL1_OUT>,
+				 <&clk IMX8MP_AUDIO_PLL2_OUT>;
+	assigned-clock-rates = <500000000>, <200000000>, <0>, <0>, <1039500000>;
+};
+
 &micfil {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pdm>;
@@ -496,6 +599,12 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pwm2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+};
+
 &sai3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai3>;
@@ -596,6 +705,13 @@ &usdhc2 {
 };
 
 &iomuxc {
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO09__PWM2_OUT	0x116
+		>;
+	};
+
 	pinctrl_ecspi2: ecspi2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK	0x82
-- 
2.43.0

