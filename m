Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438195;
	b=ClovQSqtyVn5Sff4RPh596tBl3+PcxLa8vVrCXI5WWQJMfVS2z7VkwVRVXFJBptX7wUo
	 XCE+fsy5f9hxCnIVJQZyCD2OMIyxmvhLM3ye54sBGxvwvLkYPV8ZWkCMMMsRatzi5Gq/j
	 zEu5HIesVdG37tsxGpUbjEYO5S+fzzGLdRDqJW/2CSxOy57ePIUNvlngOQ599e/QWl7DA
	 L7+/BW057EJVEZPlqfutsTIp+W0SQt20VgKJv/BoSlSVZ5OClfUHFkzW9L4DtUCpkyGR5
	 MvDUkrS3mkrco5t+CQ/T3VDZte4WJPLhS5VY3ckSM/FMjUrcBnpq5dwLEIS4jImFMRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9m1xm47iTHmLbcZlMUBpwxPOmBYRH1wRG2JSqMQ6DpY=;
	b=sCsYETTMlkvSBkwtiqcANmkVf93ByoSS4keBPkh/YUH1+VYly7flFLm5ZHNigxjsnD4c
	 Fc46SwX1KVzlG8QOh/iSOpbQ/WvQAcWMTiwRszw1CwRIvyAUh3ieNhNDWfxn60H4rCviU
	 dvFdSfJkiOaZUP5obkhRcMsNLRz6pgrpU4LPbzHPBI7x0TWlpzeldVYPuZVrcPnSL4kQP
	 vZVMJP5YkzlywXvIm3IAM9IDxIb9fTKfEGDjblv17+TctSE9XBuxnlaFBywNJ1l6kmTPk
	 pbUAGdxmceP56CLgrBZ1E/CP7hTlhg861MzA+lqKya32Z2sc31LnAQi0hxaiJNZ4alA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LzfB15+C;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9910606A31F
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 12:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9910606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LzfB15+C
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1685621f8f.0
        for <imx@lists.linux.dev>; Mon, 23 Nov 2026 04:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438193; x=1796042993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9m1xm47iTHmLbcZlMUBpwxPOmBYRH1wRG2JSqMQ6DpY=;
        b=LzfB15+C0zAsFi1qMKqDhbvDvaWfnVnblIZ/KO1MBSBLU86dsC6xW7MnuGthJmTlUv
         RT/XtuXS8lqmwtEgGbR6992l/goCWgrmb2BWR8ypnuGWh3oN4Wd2z11S4Gn9Dv3xJDJU
         EmZVq7N+pTRskVZ1I8P0fpry+fqimBEAUwDFMe9S+HOXa+QBKDnXcpAT+tKtBFZeKS/7
         Sfubr4zZXygmTB0uOl7nYrJMmJkwLr5IUcBUA49f6W/NmOTc27J0RdKlCgyK12MI0RxS
         XrmIuUF9mLWGVN+ePsZ5xsSzCtqaiqtkK7LLhef4y+Dus5G6ZiapU8BEAWrybwCBXHzs
         1x1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438193; x=1796042993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9m1xm47iTHmLbcZlMUBpwxPOmBYRH1wRG2JSqMQ6DpY=;
        b=27KKwc+IeDhnuiIMexzezakvtD1ODVxscNOEQzVQ9nLVRxXdZ+ED/uPoehNSlZtixc
         2Zu5YIb/mojhPCphKwfWTfLfRMFHYMHK7d0JEoEIzNif6L7tyo2xbN6aLyR00ewXs48x
         LpkDluHAqOB99L4S+ju7XOJRgzCvM6gaMhmW6h5J7iorMq7ge2S2whTaNvkh1piVk0tC
         OGegVt9U+GIQYpyQYgg79yTRKUvJFG9O70q5cgweZAIAXEAPtoZz0kWMVrdIsUPiqtlA
         McUOEn1i+LiIWpoiJwC8GJQMGDIyyM+s9D5V+6FoB7ZlDqilwMZiqXqbh7YZzf2u88Y1
         aNUw==
X-Forwarded-Encrypted: i=1; AL+hErG7CtbF/d9hICW3fN5AdQEN9T+I9ZMjWhk3gckz1Qc5e2GzGs14d6x6lbLCwfexG/MDJNk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+jXeWxW4R/Fwyt6/e7Pjot1rl1XfzIksKQ0PqSFfUYN3FDv5s+
	BEaKi+lJ6a35UOWpbiwjVlvBuplixrbVgblFvw279lAToL2MuVyxCFtt
X-Gm-Gg: AZFdTZcwi2KRcf6xJTuYb8RMtwClQ5ibI3x1f6plAZZq4jV52NrqzsOTWIaHgippk6M
	0V11HEkrrjwyXJHFPUuZqxxTN+MX24V8ATHfOVbZblWou78kJbQkEq3V07vxBbdleJrFm+qjQ4o
	tOQI+6ia4Y6TlWiJKNv88mn5+nMzthwWnz1tgtGlWVNYp0iTlmFd64p7tZ8MADsrNHt8JYUvu7Q
	zdrWRbKwTD7BOhzBAtvHdUQZMAHnGj1FVB+5IBKSDiiHUCcVGwk/0qv0+9u1ZkHZLHRDRGmQEAT
	9i8/s5NhkJSm6+1BskVQWOg+HaFZjD5qOFOqEHggnN1gx3TXb4HXKdC3q7uOI86/fHKUEzOTiO4
	EBU9ssTxKLW/Y9vy6shFKBHvUKQ1CJrW4nQCeFzfQoa6SAL7WGOHo7+fvwHUkWnKP0DRE9989d5
	0UpyOBNuToq4EeE5skXdAvK0ruw+uZHJfY+NQ4Ka6b7Fe0i2yR7JQvP/eCQbyhl2BUm+7leYyEl
	mGqCSa55s5kU1USq4fze8/TTqe3KhlIy7nqKC+Nrx34JK6D7Wrtmhpt8NB4wh5qj92WZN0730L3
	lM1qfvz3vxnT+NxJN7Q5YHBB8wn8KKU75VHsEcEUrCnEappwcCbKw6Cl9LiSs2MBBmv+GI9lcPL
	ZibQduTkoTM4OpSOTU4Cg8qH9oJ71zek9BX2n2uB+aSgRv+geug==
X-Received: by 2002:a05:6000:29d2:b0:499:1c0d:4568 with SMTP id ffacd0b85a97d-4abb400ba02mr15984169f8f.48.1795438192874;
        Mon, 23 Nov 2026 04:49:52 -0800 (PST)
Received: from GLaDOS.station ([187.13.213.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm24902638f8f.24.2026.11.23.04.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:49:52 -0800 (PST)
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
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx95-var: Add Cortex-M7 support
Date: Mon, 23 Nov 2026 13:49:46 +0100
Message-ID: <20261123124946.13887-1-stefano.r@variscite.com>
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

Add a Cortex-M7 configuration for DART-MX95 on Sonata.

Place the reserved memory, remoteproc and MU7 configuration in a common
include so other carrier boards using Variscite i.MX95 modules can add
M7 variants by reusing this configuration and providing their own
peripheral assignments in a board overlay.

Add a Sonata overlay and a combined -m7 DTB for remoteproc and RPMsg
support, enabling MU7 only in the M7 configuration.

Reserve eDMA1, eDMA2, FlexCAN1, LPI2C4, LPUART3 and LPUART8 for the remote
firmware. Use PIO for the remaining active I2C, SPI and UART controllers,
and disable SAI3 and its sound card because eDMA2 is unavailable to Linux.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
This patch depends on both of the following commits, which are already
present in linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

 arch/arm64/boot/dts/freescale/Makefile        |  5 ++
 .../dts/freescale/imx95-var-common-m7.dtsi    | 72 +++++++++++++++++++
 .../freescale/imx95-var-dart-sonata-m7.dtso   | 69 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    |  4 --
 4 files changed, 146 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-common-m7.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata-m7.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4b2081a3290b..aa78f02fdef7 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -989,7 +989,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev-ser0-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
+
+imx95-var-dart-sonata-m7-dtbs := imx95-var-dart-sonata.dtb imx95-var-dart-sonata-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata-m7.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-common-m7.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-common-m7.dtsi
new file mode 100644
index 000000000000..21e89092de9e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-var-common-m7.dtsi
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M7 configuration for Variscite i.MX95 modules
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
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
+		m7_reserved: memory@80000000 {
+			reg = <0 0x80000000 0 0x1000000>;
+			no-map;
+		};
+
+		vdev0vring0: memory@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+	};
+
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu7 0 1
+			  &mu7 1 1
+			  &mu7 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>,
+				<&m7_reserved>;
+		memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+				      "vdev1vring0", "vdev1vring1", "rsc-table",
+				      "m7-reserved-ddr";
+	};
+};
+
+&mu7 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata-m7.dtso b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata-m7.dtso
new file mode 100644
index 000000000000..5e63f8169a08
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata-m7.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite DART-MX95 on Sonata-Board
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
+#include "imx95-var-common-m7.dtsi"
+
+/* SAI3 requires eDMA2, which is reserved for the Cortex-M7. */
+&{/sound-wm8904} {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&edma1 {
+	status = "reserved";
+};
+
+&edma2 {
+	status = "reserved";
+};
+
+&flexcan1 {
+	status = "reserved";
+};
+
+/* Keep Linux I2C, SPI and UART controllers running in PIO mode. */
+&lpi2c3 {
+	dmas = <0>, <0>;
+};
+
+&lpi2c4 {
+	status = "reserved";
+};
+
+&lpi2c8 {
+	dmas = <0>, <0>;
+};
+
+&lpspi7 {
+	dmas = <0>, <0>;
+};
+
+&lpuart1 {
+	dmas = <0>, <0>;
+};
+
+&lpuart3 {
+	status = "reserved";
+};
+
+&lpuart5 {
+	dmas = <0>, <0>;
+};
+
+&lpuart8 {
+	status = "reserved";
+};
+
+&sai3 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index 92ff09fe64a7..76145652b295 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -173,10 +173,6 @@ bluetooth {
 	};
 };
 
-&mu7 {
-	status = "okay";
-};
-
 &netc_blk_ctrl {
 	status = "okay";
 };
base-commit: 21d2357d5c1ebd2bd7726717e95765d031b55546
-- 
2.47.3

