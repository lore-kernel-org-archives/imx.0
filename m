Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2CE37C92A
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 08:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068374; cv=none; b=uj7cf+7VG8M/8WRVhzduUCm2QjFKKisRWBDV/AmyvJqUTS4kcS8tgY6c3gf0FgMjO28ltIPpSmhrB3zc7klB7WdQKouoDHnB2Ej0CQ1455KPw9RV/c5Too666SEI5DeYuDRR0RScGdxW+QC13FFcT4kRHkF0xD8L31duzI8okNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068374; c=relaxed/simple;
	bh=I1cHu9NSZYBGonBfRtRuTgsmlJqfnA+uMtlThkFiRNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mt8mdmC5aJJCzEXRnqknfn4G1wm1Z/8fwp5dvNH1uZhnhQQaE7VG418Fz/GZNsUAMWsOHu2vwWrg+dJqrDTlf4buL/luQqzCC1E8zt4rRiCsT7E/VyfRAJ5RvCXYRul8FygVSf9G1zunWXwqWaHzfz7vk4cOs7oEtRCRjECzB+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0Z+eGMf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0Z+eGMf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so2342305e9.1
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 01:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068369; x=1783673169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaMysW8ENvaf3rrvLxL52kqIKJ0nwCCn6rGzVpw7LPE=;
        b=X0Z+eGMfh/W28cVSXR3Ggr9OczHkYCAKeTwowuigU+i/MKGDmFe1LCzdEWxWKhmvW9
         T9Rou4t7zOCn3iQyTrV+RPISjME9XSPXdLugrBhIHHAJkTMoZTjirTnkqosx/0GjmOPd
         jwsyfG/4yWlAwaDdflcViIYvo6j42HtLkRTHBlpzP+EXobtBiCjd0JyXCvCqzp1bYns7
         7L6KvjBAe0Ww6rWva5Ttzu9aGiQ0AT4G+EsKeEGrNjRhb+cbt0V/4QkjG9G6aOX99T4Q
         CN+7LoInbc+9EqVuubHs+mwfIPz6U/5do4OQ8HE1HMxJQU7cqQHCOcZmerWqpcqwx9q7
         lf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068369; x=1783673169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EaMysW8ENvaf3rrvLxL52kqIKJ0nwCCn6rGzVpw7LPE=;
        b=KZsvxzSV0OW86pSMXruguebnDqq3iu+dOWh0txhVC4FSCu64sEq7Jc2mgN9jIoY3jI
         1bj8iqitCmFVAYu0Rde1zHSwfTAhqJN9vVkC1lgpIQI7VNmrM78ugsg+bpXdWJt/XMpo
         PNgi1CXl0ShqdKrVfdNR2IGQm2h2iRE8CihExYp8Ub68jIDFa1tuuYy0QChM/fKmSXli
         cm1g2MYJnOIOrPgxxKoiooPdg7RYxmPBXF5cEr6lO5wnp7IcZZTE+bxG1BAloqNoT8+D
         pKeOgRGdST6vUTWew0DNmDIPxR+IhOj1ajjxGP5k49KKl3cYv6D7UbzU+pwS5HLsAh52
         lmfA==
X-Forwarded-Encrypted: i=1; AFNElJ8xieeVvYaR+o70bQ7uHFMBv2jR0FP50YBwQl2M/0p27o7Tc1I66C/SKKjfvLdpl5GgAlE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTQ2ROg7gRoaVjWQFc0KTtVdmjwonCNEHCmxefV81YtzwT6kkT
	XmDN32NDrBlYKP/ZuMLzEuW5ELK04e0H23WxyddddIUbTnRv6BoEhAYc
X-Gm-Gg: AfdE7cmqtgLu6xO1JdKG1wGKuZXRKmPyU9jSJGBlE4YUEM5DKH/Q5IWB112fC+Zy93v
	RsONhenJ+vEh5MIoj0nnZbrQKU18lKccd4Y48ioUQq0Xwm31mkVQ9rbdzG7MA0ZQxwC47f6qBfI
	z07nVGFtJY8LY1IOUlYgHxSrDBlUGe90IHrB8Hma0VH8YAX+e2AxNraPIKKLtcM1zweGOj4o8qz
	48lcNHNBBY2nc5wYWmpoBFkKwcnPdMq+eRVbgbbraMHqpXJnJ0P0W1vGGcxXAByDBC34NGqimmT
	pONvQZjGUHthLYc5iAP+4L9HjIqIbkd6A9itI3IjCigpoPU/aEuJhfwtos3fTF/M7AT+ewMtTpr
	MqMO7+yDSzUAREJXkxtslxGsaSnigJIM4iX+fmFmUZ7Pd04fdVk8J9UcZf1xCip7g6NbpvFmTjd
	lpZ4Hyem7Cq9qhqrZLerwFOVl/56eqsXjv9kljpy0IiFAU1jDFuIBQqc3nmAEievAne8vcmuEfC
	0Ud+JPL08AnQDgySb1JXLGMUEGXKe9BNfDa
X-Received: by 2002:a05:600c:a011:b0:492:7025:13fd with SMTP id 5b1f17b1804b1-493c9b0d55dmr39419845e9.0.1783068369380;
        Fri, 03 Jul 2026 01:46:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:08 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 02/15] arm64: dts: freescale: imx8mn-var-som: move SD card support to Symphony
Date: Fri,  3 Jul 2026 10:45:49 +0200
Message-ID: <87e54dbf65c27944b015335ac699fce7f45369f4.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN module does not provide an onboard SD card slot.
USDHC2 is routed to the SD card slot on the Symphony carrier board.

Move the USDHC2 node and pinctrl configuration from the SOM device tree
to imx8mn-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mn-var-som-symphony.dts | 57 +++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 56 ------------------
 2 files changed, 57 insertions(+), 56 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index b07e71d3adee..7308613a48b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -28,6 +28,7 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		regulator-max-microvolt = <3300000>;
 		gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		off-on-delay-us = <20000>;
 	};
 
 	gpio-keys {
@@ -200,6 +201,20 @@ usb1_drd_sw: endpoint {
 	};
 };
 
+/* SD */
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MN_CLK_USDHC2>;
+	assigned-clock-rates = <200000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_captouch: captouchgrp {
 		fsl,pins = <
@@ -252,4 +267,46 @@ MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
 			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x41
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 32f101ef2850..e1d2e2a72e1f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -295,20 +295,6 @@ brcmf: wifi@1 {
 	};
 };
 
-/* SD */
-&usdhc2 {
-	assigned-clocks = <&clk IMX8MN_CLK_USDHC2>;
-	assigned-clock-rates = <200000000>;
-	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
-	cd-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
-	bus-width = <4>;
-	vmmc-supply = <&reg_usdhc2_vmmc>;
-	status = "okay";
-};
-
 /* eMMC */
 &usdhc3 {
 	assigned-clocks = <&clk IMX8MN_CLK_USDHC3_ROOT>;
@@ -454,48 +440,6 @@ MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d6
 		>;
 	};
 
-	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
-		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x41
-		>;
-	};
-
-	pinctrl_usdhc2: usdhc2grp {
-		fsl,pins = <
-			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
-			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
-			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
-			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
-			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
-			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
-			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
-	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-		fsl,pins = <
-			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
-			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
-			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
-			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
-			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
-			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
-			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
-	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
-		fsl,pins = <
-			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
-			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
-			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
-			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
-			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
-			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
-			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
-- 
2.47.3

