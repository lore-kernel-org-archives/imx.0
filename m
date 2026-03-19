Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF75E3F167B
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 18:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945719; cv=none; b=X+RWUC6fkqFucVelK+FAvbcCqYVdrztUUo7sTDCbSrZnkoOHOjzjyS2x9E96ux/BSyra7bLZnKdMBV3z1LVKCLhVYn1OquN50mG/HobiSm0CT6drUTJWsl3IyROL8jpN0Db5CnRRLPbA+Ng74uYO8K+zQX3vIXkdqE6HCUENqMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945719; c=relaxed/simple;
	bh=fXWd+8nqbS8G10mImlkOZb66wJSrWdKLh/J3OueEbeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kcaxTelu9H76dybG8K27rx4eijfT0ASglRq7tlgPlUOVcsvgtGkdJkn64I5H7i2GGzAYpA1WDchWqDQwjKegtYXdTF4cLVJlUAfQ9KRCZtoej3z1oSAQDNZEnLDzC3hBg+tQzpET6rtAtHRv3ASlDaI53N2oAt//Y/pg5uVmrmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbSYnCoU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbSYnCoU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so7605145e9.1
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945715; x=1774550515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym91XLgRLRXjLiChYg+mfli7NOG6LGBLaybiV2T541s=;
        b=VbSYnCoUyjfDLQ0WT5bdV6HZey1EP/PV2YBk8rUi0JMuUwBotBAQkwR9M9wY/i7R7k
         Un4Ogp8MxgEpqFsHkX8cmFTV8WYzS1qhEcoiPVKVlo0HKg5EsrNHBi3NCtt3FUZ9Gq9e
         wBQy3/x+f3Ikqs+SsYjS2AnWJNX27tRptt7Gz42MzhCOkMRzh1XjOIQcFXfPkq/KHoIW
         aIK+3s3KVgMMJkeWFhe/TbTozXzt/lguRsYGwRMR3/PF9vXy3nTxiPOSHc7UpmA2QPuK
         3F2kW4AoDaUHQZ9dIqpeMgfPARPlkL5yPGOj0iNZ9+HbV4+dVfeIYIe0XO1FtwM3+n3h
         ZnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945715; x=1774550515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ym91XLgRLRXjLiChYg+mfli7NOG6LGBLaybiV2T541s=;
        b=BYHyjdB2xcSiK8qzxJl62t6Y5tmQPeruweuCu91h80EjdsYy3hU+etdjawZ3OvFgGZ
         OHLZDFmw7DNcgt7W2CpDp1vPTo786f3q8ZJAmWrPSw1dwQAQoKHi67hWrGG3+2Vdylur
         LMWtP/voJxaUzVpPF4E+lyxslIgvSHHlmJP6Hyt6qAe+0xzcocMzMYGirMgRxDDapaLj
         LqDCqMgYlDT/8nOA6tRWOQfbqCV3JeH3TNtugdyW5z9m+XhojdBOU86wdR8VR1IcR+ix
         Byiwc50gPanx+FxjSmY9neL0EqQaWEexLF/FpgVFoAzbemTTWYfl1Jq5e3kxC4AOeCbw
         A2OA==
X-Forwarded-Encrypted: i=1; AJvYcCV5MkV9MBGqD+kIL+4meKqr3C13GzAVD2OqLwQdmaze39ybqrqHV5zQh/bVf+/Me53mmKc=@lists.linux.dev
X-Gm-Message-State: AOJu0YywMMXVPSfeQa0yt+3zM7pdUvTRxew13fbhpulW12XKRDtC89lm
	dJ18zJDOl7A/K+hnwLekobpn0kWrn5cZX45b1FO5+pnzbDJ0TNzEnjSK
X-Gm-Gg: ATEYQzyPsIUHVP2K7LZhDfwpAQzn4FZanNf1D5qnXkpf7S8NTamcEreOSNLV5WVBNXT
	CfK+ldFHgil3/RLAC4wKAsyK1SRsYk3o8E7HIS03c0JgW2Cj/rs/wWRKOG9XQYKhe9u8W9DpSkL
	1qDAWRc8flabctZF10Ise2SwMvF+aJ0DZ/Azv2G4GtqjspLANmYf+Ebqh7omSAgLq6lKvqsQvRe
	lIrVKlVK5fTZvtO3JbOJmi0kfo+aytllKw1ZEI0fdFPFtwf+51Z5DWenDRLsDlQQNymoizQvKFQ
	5aXOcGn4Wao0uC3kENGifdTzfTkxiFq8t2FaEM0Ygyq5n81YHxfnuvUFYVgrBS6CKlWFwNmeNqB
	QWQMbj/xHMVTSGrCKlizXqHizeP8X3XQuZLdxtkCaok+oSLMseOP3RGYkMtvOtdbgh4tgrpbMKH
	T0nTFw9ugwJshtTZaamfbZFRkc56zK4tyaEE90cPuw7y5GgGoxtbrXZlM0OTeJfotnDb7oAbBuo
	gjUqC4QKZd7UfwWWmnAhiLZdKcJrUa7NahWJ6f63Ieht/9Fkw==
X-Received: by 2002:a05:600c:1e0d:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-486fe8efb0amr6997545e9.13.1773945715151;
        Thu, 19 Mar 2026 11:41:55 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:54 -0700 (PDT)
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
Subject: [PATCH v4 05/11] arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
Date: Thu, 19 Mar 2026 19:40:25 +0100
Message-ID: <bdc61f427a129f36c12dc270895e5d202bafa450.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
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

Add the fixed clock, the MCP251xFD device node with the required
properties, and the corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Remove "This patch" from commit messages

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

