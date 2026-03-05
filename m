Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C133EB810;
	Thu,  5 Mar 2026 18:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734149; cv=none; b=XiGNtKkr1NlBKUT32f0JozoHv/buxGFzLjcEzcCfy9+WnmWt6hz8RnMZl2YoWUzKBSTRk3VKkzbTZj/9ch/RNtOitAw5vHXSrXiiUvzgMBjfdl2iAFnIxhcboUakeeH/Z2hbJ6adNSgAyUudnxWOKL9CiZEkyEyuKPJrIvykcLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734149; c=relaxed/simple;
	bh=t5xbnHQp6VlaOcY/SQ/BK/vWE9T2veF4iv5HmWz1b4A=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=GTbhtLEhT3PswaQV91OlS5f92HFFp9E4yszesJviUaiaNMi84BhJ4xDPDCJVwfnGMUYNAPnxkyIE9zJHUlcWBAuX8ETMwRigZRNEsKU4zZ6So4IIfRp6RNxbVA5eAjmdMfoZ6dVM/uuzyx5c9IL8mZvIh+Dqf5w+Ku0rD4XXkzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=0LMCNqfx; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="0LMCNqfx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=TDgZtL5zOaqdsqkTCX9U+amNxwj0tG+Q14UisOg5Udk=; b=0LMCNqfx48ls7B2auvFHuMsZfl
	1jxYy6s/oekobL2FNKhTU4O86l3ENyXEJrxIP3sD8zC3Pp5yPmbsxWhLaiYpKVA4PQ1pSn8kpDXoO
	jS/go7J5nSfTnU+xZrWfGencBKW4Bx5zMtQc6V71qKJsTGhbTCIwrucCwHInihnZc2Qk=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37706 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyD83-0002aR-VY; Thu, 05 Mar 2026 13:08:56 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Thu,  5 Mar 2026 13:06:28 -0500
Message-ID: <20260305180651.1827087-14-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305180651.1827087-1-hugo@hugovil.com>
References: <20260305180651.1827087-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Subject: [PATCH v2 13/15] ARM: dts: imx6ul-var-som: factor out audio support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Not all boards use the audio codec, so factor out this functionality to a
separate dtsi.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../dts/nxp/imx/imx6ul-var-som-audio.dtsi     | 30 +++++++++++++++++++
 .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 21 -------------
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  |  1 +
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |  1 +
 .../nxp/imx/imx6ull-var-som-concerto-full.dts |  1 +
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  1 +
 6 files changed, 34 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi
new file mode 100644
index 0000000000000..3c480bc7a6ad8
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Audio support for Variscite VAR-SOM-6UL module.
+ *
+ * Copyright 2019-2024 Variscite Ltd.
+ * Copyright 2026 Dimonoff
+ */
+
+&iomuxc {
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
+			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
+		>;
+	};
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
+			  <&clks IMX6UL_CLK_SAI2>;
+	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <0>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
index 70d19eccddb4c..5600eeaa5854d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
@@ -52,16 +52,6 @@ MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
 		>;
 	};
 
-	pinctrl_sai2: sai2grp {
-		fsl,pins = <
-			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
-			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
-			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
-			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
-			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
-		>;
-	};
-
 	pinctrl_tsc: tscgrp {
 		fsl,pins = <
 			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0xb0
@@ -163,17 +153,6 @@ &pxp {
 	status = "okay";
 };
 
-&sai2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_sai2>;
-	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
-			  <&clks IMX6UL_CLK_SAI2>;
-	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
-	assigned-clock-rates = <0>, <12288000>;
-	fsl,sai-mclk-direction-output;
-	status = "okay";
-};
-
 &snvs_poweroff {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
index b5e6a3306e1cd..64a3cbd8b7c38 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
@@ -13,6 +13,7 @@
 #include "imx6ul-var-som-wifi.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-audio.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
index 7eebb5b4f5e44..9c5cb96beeb17 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
@@ -13,6 +13,7 @@
 #include "imx6ul-var-som-concerto-common.dtsi"
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-audio.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
index 86f558c76fb3e..2e1f75d5f25a6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
@@ -13,6 +13,7 @@
 #include "imx6ul-var-som-wifi.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-audio.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
index 0d3e0d9b0f11d..43a477db652fa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
@@ -12,6 +12,7 @@
 #include "imx6ul-var-som-concerto-common.dtsi"
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-audio.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
-- 
2.47.3

