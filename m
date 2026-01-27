Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991152D97A4
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 02:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769482671; cv=none; b=USPZPcu2GwSLgcqdH5sjL0LkpF3qnaNtzEoMxgxJaZlmDD0QsSarOHuwbGTS3p5nulynC9u9Mx1k/cQI3j6tkvHPvpyeVZJoTmHSEEuD4GH4spCWMWZGLt1WStb+M+sOOIGcKwA4q3l6+b6X2fMAd/X99hXQGFjrbeDE2r/g/3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769482671; c=relaxed/simple;
	bh=d1VHDVebQSNXHoW6XV8lMhvcEBYBfFeC8Xqm1U156IQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nW+386EtZmgFaKxBAaKu7n/sDFpJ4Efyi1R2A86joUzbStQS/5ydM9Y5ZVJB1MA9W8JQ6AmL2EZYKRhIbduAVSYA8smdLjw3nR+Yz5trf1qaSHU+Q6Ut0flM/Ej6pj0xl5i6XPOxMFdVKpqj04lYzgnrwL7KRbvLsEJ8V6zk2Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMLrsAbM; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMLrsAbM"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-81e93c5961cso4411173b3a.0
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 18:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769482669; x=1770087469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/DD7IDM1AVvzDLxHdmpY/RwCTTEssQcwyPgw/b+OZhM=;
        b=AMLrsAbMNyRHyp306yj2uG3iIjPP4closnYgR73fbdtkhyhKuqFxa+Ji+ujrIM/fd6
         ceKIUz4I8YaPtdC1fF8tBMAxnGx/KxxJDnAhSnOW/HaLfCPNlp/92Ro64j67wf3MVV1b
         Zq2v/84mmwFfAKOC+fTVg7DuUppT61dgKTm8JA4x12uPrh26F8eiLLDvbfKuBy/vAKVM
         CxHWn9wb2znSCNCxcwSKwmaYHKVdErROMbQtDx7qxC0sCyONLCmvFzq8G51OgcrIXHUu
         0F7I24gIHyH8GwqieoHHq49+G+ct83wyBn85oRJ7Xj+GWiz+IUU0JioeoA/9ubL6obyf
         XizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769482669; x=1770087469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DD7IDM1AVvzDLxHdmpY/RwCTTEssQcwyPgw/b+OZhM=;
        b=hQZOZhxhNuJVOiNy1EyLMZeuhHk0x6eHy/rAoUuzwVT09ojIWh87BQhdhCXMWEv8ZP
         6ch9JGE4U9UiIpSBJGjiBv2lyTSQzPKQjmUahuvgjPZV3VdsB5OxbDyjFf1zCuMuR6aW
         FIShH9yUNK8PTrKwGz34IG1APN8+HfeU4j8dwPDPEQtFj4Nm8/z61O14MBjpkhvzi+Uq
         cJvWUw7qntKvO93o1/bt3kamFcg7Nlg0QZ4lOUr1246tv2EkcYoboRKKw3c9mnBS4QJX
         zGFRFieRo5AzutDJ2v4nDv/XgrjvB3MbfjOEh8v0uX5U+qaKfiB3Cv0Oyn8iPdmK4Mcw
         OfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZQbL3eOKKuUP7iVLehIt+FSMz99kkPzfC/+NrHgDvhFSpFUzur4GWiU3BD+R9R9F8bVE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8/TVozZUtExpUzVSgK4Didzq8GilGZ8rqxQe5nc+omG7RMBAL
	I7CTYLG1UyazP0UgJhrEULalPacEUZcFgVixSyYSJHAX41uZdsQ0DKAM
X-Gm-Gg: AZuq6aKRW5/nZ4IYb5P1msjC+XZdqWMWqWgfR7CUqMwgK4E3iSylPRnsTvKGCZwznMY
	3wP5+jFaBybZPvkGAuhJH9d0OZIuDxt0O/ErXVMuWuPEF0yawKCEqezRyfhApOR1R03Y7uQBeqj
	dEb/vtDaij2padhCd8mdvXyj26qjagZy63Ra6qw3SuubIuGPuCylg22y7V1D6ovNnqwMVPKSPlg
	HByDwZh8VvYd7/4uZzeJ325cQ2+pr36s8ieLfysyLjq1Vua5rWqRq1LStmScPetEop2hByIfdDj
	JRTNFJvfhIEvlIZoxE1I3Kcs4vLJrgj/CHez8aWi3oKB9LVOU3BHF5tgXirtKaVITl3IZbn07CB
	GfZWHBP7kuJE1ny4sOcW86DE3ycr8myXF050pfDQTVmuve1kTaqxqqvdpzVU6s/ltm7TdXW2hwF
	60yj5IHqa4KQFtSyJE6DAb3KQdC+LmCS9gf00eT0PPEcNGtvSXFA+P/94=
X-Received: by 2002:a05:6a00:6c84:b0:81f:50ea:5da1 with SMTP id d2e1a72fcca58-82369173d44mr399025b3a.2.1769482668965;
        Mon, 26 Jan 2026 18:57:48 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-823186467basm10495006b3a.10.2026.01.26.18.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 18:57:48 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	zaq14760@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Tue, 27 Jan 2026 10:57:40 +0800
Message-ID: <20260127025740.2601841-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree overlay to support the MayQueen PixPaper e-paper display
on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
interface and uses GPIO pins for reset, busy and DC control.

The overlay configures:
    - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
    - PixPaper display device with proper GPIO assignments
    - SPI frequency set to 5MHz for stable operation

This enables support for the Open-EP Community pixpaper-213-c module on
the NXP i.MX93 platform.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  3 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ce8f937c2315..fedd3552b577 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -403,6 +403,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
+imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
+
 imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
 imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
 imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
new file mode 100644
index 000000000000..38e0c5dd82f9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Overlay for Mayqueen (Open-EP Community) pixpaper display
+ * support on NXP FRDM i.MX 93 Development Board
+ *
+ * Copyright (C) 2026 Wig Cheng <onlywig@gmail.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx93-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&iomuxc {
+	pinctrl_lpspi3: lpspi3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO08__GPIO2_IO08		0x3fe /* SPI3 CE0 */
+			MX93_PAD_GPIO_IO09__LPSPI3_SIN		0x3fe /* SPI3 MISO */
+			MX93_PAD_GPIO_IO10__LPSPI3_SOUT		0x3fe /* SPI3 MOSI */
+			MX93_PAD_GPIO_IO11__LPSPI3_SCK		0x3fe /* SPI3 CLK*/
+		>;
+	};
+
+	pinctrl_epd_ctrl: epdctrlgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO05__GPIO2_IO05		0x31e /* DC pin */
+			MX93_PAD_GPIO_IO06__GPIO2_IO06		0x31e /* RESET pin */
+			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e /* BUSY pin */
+		>;
+	};
+};
+
+&lpspi3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	fsl,spi-num-chipselects = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
+	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	display@0 {
+		compatible = "mayqueen,pixpaper";
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+	};
+};
-- 
2.43.0

