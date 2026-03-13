Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70597388384
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 08:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392295; cv=none; b=WB7TVaK6AGa66giiLEqO3K/CEpKhRGmnxzv+GeY8RJEXrLzSLFQk+fOY0xkkTWXzLWt3MpidwmvMNPOEh284+uIwtSZweOur+BOzbtnDmeFciqBB4O7v9JzdAHEUDoUlvx90na9JmOzPBxeo8eNqwOMCwcmYvcTSKispfvm+Rpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392295; c=relaxed/simple;
	bh=EPZn1W5hZeQNHYB/Ftln3HHD72HbRZouba5nrusOMig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aQ1fOLg/gsJngmzuO1GYPypvjRr6MuyR71wI37hfm1lZgE6LE1nz5alNXL8sdI0FjzM0cduwLDgqM/Upx1KlvZ3nLSw9rSBUZMI6n1pKIhlGzwxTMz1FGpz6rvWYHLgO2uHv0qFnaYqeJX87xrzPULWEhW94gDvXEAU+J7njM6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbPgsV3k; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbPgsV3k"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so15372245e9.0
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 01:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773392288; x=1773997088; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMXiZZ3HH6dJoAhlgKlj3UsaxgGuuhGNtyMC3OWYCtw=;
        b=ZbPgsV3kuXMBtb9hpRQLrA/tYQF1wpZKoVoMGDlpzont84fLwXOi1m+mlfyBnQXMzi
         7jRXuLuSB2/+GkBnWWTF9XZG8cEJnOmsBo8E6XVGIV0BSprmiWuYd/1K618eJjTYhCUb
         dKsfUEs75ozGcaghp6qfp99AGBW0oRIwGjX1elguxwbjCvx/SpOMcJ+ulbdzlXCR5dP6
         o4dE7ZsaiI93+82cOTwR/JwBQNxAN0UgMb57NlEcnqq4vyHmZHMACj4lsrL+t6MseN2t
         1OA0P4ipFhbzv09O63BfGhCLhlGOhO3mqO3gCDH7eIaQ4bxulYswQc5YL7Y++S2qrKDM
         4W5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392288; x=1773997088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMXiZZ3HH6dJoAhlgKlj3UsaxgGuuhGNtyMC3OWYCtw=;
        b=EpSQyIKDyiDQmzNCBUm8hEGKrCCzaf1gnh2ap5iJD6gQsKMfi9hKWUasBJaUL5ljG+
         PEVmD2eX//2EecNbq1Jzu43hs4lF71A8VSr+zHdGMEsmo7qDCx45OwMH7AXeAuVDduLq
         Tf0lqQDRIv16i9p+mjE06GW54R31fPeFWByBI7AjJdU3EJAKy672d0IcOyMb8xYeZf/x
         tZz0uFGy69BfyWMK4qzzUj8URncG8wuOuI1Tiwz+AaeSb/L/+xYXbqOK8QTMl6nbvLIm
         OxYsFEDRKqpbB6KDVU5ofxnRWIMz4be8Agl4v7/n532rhQz7YzDau3p2w4pJpRi17db9
         ypmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUTdmib+xdmTVVy4+g/bMo94+rU0pwng4QsPL7kgOPXwcGA8jipyCIm88TI51/k2WNoC0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOrqECuqcBsSYEkOUKfqTlVLmtokDIuN41356zQfI1YvHrMQVw
	SYUJf+mOE7/o7tFsenSAKEvzQ4yyN2re/eD/tddV5JS3tStTb/UuskLD
X-Gm-Gg: ATEYQzzawO0DApcHEmIu9fAkXalAicn1IOB2RTPcgroW122IMRoyJV1ZoPRPalft16A
	eNNrjRJBP7Gne5lP3QhHlSpU/uzKIBE+JNSFS600DMGS2zic3pAcXFfKqCynZnsaTdjE3HR8+bJ
	8lCfgU6JYwE1TIPtiRKW7RW4AU9V74tQCPzOvfxemPyvCcP5EnV2J3Bp37nXheVROij512GVter
	s26P+UaCCrHnr14YMrxyS+jxpQgjk19CqbjFHxInITa7C3CW+gWKZeMOa19yQts9R+Ydm9vL5bT
	bEvAmmUUkkeulxvZ4/l1a1wd38RXA0xxUq2FZweKf6uTtlOUShNvuTModnyiOtK4XrrVLq0N10F
	ffbeX3QZU+ZyME4VEkZtiDMqW9KeDaNutjLwndhshSBgZc0yD+ntQ4wjbY2gtJYYNH4WtMh3AOp
	W+54zva1JlOqr23iUroUPGEclib4zLvcuxtVlkYVBb9la6uOsg8gt4JV3OalYXLWxWl9YZ19jyY
	Uu8jqE9bEHgj+qcd1g9ZVI0gVI=
X-Received: by 2002:a05:600c:c0d1:20b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-485570ce1cfmr23520155e9.4.1773392287655;
        Fri, 13 Mar 2026 01:58:07 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm7663718f8f.36.2026.03.13.01.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:58:07 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 13 Mar 2026 09:57:46 +0100
Subject: [PATCH v2 5/6] arm64: dts: freescale: imx95-verdin: Add Mallow
 carrier board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-verdin-imx95-upstream-frank-li-base-v2-5-bd488be7c699@toradex.com>
References: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
In-Reply-To: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
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
v2: no changes
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-5-823fad02def9@toradex.com/
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

