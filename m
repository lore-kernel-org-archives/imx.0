Received: from finn.localdomain (finn.gateworks.com [108.161.129.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F278F5A;
	Mon,  9 Sep 2024 21:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=108.161.129.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725918619; cv=none; b=GzWv+F1sjuf6cyL5EwmxUm3NBV8tywEb7pJIQrTx5tOA08BwCVCMb/VL76tAbjW5npKAy+bSDUTQu+jqIZEg0f3vP+3+fRYpJ1HMMrzzKMT8dUmV8nuzKIaxyg+KWt6Rvx7JDpDLhumxdjZuW2DJtR2pHwQAkXS+9IaEmo+8UaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725918619; c=relaxed/simple;
	bh=QDKuYXbdR6kLhsWlajfn3PkzK6ChuAg5md39mh+hvME=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kg6pDI8P6YuCCYILjg2BLDQCpGiavnC2epapzCmN7yvLG+3DcGMOA6gawco/T10EU4/bhDnLvcTtQ5PrbtGIG9p9xQuLaCuqNlW5biio/hWyiO4gFmGRG8NQzQhGjJnvNc0dj0u6fosMCEPSHNpo4OQ2jsDmeHGL2XmahYKHKMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; arc=none smtp.client-ip=108.161.129.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1snmGy-00EMM1-Gs;
	Mon, 09 Sep 2024 21:50:12 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Li Yang <leoyang.li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2] arm64: dts: imx8m*-venice-gw75xx: add Accelerometer device
Date: Mon,  9 Sep 2024 14:50:09 -0700
Message-Id: <20240909215009.779368-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GW75xx has a LIS2DE12TR 3-axis accelerometer on the I2C bus with an
interrupt pin. Add it to the device-tree.

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
----
v2: 
 - make sure compatible is on top and vendor specific props are at the end per:
   https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
 - fix typo in commit message
---
 .../boot/dts/freescale/imx8mm-venice-gw75xx.dtsi | 16 ++++++++++++++++
 .../boot/dts/freescale/imx8mp-venice-gw75xx.dtsi | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
index 5eb92005195c..d17e1f375be4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
@@ -116,6 +116,16 @@ &i2c2 {
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
+	accelerometer@19 {
+		compatible = "st,lis2de12";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_accel>;
+		reg = <0x19>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		st,drdy-int-pin = <1>;
+	};
+
 	eeprom@52 {
 		compatible = "atmel,24c32";
 		reg = <0x52>;
@@ -198,6 +208,12 @@ MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4		0x40000040 /* GPIOC */
 		>;
 	};
 
+	pinctrl_accel: accelgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ECSPI1_MISO_GPIO5_IO8	0x159
+		>;
+	};
+
 	pinctrl_gpio_leds: gpioledgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SAI1_RXFS_GPIO4_IO0	0x6	/* LEDG */
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
index 0d40cb0f05f6..c9934cf98942 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
@@ -104,6 +104,16 @@ &i2c2 {
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
+	accelerometer@19 {
+		compatible = "st,lis2de12";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_accel>;
+		reg = <0x19>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		st,drdy-int-pin = <1>;
+	};
+
 	eeprom@52 {
 		compatible = "atmel,24c32";
 		reg = <0x52>;
@@ -204,6 +214,12 @@ MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28	0x40000106 /* PCI_WDIS# */
 		>;
 	};
 
+	pinctrl_accel: accelgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08	0x159
+		>;
+	};
+
 	pinctrl_gpio_leds: gpioledgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22	0x6	/* LEDG */
-- 
2.25.1

