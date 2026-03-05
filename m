Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006FA3ACA65
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 17:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731505; cv=none; b=gOGQSbhlKnzZo7MqdMfsjo+v3hTi9T3D3SSPICEmO3GUrXv4WMjgKHp8O9Kqa9zLO48yBf1QGPMRe5yu81aQDQi/Dac2g+FGRcNt5wwTbPvmpLrNnuvMV/jJiZE2QY+rm3rBeOe+/LQFRaqFzC+ht3mIqCCDEi/YSi9sS9VfXyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731505; c=relaxed/simple;
	bh=dHovZ9LaAnZyCg2cc/B1vZvik1SyXQfKFZ/xvJZXa78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bCKLOQDv5A+jDnvvi++hCE+SOn4E0ZMkFZtZ5/nUUhzGdFIUrc9O8+VDxD0JKwg8CTEB3QGKVV1vNRsyNBkQWxQG7997HKdS+IGq7lWKOznlvB1GgM6+30se3tdrFoilLOX3ov7aaN9L0JGArv5uqqlFjMK/ATZopuzc8k5+1VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFt/s7Cb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFt/s7Cb"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48379a42f76so71477565e9.0
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 09:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772731501; x=1773336301; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+gIWIMeZ1+FqNtpP8c8MmWwIEyqkbZzeQ4vhQsXykc=;
        b=nFt/s7Cb4/vHDq8qT76CIFVh7wK5MKLvDTIPaI8i1b04CLAf9vhYq/qKpW04fkil83
         IdxFrg6SoYSsak0QVuH7EiW4Rg2ljfEd1lDBzF9SNsIQtfCPHVTQn4yDG4jpMunC8Aqj
         eSIbTQKS6QAGS/VZzutxRovQNfSPjQTyOZhGDoZMKclmTKOMEj4uAjYHa92DPxV0haXR
         0UG5PYHBJvy8AKW7SUH1GHndxmOp2VJTpzFl+W7Zgg42VdmbnAGz0MEKqWBvMOrAhODl
         wfQRejjCJ/EMuhlXMiKrK2y5svWJHtg5yYOBFVZg7x0dkKhbGT0cY02PYCn9UVBdeObO
         EzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731501; x=1773336301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M+gIWIMeZ1+FqNtpP8c8MmWwIEyqkbZzeQ4vhQsXykc=;
        b=Jah2Rm5dX0YHE1HpVb8WIHNZ8TgR/dzov/eS8hrzMy97yD4qjk2TXOXAxWcryPBgyL
         fgzEAQO/5KQ4cmL3ZJvt68FoBPqdxHD0q8p66FHROUFn6i5Krkmwxm6JJFtLSnRdlBpj
         TCHMInm2/P9ELsysU3BbLWqYtthsQ/HmrlHCy8aGMKoWgvJAmNYfUrhChH3qWRdgE8NO
         iYwYLrnS+vpj0vJe5PZIj4FXH0/fwPmEszu5WaoL0cWCtnGnBnBXgSF4Upy3+z4Rpg6g
         bO09wuAczuDLFeDp3KlsGScoQkEntMNI3HxeHLdLsyp1GcRjh/wIs7A04gpMqLeX7xIQ
         1YdA==
X-Forwarded-Encrypted: i=1; AJvYcCWw4H/ISViRQvEHMilsaZhpRnC0gl4g+mbj9Q39N5KAT2tRaMRvNWQ05txv36l+a3viuOg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj9uWi2yzVpMk9TBvVLZ/dl/00D0D83fs1nZzSwo6Nzyl6xozh
	le3Ai9qAijuzuxXerTniMz4SJ5etlvc89CF4TmWlaN2yxbapC6Miqm9Z
X-Gm-Gg: ATEYQzzQMWca2PDVp148S0/TL+VfySFIKLPELeI8FBVbudM8T7fjyq/ngvB2bcHAif7
	W1xZV1i2anld5ufhN7GqIWbFousuBZFim2WBPAJEbWX2f78zTLHwsfHRQgdbT98XSOP36d7gJbj
	l7VI8Ca724KiL3B880gKqaYJ5ELVlj9ij6dWRiJ6A9APNkLKSEoAgxlTp/UDKxIAVYhjskQk6Wx
	vtkXQDpOeyLC9Ao/6NjYa6iJCXs+3aIoJyrfTr9r/f79MOq0lonCRgAVL6x9azT2s7+e5K+1F7T
	nQJ4zwyCeZ9zkhcva5axmUh0RgNdyAeDrHcp7o/6w5eUMiEOz5GK5MtdJqmrD0g5WEu07daGHoW
	KmpIkuvHZYK1KrVBoZgt3VLRuhbVOcKBj6cDp8ckw0ALPEmVwo4/E2icyrwgTgk0J895ujO7bav
	+BOS8ep1R3Z0BN3+ZYMHhtel6eYMinXNL1W3mkGHMvv/cc9RW5pC+CS1kjozV1UND6THM1QubYW
	dssJSd/lfEw/2clZinFb+ChhQQ=
X-Received: by 2002:a05:600c:3ba2:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-4851984bc7dmr116197755e9.12.1772731501153;
        Thu, 05 Mar 2026 09:25:01 -0800 (PST)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fafe4c9sm67153495e9.15.2026.03.05.09.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 09:25:00 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 05 Mar 2026 18:24:33 +0100
Subject: [PATCH 5/6] arm64: dts: freescale: imx95-verdin: Add Mallow
 carrier board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-verdin-imx95-upstream-frank-li-base-v1-5-823fad02def9@toradex.com>
References: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
In-Reply-To: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
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

Add support for the Verdin i.MX95 SoM mated with the Mallow carrier
board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../boot/dts/freescale/imx95-verdin-mallow.dtsi    | 223 +++++++++++++++++++++
 .../dts/freescale/imx95-verdin-nonwifi-mallow.dts  |  21 ++
 .../dts/freescale/imx95-verdin-wifi-mallow.dts     |  21 ++
 4 files changed, 267 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 34af11b1ef6b..e3c34f8f40cd 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -455,9 +455,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-mallow.dtsi
new file mode 100644
index 000000000000..53506b7550f5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-mallow.dtsi
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin iMX95 SoM on Mallow carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/mallow-carrier-board
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
+			    <&pinctrl_qspi1_io1_gpio>;
+
+		/* SODIMM 52 - USER_LED_1_RED */
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 54 - USER_LED_1_GREEN */
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&gpio5 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 56 - USER_LED_2_RED */
+		led-2 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&gpio5 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 58 - USER_LED_2_GREEN */
+		led-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
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
+	pinctrl-0 = <&pinctrl_gpio4>;
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
+		compatible = "ti,tmp1075";
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
+/* Verdin SPI_1 */
+&lpspi6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi6>,
+		    <&pinctrl_spi1_cs>,
+		    <&pinctrl_qspi1_cs2_gpio>;
+	cs-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>,
+		   <&som_gpio_expander 13 GPIO_ACTIVE_LOW>,
+		   <&gpio5 11 GPIO_ACTIVE_LOW>;
+
+	tpm@2 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_qspi1_dqs_gpio>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <18500000>;
+	};
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
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dts
new file mode 100644
index 000000000000..5a9c0e4a79c9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/mallow-carrier-board
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-nonwifi.dtsi"
+#include "imx95-verdin-mallow.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 on Mallow Board";
+	compatible = "toradex,verdin-imx95-nonwifi-mallow",
+		     "toradex,verdin-imx95-nonwifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dts
new file mode 100644
index 000000000000..eaa67a39be1c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/mallow-carrier-board
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-wifi.dtsi"
+#include "imx95-verdin-mallow.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 WB on Mallow Board";
+	compatible = "toradex,verdin-imx95-wifi-mallow",
+		     "toradex,verdin-imx95-wifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};

-- 
2.43.0

