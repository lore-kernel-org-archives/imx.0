Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE3B494828
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637471; cv=none; b=oGXSGp9uJu41uUVo8YzF+Vb3USFUt07FnIKQ+L0Yz6gIEKWuenQEyiZ8HF16A0W04un1ud5Hr1CAryBPGnm9Hjlg9AEz/03JVxAtfyqcuO9tl9wJakQ6rRlRn4RGIf9hWut+EbJCqgS8qj3i9Ln++IpEJu3d7yDsXhBDzw/zN1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637471; c=relaxed/simple;
	bh=DioRHXkA2ggKz9JpaI+F0DU/1Zgl1/PbwMwiWke/7qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQHhXV6OZWQzdtnD0nSOm+DmuvZ/4qVYaD0/duWW+yqzCoyl0KuSeH4IwZfcE5OQX622Y56c8nQij3o62fxZ5ZNOiMWJf0zVCxYAhbtWap1lg7jI01AsePAKQxniBNto1ZkxD8mxO1470p+wDS6mr/ePVPoTAIBVDWcsJ2pNs+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2x/evgb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2x/evgb"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4956242332dso857055e9.2
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637467; x=1787242267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pnq03KAWqgH6HH5nirP52bCCrm4Fj5p/TfEHastox6U=;
        b=p2x/evgbpnoX+tPtTECE8MljwPTQqYfJTqOjkKUlGIOylgq+hQBvoQnrZdQj6HSXzn
         G7AKdApP8jOG924YcDZYce7qJ1gcntr7Vt+wsqORmHz47on0LQUU4tXmqKo2fpJWP64n
         nurP5RiJGibbxINUQmiu9MadfpP3Gias+SaiBzi2rnpvcQ/9Dni+F/e4vpjWlFzMZGYT
         CXYZzCmjjlrZOUbkHSYegrAaAY4KsYc9/o4I14TNlSZtbNZotZmMFVtrjoHN7pKYF6Ch
         nZj5pwarqhSxlwjM95pmdWMsnLZ9oQODjdylFs7gqV/2bx1eMiGMJk/19w+MjFVhEMQg
         fLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637467; x=1787242267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnq03KAWqgH6HH5nirP52bCCrm4Fj5p/TfEHastox6U=;
        b=sjoCkeMV3rCNr+L+Ir4MPxEg7YCXnxXWLhsaYbiZI3DPzIEwxBPDv/YzZANi0WnuD2
         65z2z2+HUW1kdtV1kKdSVgUkBW2ccOcl1vQxC/MRjo471efg+GMvsSpRZJzSScl5Sscl
         ADiY54R+WXoID1YCuxPpjywGI94XwyQ+AFWT1pOiE1G+OKOEFmBCYKIGpFtV8ePi9i5y
         /gtalDbjRtfegAsD8kUV0or91p2bOgCiLkGzgYCSljJhwnmA8ndQPFIknpUqfRWAi2ND
         6CAkpa9DOT/a4VQW5OGvVvbxApQCCL3KdVd345bU+IeVhnxgzNfHgVE/nByLG4XtgrnJ
         BMnw==
X-Forwarded-Encrypted: i=1; AHgh+RpyY+oUoWINnLQvLFLTrWiEXMbfvMYFrjsqlNBsfB/4PayYrEogTZLJF/3SXIGhFIbS144=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMLZIFDNQIVkQFpDKMQxIj0m2FFEtk0sfegPQ8mBqy5OQRVFc8
	f5JRRXE5ttnVbRqTs+FJnJi0xiVbhDiznkZ8KFEUj1a5FFW0uA9rKwTL
X-Gm-Gg: AR+sD12er83jD2UhYlmY+puvu2vLmA8/MZPzatmY2FrnzCzbHm2Kpodj58PjbYiuIIw
	JeyFIeNq3fElV/XMq8zi1n5zE8hMyefq8CZzWujkC7SKRGhHZww66qMtp9dg3pwQ/Q7ydgYugpy
	MkMFD73u420NYb/Tute3RzYG5Hez/XF+ISpcyqApkWUJWnM42fAYVbRpaQ843v4ZUHNtRglmfRS
	olugIaCCUB42PM1VysuZPTf6zElfbwy9o6QKGYO2sSE60KJxUER24Zx/0zn6iKbqbHgoSH2Vira
	F0MzivQyYdnj5mskgitr9C0aIa6anTtAAksQf1hnS+grgeqCvyEkpwYOUber998q1p1VsJtOjCR
	B/yVG5VjILiretsaBq7g624ZGguCco7myqdahIGMCn6BL26IzVxoHW5AUQ+cHKzh2lTe9LbGECh
	tfvVPBh4dJwg3mpjn5s2L1tmMRADf/65TMYv6wJhjDLeXCdYTCIc7hh0hLCzm0B2RFl7SmlisXG
	gwj
X-Received: by 2002:a05:600c:8b2f:b0:496:c378:6420 with SMTP id 5b1f17b1804b1-499821a2051mr98698775e9.8.1786637467151;
        Thu, 13 Aug 2026 09:11:07 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:06 -0700 (PDT)
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
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v4 4/4] ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 18:11:01 +0200
Message-ID: <20260813161101.2274327-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
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

Tested on a Colibri VF50 on an Iris V1.1 running 6.18: Ethernet at
100Mbps/Full, a USB dongle enumerating once the VBUS regulator is in
place, the RTC read back over i2c0, all three UARTs, the SPI
controller registering, both PWM chips registering, the microSD
slot, the EXT_IO pin group still applied next to the carrier hog
group, and both hogs holding their pins.

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

