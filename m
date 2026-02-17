Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBDF37418F
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353817; cv=none; b=dkUkieLoR0AJQwvELJl8BUucsnGZBxkyW/MmHFzrw1YOdCaRwbnAQ+80sbwuTYvlwsXU5hsd1O/M2emYo21MezzVawhuK0dInGVJtdf8/YQRtKLMApr3MTVu97Kv4rhnt4lFUeu0DBd7v+JQaahkjbKxFaOUVyHqLr729f6WEmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353817; c=relaxed/simple;
	bh=Owa7PrRToVgwjZN9MxDUgGkCItTmxwXIVvAy0R1x134=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7aL5FuYbccys88x28BVrqzR+yxmwUc6rdT4ujBubO2G9pDKpOBLdyddlZNALHN3r7tj/RscvAwh0vXChCDLB62wf0aUUZZFZ8rAIKBNmyewCTITxinD0YgskB6x4kHVR5aTAn7FuEMC2PAAAUAj8csNgrTNQ0Xl2vnKWXuORRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6hjinwZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6hjinwZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso36833095e9.1
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353813; x=1771958613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfWFh33aOMYuO7yfeXL/PtQsXgAkQdOamwxvw84QZ9g=;
        b=T6hjinwZa/OAXnvFLdLW7PzNponjMYlCyl4JIun1wDqlfkq2ZWUiRqENd/mJ4Vjhfr
         VOBsxbDTHB6YaQUSEp15yXk0y16rwgsGIMsF5gIzpz8bWsQp4xIuPBN3p38NwQvdDN0y
         l0btoXTwev65bx/z8wJkLS0iltXCAeYeQaB3kUke9HSaDGiYyY5NJMh7s8Uh0L7TW+S3
         m4b/WdFftbuf0loliX+/GAA6Aep8wiE1NtbbewIFH8g/PBCjzSb1HEBx4qAVjReLmmwK
         vHGtkYoFulD6IX5o3DH2ZS33ePSa3lvrdFrHTgK4Gq9HS55Vy5bJnKz8ztPS4MXTCMOn
         AVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353813; x=1771958613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zfWFh33aOMYuO7yfeXL/PtQsXgAkQdOamwxvw84QZ9g=;
        b=hg2v964aCAfudx9WHbZltkDqB9ZaLIzIwd2mJx+m0yNRFjmixYQk8gwDDUwWqmvzNr
         FGr0mWYyEmvNVJ/OvIO2yOq9W7VsHA23Vfn7qCRW0HlSUXeEL5CXCYyPFduOAG2/H26Z
         XzWFQLS/u0JtHj8cSJpYTdbi7t4nqbkOJgQeLvUIBCWxWIIZp171jwvG7TzHAOZzxWYv
         wSdeoRQ1eWKYMaCjVyOp4PoZmgg8evWVv5S0315+XMMhLeq5ttY3A2PLkSpwX8gj4eMH
         qP0CnJoQm0S58fnWB0b+ffuZGi5S662DkiBqnz2T8IWxU1fDvpZU3rdL2LPd8/aH+yPe
         93qw==
X-Forwarded-Encrypted: i=1; AJvYcCXyeCR4xYCeEp3QHx2DSd9HzPqXwAWyAHB3fED0uEtOnulHiMNPyh3Nd7hRndNs6ULgEJM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzR7t1MBON3pT5DsVgKyxqM3HGMWAz2UP++WOqQm1h4YgdVlCTF
	ZR+5XCLvNcRrvil5CBsTFEhwo1LL/xH8rjFXqotGIWeomLA2jnfeuqfS
X-Gm-Gg: AZuq6aKDMugsDOngFrhpBfFfHK4QmQorAfR7Oe0SvfMXKmAl9Nb/Hv4nCeAwGRbyXZi
	cNZZu+sWNZ2rOtcZjCsPDNtt6GiPD+8JRxlw4QrzUOR8zMKSafMu1h2ra7+hKPHve5QRI4mqvCI
	b2RwX8eBEKz2pVZ68xyYehY886Qt9KhR3xs5LM39ZT9Jg/cyQRuATNGQU7XFTm28Um4sBJUn2gg
	AP0eCKHnIhf8L7+6bZxG82dz8N2dM3YniL7M1VlMqnNKZTD/fiPr8wGxRgIsWM1EWcrz4cxDNkp
	3pv+Bgu8JgWDtdRxBf+QBajZhbsnjWOlVfOYqiUFny5oEuIIqDVp94K0YESsHJY31MiTNuFw2vU
	pUwyZgZ8WyWIvkkqzCRMHxR20uLkl0iPGx5Nt8p1xp7nqjJKfDrk0bBT4lMDhzfyT5IdAILw1Nd
	fRgIVYECjfOWdhtqefcjzvSvDWsgyH5hD5BBvsR9kKc/y/grQass6vrTSoPnZX0fGk1iFnV4+IJ
	ePMH2A5kJGZyMVqzcl0m8QkwOnWz79WKZ2BHFfQ
X-Received: by 2002:a05:600c:34c3:b0:483:3d42:d04f with SMTP id 5b1f17b1804b1-48373a7b7bcmr244811265e9.37.1771353812423;
        Tue, 17 Feb 2026 10:43:32 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:32 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 06/11] arm64: dts: freescale: imx8mm-var-som: Update WiFi/BT configuration
Date: Tue, 17 Feb 2026 19:42:40 +0100
Message-ID: <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Update the WiFi and Bluetooth configuration on the i.MX8MM VAR-SOM
to match the latest SOM hardware revision.

The SOM now integrates an NXP IW61x wireless module. WiFi is connected
via SDIO and Bluetooth via UART.

This patch:
- Adds an mmc-pwrseq node to handle module reset and power sequencing.
- Updates the USDHC1 node to use the new power sequence and required
  pinctrl configuration.
- Adds the Bluetooth child node under UART2.
- Removes the legacy Broadcom WiFi device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 41 ++++++++++++++-----
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index cdcd8faad65e..e2b1919d7188 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -22,6 +22,14 @@ clk40m: oscillator {
 		clock-output-names = "can_osc";
 	};
 
+	iw61x_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 20 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+
 	reg_audio_supply: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "wm8904-supply";
@@ -392,11 +400,15 @@ &snvs_pwrkey {
 /* Bluetooth */
 &uart2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
+	pinctrl-0 = <&pinctrl_uart2>, <&pinctrl_bt>;
 	assigned-clocks = <&clk IMX8MM_CLK_UART2>;
 	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth_iw61x: bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
 };
 
 &usbotg1 {
@@ -413,21 +425,15 @@ &usbotg2 {
 
 /* WIFI */
 &usdhc1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc1>;
-	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
-	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
 	bus-width = <4>;
 	non-removable;
 	keep-power-in-suspend;
+	mmc-pwrseq = <&iw61x_pwrseq>;
 	status = "okay";
-
-	brcmf: wifi@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
 };
 
 /* SD */
@@ -465,6 +471,12 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_bt: bluetoothgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6		0xc1
+		>;
+	};
+
 	pinctrl_can: cangrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x16
@@ -710,4 +722,11 @@ pinctrl_wdog: wdoggrp {
 			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x166
 		>;
 	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20			0x140
+			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10		0xc1
+		>;
+	};
 };
-- 
2.47.3

