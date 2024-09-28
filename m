Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21B4187FE7
	for <imx@lists.linux.dev>; Sat, 28 Sep 2024 23:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727567423; cv=none; b=JebNV/+25GeSOHaD2FPMG3uPoDX0m7QQKJ0FBT3EUMfp9ERQw8rxC1stU3RGHTCtSjBxVrD8m5aou97XSYNqvVNlrUHfgRPnPgePOCdhoGzA4DoVcfyVtwctiw4ARaWT5JvcE6GgxYoiqctt9DcHaFUX39ETQvPZMG34XUp3P4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727567423; c=relaxed/simple;
	bh=3kpaIbPw0iqYFC9tE2R7JRVqs/j+sOtF38jHtaDs+xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCajPMN9bwFZXrtNs1LFntepe4N4wHitEbPkzm0Zy5V5E32UK8tjgBri6Kkr0ghmBYq+OxETR30aqsjtVA9nm7NGPiqWOpQuvaQFrE69ByfotWIR2f7gMinBvjA74Wr4+ZznFLJMctLRkYlHVKZtUlqUBO83rICC8pHE4MYINx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=bhJOXp4w; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="bhJOXp4w"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 280DC8897C;
	Sun, 29 Sep 2024 01:50:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727567413;
	bh=iDWMIbxq79xeR7CgPXMuwRUwG+Gp8qp+4O94CVtnqGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bhJOXp4weQ9q4yS4q0981ZGJOQ77ktD9OgarkX973Dowk9Xe1lO3ZmzPepNepgWN1
	 cK4KNTDQFmNUMFXcwfwrKFoV9q7NtY5OoH4cPZArFKMlQ/XG/EEVXdy6u2TumFOgO9
	 vYZjledv8AFdxUbl5DMTkFqhk6T1hVxHuvf4b/Rbiu4quJQU+U40tgQvpHv6G9UHHh
	 zKgSNfjPdnSe6fN+4M3Tp7bHGqwVRBOYsmoqHBVmVvVME+v5UJEmKjWEwprsP+94nt
	 Q3360AGRVU1+u3TKHNkpm4HDegWJhB2SBCA9tkhZxe6P/s4tEPppTDrcl7ek2J5eUM
	 exAYmm5oOU1AA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: kernel@dh-electronics.com,
	Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 2/2] arm64: dts: imx8mp: Add support for DH electronics i.MX8M Plus DHCOM PicoITX
Date: Sun, 29 Sep 2024 01:48:09 +0200
Message-ID: <20240928234949.357893-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240928234949.357893-1-marex@denx.de>
References: <20240928234949.357893-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Add support for DH electronics i.MX8M Plus DHCOM SoM on PicoITX carrier board.
This system is populated with serial console, EQoS ethernet, eMMC, SD, SPI NOR,
LEDs and USB 3.0 host used in USB 2.0 mode on PicoITX.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Gregor Herburger <gregor.herburger@ew.tq-group.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Mathieu Othacehe <m.othacehe@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-dhcom-picoitx.dts    | 176 ++++++++++++++++++
 2 files changed, 177 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f6b8041c1e8f7..4e33cb33ba297 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -170,6 +170,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-drc02.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dts
new file mode 100644
index 0000000000000..703cf0fb3d2be
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dts
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023-2024 Marek Vasut <marex@denx.de>
+ *
+ * DHCOM iMX8MP variant:
+ * DHCM-iMX8ML8-C160-R204-F1638-SPI16-E-SD-RTC-T-RGB-I-01D2
+ * DHCOM PCB number: 660-200 or newer
+ * PicoITX PCB number: 487-600 or newer
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include "imx8mp-dhcom-som.dtsi"
+
+/ {
+	model = "DH electronics i.MX8M Plus DHCOM PicoITX";
+	compatible = "dh,imx8mp-dhcom-picoitx", "dh,imx8mp-dhcom-som",
+		     "fsl,imx8mp";
+
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	led {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_YELLOW>;
+			default-state = "off";
+			function = LED_FUNCTION_INDICATOR;
+			gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>; /* GPIO I */
+			pinctrl-0 = <&pinctrl_dhcom_i>;
+			pinctrl-names = "default";
+		};
+	};
+};
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
+&fec {
+	status = "disabled";
+};
+
+&flexcan1 {
+	status = "okay";
+};
+
+&gpio1 {
+	gpio-line-names =
+		"DHCOM-G", "", "", "",
+		"", "DHCOM-I", "PicoITX-HW0", "PicoITX-HW2",
+		"DHCOM-B", "DHCOM-A", "", "DHCOM-H", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio2 {
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "", "PicoITX-HW1", "", "", "", "",
+		"", "", "", "", "DHCOM-INT", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio4 {
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "SOM-HW1", "", "", "", "",
+		"", "", "", "PicoITX-Out2", "", "", "", "";
+};
+
+&gpio5 {
+	gpio-line-names =
+		"", "", "PicoITX-In2", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "",
+		"", "", "PicoITX-In1", "PicoITX-Out1",
+		"", "", "", "", "", "", "", "";
+};
+
+/* No HS connector on this SoM variant, so no HDMI, PCIe and only USB HS. */
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
+/* No WiFi/BT chipset on this SoM variant. */
+&uart2 {
+	bluetooth {
+		status = "disabled";
+	};
+};
+
+/* USB_OTG port is not routed out on PicoITX. */
+&usb3_0 {
+	status = "disabled";
+};
+
+&usb_dwc3_0 {
+	status = "disabled";
+};
+
+&usb3_1 {
+	fsl,over-current-active-low;
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	maximum-speed = "high-speed";
+};
+
+/* No WiFi/BT chipset on this SoM variant. */
+&usdhc1 {
+	status = "disabled";
+};
+
+&iomuxc {
+	/*
+	 * The following DHCOM GPIOs are used on this board.
+	 * Therefore, they have been removed from the list below.
+	 * I: yellow led
+	 */
+	pinctrl-0 = <&pinctrl_dhcom_a &pinctrl_dhcom_b &pinctrl_dhcom_c
+		     &pinctrl_dhcom_d &pinctrl_dhcom_e &pinctrl_dhcom_f
+		     &pinctrl_dhcom_g &pinctrl_dhcom_h &pinctrl_dhcom_j
+		     &pinctrl_dhcom_k &pinctrl_dhcom_l &pinctrl_dhcom_m
+		     &pinctrl_dhcom_n &pinctrl_dhcom_o &pinctrl_dhcom_p
+		     &pinctrl_dhcom_q &pinctrl_dhcom_r &pinctrl_dhcom_s
+		     &pinctrl_dhcom_int>;
+};
-- 
2.45.2

