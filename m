Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB8315D4E
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 21:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765749190; cv=none; b=gfO4rIQjlLhNqg0dgnWnNRZacoGvQ+eHf+rpwMghlKoCLwkXgDCkv8VLrJRCbn5kNZ5uiSyCwNHEGVvl84mxaNn+s7hRZGulcmFVUJq7cJUawfp1UHkRamQjPkwCyEEZrkwKsDAN4lH1S32bDbYXKvbHIggTX3foGb+cpsdLknc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765749190; c=relaxed/simple;
	bh=pHb+MbKsBipKUwGTu3kQtoRDAZWFgKIfAJmq86q5exk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TLOloY53L82YLOjLZLEBwhgSywHVbSU5p4BJp5D5IVyEE0VgR/fjH0eXGCUv9yETZlPyPosX74i1B7CPuRd0cRye7m1EDi3gKuwj2XInTt4fi12gTILrMgOw9QqV+pETxhGQXFfd8MsEHyfyXaskeioD/PzLJnV68xrsqbcH6Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnGtkzVJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnGtkzVJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47755de027eso20173735e9.0
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 13:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765749187; x=1766353987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2F5uXP1gOIQBrzq2hOBarI+Qc/GCCuzwKt4gk60y13U=;
        b=cnGtkzVJThXxvEVflUT/ydtAMugh1o+vxKly6L5IQa5MrimZPzLbHLI6U1NsTXP68C
         73xa0Un/l5jcv/XhvKUuYhtCQLc6N1+0k0rSHpd0JhslKwXtaVW6ijURSId6tgDZLJgs
         PwnGRBh1uLFbuqfjTHRZxVTKQ7GxPYmCUSwhyy4EsblCJqCfN4wOOBbqfZ5TuGTMVsu8
         RHzGL2OkBugnG7atWkK+7gvTQCPv3i2vl/OgXh8EzYSVXvoNK9bg7Wj0BTgrvxBq37EF
         R1XYqm/TZm36CqKrQmOiZ6f2EssQBjtyHvkxyHKcjz9q01v+Zly2PBkHkqOHhJ2SOfzr
         YAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749187; x=1766353987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2F5uXP1gOIQBrzq2hOBarI+Qc/GCCuzwKt4gk60y13U=;
        b=vomfBFgTs3o0FMnGaaGLCeIncFFufcYQwTwONtvha5kUOYmIuMkv2gFyLFMJiFJXGo
         QECGe1E8pxdVpbSBcjuML2FMSaWEnVG3Q7FxXzpYmbVu9sdl0mI9366hRaACwgUg5Nyf
         qavN7Pz5M8ClmBL/tsSCIJQvNADR8Oftnp1XlAYlxKEWlf2vbAgUTN7BOLi0/7CDOv7F
         UbLoWEmQFnLOQOyF903jfD6W/EM7t4hdG8xQ21Sqmfz2AzDNPsNxAdWsWeugMaz/Ae2W
         /L4EZbUD+T+w5Jk8VH2vaZPMpADP1fyK26OTHnkFAcgG8GIoaphX9KrDdVtQhPWs5Tgo
         zR0g==
X-Forwarded-Encrypted: i=1; AJvYcCX3MV+sL6JTbsKwmofXtSUqZ5vM08eb7nD+Zo3qNmrv9ao2QVfdou6rr+wuIFLx7qKFchM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHoYw27liSHN794xi+XoavQgCxfbCbd7vglnGYUYCOp9XeXCj1
	Ae90yupE0BLyd90iM4IQKrx9G+a01vFtlm/hKEI8oCZ6f5qG8kg/SQFC
X-Gm-Gg: AY/fxX5NePtgfX9U9owh2pGz6aycSeYVe4ErzOSyD/ilpDSmW9FjdlqSr8+oViolMpd
	O9vra9b/J8cadVqc231dSOCFiz5LQFTYUgNtJ698fFLgpNYRkfYvGZnRQFQSgLp+xlxj3RmbcPm
	Z08n23O02p+81UqM3/3LnC3gPur0jyGoieJcxEwnLL+P+pqal9/aQnKqXPb5xVZoPsUVfmJU9fO
	vnguWXLRsJJXt45NzUilFTrYzRYMhxyYIKSVSH+W+bwrR9dgPRZfVuahVjuvTm5QEv6ADE6bt2G
	ZWN0ie+2/scSQ+O72eBfuLxPc5HFMAPO9VOjdHvMNmZDQkxh42n7leUrzAP2PAvHMitra8ZeThi
	iuJ2lJjSYeqnp5lRPrEqDLZ5Wxfnowc0pKAYbFAJduLt201ofPwyNyZ9SllGqDbKhXbtgio8aSn
	YCpikCyFcZA5ioWkqX6Z4ZaezUhHBd0uQFDOiWeuHZJVHMDqX79u5o7RYnSQfismFKYmgcQRDfJ
	eoifD9gu/+fqLA=
X-Google-Smtp-Source: AGHT+IH5q/7aBvJPjnjOG7E6nhAeBZKXJqEYSxCBGInW+6pZRSupN9zJSXDFPB84qoKhL9ZS6X1B5g==
X-Received: by 2002:a5d:5d0e:0:b0:430:f3ab:56af with SMTP id ffacd0b85a97d-430f3ab5950mr5281059f8f.48.1765749186695;
        Sun, 14 Dec 2025 13:53:06 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6a42c8csm7625568f8f.16.2025.12.14.13.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:53:06 -0800 (PST)
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
Subject: [PATCH v4 4/6] arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
Date: Sun, 14 Dec 2025 22:52:51 +0100
Message-ID: <20251214215256.5812-5-stefano.r@variscite.com>
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

Add device tree nodes for the WiFi and Bluetooth module mounted on the
VAR-SOM-MX8MP. The module can be based on either the NXP IW612 or IW611
chipset, depending on the configuration chosen by the customer.

Regardless of the chipset used, WiFi communicates over SDIO and Bluetooth
over UART.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 5bba91dcef17..2c49d53e30c3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -21,6 +21,14 @@ memory@40000000 {
 		      <0x1 0x00000000 0 0xc0000000>;
 	};
 
+	iw61x_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 19 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+
 	reg_phy_supply: regulator-phy-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "phy-supply";
@@ -202,6 +210,33 @@ ldo5: LDO5 {
 	};
 };
 
+/* BT */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>, <&pinctrl_bluetooth>;
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+/* WIFI */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
+	bus-width = <4>;
+	non-removable;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&iw61x_pwrseq>;
+	status = "okay";
+};
+
 /* eMMC */
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -222,6 +257,14 @@ &wdog1 {
 
 &iomuxc {
 
+	pinctrl_bluetooth: bluetoothgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA7__GPIO2_IO09                              0xc0
+			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04                             0xc0
+			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10                            0xc0
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
@@ -256,6 +299,48 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX                          0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX                          0x140
+			MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS                         0x140
+			MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS                          0x140
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK                                0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD                                0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0                            0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1                            0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2                            0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3                            0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK                                0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD                                0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0                            0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1                            0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2                            0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3                            0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK                                0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD                                0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0                            0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1                            0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2                            0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3                            0x1d6
+		>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x190
@@ -309,4 +394,11 @@ pinctrl_wdog: wdoggrp {
 			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B				0xc6
 		>;
 	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA6__GPIO2_IO08                              0xc0
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19                            0xc0
+		>;
+	};
 };
-- 
2.47.3

