Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4B72C0279
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 11:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765710357; cv=none; b=f6At4XZz+b2LU18jPY737RupacoYqJZjzac/kUKdMIAfhGqQwF1MsA4elMA9hxvM+5SCZy6AeyxzBaHxoTsuL979lFBB3CszF4HV05V1CVWGc7PgdSOwdIMruPrTTUDV9nQYLY0lGD0Kd9s8WRjHAvmJtbDkAGK3eHzkWFj/E3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765710357; c=relaxed/simple;
	bh=pHb+MbKsBipKUwGTu3kQtoRDAZWFgKIfAJmq86q5exk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ux9MYlQLlY2+WEtkbYDDGrMSs92MgMQykapH8MwTOP04xfa3Eblks7L2FGriJcYMjSP1Qs3hQ42qHtMqrz2VFgPVSK7JfjAy67Ne2mH2gvk8xUOkw9YRjM/Zn+gnuU5OcMLQPByqpG1mroL5jM76QLTasRhyyplLis9Uw8KS3ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjzvU+90; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjzvU+90"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42e2d52c24dso1310625f8f.1
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 03:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710353; x=1766315153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2F5uXP1gOIQBrzq2hOBarI+Qc/GCCuzwKt4gk60y13U=;
        b=UjzvU+90H/xFoyIMpxvPK7zOMOrsODThKUefvSyeXPm1M3BnqaTp6SgnJV7Z3llLjP
         kwnfT9gis4KBBCAsq6n2c4qM52uBL5kLgBEKjZEb6aqX4o1v6HXYP84HHgd7ZRusY1Ev
         ViYnX3MW4VTxJnl4s1LqsrPORonIcGal8+P4Dn2Af+5cGtf9n0Jl37Ofs40L0dj3ixu1
         beA2bFbQUA6AnpNDwr2e/PkDzqobwg/qK6ZxAo2m1tEA+aP4kKeB3e09zzMdFfHEUrXk
         aKcfqPwm0SqiEEdIW6d0N6Z8ZL6WnXdl9/WJ5lFPI4QPgMAX4151ajVjPef3J0TeMfdx
         6SUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710353; x=1766315153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2F5uXP1gOIQBrzq2hOBarI+Qc/GCCuzwKt4gk60y13U=;
        b=BzCe6LEKEasM7HHZ5C/nBnAv22njahHef58DgxxYqkWtmSy70m3tXDE7kLtFL/ArW7
         hC7Ti7aocEiUfm5I6X1NONodBtAMqgzbrN558S+JTj+mht6pzdOuIdQR18knU6cBdNnW
         aHP96aYmgGVEwnf7Lmlp6Jl70ygHtu3SpHSwvvXpyqaEwAftiPvg+va4soSRQSJsBxXF
         IGBxQPTEgNFQ16oPQ73J5O+KrvPy42UMNXpyweH1hvqYTaTWNL+WSP5cKSgtp/YyhlKp
         ABr+D53hXv9gSov9xcUZe/NVF80TgxNa8daH96N8f6cjTnzr2CY97nVzels2sSXyh1TP
         8lXw==
X-Forwarded-Encrypted: i=1; AJvYcCXswP86pwWBRFkQ0qzXVX2MGwLQgajg7kzBHpX7hPc+WU2KhkQiIh/sa5VmQ3EBJMeq9zI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe5SgIYauNt3T3wfXktsa4zo/Z3aB2Ebfjj7OSXQRl7AVLJz3g
	sKOeeT0l2iQDm7Muvw2EFWm7pIeslnY0bM9TO8XYPhWjA1Vj/gINkH6L
X-Gm-Gg: AY/fxX4FJMYsGHq0EBVWGxBcBHcxxbKTnQrP021Uiua2O3gbNiydl6HQidTDG4hG5AE
	waS9jQaFhlOIgGK5WBxfrdy/P50U5F0He6HQ4xE/pcYw67FsRlKkJSIkOfijdhyU/hvZMfqzJ0t
	AprwkQkPa8ahBjStusC7DVdqTwEjRHKXJxmfnbwylpcwsUH+OJ4uJ5Las/HkiP+8mrFwGG7uWEe
	7MHnjygbIRqQWJaSTs0FxFRRzoSfiOKSOlapZYKfzd3gae0zU28nZNEgbSosxt6DDN8zkjzwR05
	6Rorfar+1cIBGTykkjmQ6rBeCsq59KrfxBmHIiQNzJtFra5LwWuyyCR18AI8dIdbnLe8cDtFn0E
	MaTM9+C1H8qvwuMRDEvlqVXSXaJiCGl08iulw/sN59zv47So40Tt9atyJc8fP9f1D2o8Y7IdTMT
	QEO5lmAL4COj5ytGR//nBkbfYxIBEfLZyRn9Tw/gKoT5FqooPbkc3bNsFAAhdNIWEGIDIjT7Gkq
	kWM1o2oIoZOdl0=
X-Google-Smtp-Source: AGHT+IH2w6z+SU0eHU6NOuPA4iQyXCEAi3j85watwL907LSzJ3TbJ27HKuMsKAPlK6Wr9/bCIZ3zVA==
X-Received: by 2002:a05:6000:2585:b0:42b:40df:2337 with SMTP id ffacd0b85a97d-42fb490d6fdmr8806346f8f.50.1765710352872;
        Sun, 14 Dec 2025 03:05:52 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:52 -0800 (PST)
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
Subject: [PATCH v3 4/6] arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
Date: Sun, 14 Dec 2025 12:05:27 +0100
Message-ID: <20251214110531.9475-5-stefano.r@variscite.com>
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

