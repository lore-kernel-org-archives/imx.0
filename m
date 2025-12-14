Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919EF2C0284
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765710356; cv=none; b=t4xdkxaVsgQRGSZjZ+zjuNdXPCoiPdTVfe1hduQlGBwYtJtJ8zxnISMkx1O1i5KMR++OrCoHp4VROpfehni28ZQAQ8+5a97+Uys9383Wm+pxp/0LbJYy7KX+M/2Oh4CVBNgMxKo3mzPJZkSXaSEOWkojV9GuotPRgqAUTgX2TTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765710356; c=relaxed/simple;
	bh=wc1hNM9S6VyXu+UnFmmncpeycGgAm3CAAjOS0sTo/fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVV4o9V1d9Rm8FJujkcE58ZTZ3aQyoPZmyaOosiIuxp+LGRtutZ53ZZGh2XPFNSZjBTsVczt/u9xtZ3Td8PegUf3g+VDnSfLtXVLjIvzaOcnPU/LhQ5P7TfM89X6iM/kGxHF4Gku6oSrpU7Z9sY88AprncIAaRQn7EfUSABd+Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1GqvjdN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1GqvjdN"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-430f57cd471so291905f8f.0
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 03:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710352; x=1766315152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=;
        b=E1GqvjdNIJwiPxnvF4JaYwQ0zEHBSQmjuVdP/3deFaC1r299N6iGiW0Y/K0TSEt/eC
         6d4jQxKtumZNP2LBb4Y3noiM2KiKG3JyDq3mMVIlje6ZIyqPnU23Vqa0x249gb3ebLYZ
         Df/yboGc8Py3npCY4MMSbxvdtuN4mPY7Agzi/FuW0JKSNXQgWUoo4HENuqltDVwh/QiW
         ot6fJ33HNbWc/xYAIpaNE4YwNJa2g2AAINKvzEKPRiS/9U1UXGFNFg3tByQKFwbrHP0e
         xZXd+dRTPLtKrWBN0Ua0DvmB/hlcl20G4G3QuKiKfkUBsJ4bzNph8dhP5YMtS4mDZFag
         U3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710352; x=1766315152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=;
        b=NC7lYRyS1ulO/9XWQpBj5+r6M55HhJMcfDexrdXNrxNsjxP4H/rZgfjLbuqwAMCWbt
         8Od6FME3QCD+c0IMplRpfgOb4qtv4b0TgN8W6Un3CKRbfRaSoKGd0B7xohJhg1VaffAj
         Hl7yDSs2xPCRI+elxgDkEc41mpGIfY4PI+sQMeX77f/7pQgUlf6YVX4znfmBdzMFXORo
         SBjl4WU8G0TC/TvRfakh2Yhhi0NMMduOyTH5SMQ/khsvEVKyM6khydp4BCMQhA1p5Qnp
         rUiT6Ze3rZTrr6DrNQGymqzXcVe4PpAgkV6rllymmAfzUtrmQ2Gy3lhdw5fG9lzlJQzq
         KnHw==
X-Forwarded-Encrypted: i=1; AJvYcCVMm/6CePYSdi7s0KtLZ9s/oSpRygIrJq3XUxuKKGAbD0kXUThx1zdbOBz/ETwYVWtWxGQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyatpJVUwlYntXV5Wp0KD7T4S3HL2wYlHQr1ms3b9dLxZtbY3BZ
	2Yfde1Kl0uMYHVxEncGGMHclplLs0TSwqLg2ZbNUmJIsmJld/rzlkYaT
X-Gm-Gg: AY/fxX5+BOQxb3eiMtbsakMT6DDNuf6Fb1rCgs7lhKSsEe9w4MsOAMkGUZ/e6R4zZTH
	ZIdL8vvlQWtA0BDfN6nBql3WSecz0YNpzN6ksVkDoxLyUv27fSA2VRb47zfy28D2Sc1qgN+2w8A
	ZhvcVRG7FGCebnLGVCP62xCmWvsiBuan6wLZLy4qPKzoDXmhcje1aJMB6gMHK6sHsk1NwGwZF7I
	VJuuXO2f2oo4z8jzTyUQQj1YuIiqNB4JV+3iX6+IOvVh2nHMDC11ziH18YHWbWPEqXWgVkD887g
	S1xa/UmBza1VfLEEbFZMuykaoZEb2urdi6qYwuP3Kq1Qen5Ah02GOtCJznCfTNmzw95ejNtWRib
	A7jdogvWbbVg5YgKb2z3+Hd8jID1vDZVjW76Rp9bsxGa+I4SOlP7x+sJekakWof6zgTySYfO0Xk
	bmjHjLwhgblp0RNCj82quodT3MqqJfN92x54D1jMH7vPboYQVvqLkAH/DS8aESGiv86mGhcxwzW
	KBr4tz2NBVHfDjV/G+H267cPA==
X-Google-Smtp-Source: AGHT+IHRRCprU7FqKVXYLAB/iaW5bMB8tmN1SK0UGxnB0PPzYkob5dN5fLhAuRr/gkHK27KMmlRlQw==
X-Received: by 2002:a05:6000:26cf:b0:42b:3dfb:645c with SMTP id ffacd0b85a97d-42fb44a0fdamr8844593f8f.12.1765710351632;
        Sun, 14 Dec 2025 03:05:51 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:51 -0800 (PST)
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
Subject: [PATCH v3 3/6] arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
Date: Sun, 14 Dec 2025 12:05:26 +0100
Message-ID: <20251214110531.9475-4-stefano.r@variscite.com>
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

