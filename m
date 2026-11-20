Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199596;
	b=HpxuRnpBcq5yDi7YkH4VD9coHv/XkXEzO3Ez8xmkDifTsEkrPR6tI2529C3wVCgmNAPh
	 rastBSXYldxB9HmK4ZW6grcTQsAN/5CHP9R8ol/q56AOfu1QaxSoCxbqEnCRcA1SHIZnb
	 w9GbjrKGQMSJYuZ15gYjm4YIqQht6R05xGuzS7mHFQ460SJJ97IJ0LBpm0MOoRIMB9aVh
	 FChx93+OtEW4SrfzE9s9WSshtahV6cAFKnf0bVxhQuQLxUK8yvTS7PLZ3eCsToO4oTuGv
	 o132vVwEQDleDD6MdWhnDaQ4uPAkzhYkNiUKVc02QN9fMj7ce7U9bWcsVJOlzO66hHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gQSQjSRJnKJyi/DyI9dUqIc7eXSvEGbjLptiauw7SSs=;
	b=kHimsRGl2xfsVfEotN7QskTVOkdsNSfnjFcgaNnNQieHE5nEtPBpe1r7VRY4LNAbXBbW
	 jY06oIK9DdHiFKWrElq8G/QS1g/TX+FzjExqr4Uj8uXAaafV0tZqtqyTVW5fDjyOdNCEW
	 M89vIrOvqYlRTS6BPkEybkpFnurlUwdcl/tL/YkrCnByXWmbEFxIxSjW4zg4wyzc8VryQ
	 QB0qcnDQbc5YRrqhCq3Q9Ra7C8lbPKhwk/QR4KWIjKH7wFcql6JT0aoy8rpkWc0Dpd6ip
	 k6S/ihcL3Dk4rPdoVOLkYAY3BkyLFuFVayrAfH6WA4+RsaIvVzJ6xoj7vMu+LU565Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n3oO27kl;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6D560A2617
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 18:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA6D560A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n3oO27kl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so10908015e9.1
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 10:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199590; x=1795804390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQSQjSRJnKJyi/DyI9dUqIc7eXSvEGbjLptiauw7SSs=;
        b=n3oO27kloypT0FqFrWRjiEjH8aCkRY8215fFw585DTxpNgj+msab7G3Wz+d8jv3fGz
         0gvBfzhHgjx4LscTL5LMZhQDxexd4n86ybl9j13Y6tmpj6qA1g5vYKJBExKJ07ie4Tdl
         LvoxI5aJcDL281xCly7PIVSmgj7vK9tNsrAmV9mJqXvkZasPWuPJ3GT0dGCIoBe7cHNm
         YRwWwDTAbsvBqlLwzpqT8b8Rpet9QdW54bCmL8TC0qBITZjRHGPUkkOQosu2FPyDLGpR
         Zbo+INTYjCtpslVky2q2znH7Bs85YTSDgupgmGhEhYR0YCYfV64sninnhrxjGA/L62fj
         ZeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199590; x=1795804390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gQSQjSRJnKJyi/DyI9dUqIc7eXSvEGbjLptiauw7SSs=;
        b=kPZqGAuTCHT4nwmVQUPD7Rebp/p/1WEQO/E/TmADTbvTTCLMmU0Cn3VT0uGQGRO3yQ
         5E8X0IGLpDDIjPmqH0pAmlYr/dOZnyQmom6+xSXMqTzvEOdNedJvnZL6rG+cB0dCy8eM
         vyGsmZuYcqbuvefdzq39YSoYDjp5zX6g3guiTICFbXbj9TU+MD1aFGF8eIgad+ZFJkD/
         kAAXXcczl8aB/se+wNvYqUVjA7JUWNR6KPan75Ff2+sOCVzEsi3r44zRF4MkiVJW0aQi
         Ftmbr/3Gh8AqojzX8Fnv+nY6YjEGbzq7epLGV72beQRF0xYHyLRozlYfuYJjsKxIVkxx
         vhEw==
X-Forwarded-Encrypted: i=1; AL+hErFBTeDFdyePwknZI0g41fQP4p7lI9Wgv2hXN7FzIsZIrROqRZFqVm4B6DmrkWC2FiN0Olw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8hLozqvoZGb+EuRprFEp4koR4kzF2W4KsK1BCF5sgmJT2vwsLW
	inDZS8WL1I1daooTnedpN7ju3siFuINI/P94zc0fJej4Qy9idLoAvsZz
X-Gm-Gg: AYBFou2K8vTDbmNh65XAuSKy06xfrP9kmM5/tK3N+IMRoXlGZdpNvGllyLL8ZZyD9sI
	QW5HFRTt298+9OLTcje2UGt5g6uFxHCA7XQ0txoj5WDCKtWm7PASLTaD0kNne0N6aCuRdCyVOTD
	fpOdOp5ENTbTnOigw/WlD/zbm2vw30L93FgkuwH2rGwD1FbyP5WlpNPlflNJcrTgzW/c7aqvHzp
	hZPLLTYqHKlvDrUs4tJKO9gje+QWhY1yYjCbUAY+ykyE803hkGX9Vv4WsC0Fd2l5Ugq5Gc/l1S7
	z9jE18QYim9TUOmUtAiL2P+f4FeJ9aX1uv3mA4C1JpoXDojr+Xiie0syBE0XcWFr3nWcRA8xDX1
	t8Q/hJy3r1TsTT+ZazWTOb3zDLuEPXC8+5EB4ST41OL3ov9DEfLYr1Rl7KDtIvWbuWrzBn7ZuFS
	PtbDJFRr+EXDdEREqVPEloU0BDQznOfPFcEdyxOwNczWgEr0Keo1Zw8Q4Wuoub32IKwICY8LTLD
	WMJnIghB+WgtlwTPIVHtPwRRtlmiQrGUiTw0QDRzTugRyH3o8/wZBzjRY0ZTBJP/FrgvoXfd5w+
	LX5SUhF57n1iQrHFjjvpYCWSUJC1BR2VyLKrp5r6CoTgbObYLx09Nf81zn+1BZ0L+YdnT7rPnAt
	PCkZB4L7mhBBOLsK3K8aQjYjD+y1i9u0lYYoAFpaLQY0sSzg=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr10489545e9.10.1795199589928;
        Fri, 20 Nov 2026 10:33:09 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:08 -0800 (PST)
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
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 3/3] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Fri, 20 Nov 2026 19:32:30 +0100
Message-ID: <947a7bcf39d89b4a162f296278ccaa3db6512983.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
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

Add Cortex-M33 overlays and combined DTBs for DART-MX93 on Sonata and
VAR-SOM-MX93 on Symphony.

Include the common configuration only from the overlays, so the M33
memory regions are reserved and remoteproc and MU1 are enabled only in
the M33 variants. Use the -m33 DTB when remoteproc support is needed.

Mark the peripherals used by the M33 firmware as reserved. Disable Wi-Fi,
Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
OTG1 because its USB-C role controller is unavailable.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v4:
- Move memory-region-names to the common configuration extraction patch.
- Remove the common include from both module DTSI files, so the M33
  memory regions are now reserved only in the M33 variants.

Changes in v3:
- Move the common configuration extraction to patch 1.
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    |  1 -
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 .../boot/dts/freescale/imx93-var-som.dtsi     |  1 -
 6 files changed, 115 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..05a7556e9de9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -956,8 +956,17 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb
+
+imx93-var-dart-sonata-m33-dtbs := imx93-var-dart-sonata.dtb imx93-var-dart-sonata-m33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata-m33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata-m33.dtbo
+
+imx93-var-som-symphony-m33-dtbs := imx93-var-som-symphony.dtb imx93-var-som-symphony-m33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony-m33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony-m33.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
new file mode 100644
index 000000000000..51ec0beea7c9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M33 support for Variscite DART-MX93 on Sonata-Board
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
+#include "imx93-var-common-m33.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M33 firmware. */
+&flexcan1 {
+	status = "reserved";
+};
+
+&gpio4 {
+	status = "reserved";
+};
+
+&lpspi5 {
+	status = "reserved";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "reserved";
+};
+
+/* The USB-C role controller uses an interrupt on GPIO4. */
+&ptn5150 {
+	status = "disabled";
+};
+
+/* The USB-C role controller is unavailable. */
+&usbotg1 {
+	status = "disabled";
+};
+
+/* Wi-Fi reset is connected to GPIO4. */
+&usdhc3 {
+	status = "disabled";
+};
+
+&wifi_pwrseq {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index efd51f6364f3..57007f716f22 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -260,7 +260,7 @@ ft5x06_ts: touchscreen@38 {
 	};
 
 	/* USB Type-C Controller */
-	typec@3d {
+	ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
 		interrupt-parent = <&gpio4>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
index 4ee4d74cadea..6c596d61bd21 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -12,7 +12,6 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
-#include "imx93-var-common-m33.dtsi"
 
 / {
 	model = "Variscite DART-MX93 Module";
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso
new file mode 100644
index 000000000000..8df03ed3c004
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M33 support for Variscite VAR-SOM-MX93 on Symphony-Board
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
+#include "imx93-var-common-m33.dtsi"
+
+/* The resistive touchscreen uses GPIO4. */
+&ads7846 {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M33 firmware. */
+&flexcan1 {
+	status = "reserved";
+};
+
+&gpio4 {
+	status = "reserved";
+};
+
+&lpspi6 {
+	status = "reserved";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "reserved";
+};
+
+/* Wi-Fi reset is connected to GPIO4. */
+&usdhc3 {
+	status = "disabled";
+};
+
+&usdhc3_pwrseq {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 46b739a147e3..b0ffcb534cb6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -7,7 +7,6 @@
 /dts-v1/;
 
 #include "imx93.dtsi"
-#include "imx93-var-common-m33.dtsi"
 
 /{
 	model = "Variscite VAR-SOM-MX93 module";
-- 
2.47.3

