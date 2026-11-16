Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852222;
	b=vWPdItTDSgcj5y7WJ+A2djjn+HkAoyLcCqwP9TcKliEs8zwTR5gZ9ida98yLa/LrHTP6
	 oR3NXchDNABHOGG7hTzYGamSMKWceTzP6T803VY1r5Z8CZtNzl5J64cX6Cysb7E6mCu7i
	 2/chKTHvwf/Mqnefjd9ISSeBZUXlXlJKcix7MaLPGvcd3EwT00PQqqbrg00ysow59ro+t
	 iFca41wryIJmjpOg9wyyeNeLEc1fjxuBQqa1BoJb4dbLPxKzNtEieXpWmsZ6ufB1UJc8N
	 aIoWVRKWnSCN3iAqR8klDpjlGAXEgH0bt0p6M7o1tozngE4THiWY88HN14aVtR4S68Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qdwVpDmUyX6+miopugFQ74zvWKqlDoa5kHuLWgelFRU=;
	b=hPtG3qDh62NqnYqDjnEcVIwtRsaYY/21wsXSwT9nh2lKJfzcjDFga8pLgarJobqU/061
	 9+dzTpuLq96td5LfbbzYRYF2Nf6CN+wZxO+sYNnpO4xSgJfPTZmzN8JtS/A37HkfJFCIL
	 f+TLE0mVbx/vUXKC06B5nkZJSywl/kpk5fDkDvG5ffVqJ6Q2+vCEJWDtZM/KEDi/p3Vev
	 UptI9WUo3zMVB84UJmf4e0YFMduLoM1QsNE1iADU9SlBvfhsCSe3HwakH90zf66xj3K+V
	 r0118kkg8RczcIm0qCiMEiDDzd+xWUBuXiZXrTI2+MZdXl7L6AmZ/4H5jXjoWyUHXsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xtk8ikwP;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8922606A32A
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 18:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8922606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xtk8ikwP
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so24445685e9.2
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 10:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852220; x=1795457020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qdwVpDmUyX6+miopugFQ74zvWKqlDoa5kHuLWgelFRU=;
        b=xtk8ikwPoX8+3yEAsakGUCbYZ22f0ifmGSWLk7O3Dq5a95Qfihc3puJY9DGneheP4j
         4tY3TQ5XlqIolqlOh0XqK1KS45E+fYvPY3U1btE2MaPNDnUSQcm24s/jOt1y0sEjPX/A
         SQYQ2S3On/uLE5GjlkoXnK96BxwpnPpZoWaiGmQWyAmKNw9Jaqa8GlIVe27LGYS1En8T
         Pin66EOatM0+y819Xh1JqWpsEAxo/b/TEXBG+thDKXGkXDhTa8yLWLeNIB4YQYvHlcmJ
         o8QACGUXQlOlbglhQHk48Sn3ePdeygRuPiaAEzjoQVBaTJmRDNQuv3oW5Jju2pC6L1wE
         RxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852220; x=1795457020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdwVpDmUyX6+miopugFQ74zvWKqlDoa5kHuLWgelFRU=;
        b=msmyA/JaBzPg7mvK/u7CKFYOVErmuQSs00t7pXpVuI1ptiqsWBtJIld3hwomrAl3a9
         iGtplMyDHM6J1JrZlJwCvBIzkZFxX47oLqPk/b64VBmgnnDUt0bJuWnJMhx0CTJAFuig
         l+fgUSBH5gHKbbKn25LXE0EoKwUTbSLFl0Q62RP2fmiVIWwlUzdEpDKFsxCVPizOhL1o
         Lqq8vhtUzBknfOVq7wfQ1vzHLusLmbM8ku3Rd8Jl11sy0fvstZef5lP/FVjCnhLUfByW
         8oWmKF4jnZk5dmAc/Ql19Aer1qb3V0Bww+D0KzOCWGpvFBXzNooPkt9cBzXK9DLM+Si4
         ul2g==
X-Forwarded-Encrypted: i=1; AL+hErG8lTjFfbO8OJmVrfYwMAJn2CuKhQFVyZhPpvV9Y6kkz0pJ958RyYebIwQ1rZ1Q362Whj4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+8enMMCzPG/9VEwxfAgf7TgCIXIsAu4x0DxHiLgR0nx+enq9h4
	3P+tUBNCwYmFp+h+iiBjsVu8s7MAoE6qm6myj9TI9sXTckSkjJikolIz
X-Gm-Gg: AYBFou3rCE9/NQfqdI1vOLFDW83ht7jpY8X5zVSE7XvA0GdCMQamxUfHlPeFc9WU3K2
	K8UOcAueHVYKO1lpn+RJ6yz+ad+pJIbUNFBmUPyRqi5bboUiqoB9wVFjwD2wtuuHE/bUEhuFltF
	9YnY6RbW4mV/sDHcupIZxnrp/J/nLuv4l+qmrHKl0xrHymviMnMu7A8L4KDHVb4KL+9eJDRWH21
	gXqU5eBfAhstuaZi/MDuy3EMS5cJ3OQoZTdNrG2mhxsez+ucDqBLzWPfixmPHjUK8CxKcgPfVHc
	ug4bSnz6j5YV3LHOrBHeyChUMoI1e/kltL7h7jFtv+tkoZ62NsjBIOewA05NnlEql0UcfUFvWAi
	9E720eX339aeMRbf/oeFUtJZB0xo8WA3+NDHaL/1lWD/mDvV2CAfGPNxArzTbc0K0/s+BAh1c/O
	v+38DwToDTfyzBwlIwJQ0f1HZoLTpqZYzp9eK0upBu6JWuHQHL2GKfCqRsiY4do+x0VY2fxXH++
	o/UfwTmJMkl2T5FBLLkUc1gVGnQsGiBngmJcxEcDeKND75PXasIifINf3VIrEy/JJAQy31u2I9l
	xm8VKDt7HJI+iVb92wGYpOA9d4C/RmigfPVfFiohXLv1wpiUzDLDRznV8PZXYTW4plIoXnoofJq
	6IGHZQYabUHyxV34Fq3jTZtrJCUi7/mFW78HTs3feSrBfRJHdbOy7bHE=
X-Received: by 2002:a05:600c:c167:b0:4bb:6a75:d04f with SMTP id 5b1f17b1804b1-4bb6a75defamr97842195e9.8.1794852219973;
        Mon, 16 Nov 2026 10:03:39 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1968sm23904692f8f.10.2026.11.16.10.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:03:38 -0800 (PST)
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
Subject: [PATCH v2 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Mon, 16 Nov 2026 19:03:33 +0100
Message-ID: <20261116180333.43440-1-stefano.r@variscite.com>
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
index 000000000000..dacc845e53ec
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
+	status = "disabled";
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
+	status = "disabled";
+};
+
+/* The PCIe reset uses a GPIO expander on I2C4. */
+&pcie0 {
+	status = "disabled";
+};
+
+&pwm3 {
+	status = "disabled";
+};
+
+&uart3 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
new file mode 100644
index 000000000000..f2a1618edcf5
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
+	status = "disabled";
+};
+
+&i2c4 {
+	status = "disabled";
+};
+
+&pwm3 {
+	status = "disabled";
+};
+
+&uart3 {
+	status = "disabled";
+};
-- 
2.47.3

