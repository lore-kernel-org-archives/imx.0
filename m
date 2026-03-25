Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543133F9F46
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450003; cv=none; b=qVHvMQhsfgCXmVrF3ejMF7YhCAYcPZLuooMCoPXnEiwkJKHcsG+kkwll1sc0tLCP1LoUX0OYd5+lBMPi7Mj9Z4djNjKdbZvjpACcpNnL9uNeNIJ1eibHbixLziE3EuVeCJ8ZEHqrrNNjVKxUcYpJttWJW1z3lzbH3SI8ERPGdRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450003; c=relaxed/simple;
	bh=8qB+9iWMmtG/bUdEVnuNISlvjWZxC1V+Y5D8ZDAx+NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fJaBk2cFf6AIQKesX1uvXFSpRktICDay6erowG6HF8dT/+VCiTF0dWeIL+n7G/5m7CNtnU1MWIfU3QrmeeT/dK9Deg3skkY2pYBt427zWgSzLHqfdnMd+joHuU+UZGgDiDto9xGErlXhcPD75YjOwBAAej/xERLx0L9zzxZ1uXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kI0dSA1X; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kI0dSA1X"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439c6fc2910so1863462f8f.0
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 07:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449997; x=1775054797; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrlBOke3UCcCRXGtCiCjDm/vPc8qLCfIRNlITCApmXs=;
        b=kI0dSA1XBRL4uThF+FCc0nXfwgwz2HRedvOEphFDKdxYqbJMlBbYC+41A4tb/MKHB9
         gWdCkJnqBCY/L3Pyw2P7FwNYrgGV1+hHSmQEvsEV2ZkGg7+MtA60/pUzp20Ygf5FTNLB
         aZwU0MeIVBAnKWXVeIDKfl2aWeHOA5uUPZks3EOpYWcXQwh8olFAMpFvP4y/+N158hif
         DgSzIDP+k8LDMnEHiLIZZFMA3j4bxQ2GmGgodSPIGjbIRCNRPz2sqM5nqhVT58BUN86M
         yZ29ytCfAhGaLhqWGVosr8nUbrxtRIQaaE0CcuzqO9YDqQepu4QYAfpGbuQUEQzQXH0n
         SKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449997; x=1775054797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IrlBOke3UCcCRXGtCiCjDm/vPc8qLCfIRNlITCApmXs=;
        b=QefeYIWj4dsKDOCEHwyFL/ISF3xJuQMU/3bYCUdYiXCKV4M8S3n3DezyKr+f6T4AjG
         meSqr0gPtF+HHTU6bIAi/E32u1kWiezxRU3g6p8e3umI3C7lLvFXR3J1q2oyRB9LBYLY
         oERCfpBbvIPs5oOXH010ZVefdLSNCoGZgghH38mo0Zqa+x91YiktcIHVU1pmxYYyE300
         IYzy4TDafyz+kLn4aBNc7USh+7/dDUiAbnLN4CHjvyXlD4P2viE2c/pWgbNsoQWhXd8p
         ZTnlmblZ1O/kG43e5rTwDlabJbb/WLV2br1+G0rHeohovetFCG+geq//iJezjNkmiJDM
         qsMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVosmsF28FdY9fsjyU8mhoKVAPiENmYZMhhf0mfhkCBp4X7OueYsnOQ+ZSWPNaxUrsTCVI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEVo/xDy//wcUjVwfVMf0j+ps3ZZf4/e5Ny1n34EGZ2B3CF/uB
	p1OERiGtIZoVQdionUCZ7QzCsL0/KEVZFu1Bw3kjbOC5eayaidsyJmqg
X-Gm-Gg: ATEYQzx7HeeDT9XLoJvQqmvWTbMJl5G5NNzq1WI9gaEkft0i5ZQQYml+1KJC/WEK/7M
	iNA1/CWa2RTWsBE8Yzh7TS+Di4b3Ig1yAarRT45NJC9dZBmCEh49RzsqpXN8MCUETvq2iWviU30
	qTynzWYLODTYJYT+/du+ctEXktvdNj19jDo7sIP+DO7wjzpPlQWuHgkygMoNk14LDvPfQPI6wvd
	vn5jKn/erbUWrmO32xFxrbmbFybysa5WP/Lj1YLh0D8K/qDLSs9e+9U8ObEtXNpkGu3Fp2Wgxus
	xCZ4uEFRke23gy5w/C+dXwpT4jsRYMEmOQ5R8ZgdtFT9C17t+b9TQzQ8JqiLHY2QWAmWjT67Znq
	QklXfCP77hMsfAHAVc0PQRuj+LaYKnM4Rj3e8oVARVj2MfUCfzdbrtaUWlIj8weR0f+55v+FRWM
	VfuwOxUqZFAIb8iq0XD1R8KotD8f6hK4lyaT+bpZxLpuz9NI/hlu1jX80kcCRfHVEEfV3JxvPIe
	6C2zVJkG+wMd0WN2Xd2ULsm9pA=
X-Received: by 2002:a05:6000:288c:b0:43b:3be3:9a16 with SMTP id ffacd0b85a97d-43b88a29212mr6080023f8f.38.1774449997217;
        Wed, 25 Mar 2026 07:46:37 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm304592f8f.8.2026.03.25.07.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:46:36 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 25 Mar 2026 15:46:07 +0100
Subject: [PATCH v3 6/6] arm64: dts: freescale: imx95-verdin: Add Yavia
 carrier board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-verdin-imx95-upstream-frank-li-base-v3-6-b2b5221a8077@toradex.com>
References: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
In-Reply-To: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add support for the Verdin i.MX95 SoM mated with the Yavia carrier
board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/yavia
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: no changes
v2: no changes
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-6-823fad02def9@toradex.com/
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx95-verdin-nonwifi-yavia.dts   |  21 ++
 .../boot/dts/freescale/imx95-verdin-wifi-yavia.dts |  21 ++
 .../boot/dts/freescale/imx95-verdin-yavia.dtsi     | 217 +++++++++++++++++++++
 4 files changed, 261 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 10417fc895de..5bee7c83a724 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -501,10 +501,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dts
new file mode 100644
index 000000000000..4f7b4e3a518b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/yavia
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-nonwifi.dtsi"
+#include "imx95-verdin-yavia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 on Yavia Board";
+	compatible = "toradex,verdin-imx95-nonwifi-yavia",
+		     "toradex,verdin-imx95-nonwifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dts
new file mode 100644
index 000000000000..43d35b770db2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/yavia
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-wifi.dtsi"
+#include "imx95-verdin-yavia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 WB on Yavia Board";
+	compatible = "toradex,verdin-imx95-wifi-yavia",
+		     "toradex,verdin-imx95-wifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-yavia.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-yavia.dtsi
new file mode 100644
index 000000000000..6403ae584e70
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-yavia.dtsi
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin iMX95 SoM on Yavia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/yavia
+ */
+
+#include <dt-bindings/leds/common.h>
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_qspi1_clk_gpio>,
+			    <&pinctrl_qspi1_cs_gpio>,
+			    <&pinctrl_qspi1_io0_gpio>,
+			    <&pinctrl_qspi1_io1_gpio>,
+			    <&pinctrl_qspi1_io2_gpio>,
+			    <&pinctrl_qspi1_io3_gpio>;
+
+		/* SODIMM 52 - LD1_RED */
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 54 - LD1_GREEN */
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&gpio5 10 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 56 - LD1_BLUE */
+		led-2 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&gpio5 0 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 58 - LD2_RED */
+		led-3 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 60 - LD2_GREEN */
+		led-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 62 - LD2_BLUE */
+		led-5 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&gpio5 3 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+/* Verdin ADC_1, ADC_2, ADC_3 and ADC_4 */
+&adc1 {
+	status = "okay";
+};
+
+/* Verdin ETH_1 (On-module PHY) */
+&enetc_port0 {
+	status = "okay";
+};
+
+/* Verdin CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+/* Verdin CAN_2 */
+&flexcan2 {
+	status = "okay";
+};
+
+&gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio1>,
+		    <&pinctrl_gpio2>,
+		    <&pinctrl_gpio3>;
+};
+
+&gpio3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio6>;
+};
+
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio5>;
+};
+
+&gpio5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio4>,
+		    <&pinctrl_qspi1_cs2_gpio>,
+		    <&pinctrl_qspi1_dqs_gpio>;
+};
+
+/* Verdin I2C_3_HDMI */
+&i3c2 {
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&lpi2c3 {
+	status = "okay";
+};
+
+/* Verdin I2C_1 */
+&lpi2c4 {
+	status = "okay";
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp75c";
+		reg = <0x4f>;
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Verdin I2C_4_CSI */
+&lpi2c5 {
+	status = "okay";
+};
+
+/* Verdin UART_3, used as the Linux console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* Verdin UART_4 */
+&lpuart2 {
+	status = "okay";
+};
+
+/* Verdin UART_1 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* Verdin UART_2 */
+&lpuart8 {
+	status = "okay";
+};
+
+/* Verdin PCIE_1 */
+&pcie0 {
+	status = "okay";
+};
+
+/* Verdin PWM_1 */
+&tpm4 {
+	status = "okay";
+};
+
+/* Verdin PWM_2 */
+&tpm5 {
+	status = "okay";
+};
+
+/* Verdin PWM_3_DSI */
+&tpm6 {
+	status = "okay";
+};
+
+/* Verdin USB_1 */
+&usb2 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usb3 {
+	fsl,permanently-attached;
+
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+/* Verdin SD_1 */
+&usdhc2 {
+	status = "okay";
+};
+
+/* Verdin CTRL_WAKE1_MICO# */
+&verdin_gpio_keys {
+	status = "okay";
+};

-- 
2.43.0

