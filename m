Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065DC3EEAC3
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895821; cv=none; b=hAoC/hjxdL1YPZA9BwMVGltsxzri+OnmClMqmIvjVgRFFoNf1x4i94mggct0oUwcLpD5CWBrDQKLz7AVlia1q/tklIZ5B+/H9bUPDD4G/hIz7CEI6S0Dd3PrMLI7o/ysjCQ+GEp9GPAjhjcWe+gMdki/pz35i2L13E4UqLKStzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895821; c=relaxed/simple;
	bh=8BTgJY7f8umnygoGx9lArRpKcNsZ5rvai7faGnydFA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMMpF3oNsulAF5mYvLrwJYGJHVJ3TuhzTzCq7BNd0KBLfTkh4xmZ83uzES/BLmHW5cOmRfc8pwkHEtxYZbepH6cRICS08rSsBGID7sGWOVemTtKap1clS1rc7LPm+rn8k4+SCeGTM1dKtszJzbSgp8Cmcz1liC9WWn4903zEVUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1weqLE-00051f-WC; Wed, 01 Jul 2026 10:30:45 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Wed, 01 Jul 2026 10:30:23 +0200
Subject: [PATCH v3 2/2] arm64: dts: imx8mp-skov: support new 7inch panel
 board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-2-d74f7e3f8293@pengutronix.de>
References: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de>
In-Reply-To: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3082;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=8BTgJY7f8umnygoGx9lArRpKcNsZ5rvai7faGnydFA8=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ5bLBePJNxwvFv5d2t/xM/HWuQrbC3+7F7+adEnbsuvzv
 l1T2Ly+dpSyMIhxMciKKbKoLKzgE/X44Bk5TYQLZg4rE8gQBi5OAZjIrwsM//0vTrYNvV/5g3G3
 RkLtp23XXkuvNJzmfWXnZe3ASrbIA7aMDI/a/91mahY6zD3T4fmCsJ1Jm/iiIq9aF7z3/vCAdau
 nMhcA
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

This board is similar to the already upstream
imx8mp-skov-revc-tian-g07017.dts but uses a different 7" panel with a
different touch controller.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  1 +
 .../imx8mp-skov-revc-jutouch-jt070tm041.dts        | 79 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8ddaab127ab9c..efca29735b2cb 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -435,6 +435,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt070tm041.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dts
new file mode 100644
index 0000000000000..56374f1e67663
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "imx8mp-skov-reva.dtsi"
+
+/ {
+	model = "SKOV IMX8MP CPU revC - JuTouch JT070TM041";
+	compatible = "skov,imx8mp-skov-revc-jutouch-jt070tm041", "fsl,imx8mp";
+
+	panel {
+		compatible = "jutouch,jt070tm041";
+		backlight = <&backlight>;
+		power-supply = <&reg_tft_vcom>;
+
+		port {
+			in_lvds0: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight {
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	touchscreen@2a {
+		compatible = "eeti,exc81w32";
+		reg = <0x2a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupts-extended = <&gpio4 28 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+		vdd-supply = <&reg_vdd_3v3>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+				 <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
+	assigned-clock-rates = <0>, <358400000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&in_lvds0>;
+			};
+		};
+	};
+};
+
+&pwm4 {
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&reg_tft_vcom {
+	regulator-min-microvolt = <3160000>;
+	regulator-max-microvolt = <3160000>;
+	voltage-table = <3160000 73>;
+	status = "okay";
+};

-- 
2.51.0

