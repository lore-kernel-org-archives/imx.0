Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55B14E3770
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330506; cv=none; b=Y4kINAW2YFGX3rqFzNtOmDF03tTwULBoia7esK56bzqOsQO+++Q0nH+PiuQGR6F7gX242VpPLfJhtPBA6Hc3JIY8TNepNqNmLvtn8X/XePFZMeQUFa9oy9SYDmy9V7sK+loq369Yg942PipUpjFLPy048LNAw4RTvGUB8arEfik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330506; c=relaxed/simple;
	bh=aQa30xpL6q/Y3xnkDPN85xU7y51oa93AO0Kem7bA9GE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pciWMLA8Riu8caFm1mFy9NsvJxvDvb2OLlGIeMJGUVYD+kSPOF2QbhQq9HovVLtQ8bWn0UxuZMS2dNelibRlZzSDonIVeDWpNQ40bAFzalrbK4ZMC/4vckvTFNgKpE9w34JjJ2GYxXwaRtY7QC8p22SSvdHwDfulkjppbot1W1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9LB+FHj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9LB+FHj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b27c7451so34207605e9.0
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330498; x=1783935298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbKx4UdJngIHDfVXCfQYXIxFv5ahfIStqyAOLEiYvps=;
        b=K9LB+FHjvVMMjMtmCwqAtTdRP/vzd9RXB4agyKxaauxYvPvw510XYWiozQgmjwCpSZ
         WkWtFNUtt2uqKA+0UlXmVVbbhXv9Iwifns42aXkMy2E2cwUVCkZKWESltHai2TNalCqE
         gpZTkQ2amJVNkYpIsHrTaMZ0q0jdyl3h3vK8YS7lzWX6SWsaRxykVf71zw6SjQmUWc/o
         YaeInBBqt9/oN6MJV9wcz/XgNW+qz0DjdbFNawHeDwX3J0wMLRxoFIGA5lVSKXe2tpQx
         3ryONcwDP60egNOSnSd1iMRRjRLWCfesr40FTuZoSjst7GR0SfHQBGhvMjt+9mAPaTEH
         gPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330498; x=1783935298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LbKx4UdJngIHDfVXCfQYXIxFv5ahfIStqyAOLEiYvps=;
        b=pZr6WEFZEOZmVBDQnq3znEtQAEpGAbkxzK9QoyZ8y2TBIzpEekijF5pVXcREKabAHS
         X0H1Scw/xOLIjKmrDQ124kYAqEEei18JPzCeZ602VAFJxhIHhIcy028pZp3/XB9tECXp
         YKtksy5Ghp1+ixV2wp0gKkK/GiTEyOXeuzmI9WRZixniRHQqou1MCnuTMt++j1/fEaTN
         QMmt41P+T6xKTCB3lpst05F8Ue0sbWb4T4RoWBrxDhzTimf0xgxBB1pXznIJWc+1NxGA
         C0ri2QBFW4lk8jz6xnDhBocqtE6DLWfbb3LdcSO1vYk/Ltj8abmiZRqHmZi1rapAVZE3
         gVsg==
X-Forwarded-Encrypted: i=1; AHgh+RpxiBP2L0mRSO/JBM2V4PuwSgaAC9APQ9EKDvDY5sICgC8axYZEmcuItxB20wOhivLizvc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaBV7IncZQaxRZJ/o4Hr1Yh01187zInwRAOgQAfyhwkYCdL+un
	tEGM2BFe/cpE9xToWKHo1ngJmfXT9I0a0hkSA1VeVOWUs4QY1/R+qMRm
X-Gm-Gg: AfdE7cleCUh5/WmOXK3YxNw9ZeuyzOjbLqSovbWndRX0GaygCIOAGORw0pZ29mzPdPB
	xnpBxXtNiaLsAZfH/rMIacgtMyhiyoJKmj59jw1YOjXbfLdjAc86VI0TqMHHuHCm0eaHCIQWa8Y
	2a882JIdZ/0AFQvhU+xfQr0lXNhyosHip+jV2f8aTkvTKZ8vvR5ywmNy1zdCCWzoVlxJziETRwn
	3rcGDBEm8AOfxci/bp+MAQZ5Q9Ko7611j8pDRh54duDuxJrMIu1HOLCYKKPjFd1VTrMTOQ0z1An
	QWaKiC/jZVBF7cGzhj+kRXl6mUkgI7BGjj+IVg/8QV+cHZlYRJ+NesjVRzZcXqZi8P660HtQDnm
	RoMAwAbBko34XTPJmzmvNPTw1TCBsyxVyxDi4kOLyCznSzmmjmo1HdB8lJ1Ibj8SNH1AD+fSJYh
	LgC+/Cv74031ZV+tkE3bRQ2QcP1owMaqXPt9B9ZycPIhN74lj5qw4uakUxkfj7LHUVk5dl9mnzf
	G51OLAPkFue4iaPNBL3rA8AAg==
X-Received: by 2002:a05:600c:8489:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-493d128b664mr87032755e9.5.1783330497687;
        Mon, 06 Jul 2026 02:34:57 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:57 -0700 (PDT)
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
Subject: [PATCH v2 06/15] arm64: dts: freescale: imx8mn-var-som: Add MCP251xFD CAN controller
Date: Mon,  6 Jul 2026 11:34:36 +0200
Message-ID: <ad528d193a9b2eaba700efc7374dd9ea90dd2dbc.1783330236.git.stefano.r@variscite.com>
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

Add support for the Microchip MCP251xFD CAN-FD controller connected
to the SPI bus on the i.MX8MN VAR-SOM.

The controller uses a 40 MHz external oscillator and requires an
interrupt line and a dedicated RX interrupt GPIO.

Add the fixed clock, the MCP251xFD device node with the required
properties, and the corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index e2e04ad2fbb6..ac22dd3e6542 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -11,6 +11,13 @@ / {
 	model = "Variscite VAR-SOM-MX8MN module";
 	compatible = "variscite,var-som-mx8mn", "fsl,imx8mn";
 
+	clk40m: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+		clock-output-names = "can_osc";
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x40000000>;
@@ -130,6 +137,19 @@ touchscreen@0 {
 		ti,keep-vref-on;
 		wakeup-source;
 	};
+
+	/* CAN controller */
+	can0: can@1 {
+		compatible = "microchip,mcp251xfd";
+		reg = <1>;
+		clocks = <&clk40m>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <20000000>;
+		microchip,rx-int-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &fec1 {
@@ -391,6 +411,13 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x1c0
+			MX8MN_IOMUXC_SD2_CD_B_GPIO2_IO12		0x16
+		>;
+	};
+
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x13
-- 
2.47.3

