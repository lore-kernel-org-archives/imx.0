Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A54E3FA5E7
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 14:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450002; cv=none; b=KhmR6e0G6DrBOguAeHiB1XUeFe/T8Nm697bz3Ww6UtPEAve+00Gt+c5Shon1OpUno/F8P31rOnGCk9MED4To94GKtkcPUgi6pRXyBf9RvU5Tezs0RBzgV8OaduBPvoTNKpxYE8GYY7zSPqi/LeQX7EMd0Jdm679TjGCtTndaZz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450002; c=relaxed/simple;
	bh=S+vDA/CUAW0AdwEu4XTgNPMcU/k9DOtf8L80RrxtbY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t542kaBs1Syxn0QnB9mYNRZuG0uYGz9qjkXun5addrheV/p5TohZWmQ/bxGWIChdI8vcxAfNuAzsbi8tTQu9kU0XmFVoMhjLq+uHF0Dt2TSiN3L7xdgKicqWvW3tUa25jx4c+k2J8cZAmr4ER1HgceR+t/FM+sgSakKMZ0OjI0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rK/gJ2/V; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rK/gJ2/V"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b7ff8fe92so1516568f8f.0
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 07:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449996; x=1775054796; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBdxpWorokQAvNVpC6lVKaJZ3EjyzK0DA7aANYhbAVE=;
        b=rK/gJ2/VdKbuS18kjBt30mYgmfC3SkH9NY1RX479QdafYgIeamb7KoW7Wds1yNpn1e
         b1iDLIxV76uPqJXINkVMd8fVgK9Wh3Fb6+fsawZI2/X3e+0FC5l5CM+sLPwuEEHOC58U
         IUlWCgwmrL7cr80UD1C5wRRNZyWf00geok1R9KMA8GeMq+hUqdq4da80JKai6KVhOwot
         RwqxHufAenEW9d6Hp4Xp657QFmnbor528PuCVYR9/36Y7exK/Ly31V8kUtANACjpDW2O
         tQCRXyfPboqutsaduWJHPmVGS7v2mqFNJrU4zbMI4fuQB7SUM5LxzxLdsoWID8u9CNSe
         KqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449996; x=1775054796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iBdxpWorokQAvNVpC6lVKaJZ3EjyzK0DA7aANYhbAVE=;
        b=k+NToWSh9CHZ/kTnDzuSo5FRA8Zqw8o3ikKaR/NOVvaoqM769pm4GixLaA2uiQIFCv
         jpjWM9l9jTvpbtfXRz9qzqZatMmJxKtld8z0kvigg6gcFD14/DCAXSeai0yNwA5pipDx
         KrPZv84ywQyroHXcq2zbTwv3YlQdPobvvjs/Ln5ayH/7/eEQfppYNOpM15AUtcn8ON6P
         G52lW+M/95188ePfSzuobISQQtaUAuv0ssd5GPH8vzfrdnjaz+cpcz5WfmEfp2d/svj5
         usOY7S9XRD9ra14rL/F/0mn0DPNVcYtw3GsLriAOWoeVMSiWDuxVqLJSIYRcN1OCyU7h
         /bOg==
X-Forwarded-Encrypted: i=1; AJvYcCVdearronW5xEaeHajEmpP6E09pu6pvAlIEKqmUosnUIfsOmzjLVQtjpGjHawUZghoc5aU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxY2eMWhdg1aGr7YdTyBtgO/BHCvP/u/WU5Dh/ThfizcpoUPw6u
	1SeozyCmvaq1R4Jewik7ndfxiOg+i0M58A1xBZ79wYh/2AQ2LoZolGN4
X-Gm-Gg: ATEYQzzpVbebF3SR2tY/oSdFTLhdt6dVg+RQahY6VANkt9w/C8TxjKitSuDSlP3EgGK
	e9yITXhkostd8k9cQqWpEMAOcyyUNq1YHnAhld0khvYpEdyQLqKRN1CT92yhFsI7PG7rd5BdIIm
	dga/6qQvL5b8/SX4OPqpvlAGHEXSPCb0+fMqOapcY3R8/1Nk0E6AnJNzkcfB6cJJy4P8CLnm4mV
	xW3mXrHyiUcqUjvjpB48slljXn3yPOa0++o4QUgOiZW5bNrJufe9ZdkPb/M/CiKeYp7IBGNB/Ub
	YDKhVRv9w6JKxLTVAqZMY9EK2Pg9ZI9x1RkRH21jbQDB5//cDPErweOp8mj1S5gC0cMxkMTSphO
	O7YzJNJ1Smk3ssmBpEas86Y1e0gWuuXsSEyPcHv5MMgdGPz6Xc05vJl/Sffd05J0qqVG/oZTcOF
	pTtt0I4vHACQ1kJTSe7lFFR8D1NcjL0P618ezO3PupNdGPJt9U2fJ8TRQndAeUCNs2Yyu0dc7cj
	emWZihzQ+szeJ/yOfL3Ridj6SU=
X-Received: by 2002:a05:6000:400e:b0:43b:40ef:5d1a with SMTP id ffacd0b85a97d-43b88999322mr5728065f8f.5.1774449996226;
        Wed, 25 Mar 2026 07:46:36 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm304592f8f.8.2026.03.25.07.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:46:35 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 25 Mar 2026 15:46:06 +0100
Subject: [PATCH v3 5/6] arm64: dts: freescale: imx95-verdin: Add Mallow
 carrier board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-verdin-imx95-upstream-frank-li-base-v3-5-b2b5221a8077@toradex.com>
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

Add support for the Verdin i.MX95 SoM mated with the Mallow carrier
board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: no changes
v2: no changes
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-5-823fad02def9@toradex.com/
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../boot/dts/freescale/imx95-verdin-mallow.dtsi    | 223 +++++++++++++++++++++
 .../dts/freescale/imx95-verdin-nonwifi-mallow.dts  |  21 ++
 .../dts/freescale/imx95-verdin-wifi-mallow.dts     |  21 ++
 4 files changed, 267 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4417b4a3d245..10417fc895de 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -500,9 +500,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
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

