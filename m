Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13EF405EC
	for <imx@lists.linux.dev>; Fri, 22 Mar 2024 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711111617; cv=none; b=kq8QZI+FBLjTac/17z/wDGHpivfOJBX4thr+QrJscOaf81JNggKtn/a9p2qj3f6ICmVWI0NrLHKFQIBPV4W3ioU9MF9WolzYtdKFGEbGuGQj5fHTI/SuevQ4b5PUp6p8AQCWXwKujS8U21dqM6OAUx04ysz9AEKqxVqpEj1F4SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711111617; c=relaxed/simple;
	bh=Mc+nWMMEosm4ccbDGJPAs1X/IhkrsXvc6bhBeMV+Uuk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L4etYaS8KDY3x6u1TEXVQhHKuV3hqySohno6o3pLUR1YWZvqpGf3jb0fOOD0D9cfSETYFWmZAGBqSSI1aCYZm74aMYJ2yeIdyjfUnrNp3GLqQrqqxv+X1fTtVAID86qXi/5cax8eC5nAlP6kxzn021cTe3APu2HEdAjvI522rjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDAgbkdt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDAgbkdt"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-414701303f7so19842725e9.2
        for <imx@lists.linux.dev>; Fri, 22 Mar 2024 05:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711111614; x=1711716414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RB3xFwev27cGWj/kr3xX//Yti9pwXGl2cOzo4+2MzaA=;
        b=WDAgbkdt5unQ1ifwYknZURY8vgZTD/Rep++zc5kX8mbHrIJBje0EBged4t5L3Uu//n
         bQqU4QqmrFCtaawr4+mW+nj412UxohsiO+GYnGOL57MUjiT0Ofphfusiw1PdW6YX4SBZ
         lDGjeuihrVlt6ays3DoNSjCXaGKheKjEDPHe+EzkR9A8TECmuURLZbqmb6Nq+kui9H8I
         dKZxEaKgJw8BRKsMgKBEoYChepX/PVK7QfkYV9RY9wurfqF4PDfpzfzCxZAbSsPWtrkr
         bWYkhxbBdvR05wknqdL6x7QUdxJZgzybQ3mF2TIGHzcm0JuVC/0aYqYBYnKDu6o76bRA
         Cs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711111614; x=1711716414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RB3xFwev27cGWj/kr3xX//Yti9pwXGl2cOzo4+2MzaA=;
        b=fhZRLkaXUiyWvpj0jtuAmoGkfZJsaXYFOjP1mjjRg4XURs6J+LCo643dZDYebOY5J1
         Rr/9ojxKkOaZPQaKw6Oh6X/UGTpbvLOJnvQNh3yhYKZiJkrhBFXNuUvprvb2ORkr6u+e
         X6E/u8NFNESjJSF7yIvX7YHzV8REKYW68v3dmAHyf3m9VY3N18mnGaz4QhBLlMx/yHEz
         Q8Y5dKROMYIychAxE7GSKnD80ZPLLGE5gJqz9JPLiMp50MEaLrrp3Nx37zr3J7CX+XBS
         i0NY3oe8GedGHuMSs8eimAPJiO0ih12XenWbB4i4PjkhPq/nwKzjz/YNZd2y2bCBwBPD
         d/hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxyNJGhbBXUHI6aXmb8tB5w1yebqmhWpzbkfH1iGUxNM5DBgiFuDmndIek9cTlZjrSAMbMnc9A23SUqmKMtoLHin65
X-Gm-Message-State: AOJu0YyKSlCasDaB4JX6EIr6t0DQ9CkaBODiFOuJSbdleO3ZgRIu+63a
	atLijp4Nv7dCO+yc5DiG1lGDEf3S9FRibkdPdkwNWYNSiAqBJ2jQ
X-Google-Smtp-Source: AGHT+IF1qkzrv8qD8jTN7ZbrlS28HPptaqDOjy8Lg9y2eBBFT2JZD+2cG6aY3z0Wj3QZyyLsLSv+AA==
X-Received: by 2002:a05:600c:4506:b0:412:d149:254c with SMTP id t6-20020a05600c450600b00412d149254cmr1823332wmo.17.1711111613810;
        Fri, 22 Mar 2024 05:46:53 -0700 (PDT)
Received: from vitor-nb.. ([2001:8a0:e622:f700:7937:89a:a375:7ff2])
        by smtp.gmail.com with ESMTPSA id p42-20020a05600c1daa00b004146f93a9d1sm6747201wms.25.2024.03.22.05.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 05:46:53 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: verdin-imx8mp: enable Verdin I2C_3_HDMI interface
Date: Fri, 22 Mar 2024 12:46:20 +0000
Message-Id: <20240322124620.40250-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Enable Verdin I2C_3_HDMI interface on iMX8MP Toradex Verdin boards.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 .../dts/freescale/imx8mp-verdin-dahlia.dtsi   |  5 ++++
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi |  5 ++++
 .../dts/freescale/imx8mp-verdin-mallow.dtsi   |  5 ++++
 .../dts/freescale/imx8mp-verdin-yavia.dtsi    |  5 ++++
 .../boot/dts/freescale/imx8mp-verdin.dtsi     | 27 ++++++++++++++++---
 5 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
index 7e9e4b13b5c5..8d954259085f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
@@ -110,6 +110,11 @@ wm8904_1a: audio-codec@1a {
 	};
 };
 
+/* Verdin I2C_3_HDMI */
+&i2c5 {
+	status = "okay";
+};
+
 /* Verdin PCIE_1 */
 &pcie {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
index a509b2b7fa85..e5400140e5c6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
@@ -131,6 +131,11 @@ nau8822_1a: audio-codec@1a {
 	};
 };
 
+/* Verdin I2C_3_HDMI */
+&i2c5 {
+	status = "okay";
+};
+
 /* Verdin PCIE_1 */
 &pcie {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
index 8482393f3cac..1d15f7449c58 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
@@ -112,6 +112,11 @@ &i2c4 {
 	status = "okay";
 };
 
+/* Verdin I2C_3_HDMI */
+&i2c5 {
+	status = "okay";
+};
+
 /* Verdin PCIE_1 */
 &pcie {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
index db1722f0d80e..3a8542266d85 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
@@ -117,6 +117,11 @@ &i2c4 {
 	status = "okay";
 };
 
+/* Verdin I2C_3_HDMI */
+&i2c5 {
+	status = "okay";
+};
+
 /* Verdin PCIE_1 */
 &pcie {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index faa17cbbe2fd..f033d4310305 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -664,8 +664,6 @@ atmel_mxt_ts_mezzanine: touch-mezzanine@4a {
 	};
 };
 
-/* TODO: Verdin I2C_3_HDMI */
-
 /* Verdin I2C_4_CSI */
 &i2c3 {
 	clock-frequency = <400000>;
@@ -764,6 +762,16 @@ eeprom_carrier_board: eeprom@57 {
 	};
 };
 
+/* Verdin I2C_3_HDMI */
+&i2c5 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c5>;
+	pinctrl-1 = <&pinctrl_i2c5_gpio>;
+	scl-gpios = <&gpio3 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio3 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
 /* Verdin PCIE_1 */
 &pcie {
 	pinctrl-names = "default";
@@ -1106,8 +1114,6 @@ pinctrl_gpio_keys: gpiokeysgrp {
 	pinctrl_hdmi_hog: hdmihoggrp {
 		fsl,pins =
 			<MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000019>,	/* SODIMM 63 */
-			<MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c3>,	/* SODIMM 59 */
-			<MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c3>,	/* SODIMM 57 */
 			<MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD	0x40000019>;	/* SODIMM 61 */
 	};
 
@@ -1163,6 +1169,19 @@ pinctrl_i2c4_gpio: i2c4gpiogrp {
 			<MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21		0x400001c6>;	/* SODIMM 12 */
 	};
 
+	/* Verdin I2C_3_HDMI */
+	pinctrl_i2c5: i2c5grp {
+		fsl,pins =
+			<MX8MP_IOMUXC_HDMI_DDC_SCL__I2C5_SCL		0x400001c6>,	/* SODIMM 59 */
+			<MX8MP_IOMUXC_HDMI_DDC_SDA__I2C5_SDA		0x400001c6>;	/* SODIMM 57 */
+	};
+
+	pinctrl_i2c5_gpio: i2c5gpiogrp {
+		fsl,pins =
+			<MX8MP_IOMUXC_HDMI_DDC_SCL__GPIO3_IO26		0x400001c6>,	/* SODIMM 59 */
+			<MX8MP_IOMUXC_HDMI_DDC_SDA__GPIO3_IO27		0x400001c6>;	/* SODIMM 57 */
+	};
+
 	/* Verdin I2S_2_BCLK (TOUCH_RESET#) */
 	pinctrl_i2s_2_bclk_touch_reset: i2s2bclktouchresetgrp {
 		fsl,pins =
-- 
2.34.1

