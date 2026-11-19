Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104073;
	b=C7rQbXCZNQhZnvApqHC+aroh5PfviFw/on93hV0qaomRl8xPSipqHivz/yg+44bfPdaw
	 kZrcm8fiW0a8JXh4Hfi0+GumewPv+UHyhZEVbfa0FxKIiiSoXR4NB3oJmOlthZ4lID+oK
	 O4Nc6pPdvi5gVjbuft4AdTAeKoKP1o2C+wCETyLxhPZbYPvN+8N+6FqkIL4WSJVlSjbXK
	 oxZQ1/LLbK6PfAxSsMyypErhjs7b/TeoIpr1NPNuVEEbLE/BJsANrGGZze402AhDdQtuz
	 8HK9u48E0ekbCh4PX4Hi87Ky9dyTkD0yHQDVCeBdm9lPeA3zLSkeT/LIAj6YJ5mEmPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kguNqPOSlh7fe1C453DDiUzdHElyaO7Alv2xhzvgL+o=;
	b=jscVleUFzBQk1EQswoup/XuQZE1trgo16bMFlHQX9oa7XkWnB9JtJXlHd3xXgsBmABOj
	 gjPI0eE/siA5025A3b/Abd4cKqXM1xIO9wx2H9ZHnE2Jhr4mK+s/N6SQs1CqHOjyqtV6J
	 gShr7j3c4hyA21efIjtppeAYO8fjcw4/KIxgGAVw/T4z7gYEJJwuSLz2qBd97P3iDxWpB
	 tDj5f8lfH/JjQWVf3aJzNTXO94wIQkFkNeDbPP2vBHCVKrkWWcQFsIqLE9rGpa+f8+cmg
	 MWEV1/6qXIFhzqpJ1pRwu6OXomWICX4+eSbVre+co973cmo71l25gssQfFOpzm2+4BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rq4cuMvT;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9507760A2620
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 16:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9507760A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rq4cuMvT
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so321702366b.1
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 08:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104070; x=1795708870; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kguNqPOSlh7fe1C453DDiUzdHElyaO7Alv2xhzvgL+o=;
        b=rq4cuMvTswLCS3wXC8hqelKC5dykra4XXmyByJ0/pnGW0kxe2hdx0ae7t0y11bDBpe
         0svAB1NsNogMyHfSSO8G6lT4HnH4jBNlKhGzJSq7VEK3ca3MxHg30H6dSzqMtESKS+8n
         f2UbzpTVDM7Q57dA5WvQ0JUXLkpjQ19RO5SsClmb98XqHmTZW2uWVlkl8KPaIZRhdhx+
         ffWNqzc6asvlnH+IMA7JbzT2OhgfYgCz9Mbj+PwKKOEwOE2xYH0pp8YrEWBc/IBUjPSx
         IDOT6oZfG5DY9NInr013bcPKboCu3/2BHwvMDhsHvLvlQOKXSuar/lI/42wzSIfdAUk1
         3hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104070; x=1795708870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kguNqPOSlh7fe1C453DDiUzdHElyaO7Alv2xhzvgL+o=;
        b=IvWp51kXneJBiuG3UHTXZCO8ZnzH0X/rtc1mTkRneIALm315O/ta5fMZxI84r+pf9H
         rgJrs0rqgK9BnVDAyyvzb/TZJ8gaP1mMHrSLfQ9A4fD9gfE8PnCrD/trFrNa70IoLPaF
         7SqBfUbT16YIwDjS0968OIEWLANvN6XvI0kToUs8344yZ0JyXVoMomjBsr+NixQ2dh3z
         XaRxp/zyiD8MsYjJRbARglKy1A/qzlDSW98Ebn4IUj3ZhdR5fWGE10agAcbU7Bxxg7ut
         BKCyJglYXqq8aMFpT8pXMvgfVHwFwbySESH4yoh2hhV/mITUv+RchC6+4PP4x0f9YWlI
         Fe/w==
X-Forwarded-Encrypted: i=1; AL+hErG55q08k89XziFeaZXvCik9C9PqMCPLXI0I1ULrBp65gfVHcCy947vr02r3RVms2m+r8ao=@lists.linux.dev
X-Gm-Message-State: APuU4Z8dff9yUQtolqzDxmCrm3I6fmROCScPk03zFblxiQhbuOuE9Ka6
	PAg/HMJ3JgZinJt4uL+76Qk1CLzFiGqVQ40ONSD+XiBPbWL2hfQkmcSu
X-Gm-Gg: AYBFou1MX3SElkoce8dVYi4co9pW/NndlOFxYsJr+acPzfZm7DYT5nsgmqz/2yGxfdv
	e13ySeHEKdg0QvPGPZw/pxzMtVPbqW4U5mauU3Ca5m0GdxV8MJBES/TC8b1orNd5s1sYZutamx4
	IE0eU2DgWHEzHcrol0ltrFUWOcCBHjvaO9cUoGouBrPNuvbt5CKco06Clm3y7x21WQmWkMgxhXl
	ApFCh5L0ny0G9TxOjZNyR8PK+GCCiW+PtTI6urcXXH7gguT2xL2P6mBfQSLrxx3PrqzTCxwiOj0
	8N6dCqY4t0W4HLzK9SK2H5+jgrFCbyGk+Zt1BcEKhQSe5x5AXKW/z7WN/BpO+lAQkxMMiD7gDxu
	or7DDegFZI3OxDuNSv1NWNoM3jmKcSZ+oLhyvF3evvDBG2mUu9kYkYs7YY7DaqpN5B6Jj71w/ip
	+kWRHteViWfgnVGhQBYuR8Po3OBDIrrap2u6I4tUDN96H3ZnTldSB4HBc+ri24I5BhyB/jfg97O
	L/DuCeVYRIdlU6b8z6OsFwVmV9/q2u7vtoRrVWOpa6iMXzfQ3+5rBDA2cDG3rOu0eTvtiAlVvKz
	6j3EQxYLOwgLLQkmwIOXuJjdsiZZ/ASCcUVRivqFpxsMjLOHyc6xFLGXVWRJN+elr8ydQpVU+se
	ZwqGWdc1EmlLmrGoncm55pH5VJrWpVEzEqF7v0mRgPG4epUrzxJ2J5gg=
X-Received: by 2002:a17:907:3e15:b0:c51:249f:7331 with SMTP id a640c23a62f3a-c513a3aacc8mr39598366b.1.1795104069371;
        Thu, 19 Nov 2026 08:01:09 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm323784f8f.44.2026.11.19.08.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:08 -0800 (PST)
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
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 2/2] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Thu, 19 Nov 2026 17:00:54 +0100
Message-ID: <f52268cdb748fc4fcca95f8de1384054da8d7964.1795103362.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795103362.git.stefano.r@variscite.com>
References: <cover.1795103362.git.stefano.r@variscite.com>
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
VAR-SOM-MX93 on Symphony. Use the common remoteproc configuration and
identify the existing reserved memory with memory-region-names.

Include the common configuration only from the overlays, so remoteproc
and MU1 are enabled only in the M33 variants. Use the -m33 DTB when
remoteproc support is needed.

Mark the peripherals used by the M33 firmware as reserved. Disable Wi-Fi,
Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
OTG1 because its USB-C role controller is unavailable.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v3:
- Move the common configuration extraction to patch 1.
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

This patch uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   |  2 +
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    |  1 -
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 6 files changed, 117 insertions(+), 2 deletions(-)
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
index de0e56f322a2..51b4cfe143d4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -14,6 +14,8 @@ &mu1 1 1
 		  &mu1 3 1>;
 	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+			      "vdev1vring0", "vdev1vring1", "rsc-table";
 	status = "okay";
 };
 
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
-- 
2.47.3

