Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198703;
	b=FrQlgcMQZtCGgOHWpHSOrP4oirsBMgk3KswABnFuPM8svG2y7bE+UnuiKkYuuAb5x+Dl
	 r1CFkim84KyDUMhq+9D2wHcfXFARd+N7KTyPq8j0u5Ff8Tzcc266taPaC0Vx+JqP4xpRD
	 IlZHcUTfHjVgfiheeQ9D8d3vlspB/qW4FIOak3xMbPkbTwe/cmBgXUilnotU1Hku/YPc9
	 kDajmhyLzsl3j7qv5i7xlNmo1j5bMBFBKin/p1nLjtDRJzq834xbPFECNB3bCWLBqBAyX
	 hXNn7pBV6XKaVuNxIwakNSvR1iGWwc8lkWRpvbITup9aaNjMPQMC5EtpKFXy5TAO1Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F+kfwwjCYMQqRtD6fmxwn5boEWQH1gRaWvH/BgGTxxw=;
	b=xDJVA/wONR97ej0W5RpipnZdK7nXuiEI/DOVamA5HooHIZB7lovaAe0KeJAqJYzduDG9
	 cNxWqssQITzlOhDXJKV71Jv4F7LY6NFu00O1Zciw7D/KfxbKsBND4DHT0tnewJTYTlUv5
	 OpcbcyuzpC4UmPwF4e48DKcEhzoCcgzTQXrjumq8IpUqY7I4ETj4+7XPLW578EuU17DjA
	 nvawfbP1ik6ijTSH6stjrUIQ+Ho2S3YZCjkxm+aXX8ZF7GxNEBkWtNu7IQrbsOCp0J1om
	 VUZ4WDvUvOn24cyOAXlAyFjfJpT/qSnlCndM50GkERdHCKlz+E52ZvUwPW2JwfXRKVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGaGXf7T;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B97606A890
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 18:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56B97606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGaGXf7T
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so14844235e9.1
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 10:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795198702; x=1795803502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+kfwwjCYMQqRtD6fmxwn5boEWQH1gRaWvH/BgGTxxw=;
        b=FGaGXf7TcpDNP/4m0+SiStU5amf5If9qouZXx9GKLz3HwzB0N6eN3BtDZVLtSphSub
         IV9EgQKNTCC+n63YkK9noAZRL2RIal6oIcnP7B3An47VKnAv564EjaI9tzckCrZGeDZE
         qt6ooksOM09VKgcmitw5nlf8RViv1dnLYKbgwoXnCmFw0YlmZx88JCDUnWNSWe6MvvHl
         yoEYGN4+uOkdxP40ZQaQGyhoWTU4PjB+6EYLKopGG9UMKtwXqhV3KpEvNWL9F9cAsLAb
         sE6Fs8JeH5WUc62aZkZrY+p8nPopAuwAR3mfuD9FabQvnuv2mQtZTT5+N0vywGAaKcj0
         SA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198702; x=1795803502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+kfwwjCYMQqRtD6fmxwn5boEWQH1gRaWvH/BgGTxxw=;
        b=KxVGqQx9vkdVu5aFSEDee20DGTjPu9U3qWbMDYO4Fem4nWe9+tTCr6CoSLYdImO3I6
         AFY6SisViRE1VfGWgJYnTEpuvQAurVrvdLRVZOjEMmxiB/PFmAR7f5EPxUXvvzHyX05G
         O3wT6UTWbb++BexcQ9FsV4uJow0YK/qUOYfiq3qfW0gqVUuhzu6aaJ1DzxwyNJs9EcsE
         Te6/ycFT2ujEPHp5EAVJmELS88peKCcA+liAY4ycSUdnbdotIdYG5to6g+Im5Pnl3g8O
         nz62ICGAMXNlGmfDN6Iw1DNAqlM2dawBw9/GQNbLhrOehVzmJhBrZ10iPQd0FnDxIKXv
         cNtg==
X-Forwarded-Encrypted: i=1; AL+hErGlUxO6hySxbIkUipc9Oi6PFAEhdnEPU8oeHTKTKDDJd8pxTe3XmJiL3c/wTkh2xY7Guik=@lists.linux.dev
X-Gm-Message-State: APuU4Z9LS0oUAMT2/JqJ7nsNi0W1xXpS+URuJ7lbiRQ5OdN/F9pxfSjq
	6AdDWbZjP6928SL7AKMK/L5cRACSMgLorRzEY1VL1g9IUqn0AcU25nLg
X-Gm-Gg: AYBFou2xf2YKpCtStCzNPKKyRL7+w8twky3FeCU9Wpou3eHmrvIwbGfHQ9sTF93OaCR
	UZ5dZc/BK3hpF/Fa2vrBIlBZU1rakrlgVAvWFW+AjivzmAKY7zHnq482P0l0B9oOkZd8/KMKIpp
	IKA86dn09Q15xVCns/Iv+JE4YI6YrtIdUKSRy0/KdOyGtfLZZpDTr0DaOKBdlsjDc8kUj5n8DNt
	no+RWPIfsHcoAEgUfTt1ygl/U7DASy+ZfMM9NMyuGNK3QnPCpHnNxqjXEFRiXPjpu7VyUXvCEU3
	pBCarTRA+vzRLMlo/qarZX3eCgWiSw+Jn5Z8uDlHSOz2Mbl0Er6f4vxIJq5XwMsgGQ/aM/Z73Oq
	eVOTLpySorhnUTc+eAEXFJ/7wwzL54aOGmGN8olwjh6sfcFt9Ic1eKcWyPgtSTxl1pxOcMM8YJt
	YM2dHxEt10k0p0+B9rGIJa4JgkRWm2CmVjDTmV8enuw0kYEG2MjYg7WFy6jY3KTyWJ8MYXaD361
	EhBPssfOBoM5kmd+fZUy366l5KUfEbZIlJpEHVHXfZY3GH4PpWfifhzZMT8Bl1ZOF29Gw//rUSA
	1gUhWc3/QMuGpsS30OmMf0h+ugfeZ6qs0t3HcyDPP4rKO8E6RelYBJX+tAVKdpAmcm7AA1OSR4K
	1eMrtU5gsDavFPLCdp4IgDRZJHYu+nySjlMj82W2zKJHHxOWoJzd4trtDQZ6xjAMpVcL3
X-Received: by 2002:a05:600c:1548:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb88800020mr98021205e9.7.1795198701398;
        Fri, 20 Nov 2026 10:18:21 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895eec06sm34756025e9.2.2026.11.20.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:18:20 -0800 (PST)
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
Subject: [PATCH v4 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Fri, 20 Nov 2026 19:18:16 +0100
Message-ID: <20261120181816.33455-1-stefano.r@variscite.com>
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
v3->v4:
 - Use common node names for memory regions

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
index 000000000000..e2f369e2ef26
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
+		m4_reserved: memory@7e000000 {
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

