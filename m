Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198663;
	b=Em0xkNz+ooZVoK6twX3jKRWcoOAAV3zUypP0Z2kZOTOiT11M5811sPm6ixlW8MwYWphY
	 t2RJ7PeL/Ml3rkQxuSjMbpaMu8850XP5Iz2yO2UXFPQ6GFQUU2lf/RKJ96qPXGJ0xsisn
	 dc4XoORd88EqBwJ/QFFIRIfQbBp3GYmC8S91qmrt+9vAs9KHc41AP/JZfVvfjxncVetdu
	 xVfxDRP8Xx4otOwARxTQwkt8Ezj+IbHM9cFUym6A7DuKxiA7GjPGvFx9ja8zlVRJZXJgj
	 aoD3AMes0c4YCIjoQ6fDFGb5UBsArkUbbCDrF3N4cpmCIZ418R7vWtMq66ieL28PtgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ao45PZIc57K7i00r/ydgLRv43mzObnJdlxREPBvg2co=;
	b=JW7RAuh2HN74ZvzxLd2sFrDjhMTDTymVkJVpXSPKgOL3uBoHciILTCqNTiQKZF2fooP+
	 d+TjHx+0263TmaSABMC6D5FKgtrBa+Eskc+ujd27FPOGyA5GFXGYxasUQNr0sF/X/sZc6
	 l97k95fxO2pjjN6zgnenUKMf+e8JWniNWhki+PPahTIg/Mgb8153zHmBz8jpLBX9/3+hU
	 vqNkkD8fuefPEHG9+/grGNlUDq/zkwoKrqBZUEYfypwRAs98L8SnP8+Uzyz8WzJ8auwd7
	 ZU4Yy2QrKM8jGlmbBdRilx/dd+hx74DOfKU4hwpAQmXfro2Jzfe9DB4sKOli4jGge5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbfDgx17;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5326076367
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 18:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C5326076367
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbfDgx17
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so9736975e9.1
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 10:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795198655; x=1795803455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ao45PZIc57K7i00r/ydgLRv43mzObnJdlxREPBvg2co=;
        b=QbfDgx17i6AJeXtCKlKayuONirF+oWeHIfyIY4RxZSVeJCSM8AywejxJoBDSECKuk0
         N1zZKJPWcN+lEK25xwJvaOc31O9T7fNKJvqmT5EdQcDgUokTdNYDsSSDI5r+iE1MEx6T
         /ViYDwALMAvAVms7ntsa+uMV+feZn3es/9U6hYQnlgfaee2SpNM3VGeRkdtRCETVz2fx
         1qWfGZDdU4RdC4G2ndlbpDCh4gVe9oxZyc3+vsYlElEnnQSOSR0nFxrBblaMIJwLV75W
         q4nlXI7+90gAaMTJqBfJlY/L0Q1QQk/iFpTxra6JweYMrSb9DpKlsEGyRHg18lMSChSz
         L8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198655; x=1795803455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ao45PZIc57K7i00r/ydgLRv43mzObnJdlxREPBvg2co=;
        b=n3ilayaYlECKgGA6NBMKerVFr3+tgTVf1JZRYU4kgz9V54WBCdX3gFuNAjMg7amnXI
         3aOLPJ7idBHfyiAn9e76EGVg1zpSK57C5RdEGmIzoPT0lSrGOyQW14nfiE7fAuvr+B2e
         UCT+RY3Tlatk/jqpR71FqTGLp8yKOK7wCPgyvWo3i4oPo6qEYAZAVhBtKc5/a1tL+eQN
         /bm0bCTqqCvhNBJqq/K35/YDk7FM3Fd0Ek9HG+PYd5bj7JJrNJ3gzOr6m+n/w3J3eCfZ
         SDjEepDscU3LCRL2Wr0V6Oozlt8FYDSf0q3nhszEKrJ03qyts/tqRc4m8hH91i4Ki9dH
         d0vw==
X-Forwarded-Encrypted: i=1; AL+hErH4HMEgsFJJg5ds3FPqv33eMFRPKi0MfgsAFnxxrR9n07YCKAV9sEw3QAmBeId6/zSAGaE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/93pMpm7Op8YpmhWM7yw/nUKSlu34x9go6a73zJKXhzdiAxLyo
	zUcsYABMSxnx/xyR0ZrFzPHZYGVBDYmKg1CNflnjWLHgXzGbyl6SRj+M
X-Gm-Gg: AYBFou2N37jhvyMYCj/IpP3drltqKZH3FDroqeH5agcWnYCRY7ofku3lwLCVtNmRNX2
	k5iqeuylUVT01QSvTj5Rqf6IdJvILy/n513eb0/EC7gzd7VYbrJRG941z8TwhFFMaZlZ29yWDEQ
	qzc2s4NkRRZ6+LU1eo0zafLdOekC9vzLV/GIaF1TsSXF5Y3U+o+CTylyov7j6DG6wslSqTr2bzM
	Wm79RIKg69Y6X8dLl2x9pvAR452HPCoRdE0CNGHg55i8z2YZnffNoS+d5Fu7tp5egycn/q1jlla
	Z3rlXWIqhoFE6sy1AhDp9u+qdS60jilo5RY28eHIuEdag+0oD1HlVHvO3AMMQEN37RIj35nXveb
	Hb9Kj/l3K1EtHyCTent27XyA1ApyHMxsUa4lShHUB4Tv/4vGvc/86SRFU+dF6GPs1o5b4cPkbds
	41BJpmFufz78+idf3KhHhfOaRSV1mtRTgtCePCMwkShlu4vKPkj1S/r0P5uz41nBorYk8Wybl+I
	VZBIbpHGgzQzBP3BNaXvuH+60Jp8IhsjijUFb90hthRVvBYtLeBUrT6apd7ozi7qtDzH4wqoM/o
	0zNDIT3bnLotHNPyHkslmprgyUZ2nRyy4eCgOHJKoYynQJVT7ueuShKw6B8FRaFJdSKlDjQC6mg
	1mvr2V9gzQQphQ+FFwzc+0LlaHIC8ZnDXXm0ySGbFGBB4PtIt
X-Received: by 2002:a05:600c:828e:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb8878702emr102579795e9.0.1795198654474;
        Fri, 20 Nov 2026 10:17:34 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm131698035e9.5.2026.11.20.10.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:17:33 -0800 (PST)
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
Subject: [PATCH v2 1/1] arm64: dts: freescale: imx8mp-var: Add Cortex-M7 support
Date: Fri, 20 Nov 2026 19:17:27 +0100
Message-ID: <20261120181727.33321-1-stefano.r@variscite.com>
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

Add Cortex-M7 configurations for DART-MX8M-PLUS on Sonata,
VAR-SOM-MX8M-PLUS on Symphony and VAR-SMARC-MX8M-PLUS on Echo.

Share the reserved memory and remoteproc configuration through a common
include, and add board overlays and combined -m7 DTBs for remoteproc and
RPMsg support.

Mark the UART, I2C, SPI and CAN controllers used by the Cortex-M7 firmware
with "reserved" status. Disable PCIe on Symphony and USB-C on Echo,
since their reset and role controllers depend on the I2C buses reserved
for the M7.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Use common node names for memory regions

 arch/arm64/boot/dts/freescale/Makefile        | 13 ++++
 .../dts/freescale/imx8mp-var-common-m7.dtsi   | 68 +++++++++++++++++++
 .../freescale/imx8mp-var-dart-sonata-m7.dtso  | 31 +++++++++
 .../freescale/imx8mp-var-smarc-echo-m7.dtso   | 36 ++++++++++
 .../freescale/imx8mp-var-som-symphony-m7.dtso | 36 ++++++++++
 5 files changed, 184 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ae28e6b02a5c..3745688a5b4a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -723,9 +723,22 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-ultra-mach-sbc.dtb
+
+imx8mp-var-dart-sonata-m7-dtbs := imx8mp-var-dart-sonata.dtb imx8mp-var-dart-sonata-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata-m7.dtbo
+
+imx8mp-var-smarc-echo-m7-dtbs := imx8mp-var-smarc-echo.dtb imx8mp-var-smarc-echo-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo-m7.dtbo
+
+imx8mp-var-som-symphony-m7-dtbs := imx8mp-var-som-symphony.dtb imx8mp-var-som-symphony-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony-m7.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
new file mode 100644
index 000000000000..486b924e202d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Common Cortex-M7 configuration for Variscite i.MX8M Plus modules
+ *
+ * Link: https://www.variscite.com/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include <dt-bindings/clock/imx8mp-clock.h>
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
+		vdev0vring0: memory@40000000 {
+			reg = <0 0x40000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@40008000 {
+			reg = <0 0x40008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: memory@400ff000 {
+			reg = <0 0x400ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@40400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x40400000 0 0x100000>;
+			no-map;
+		};
+
+		/*
+		 * Keep this region aligned with the Cortex-M7 DDR region in the
+		 * boot firmware's RDC configuration.
+		 *
+		 * RDC DDR addresses are encoded as:
+		 * (physical address - 0x40000000) >> 1.
+		 */
+		m7_reserved: memory@7b000000 {
+			reg = <0 0x7b000000 0 0x1000000>;
+			no-map;
+		};
+	};
+
+	cm7: imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_CORE>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&m7_reserved>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+				      "m7-reserved-ddr", "rsc-table";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso
new file mode 100644
index 000000000000..c5cc032fb4be
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite DART-MX8M-PLUS on Sonata-Board
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
+#include "imx8mp-var-common-m7.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&ecspi1 {
+	status = "reserved";
+};
+
+&flexcan1 {
+	status = "reserved";
+};
+
+&i2c3 {
+	status = "reserved";
+};
+
+&uart3 {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso
new file mode 100644
index 000000000000..2b91511084f4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite VAR-SMARC-MX8M-PLUS on Echo-Board
+ *
+ * Link: https://variscite.com/carrier-boards/echo-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-var-common-m7.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&ecspi2 {
+	status = "reserved";
+};
+
+&flexcan1 {
+	status = "reserved";
+};
+
+&i2c2 {
+	status = "reserved";
+};
+
+&uart4 {
+	status = "reserved";
+};
+
+/* The USB-C role controller is on I2C2. */
+&usb_dwc3_0 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso
new file mode 100644
index 000000000000..710ddff2fb11
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite VAR-SOM-MX8M-PLUS on Symphony-Board
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
+#include "imx8mp-var-common-m7.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&ecspi2 {
+	status = "reserved";
+};
+
+&flexcan2 {
+	status = "reserved";
+};
+
+&i2c4 {
+	status = "reserved";
+};
+
+/* The PCIe reset GPIO is provided by the expander on I2C4. */
+&pcie {
+	status = "disabled";
+};
+
+&uart4 {
+	status = "reserved";
+};
-- 
2.47.3

