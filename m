Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EDD3B1EC6
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 17:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876989; cv=none; b=SVxKKh46eky8AOwlVWG4v3/F0g6a0Rfr+hPHaxLt6pmMmU8c8zg26n1kIPBkXNK0mYno5V8KEvKy1zg8uH4Tj35k/pbJ5IkOQolz542bqBZ5V0SMeFkXPN/RGyIr9lauyJdO1GcW4tw8+I1QV5sTE8xipzvMp3MlgLuOwpIdjVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876989; c=relaxed/simple;
	bh=3v/50fGKi9CerdXpmhYxfasLFOTG7uT+oId4ylkOG94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U2WCwuK9LPqgJrKLzLGqIh7fwtaPqp1cGzNW4l0Qn54FiWKAh5cMWGzFKaPHT8gxznyuj47THvmQeytKCv5CZkjBpH7JP3cJPIt6O06UcHXa2pv0S1RiuF3EmzKSewgBBnsfIh7U47RgqBW5vPnuy58lePAVHW3PIEAWj+yQ9lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ZTezjDHB; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ZTezjDHB"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 01B5C201A7;
	Thu,  1 Oct 2026 19:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876975;
	bh=y2NgTG7rGsXdrhvndHhrNaNnf4uSsVGwv9jNiMemkYI=; h=From:To:Subject;
	b=ZTezjDHBzJ448GbiP2Ec+BWGCsQIt9rNVwunWB+WZ+e38oqyea2nHcSM/MUGn4WVF
	 SIj3DdbYHFSoltrFTH+EQ1IXlyxmCDYnM8+FRC9shoeh6ZQlmLTisL+TFABJibI/Ew
	 O3lACCfv6fYx7kVAbPgschCHD9G37mB+vgYFDrOe7Bqsw2WkMBfCWablnbTjht26Vc
	 8IYw+NzebsWmTwyqgFDy+PimN5UW5ugojSUDDxcfw4Dz9eKAhwX2oxr3iYG4G+hhIK
	 N4qScQXbKL4JRSRbsNVNbWbsNgjq+GBymXo5o3TT9fb+eBztmiXIwqRPxozqvBoBpr
	 SLuB/E5lDW9OA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/7] ARM: dts: imx6ull-colibri-emmc: Add Toradex Resistive Touch Display 7" Parallel
Date: Thu,  1 Oct 2026 19:49:15 +0200
Message-ID: <20261001174924.3831455-7-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001174924.3831455-1-francesco@dolcini.it>
References: <20261001174924.3831455-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Colibri iMX6ULL eMMC parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch.

The overlay content is identical to the Colibri iMX7 eMMC one. To
avoid duplicating it, rework the Colibri iMX7 eMMC overlay moving its
content to a new dtsi shared between the two modules, and include it
from both overlays.

The overlay is also combined with the Eval carrier board device tree to
provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 ++++
 ...i-emmc-panel-res-touch-7inch-parallel.dtso | 16 ++++++++++
 ...olibri-panel-res-touch-7inch-parallel.dtsi | 30 +++++++++++++++++++
 ...i-emmc-panel-res-touch-7inch-parallel.dtso | 18 +----------
 4 files changed, 53 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index d7639ef9ab44..83f65b031e55 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -365,6 +365,10 @@ imx6ull-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter-dtbs :
 	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
 
+imx6ull-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
+	imx6ull-colibri-emmc-eval-v3.dtb \
+	imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtbo
+
 dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-14x14-evk.dtb \
 	imx6ul-ccimx6ulsbcexpress.dtb \
@@ -396,11 +400,13 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
+	imx6ull-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \
 	imx6ull-colibri-emmc-iris.dtb \
 	imx6ull-colibri-emmc-iris-v2.dtb \
 	imx6ull-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
 	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
 	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtbo \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-iris.dtb \
 	imx6ull-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..b8bb86809031
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector.
+ *
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi
new file mode 100644
index 000000000000..2159b9788064
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector, shared by the Colibri iMX6ULL eMMC and
+ * Colibri iMX7 eMMC overlays.
+ *
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+&ad7879_ts {
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhr";
+
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso
index b926cc020e62..4ff1ae821967 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso
@@ -13,20 +13,4 @@
 /dts-v1/;
 /plugin/;
 
-&ad7879_ts {
-	status = "okay";
-};
-
-&backlight {
-	status = "okay";
-};
-
-&lcdif {
-	status = "okay";
-};
-
-&panel_dpi {
-	compatible = "logictechno,lt161010-2nhr";
-
-	status = "okay";
-};
+#include "imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi"
-- 
2.47.3

