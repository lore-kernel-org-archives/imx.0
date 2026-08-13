Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD06348167A
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629969; cv=none; b=gD0VB86t8fjBwLeXeXHVq13xEl1ND0/4h9wSzOtCwBMuCsXhMjfpLJg32guYe0G8L2pOsXrWPXL/rk3Gc538vCQewGi83GigXT8BnlfdBYXjLq5fxFsCBnhIQlXXjOq4oCOBXwcmbeK7CBgzJB3KFkKxhGUSkn48+kra/4wUvvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629969; c=relaxed/simple;
	bh=3P0hTxBPlIVGfm7JhVqutkG6EvodjXP4bnv3k8hoKqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTSzctw2SXEIhOoKCxIFFeR0Qc7Or2xpKNPC+Pni5ucDU1BvvtrYq+JGfEsoircfiMczzJgxMekdqojbNguyfj5HYCr+y1b9kv4sOdLjNg8Ob0xjqpDSXgyzgYnyVZAI2Mosf5QAX26N3LdOP6JK/olrJWUSd/OiK7E5IUjYNl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLVm4Ehm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLVm4Ehm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47fe377a217so1355460f8f.1
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 07:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629966; x=1787234766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGVXJHdeFlybbXZS8ISeiKQPBePx7KulAfQGxVyoFuI=;
        b=kLVm4EhmH9C1dTBhEHZgGur+FRKvOY0G2AjdEcAZr+oY+rganGHdKrac0DLePLaRu3
         9NMkp0CbhYHyJEuL0LEtInXduXd/SpvJRXU9r+6C7isbN1vINlfacysS18HC/XfuzLqj
         cCLp2N7yvMf2lCVbt8yOql67AYxxOcxFm9XI1Je3o9s0fzIqRUoBHk+uk/gpRO4afjaJ
         cP0rXDE1T1R/pAlx8ABCd8Fg5jQmFMZnJMnOOMpJ4aooOurHQnpxgsOj763FuqmJhJtp
         0qVdcuDEdh0QtzFrNQV22oUk27nAjHPBHqVFaLcvmxluEX/FqGuC14sk2blgJj/aeXGs
         K00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629966; x=1787234766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGVXJHdeFlybbXZS8ISeiKQPBePx7KulAfQGxVyoFuI=;
        b=OA8nsyuSuTYaUgGXeavrynBJ6kZ5IktFcjZLL10bors2G4gMJ6C6uJoE0bXDLPbplf
         ozztZj/kryCjrhiJ1WzlaF+NefABW1qORWn+7YAmgXvlQofGZEkAyUo4+RQvb8ctwchi
         qyf35rRZoTlSgu79OjP8Av+X7+xgI+YuWHxkLwOvCdY4CKL1UFIXRcCY6B5hP+6THXQs
         /IKACb7FGODnbp2Ow6aJpEdtKr2zz8vVl03TmTrb2eCkEsUi/L5Ajg8ywR8eNG77jWck
         XWx0lJFJwHdXUbNU+xItJJPQFK2tUTKEBQVBP7jey8dccJMPjWNkeJu32fSlM1fp+1vV
         B0Qg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1m1muw8R7ZW1K9qsvwG7tSmaU5g+PoRL/MDxAefH2siceu3OPGfgWfjaCy9dMsJMscb0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGHu+aC74cO2oiQntYm4HqShC4f21dh7LlXxWtQ8CerZcEyJiS
	1iCQxLZxNmf4he4U8FeFnwF6AiO7QCq/EmWU7k548YehiDXEXAFLrJ3k
X-Gm-Gg: AR+sD12Ng9C+wM947RGJNStJqWEqWAbS5a6I2CBK+ggWf4ZDTKxicUC6dTojFAGjjfG
	qCLvI+hFWgGfrq4ty+LMVFZ4Xt8h6HgC/6yBpvJtl1Q+trzhKrdwsEkSaztXGrsCnH5UQor90yL
	nepUrJ5QgRChwVpwQ5i//0DEDrOKafCR5ISF5vjiKTUf/8dkYLxZJd1dm9Qxfpg5JkPHK0V30Qc
	1V1fHTxRQK4VOAmedVSEga25OG9yv6LbxtaCxpVJACTFVL1sQMl/Pi8kw137e2vpbYX6aQu+x4P
	t/V9MxBsBxMHt8c/cUcgipZEYND7+VhOHhaBz+12MeMm2nmKuuW4dpIPh3LoDZVtyYdEDlJ73sr
	vkfitmCPjMlpKl/EXy2Wk+rTsS08jhh/PektZlFIB/pqSj5B6vanbgojoaFiti46DZDLlKn74Cl
	XqrIWxJn44DOQDzxPJrj4I5ZnDwXiHgNbSienccXu/hSnVb1dy9QHJnKBox4QW6qrIsss17b1U8
	j5Q
X-Received: by 2002:a05:6000:46cf:b0:47f:9447:62bf with SMTP id ffacd0b85a97d-48159c90a2dmr6604624f8f.2.1786629965802;
        Thu, 13 Aug 2026 07:06:05 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:05 -0700 (PDT)
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
Subject: [PATCH v3 4/4] ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 16:06:00 +0200
Message-ID: <20260813140600.1824949-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813140600.1824949-1-mehmet.fide@gmail.com>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
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
RTC on it, PWM, SPI and the microSD slot. The host port gets its
VBUS through a regulator on SODIMM 129, and the two GPIOs that turn
the RS232 transceivers on, SODIMM 102 and 104, are hogged. The
touchscreen is an add-on rather than part of the board, so it is
left out.

This describes an Iris V1.1. A V2.0 carries the same signals on the
same pins; what it adds, and what this does not describe, is the
regulator on SODIMM 100 that can cut power to the uSD slot.

Tested on a Colibri VF50 on an Iris V1.1 running 6.18: Ethernet at
100Mbps/Full, a USB dongle enumerating once the VBUS regulator is in
place, the RTC read back over i2c0, all three UARTs, the SPI
controller registering, the microSD slot, and both hogs holding
their pins.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 117 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 +++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 +++
 4 files changed, 147 insertions(+)
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
index 000000000000..bbd0dd76c33c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
@@ -0,0 +1,117 @@
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
+	pinctrl-0 = <&pinctrl_iris_uart25_tx_on>;
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

