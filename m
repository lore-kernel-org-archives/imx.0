Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20CA3EF0DC
	for <imx@lists.linux.dev>; Tue, 28 Apr 2026 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367145; cv=none; b=Rx5WEw4etUzd3hxYON4kbiGp5wnVu+KFVgwl31QbdXT0QcgqHjK6ZjVm2J67YriZIFHQOArbHyUamObhbn8kHiWQpYVE3SXViXyu75Qr0LyQt9P6k+qK18zbVNpBPuADFuvlr2j+CvZUOgYANOJbOoPC7cpQOL6WKv5J01YaSEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367145; c=relaxed/simple;
	bh=aigFFuG6HH6aSAfLMc9C4iosY1vOdZElDT7mLXUDN4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Q1ONPK0GjKbvC5OD4AVzR7ViXxuWXXTGCryrvf2jGXuKocUDjYRCSNcnZKC+pwozB005aZGORvoAtOllIEitAUmhCPQS2MOpck9eyptJL/sXfrdc35b2R7uTdief00vj9nh3xIO7k+M/Pq7a2VDc5NJWbu4r+MXqao0+WhRGjEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6211D20153F;
	Tue, 28 Apr 2026 11:05:42 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 284F8201613;
	Tue, 28 Apr 2026 11:05:42 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 15FFA1800083;
	Tue, 28 Apr 2026 17:05:39 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH 4/5] arm64: dts: imx93: Cortex-A Core remoteproc device node
Date: Tue, 28 Apr 2026 17:08:18 +0800
Message-Id: <20260428090819.17761-5-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260428090819.17761-1-Jiafei.Pan@nxp.com>
References: <20260428090819.17761-1-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Create device tree for i.MX93 14x14 evk and 11x11 evk, add Cortex-A Core
remoteproc device nodes in these device tree.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
 .../imx93-11x11-evk-multicore-rtos.dts        | 39 +++++++++++++++++++
 .../imx93-14x14-evk-multicore-rtos.dts        | 39 +++++++++++++++++++
 .../boot/dts/freescale/imx93-rproc-ca55.dtsi  | 14 +++++++
 3 files changed, 92 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
new file mode 100644
index 000000000000..9fb2b94b83b4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023-2026 NXP
+ */
+
+/dts-v1/;
+#include "imx93-11x11-evk.dts"
+#include "imx93-rproc-ca55.dtsi"
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * Reserve up to 16MB for one possible RTOS instances running on
+		 * one Cortex-A Cores when booting Linux on at least one Cortex-A Core.
+		 */
+		rtos_ca55_reserved: rtos-ca55@d0000000 {
+			no-map;
+			reg = <0 0xd0000000 0x0 0x1000000>;
+		};
+
+		/* Reserve 16MB for FreeRTOS on M33 */
+		m33_reserved: m33@a5000000 {
+			no-map;
+			reg = <0 0xa5000000 0 0x1000000>;
+		};
+	};
+};
+
+&lpuart2 {
+	status = "disabled";
+};
+
+&clk {
+	init-on-array = <IMX93_CLK_LPUART2_GATE>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
new file mode 100644
index 000000000000..b2481bf19b4a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024-2026 NXP
+ */
+
+/dts-v1/;
+#include "imx93-14x14-evk.dts"
+#include "imx93-rproc-ca55.dtsi"
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * Reserve up to 16MB for one possible RTOS instances running on
+		 * one Cortex-A Cores when booting Linux on at least one Cortex-A Core.
+		 */
+		rtos_ca55_reserved: rtos-ca55@d0000000 {
+			no-map;
+			reg = <0 0xd0000000 0x0 0x1000000>;
+		};
+
+		/* Reserve 16MB for FreeRTOS on M33 */
+		m33_reserved: m33@a5000000 {
+			no-map;
+			reg = <0 0xa5000000 0 0x1000000>;
+		};
+	};
+};
+
+&lpuart2 {
+	status = "disabled";
+};
+
+&clk {
+	init-on-array = <IMX93_CLK_LPUART2_GATE>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi b/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
new file mode 100644
index 000000000000..9d9a60404d2b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024-2026 NXP
+ */
+
+/ {
+	ca55_1: remoteproc-ca55-1 {
+		compatible = "fsl,imx-rproc-psci";
+		/* bitmask:0b10, assign A55 Core 1 */
+		fsl,cpus-bits = <0x2>;
+		memory-region = <&rtos_ca55_reserved>;
+	};
+};
+
-- 
2.43.0

