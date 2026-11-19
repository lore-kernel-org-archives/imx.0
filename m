Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079167;
	b=dHfggC1D8aUxIQGPQF4axcOEF0EVEV7eXW964pa2rpkWRPl1Tahc5d6iT+cRNVpc44Uz
	 CVoGTs3Emw3kyYycVVYPYj4tTKbUuckdahK7hRpFiM6/ufqsGVi24O4IrxISds6B+te59
	 OHGpbetyXkcZ9vE/8tRFjlOmqGGQtkSGG9B8gjMZZYwGSM1wGYIOioYz5leCGdgYMKtdQ
	 vlhUeMsfEdOrRoISM5qkuMlI6fj/rXnUsXyFwI8jXA5fNpQEILqbciHe42nGEnXwWl5D0
	 +7SogHqgurtQmkAIT6GmORpJmnYwwaXdKyWNpW1xRHSF0G/MK/jFEK0lvOCzt69asJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5bsnXM9lYnHDcLWwvi6s8sH/ygRCCvDbN6hw3fGCZdQ=;
	b=CDZd3GKgGhgtjEcqDYPjtghonCEXl6+zC86ENRqcEF7+4g1BdrxGWwNoEmRhXz/g3ASN
	 KavLkl3WrxdyolAJgaIH+uoMguGdhDaerhMjDhJE2qDaX/uHKINkpMooexuc+75Asiv0U
	 DnHJPrLv5QqKVKCg7xStFHhT4pEQN+qCKEMd2Kxzpb4P2EMncQQE9NVeyGaJJwGnDr1I3
	 kccihlAKGoKt3v1d9uiI8rcr/lZoql5TBNuua2+4FX1UJPtj6xFe4b2WfprQthMnD3FXD
	 UIaQWFsBT2Ncj+pHbw+Oo8gmz71SUhtLcf/fOnFahEwVju4rMIoiRSWq3mQRsfMl9Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ED2U+7eF;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB15606A32A
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB15606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ED2U+7eF
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso893221f8f.1
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795079165; x=1795683965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bsnXM9lYnHDcLWwvi6s8sH/ygRCCvDbN6hw3fGCZdQ=;
        b=ED2U+7eFhCUsq9UdUXQ4t0iMRk+9hQYOCaVzCUoe3ayN9mdYNAk1YRH+kxB0SIcthj
         pTaKXUPa43nfx27jjgrzIGMQVXOvd2jDADrR8N2wu0TKuUFtJxXTOlehEtXzrsoEc+7u
         lUm5pUXXEVP5ZJNJ8jgK84jTweUw/mJaQksp/crnt/XamnEM7PU9LskAXIsSRH3KrOUs
         OF+of7CsCKlNpDG5eQWqp1Jt6wHGl3oXEQfP0STRds77IXPN59xBvT3Rlcp7tuWyu9bH
         yKqsgBtgS88yj50Ae/246BXpOmxWVEaR/o8SopairSaO/CZ6VLY9C0uYy6/CGXj4Z1SO
         o9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079165; x=1795683965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bsnXM9lYnHDcLWwvi6s8sH/ygRCCvDbN6hw3fGCZdQ=;
        b=oR1Rb5g5At+6E7Fro6GiuttrztxWqJfPZ5r0cHXiwCoTq72O/Z4WChT4RenJH4GldJ
         nvMCSJrLpuMnmqWIUzetVySXCfturL0eN1vmpa6Ro2Zzodk9/TBhYag0TqTTWHldhldZ
         3q2wHsXnzJy09SFPye8SIVBSsnaUj/YA6oFrUb8ukvEiVPn5s3TcAqYv1xsTu5STQIbZ
         BKe7MF9I5uXq+2xJkaSaw18Pg1Os++tYaNP6lsIWjSdJX4dzdsq5I3oHAPiAItY886Gt
         05pzGKC8VfgxXv7ncwKa6lTlUcJkw/VYXH2Y9EJ8OCikYJcO7R/dLx1838c6KpIwOS11
         K6jA==
X-Forwarded-Encrypted: i=1; AL+hErHjfRCEnxW7R1LpAX6pyY9v489ODi3TASSV6SydSQpQmSJuVOdcX+OtYkKaXfP1OSaKX8I=@lists.linux.dev
X-Gm-Message-State: APuU4Z/gmgjYcat95OlHp0OpOLyQ71LiZNJuiWzhGkwiCUT4klLbs8UB
	66e+OvMCUOduwS31YAarKu+AuskJM8nTaPuaZOa93F8nM4UT0RJIlftD
X-Gm-Gg: AZFdTZf32Vj4plo73CJKSxgDKo4nEzfLXfm7xPh1BzgEyewJy17y+Vp8N+Rhlbh6iOJ
	qHny8mGLlMkizay70jDeuS0O6ntnhMqJH2F2DRMz8+rO/GfFO6fR7dlCUT9vsNQ+0tqELV3OshP
	fI2euiMr1AeOnNI73I327kdO9F4nqU4I9KYYhM3d5+k/8zudawR0IgKxviyIjZldaXw6evRYTJ3
	BbslrAZlblKfmyMGG2pceV5O514AJ8RbgbTOsgRepD/0UG5qhXSgostYf1bTbrfcpEurvQ8hgqM
	VjAMWpAMXQexRkb/BIFtmt2Tckqv1IS92JqHi2kPCLLAsZ1K57kNIwfCoHyM3jaH2RXx2LlGGxe
	Ciqb8CNOnonajPPJt7qvyEgO0vNL22P4NffT7ipz1rEBjce5e58/phGXMqHpd/GTvyopYoBEL+k
	Yyg9IOZbybjdC/fxywSCKjIZ9lCTzpB1yQQ58ctOdh9GpjN87qFy9mmMKIYOtdbygKQee6eoj45
	2UUXjNLEn92Anc8OiUtbYmyu47hL4ytgYffAV+cNoS51LjVgs1RChboxrkUlR2Dmwrf8Gv9RxA1
	5WxW0Rn/WEVKMzChuTlt1QfUqxIPqXfP2HsX2Hab8gMMST7DHi901ok0ozQyUJl9BDnIzitf4zH
	xwRQi5a+9aOobYH7u6oGjKNuU8NCRgxWmjHY11TXk6tZkQBifrsOSphk=
X-Received: by 2002:a05:6000:4705:b0:4aa:2afc:ea30 with SMTP id ffacd0b85a97d-4aa2afceb05mr1443459f8f.19.1795079164332;
        Thu, 19 Nov 2026 01:06:04 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65683d5a2sm9770644f8f.43.2026.11.19.01.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:06:03 -0800 (PST)
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
Subject: [PATCH v2 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Thu, 19 Nov 2026 10:06:00 +0100
Message-ID: <20261119090600.9257-1-stefano.r@variscite.com>
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

Add Cortex-M33 overlays and combined DTBs for DART-MX93 on Sonata and
VAR-SOM-MX93 on Symphony.

Share the remoteproc and mailbox configuration through a common include.
Reuse the reserved memory from each carrier DTS, preserving the different
resource table addresses.

Move the existing DART-MX93 remoteproc and MU1 configuration out of the
module DTSI so that they are enabled only by the M33 overlay. Use the
-m33 DTB when remoteproc support is needed.

Reserve the peripherals used by the M33 firmware and disable Wi-Fi,
Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
OTG1 because its USB-C role controller is unavailable.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v2:
- Remove the cm33 and mu1 overrides from imx93-var-dart.dtsi,
  enabling them only through the M33 overlay.

This patch uses the memory-region-names binding and driver support from
the following commits, both already in linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

For dtbs_check on older trees, commit cebd1c0961d8 ("dt-bindings: gpio:
vf610: fix clock requirements per SoC"), also in linux-next, fixes the
pre-existing GPIO clock validation errors.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   | 24 ++++++++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 14 -----
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 6 files changed, 139 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
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
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
new file mode 100644
index 000000000000..51b4cfe143d4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M33 configuration for Variscite i.MX93 modules
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/* Use the reserved memory and resource table address from the carrier DTS. */
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1
+		  &mu1 1 1
+		  &mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+			      "vdev1vring0", "vdev1vring1", "rsc-table";
+	status = "okay";
+};
+
+&mu1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
new file mode 100644
index 000000000000..d97da9916ef4
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
+	status = "disabled";
+};
+
+&gpio4 {
+	status = "disabled";
+};
+
+&lpspi5 {
+	status = "disabled";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "disabled";
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
index 1ca3ec8330d0..e3afd0efe5c7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -291,7 +291,7 @@ ft5x06_ts: touchscreen@38 {
 	};
 
 	/* USB Type-C Controller */
-	typec@3d {
+	ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
 		interrupt-parent = <&gpio4>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
index 69495bb7fc9f..6c596d61bd21 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -54,16 +54,6 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
-&cm33 {
-	mbox-names = "tx", "rx", "rxdb";
-	mboxes = <&mu1 0 1>,
-		 <&mu1 1 1>,
-		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
-			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
-	status = "okay";
-};
-
 &eqos {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -221,10 +211,6 @@ bluetooth {
 	};
 };
 
-&mu1 {
-	status = "okay";
-};
-
 &mu2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso
new file mode 100644
index 000000000000..96860a2dbf7c
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
+	status = "disabled";
+};
+
+&gpio4 {
+	status = "disabled";
+};
+
+&lpspi6 {
+	status = "disabled";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "disabled";
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
-- 
2.47.3

