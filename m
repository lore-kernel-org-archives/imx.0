Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827627;
	b=4lsTujU6XJ8YZdNm0ZpJmepOX11WVVZ1QgIwBOZcQ41OpMorqoXgyHmyTARFKrdQv8sw
	 7ayTd+ij+s3UzdVv8O0lQgPGE7Iy/lO2TJ/bhpLRZVMv9A32x4vyzTFkYEHdkR73xSwW3
	 9OM+8SfDcJtGhv0+iXnI1dHy1jUV1w/gZ6vysSgXQ3IIsMOWLVqRIsVeA2hKeULZIdgpd
	 UHqC4ROsNwDyRt0WL5ohGpR1JV8E5FxH7nzBPhmbSwfcmU/CtSLEufCRCrpMZj+HA4Mpq
	 8ZJZ9i0GnIakwImEkfmAGn9YAIPkK/e70+xLdgxqYrgW1XFJHg0JOjRVUJpa9C5i8vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/E7B+CLgw+x/SfaWIPOPoPWBEopRUEi6rBKwGolhOO4=;
	b=CMfzrSV/uo0GD7iCVCLKebedvQcSh5g5c7aKvWvq9J7ZHCFHblxYKKrdD7gTBThfXYkp
	 KcayLJ8KxojyIlZUONcmTcwxcaY9HN102jJuCXI1yuPP1Zwx0zo24Dub8kw3Nf3aQ+Qtz
	 muPkk7PIX62E3XZmG8YxBZEkdDb8DNsRN9OOZRcTlHnEIX9asUAVzZsVeK+AV9BxqLO11
	 TGnabHhZ3Nz1kT23JOl9mfZwbNvdWJSd/C9qO0tCh9RiRK7mAcLqrXtmnvYLVXtKLHbW0
	 XqHhfQV6KtFjv4UGBHxm+7ukQmb/+lKS06EqWo/9STELRezpW31L+KTbSTw7+kdtKHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfLNnN43;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7419606A89F
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 11:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7419606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfLNnN43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1808230f8f.3
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 03:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827625; x=1795432425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/E7B+CLgw+x/SfaWIPOPoPWBEopRUEi6rBKwGolhOO4=;
        b=OfLNnN43DVuI7bvycX3eVgSBp3Qc3kDxbC4SOCHlxCtTy5VMtYb2MvF3SY3BgKWL+C
         eyJNw5TKvfogPrY7dTBj/ikqlvXeeLZ1aZiiJ1xBHT4NP2huSHayatK5eUxbMfm+FRZ6
         sQIe/KxSml0TU6Cjx7AIP5dO0V9CvSftkZengKaBvoRlAGy8aur+VZFDqbhUXlfBKTVs
         fHpN6YW3kLrzXusf70Xpx1r7ORjUyFcR8wMtB1xROnzYJhHNMHvB9cOmRe+o7IRYthm8
         JIMxWLda5vvAw9ao63i9kmIISCfO1o7/25G6p6xAFsMyIV8cavThgU0HPQHZqKwk+zDx
         gVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827625; x=1795432425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/E7B+CLgw+x/SfaWIPOPoPWBEopRUEi6rBKwGolhOO4=;
        b=cWFfva81x/i7yE3PqRrGzN/+DUWHPfokcb7YVGeA5cRMOgD6AnvOq8gTY+7RrlsW0C
         uPhEV8OR5F5Owb6EOrDJUW6K7t6xh+ek3au7ZL2ZWmL8roBm6q9U3EvfOgsXRO8oLLpI
         OxdaqiUWBj1YU7Yf0gm1uW+wcC3Hh7nRmadndO8bkuzuWdH8qiR0wHI4n3v3GNjxbgS7
         mA/09olTNL7r65ja5Utbrl2wgP0fpAnHWtaFDRBG7fl5h5/dHsyH8AgsBROf3A7L2s+2
         A6oW69hkQH8eZOInL5G3vGgJ7QEGX5upRvmNvi2a6/FRiW8yuU1UwCh9+C5Kf2UOWgW2
         VH2g==
X-Forwarded-Encrypted: i=1; AL+hErEWvc3Ulevq8qdCzkFqePyg4Olf7WMa/9qBynFyk+YrobD4GS1yKSWaIGaZMIlfWORwcXA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/LylYaServYHAwl7qG/T5wK4z8yZdc6mCQFunfIO8m57lHA0EQ
	ABixwFQC9rJH9NUepzRfePCgN1TIV7YOTKNal2AhJ269NX6EyqToew1n
X-Gm-Gg: AZFdTZfGcKQH1jDUWuADWoUgsYWjz4gTM4WjivNEL6m50mg22Xhau/VwDzObRBdMZFH
	UI3EX6VpkQGMy15imAZvzTOb4BMat1BHFDHPkfLniKuT6Fzs/1o3QsAz1FhRq8pTsYBrzX0OE4e
	hFOQkHXWXgNUuVobYFuCHpBqm0XZWGzXsOp0scUw3Q781ik8qPeeMZTjCo8gPlUrbuko5f9FqiD
	xTYCRbi4jvuydqRCnOkVSR5r3zW+1mXqBNYCEhLI5Sd1uIBndZv9wqwBR77o7cbejH7IyRTXNWr
	eGPHiws0tEK4krQsDNErkFS+cq4aUSzqQIztYTAdC62EbWrFxJrhPZ8nvpKivZwZSOhs1dhl4NQ
	x/vL9GdiGXttG78bQ7j+lfJ0CrTDI68gf4Xf61BTiOYkSJrZd4rADW5v+b4vW6nN3gqE+atrSnD
	CHuIccbBYI32Q6UUTMpXvKHVfxJ+0EuRvX74FXPY9s58RQ+HOyA/eNCyp7mzrVfzri/yRN0lKuA
	YbJ+1/P2ONoQcSFHDMCV9HREHUL6h+ATmuAebHUgQExdfSJgT8UhyjuUBSbYrzGBSZ3ujqjzi+e
	9bAZZ9iqc7Efhi8mqR0AM3SElHO+VmG1WKWSRjgCuTQFAG+Gc1GfwsAKDqpiKjpTwGDCQo0Xoh2
	8ebTIMMpZBnd6MUj9J/Ycd7lLKL6SJ/WUpko3LKAtbmeOl8KtDTOYIWE=
X-Received: by 2002:a05:6000:26ce:b0:48b:e50:7159 with SMTP id ffacd0b85a97d-49c71b5bfbemr20650347f8f.30.1794827624837;
        Mon, 16 Nov 2026 03:13:44 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c18b9sm18061420f8f.20.2026.11.16.03.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:13:44 -0800 (PST)
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
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Mon, 16 Nov 2026 12:13:36 +0100
Message-ID: <20261116111337.15740-1-stefano.r@variscite.com>
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
include, and add -m4 DTBs for remoteproc and RPMsg support.

Reserve ECSPI1, I2C4, PWM3 and UART3 for the Cortex-M4 firmware. On Sonata,
also disable the buttons and PCIe, which depend on GPIO expanders on
I2C4.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  7 +++
 .../dts/freescale/imx8mm-var-common-m4.dtsi   | 60 +++++++++++++++++++
 .../freescale/imx8mm-var-dart-sonata-m4.dts   | 44 ++++++++++++++
 .../freescale/imx8mm-var-som-symphony-m4.dtso | 31 ++++++++++
 4 files changed, 142 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..9574763dec09 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -245,9 +245,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtb
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
index 000000000000..98790a28694d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
@@ -0,0 +1,60 @@
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
+		syscon = <&src>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts
new file mode 100644
index 000000000000..35e3ea43e5ec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts
@@ -0,0 +1,44 @@
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
+#include "imx8mm-var-dart-sonata.dts"
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
+/* The touchscreen reset uses a GPIO expander on I2C4. */
+&ft5x06_ts {
+	/delete-property/ reset-gpios;
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

