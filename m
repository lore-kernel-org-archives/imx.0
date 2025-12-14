Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF0E316193
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 21:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765749188; cv=none; b=T3SM9+esTEVNc/Bkk8FTyPGUc43gVYr75x4JZV0oFtRFCbDxmVBZrOywn2V/Xu+zr0sG4I2R2hIzadsY/LAd25HIg7WpU3ElZlkdESWsjX/uCn7DKXCNynTTxHHPolrPnlXgh8dBDOx7Fb9QO7aFWkIw1DH2P77+3eGV3r6pXNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765749188; c=relaxed/simple;
	bh=wc1hNM9S6VyXu+UnFmmncpeycGgAm3CAAjOS0sTo/fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xyzw8R5MuPuCuLCMXB+ja9dq59QAmiyDsxgcWvF6A2HlJ2/rWFKM7d9/F4AoOH9nh0T4wTJym3Q7+jYIAlSP7xsRZq2GSvNs2Qz6skhJ7k6TUPnnZdwn6faoVkNBZiKgbNgzuV2N0dYWY8gQLoea0gxQlBF3CmB+Yc1HxujynA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URO72zXR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URO72zXR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47789cd2083so14597595e9.2
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 13:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765749185; x=1766353985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=;
        b=URO72zXRA4lUtXJ5zBJngjSukqO/ZuH72lu05vdE6lCqJnrFBcPgdUZprhZnc33cSs
         368Zf7FnRukVna8Yla1NFazUXjj5tzHALb45Uk4jK2VDfNMBocbZqDKH2jZgCM39dADa
         69uKYbI3394BpMOHdgM3PkAZYFZ/6iNlArl1ZZ9ly6e2kV3XoYdQyRMx8aDYjS3Es3Ah
         h6ZpRriFL/up27zewixBcodCploPZDlg2JmLXmsiXpoZgrBSmZpCxvFi9ozdLMLN/+xR
         sD1ukzT4mNmXd+YIIjte9rg6u6bjh1Kn4Njm3Mm2rcz5Gw/aLfy5roDmUMX4iTnfZ39G
         1yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749185; x=1766353985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=;
        b=I2iQVqZfgN7t3uJQruh10Tj6CHsdZZ6NKD8JVSjICiatsT0IxlFq4GQVS5V+Wk6vwU
         zxyS2IVNeu3aU9PEoyrKUgdAYfXwEEQ7kBpZwL4yvVnG0Tl/V6RJw+05eMLu4ziRL0Sc
         zb6cQAPKEFpQfYVBewFpkD0PqfxgohOnkuPmwJMwHpxc49VkAZdDVeYH4/7xSdhnT3FD
         xg6KIbS8v0fBSp5VVqKUZ6mr3dF16O1lPEMAmie+XNBAG4VQsnyGZMl+2uq49R/gVS9k
         6Wz5uUWuDdM1aHucBktrO4ewY1SMOfG3WEH7oghqENVZi9vy2wjI1hZnF/PI9BEIIAuc
         QO5w==
X-Forwarded-Encrypted: i=1; AJvYcCVgRR97+ifvHS1o5bgDBxqSpc8DNjNFVLl7YNfgBqkXC+X+ZS7fNzANgRI0Ec7O3Wcxq1c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpwOHpiRDCCKoDGIiV9sk+8Fr8rFphKhXuRI7jRxf3Mm7Y79hm
	rtIBOMLHgrelV38vHKs3VHJM896EFNym0VU0PrPFdWyzh9sy88CUdNOp
X-Gm-Gg: AY/fxX5RWuXEqb5ItPt+powzs6nrENqgvRSEiQ3RqrZUpac1ULfkl3Ir2jOj6JOE+/9
	0ftjKm+ibOYMKoveSmt4h7E2e8dbOL5ZXz4EzBp9kTtd1deA7A4W5E39S6DfoYYopj91n+cz/S+
	irfQbA6vz4vAj+Y0oewJwce+7dw0AT3j5iADiqwLvZXKstQhZOQ5Yprfs1JG4DYRgm+P3Xb7DJU
	4IpoatkgyOcR+EG6aZ0FWs0cw9uyUohL7Ym1mEjqrvV0P0M+nnRXfuFBlO0lQywSNg+zkNoL1BG
	bg88GF1pXUMtAbWaEnOdjwOQ9yKe8Q+MJO5xECTZ/ypPi5jioV5mvjgk1/ZNKzt5wxrY8wEfEZ3
	C9GlnMUkkG1JVEcJl1yBWktQ3MoFZtydlwoC6OChgtUdMalE/9SrUwwN+GBX5z/EVMQ0LkW2hYo
	6HHkkFhB5q3wkG4tfaZgTnHi+RJfj8ZRR9j9zoJ5+7rjHyYX8RzDT6ZX9Tq0uFDm28ONDFqk/qA
	OxElbi3bIY2Rc0=
X-Google-Smtp-Source: AGHT+IFUiPfYqnPKnFAbb7dTQ9/Zlq66KzQosb/pDW7TXkp0BLQndAEW5/VGYv+cRcJO8L2g0Ou2XA==
X-Received: by 2002:a05:6000:2411:b0:42b:2fb5:73c9 with SMTP id ffacd0b85a97d-42fb48e870emr9116098f8f.58.1765749184691;
        Sun, 14 Dec 2025 13:53:04 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6a42c8csm7625568f8f.16.2025.12.14.13.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:53:03 -0800 (PST)
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
Subject: [PATCH v4 3/6] arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
Date: Sun, 14 Dec 2025 22:52:50 +0100
Message-ID: <20251214215256.5812-4-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214215256.5812-1-stefano.r@variscite.com>
References: <20251214215256.5812-1-stefano.r@variscite.com>
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

