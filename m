Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED212BEFF1
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765710355; cv=none; b=Y2gF86IROmDGKfTSmtdB4I9ey3Pr5W90j2pcIrpGW3YA4Wfl5mq//ErvqsT3gUFvDFXO00MRYNeWoU3Dd/PmHtHEfU/wpkxejb3FwpQj0xwXLMZPp3YFEdhpWiRcQ7LtplUT6bjyMQq5i/SdMFGFIVKYiSrybSSg62HQeBHe3hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765710355; c=relaxed/simple;
	bh=uYZSnZuRrwJRAmm9rMjS2CEsXeIqm8YEwy7l+zm6we8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edF6aZEBrIHtDf4hZO/zIykBHuFgD6YgUDs+slBuSlLLJOhIPZEE0AuYFuhraEA/ZqHdcR3LKLaf41pjDiOLtx1PJ/m7WozGJyAntNU3oVfqvsFPArY5y/lVdG1h+cflvNsLqEmFikMmUyCxCechwjKbErJvOsYLmRDs+lVZyoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEfBGZ1l; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEfBGZ1l"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so269809f8f.3
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 03:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710350; x=1766315150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=;
        b=aEfBGZ1lGNKwHSNBSXWQJWumnRL6xvgAoby5BSTUhyRi4YpPuevMkF+9/tYEPyVtf5
         oBFnr9wnnczfCtlZ/U0Ppb0jm749lqQCQjBkclTMN0756WNZy4UhewsYmQxvG8kUcjhX
         9PBs5FRMP6TVMDdG5oYtYnWiBf3RJ5tSnLwXL5qqmXmhMfaDfaYF0F2ucDqlyHxV8406
         s/exjA9x0dOe3AsSqD8UOBMzHdC0jxH0LJEoJUq0WXvVEPiP1I1rTGRsidM89RDFNSsc
         btEk+LB8f5Wd+MNxfOPTvX2QtB2tsgK/NoO4wHyHj89O9SwTHPOiaF4mlBnUaxI1GYa7
         1TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710350; x=1766315150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=;
        b=tV09HBLgYRf9WnZc4DAk3qT78ya7r+9Dufu2B0VMgEk4y2y2PTFAucz/5jZNytRi2H
         uXXh0jBSXvXnibiep1o7og5qwL+kw1guHkKULmSGzOf1mZDJ9HiVzf/rSKKOgXi5s/Z/
         gXdWpum4UB+YEsxSoUR/mAWUpN0Jm90+ZNfFFa9by2AjxvdznwUdjFZwbD7DQXYcERKs
         waIxPruKkN0eh5kDpIM4pyN2eiyh7ceJf00AzovUBfLeUTtsiLky4vctuZG8O+XpR5OX
         SAy4yAwY1i5l56pP9q7Jv9JFHylSz89GwREHIbMla7XGOayDzcP6f13PlMs1WpO5Lvx4
         pcpw==
X-Forwarded-Encrypted: i=1; AJvYcCXc8yAQ6TGGIwHeIzQ7V9Mw3jqEbIAhNtBXWig26bgNn3WpReZJLEl8MfrQpOSlGFeA6Ms=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1FRsVv3jm5z+dPDuY5KVr9L2fS1YgvF/+4KAkuTZ8TxZ9vhA5
	1kILZPH7BPFtl1+DGUfqcKQmQJMV2L/le/5/VsRerdH2fSDlRKA3KcBk
X-Gm-Gg: AY/fxX7tpg01X9C5E91Gb5E/eJb8GAlL3fq1kbFJyZ6FGgyznPWG0Jady5391eo2q50
	mSbRfim1lRrUhUnmTwz/ZRBlDaSBKFFwzMaA3mCcG4AeSsZ/PCsoDIvGf0QbnMFBudkYeKpwFV5
	xoi8v3PLLkeSLdPptqwVmdemcZ9oA03fFuxJ4JDcaV3ZZWsGUzcpI9dGyJu4XlhcMVDC/GLW2Sn
	ALX6k6O+5EMnYWlc7CMGYXHdBLFIqs8DJ7w+c/yh0lVk1Cg3O1lFtHi8J7Wm3lVNheNlvADj/ot
	qiBuJy0dZsBVmL9lhNXWXiJo3QnFM3h/mfxNlxt81JUnjpSe9/ietUtzG8JKAinTei4MFIxY+8J
	+kfE3UmAKaSYCq6NtQo+2UV8H0/PaEMtYY1lWakpIXp62254tF44G89Vt5wEFSfyopfa0kSF7bO
	Elgk0ZshQIheaheqk7WCGf8G/G36dXwHma8t1PRkIcU3gyicHNK+Ib4mIUJtliUCzCEfL5afVXH
	zBwy/qGeVPj7vM=
X-Google-Smtp-Source: AGHT+IHBNPTTgk+ZY0LSAwyjZh4NsXuPGDMKLr7V1eirb7wDZS7diFfCXYns/WQowcG2+dA8ESJLgw==
X-Received: by 2002:a05:6000:2505:b0:42f:b3b9:8732 with SMTP id ffacd0b85a97d-42fb46e3070mr8331041f8f.40.1765710350339;
        Sun, 14 Dec 2025 03:05:50 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:50 -0800 (PST)
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
Subject: [PATCH v3 2/6] arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony carrier
Date: Sun, 14 Dec 2025 12:05:25 +0100
Message-ID: <20251214110531.9475-3-stefano.r@variscite.com>
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

