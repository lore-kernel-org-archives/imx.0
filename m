Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B03352C51
	for <imx@lists.linux.dev>; Sun,  5 Jul 2026 20:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783281959; cv=none; b=Ba/Mnviaua70DC/+aSGzRc/iiCty/xJskXqs0G/CULKTIl5VniRLKnXHFqngf5OWaFf+9rptmpS+BPbUqjP50cAbCINjTGdjFykfEjiXcsNUAf6U+PKk77KtZ8z0zUUfsRfCdpA16CbfAxNw9qMcZG6GL5cHEuFIIr9SLmwjiyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783281959; c=relaxed/simple;
	bh=Jl0ghXm6EdjJWTw0GfwYQBSJF12qC90XNYP+6xQoa6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahtl7noqYTICRr5d6IBFAk7sg3AweB9wauMUiwk/CxS3TGpzOVIKmukrKQ6jFz+ZjuWkAxkxeSs2pKDK9eyNsV2403inp3uQ6Hv1DujcQhgvJ+ioEfUrt8lVb3rkD11JbxGj3IILMG+MTPrERNGqy7THwoM3+D/MF8Jq5z3TJsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=bPf2OG2l; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="bPf2OG2l"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55690117463;
	Sun,  5 Jul 2026 22:05:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783281950; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=XM5W4DfyB3qfIV1WvWwTJqADvmPDKraCINZwywM165I=;
	b=bPf2OG2l/sSbiybqMYhLM9YiJJhyWOmN36Bn0BOgYQBVFHFaWNLKIlSLceOpPfDgpfM2c0
	x6XDcNi5XmPt3uxhV+PQFd4xhu5N1GgXTxeGP5AGaVqo1s6HAPD6YEJ2pPNPpcL1e+LS1u
	bjWrua4xhPU0iJsAHyo+spRz8Y+GZmOrw9gcT7F02mzkm4iP2Zq4i7huMi8K1xhmsOOQdE
	abptyD4QCaLQ+xYBtqFG+5sG5NEBNCxuPY2MsscuzFVEuw+YrscOdkEu7YW2y4hBGuKAV3
	oISCtWI08UR8H6qEUnEeyjWW39Te/WokzMGdTjcE2uboU9qM3nEMVuoIGGBaNg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Date: Sun,  5 Jul 2026 22:05:09 +0200
Message-ID: <20260705200534.151803-4-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260705200534.151803-1-marex@nabladev.com>
References: <20260705200534.151803-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT overlay which adds CM4/CM7 extras so that CM4/CM7 firmware could
be used with remoteproc and rpmsg, but without imposing the overhead
on every user of the platform. The CM4 variant applies to i.MX8M Mini,
while the CM7 variant applies to i.MX8M Plus .

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Deduplicate the DTOs further
V3: New patch split from the original megapatch
V4: Rebase on next-20260703
---
 arch/arm64/boot/dts/freescale/Makefile        | 12 ++++
 ...imx8mm-data-modul-edm-sbc-overlay-cm4.dtso | 56 ++++++++++++++++++
 ...imx8mp-data-modul-edm-sbc-overlay-cm7.dtso | 57 +++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 54108037da8db..47b2ba45ba42b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -120,6 +120,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 
+imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-cm4.dtbo
+
 imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
 	imx8mm-data-modul-edm-sbc.dtb \
 	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
@@ -157,6 +161,8 @@ imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900-dtbs := \
 	imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-cm4.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-cm4.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
@@ -300,6 +306,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
 
+imx8mp-data-modul-edm-sbc-overlay-cm7-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-cm7.dtbo
+
 imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
 	imx8mp-data-modul-edm-sbc.dtb \
 	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
@@ -379,6 +389,8 @@ imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902-dtbs := \
 	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-cm7.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-cm7.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
new file mode 100644
index 0000000000000..8d681c0eff0d4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mm-clock.h>
+
+&{/} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {	/* CM4 reserved memory */
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		m_core_reserved: m_core@b7000000 {
+			reg = <0 0xb7000000 0 0x1000000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@b8000000 {
+			reg = <0 0xb8000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@b8008000 {
+			reg = <0 0xb8008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@b80ff000 {
+			reg = <0 0xb80ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@b8400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0xb8400000 0 0x100000>;
+			no-map;
+		};
+	};
+
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		clocks = <&clk IMX8MM_CLK_M4_CORE>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
+		syscon = <&src>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso
new file mode 100644
index 0000000000000..21e2a8c0bab0a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+&{/} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {	/* CM7 reserved memory */
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		m_core_reserved: m_core@54000000 {
+			reg = <0 0x54000000 0 0x1000000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
+	};
+
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7-mmio";
+		clocks = <&clk IMX8MP_CLK_M7_CORE>;
+		fsl,iomuxc-gpr = <&gpr>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
+		syscon = <&src>;
+	};
+};
-- 
2.53.0

