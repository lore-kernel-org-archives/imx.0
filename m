Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F202F7ADD
	for <imx@lists.linux.dev>; Sat, 13 Dec 2025 23:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765667375; cv=none; b=qq9JneBNgn66AWnCgA2uffnffK3M+S9tj9xlTnSww4tk0IdfyWjDgmt4mItjNmwNcGusnRz/9xyBrJU/axibvFcHcFABox6ePpE6GEavdeAKsGKv1kidhiuYl5Ag/vz9DJfppMp9JdqGN1q2PBhaTjGZAsdhHxmVrHUVS8jjQr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765667375; c=relaxed/simple;
	bh=uYZSnZuRrwJRAmm9rMjS2CEsXeIqm8YEwy7l+zm6we8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cBu0xnufXIut4r2cZJ8hCUp2dJNbIdnLhDXquQSNG0EGps+uAVriwXHrpn5jA+myARMmcTjq3+JYp1crMikfDxAptnjyFMxnFTxcdKU7w8LJ+x29++EBwJHG/vaJoZrSMpfSDUFkmND11lvPk2RvNXfi6z70gvIrD2Ysas4Ayuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feAEFjRN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feAEFjRN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so26588635e9.2
        for <imx@lists.linux.dev>; Sat, 13 Dec 2025 15:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765667371; x=1766272171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=;
        b=feAEFjRNbWUJXBSZwNyVUcXxbMLFeF6U0k/PIT2wZLov9mBrwGGxMk9fNlG+Jp5VG6
         ERWS9ChxWhzQofMWbdPalMgHIKiE+KnVNy4iN6toT42NPSTwqmRXkQ241nzzCbRLtZTa
         FAiBpOsQL2ioTOlptYthzIXu7Dxplz4q6gwM+XpJJoVW45789IHarWBmkbUGkNR890y4
         U0MsK5B81uUVubpwSMPDNZK/gXLQE3UXkKGlSaZjGfwVGdCOa8J7A7FPgi0EhvEBI2UJ
         /KyxXacerAVmAwXZkw87fS5VGICnhSJN7Ezir0b03NfTsaSbC5bshlCuFXdokmm6v4/T
         mD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765667371; x=1766272171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=;
        b=sDg/0YbWOvHEYUuvANiqRyzWskOGhgTmGOw/zrqAOhZlbVwAjmDTIV2V4xc5Tep0JJ
         dkkvJWAuYua6QsaHjkg3f85CjidvzA3ZUtQAFwui8CCV3PSwL84/sRodXoF2+s7tNYlp
         31gSpAIZAiQRHU8dAQ6SCbY+qpJcvmxgNjWnMjxrcKKHLEnTQ2UX6nCIhGX7rNIR9iDx
         0fcUHsK7qTOUZZZr83VNaaX+RkVoGZVD24p+28GuaN+ZjaVyGwOV4syr1xzD8Vv/Wgd/
         y7XjZ/bTIDJ0Cls0jEAqwOzrgMCQA79VI/EtEHg9N1Hz0xfhqQftMTmRwZwvFKzZb53z
         R0Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXT63ge6xYAzAx93RHaDOmYL8ybvKWwt2MJ3u5FEfOmYtSR8cJ56yrB6P7kucaZQXT4W5k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoH4NRdsiRaK757i0EMx48xkUIpTHnIQYBIXsFUAEY68yxm48W
	QmDfHr5L62CZfx4IWcpUuwxFO+rSHujvV9nghLtaYAhiHUdAK+q2AVjG
X-Gm-Gg: AY/fxX53i4HuJLTw9zYWlHS/yEU96AJSQOF3iypP89GPPEHrb6DLDuevvDIeK2bScXN
	QP2/k1kwv9Cq9/hy65chtTsKS6Q33irNVwsvIxX8pTcNXTcPVpubse+iYWYjNqz5aVIm3kR55AR
	avQjLPeMhQi7kdqJJnR90Kgh9LMdyFFXyI+waqiURqjVwS1qAM3BO8bcXfDJSAfdCsK0s2XEgNu
	w+uYuo2ltSw8z5dabtqjt1w33mpKIs9mV/mv4HxFTSKxauBr6gDyiAu/ieojwjJhH6Uvej0EwxD
	ZdXwRevlVJU2dcI0Q+K24kacNyCRcg0+zTcutRxgUmquUErFE/ZF8cvpqJH06zw7f3b2TeILhBI
	UO2PPEAW7ZMHpNEbCwhshCP7xKpTu1u1q3ofCYmMmveQ5rpZL2YXztTUCAfenBKO44ICzM1S5vY
	o9gjJVjj9mpcX/2/x7FXabS0rxhqBDGZKQEzZYjlAK2lQtyLwecNM4pm8+uUEMjvZw0AJv0OL5i
	c3Xfl6o3cIVSUQ=
X-Google-Smtp-Source: AGHT+IHzWPYCHO8TYMArjtFvECMEL21nASqORB4ezLJFhG6O/tj1mS9JO/pOaU9Regy38BeBofSLBg==
X-Received: by 2002:a05:600c:444a:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-47a8f8a7570mr64372955e9.6.1765667370526;
        Sat, 13 Dec 2025 15:09:30 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm106040995e9.11.2025.12.13.15.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 15:09:30 -0800 (PST)
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
Subject: [PATCH v2 2/6] arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony carrier
Date: Sun, 14 Dec 2025 00:09:02 +0100
Message-ID: <20251213230909.16810-3-stefano.r@variscite.com>
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

The VAR-SOM-MX8MP module does not include the PCA9534 GPIO expander nor
the LED connected to it. These components are present only on the
Symphony carrier board and may vary across custom carrier designs.

Move the PCA9534 GPIO expander node and the associated LED definition
from the SOM device tree to the Symphony carrier DTS, ensuring the SOM
dtsi describes only hardware present on the module.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 50 +++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 50 -------------------
 2 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index ea3c193bb684..361e6122bdc3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -9,6 +9,16 @@ / {
 	model = "Variscite VAR-SOM-MX8M-PLUS on Symphony-Board";
 	compatible = "variscite,var-som-mx8mp-symphony", "variscite,var-som-mx8mp", "fsl,imx8mp";
 
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_POWER;
+			gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -31,6 +41,33 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	/* GPIO expander */
+	pca9534: gpio@20 {
+		compatible = "nxp,pca9534";
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pca9534>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-source;
+
+		usb3-sata-sel-hog {
+			gpio-hog;
+			gpios = <4 0>;
+			output-low;
+			line-name = "usb3_sata_sel";
+		};
+	};
+};
+
 /* SD-card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -45,6 +82,19 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                                 0x400001c2
+		>;
+	};
+
+	pinctrl_pca9534: pca9534grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 949d9878f395..158a78ec9656 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -19,16 +19,6 @@ chosen {
 		stdout-path = &uart2;
 	};
 
-	gpio-leds {
-	        compatible = "gpio-leds";
-
-	        led-0 {
-	                function = LED_FUNCTION_POWER;
-	                gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
-	                linux,default-trigger = "heartbeat";
-	        };
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0xc0000000>,
@@ -216,33 +206,6 @@ ldo5: LDO5 {
 	};
 };
 
-&i2c3 {
-        clock-frequency = <400000>;
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_i2c3>;
-        status = "okay";
-
-	/* GPIO expander */
-	pca9534: gpio@20 {
-	        compatible = "nxp,pca9534";
-	        reg = <0x20>;
-	        pinctrl-names = "default";
-	        pinctrl-0 = <&pinctrl_pca9534>;
-	        gpio-controller;
-	        #gpio-cells = <2>;
-	        interrupt-parent = <&gpio1>;
-	        interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
-	        wakeup-source;
-
-	        usb3-sata-sel-hog {
-	                gpio-hog;
-	                gpios = <4 0>;
-	                output-low;
-	                line-name = "usb3_sata_sel";
-	        };
-	};
-};
-
 /* Console */
 &uart2 {
         pinctrl-names = "default";
@@ -298,19 +261,6 @@ MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
 		>;
 	};
 
-	pinctrl_i2c3: i2c3grp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-	                MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                                 0x400001c2
-	        >;
-	};
-
-	pinctrl_pca9534: pca9534grp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-	        >;
-	};
-
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
-- 
2.47.3

