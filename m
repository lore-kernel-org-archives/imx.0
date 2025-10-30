Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D8E31A055
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761825769; cv=none; b=m+llNmJjil7zkvBfLoVwss9S0KHS5S89I8PhQXtoqZnbFvLzQV1xHnDgVQpfNyJtAgm9jPX0ZT7g2QVxpzSp4cMMOKJREvcvMoyPGUfo0HkznfNuPW1FOgiRwVOASfir3xMx7jP3sY1cEwSasbKAIWYPlUJeGBo5NtKmgxtk8oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761825769; c=relaxed/simple;
	bh=QNI/ZfaPTG0phRPkECwpB5V6JS0vmdEEhkfXIQ5bFTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWHALcFgEFAciwIZ9cRbISpciRP2SZ+4c5VBuZoSQsNn00SalXXpIOQVi01lFFVmqOk8ZSTm7ShbanMV+TK7eMyhk9bh8BUWnge6ra/y29R4oYMZWRvG1/XA6Zi5QuWFFU5IOYjxGnK7v6mCugOVZXSthfB/cWXkNs0NPrYOYxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkLtMGYd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkLtMGYd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-475c9881821so13635125e9.0
        for <imx@lists.linux.dev>; Thu, 30 Oct 2025 05:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761825766; x=1762430566; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RU/IFjxmC5UzobtaqwaIgLh+ViOP+BMDNSNp906n97k=;
        b=IkLtMGYd74QiEdkek3kCDa7vStmNbKqWEpdthWdMTPQdBlLIpnNs5cZbeLjq82FYMT
         dkgFYMAoHn1DM8Gg4HByNIQpDjHUF/XmwUhdh2RG4Py6oj9U2jp6HGBVaWTudOe98roS
         saR5Gn9e+AVtWXpqa7ytuiOFkEPXHjYGgeRL8hpdp7244ERJ1YEJ4DAGhfcVNf89HqGT
         /eO5AZ+2QLxQpSE6AmknybcxXlYrPjbtiesoiqqnpgLr8LRD1X3ehGHSf77a/iTQW8Ha
         +D9Luo1TJPKyczNwKrJ0WJFQ2315lr0S4WwfPiULv77CzbfBfrnL2F1+Kg0xIeSYBJoD
         I9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825766; x=1762430566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RU/IFjxmC5UzobtaqwaIgLh+ViOP+BMDNSNp906n97k=;
        b=cruOGTM0/c7V/R+LITp2xwPlQ/HdLt+coKLJjRxho+QCNY3Bag40YX6pDv6tjHT6cQ
         MAd7iC7wr8h7ltU0TxxOD5Fn4pJsjxCv9CSZSJWsiQ/tAKTuzDC5ppjnUWzIiGXaGaHR
         oS61Z7K4NZO+tvQY1F3ucDCFfSZg4H7YhxKsMs2vlK3gni4JHGVHY40gTg+OL/qDjPoH
         bO4mFyoMODULG34tHSDPot1NM8cy7NGBPrrRZFwGgb6DDsQCKH5zz9mw+0GxLrPrqu9J
         Bx5W/g+DxxViqA7rGDOB12Z2ZE2IzExdwPOeBPNrtVwrWFSn96TpqKoGU4zGgPG5Z2ZU
         NhdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmysZ1kU8XpH2NyRJnxJMUnmeWnM9c8U2hMKt39az4KbaqY1qDtJDvGiQ/cq1vlaTZH9g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNCXdjEmKaQ+fpTVQ9CU433fto9O9HPxjK9xZegC5adnwYoZW0
	rw1mF2bAw3zTFldo2EMeLSANLRRFu7Axhs4WHgQtUYZXvKz+/NA2igas
X-Gm-Gg: ASbGncuTt79wAtPxCAChGVKbcrXGbYSSVsFniBxOQkRz6Ag5yNce8xwEp6Khya/gWtn
	a0ZdCc4s1K8bPVlINGOZaydRtQCFF+Uu2bPj89n+KU6YRRPGN9jYMoo3e+elFHBfTyn9L2pg4gN
	lvB0BbhE3JjGn3umyHRaIWOR3D9UKET/K7UtUPr5dFUJWmjSLGo0hTEL/C8qNdiglk1j+/OWruD
	eaYxuOWURuD9BqsuiSF8tJ6vF3jsprRM9b+dCD76N1PggqqAa2DVjjReGWjowqU6RtTZrR4Sf7R
	q1v104ntj8QF3i2tQpVxCvTsOFkSF/TRLzUIomdn5L9V47rcv8ttHg2RvOoSc10Owu6qIzoQzfW
	Tz/BG7t3YRPuOWeLVqAZXuuLABbnvdUAuiE7KzIJ7+Mc9s55beVFb/C+zPgLpbMvOrTdLqvDVyn
	tKDNuQwlPtGkTMrtwVvrEZtAQaF5sqlzdXNBbEx4fvb73Hq+A9UZkm7XMAiT6iLvbPIahjSZQU
X-Google-Smtp-Source: AGHT+IGF+6bOCrVb3+3E532mSpXBs3rQ5f3sWNWs1oBDAb7QHFohBiPTXpW2jdZsUENdcJwLMcPkBw==
X-Received: by 2002:a05:600d:830f:b0:477:ede:d2b4 with SMTP id 5b1f17b1804b1-47726263362mr19710395e9.9.1761825765597;
        Thu, 30 Oct 2025 05:02:45 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429b9b436efsm2399848f8f.23.2025.10.30.05.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:02:45 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] arm64: dts: freescale: imx93-var-som: Add WiFi and Bluetooth support
Date: Thu, 30 Oct 2025 13:01:21 +0100
Message-ID: <20251030120127.509933-2-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
References: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree nodes for the WiFi and Bluetooth module mounted on the
VAR-SOM-MX93. The module can be based on either the NXP IW612 or IW611
chipset, depending on the configuration chosen by the customer.

Regardless of the chipset used, WiFi communicates over SDIO and Bluetooth
over UART.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
v2:
 - Fix pinctrl alignment

 .../boot/dts/freescale/imx93-var-som.dtsi     | 94 ++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index a5f09487d803..37f7837fb5ac 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -12,7 +12,7 @@ /{
 	model = "Variscite VAR-SOM-MX93 module";
 	compatible = "variscite,var-som-mx93", "fsl,imx93";
 
-	mmc_pwrseq: mmc-pwrseq {
+	usdhc3_pwrseq: mmc-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		post-power-on-delay-ms = <100>;
 		power-off-delay-us = <10000>;
@@ -70,6 +70,18 @@ led@1 {
 	};
 };
 
+/* BT module */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart5>, <&pinctrl_bluetooth>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 /* eMMC */
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -81,7 +93,27 @@ &usdhc1 {
 	status = "okay";
 };
 
+/* WiFi */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
 &iomuxc {
+	pinctrl_bluetooth: bluetoothgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDIO__GPIO4_IO15		0x51e
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
@@ -108,6 +140,15 @@ MX93_PAD_UART2_TXD__GPIO1_IO07			0x51e
 		>;
 	};
 
+	pinctrl_lpuart5: lpuart5grp {
+		fsl,pins = <
+			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX   0x31e
+			MX93_PAD_DAP_TDI__LPUART5_RX            0x31e
+			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B   0x31e
+			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B  0x31e
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
@@ -123,4 +164,55 @@ MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe
 			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
 		>;
 	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582 /* SDIO_B_CLK */
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382 /* SDIO_B_CMD */
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382 /* SDIO_B_D0 */
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382 /* SDIO_B_D1 */
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382 /* SDIO_B_D2 */
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382 /* SDIO_B_D3 */
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e /* SDIO_B_CLK */
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e /* SDIO_B_CMD */
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e /* SDIO_B_D0 */
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e /* SDIO_B_D1 */
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e /* SDIO_B_D2 */
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e /* SDIO_B_D3 */
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe /* SDIO_B_CLK */
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe /* SDIO_B_CMD */
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe /* SDIO_B_D0 */
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe /* SDIO_B_D1 */
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe /* SDIO_B_D2 */
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe /* SDIO_B_D3 */
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3-sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20		0x400
+			MX93_PAD_SD3_CMD__GPIO3_IO21		0x400
+			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x400
+			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x400
+			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x400
+			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x400
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3-wlangrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDC__GPIO4_IO14		0x51e /* WIFI_REG_ON     */
+			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x51e /* WIFI_PWR_EN     */
+		>;
+	};
 };
-- 
2.43.0

