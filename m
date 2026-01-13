Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B442D374F
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 16:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320375; cv=none; b=Ja/8t5ulgCOOcFUAilnKu15V2kvq8QKsi1yU0lj/mpk0r78FBdiAM0dXM4fXr72Rs4iNSKJdI7f3i4hXpRlspEYEY2ofmNb4eCv77mbvbLnzfKCMYMMZ+1c2HkWKD4dSq6iCes5AyzO7b788uOxIa5OOzst+ENt/y6K2QGOcb6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320375; c=relaxed/simple;
	bh=PNoY+oPVcq1qySKpu5bkjrebwhB2LtCybrJ+6fvflog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hOsJY7l2yiDQNg5hkIlYg2OHJfVxi99+jLZwitKBQrSR+j5BVTPFYuqvYOH5vm6RbtfyYq73UWbr02pWWGnzv7HrZTyR8DYDU7XpJCjfBZaXekJLr5UJ+KnLlfMJS9GP7TL8v3HVglFqaIa1RGJBQw8wMFEKnFUg4HNA5IYXslM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=k3HqSlBr; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="k3HqSlBr"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1vfgOY-00000005WHQ-465d
	for imx@lists.linux.dev;
	Tue, 13 Jan 2026 16:33:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=i9tPInbRYZ5DqbTROuvEuMqdg4B8OEQPATOSgbmxIds=; b=k3HqSlBr938lscRgQVFS8xsNdi
	xmMgvVMTEgZwVcJcOTQhGeSVC8TwGkzY2N0FEq7LbSUmFd+RVBqXiTz0iWeq+KWew7mcWm059YHrM
	h31T6HOdhyX67zko8iWztVbG9XgHgva5Xt3OTFgKREmgBED2QK6Jb/5Y6dXhANhAMSlb6g1stcKL/
	qvGbtzqryDEEtSBozJ/ELG/TvqO0sPqEobMcOB4kZDg9kzOIFuLf61PzhcT3jEVG1veujpBnl6uhw
	wTLZ5fGnaxlFErRFmHTHe34m5YIvSC34sflfqDroVjSPXhq/tlAE3LqnsZCvHIaoFc0O3wo+4Bbhl
	8C3kxFtg==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Tue, 13 Jan 2026 16:31:35 +0100
Subject: [PATCH 2/3] ARM: dts: imx50-kobo-aura: add epd pmic description
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-tps65185-dt-v1-2-66d376ba5f65@kemnade.info>
References: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
In-Reply-To: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>, Josua Mayer <josua.mayer@jm0.eu>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2670; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=jBmRxWjmO330uO2yWkvQ8CKi7YrP9xdjB0Sm7QHVf+4=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJlpqbNKSvJUc9afqjI8YGTVybKqdP+kqha5ORLXHjwIe
 3pYYfrOjlIWBjEuBlkxRZZf1gpun1Se5QZPjbCHmcPKBDKEgYtTACbyVIyR4e0Fz3tKk0v49otb
 LZy2QTju5qGCc1PXxro55xk+jQ5LdGRk2Bd79/pHsy37O77WJiapswrvVNfSunm8bVVl6vQ0GR8
 ZZgA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

From: Josua Mayer <josua.mayer@jm0.eu>

Kobo Aura (N514) includes a TPS65185 PMIC for the epaper display.

Add description for this pmic and its vin power-supply.

Signed-off-by: Josua Mayer <josua.mayer@jm0.eu>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts | 60 ++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
index b1a6a9c58ac3..4725ee241cb1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
@@ -58,6 +58,16 @@ event-frontlight {
 		};
 	};
 
+	epd_pmic_supply: regulator-epd-pmic-in {
+		compatible = "regulator-fixed";
+		regulator-name = "epd_pmic_supply";
+		gpio = <&gpio1 27 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <20000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_epd_pmic_supply>;
+	};
+
 	sd2_pwrseq: pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		pinctrl-names = "default";
@@ -135,7 +145,34 @@ &i2c2 {
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	/* TODO: TPS65185 PMIC for E Ink at 0x68 */
+	pmic@68 {
+		compatible = "ti,tps65185";
+		reg = <0x68>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_epd_pmic>;
+		pwr-good-gpios = <&gpio3 28 GPIO_ACTIVE_HIGH>;
+		vcom-ctrl-gpios = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio3 30 GPIO_ACTIVE_HIGH>;
+		wakeup-gpios = <&gpio3 29 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&epd_pmic_supply>;
+		interrupts-extended = <&gpio4 15 IRQ_TYPE_LEVEL_LOW>;
+
+		regulators {
+			vcom {
+				regulator-name = "vcom";
+			};
+
+			vposneg {
+				regulator-name = "vposneg";
+				regulator-min-microvolt = <15000000>;
+				regulator-max-microvolt = <15000000>;
+			};
+
+			v3p3 {
+				regulator-name = "v3p3";
+			};
+		};
+	};
 };
 
 &i2c3 {
@@ -161,6 +198,27 @@ MX50_PAD_CSPI_SS0__GPIO4_11		0x0	/* INT */
 		>;
 	};
 
+	pinctrl_epd_pmic: epd-pmic-grp {
+		fsl,pins = <
+			/* PWRUP */
+			MX50_PAD_EPDC_PWRCTRL1__GPIO3_30	0x0
+			/* WAKEUP */
+			MX50_PAD_EPDC_PWRCTRL0__GPIO3_29	0x0
+			/* VCOMCTRL */
+			MX50_PAD_EPDC_VCOM0__GPIO4_21		0x0
+			/* PWRGOOD: enable internal 100k pull-up */
+			MX50_PAD_EPDC_PWRSTAT__GPIO3_28		0xe0
+			/* INT: enable internal 100k pull-up */
+			MX50_PAD_ECSPI1_SS0__GPIO4_15		0xe0
+		>;
+	};
+
+	pinctrl_epd_pmic_supply: epd-pmic-supply-grp {
+		fsl,pins = <
+			MX50_PAD_EIM_CRE__GPIO1_27		0x0
+		>;
+	};
+
 	pinctrl_gpiokeys: gpiokeysgrp {
 		fsl,pins = <
 			MX50_PAD_CSPI_MISO__GPIO4_10		0x0

-- 
2.47.3

