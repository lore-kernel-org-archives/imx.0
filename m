Received: from finn.localdomain (finn.gateworks.com [108.161.129.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A85938F23B;
	Wed,  4 Feb 2026 22:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=108.161.129.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770245439; cv=none; b=hLbggzUX2Fk7+2VuUMCBLANEpiNcdYiFnMcjMdfpUY36m/EvxKmNfuqLjTGT0pcaBfmg07zHOzUHhawVVPTe2njk8T+nr7BqzofkQjJEvPmBM6y8UdtfmdPyjruEj6CG461KFZeJTu53ukD/h7JTVAOzUNu4nCzwcnroWwoZFK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770245439; c=relaxed/simple;
	bh=AR+h1jJVfACBpTkai2Y0cV2KOlBs/KVUu7hDpXyUK6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UgpTCIYEQXj/fWsF2m3onCPCRndh8scAyo8LN5TZuJrq7eQWWjbOPgqw4hk2UljEiXaGitFNBCM8SyUKQVB7l1/iHn9J1cUHwRGRl7ptLr+D7XvbhWrcxFHOvVka9UwRFiwvgwkmiOUJGelevMm97uHiRU7CYPRuY2tzdCcrbgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; arc=none smtp.client-ip=108.161.129.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1vnlhX-00EvLM-C7;
	Wed, 04 Feb 2026 22:50:23 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 2/2] arm64: dts: imx: Add i.mx8mm Gateworks GW7906 dts support
Date: Wed,  4 Feb 2026 14:50:20 -0800
Message-Id: <20260204225020.2039367-2-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260204225020.2039367-1-tharvey@gateworks.com>
References: <20260204225020.2039367-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GW7906 is based on the i.MX8M Mini SoC featuring:
 - LPDDR4 DRAM
 - eMMC FLASH
 - microSD connector with UHS support
 - LIS2DE12 3-axis accelerometer
 - Gateworks System Controller
 - IMX8M FEC
 - software selectable RS232/RS485/RS422 serial transceiver
 - PMIC
 - 1x isolated RS232 UART
 - 1x off-board bi-directional opto-isolated digital I/O
 - 1x M.2 A-E Key Socket and 1x MiniPCIe socket with USB2.0 and PCIe
   (resistor loading to route PCIe/USB2 between M.2 and MiniPCIe socket)

The GW7906 has much in common with the GW7903 so it is used as a base.
Differences include:
 - different GbE PHY
 - a couple of new GPIO's added
 - removal of uart1
 - removal of io-expander

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
v2:
 - ran through dt-format
 - use gw7903 as a base due to little difference in boards
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../dts/freescale/imx8mm-venice-gw7906.dts    | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e60..83fc7faf81d8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -167,6 +167,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7906.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
new file mode 100644
index 000000000000..c4d0610e34ab
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Gateworks Corporation
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/net/ti-dp83867.h>
+
+#include "imx8mm-venice-gw7903.dts"
+
+/ {
+	compatible = "gateworks,imx8mm-gw7906", "fsl,imx8mm";
+	model = "Gateworks Venice GW7906 i.MX8MM board";
+};
+
+&fec1 {
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			rx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_AMBER>;
+					default-state = "keep";
+					function = LED_FUNCTION_LAN;
+				};
+
+				led@2 {
+					reg = <2>;
+					color = <LED_COLOR_ID_GREEN>;
+					default-state = "keep";
+					function = LED_FUNCTION_LAN;
+				};
+			};
+		};
+	};
+};
+
+&gpio2 {
+	gpio-line-names = "", "", "", "", "", "", "dig1_ctl", "",
+		"dig1_out#", "dig1_in", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio5 {
+	gpio-line-names = "iob", "ioa", "", "", "", "", "", "",
+		"", "", "", "", "pci_wdis#", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&i2c1 {
+	/delete-node/ gpio@27;
+};
+
+&iomuxc {
+	pinctrl-0 = <&pinctrl_hog>;
+	pinctrl-names = "default";
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x40000041 /* RS422# */
+			MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x40000041 /* RS485# */
+			MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12	0x40000041 /* RS232# */
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9	0x40000041 /* DIG1_IN */
+			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x40000041 /* DIG1_OUT */
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x40000041 /* DIG1_CTL */
+			MX8MM_IOMUXC_ECSPI2_MISO_GPIO5_IO12	0x40000041 /* PCI_WDIS# */
+			MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x40000041 /* IOA */
+			MX8MM_IOMUXC_SAI3_TXC_GPIO5_IO0		0x40000041 /* IOB */
+		>;
+	};
+};
+
+&uart1 {
+	status = "disabled";
+};
-- 
2.25.1

