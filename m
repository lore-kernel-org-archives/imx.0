Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF232EE5F4
	for <imx@lists.linux.dev>; Sat, 13 Dec 2025 23:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765667377; cv=none; b=iahNR7xpTQFT5FLGu0PCCAhNtXsEORpwsPwPWnKF5tuWpfCaxutQqe7MuzULYa0BUF4Kw+Dii8pjhCfh1X1+ojI0C5Za0WV587+NXKW//eLnkZfj708X0F5P0nx0fxauKgSjaoxlT4f7Wv+9/on2SoVWXeh8f9Fy0pq7X15H6BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765667377; c=relaxed/simple;
	bh=U2v18UmYXyxRxgSLu2UXhhvB7Fp9+l3tnd1CGMr8Mmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DB3PFQSUnUlgF9khGy5TvISKsehRC3l2xIX7rEOrNL6bPhHtA04ySoWxNSkiJvAMFgUsBuSxomCE9gl32cPx0UQhfVecelN1cFkwKBFL5QqFx0/57vG1PLgq04A3Kvrz4skTqYdfX15U01a18HWkA8fxocCLohd40zgpDb4+YMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T04lGJ3E; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T04lGJ3E"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so26588805e9.2
        for <imx@lists.linux.dev>; Sat, 13 Dec 2025 15:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765667373; x=1766272173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLiAHdwLrrTtAb7WXEO2B+WkLRD0WKuXCR00+TEvVdI=;
        b=T04lGJ3E9kxBUZF32EVMcbbsYUU44kfy0i3qTd92nwlEksm1J5cjo2b93wdKiKC9UP
         yEU0/yQGNSdaaqSC5aKIgMRRCUSEk5cbkCxWbL1OwqiHTgvYDDRcwBwD7FtKg+pI2f9b
         FAQKPkcZpjTJPCqxf70787Gh68VhakMAuH5f7NUKmDKnDdlif/KXwnoFVQlchLumNwE7
         xmXV9SYU2OBMhKabdS0II9KE33XYjy6MEAHTY3l7mYgBh/17bEdPNG2olVa276adlSIZ
         l7DzQQRIkJipJ5gTl6S1n9eiboe08G6lEoKh3lipxscx9xu3m77UKNMyEmC4eETV7oGu
         nG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765667373; x=1766272173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iLiAHdwLrrTtAb7WXEO2B+WkLRD0WKuXCR00+TEvVdI=;
        b=Mbj7y0x5wr2HBWxY8tFrWnbC1PjxxfTA7lZbMGPWfbMfA7VvJSVdl1PL02id8HlBHz
         LTLQdqq1EEW6Zd1aYRuYgWZjZ5hasiuXxlkxDZcCpNTmTRbMW7NXKh7OSoizkh2l2WZ0
         uwcN3MCRhguLxV/zHzVYsniY/eM6QbuowWUEKsBehwud+y2wgQBlOnKwRlfWAJSXM+QH
         cqHmswd/Lv67zDAZJUnOtILclRhOgh866Bz6SsqpT26rX/4j2KCP1ZjJ3MnmDd55C5Bq
         ay2JeGxvJddlFpTXiQRtAAQH6EmsWqHsHyjALRdQqR8iCgm/lNiwXH71O9D2zkyhqa+l
         CEsg==
X-Forwarded-Encrypted: i=1; AJvYcCVdQBhFKQoPyK0axs1INgJS1JtEHjwDrd1ubTTbVcaXLjAzNKNFITIFaKFWCHPFMNqbeK0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvUlRl/inAj0QYYYI9VSscqFWCIL8A7yvsEUXjhVkRMsweBLhA
	oHHaWn1WJVEaY19mMpwcdk1V2fXFp2e1NKe+aNrMAZafp9a+mzoI5Wr8
X-Gm-Gg: AY/fxX62gVaojcxWYNmtMcxEn8WC6rk6RAqDbQk6/nXRg6R9CzXJb4x1qJ7Xykk8oiD
	YM3n4EAWziXOYX1Ug3asnTVQhTBLIuj8eu9enE9D6C0nde2Zn610aslPubkWEZB6TC203UBPVHR
	eeOzeRt/tUwyMxr1LDugwdrTxAZqL4WiZZAAn5dmMeo5aF4nM/uN5azWJLbv+lPu0Etq5LycuxP
	E2Z9gAShr476oVTdklDFVRJNWEdTIkYlLmc7hab5QsOmt2Iz9Zh6cvIs+sYNeKWYfuIilJdshff
	haIWNhFu9Gb1demVb29X891QxSmhvYb+vN4EFjN+jmYaO7AW0kYeVkGgMmSLbzMuu8g4cfYEkXj
	FMC5XBVT/4Cv7YNXzTZ1Fr7YTf+3N5IlfPyTZVrmLWp0JsDrhAzvTlq7+MaRYF71RxwtwUBOedO
	0ddHP2Q8yM/s2LuDZnU5/IteaPzAcJ53c0zED7ugUZ1CmDrxRDZzbcsDhBvxTVR9DLX6BSfgUKy
	GEtMDSpZfETack=
X-Google-Smtp-Source: AGHT+IH6niwXjGSgeBp3K1O2l+qN5cvu2ukCARvoS/8//WHx6xKUmx0WGHddFj4pGChWigbfy7f/Wg==
X-Received: by 2002:a05:600d:7:b0:475:dd7f:f6cd with SMTP id 5b1f17b1804b1-47a932e5731mr43201845e9.35.1765667373091;
        Sat, 13 Dec 2025 15:09:33 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm106040995e9.11.2025.12.13.15.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 15:09:32 -0800 (PST)
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
Subject: [PATCH v2 4/6] arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
Date: Sun, 14 Dec 2025 00:09:04 +0100
Message-ID: <20251213230909.16810-5-stefano.r@variscite.com>
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

Add device tree nodes for the WiFi and Bluetooth module mounted on the
VAR-SOM-MX8MP. The module can be based on either the NXP IW612 or IW611
chipset, depending on the configuration chosen by the customer.

Regardless of the chipset used, WiFi communicates over SDIO and Bluetooth
over UART.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 5bba91dcef17..e7f5ec10cbac 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -21,6 +21,15 @@ memory@40000000 {
 		      <0x1 0x00000000 0 0xc0000000>;
 	};
 
+	iw61x_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 19 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+		status = "okay";
+	};
+
 	reg_phy_supply: regulator-phy-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "phy-supply";
@@ -202,6 +211,33 @@ ldo5: LDO5 {
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
@@ -222,6 +258,14 @@ &wdog1 {
 
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
@@ -256,6 +300,48 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
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
@@ -309,4 +395,11 @@ pinctrl_wdog: wdoggrp {
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

