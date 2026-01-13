Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72F32D374F
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 16:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320372; cv=none; b=OffO3pC+rmC+2JIKGLHF82gmCo3aJdsD3v/NRjtaqk5lOic4QG9MKgfAoEMz+ZzzRqVBXwysNZgPce7KOrekeG2hj8VtG2ORDeRWAsuLWaYwzhdzh8wuSSRMH9MjMhRBXnczaydFkjcKKDM7/byY/TbWBwmQxVZqcaAutVLN0hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320372; c=relaxed/simple;
	bh=hYsyR4vSg3KkDsH/14JJzUlj+JNroWuLLkBbWg+BP40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fqyqQ5CcdmHfAVBs27j4GHl1IxemLL8d//T7ZxDzATML1gkUsP4e9lhE+i+hz50jE2s2wlwQNSgwtVJkpsBaSqHHRW6h3muwz1iQ4xLZv5Uo7OK4oqMiUU1g8V8HIL4qbQsIo6P2MpMWI21Fuq/pijFoz6jW0RJtRXJPSWmqzaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=dU2/1g8/; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="dU2/1g8/"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1vfgOY-00000005WHN-1tT4
	for imx@lists.linux.dev;
	Tue, 13 Jan 2026 16:33:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Qz/Ll9ghwmV1mMLr5f94o6CVbG9aX9BQ9L7ebvVm/xs=; b=dU2/1g8/HeJ4CdHdzRmZOHHEfS
	Hpi5mZqh8nLDtdEgu7SidTSc7p9Mcxvj7it44iicISBiKN66CyaDW02mGwAeV44w0CGb6r5qsvO8Z
	vzTfdfP5oshRft1qQ2gl0SAhJR8RLHFEZV1vz8qL0p0cJyRc4yY9O5PTC3GY03V6QiGYG4i+6o+ll
	KwtNjdl9SVJL6oiR3foHGlOGz2dk1jmo8l6JwkF8CpiRBI41XDOlEab4bfx8u+ajVhYg+qw1ORhht
	gp7hCxKA48pVpiXs1PjQw/c5OiyMQl6xi2Z9nOaXvgBjVdrUBAwWwiWdgcgy6bD2iCp53CE09wdHK
	QD9mWKdw==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Tue, 13 Jan 2026 16:31:36 +0100
Subject: [PATCH 3/3] ARM: dts: imx: e60k02: add tps65185
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-tps65185-dt-v1-3-66d376ba5f65@kemnade.info>
References: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
In-Reply-To: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5314; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=hYsyR4vSg3KkDsH/14JJzUlj+JNroWuLLkBbWg+BP40=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJlpqbN/NEUY/Vou77z7tLtC1ZXDd5i6fmQkrv3KwHncV
 PtYcY1vRykLgxgXg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABMRVWBkWJF2p/rDJLlF706x
 h1hmShsYpPkYBFS5Mv8IsrIynSB4iJFhe7aUm6Ps9BmGJc7mfZL2V2SWJR/ad0KDd8ak7ZuWiEY
 wAwA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Wire up the TPS65185 regulator needed for the display.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/nxp/imx/e60k02.dtsi              | 35 +++++++++++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts | 26 ++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts | 26 ++++++++++++++++
 3 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi b/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
index 0029c12f16c8..aac7b9ef7627 100644
--- a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
@@ -23,6 +23,14 @@ chosen {
 		stdout-path = &uart1;
 	};
 
+	epd_pmic_supply: regulator-epd-pmic-in {
+		compatible = "regulator-fixed";
+		regulator-name = "epd_pmic_supply";
+		gpio = <&gpio2 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <20000>;
+	};
+
 	gpio_keys: gpio-keys {
 		compatible = "gpio-keys";
 
@@ -119,8 +127,33 @@ touchscreen@24 {
 		vdd-supply = <&ldo5_reg>;
 	};
 
-	/* TODO: TPS65185 PMIC for E Ink at 0x68 */
+	tps65185: pmic@68 {
+		compatible = "ti,tps65185";
+		reg = <0x68>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+		vin-supply = <&epd_pmic_supply>;
+		pwr-good-gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
+		vcom-ctrl-gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>;
+		wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vcom_reg: vcom {
+				regulator-name = "vcom";
+			};
+
+			vposneg_reg: vposneg {
+				regulator-name = "vposneg";
+				regulator-min-microvolt = <15000000>;
+				regulator-max-microvolt = <15000000>;
+			};
 
+			v3p3_reg: v3p3 {
+				regulator-name = "v3p3";
+			};
+		};
+	};
 };
 
 &i2c3 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts
index 5ba6f15e9ed5..58b9ccd9b605 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts
@@ -26,6 +26,11 @@ / {
 	compatible = "kobo,tolino-shine3", "fsl,imx6sl";
 };
 
+&epd_pmic_supply {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_epd_pmic_supply>;
+};
+
 &gpio_keys {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio_keys>;
@@ -59,6 +64,12 @@ MX6SL_PAD_SD1_DAT2__GPIO5_IO13                0x10059 /* TP_RST */
 		>;
 	};
 
+	pinctrl_epd_pmic_supply: epdc-pmic-supplygrp {
+		fsl,pins = <
+			MX6SL_PAD_EPDC_PWRWAKEUP__GPIO2_IO14 0x40010059
+		>;
+	};
+
 	pinctrl_gpio_keys: gpio-keysgrp {
 		fsl,pins = <
 			MX6SL_PAD_SD1_DAT1__GPIO5_IO08	0x17059	/* PWR_SW */
@@ -159,6 +170,16 @@ MX6SL_PAD_KEY_COL2__GPIO3_IO28                         0x1b8b1 /* ricoh619 bat_l
 		>;
 	};
 
+	pinctrl_tps65185_gpio: tps65185-gpio-grp {
+		fsl,pins = <
+			MX6SL_PAD_EPDC_VCOM0__GPIO2_IO03	0x40010059 /* vcom_ctrl */
+			MX6SL_PAD_EPDC_PWRCTRL0__GPIO2_IO07	0x40010059 /* wakeup */
+			MX6SL_PAD_EPDC_PWRCTRL1__GPIO2_IO08	0x40010059 /* enable */
+			MX6SL_PAD_EPDC_PWRCTRL2__GPIO2_IO09	0x17059 /* nINT */
+			MX6SL_PAD_EPDC_PWRSTAT__GPIO2_IO13	0x17059 /* pwr-good */
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX6SL_PAD_UART1_TXD__UART1_TX_DATA 0x1b0b1
@@ -308,6 +329,11 @@ &ricoh619 {
 	pinctrl-0 = <&pinctrl_ricoh_gpio>;
 };
 
+&tps65185 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tps65185_gpio>;
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
index 18c9ac8f7560..1000ee8b807a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
@@ -36,6 +36,11 @@ &cpu0 {
 	soc-supply = <&dcdc1_reg>;
 };
 
+&epd_pmic_supply {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_epd_pmic_supply>;
+};
+
 &gpio_keys {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio_keys>;
@@ -69,6 +74,12 @@ MX6SLL_PAD_SD1_DATA2__GPIO5_IO13                0x10059 /* TP_RST */
 		>;
 	};
 
+	pinctrl_epd_pmic_supply: epdc-pmic-supplygrp {
+		fsl,pins = <
+			MX6SLL_PAD_EPDC_PWR_WAKE__GPIO2_IO14 0x40010059
+		>;
+	};
+
 	pinctrl_gpio_keys: gpio-keysgrp {
 		fsl,pins = <
 			MX6SLL_PAD_SD1_DATA1__GPIO5_IO08	0x17059	/* PWR_SW */
@@ -169,6 +180,16 @@ MX6SLL_PAD_KEY_COL2__GPIO3_IO28	0x1b8b1 /* ricoh619 bat_low_int */
 		>;
 	};
 
+	pinctrl_tps65185_gpio: tps65185-gpio-grp {
+		fsl,pins = <
+			MX6SLL_PAD_EPDC_VCOM0__GPIO2_IO03	0x40010059 /* vcom_ctrl */
+			MX6SLL_PAD_EPDC_PWR_CTRL0__GPIO2_IO07	0x40010059 /* wakeup */
+			MX6SLL_PAD_EPDC_PWR_CTRL1__GPIO2_IO08	0x40010059 /* enable */
+			MX6SLL_PAD_EPDC_PWR_CTRL2__GPIO2_IO09	0x17059 /* nINT */
+			MX6SLL_PAD_EPDC_PWR_STAT__GPIO2_IO13	0x17059 /* pwr-good */
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX6SLL_PAD_UART1_TXD__UART1_DCE_TX 0x1b0b1
@@ -310,6 +331,11 @@ &ricoh619 {
 	pinctrl-0 = <&pinctrl_ricoh_gpio>;
 };
 
+&tps65185 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tps65185_gpio>;
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;

-- 
2.47.3

