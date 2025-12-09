Received: from finn.localdomain (finn.gateworks.com [108.161.129.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260A130F801;
	Tue,  9 Dec 2025 21:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=108.161.129.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765315190; cv=none; b=T9CAp/jHHjZDLhSpPC/DC17HN+i2q34X+pgHOdHUqIT7gjnHs1eF1pKsygqp++Llo0Zxsh88KpDsW2JljI+LHx4zZISPMyWla2mQ/pxT0RVmsRaFe7IyselhhP6WmDIgjUd7bvtvuLQDfSSYHbGL4kTsFCqtE0VtOzwiiBAFuVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765315190; c=relaxed/simple;
	bh=EUY7F24NFYP0FXSzpt1PyO4sIbxgQQaAoD+qmJ/tzBo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=huGEGG1JMOFDzYdRupRxrXUw+LidDtpkN3YVaHx1O8AGHTlNiPcJttJZzjwFINaFsLED+H7O6NDY0fVVQmAT8VzwLuiHrfkxJgx8CMsl01Q67g1c+vtOIKCnN0+7Tiynqt39Wd2gTT+8BkQbiGMU+YsN7g6l8r7h6ZSuEc7K8MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; arc=none smtp.client-ip=108.161.129.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1vT4n7-00DO8D-8x;
	Tue, 09 Dec 2025 20:58:37 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH] arm64: dts: imx8m{m,p}-venice-gw71xx: Add Magetometer
Date: Tue,  9 Dec 2025 12:58:28 -0800
Message-Id: <20251209205828.689999-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the optional LIS2MDL magnetometer on GW71xx baseboards.

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi  | 15 +++++++++++++++
 .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi  | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
index 429be2bab8a2..320806d3d073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
@@ -92,6 +92,15 @@ accelerometer@19 {
 		interrupt-parent = <&gpio4>;
 		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	magnetometer@1e {
+		compatible = "st,lis2mdl";
+		reg = <0x1e>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mag>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+	};
 };
 
 /* off-board header */
@@ -174,6 +183,12 @@ MX8MM_IOMUXC_SAI1_RXD3_GPIO4_IO5	0x159
 		>;
 	};
 
+	pinctrl_mag: maggrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI1_RXC_GPIO4_IO1		0x159
+		>;
+	};
+
 	pinctrl_gpio_leds: gpioledgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5	0x19
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
index 4bf818873fe3..9317e62304e3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
@@ -101,6 +101,15 @@ accelerometer@19 {
 		interrupt-parent = <&gpio4>;
 		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	magnetometer@1e {
+		compatible = "st,lis2mdl";
+		reg = <0x1e>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mag>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+	};
 };
 
 &pcie_phy {
@@ -198,6 +207,12 @@ MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21	0x150	/* IRQ */
 		>;
 	};
 
+	pinctrl_mag: maggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25	0x150	/* IRQ */
+		>;
+	};
+
 	pinctrl_gpio_leds: gpioledgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI1_RXC__GPIO4_IO01	0x6	/* LEDG */
-- 
2.25.1

