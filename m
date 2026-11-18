Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021046;
	b=oYEUGRdQMMXi/PjUteUWHITGIkW38oscLqmo6zRo1mOah+TCqiYXaQQx6fYNXtu3DhgN
	 naBrLCBwlpHmbc4wcjmZNHvW1vUf9RvJ/R4NdRLrDwing4Xo87jUgSDVCIC1Y/4nbhnZZ
	 BxxaHRKTzygGpTus034YW4I1wganOyCNWXnmeRNN6NKkQenUGUB3ihxP32fbnOV7cnCwT
	 ERZAO+7g8iwl8SZwuFh5XfcHHPKtHJ8wWdip8Eh4kX4FGEA5aPOPDwJdfNut1+uZDEcMb
	 mcd+v1N86P2z9ZxJZ6nO3xP9XvvT86EYchh3qSby/zdMmTtDbfxdb6vsKSguqSmypAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l3wnV7FKjR+kltfF/8FAvuWedzvvOsE0ympUYTB2Ew8=;
	b=Akc/OmEUKQIAA8JI48LOt75pZyXYnytl9rmmZeiD9kADJduMmoZv8p8SXzVOiORwWlOa
	 6Ql5moEa2fT5NYBk1HmRESKSbZApunDYT9JuBUHMfvgXRwJbfBL8XgpIF0RaugfQkWFWZ
	 ub5PHC2cOXvD2o2sAlLfaBtoVkPuqXJ/QT+atpE8cCO27XTG2yXvsQSNLXJg8nnLmsRzs
	 eRI/gKW7Rbmnd/eBEdh7L61kboSrNt2QIKPFHQjQ31fba2pFZk8Adb9MVz0AIZIeZPIec
	 qOLPqirxwjAlm8hwufeSiP4QWwUBHaIcEL3Ov7PgiNrWWw3NxmjX3mbmVKYCQq1aOYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ApSsnpH/";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF3A606A33D
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF3A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ApSsnpH/
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso11948685e9.3
        for <imx@lists.linux.dev>; Wed, 18 Nov 2026 08:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795021045; x=1795625845; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l3wnV7FKjR+kltfF/8FAvuWedzvvOsE0ympUYTB2Ew8=;
        b=ApSsnpH/5LHViBovIw4oY7TwYjG2NKJ0qPN9ilMDyr9E/UxY77SDYUvHuP3ox0jPU5
         yiw16w+EdAo2QzyTWoqTlzheoHpWnilt2B3sL5CHvmCISpsPL/Cdy9rPtsVr0kRx45ko
         +nSmmEondTkZYcVD3QoWrA7pWphwIrflCcVRs/s1d91WOizuVMKT2HBjAv4kqUJl1/w4
         VPgwULuQvP3WuiI0W288Vrcd8A/cTUdVvEtXTfpi6IxF920zjLHiVEvwWrNsEMa3C5mi
         Iic4YgVRWiJRy3WFCuNbPI1nRTQ9Uh7/VlfTDNeXqcIyXl+YCM6rEhaClC5m+nFW6z0o
         vGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021045; x=1795625845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3wnV7FKjR+kltfF/8FAvuWedzvvOsE0ympUYTB2Ew8=;
        b=SxjvETEq31ZE33bArnQMgnXA4qmca0BlKp/I+i+cHesILuiC5oCIK77+mGQw7NfYG1
         RHtOX43mLM9q9WF+BDuLf3NV6yzFkOS+b3C7y40LF2WbdjKIwW6q6sbPvf0RDgZ2Z+Hl
         l8e6AOUjovLVDqU8sfxqw5I9L4+fwbscWMRB1H7VfSpfzU8c9LYj97REodvVqEkYDNXK
         bIKTKzpHPG/7BwHNWlAfuJVjupzwp3UlZ0c2EY7AuEx7M1vnXuVBFu9LfbI2hW5mGN/i
         WjaMnKuvt9TWrCfQFl1NN7qDXQfKp6GVvo9oFJbCXtN2v7HVaML2TUTuTIPSydF7vxtv
         PEkg==
X-Forwarded-Encrypted: i=1; AL+hErGA+vO37nOXEFwHMQktLuOl08cjske0e9ywM56r6R46DuQGVDvzqwmHfxfVd01loBY9FBQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ukgkp4lsTfOiAZ84zcnylQcBe4muMA6yXtKfKRLXC28x6hFcI
	H/uyDcAqUzViCK09oqNZEvoCEiVfyiYDz695Iw/Jgq90wxcafpHCibSL
X-Gm-Gg: AZFdTZe2dGD+vh3m7bQzPopvnngrWXCQPLp7gfnKxbQfGrJyKCj8Bl4GuROuKqnPsp/
	klx09YKRdAeb8kVvgRhX5ys+BdrO0PKZGia80pJKm+HOXacGm/8+MjYulpZeUIzXhi/hhblmjck
	EKgH4J4TY7Ih2mx7R6hK3pNITW8jQ1qaNWnwb/Is9Zh5KJRmlGDG6KPgS+PPAE1O+BJMjhklump
	7NSjmhCweuL2mrZ+D+UHj9g1qWxiDuajjPsypIHCsFvSpd+twXDEv3npiCxJbGp0+Lo/J+e0TJt
	yqzMm9oBG3U405iG9PxpC2itjn5hgqKMW4eEJodshJ8zIYWfNBDAPm7UbEvRw/TJV5a6l51ijXP
	rqXaA4kPyoeYbv11soDhSPxnK3Ea9GMd8sVkFDdKOjPMS2JnY5maonvvYrbRgYnsUYsahYXqWx1
	9lISFx1O1G+v7/ku4HauG3Moqn7WD58lZjJX13d5AvAKFJUAMZAqFtxgouobu/B3HTLaaMXgrPT
	JnIyP9n8slKKXkspuFMqiwjNPJu3WZIPlcshwzwhFFwXKgMu9/GchTcuCEidN9qOkJVzVi1g0GW
	AB8WEqJQpPPjJEfgdk1YdIibeVtASioKo+xfxihRXEa8RM4gb7fMiZbn2bKGZvKAmDI7R3GIS5v
	D7sY3oUdVnjDpEgaKRe3ly+4sOz+Vxu6qot9RtLZed3PMprKhe11HuVN1afMPQgtRhgkiJiKNjP
	/A0w==
X-Received: by 2002:a05:6000:4b17:b0:4a7:f82a:7f6d with SMTP id ffacd0b85a97d-4a7f82a8286mr3406352f8f.6.1795021044441;
        Wed, 18 Nov 2026 08:57:24 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2f682sm5603591f8f.6.2026.11.18.08.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:57:23 -0800 (PST)
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
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Wed, 18 Nov 2026 17:57:19 +0100
Message-ID: <20261118165719.46297-1-stefano.r@variscite.com>
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

Reserve the peripherals used by the M33 firmware and disable Wi-Fi,
Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
OTG1 because its USB-C role controller is unavailable.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 5 files changed, 139 insertions(+), 1 deletion(-)
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

