Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E403B8928
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 23:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773357910; cv=none; b=ceAZ8mSyAopndP9c5eS1brXCa43NUBumGliVncNT9m+3apf1Df2EGKqLoHuJ3f1/F0A+uFwg2g9zgXCG1GihdBuy5PBXB/infreWoo75mB/Ay/Y33bD1Bm+6nptPnp0FlS4OY4csM1Zli6NLRfnaRBjY+GlGa4/L4NxC/Vo9ehA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773357910; c=relaxed/simple;
	bh=zzgI+QfvjsJBU4rUSVRsrEeTGu5tuOumxBN3pis18MU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GivSgqSnTbc6jPskfHgbsnZSSDl2XWz0IcFHmgfvO39MJ/nKgANtmnGbLTy3dym544duNNhozVZ06oviYPMH1sn0Dam6R6Q030ECTlu14vHBHQYAegvHPUVBTyESPM4JyAscwzgsBLTmnCLkja4QnPgYUbM6DMIzUGmNr1rCh14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Aip8bO8m; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Aip8bO8m"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5B5C107870;
	Fri, 13 Mar 2026 00:25:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1773357905; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=9JllFfocUfW8EDdD+r3mU/2OgVUajOKOs727TyLjoBY=;
	b=Aip8bO8m6w1Ys0mwZOF/XfkzfRj7qp9sR4FdJT9Vh+W+a5mVbuzw/fHwomQEJgmzN0pU1Y
	6KnVMhDc4kPdo0FP8fQP8mfbMABfPhMavrqF1N/rJmfjC51/484Cp5sYCU65mtygMESCWv
	7TIYroRIPo7+Wluc3M9HPjFgq+JzfpbXpEWx2AB7bo/7EKkDMAIX5T2Duxk22Z8mU5y9e7
	7wFuta7VNgzMdRghDedioixoOPpv6ZwURa/d/zggqsL2CLAD7QGoEqq8nRCHMpl3JpDkk9
	LxvKN1Xxl+YL2ZCt+fcVLNeDU+ClZu2VBkvXszIQtMbEPnl7VRw4WSLO+wLeCg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus DHCOM SoM and boards
Date: Fri, 13 Mar 2026 00:24:04 +0100
Message-ID: <20260312232500.197096-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT overlays to support DH i.MX8M Plus DHCOM SoM variants and carrier
board expansion modules. The following DT overlays are implemented:
- SoM:
  - DH 660-x00 SoM with 1xRMII PHY
  - DH 660-x00 SoM with 2xRMII PHY
- PDK2:
  - DH 505-200 Display board in edge connector X12 via direct LVDS
  - DH 531-100 SPI/I2C board in header X21
  - DH 531-200 SPI/I2C board in header X22
  - DH 560-200 Display board in edge connector X12
- PDK3:
  - DH 505-200 Display board in edge connector X36 via direct LVDS
  - DH 531-100 SPI/I2C board in header X40
  - DH 531-200 SPI/I2C board in header X41
  - DH 560-300 Display board in edge connector X36
  - EA muRata 2AE M.2 A/E-Key card in connector X20
  - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X31
  - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X29
- PicoITX:
  - DH 626-100 Display board in edge connector X2

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/freescale/Makefile        | 115 +++++++++++++++++-
 ...mx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi |  42 +++++++
 .../imx8mp-dhcom-overlay-panel-clock.dtsi     |  33 +++++
 .../imx8mp-dhcom-overlay-panel-common.dtsi    |  31 +++++
 .../imx8mp-dhcom-overlay-panel-dpi.dtsi       |  34 ++++++
 ...8mp-dhcom-overlay-panel-etm0700g0edh6.dtsi |  53 ++++++++
 .../imx8mp-dhcom-overlay-panel-lvds.dtsi      |  22 ++++
 .../imx8mp-dhcom-pdk-overlay-eth2xfast.dtso   |  10 ++
 ...-pdk2-overlay-505-200-x12-ch101olhlwh.dtso |  40 ++++++
 ...imx8mp-dhcom-pdk2-overlay-531-100-x21.dtso |  32 +++++
 ...imx8mp-dhcom-pdk2-overlay-531-100-x22.dtso |  32 +++++
 ...imx8mp-dhcom-pdk2-overlay-560-300-x12.dtso |  27 ++++
 ...-pdk3-overlay-505-200-x36-ch101olhlwh.dtso |  55 +++++++++
 ...imx8mp-dhcom-pdk3-overlay-531-100-x40.dtso |  32 +++++
 ...imx8mp-dhcom-pdk3-overlay-531-100-x41.dtso |  32 +++++
 ...imx8mp-dhcom-pdk3-overlay-560-300-x36.dtso |  26 ++++
 ...imx8mp-dhcom-pdk3-overlay-732-100-x36.dtso |  36 ++++++
 ...-dhcom-pdk3-overlay-ea-murata-2ae-x20.dtso |  56 +++++++++
 ...3-overlay-nxp-spf-29853-c1-ov5640-x29.dtso |  30 +++++
 ...3-overlay-nxp-spf-29853-c1-ov5640-x31.dtso |  30 +++++
 ...-pdk3-overlay-nxp-spf-29853-c1-ov5640.dtsi |  64 ++++++++++
 ...icoitx-overlay-626-100-x2-ch101olhlwh.dtso |  79 ++++++++++++
 .../imx8mp-dhcom-som-overlay-eth1xfast.dtso   |  85 +++++++++++++
 .../imx8mp-dhcom-som-overlay-eth2xfast.dtso   |  29 +++++
 .../boot/dts/freescale/imx8mp-dhcom-som.dtsi  |   2 +-
 25 files changed, 1023 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-clock.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-dpi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-etm0700g0edh6.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk-overlay-eth2xfast.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-531-100-x21.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-531-100-x22.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-560-300-x12.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-505-200-x36-ch101olhlwh.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-531-100-x40.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-531-100-x41.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-560-300-x36.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-732-100-x36.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-ea-murata-2ae-x20.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x29.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x31.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som-overlay-eth1xfast.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som-overlay-eth2xfast.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a6fe56bb93aa1..91c66d26c6420 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -232,9 +232,118 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-drc02.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk2.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
+
+imx8mp-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh-dtbs := \
+	imx8mp-dhcom-pdk2.dtb \
+	imx8mp-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtbo
+
+imx8mp-dhcom-pdk2-overlay-531-100-x21-dtbs := \
+	imx8mp-dhcom-pdk2.dtb \
+	imx8mp-dhcom-pdk2-overlay-531-100-x21.dtbo
+
+imx8mp-dhcom-pdk2-overlay-531-100-x22-dtbs := \
+	imx8mp-dhcom-pdk2.dtb \
+	imx8mp-dhcom-pdk2-overlay-531-100-x22.dtbo
+
+imx8mp-dhcom-pdk2-overlay-560-300-x12-dtbs := \
+	imx8mp-dhcom-pdk2.dtb \
+	imx8mp-dhcom-pdk2-overlay-560-300-x12.dtbo
+
+imx8mp-dhcom-pdk2-overlay-eth1xfast-dtbs := \
+	imx8mp-dhcom-pdk2.dtb \
+	imx8mp-dhcom-som-overlay-eth1xfast.dtbo
+
+imx8mp-dhcom-pdk2-overlay-eth2xfast-dtbs := \
+	imx8mp-dhcom-pdk2.dtb \
+	imx8mp-dhcom-som-overlay-eth2xfast.dtbo \
+	imx8mp-dhcom-pdk-overlay-eth2xfast.dtbo
+
+imx8mp-dhcom-pdk3-overlay-505-200-x36-ch101olhlwh-dtbs := \
+	imx8mp-dhcom-pdk3.dtb \
+	imx8mp-dhcom-pdk3-overlay-505-200-x36-ch101olhlwh.dtbo
+
+imx8mp-dhcom-pdk3-overlay-531-100-x40-dtbs := \
+	imx8mp-dhcom-pdk3.dtb \
+	imx8mp-dhcom-pdk3-overlay-531-100-x40.dtbo
+
+imx8mp-dhcom-pdk3-overlay-531-100-x41-dtbs := \
+	imx8mp-dhcom-pdk3.dtb \
+	imx8mp-dhcom-pdk3-overlay-531-100-x41.dtbo
+
+imx8mp-dhcom-pdk3-overlay-560-300-x36-dtbs := \
+	imx8mp-dhcom-pdk3.dtb \
+	imx8mp-dhcom-pdk3-overlay-560-300-x36.dtbo
+
+imx8mp-dhcom-pdk3-overlay-732-100-x36-dtbs := \
+	imx8mp-dhcom-pdk3.dtb \
+	imx8mp-dhcom-pdk3-overlay-732-100-x36.dtbo
+
+imx8mp-dhcom-pdk3-overlay-ea-murata-2ae-x20-dtbs := \
+	imx8mp-dhcom-pdk3.dtb \
+	imx8mp-dhcom-pdk3-overlay-ea-murata-2ae-x20.dtbo
+
+imx8mp-dhcom-pdk3-overlay-eth1xfast-dtbs := \
+	imx8mp-dhcom-pdk3.dtb \
+	imx8mp-dhcom-som-overlay-eth1xfast.dtbo
+
+imx8mp-dhcom-pdk3-overlay-eth2xfast-dtbs := \
+	imx8mp-dhcom-pdk3.dtb \
+	imx8mp-dhcom-som-overlay-eth2xfast.dtbo \
+	imx8mp-dhcom-pdk-overlay-eth2xfast.dtbo
+
+imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x29-dtbs := \
+	imx8mp-dhcom-pdk3.dtb \
+	imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x29.dtbo
+
+imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x31-dtbs := \
+	imx8mp-dhcom-pdk3.dtb \
+	imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x31.dtbo
+
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-som-overlay-eth1xfast.dtbo \
+			  imx8mp-dhcom-som-overlay-eth2xfast.dtbo
+
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk-overlay-eth2xfast.dtbo
+
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk2.dtb \
+			  imx8mp-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtb \
+			  imx8mp-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtbo \
+			  imx8mp-dhcom-pdk2-overlay-531-100-x21.dtb \
+			  imx8mp-dhcom-pdk2-overlay-531-100-x21.dtbo \
+			  imx8mp-dhcom-pdk2-overlay-531-100-x22.dtb \
+			  imx8mp-dhcom-pdk2-overlay-531-100-x22.dtbo \
+			  imx8mp-dhcom-pdk2-overlay-560-300-x12.dtb \
+			  imx8mp-dhcom-pdk2-overlay-560-300-x12.dtbo \
+			  imx8mp-dhcom-pdk2-overlay-eth1xfast.dtb \
+			  imx8mp-dhcom-pdk2-overlay-eth2xfast.dtb
+
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb \
+			  imx8mp-dhcom-pdk3-overlay-505-200-x36-ch101olhlwh.dtb \
+			  imx8mp-dhcom-pdk3-overlay-505-200-x36-ch101olhlwh.dtbo \
+			  imx8mp-dhcom-pdk3-overlay-531-100-x40.dtb \
+			  imx8mp-dhcom-pdk3-overlay-531-100-x40.dtbo \
+			  imx8mp-dhcom-pdk3-overlay-531-100-x41.dtb \
+			  imx8mp-dhcom-pdk3-overlay-531-100-x41.dtbo \
+			  imx8mp-dhcom-pdk3-overlay-560-300-x36.dtb \
+			  imx8mp-dhcom-pdk3-overlay-560-300-x36.dtbo \
+			  imx8mp-dhcom-pdk3-overlay-732-100-x36.dtb \
+			  imx8mp-dhcom-pdk3-overlay-732-100-x36.dtbo \
+			  imx8mp-dhcom-pdk3-overlay-ea-murata-2ae-x20.dtb \
+			  imx8mp-dhcom-pdk3-overlay-ea-murata-2ae-x20.dtbo \
+			  imx8mp-dhcom-pdk3-overlay-eth1xfast.dtb \
+			  imx8mp-dhcom-pdk3-overlay-eth2xfast.dtb \
+			  imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x29.dtb \
+			  imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x29.dtbo \
+			  imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x31.dtb \
+			  imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x31.dtbo
+
+imx8mp-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh-dtbs := \
+	imx8mp-dhcom-picoitx.dtb \
+	imx8mp-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtbo
+
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb \
+			  imx8mp-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtb \
+			  imx8mp-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
new file mode 100644
index 0000000000000..534737363c9f0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2022 Marek Vasut
+ */
+
+&display_bl {
+	pwms = <&pwm1 0 5000000 0>;
+};
+
+&DH_OVERLAY_PANEL_I2C_BUS {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		pinctrl-0 = <DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL>;
+		pinctrl-names = "default";
+		reg = <0x41>;
+		interrupt-parent = <&DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PARENT>;
+		interrupts = <DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PIN IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_RESET_GPIO
+			       DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_RESET_PIN GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <16384>;
+		touchscreen-size-y = <9600>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&panel {
+	compatible = "chefree,ch101olhlwh-002";
+};
+
+&pwm1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-clock.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-clock.dtsi
new file mode 100644
index 0000000000000..65a39609f6bfa
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-clock.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2024 Marek Vasut
+ */
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+&media_blk_ctrl {
+	/*
+	 * Sys PLL3 supplies TC9595 RefClk
+	 * Audio PLL2 supplies MEDIA_DISP1_PIX (DSI)
+	 * Video PLL1 supplies MEDIA_DISP2_PIX (LVDS)
+	 */
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_AXI>,
+			  <&clk IMX8MP_CLK_MEDIA_APB>,
+			  <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
+			  <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
+			  <&clk IMX8MP_AUDIO_PLL2>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
+				 <&clk IMX8MP_SYS_PLL1_800M>,
+				 <&clk IMX8MP_AUDIO_PLL2_OUT>,
+				 <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <0>, <0>;
+};
+
+&tc_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_CLKOUT2_SEL>,
+			  <&clk IMX8MP_CLK_CLKOUT2>,
+			  <&clk IMX8MP_SYS_PLL3_OUT>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL3_OUT>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-common.dtsi
new file mode 100644
index 0000000000000..48eaf76257969
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-common.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023 Marek Vasut
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pwm/pwm.h>
+
+#include "imx8mp-dhcom-overlay-panel-clock.dtsi"
+
+&{/} {
+	display_bl: display-bl {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 16 22 30 40 55 75 102 138 188 255>;
+		default-brightness-level = <8>;
+		enable-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;	/* GPIO G */
+		status = "okay";
+	};
+
+	panel: panel {
+		backlight = <&display_bl>;
+		power-supply = <&reg_vdd_3p3v_awo>;
+
+		port {
+			panel_in: endpoint {
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-dpi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-dpi.dtsi
new file mode 100644
index 0000000000000..2d94adfeef0f4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-dpi.dtsi
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2022 Marek Vasut
+ */
+
+#include "imx8mp-dhcom-overlay-panel-common.dtsi"
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	status = "okay";
+};
+
+&panel_in {
+	remote-endpoint = <&tc_bridge_out>;
+};
+
+&tc_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			tc_bridge_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-etm0700g0edh6.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-etm0700g0edh6.dtsi
new file mode 100644
index 0000000000000..ac80551a4b28d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-etm0700g0edh6.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2022 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include "imx8mp-dhcom-overlay-panel-dpi.dtsi"
+
+&{/} {
+	led {
+		led-0 {
+			/* LED5 GPIO conflicts with Touchscreen IRQ GPIO-E */
+			status = "disabled";
+		};
+	};
+};
+
+&display_bl {
+	pwms = <&pwm1 0 5000000 PWM_POLARITY_INVERTED>;
+};
+
+&DH_OVERLAY_PANEL_I2C_BUS {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dhcom_e>;
+		reg = <0x38>;
+		/* Touchscreen IRQ GPIO-E conflicts with LED5 GPIO */
+		interrupt-parent = <&gpio5>;
+		interrupts = <22 IRQ_TYPE_EDGE_FALLING>; /* GPIO E */
+	};
+};
+
+&mipi_dsi {
+	/*
+	 * This is DSIM PLL frequency, DSI HS clock lane frequency
+	 * is half of the "samsung,burst-clock-frequency" value.
+	 */
+	samsung,burst-clock-frequency = <500000000>;
+};
+
+&panel {
+	compatible = "edt,etm0700g0edh6";
+};
+
+&pwm1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-lvds.dtsi
new file mode 100644
index 0000000000000..f58b9468c3d84
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-lvds.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023 Marek Vasut
+ */
+
+#include "imx8mp-dhcom-overlay-panel-common.dtsi"
+
+&lcdif2 {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_in>;
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&panel_in {
+	remote-endpoint = <&ldb_lvds_ch0>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk-overlay-eth2xfast.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk-overlay-eth2xfast.dtso
new file mode 100644
index 0000000000000..7e459b1166304
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk-overlay-eth2xfast.dtso
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2023 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&ethphypdk {	/* Micrel KSZ9131RNXI */
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
new file mode 100644
index 0000000000000..0bc81950cade7
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2022 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#define DH_OVERLAY_PANEL_I2C_BUS			i2c5
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL	&pinctrl_dhcom_b &pinctrl_dhcom_h
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PARENT	gpio1
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PIN	11
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_RESET_GPIO	gpio1
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_RESET_PIN	8
+
+#include "imx8mp-dhcom-overlay-panel-lvds.dtsi"
+#include "imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi"
+
+&{/} {
+	gpio-keys {
+		button-1 {
+			/* BUTTON1 GPIO conflicts with Touchscreen RESET GPIO-B */
+			status = "disabled";
+		};
+	};
+
+	led {
+		led-2 {
+			/* LED7 GPIO conflicts with Touchscreen IRQ GPIO-H */
+			status = "disabled";
+		};
+	};
+};
+
+&media_blk_ctrl {
+	/*
+	 * The Chefree CH101OLHLWH-002 panel requires 71.1 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 497.7 MHz , since 497.7 MHz / 7 = 71.1 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>, <0>, <0>, <0>, <497700000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-531-100-x21.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-531-100-x21.dtso
new file mode 100644
index 0000000000000..5b68aa332ceba
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-531-100-x21.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2022 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@56 {
+		compatible = "atmel,24c04";
+		reg = <0x56>;
+		pagesize = <16>;
+	};
+};
+
+&ecspi1 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@0 {
+		compatible = "microchip,25aa010a", "atmel,at25";
+		reg = <0>;
+		address-width = <8>;
+		pagesize = <16>;
+		size = <128>;
+		spi-max-frequency = <5000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-531-100-x22.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-531-100-x22.dtso
new file mode 100644
index 0000000000000..f817a5e3d8654
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-531-100-x22.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2022 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@56 {
+		compatible = "atmel,24c04";
+		reg = <0x56>;
+		pagesize = <16>;
+	};
+};
+
+&ecspi2 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@0 {
+		compatible = "microchip,25aa010a", "atmel,at25";
+		reg = <0>;
+		address-width = <8>;
+		pagesize = <16>;
+		size = <128>;
+		spi-max-frequency = <5000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-560-300-x12.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-560-300-x12.dtso
new file mode 100644
index 0000000000000..849d9f8da63bf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-560-300-x12.dtso
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2022 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#define DH_OVERLAY_PANEL_I2C_BUS			i2c5
+
+#include "imx8mp-dhcom-overlay-panel-etm0700g0edh6.dtsi"
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	led {
+		led-0 {
+			/* LED5 GPIO conflicts with Touchscreen IRQ GPIO-E */
+			status = "disabled";
+		};
+	};
+};
+
+&pinctrl_dhcom_e {
+	fsl,pins = <
+		/* GPIO_E */
+		MX8MP_IOMUXC_UART1_RXD__GPIO5_IO22 0x40000000
+	>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-505-200-x36-ch101olhlwh.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-505-200-x36-ch101olhlwh.dtso
new file mode 100644
index 0000000000000..b6718f5045fc3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-505-200-x36-ch101olhlwh.dtso
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2022 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#define DH_OVERLAY_PANEL_I2C_BUS			i2cmuxed0
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL	&pinctrl_dhcom_b &pinctrl_dhcom_c
+/* GPIO C - X21 */
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PARENT	gpio5
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PIN	2
+/* GPIO B - X25 */
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_RESET_GPIO	gpio1
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_RESET_PIN	8
+
+#include "imx8mp-dhcom-overlay-panel-lvds.dtsi"
+#include "imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi"
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	gpio-keys {
+		button-1 {
+			/* TA2 GPIO conflicts with Touchscreen RESET GPIO-B */
+			status = "disabled";
+		};
+
+		button-2 {
+			/* TA3 GPIO conflicts with Touchscreen IRQ GPIO-C */
+			status = "disabled";
+		};
+	};
+
+	led {
+		led-2 {
+			/* LED2 GPIO conflicts with BL-ON1 GPIO-G */
+			status = "disabled";
+		};
+	};
+};
+
+&media_blk_ctrl {
+	/*
+	 * The Chefree CH101OLHLWH-002 panel requires 71.1 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 497.7 MHz , since 497.7 MHz / 7 = 71.1 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>, <0>, <0>, <0>, <497700000>;
+};
+
+&pinctrl_dhcom_c {
+	fsl,pins = <
+		/* GPIO_C */
+		MX8MP_IOMUXC_SAI3_MCLK__GPIO5_IO02		0x40000000
+	>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-531-100-x40.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-531-100-x40.dtso
new file mode 100644
index 0000000000000..114256e2d2962
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-531-100-x40.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2023 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&i2cmuxed0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@56 {
+		compatible = "atmel,24c04";
+		reg = <0x56>;
+		pagesize = <16>;
+	};
+};
+
+&ecspi1 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@0 {
+		compatible = "microchip,25aa010a", "atmel,at25";
+		reg = <0>;
+		address-width = <8>;
+		pagesize = <16>;
+		size = <128>;
+		spi-max-frequency = <5000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-531-100-x41.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-531-100-x41.dtso
new file mode 100644
index 0000000000000..5f057fbeeba03
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-531-100-x41.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2023 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@56 {
+		compatible = "atmel,24c04";
+		reg = <0x56>;
+		pagesize = <16>;
+	};
+};
+
+&ecspi2 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@0 {
+		compatible = "microchip,25aa010a", "atmel,at25";
+		reg = <0>;
+		address-width = <8>;
+		pagesize = <16>;
+		size = <128>;
+		spi-max-frequency = <5000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-560-300-x36.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-560-300-x36.dtso
new file mode 100644
index 0000000000000..4b3ba35da8bd8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-560-300-x36.dtso
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2023 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#define DH_OVERLAY_PANEL_I2C_BUS			i2cmuxed0
+
+#include "imx8mp-dhcom-overlay-panel-etm0700g0edh6.dtsi"
+
+&{/} {
+	gpio-keys {
+		button-3 {
+			/* TA4 GPIO conflicts with Touchscreen IRQ GPIO-E */
+			status = "disabled";
+		};
+	};
+
+	led {
+		led-2 {
+			/* LED2 GPIO conflicts with BL-ON1 GPIO-G */
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-732-100-x36.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-732-100-x36.dtso
new file mode 100644
index 0000000000000..03d5d24ffa63b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-732-100-x36.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2024 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-dhcom-overlay-panel-clock.dtsi"
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <1000000000>;
+	status = "okay";
+};
+
+&tc_bridge {
+	assigned-clock-rates = <26000000>, <26000000>, <416000000>;
+	toshiba,hpd-pin = <0>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@2 {
+			reg = <2>;
+
+			endpoint {
+				toshiba,pre-emphasis = /bits/ 8 <1 1>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-ea-murata-2ae-x20.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-ea-murata-2ae-x20.dtso
new file mode 100644
index 0000000000000..dbb4e2ef7160d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-ea-murata-2ae-x20.dtso
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2023 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/* This DTO requires HI00106 SoM variant. */
+
+&{/} {
+	led {
+		led-0 {
+			/* LED0 GPIO conflicts with #SDIO_RST GPIO-D */
+			status = "disabled";
+		};
+	};
+};
+
+&uart3 {
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	assigned-clock-rates = <80000000>;
+
+	bluetooth {
+		compatible = "cypress,cyw4373a0-bt";
+		max-speed = <4000000>;
+	};
+};
+
+/* SD slot */
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	broken-cd;
+	cap-power-off-card;
+	keep-power-in-suspend;
+	non-removable;
+	vmmc-supply = <&buck4>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wifi@1 {	/* muRata 2AE */
+		reg = <1>;
+		compatible = "cypress,cyw4373-fmac", "brcm,bcm4329-fmac";
+		/*
+		 * The "host-wake" interrupt output is by default not
+		 * connected to the SoC, but can be connected on to
+		 * SoC pin on the carrier board.
+		 */
+		reset-gpios = <&gpio4 27 GPIO_ACTIVE_LOW>; /* GPIO D */
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x29.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x29.dtso
new file mode 100644
index 0000000000000..fcda2cd90fe34
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x29.dtso
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2023 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640.dtsi"
+
+&ov5640 {
+	powerdown-gpios = <&csi2exp 1 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&csi2exp 0 GPIO_ACTIVE_LOW>;
+};
+
+&mipi_csi_1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			mipi_csi0_ep: endpoint {
+				remote-endpoint = <&ov5640_to_mipi_csi2>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x31.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x31.dtso
new file mode 100644
index 0000000000000..f550a629f7244
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x31.dtso
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2023 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640.dtsi"
+
+&ov5640 {
+	powerdown-gpios = <&csi2exp 2 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&csi2exp 3 GPIO_ACTIVE_LOW>;
+};
+
+&mipi_csi_0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			mipi_csi0_ep: endpoint {
+				remote-endpoint = <&ov5640_to_mipi_csi2>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640.dtsi
new file mode 100644
index 0000000000000..03fce200a2754
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640.dtsi
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2023 Marek Vasut
+ */
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	camera0_1v5_pwr: regulator-camera0-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "camera0-1v5-reg";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+	};
+
+	camera0_1v8_pwr: regulator-camera0-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "camera0-1v8-reg";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	camera0_2v8_pwr: regulator-camera0-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "camera0-2v8-reg";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
+};
+
+&i2cmuxed0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ov5640: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk IMX8MP_CLK_CLKOUT1>;
+		clock-names = "xclk";
+		assigned-clocks = <&clk IMX8MP_CLK_CLKOUT1_SEL>,
+				  <&clk IMX8MP_CLK_CLKOUT1>;
+		assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
+		assigned-clock-rates = <24000000>, <24000000>;
+		AVDD-supply = <&camera0_2v8_pwr>;
+		DOVDD-supply = <&camera0_1v8_pwr>;
+		DVDD-supply = <&camera0_1v5_pwr>;
+
+		port {
+			ov5640_to_mipi_csi2: endpoint {
+				remote-endpoint = <&mipi_csi0_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso
new file mode 100644
index 0000000000000..cabe55d80bf20
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2024 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#define DH_OVERLAY_PANEL_I2C_BUS			i2c5
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL	&pinctrl_dhcom_b &pinctrl_dhcom_h
+/* GPIO C - X21 */
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PARENT	gpio1
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PIN	11
+/* GPIO B - X25 */
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_RESET_GPIO	gpio1
+#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_RESET_PIN	8
+
+#include "imx8mp-dhcom-overlay-panel-dpi.dtsi"
+#include "imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi"
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	lvds-encoder {
+		compatible = "onnn,fin3385", "lvds-encoder";
+		pclk-sample = <1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_bridge_in: endpoint {
+					remote-endpoint = <&tc_bridge_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lvds_bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+};
+
+&panel_in {
+	remote-endpoint = <&lvds_bridge_out>;
+};
+
+&tc_bridge_out {
+	remote-endpoint = <&lvds_bridge_in>;
+};
+
+&mipi_dsi {
+	/*
+	 * This is DSIM PLL frequency, DSI HS clock lane frequency
+	 * is half of the "samsung,burst-clock-frequency" value.
+	 */
+	samsung,burst-clock-frequency = <900000000>;
+};
+
+&iomuxc {
+	/*
+	 * The following DHCOM GPIOs are used on this board.
+	 * Therefore, they have been removed from the list below.
+	 * B: Touch controller #RESET
+	 * H: Touch controller IRQ
+	 * I: Yellow led
+	 */
+	pinctrl-0 = <&pinctrl_dhcom_a &pinctrl_dhcom_c &pinctrl_dhcom_d
+		     &pinctrl_dhcom_e &pinctrl_dhcom_f &pinctrl_dhcom_g
+		     &pinctrl_dhcom_j &pinctrl_dhcom_k &pinctrl_dhcom_l
+		     &pinctrl_dhcom_m &pinctrl_dhcom_n &pinctrl_dhcom_o
+		     &pinctrl_dhcom_p &pinctrl_dhcom_q &pinctrl_dhcom_r
+		     &pinctrl_dhcom_s &pinctrl_dhcom_int>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som-overlay-eth1xfast.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som-overlay-eth1xfast.dtso
new file mode 100644
index 0000000000000..8c858ccfbb50e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som-overlay-eth1xfast.dtso
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2023 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+&eqos {	/* First ethernet */
+	pinctrl-0 = <&pinctrl_eqos_rmii>;
+	phy-handle = <&ethphy0f>;
+	phy-mode = "rmii";
+
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_266M>,
+				 <&clk IMX8MP_SYS_PLL2_100M>,
+				 <&clk IMX8MP_SYS_PLL2_50M>;
+	assigned-clock-rates = <0>, <100000000>, <50000000>;
+};
+
+&ethphy0g {	/* Micrel KSZ9131RNXI */
+	status = "disabled";
+};
+
+&ethphy0f {	/* SMSC LAN8740Ai */
+	status = "okay";
+};
+
+&fec {	/* Second ethernet -- HS connector not populated on 1x RMII PHY SoM */
+	status = "disabled";
+};
+
+/* No HS connector on this SoM variant, so no HDMI, PCIe and only USB HS. */
+
+&hdmi_blk_ctrl {
+	status = "disabled";
+};
+
+&hdmi_pvi {
+	status = "disabled";
+};
+
+&hdmi_tx {
+	status = "disabled";
+};
+
+&hdmi_tx_phy {
+	status = "disabled";
+};
+
+&irqsteer_hdmi {
+	status = "disabled";
+};
+
+&lcdif3 {
+	status = "disabled";
+};
+
+&pcie_phy {
+	status = "disabled";
+};
+
+&pcie {
+	status = "disabled";
+};
+
+&usb_dwc3_0 {
+	maximum-speed = "high-speed";
+};
+
+&usb_dwc3_1 {
+	maximum-speed = "high-speed";
+};
+
+/* No WiFi/BT chipset on this SoM variant. */
+
+&uart2 {
+	bluetooth {
+		status = "disabled";
+	};
+};
+
+&usdhc1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som-overlay-eth2xfast.dtso b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som-overlay-eth2xfast.dtso
new file mode 100644
index 0000000000000..9cf3f898ea7da
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som-overlay-eth2xfast.dtso
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2023 Marek Vasut
+ */
+#include "imx8mp-dhcom-som-overlay-eth1xfast.dtso"
+
+/* Dual RMII 100/Full Fast ethernet on this SoM variant. */
+
+&fec {	/* Second ethernet */
+	pinctrl-0 = <&pinctrl_fec_rmii>;
+	phy-handle = <&ethphy1f>;
+	phy-mode = "rmii";
+	status = "okay";
+
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_266M>,
+				 <&clk IMX8MP_SYS_PLL2_100M>,
+				 <&clk IMX8MP_SYS_PLL2_50M>,
+				 <&clk IMX8MP_SYS_PLL2_50M>;
+	assigned-clock-rates = <0>, <100000000>, <50000000>, <0>;
+};
+
+&ethphy1f {	/* SMSC LAN8740Ai */
+	status = "okay";
+};
+
+/* Resistive touch controller not populated on this one SoM variant. */
+&touch {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
index f8303b7e2bd22..042fc71786cf9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
@@ -398,7 +398,7 @@ channel@7 {	/* Voltage over AIN3 and GND. */
 		};
 	};
 
-	touchscreen@49 {
+	touch: touchscreen@49 {
 		compatible = "ti,tsc2004";
 		reg = <0x49>;
 		interrupts-extended = <&gpio4 0 IRQ_TYPE_EDGE_FALLING>;
-- 
2.51.0

