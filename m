Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED632F83A2
	for <imx@lists.linux.dev>; Sat, 13 Dec 2025 23:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765667375; cv=none; b=HjUIhwhYLqj6To+zyr2BATEQOJHhwH2Snenqmt7VuWrZupL8oa1qhFiSekTlhzwZ85dCiMbNLZDfD5eJpczHS65pElK7IrX4TsXUpE29LixMupRpBOgNR+fWMUlBMGTUGb5xCaqxoGk2swqGYAGKaEaUR7nOg19xHMJVPdvR7X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765667375; c=relaxed/simple;
	bh=wc1hNM9S6VyXu+UnFmmncpeycGgAm3CAAjOS0sTo/fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=canccJv3wqozSEBeakNhLDmAYnZdOc4CsSdNH6fs+P/2z+S1N1+LjwLqlCMfG61ATEV79xzcGeQ1F/Xzj9r+Pv37nIOj8z1JcxcS83NvYWkI5gBtRuUeoA3BsprUE6lFxJcNk1/b7D/d3QsTDZn445EDJT4qdNZfuvVbJIaq++o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfJ+jO82; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfJ+jO82"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso5732465e9.2
        for <imx@lists.linux.dev>; Sat, 13 Dec 2025 15:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765667372; x=1766272172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=;
        b=dfJ+jO82BwW4/NpqGCSymtqfRdfZkJEMH4/QbD4bh3L04mQGB7xEUNyZFr2Q4dwqRv
         bd/us2ccVrhzWANPJjR/96ax9WKzIMpCC1IHxVcFC2QE38x2cFkLkTc7szEGpctRh4OW
         kOsbfDIHVg3d3CP4YKPP3re+YCq6DT54xDKzkDxNu6ynOSyi1rrY2stZv1NzwTdggEmY
         DqM2SxrltBkhLZkGrMrH4+dlSzMs54My/hzrll5dZ7XaxhZ1Z2RY169lbel+nzgkMQpu
         IKapHbfkMtUI5IEKqw2oi47hxcntZqh36LTNix8pUissNOm6KwosV2GRXAf4Z0JGndqJ
         kXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765667372; x=1766272172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=;
        b=veTEydbROWVTXzxeOMDZDjNF7vHCbXvrAMNs32Y5Bp5rD/aJBufROUbaXYuxcojwH4
         3lknp446iXzHJBZK/qful6qcQUO8UW7MF8SsXW0KH9aZ59QOAEbRlm2kCsXbKuVQsBSm
         ei8xwwrkQGezS8YUf1fY2uiB7ycEB/v8O99Kon/mxRmBRarW3wT/2VNl3Q1NZHTT8tjr
         K1lJ8Zo83PWevUAVIrV290pt8YZXL6lGsraoIzDDEwb20RiWiflNs8lpdUobTh1ITmaS
         Z/Vz/V07F0VnrD92+zpVClhCIOK0znGaasvhE0xuSAC63wxlqUi23Jhh4kFUuGV42Zne
         unWA==
X-Forwarded-Encrypted: i=1; AJvYcCXUIoTgoc1W/NoMmUNBTxO5qMx4W7OwocBW9QFIF/R7q/MLpAhtTHEHRTm1qe81MFdiCEI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxorjLdpUv5WqU+1EO+ZI8kEpXhIkmLfiIz6rnJO4pPivq96Dv
	iUmhDQwWxRAMexSPh7jLrO3v6fkL//3NwHlbkf16HRWF3cHI3R7z/o4T
X-Gm-Gg: AY/fxX7o7ZP3XW4lUEQWFEzO5VqCR3imHcni6sRHvLeLL6goLIHaWoMGaGbmJtgr2ce
	SNCgWDO0l39bF3gN2AnNWsMTSTXKsozLzqamDygT53BidjeOMVzqN1B424O4SjJzDoCI7WLD9g/
	eF7QpRdCdU0qrQKbiDd1M/XESVh2ellXECsMslBUJi9vuuQMETyhyjNBPsDnxjiCWZIqs42uCMd
	Lbc8/bd1ckhL7rx7+I6ivXaY/Px+tFC1ddB2aL20rUiXZK2j7U0QhLb7Ol3Fvtqp5gCrdDSstJ6
	34+syMpqGuqH8srVVWimBN/+VCY3Fp/BRRJJl22C/7lnlGmB5GaFSl9CJEikmTJY2hGufgRYHJR
	DVC9lmSPCvABs5wjkv1gckaqXEHemGt4hsG5KEBuadRAhf+Bh/pvCXLEMHsDZWIVotHD7Ik84hH
	KorsDwRqxoMQDRUKPxWGyGhD/fzcKotMzOBT46t79pQg+v1uyZmlR2v6bKokI2qcae12jdxKukl
	6WIvNrUMRY3aRI=
X-Google-Smtp-Source: AGHT+IEuZVWIoOyBxLuO48JvlC/oup4uLYj7VhSXl/tQFEXAA4+Lht97mT0YBRv8y//K617sSM8eUQ==
X-Received: by 2002:a05:600c:8b62:b0:477:abea:901c with SMTP id 5b1f17b1804b1-47a953da53fmr30130495e9.11.1765667371709;
        Sat, 13 Dec 2025 15:09:31 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm106040995e9.11.2025.12.13.15.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 15:09:31 -0800 (PST)
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
Subject: [PATCH v2 3/6] arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
Date: Sun, 14 Dec 2025 00:09:03 +0100
Message-ID: <20251213230909.16810-4-stefano.r@variscite.com>
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

The VAR-SOM-MX8MP module does not provide an onboard debug console.
UART2 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART2 node from the SOM device tree to the
imx8mp-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 361e6122bdc3..291f65e36865 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -9,6 +9,10 @@ / {
 	model = "Variscite VAR-SOM-MX8M-PLUS on Symphony-Board";
 	compatible = "variscite,var-som-mx8mp-symphony", "variscite,var-som-mx8mp", "fsl,imx8mp";
 
+	chosen {
+		stdout-path = &uart2;
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -68,6 +72,13 @@ usb3-sata-sel-hog {
 	};
 };
 
+/* Console */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
 /* SD-card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -95,6 +106,13 @@ MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
 		>;
 	};
 
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 158a78ec9656..5bba91dcef17 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -15,10 +15,6 @@
 / {
 	model = "Variscite VAR-SOM-MX8M Plus module";
 
-	chosen {
-		stdout-path = &uart2;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0xc0000000>,
@@ -206,13 +202,6 @@ ldo5: LDO5 {
 	};
 };
 
-/* Console */
-&uart2 {
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_uart2>;
-        status = "okay";
-};
-
 /* eMMC */
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -267,13 +256,6 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
-	pinctrl_uart2: uart2grp {
-	        fsl,pins = <
-		        MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
-			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
-		>;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x190
-- 
2.47.3

