Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EF637F010
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068379; cv=none; b=UQHFO5PfotKk8hcqyPfVPwiBti66gM63+bBVKHKBt3dWsPZpGvbGvnB3C9I9TE1VQw3vpT+zAVbYgG10yhTjtSl9wlF7Y4tsEGHWqpnCf06N2CSYtJk2nXm4AYcmF5xRZmqu3whisIDvorFpzS3TzwhsoP6y38z/kHGDMv3B5C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068379; c=relaxed/simple;
	bh=R6WSCqLmXaxPLpVCpvgfudODC5iUjpDdZuWT7mx7xcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lHvi7xd8PF9gNEEzJfWx2yFtKO4ekyBTIoJq9a0klAOmswG0VkTwcbHa8Ko6PFC8ec1F4RyXQZm496kwf1Vmcqt2yrjl0ID+Eo4cOpN3CO9o/g1Z5F8hQb6PP44aNudb7sNraU3/xhhRclAGeYyiWzZURLIV+YLB2+jqmSaqe50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJdbY+dJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJdbY+dJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so2425535e9.1
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068375; x=1783673175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOzNAmFCng9YoBdaUUvA3gHi0RfJnoeHmgno7+BaQ30=;
        b=NJdbY+dJVQl2ZpYz21Lr3lpFYTUhzC31HTnJZPRIt/Ma4CdF8grj8b1V40uzeLpCwR
         WXzgXz0ppQINMTJQU2uF4SW5PHCX7myIqalGMdksbm3emLNWOIz2EN3yRYbKELgsVREa
         Q2A5ZEC46vIST3+gU4vXGwU47iXD76+wJr+gRC4ejddNKVs9UXdE2UTPlYhFz576s+cg
         /jI9U9+RNrNJqEx3VYTSoxDJWhx0fOl2sizkiLUUCaD6gYAeTyT4/HFQ+WXTe07Bwp5L
         +mRvs1N3c5ZMGl0jLqvwbBK1xLOUY3alYHhedbIeTRaspIsSKwa5INRGh/L1uqCtvURI
         Im1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068375; x=1783673175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bOzNAmFCng9YoBdaUUvA3gHi0RfJnoeHmgno7+BaQ30=;
        b=WQpjpi1BcGEWHnemJ/pXdYKZC0dkH57FaXg8GnbLqZUywpCDgyk6mbR6kFUlzG+KjW
         XDyXjrNaK+X8ofJlym0sHFWgNLkX3V1AEkVZpRRuDMaZ32ybzyOZ8uMx2x26kaKVkc5c
         Z2KBLLJUARhii61VT8xersXrtVdEhalgwrcBjr7wKL1JHqsl5MSC9m2LmDKStU2Msv4v
         kBCddhIu40SJQAanIM+f+ijD6qTkY69nGZDLdguPZ0MRhayDibPleZ7Myf8d5D+Wb8Wv
         DN0U3DLszQlupRFTSBXya1CbdT/FadUyun5OR6zKSkNjZi/cosktHixGQIo5d+rNIBoM
         Py8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9qbGf4w3K1jGqNyRlOrxf1bewXcOpxaBy9oVbpc4t24qnf+z8+pun50KyvexM2XtRuT6s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5UOaMApXZSMWnX2HHaY01oY3YPKVhiwR0X7mmbLzrTsoJ5YGm
	uv9md3kVynrF4cehceKiWzYQEpYTpkW4aMhLazKhBa4vGHHpTZ3BOanR
X-Gm-Gg: AfdE7ck4eD1tx2lKLfJX+qECrZE9dQ3tRqtGa7oQPfVFb/7soUdV97I5igkcLtMkOlF
	j+GrwHrzep08MmX9W9VqQ1Qqu1kdU+tMaWVzGydPGXSkHAftlxAV/uSpsgcHHqV2s+Y+H1igmVj
	KE6TnWlzzLd1xBipL1sgsnaGq0UiSo5s59WQCKWVKZiB1YaSAlFXXlErr9CoDzLLK368E1/+h/u
	bmbodzgnxR6FC20Wv/IG+UGD2ooDjVF3bYpFWj9lNckvutvUupOzamNYvGb/oVK8kWN8RjxLcmh
	WVaewGJj91wmqdU/+5RXR1x6HV7bqfJ5ytsjxaoX/C9M6g8Ul7PO8a59GW2uCsWf9LHEslUzHHA
	uU/noYNuzVLVYATs7nKyG0B1kbUGbqPpQxFM7FgGsYmOsZ83sU3fBjbw84i78BuFh4E39LORgdO
	GZfiNTuYxNKDRHJsQ+hU/xBsc+N3I3KzDgb/8kSld9XByYoNF0R+QGiIpkT8CDXbH4gAcSD8Mts
	e06130ADbBe+d3aXdYhmol8YYn2IHh1NdwS
X-Received: by 2002:a05:600c:8590:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-493c2ba43a2mr115054165e9.33.1783068374165;
        Fri, 03 Jul 2026 01:46:14 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:13 -0700 (PDT)
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
Subject: [PATCH v1 06/15] arm64: dts: freescale: imx8mn-var-som: Add MCP251xFD CAN controller
Date: Fri,  3 Jul 2026 10:45:53 +0200
Message-ID: <f6e7b5679b0ffd1053b8a5263cd5361d4aa99b8d.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
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

