Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E7B3F0749
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 14:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668048; cv=none; b=cCJXUGR0Zh25+Mt1ghZu56gjFUgpAeysY7cpFadzRMPOHMjHXUxwJyvPLvm90d+XX4kQou4kplEMSDzWCOpiM2+YCCYdwxHdleZE9fu8U+eShpRzIAwR0I5/vqT54z57NrLSPYp5g5BjXVmC8Jcwpu80gx3+ts9CQ7NQx40EWws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668048; c=relaxed/simple;
	bh=3VHOcW9kxyUjODqpQ7VsTKunUn8tQMR+mQBurSeAOfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rIJXBW9wI+qgAomYOPbLwZzbZDIJrI0+egCgKLsbCtGDxsLNzqBiiGTnS7P+v35DKQ++FmMtAz0KXxPuTDXPAf8PPFGl0bx/KKf5Z4KNzWhvnnEA4l69jEjx+mRkISypJ/1BAcgXcf+qAYACtuWW45j2sINRlxiJxdIpWApbrF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=a/YSjoaT; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="a/YSjoaT"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7D3411C1C3;
	Tue, 25 Aug 2026 16:27:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787668040; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=JN5Hdn5ph1QM281u5yaMJyJDTIp+8QzT+CS0/RbmYkE=;
	b=a/YSjoaTmZhlI16tmi+dBPV2qdmnZFrDZUaBLRQmLjl4wn7lQfgQE3xtqBeBCRtfLdhNnZ
	SD8zJMOCB4sXsSXSVKF3peoBXs/JmOH6StQ7NBuWRs4y8e2dKDDhwvCAZmGqUFre1PBABV
	Bmlig8G/NX753b2pjhGjOnVHdgXUMlx4P7zpn5SS/cob2h8jjnUOKkzMU2DyEb49pPYbXM
	yLyRltgAagD/3Qwy4dzcV6dsMeKdZU6iAZ5y62mhXhRrgFahyLw0KLM5ULJc352zQsi/Ez
	X0kufg0J6n3UHkVntrklipXRmCSmFBLWAlOQC/wysgvNAFWh92kLZA1/ooTiqA==
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
Subject: [PATCH v2] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard configuration EEPROM layout DTOs
Date: Tue, 25 Aug 2026 16:26:40 +0200
Message-ID: <20260825142718.866803-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT overlays which describe configuration EEPROM VHIP section,
for VHIP section v1.0.0.0, v1.1.0.0, v2.0.0.0, used on ifm VHIP4
EvalBoard .

With the DTO applied, the VHIP section fields become accessible via
sysfs nvmem interface. The entire EEPROM is accessible via the nvmem
interface as well.

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
NOTE: Depends on https://lore.kernel.org/all/20260810213456.1268831-2-marex@nabladev.com/
V2: s@comatibility@compatibility
---
 arch/arm64/boot/dts/freescale/Makefile        |  17 ++-
 .../imx8mn-vhip4-overlay-eeprom-1000.dtso     | 103 +++++++++++++++++
 .../imx8mn-vhip4-overlay-eeprom-1100.dtso     | 103 +++++++++++++++++
 .../imx8mn-vhip4-overlay-eeprom-2000.dtso     | 107 ++++++++++++++++++
 4 files changed, 329 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1000.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1100.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-2000.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf5..1215d8f6aa813 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -245,15 +245,25 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony-legacy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-venice-gw7902.dtb
 
+imx8mn-vhip4-evalboard-v1-overlay-eeprom-1000-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
+						      imx8mn-vhip4-overlay-eeprom-1000.dtbo
+imx8mn-vhip4-evalboard-v1-overlay-eeprom-1100-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
+						      imx8mn-vhip4-overlay-eeprom-1100.dtbo
 imx8mn-vhip4-evalboard-v1-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
 						  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtbo
 imx8mn-vhip4-evalboard-v1-overlay-ksz9031-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
 						  imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtbo
 imx8mn-vhip4-evalboard-v2-overlay-adin1300-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
 						   imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtbo
+imx8mn-vhip4-evalboard-v2-overlay-eeprom-1100-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
+						      imx8mn-vhip4-overlay-eeprom-1100.dtbo
+imx8mn-vhip4-evalboard-v2-overlay-eeprom-2000-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
+						      imx8mn-vhip4-overlay-eeprom-2000.dtbo
 imx8mn-vhip4-evalboard-v2-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
 						  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-vhip4-evalboard-v1.dtb \
+			  imx8mn-vhip4-evalboard-v1-overlay-eeprom-1000.dtb \
+			  imx8mn-vhip4-evalboard-v1-overlay-eeprom-1100.dtb \
 			  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtb \
 			  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtbo \
 			  imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtb \
@@ -261,8 +271,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-vhip4-evalboard-v1.dtb \
 			  imx8mn-vhip4-evalboard-v2.dtb \
 			  imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtb \
 			  imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtbo \
+			  imx8mn-vhip4-evalboard-v2-overlay-eeprom-1100.dtb \
+			  imx8mn-vhip4-evalboard-v2-overlay-eeprom-2000.dtb \
 			  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtb \
-			  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo
+			  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo \
+			  imx8mn-vhip4-overlay-eeprom-1000.dtbo \
+			  imx8mn-vhip4-overlay-eeprom-1100.dtbo \
+			  imx8mn-vhip4-overlay-eeprom-2000.dtbo
 
 imx8mn-tqma8mqnl-mba8mx-lvds-g133han01-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
 imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1000.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1000.dtso
new file mode 100644
index 0000000000000..da3a40a310faf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1000.dtso
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&cfg_eeprom {
+	cfg_eeprom_layout: nvmem-layout {
+		compatible = "fixed-layout";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		vhip-signature@0 {
+			reg = <0x0 0x4>;
+		};
+
+		vhip-version@4 {
+			reg = <0x4 0x4>;
+		};
+
+		vhip-size@8 {
+			reg = <0x8 0x4>;
+		};
+
+		device-serial@c {
+			reg = <0xc 0x10>;
+		};
+
+		order-number@1c {
+			reg = <0x1c 0x20>;
+		};
+
+		article-name@3c {
+			reg = <0x3c 0x20>;
+		};
+
+		article-rev@5c {
+			reg = <0x5c 0x4>;
+		};
+
+		hardware-rev@60 {
+			reg = <0x60 0x4>;
+		};
+
+		product-type@64 {
+			reg = <0x64 0x20>;
+		};
+
+		software-compatibility@84 {
+			reg = <0x84 0x4>;
+		};
+
+		manufacturing-date@88 {
+			reg = <0x88 0x20>;
+		};
+
+		production-order-number@a8 {
+			reg = <0xa8 0x20>;
+		};
+
+		/* Each MAC address is padded to 8 Bytes */
+		cfg_eeprom_mac1: mac-address-1@c8 {
+			reg = <0xc8 0x8>;
+		};
+
+		cfg_eeprom_mac2: mac-address-2@d0 {
+			reg = <0xd0 0x8>;
+		};
+
+		cfg_eeprom_mac3: mac-address-3@d8 {
+			reg = <0xd8 0x8>;
+		};
+
+		cfg_eeprom_mac4: mac-address-4@e0 {
+			reg = <0xe0 0x8>;
+		};
+
+		cfg_eeprom_mac5: mac-address-5@e8 {
+			reg = <0xe8 0x8>;
+		};
+
+		cfg_eeprom_mac6: mac-address-6@f0 {
+			reg = <0xf0 0x8>;
+		};
+
+		cfg_eeprom_mac7: mac-address-7@f8 {
+			reg = <0xf8 0x8>;
+		};
+
+		cfg_eeprom_mac8: mac-address-8@100 {
+			reg = <0x100 0x8>;
+		};
+
+		next-block-offset@108 {
+			reg = <0x108 0x4>;
+		};
+
+		section-crc@10c {
+			reg = <0x10c 0x4>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1100.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1100.dtso
new file mode 100644
index 0000000000000..30df55621b7b4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1100.dtso
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&cfg_eeprom {
+	cfg_eeprom_layout: nvmem-layout {
+		compatible = "fixed-layout";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		vhip-signature@0 {
+			reg = <0x0 0x4>;
+		};
+
+		vhip-version@4 {
+			reg = <0x4 0x4>;
+		};
+
+		vhip-size@8 {
+			reg = <0x8 0x4>;
+		};
+
+		device-serial@c {
+			reg = <0xc 0x10>;
+		};
+
+		order-number@1c {
+			reg = <0x1c 0x20>;
+		};
+
+		article-name@3c {
+			reg = <0x3c 0x40>;
+		};
+
+		article-rev@7c {
+			reg = <0x7c 0x4>;
+		};
+
+		hardware-rev@80 {
+			reg = <0x80 0x4>;
+		};
+
+		product-type@84 {
+			reg = <0x84 0x20>;
+		};
+
+		software-compatibility@a4 {
+			reg = <0xa4 0x4>;
+		};
+
+		manufacturing-date@a8 {
+			reg = <0xa8 0x20>;
+		};
+
+		production-order-number@c8 {
+			reg = <0xc8 0x20>;
+		};
+
+		/* Each MAC address is padded to 8 Bytes */
+		cfg_eeprom_mac1: mac-address-1@e8 {
+			reg = <0xe8 0x8>;
+		};
+
+		cfg_eeprom_mac2: mac-address-2@f0 {
+			reg = <0xf0 0x8>;
+		};
+
+		cfg_eeprom_mac3: mac-address-3@f8 {
+			reg = <0xf8 0x8>;
+		};
+
+		cfg_eeprom_mac4: mac-address-4@100 {
+			reg = <0x100 0x8>;
+		};
+
+		cfg_eeprom_mac5: mac-address-5@108 {
+			reg = <0x108 0x8>;
+		};
+
+		cfg_eeprom_mac6: mac-address-6@110 {
+			reg = <0x110 0x8>;
+		};
+
+		cfg_eeprom_mac7: mac-address-7@118 {
+			reg = <0x118 0x8>;
+		};
+
+		cfg_eeprom_mac8: mac-address-8@120 {
+			reg = <0x120 0x8>;
+		};
+
+		next-block-offset@128 {
+			reg = <0x128 0x4>;
+		};
+
+		section-crc@12c {
+			reg = <0x12c 0x4>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-2000.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-2000.dtso
new file mode 100644
index 0000000000000..a2ca7ee8a2d2d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-2000.dtso
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&cfg_eeprom {
+	cfg_eeprom_layout: nvmem-layout {
+		compatible = "fixed-layout";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		vhip-signature@0 {
+			reg = <0x0 0x4>;
+		};
+
+		vhip-version@4 {
+			reg = <0x4 0x4>;
+		};
+
+		vhip-size@8 {
+			reg = <0x8 0x4>;
+		};
+
+		section-data-crc@c {
+			reg = <0xc 0x4>;
+		};
+
+		next-block-offset@10 {
+			reg = <0x10 0x4>;
+		};
+
+		section-header-crc@14 {
+			reg = <0x14 0x4>;
+		};
+
+		device-serial@18 {
+			reg = <0x18 0x10>;
+		};
+
+		order-number@28 {
+			reg = <0x28 0x20>;
+		};
+
+		article-name@48 {
+			reg = <0x48 0x40>;
+		};
+
+		article-rev@88 {
+			reg = <0x88 0x4>;
+		};
+
+		hardware-rev@8c {
+			reg = <0x8c 0x4>;
+		};
+
+		product-type@90 {
+			reg = <0x90 0x20>;
+		};
+
+		software-compatibility@b0 {
+			reg = <0xb0 0x4>;
+		};
+
+		manufacturing-date@b4 {
+			reg = <0xb4 0x20>;
+		};
+
+		production-order-number@d4 {
+			reg = <0xd4 0x20>;
+		};
+
+		/* Each MAC address is padded to 8 Bytes */
+		cfg_eeprom_mac1: mac-address-1@f4 {
+			reg = <0xf4 0x8>;
+		};
+
+		cfg_eeprom_mac2: mac-address-2@fc {
+			reg = <0xfc 0x8>;
+		};
+
+		cfg_eeprom_mac3: mac-address-3@104 {
+			reg = <0x104 0x8>;
+		};
+
+		cfg_eeprom_mac4: mac-address-4@10c {
+			reg = <0x10c 0x8>;
+		};
+
+		cfg_eeprom_mac5: mac-address-5@114 {
+			reg = <0x114 0x8>;
+		};
+
+		cfg_eeprom_mac6: mac-address-6@11c {
+			reg = <0x11c 0x8>;
+		};
+
+		cfg_eeprom_mac7: mac-address-7@124 {
+			reg = <0x124 0x8>;
+		};
+
+		cfg_eeprom_mac8: mac-address-8@12c {
+			reg = <0x12c 0x8>;
+		};
+	};
+};
-- 
2.53.0

