Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE6C42379E
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330499; cv=none; b=gQ0utSuRUFluaGVYoMR/wWBEgMHUNcOo5h4GqT8p5F8yhQWoFnGy9wWBWud5F8yzRiP3zXwtVuj/lLAb1O5HzA4tdsk2oRgEt5ZjwvvwBsgZOlvj3RnsoplKdc/3HyK2Oo58OBr0lVW/u+N8vOsP3ipfbWlTSAbHICSvj/RbuAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330499; c=relaxed/simple;
	bh=s1b85dfFlAL0eE5Yh1EwpDIDzYsRBzlv69PhXJs52NI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X9oSatFsx8Twq9gIAK5HNt4+diUvdAVVkOEl2dumDA+ftHKW3h/FS/UszCQABN4WShKxPHcTo3qqi2Yit6zX5sLx08eO0yxDeQZKISjxFI4+FkGSbGS+0IOZ4oPGnqr2xG65Qvw41PPX8uAJsxp2dsOCSYHVXSAv9olcEBCvyJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5v7B2pL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5v7B2pL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b786d6c0so14481285e9.2
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330493; x=1783935293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUpg6nprLTQtDmr0JCbtYl25aUYHPLojLHdCAqa+ibw=;
        b=W5v7B2pLmIGNuenR7+pZYayAHBQ3NrofKN0/APidZ9t+CF2x4ASI/dXQ8XBpX7852L
         Y0QKVIdmNOGf6KFHG5X9i6mAciA5DjdD/ZS/FOi9K7u0mMBy0mDpY/R3oZNtLYnSLFB5
         0Xt9G9+7FriLMC1ss6nEhRF8X6o8gd3mE4d8GqAuea4g5aOFmIbxTuLN+jjJD1e/x8HK
         hgJzjFBnpj4OQa2oRS1iYBZbVFspqIiavDeZG9zvVTrAQ5XNitwJhiZgx7BU5CYZmzMd
         khIFBXzh6EjzWwye1+Zs8o2kZZfl1JjiZzl1ZOs2sAe9F8LMAE8+kRM2nsjmQNtCOAPj
         6/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330493; x=1783935293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QUpg6nprLTQtDmr0JCbtYl25aUYHPLojLHdCAqa+ibw=;
        b=nMdZKbkNZzFuLkaNBJikIq5A45fRI6Aty1bIsb7PVM1T8zWauQ7T0MbguSNsBlok7A
         CMsxRjAYJZ6rfCeyZJZuIhg6p33P9YNPfoj6NRrmRrMMqO0ITl6/d6lYKIlDMd5A9DiB
         xRNe4uzaMie85OEFrlTKOQ3BhSD5vgqZnLff9d1MCmbJHY2Ivwb+eQ8RjkAh/mPvAn5I
         C/sxBWqKccJpbE1SRdfd/zQIPhKHZ6cJJtTF6reEt6J1JxrGStT00MC4Afp0MNl0OoOj
         lSxzEBnAVSKX2yzrbwvQGPvsOMHqz6d2E4AcPaX93E38ODOMp0ue7Z5XAwv6BQMIUwT7
         t8mg==
X-Forwarded-Encrypted: i=1; AHgh+RovRuL2fZf9beF4XVrKFhCZAAbAdx+J/E9CNaNBPl+0c8tE+1REf5rJx6MrWR4I2PuOb4g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yytqc7nOyl6URwI5sirp/sqemc6nG5rTiSlBjmJeGJ/ZxPp3/73
	+4N+9HGcBhwyAbYHdj0fLwC3+JgMNVA7yEMVHU981bG2XuWE5ngBP886
X-Gm-Gg: AfdE7ckN6fIUlGstuiFmMYXkVZOScRzKtrMg5qPBaRz7KYpREzuVe0ne7IZBBT7beEB
	jwkD7JhGg/I/EH/naVoIsPXKsR0P1s976PZH7n2AmKL0L7cltzo1pHIrkXirmqwgX/WgTzPExKd
	GljaFFnWn+3JjBKcLIxkDZfTMa7QhPiccyhPq8cUpNjFy1R9Acz6ZZELX4EcdBamsGYMLCPzzdW
	8LW4eQjXRl1UBW/aTfE3ieXErLhnC93viDN6Ix32hpKgG+AT3aGIVkLZaUg7377UHFJ3EFaD7X6
	LfZk9mLDo57BwlOJb6LNd/+aAeNs1sGVT0SoW1W/KgcXlXdvvM8SfjdRoBCgEJNz0AAucr5Bizh
	NhO3T7XxbDcmx4eA3P7RM2NIT9O6aiyQU2kWOjYaETB8dKUz5DhokxLEBdmFseiHB7jnXzbiyN8
	sDbkM3mSbzU4s9IL50P8X5umvF0JMg4QbJwJwIDnPwBEVm9F7ZjwHEt7u2mcxkceIJil5V9NwVF
	zNFqpK2JsRkN0PBY7/MZtAKsA==
X-Received: by 2002:a05:600c:8411:b0:493:a976:5c6e with SMTP id 5b1f17b1804b1-493d11def4cmr100457575e9.16.1783330492952;
        Mon, 06 Jul 2026 02:34:52 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:52 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 02/15] arm64: dts: freescale: imx8mn-var-som: move uSD support to carrier boards
Date: Mon,  6 Jul 2026 11:34:32 +0200
Message-ID: <40a2d0d32bf3447f833149eb4e71365c4515743c.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN module does not provide an onboard SD card slot.
USDHC2 is routed to the SD card slot on the carrier boards.

Move the USDHC2 node and pinctrl configuration from the SOM device tree
to imx8mn-var-som-symphony.dts and imx8mn-rve-gateway.dts, keeping the
SOM dtsi limited to hardware present on the module itself.

Add the required off-on-delay-us property for the USDHC2 regulator on
the Symphony carrier board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Update all the carrier boards and not only the symphony

 .../boot/dts/freescale/imx8mn-rve-gateway.dts | 47 ++++++++++++++-
 .../dts/freescale/imx8mn-var-som-symphony.dts | 57 +++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 56 ------------------
 3 files changed, 102 insertions(+), 58 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts b/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts
index ea1855171fb0..056ea2f9e963 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts
@@ -207,8 +207,16 @@ &usbotg1 {
 
 /* SD interface on expansion connector. */
 &usdhc2 {
-	vmmc-supply = <&reg_3p3v>;
+	assigned-clocks = <&clk IMX8MN_CLK_USDHC2>;
+	assigned-clock-rates = <200000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
 	cd-gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_3p3v>;
+	status = "okay";
 };
 
 &iomuxc {
@@ -276,10 +284,45 @@ MX8MN_IOMUXC_SAI5_RXD0_GPIO3_IO21	0x00000156 /* B */
 		>;
 	};
 
-	/* Override Card Detect function GPIO value (GPIO1_IO10) from SOM: */
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x41
 		>;
 	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index b07e71d3adee..7308613a48b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -28,6 +28,7 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		regulator-max-microvolt = <3300000>;
 		gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		off-on-delay-us = <20000>;
 	};
 
 	gpio-keys {
@@ -200,6 +201,20 @@ usb1_drd_sw: endpoint {
 	};
 };
 
+/* SD */
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MN_CLK_USDHC2>;
+	assigned-clock-rates = <200000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_captouch: captouchgrp {
 		fsl,pins = <
@@ -252,4 +267,46 @@ MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
 			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x41
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 32f101ef2850..e1d2e2a72e1f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -295,20 +295,6 @@ brcmf: wifi@1 {
 	};
 };
 
-/* SD */
-&usdhc2 {
-	assigned-clocks = <&clk IMX8MN_CLK_USDHC2>;
-	assigned-clock-rates = <200000000>;
-	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
-	cd-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
-	bus-width = <4>;
-	vmmc-supply = <&reg_usdhc2_vmmc>;
-	status = "okay";
-};
-
 /* eMMC */
 &usdhc3 {
 	assigned-clocks = <&clk IMX8MN_CLK_USDHC3_ROOT>;
@@ -454,48 +440,6 @@ MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d6
 		>;
 	};
 
-	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
-		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x41
-		>;
-	};
-
-	pinctrl_usdhc2: usdhc2grp {
-		fsl,pins = <
-			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
-			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
-			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
-			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
-			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
-			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
-			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
-	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-		fsl,pins = <
-			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
-			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
-			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
-			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
-			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
-			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
-			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
-	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
-		fsl,pins = <
-			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
-			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
-			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
-			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
-			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
-			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
-			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
-- 
2.47.3

