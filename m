Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715A13A5E89
	for <imx@lists.linux.dev>; Sat,  7 Mar 2026 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898919; cv=none; b=XxlSe3h6KJU8VddqHg72n0Nq/EqC+BCP9wqQAv+BI2pD49U8bNUguof37nF4i9P9fT3hmI7DsIsSIFB54C1+fjvt3iCt3bisijeetmoFFey1jwLMP+xZkPmp7RCJ9H1Nnb5aMNu7lTAaGlphGHZdG21Dc9tf5y51qmLFSvjlz/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898919; c=relaxed/simple;
	bh=BTJzcrSbOXECPNSBC4urHDhW8V3ovg9WH6R7wvKaVYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBummmqcD/THT8JNBULQdwvtBp9NGzXCDYCuEAhPIa2HCTVLFHN6Vzj+7u1VPaBhzfTV5olLEuVFiK6vXv1e8UbGGNP6WaYJS7o06ANgCCzQpwIphHhl32SH27GxFpo1Yz07iqQ8p9KG1OIBBgQheCFy53MaWaRf2CyeAQh978A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OovR+Vu/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OovR+Vu/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-482f454be5bso104498055e9.0
        for <imx@lists.linux.dev>; Sat, 07 Mar 2026 07:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898917; x=1773503717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ppGBOS/6/w1brOm93Ryd65a8gDz63BqR/Ri6xgwGtY=;
        b=OovR+Vu/rce8uLlkjdy94S2YZkqZ+40z9mbbhMcexK5QdDXO/EJD+EH/C2wieycHYM
         r3/f8rh2i8crN792e6Hu7+baF4sLhta3JsuLJvVafuBAPZoMaxsp6sQdlfoGYtBYQ9h/
         0IqxSV3iAYOz1VxlxbionKhUCJtfz9PZpIP4DWKJ0u9V3wNrYrFGyfF4aiGP0oXPnwjq
         4oCFxdbY3S7mFkXV00W3oX1n6J0t+c8qWNZ3MUIF2/CDCodj096olHQY4nPPc+iSMvmV
         VYeZgfKPWROokpurx/1IdtTmDTT2jraM2hHAyHyaNToHTN9mNCsldKmBUEH/p4vXP2Wa
         zDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898917; x=1773503717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ppGBOS/6/w1brOm93Ryd65a8gDz63BqR/Ri6xgwGtY=;
        b=b/hdEU0+Oo8j8/C3Z3PJkmb7qmFGfpFPdjcjvCjALe1Ioi170vL9Obsu+J1bv0mpXA
         nMaeMN99YK9wXMEvs/eHBuZ+48dcYp5TND0kduWGQp1T2lQ3ywc04o1Mc3P+RkgEsIZq
         CTc1G1Ydre47P870DwlZQCor4D5BrGRXZOHsTfQzCN/lPi6j4Zu61vwJnIq6Vu7A0YjM
         l9uokm1NceTZRYWW6DtuViubA6ukkFuWD2QAfTeverANSfPhsXdIP9yXCyNmOt62IBqT
         iR0V9EzJ1HYt1eWwgbzNy4UAsFPcrlNV8VhA+VUvI/VnnCE9uu8gCzHRQanumzPHRxTv
         flQg==
X-Forwarded-Encrypted: i=1; AJvYcCWJhPsRnx2ZqHeKbq/63D1M3Vi8Rzq/LHEXUIr9CCD+/J8rbTidxEE8qqVCUCg6FvVc/IM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmPUwTtEGVVm5k79AFHS3k5djsGujvxqNm/6ddkbJIORH1wNPj
	qLa5hYsCpK4jPONrAJWzeQdLjPzuYQoygXQSxcc5wOWTOiIG4Cvsw+Lx
X-Gm-Gg: ATEYQzy5O2amZR0e11n+dycPDC4gp65fsy2Cm6oI+sIqAFDTzMAEfygcma0mCXe+W0w
	hLycjowwSjY5aJEa6CZJJp8VQYnXhOIIMpHA6eud/FWGYAKfxEYIZTHE+kgnvr6uwvlDSp9kmoM
	DSBev4hxuCDCFtwWi5YaW3iPkSIFGewBRzHhhcdvIiOaNi5b4MeCN72eDfhTUNyYzarAkpIL6RS
	0hSS7qC7tXzt5MXNM6aazba88ncjC7IqNa4xCGzKrNpALZRnLIAVmUJ4oYtE2J5tIxF+9sRe/fW
	S1LZ0xlrkPtaLEsfpWen8Zp2uUUKBoIQPKo29coWN0/G3cWMDdODTxqG80Fi5pYRcgDFlhicFD6
	C5yyA4ZPvWzBif0gWggfqPdbmw5If8IYxJfnE60TLcrFKycdCvFFH+HTqa0zgJS+f6jNOeG/ddd
	d5WpPOqRbYuBdAR+oZCdMh75L4qujMbutWkfNzC7l+mam0Y9w8c1ijD7b2VlKwSHb7K2bZ2pwnO
	oyqE46+ugFaUk9FYG5IA2uK+A==
X-Received: by 2002:a05:600c:198a:b0:483:a352:b4e4 with SMTP id 5b1f17b1804b1-4852671c9b1mr93300675e9.6.1772898916828;
        Sat, 07 Mar 2026 07:55:16 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:16 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 05/11] arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
Date: Sat,  7 Mar 2026 16:54:41 +0100
Message-ID: <d007d05d5927820aa06389c07dad55357d5f8d4e.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the Microchip MCP251xFD CAN-FD controller connected
to the SPI bus on the i.MX8MM VAR-SOM.

The controller uses a 40 MHz external oscillator and requires an
interrupt line and a dedicated RX interrupt GPIO.

This patch adds the fixed clock, the MCP251xFD device node with the
required properties, and the corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 7cedef8add32..21a4d87c0e26 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -14,6 +14,13 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0x80000000>;
 	};
 
+	clk40m: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+		clock-output-names = "can_osc";
+	};
+
 	reg_audio_supply: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "wm8904-supply";
@@ -139,6 +146,19 @@ touchscreen@0 {
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
+		microchip,rx-int-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <20000000>;
+	};
 };
 
 &fec1 {
@@ -424,6 +444,13 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x16
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x16
+		>;
+	};
+
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x13
-- 
2.47.3

