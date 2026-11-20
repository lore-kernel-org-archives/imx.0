Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167363;
	b=4b89QcAzTGj+xpXtwgpSYtZd4N4Az/PvrCv/nzNl887Izma26tLdk2rslX84lyujbr1I
	 A9smNea0PpDDkJnwMuxwNS5PDNBj9g5B19EN2unDNnSCLkFiVIMBi3ykQDOcW4oC68gRI
	 +OHfiLAIkUu0AclsQmKOPJJTNKIrDTBSg6cCZXSRLKHtFcvaYRQTSGQ+RMlk2JTwdbP52
	 NWqsJd8m1KnyU21x/we4kWm47pAZZQBFIJ3vuMwjwPYMnhNN7Ed4oswDCUjp2VtltETNO
	 JFNa5RcoSFZ3XoWGNgo//0trdKOuG4XTRefH52zvwoJ25PiN4pJbTdP19L2SQhmbA6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/hW96zxuTk5ld/IlSdO1JUuxAcYc/tMjLiVGZKJqIFk=;
	b=GBSwxFlnfU+lOm+UD0UhJgWV+1yUquCMoZq7beel6ndCBn4Cf+5azf1y8fdDj6VVqtrs
	 5/a9Of9tQF9ng6q633K67AoVzr50xJXwmp7G185k+j7xsVfQimdacBfPiivNcpiz/sAR2
	 GidrHpfZrH90pqOQvXitOVOtyeTWwNYEWFeUkLFZjpC1cxb7j2d40qO6nEfrc4qUTXaqV
	 LqrMCbhJDbwH3Ll2/e4YExjteCE8xGWHf5FjaN76NUg4S4kjchbg/BQeb0u0ifDQzac/H
	 44vxg6iPLmHaQbLOh1QJHGbFWyekWP/YQOwt9pLqD6Sz6zpgUfRAK8MmDeFfP9B3gJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gBv7mSIe;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E53606A325
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 09:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E53606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gBv7mSIe
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49d64a88222so1164056f8f.1
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 01:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167361; x=1795772161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hW96zxuTk5ld/IlSdO1JUuxAcYc/tMjLiVGZKJqIFk=;
        b=gBv7mSIel/WBHU9K0QgeigaJ/P1Rc59liBdMCzZMB+tK6ufQh4sOPGgo2ZEIxZGy65
         5UJaexTNvvgUiBycxweSapDZy8soUiOdNc1i7XMmo8GjwbIoPo/gJQuTBNYLD+aDFlTW
         RRmaxdObXXzLHZR64569MiIj/9BJAD1IqzNcocMnBNQl9hSBLnc4Hs+ZX7zv0Ee19Zft
         8sc6ZXzooNzOSjv2d4IpdL7Pz6IJYv50xkJq0hdfefKqYdsHsuFsmBfxXPdgjEGJ6HI1
         NHRgWKiNHfv25yIDJJEs8tK+FWyNACqd8Ee8GOqIgwCOBQYZ8aXazKbfs2vC7taw5/fc
         k4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167361; x=1795772161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hW96zxuTk5ld/IlSdO1JUuxAcYc/tMjLiVGZKJqIFk=;
        b=QESRpPLtltkXrCB8ihkd6R0pocjl0nm7BAUGwxg72ucKpWJKzip3m2P6NqV/ngaPPE
         tjonmjTcJrsx8SIWg2k1sGukqsQRukuU6YjHKcRGmYvD6Aflid4luKpDsOPJeYOuhyMp
         Z8QcLFj+uGXOTNAozGLJBiurDOweHHiebLcRFjrZ+SV1UBbm0aEkTKTUdjE20iJ7RaQN
         kJKtyydVOYo1pX7Wctr/ndoDP9kOU+pecxIigdDYt+nUPpym8StCwvG7Xzr3GI02SgXx
         z/y848hNEwcpdHA/8KQSotIvfVqXnO/x6j2bQydw6O+t62Kt4dTzraWjZ90vLUadj8Ea
         /inA==
X-Forwarded-Encrypted: i=1; AL+hErGhAVqrKIMiGuax0VzXigHrKCOoInx0Vqo7S8RBN/aYPsTM92th8pvbrraJcZf0rca4f6I=@lists.linux.dev
X-Gm-Message-State: APuU4Z/8cdnJzWf/SUkIveSMNk7QdcsmyenhrqcTJ8aNLdvEmO/CkrDj
	Jd/lSzTfgQ9voTWrurNSsnmj9LgDUZINkXroaoz2zoy+WFBZ8L2XYXMgHAhFog==
X-Gm-Gg: AZFdTZctsiXOzI/qc1cME2l1PKOk4BUrVPgHpPhxVKR7eYQPEKqytPra/0DQn2VJxhZ
	O+oY814OPc0qEyynSST2ab3/xLkTmQ3UF+cBKxfns00UR3vjGUofdI8008UPBtI/SyrA29CT8RU
	s4oIOF1asBQ1OrZj7Nj+/qIxm/LBvLXFN7to8fXs+htMLy0cQsg06mquAu/fdXEiyiBKgCdWmC0
	WOD0EK+iGA091dIVar4Q0Vg97sDVfuvk2RxZYmjYWPfC670KbPHY0v0Hjo0VrHTHR9Ms3+ZKnXl
	MJW+2FOzv5KFQd1OB0+wMk1Z+y37zoOiQGMBFPWfy2VPG5z93UVW+ocyoxAqizlHOKp1CdX9HW0
	ojghnpfh7IMHZIzVevnTS47U+xbm/iAmlyP1hSzFK/RMJnGEnule5WZ5hb5wZXEH1d8xCfExEup
	2OiIu23Vp0JJfbd2/WaaxMe/xPr7s+uOUSIQCW81xjTjC90J85dG//T7+0yU6OgaHBx4Dipf3we
	re4WcFJpYe/LGcdClLwkLXV/XeuPx9eqZA8lZLEotSnsdTnV6i+1F0U7nomsZC7BA+KkLKUG1QN
	u42elG3zKLNMJdeVqkfBFi41n19uQXuW7U1i9V9SM102oeLQrJWupAtZKGD5TssUR8eNRShxDQ5
	tRcY7A8btTvyhUCsmkK4MU6uM0fUd0vkP5yjLJrr1IXX0+Os=
X-Received: by 2002:a05:6000:184b:b0:4a7:9630:7b36 with SMTP id ffacd0b85a97d-4abb3f15ddbmr5085151f8f.21.1795167361168;
        Fri, 20 Nov 2026 01:36:01 -0800 (PST)
Received: from GLaDOS.station ([193.207.34.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm4664645f8f.57.2026.11.20.01.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:36:00 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Fri, 20 Nov 2026 10:35:57 +0100
Message-ID: <20261120093557.4513-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add Cortex-M4 configurations for DART-MX8M-MINI on Sonata and
VAR-SOM-MX8M-MINI on Symphony.

Share the reserved memory and remoteproc configuration through a common
include, and add overlays and combined -m4 DTBs for remoteproc and RPMsg
support.

Reserve ECSPI1, I2C4, PWM3 and UART3 for the Cortex-M4 firmware. On Sonata,
also disable the buttons and PCIe, which depend on GPIO expanders on
I2C4.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Change disabled status for peripherals reserved to m4

This patch depends on commit ebb21cc5d1c0
("dt-bindings: remoteproc: imx_rproc: Document memory-region-names to avoid implicit ABI")
for validation of the new memory-region-names property:
https://lore.kernel.org/r/20261023-memory-region-name-v9-1-ad597887dfe9@nxp.com

v1->v2:
 - Add memory-region-names as requested by Frank Li.
 - Convert the Sonata M4 configuration to an overlay, so both boards use
   the same approach and the overlays can be reused across board variants.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx8mm-var-common-m4.dtsi   | 62 +++++++++++++++++++
 .../freescale/imx8mm-var-dart-sonata-m4.dtso  | 49 +++++++++++++++
 .../freescale/imx8mm-var-som-symphony-m4.dtso | 31 ++++++++++
 4 files changed, 151 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..c542613ed3ea 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -245,9 +245,18 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
+
+imx8mm-var-dart-sonata-m4-dtbs := imx8mm-var-dart-sonata.dtb imx8mm-var-dart-sonata-m4.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtbo
+
+imx8mm-var-som-symphony-m4-dtbs := imx8mm-var-som-symphony.dtb imx8mm-var-som-symphony-m4.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-legacy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw71xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw72xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw73xx-0x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
new file mode 100644
index 000000000000..ba2457d0ec91
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M4 configuration for Variscite i.MX8M Mini modules
+ *
+ * Link: https://www.variscite.com/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include <dt-bindings/clock/imx8mm-clock.h>
+
+&{/} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		vdev0vring0: vdev0vring0@40000000 {
+			reg = <0 0x40000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@40008000 {
+			reg = <0 0x40008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@400ff000 {
+			reg = <0 0x400ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@40400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x40400000 0 0x100000>;
+			no-map;
+		};
+
+		m4_reserved: m4@7e000000 {
+			reg = <0 0x7e000000 0 0x1000000>;
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
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&m4_reserved>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+				      "m4-reserved-ddr", "rsc-table";
+		syscon = <&src>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
new file mode 100644
index 000000000000..2f290c3ae467
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M4 support for Variscite DART-MX8M-MINI on Sonata-Board
+ *
+ * Link: https://variscite.com/carrier-boards/sonata-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-var-common-m4.dtsi"
+
+/* The buttons use a GPIO expander on I2C4. */
+&{/gpio-keys} {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M4 firmware. */
+&ecspi1 {
+	status = "reserved";
+};
+
+/*
+ * Keep the touchscreen enabled without its optional reset GPIO, since the
+ * GPIO expander on I2C4 is unavailable to Linux.
+ */
+&ft5x06_ts {
+	reset-gpios = <0>;
+};
+
+&i2c4 {
+	status = "reserved";
+};
+
+/* The PCIe reset uses a GPIO expander on I2C4. */
+&pcie0 {
+	status = "disabled";
+};
+
+&pwm3 {
+	status = "reserved";
+};
+
+&uart3 {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
new file mode 100644
index 000000000000..ff5675cfc191
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M4 support for Variscite VAR-SOM-MX8M-MINI on Symphony-Board
+ *
+ * Link: https://variscite.com/carrier-boards/symphony-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-var-common-m4.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M4 firmware. */
+&ecspi1 {
+	status = "reserved";
+};
+
+&i2c4 {
+	status = "reserved";
+};
+
+&pwm3 {
+	status = "reserved";
+};
+
+&uart3 {
+	status = "reserved";
+};
-- 
2.47.3

