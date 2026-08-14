Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D0940DB5B
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693634; cv=none; b=uM4+zNlcTk0OPaJlgmkIspp2XgD9sllo6HLb58KjT5pAQ2oZ1gkkfm28XVhMCweQzWcWri53OpwqTngtrys46LGdHYNZBaIm0CsgulRzzUAbGIeULqX2fTRq8Y7nWDqHlDSI7cN9Y/AQbAHjSS3Dw0m3yVt+AAZFH5OynWGQ5uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693634; c=relaxed/simple;
	bh=f5NnwkOrDRb041V8ftQCBDxTGIfeya7uy4oY6FaKT+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPeAp1pEG9+c8HDzIk+BAoASuKbykGFreR6oS1cDa+iFvO6JZxboNiFCq1PeJUTMaD9hRN0TdbFazZtCqQLfLx+wynTCizHi810nzN1yc6gT9LQ/hFsrfVlfuWJl2qen1Eh2d56QAj8XdQvNcogw+iw7whsFf5cKN8vBVm3IcqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjE71GKh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjE71GKh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499840a2575so5175055e9.3
        for <imx@lists.linux.dev>; Fri, 14 Aug 2026 00:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693627; x=1787298427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIqdTr996wJo+UifSFBeRBtaPyx9vS29M6BGDKsTkQw=;
        b=FjE71GKhlrCo9s5m+pATH7nrS6y0cvN3T/3KlO6A7SCz+ll+QVQ1Yg83bHmxMcwKf9
         i5UCgfkYVnqCOHOfQDXg7UfrGRioxLh3BmCOYu1Kyt/RemxmQqn+ZKF0FQRNZapCsQmD
         wA6CR4VbFg3CudarZbKD4VPczpsA3pt8KWGGaYwu+dMJq036Y1HMfpptx0lZAJKSHNW4
         AmUzzUB7rOXdxaQ6BqA8WFvcq4xp9HoE2b++jaqpKi+6uoPfNMVLLhb/TCo13YSEJd64
         M8yRl2PX71H2jwsAp/DfMW1ZCQYwfRPNON9tvXRuLQHcVkXCWLbvyt1I6RYSfb8WI847
         YxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693627; x=1787298427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIqdTr996wJo+UifSFBeRBtaPyx9vS29M6BGDKsTkQw=;
        b=P4fOCvluQrQR4UPjJrwExseCzd6ygLUXpoNfhmZG8WshgOeI50lcm/M60/+a4zTg7Y
         DRFWfH16o7nqyBrUJV1qY4aH0Cv+Q+Dfv2Pr9wrtTPvmT1TQz3/3Ki5f1pACsZ9hrKNk
         fxJ4HDHW7JlTkoZCbBM+m6bKO7jKOF8rWT3X0/UJam1U8fRPLzGiFNvmKeXQOCq0UwEF
         Fvj65/JXZ9rMLog0Dlm3hFWWBMZbZg05WcEEw48rO197LuYzXpnhdg+NB1SAymQDUGjo
         S5z4E11BBFSXKtxeCZ8WViYOBzR/NJGkiM2WAv+qVHbo+uk48SDZbFaf/fdmgjSAhpqe
         7SoA==
X-Forwarded-Encrypted: i=1; AHgh+RoAp24bgdM9CQ5yo+qCXWoqDifi6Qm+Hpurr2S1DhmM/T/+f2gT9XaDAyPvrYcyHcy0YBw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDcPWLwVV7E4RaLLoZURSUrEBcX8N0Dm7XV2enjVnyKGCRC5VE
	+4+f7iW/wO47eS8cTOBdpnJph6bwn4/W76Aqo5+Xc3UniXCnfAwLLKuC
X-Gm-Gg: AR+sD11WOsrLr6B4QJHuK0QAYz9/Gok1ytaqUR9MHUOFxa+VQb2q05eOlopWJkPcqA1
	BxtFmQrhzCdxWypdV2HHdDa5BschVrG7gfG883oS5d3TfacO9QBibqHY0lr4omxatRZaYduOeE9
	hKsAGz9CDN9nNsrIVm6J4wGH1JsTvde2SQ0FpDVmSwzj0mVa04NWN5Fxy00eoOUBvViIHLTGkPH
	Fc1RyV9rj4pvrREQYtztpB5v18ZbpInekDNgiJovP0oPouP7HLgZ4QnkB2T2DsSfiGGJ+uJovjj
	RovFuQlJ8PPleLJUUDL+d7s/oY6dVYxqYVqGn7tV0IHaJnSuqcQF1p0pxZwycEa9Hzz10qQ3qaa
	z1glVDFWzwO4XdyxN0mxCXPlfyZ4rEl3XlOarya3Vibo/X4MaByf/8+fmBRWitqbYfyhwBPSYsV
	rmbyws6sqcKWEYtgYcP7oLUcbo0Qd/LZFE7ADo7feQskXH5v4YGsv9STMQtN4EYqbR2A==
X-Received: by 2002:a05:600c:4003:b0:495:3de8:33a6 with SMTP id 5b1f17b1804b1-4998798db40mr40704255e9.16.1786693627220;
        Fri, 14 Aug 2026 00:47:07 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5f86sm8172825e9.5.2026.08.14.00.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:47:06 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 4/4] ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61
Date: Fri, 14 Aug 2026 09:47:00 +0200
Message-ID: <20260814074700.2491256-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814074700.2491256-1-mehmet.fide@gmail.com>
References: <20260814074700.2491256-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Iris is a small off-the-shelf carrier board for the Colibri
family. Describe what the board itself provides: Ethernet, one USB
host and one OTG port, the pin header UARTs, i2c with the carrier
RTC on it, the PWM pins on the X16 header, SPI and the microSD slot.
The host port gets its VBUS through a regulator on SODIMM 129, and
the two GPIOs that turn the RS232 transceivers on, SODIMM 102 and
104, are hogged. The touchscreen is an add-on rather than part of
the board, so it is left out.

This describes an Iris V1.1. A V2.0 carries the same signals on the
same pins; what it adds, and what this does not describe, is the
regulator on SODIMM 100 that can cut power to the uSD slot.

Tested on a Colibri VF50 on an Iris V1.1: Ethernet at
100Mbps/Full, a USB dongle enumerating once the VBUS regulator is in
place, the RTC read back over i2c0, all three UARTs, the SPI
controller registering, both PWM chips registering, the microSD
slot, the EXT_IO pin group still applied next to the carrier hog
group, and both hogs holding their pins.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 126 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 ++
 4 files changed, 156 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts

diff --git a/arch/arm/boot/dts/nxp/vf/Makefile b/arch/arm/boot/dts/nxp/vf/Makefile
index 0a4a7f9dd43e..47be8bc318e2 100644
--- a/arch/arm/boot/dts/nxp/vf/Makefile
+++ b/arch/arm/boot/dts/nxp/vf/Makefile
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_SOC_VF610) += \
 	vf500-colibri-eval-v3.dtb \
+	vf500-colibri-iris.dtb \
 	vf610-bk4.dtb \
 	vf610-colibri-eval-v3.dtb \
+	vf610-colibri-iris.dtb \
 	vf610m4-colibri.dtb \
 	vf610-cosmic.dtb \
 	vf610m4-cosmic.dtb \
diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
new file mode 100644
index 000000000000..36e34dd766ae
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2026 Mehmet Fide
+ *
+ * Toradex Iris carrier board V1.1, common part for Colibri VF50 and VF61.
+ *
+ * The Colibri modules are pin compatible, so the carrier signals sit on the
+ * same SODIMM pins as they do for the i.MX modules, whose Iris device trees
+ * are already upstream. The two SODIMM pins below are taken from the Colibri
+ * VFxx datasheet (102 -> PTA12 -> PORT0[5], 104 -> PTD28 -> PORT2[2]).
+ *
+ * An Iris V2.0 carries the same signals on the same pins, so everything here
+ * works on it as well. What it adds is a regulator on SODIMM 100 that can cut
+ * power to the uSD slot, which this file does not describe.
+ */
+
+/ {
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_usbh_vbus: regulator-usbh-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbh1_reg>;
+		regulator-name = "VCC_USB[1-4]";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;	/* SODIMM 129, USBH_PEN */
+	};
+};
+
+&gpio0 {
+	/*
+	 * The RS232 transceivers on the carrier are switched on by these two
+	 * lines. Delete the hog to turn a transceiver off from userspace.
+	 * The pin group belongs to the gpio controller rather than to iomuxc,
+	 * which would depend on its own child and log a dependency cycle.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_iris_uart1_tx_on>;
+
+	uart1-tx-on-hog {
+		gpio-hog;
+		gpios = <5 GPIO_ACTIVE_HIGH>;	/* SODIMM 102 */
+		output-high;
+	};
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	/* keep the EXT_IO group from vf-colibri.dtsi alongside ours */
+	pinctrl-0 = <&pinctrl_gpio_ext>, <&pinctrl_iris_uart25_tx_on>;
+
+	uart25-tx-on-hog {
+		gpio-hog;
+		gpios = <2 GPIO_ACTIVE_HIGH>;	/* SODIMM 104 */
+		output-high;
+	};
+};
+
+&iomuxc {
+	pinctrl_iris_uart1_tx_on: irisuart1txongrp {
+		fsl,pins = <
+			VF610_PAD_PTA12__GPIO_5		0x22ef
+		>;
+	};
+
+	pinctrl_iris_uart25_tx_on: irisuart25txongrp {
+		fsl,pins = <
+			VF610_PAD_PTD28__GPIO_66	0x22ef
+		>;
+	};
+};
+
+/* Colibri SSP, on the extension connector */
+&dspi1 {
+	status = "okay";
+};
+
+&esdhc1 {
+	status = "okay";
+};
+
+&fec1 {
+	status = "okay";
+};
+
+&pwm0 {
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	/* M41T0M6 real time clock on the carrier */
+	rtc@68 {
+		compatible = "st,m41t0";
+		reg = <0x68>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&usbdev0 {
+	status = "okay";
+};
+
+&usbh1 {
+	vbus-supply = <&reg_usbh_vbus>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts b/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
new file mode 100644
index 000000000000..aa91537cab37
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2026 Mehmet Fide
+ */
+
+/dts-v1/;
+#include "vf500-colibri.dtsi"
+#include "vf-colibri-iris.dtsi"
+
+/ {
+	model = "Toradex Colibri VF50 on Iris Carrier Board";
+	compatible = "toradex,vf500-colibri-vf50-on-iris", "toradex,vf500-colibri_vf50",
+		     "fsl,vf500";
+};
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts b/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
new file mode 100644
index 000000000000..7db5aa490966
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2026 Mehmet Fide
+ */
+
+/dts-v1/;
+#include "vf610-colibri.dtsi"
+#include "vf-colibri-iris.dtsi"
+
+/ {
+	model = "Toradex Colibri VF61 on Iris Carrier Board";
+	compatible = "toradex,vf610-colibri-vf61-on-iris", "toradex,vf610-colibri_vf61",
+		     "fsl,vf610";
+};
-- 
2.54.0

