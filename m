Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C4F3E7BCC
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 07:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791748; cv=none; b=rH4Gaw5WN483Hqu635uRSm+VAW+1L33VEDVgp0vQ0jxRTvv1LieP/KMARW3FSuojKmHq0zd0VSTGTvfac9gNID6MA4STq23e+4Gjbg33ChG4VLdtCfDUca+i9HkdVTdqoiJ+EPl51ImiWOwtnbAroGDa6PU87tJCMZ/VBO0copA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791748; c=relaxed/simple;
	bh=0bQtdyFigB+s+doexXkek5DkKQPbH5nhGDIQe+exi5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IKr8562QLBCGKISi7qt5IRoeZm3KnIcN5fx056Jr/FJ464cl7kRazZI5TFa+kIBTDUy/ulAiYprVMiZxITzSOFjY1Yk50rroPHhMlUVQweLIOg6JbbBRdM6O6VNsW46WghIny7EsUwoLKB8b9W9+nLTwpX12CQQMzXYKqiO7Puo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=sXjLQ581; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="sXjLQ581"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1784791740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=91rdVwNiLBWx9A2v0nJpGTlKC7e08pKWDHF8nFaF1Q4=;
	b=sXjLQ581ufDE/17SSK/0pMXGvCWSzKWq7f+5Mm+GUxG/FhCzZ7uMsEmN8BDaKOBVkK5Os+
	g2DtIPqsCM6JZH73rCYWfTQCAB7Zeg+9Vu24tSZPrN1YJH0q2FPTNxAqhV024CL+Roy5gG
	/m98c2K2GfjnnDxf4TeQ5/FCnmIVKXQNNFUebbmR13IAkSPyQ+bqc1Hiq0Tjl4kxbq6sMt
	LRjk2snqN7rk4+QLpjfF5Ip+98eGjRd3CsSzjKtFdNbpn5Tb0JkvK2m3MrRs+kU0YmUjxD
	XtN3bvLrJSE87PpEyEO+DRuPr+mllcwji37JUw1BUasDu+WmhzX2j0JUDbbOPw==
Date: Thu, 23 Jul 2026 09:27:33 +0200
Subject: [PATCH v3 11/11] arm64: dts: Enable EdgeLock Secure Enclave on all
 i.MX91/i.MX93 boards
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-11-e26930345b4c@kontron.de>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=10266;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=F7Nhp0IrABRm7B3/5FbrjrOUdSosMPbNZOjWENPZQU0=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvx0DatH27WN7t04jhjnl95HBJ3ur9xz/7VO7an3PfY2
 W/tF8jbUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMBHN+YwMC5jfln06cuYwdxJ/
 hcpp/jpFKfcDqn+Pfz7KI+V8/MpxWUaGTuPkPxeOTEo96a60ha3u3Hv7+CUryx7dkmWwypDezJP
 JCgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Include the common dtsi to enable the firmware node for all boards
based on the i.MX91 or i.MX93 SoC.

For the TQ-Systems i.MX91 TQMa91xxCA / TQMa91xxLA SOM that already has
a node for the reserved memory, keep the current settings.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts         |  1 +
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts      |  1 +
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts        |  1 +
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts           |  1 +
 arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi      |  1 +
 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi         | 15 ++++++++-------
 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi         |  1 +
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi          |  1 +
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi        |  9 +++++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi |  1 +
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts        |  1 +
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts         |  1 +
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts           |  1 +
 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi    |  1 +
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi      |  1 +
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi         |  1 +
 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi         |  1 +
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi          |  1 +
 18 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 5716febb5a50..7813a3cf215b 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx91.dtsi"
+#include "imx93-firmware.dtsi"
 
 / {
 	compatible = "fsl,imx91-11x11-evk", "fsl,imx91";
diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
index 62dc1dedfb0e..b5a042a58b57 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx91.dtsi"
+#include "imx93-firmware.dtsi"
 
 / {
 	compatible = "fsl,imx91-11x11-frdm-s", "fsl,imx91";
diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
index c25561574d3f..20c7e4989367 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx91.dtsi"
+#include "imx93-firmware.dtsi"
 
 / {
 	compatible = "fsl,imx91-11x11-frdm", "fsl,imx91";
diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index ea8cf14e0bc6..430c0402138b 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx91.dtsi"
+#include "imx93-firmware.dtsi"
 
 / {
 	compatible = "fsl,imx91-9x9-qsb", "fsl,imx91";
diff --git a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
index 8b8cb3daecbb..509d869a216b 100644
--- a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/regulator/nxp,pca9450-regulator.h>
 
 #include "imx91.dtsi"
+#include "imx93-firmware.dtsi"
 
 / {
 	model = "PHYTEC phyCORE-i.MX91";
diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi b/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
index c99d7bc16848..ad66fea4099a 100644
--- a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
@@ -7,6 +7,7 @@
  */
 
 #include "imx91.dtsi"
+#include "imx93-firmware.dtsi"
 
 /{
 	model = "TQ-Systems i.MX91 TQMa91xxCA / TQMa91xxLA SOM";
@@ -31,13 +32,6 @@ linux,cma {
 			size = <0 0x10000000>;
 			linux,cma-default;
 		};
-
-		/* EdgeLock secure enclave  */
-		ele_reserved: ele-reserved@a4120000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0xa4120000 0 0x100000>;
-			no-map;
-		};
 	};
 
 	/* SD2 RST# via PMIC SW_EN */
@@ -58,6 +52,13 @@ &adc1 {
 	vref-supply = <&buck5>;
 };
 
+&ele_memory {
+	/delete-property/alloc-ranges;
+	/delete-property/size;
+	reg = <0 0xa4120000 0 0x100000>;
+	no-map;
+};
+
 &flexspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexspi1>;
diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
index a9e44efad13f..2e1830c33012 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx91.dtsi"
+#include "imx93-firmware.dtsi"
 
 / {
 	model = "Variscite DART-MX91 Module";
diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
index b30a0d8a81ba..87db0abb8257 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
@@ -11,6 +11,7 @@
 /dts-v1/;
 
 #include "imx91.dtsi"
+#include "imx93-firmware.dtsi"
 
 /{
 	model = "Variscite VAR-SOM-MX91 module";
diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a1a7e6a0571b..60798b216438 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -46,6 +46,15 @@ A55_0: cpu@0 {
 		};
 	};
 
+	firmware {
+		hsm0: secure-enclave {
+			compatible = "fsl,imx93-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			status = "disabled";
+		};
+	};
+
 	osc_32k: clock-osc-32k {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
index f48e7947cf64..65db986fc7ba 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/usb/pd.h>
+#include "imx93-firmware.dtsi"
 
 / {
 	aliases {
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index bd14ba28690c..0bd19988ce9f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
+#include "imx93-firmware.dtsi"
 
 / {
 	compatible = "fsl,imx93-11x11-frdm", "fsl,imx93";
diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index ec78c03f4788..0e5c7d1ed4ee 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
+#include "imx93-firmware.dtsi"
 
 / {
 	model = "NXP i.MX93 14X14 EVK board";
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 01c11c517986..694f114aef36 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
+#include "imx93-firmware.dtsi"
 
 / {
 	model = "NXP i.MX93 9x9 Quick Start Board";
diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index c79b1df339db..c9aa764cc3b8 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include "imx93.dtsi"
+#include "imx93-firmware.dtsi"
 
 / {
 	model = "Kontron OSM-S i.MX93";
diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 325e465d0056..076716cc2095 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/regulator/nxp,pca9450-regulator.h>
 
 #include "imx93.dtsi"
+#include "imx93-firmware.dtsi"
 
 /{
 	model = "PHYTEC phyCORE-i.MX93";
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index ce34a296495c..159be0d5dfde 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include "imx93.dtsi"
+#include "imx93-firmware.dtsi"
 
 /{
 	model = "TQ-Systems i.MX93 TQMa93xxLA/TQMa93xxCA SOM";
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
index 69495bb7fc9f..122a8a091c80 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -12,6 +12,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
+#include "imx93-firmware.dtsi"
 
 / {
 	model = "Variscite DART-MX93 Module";
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 24063bf8183d..50aec264f87c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "imx93.dtsi"
+#include "imx93-firmware.dtsi"
 
 /{
 	model = "Variscite VAR-SOM-MX93 module";

-- 
2.55.0

