Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B7F43CEC2
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 19:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827127; cv=none; b=e+MNM05dA6/2oIZPugvIf/yCmkyLV7G29qZ1r2BYAi3p7TlWZlPauQW4rwKyv+DcZ0uc6GKDzk6LNobkaMO73sqpG4YuPhlQ2ygjw1Hdx6Pmw1quc5L1JvMO5DpOz6k0Bseft8NZllXggLwxuEVXxMkjyJZnOB1dbNuPstKYj/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827127; c=relaxed/simple;
	bh=zlCzFQV4Y1ccEM4u67hbvrmKWgTrQCbHVkFvjqcghM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WuwP1nr2D3ua68EJAbmQfT8ZZB3QbBYnfH/+HdSmsDRiDStwS2Ru5Z3c6AZGohhqudZNUUhx4uCwyt9QVA5RBUY/0Hgq8K5OWMnykINQ0PhaYMq/K3Lqf6qEfV6tNvEpiHl1FofRj0Dnd3EJ63xsnFPy42Ulsm3mHJ+nEARu5NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhij8DEW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhij8DEW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4807068eacbso80806865e9.2
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 11:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827124; x=1773431924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQRz3vom4i98v5hOr3xa41qzBpQfTuX5yERFzQc6reQ=;
        b=hhij8DEWwcx9nUKK8xgHGyHJKAn+Vczh5dcSH4G7+ixI/He7rVJEaF+8rmZ0Ncv6EO
         TzuJcO6FVFuBwQZ+9WZHO+KVeGGicNmHWSIx6pn7rIIggskkAFXtBesmCwIXUVKerJhN
         GQMfZAjivAi1oRzHCbyfjbNT/i/yd3RrqKbkVGdbFd13csgmRMSHzxrifUZDypwBQXlw
         iEBIj7l3gSswSS4+M9WM373khpeYhPhlJqDqyK4o6PWc57paVznJETYDB5Ha7Cn5iHOK
         St9exB8tb8BAoaG5y8qFO1taS+u3GgTBNqt+V3qrTtX0W8RAOeZjN1Eiwo6PCotG7BQ0
         hRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827124; x=1773431924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQRz3vom4i98v5hOr3xa41qzBpQfTuX5yERFzQc6reQ=;
        b=AzoyHrkGfyhioFcb+eQA0SKQXGV9EC5Cs9bITahc4KdczgGz9ILJjZZR3S12sjNz3t
         pEseWKsbyxJ6+JuRJyGK3kqz/TFbIhW2c+NSaPvgZnPYN5ijSpGtWke0K60wnm5Ux4av
         4PPW6fftz4cO2lJK++ZrXSwSLhBkBqfLkh9ceE7PC8adE8TcBI1ERn6vqIkyaxhcsqtg
         t//YjuFiYu2kCJFo0ndP5g4A7Fre9AjeXYh4R44RMn1qW9oD3dznWvl5wByDInIVgoPR
         /ENO8N1NxP3oCxHzWaJ0fBdMe9S+JPsOLslH9jioNPTw9IYwHqjByBlAxRzsf4WHJNI5
         isMw==
X-Forwarded-Encrypted: i=1; AJvYcCVy1nG5u9p2l3jTOcjKbC2BLThe8BFYTy7wg+e1uFCOZfffQSd8O5VO67ehWr7eHhwe6mI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ4Cf+A7NQiYWZ94j50tRilF8lxnCNzq0GKE4TZ6oU0OSNxN/Z
	hbY2Xx/IhOHEaiaSprsgG+w5hMqjjbTgLV7tTo6Ox0OUnbTFM+eGzwP0
X-Gm-Gg: ATEYQzw6BRZJluzVd0S0FSPx3/6yXuy0Ux6ZFnIZ+YwGVALyvbaFLg6JnuML6T4wB7F
	z2fygAm3O/4IAsAEnKVHfwIBjwv56G49NP1ugZCZWIc5e2S0G0vbFAatm0efWoYMucxBmTWWBEj
	fXypUBNAFPvGtSF9R3846zfF/fOco6fNgC3A7EbaGNpmH3WI6zfWkMgcBwgXvosOGKRajLTTKDd
	SOkXgDn2JWfJJjjFelezWGqOjcK35zSqG3+TxG0gmAu0H8fLuwFKLWMT8ms3bkQZrqjZbQDZ5pN
	wnaGZWlqCY+nD1rnEl0PvSCF9LsKltLZAlVcAqxdo63DYE2FhxwAqpUg7M2oU5WL+DYF0TyGTQA
	N4mZUhgqnICltQmeRV/qoYy4hs7Rxgg0SZPd1ion9HTjfFkSXDxAsd3yV8BWwLxTzpGqvNoGk00
	v1JBqiC5bKcCOXXlvDMkpipGQMPaq2m2fu7XdcxqSelz+SIPNdFuR8HAkQYI9UTeOR2hoy9Xbh3
	paXH/wzE44OSB8zTlJZ8VRRZY97/We9SfxGLvI=
X-Received: by 2002:a05:600c:3b17:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-4852695d236mr59709085e9.26.1772827124293;
        Fri, 06 Mar 2026 11:58:44 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:43 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
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
Subject: [PATCH v2 05/11] arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
Date: Fri,  6 Mar 2026 20:58:24 +0100
Message-ID: <d007d05d5927820aa06389c07dad55357d5f8d4e.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the Microchip MCP251xFD CAN-FD controller connected
to the SPI bus on the i.MX8MM VAR-SOM.

The controller uses a 40 MHz external oscillator and requires an
interrupt line and a dedicated RX interrupt GPIO.

This patch adds the fixed clock, the MCP251xFD device node with the
required properties, and the corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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

