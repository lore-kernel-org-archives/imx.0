Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683AB3F9F46
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 10:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147062; cv=none; b=Czodk1BGSYM3xbd8T1aFvNA7PQAwLEYdsePeTimqhcRC9xx73w32pKdRMSkW05WA/g7z/sjFmlLFCjmpuW0bzg37Rst7BcomPjnHG3ASUMSzAO6wwRUSr0o96SwRA8byymQY31ellt5JSFaRnUwpBlu0Et0jekoE/0gDwlJ9zCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147062; c=relaxed/simple;
	bh=n8bX9ha7QvLP2UX7KbMpsaXKaBBOue+eru/hMA0jyYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MJQKZ/YPPEgeC/YO3wsBoBUwHHQm2X7lRHXdbkpw+0/lZ7fqxRPQIMGJHnxGQFGPN18gS4L4xIAEQNJ+7ieheymqEOeDS5yBASk+eEVuoqSZv2j9XetVpbhfTYf7SJAc/NUe8i3DgQvPu3Se3rAoZF91kCboPyPgCMTFro69ues=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1woIIL-000792-CL; Mon, 27 Jul 2026 12:10:49 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 27 Jul 2026 12:10:45 +0200
Subject: [PATCH v6 3/5] arm64: dts: imx8mp-skov-revc: convert to overlays
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-3-fa8f71dfc56f@pengutronix.de>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-0-fa8f71dfc56f@pengutronix.de>
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-0-fa8f71dfc56f@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6698;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=n8bX9ha7QvLP2UX7KbMpsaXKaBBOue+eru/hMA0jyYs=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ1a63vK8VPPu6tdi8u9y2jZfWV2he2VOacLCogi51Xecu
 wXPt9d2lLIwiHExyIopsqgsrOAT9fjgGTlNhAtmDisTyBAGLk4BmIhEAcN/zzVb1nXaOJw10Dx7
 dB7fvzXvXsmrTJoWd1C94aZzbgObJcM/G3veu60cT9sK3x6Y5FgtJ3ut9umFEtuZ2vMVJku/jdv
 BCgA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
similar, apart from the Display and touch controller.

Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
variants to use overlays applied on this base version.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  6 +++
 ...ts => imx8mp-skov-revc-jutouch-jt101tm023.dtso} | 44 ++++++---------------
 ...07017.dts => imx8mp-skov-revc-tian-g07017.dtso} | 42 ++++++--------------
 .../boot/dts/freescale/imx8mp-skov-revc-touch.dts  | 45 ++++++++++++++++++++++
 4 files changed, 74 insertions(+), 63 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b46f452f4b988..2caac104bec6e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -434,8 +434,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
+
+imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
+	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
+imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
+	imx8mp-skov-revc-tian-g07017.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
similarity index 65%
rename from arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
rename to arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
index 3e320d6dea3a2..b50960879e82d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
@@ -1,10 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 /dts-v1/;
+/plugin/;
 
-#include "imx8mp-skov-reva.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
-/ {
+&{/} {
 	model = "SKOV IMX8MP CPU revC - JuTouch JT101TM023";
 	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "fsl,imx8mp";
 
@@ -21,13 +23,9 @@ in_lvds0: endpoint {
 	};
 };
 
-&backlight {
-	status = "okay";
-};
-
 &i2c2 {
-	clock-frequency = <100000>;
-	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
 
 	touchscreen@2a {
 		compatible = "eeti,exc81w32", "eeti,exc80h84";
@@ -42,38 +40,20 @@ touchscreen@2a {
 	};
 };
 
-&lcdif2 {
-	status = "okay";
-};
-
 &lvds_bridge {
-	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
-				 <&clk IMX8MP_VIDEO_PLL1>;
-	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
 	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
 	assigned-clock-rates = <0>, <506800000>;
-	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@1 {
+			reg = <1>;
+
 			ldb_lvds_ch0: endpoint {
 				remote-endpoint = <&in_lvds0>;
 			};
 		};
-	};
-};
-
-&pwm4 {
-	status = "okay";
-};
-
-&pwm1 {
-	status = "okay";
-};
-
-&reg_tft_vcom {
-	regulator-min-microvolt = <3160000>;
-	regulator-max-microvolt = <3160000>;
-	voltage-table = <3160000 73>;
-	status = "okay";
+        };
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
similarity index 66%
rename from arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
rename to arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
index 9a562c011f2c2..c4e8f1c93a9c7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
@@ -1,10 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 /dts-v1/;
+/plugin/;
 
-#include "imx8mp-skov-reva.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
-/ {
+&{/} {
 	model = "SKOV IMX8MP CPU revC - TIAN G07017";
 	compatible = "skov,imx8mp-skov-revc-tian-g07017", "fsl,imx8mp";
 
@@ -21,13 +23,9 @@ in_lvds0: endpoint {
 	};
 };
 
-&backlight {
-	status = "okay";
-};
-
 &i2c2 {
-	clock-frequency = <100000>;
-	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
 
 	touchscreen@38 {
 		compatible = "edt,edt-ft5506";
@@ -44,38 +42,20 @@ touchscreen@38 {
 	};
 };
 
-&lcdif2 {
-	status = "okay";
-};
-
 &lvds_bridge {
-	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
-				 <&clk IMX8MP_VIDEO_PLL1>;
-	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
 	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
 	assigned-clock-rates = <0>, <358400000>;
-	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@1 {
+			reg = <1>;
+
 			ldb_lvds_ch0: endpoint {
 				remote-endpoint = <&in_lvds0>;
 			};
 		};
 	};
 };
-
-&pwm4 {
-	status = "okay";
-};
-
-&pwm1 {
-	status = "okay";
-};
-
-&reg_tft_vcom {
-	regulator-min-microvolt = <3160000>;
-	regulator-max-microvolt = <3160000>;
-	voltage-table = <3160000 73>;
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
new file mode 100644
index 0000000000000..17750b5e94d43
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "imx8mp-skov-reva.dtsi"
+
+/ {
+	model = "SKOV IMX8MP CPU revC";
+	compatible = "skov,imx8mp-skov-revc", "fsl,imx8mp";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	status = "okay";
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

