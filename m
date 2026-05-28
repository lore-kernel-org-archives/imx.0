Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48204341AD6
	for <imx@lists.linux.dev>; Thu, 28 May 2026 10:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964553; cv=none; b=s42STUkeFjwDayMh+P/I5ZyUi0BwwSHblAxSDXgIQRjcovNhR8c6LUwyoLZo2OerzyahZQxqA/hoJkLDcfiKcQxPFaTOfGyW3BIOI7sTo7k/Op6jmNwza90xw5fQLQaPGpDik2vhesjIFhxeMSa5dtB+IFfjacl8hTnFIwXBb9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964553; c=relaxed/simple;
	bh=8P3lY1/gQp25fWNrD/onc426D6RvDG3yh7pYQHTEHyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OJP5HFqmgnWnHCPwUQE9bu5GfnAiDu6nIZZBGHlVnuo2DYM3myndfzuWNsjy44D3OrOzIuy9G3G6BzfD2tpxj1hQIKLKl6CTes1NSdQuZ/3InqOG29VgTaA8VM6YZ08xR0ypybzcyb7h7CZmuFWDbZnHxMBoyHHNpwjSwZvcWGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=sVs8wgSw; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="sVs8wgSw"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1779964044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7xCLVbh1sBBSOmagGE/x9KMj2LGr4xyccPuWMFIUyF8=;
	b=sVs8wgSwuXagVcjaN4bUG8ffMt9SC3SKS7fi/IvtdN2Kjx1bAGOxYocRmpi1oZAgiSpa2b
	XhfjagBznFWm5GX3fpTUEIkvsGvPuNVj2EZHrB4GnNwXnuhGo2fBOtGKCLo9OwP73jN2D2
	Gy6WtVvcNSPqUH2mRSgv5njAsMuR0JMy14ab7T225xdxUcmVj1i8JMi47BWxI8I6O1Smja
	01DcRNx7R25p5NOa7w0L2hWHotSQrwZ3VNw2qeyaOqCVWiilbk+E3xfHpQ10xVFayVK/x7
	w6NNkps3L78GNo7y3sr/9RNdqC5FXoW3qTiBUDPolijNgkocvPYjSGqn48xpWw==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH] arm64: dts: imx8mp-kontron: Fix GPIO for display power switch
Date: Thu, 28 May 2026 12:15:56 +0200
Message-ID: <20260528101556.75926-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The GPIO that controls the power supply for the LVDS display
connector has changed between early prototypes and the current
production design of the hardware. Reflect this change in the
devicetree to properly switch on the panel supply.

This was working before even with the wrong GPIO due to the
bidirectional level shifter used on the board which drives the EN
signal high even when the input has a (weak) pull down configured as
reset condition of the SoC pad. As a result the display was working
but the supply was always on.

Tested on BL i.MX8MP to show the correct voltage level on the level
shifter input.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts   | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index 75ae46642782..29ce863403b8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -49,7 +49,9 @@ pwm-beeper {
 
 	reg_vcc_panel: regulator-vcc-panel {
 		compatible = "regulator-fixed";
-		gpio = <&gpio4 3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_vcc_panel>;
+		gpio = <&gpio5 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
@@ -172,7 +174,7 @@ &gpio4 {
 &gpio5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio5>;
-	gpio-line-names = "I2S_BITCLK", "I2S_A_DATA_OUT", "I2S_MCLK", "PWM_2",
+	gpio-line-names = "I2S_BITCLK", "I2S_A_DATA_OUT", "I2S_MCLK", "VCC_PANEL_EN",
 			  "PWM_1", "PWM_0", "SPI_A_SCK", "CAN_ADDR1",
 			  "CAN_ADDR0", "SPI_A_CS0", "SPI_B_SCK", "SPI_B_SDO",
 			  "SPI_B_SDI", "SPI_B_CS0", "I2C_A_SCL", "I2C_A_SDA",
@@ -329,4 +331,10 @@ MX8MP_IOMUXC_ECSPI1_MOSI__GPIO5_IO07		0x46 /* CAN_ADR0 */
 			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08		0x46 /* CAN_ADR1 */
 		>;
 	};
+
+	pinctrl_reg_vcc_panel: regvccpanelgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03		0x46
+		>;
+	};
 };
-- 
2.54.0

