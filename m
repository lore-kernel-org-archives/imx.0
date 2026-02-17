Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A64637472E
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353821; cv=none; b=MAeHyxd4QIwYGGyrcc5r72rlDCBvN2NZij3VurNno6XhagPggMVsF19zn/6rB00gArSQpvPb6XeH9ZFO/pj/N45WRrqBWgoIzacBYxh6Qq6U/MxeI1BXVCrT+oO42h/xX4a8Zv4/nusAwDr6n9FZTBkI5E9ZsANhgG1gYCaL3V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353821; c=relaxed/simple;
	bh=9zFjm7WzW3QzNYLbpdMx7MQocAGMtd66t+a7TsNWwsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqX3OY0z48fdjjAVScdH4QrIU7z6iwPz45LuFV6Fs7aFyQ5fpOYUoneoQ3j3Ru/6bg6uNenzpmCOfF/YimP6yIAci32p7Nkg8gfo/p0aSpAQfQmNZAi3xiknt/gbxsJNbS7IqZRW4mNAWLm1tACp8kuJCE6g9FpblgrkU/89r0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4Tegz21; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4Tegz21"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso36833545e9.1
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353818; x=1771958618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRFukmCvY+OSDRn1l1USalwiw2coOXo29afycHynqcQ=;
        b=e4Tegz21xuYnGDhV+7TVN0YQHLkOfb5tQo4TEfFn1rheiifr56WNTmgBVRwK38PqgO
         D3zNcX+pJ2+HjPf2fCBqsM45objsic1o2OhCZXoEfkS2r5jPrzug4ZSeglZO++I3ojHJ
         bnAZydYXR7ylfJy9UzA6uNL7YdX9Zk9A/PC3+WAuFwo8BpXl8FyZPoA42Mq3CdZhD/M1
         oB7n3PQnXNKqGZgVBoY8b4anlEld+MOIcYmuJVwJN6Z4gfbonX2/8AXVCwT1MoEeYSlF
         85SZmf2gZNjrtI2JKnvC+voAvkI6MhAm9WKbfTQERCA0AfjA4lnR15y1kqE3BGVoTPQQ
         iw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353818; x=1771958618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xRFukmCvY+OSDRn1l1USalwiw2coOXo29afycHynqcQ=;
        b=NG19XtlwZCcvmKyyxgo4xeOw3RMZ6V5hAhpQp5LabAeyjg9WPfyo693anOSa4AAZhM
         xoGUKn5C+EX/WMVnVZx6atBL7I1mpfcX/qQ7OtXgpAtouoRpE8vO0H3/Suntd0HCRgb/
         2Ad13LI1kz0/zGdPHOmCtOG5HRHQoW3M9Di5pmRJUC0VWOhfg7sVECFSSvRYhD5ahfgF
         7d7DrYFx9Zt7wJA2bemRBb1opgpsZn5PiZYaQEawbdypbJwSUq3wPtPoEkgnkty9jCi0
         Aw6PYC0D9W77V8JYgPeWE5GM8i5JBmIVZHTC9qYJtVdc09QCYkvX8mA9r2NvFH7DeReP
         eB8w==
X-Forwarded-Encrypted: i=1; AJvYcCUtJedRbWxhsE7AdLYB519xI9weV+O/N6W3CeozUhu6TCSQxvkEtHXvOUBKLw8EDIo+jJY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+6ZEQ7pNijsjRGRp6IyNSqZi8huJb6L6MDf3BWl0NmT0SGpmJ
	r4s+c1Rx4jCt7C7N3eRkLKoTNdogbnJUnRgcLFjExhUVNuO/4kgw0zjy
X-Gm-Gg: AZuq6aJfZdNl0LsHuuCZu3NI+Ez10pdTilJ+JMGeleQUFUQzQSWHZ1z73DToDVWsF04
	i06etqNPHS76A5UuN6nvSFSQjGuqq7Bmoaau4q2Re8pf4aME05/qpa57gkkXYFUhQhuNQM81wCx
	IxqfA37s36assr8Ei16BgYgHlD2dXic/CQTaA5vii6OkB+A/s6HhGcYpImP0xGH8P5ceGMS4fRB
	HQdWTH7dxC5z3S2Br5dIsvIueFst92CCSIBSW7GwpaIeiJ49jTpJZ2MriwLgm/OvD0P1Zp+ft3u
	uCcrHnC6NpuXyGTavZ2ZThssbIe0Qqwyc6+mHfmKQ2gzRA+HNPOCRtTv8Xr6jOPSWnxmT2DEJOZ
	kW/r07cRXWXOFZQFUlti+uxx3yNZ14Z3SAssRCGf6Q5ALdWg+0P0XyZZE0m+qXF6mVQSgzxbVDl
	MAyrUWjbRpwVncKk9s4HBzEPCqxA5b+BVPdnDxcJKuNIAdRU0wR04LvOV+hrBaAmkqqxxvFj85r
	tKcHiaghEnCnQOIxvtwO1Ih4/Ae23eaNEud+MJX
X-Received: by 2002:a05:600c:34c3:b0:483:3d42:d04f with SMTP id 5b1f17b1804b1-48373a7b7bcmr244814115e9.37.1771353817903;
        Tue, 17 Feb 2026 10:43:37 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:37 -0800 (PST)
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
Subject: [PATCH v1 11/11] arm64: dts: imx8mm-var-som-symphony: Enable PCIe
Date: Tue, 17 Feb 2026 19:42:45 +0100
Message-ID: <70bac0277cdbf455e2a7a83bf6da81e93b99e720.1771353301.git.stefano.r@variscite.com>
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

Enable PCIe support on the VAR-SOM Symphony carrier board by adding the
external reference clock, configuring the PHY and providing the required
clock and reset properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 3d9658edd58c..8c1e2c77ba7f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 #include "imx8mm-var-som.dtsi"
 
 / {
@@ -15,6 +16,12 @@ chosen {
 		stdout-path = &uart4;
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -182,6 +189,27 @@ &i2c4 {
 	status = "okay";
 };
 
+&pcie_phy {
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	fsl,tx-deemph-gen1 = <0x2d>;
+	fsl,tx-deemph-gen2 = <0xf>;
+	fsl,clkreq-unsupported;
+	clocks = <&pcie0_refclk>;
+	status = "okay";
+};
+
+&pcie0 {
+	reset-gpio = <&pca6408 1 GPIO_ACTIVE_LOW>;
+	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
+		 <&clk IMX8MM_CLK_PCIE1_AUX>;
+	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
+			  <&clk IMX8MM_CLK_PCIE1_CTRL>;
+	assigned-clock-rates = <10000000>, <250000000>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
+				 <&clk IMX8MM_SYS_PLL2_250M>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.47.3

