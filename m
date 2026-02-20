Received: from mx-relay94-hz2.antispameurope.com (mx-relay94-hz2.antispameurope.com [94.100.136.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA56267714
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597926; cv=pass; b=asi9MmhYMCloUtTH9bUfHtSQXCAy7FGJK258+5AmQKPrR5XpakJjWy0UX4iiqWouaEfZTp904ySFCBCFpsOy5Jng8caG9feIKUiyaGAmzsaQjhGTw2VOERoH+l5MgJKhVPVx0LUvngwwAX+oz3kgt9K9b5EJyLesVNBoGcUKTEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597926; c=relaxed/simple;
	bh=/bqxzQpzzJ81IQljbkViUoD0W4RZVJhyMGiKRtMNksI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jc9HOtorpotOWFttAkVTr/+NF6ww/wmuIKoPDD+cJphrPF0QJB5nGlyuNgfHYAx/YhpIAcxToDfWKgj9VxYhwac45kQePTF0FEsc/4I/pNr7a/AuEYiPsVy1/+qe4qw6HOGO4k5a6ZUoGNX9PiZLzSbuBKQQUDJuCx9w+0aTekA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=CFTM5UuD; arc=pass smtp.client-ip=94.100.136.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CFTM5UuD"
ARC-Authentication-Results: i=1; mx-gate94-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=wqJgdoCqiOdzIhzrfhNSF/MhiuLEn1kACd6MHSSRwJY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597842;
 b=kDpotTfNeJ8Tm1HKPs8Y/J7ZF+Cq8XkgZf6JEx0zDCC5dwZ2wtOxkRaVQDJO9IfIAlDVyblF
 g727Xu1qFL2FJj0XnzNlj3XYjTYC50gt10GVaQglyKSQ6mWpOtTEYWboippytfUhvSQ7E7bZwJE
 h7OLmpEWpeMt4kJSBxk543Z4Trj0P6ZCYEH39KvWHog2vy9cdivQUj+VJTxmtCSECdrsyKzLRAJ
 zhIK16A/ljNd/P7m/n1cQyW/oVirhxAO62dSEM+kxZHpaKhWrlbVWycdLT6pVSXrUW9UZl4mrhp
 KzYYxDQlMtUkvFbJuG1mF9rHb6WprfcPTnWTEMGJw3YMw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597842;
 b=KHOM8dnBUuM44RXjd+9k6dA0DV7gbDHMy3ehx3ZvB/ecszFlpHavAh8ZUha+WIC1B7C2AIpI
 5Ugzc4iE11t6P5qZzPzVBIiguJ2AkYTry0sI2fPb4mdJoIOrP4QeagOAyE1ETchxfRfSLDWS4LI
 F640z2HiWFHIxY6Ok/TIDiVLcA/xomCQs6PxRlIIAYHzOFOICzO6Du1+fEzsMHM/8mCsmHv4EkX
 Oakn2gxz7FQ0oPjc5SoX0w/+CdoGpr73j2Iez/ytkoa9zp4JvhjTvJPIY0qT7nb5PmpE8yPXjGq
 fvj0PDiYp2SDlAPA9lguZlxxcsSSlLV6zE0/a+1N/m/6A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay94-hz2.antispameurope.com;
 Fri, 20 Feb 2026 15:30:41 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D84CCA41357;
	Fri, 20 Feb 2026 15:30:29 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] ARM: dts: imx6qdl-tqma6: add boot phase properties
Date: Fri, 20 Feb 2026 15:30:04 +0100
Message-ID: <20260220143008.186851-4-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
References: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:max.merchel@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay94-hz2.antispameurope.com with 4fHXj24CHgz3dG6N
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:c0a012c4c0204103e9d00e65e5abcb83
X-cloud-security:scantime:2.128
DKIM-Signature: a=rsa-sha256;
 bh=wqJgdoCqiOdzIhzrfhNSF/MhiuLEn1kACd6MHSSRwJY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597841; v=1;
 b=CFTM5UuD2jj4K8Zt4T2TLPayYIRPL1QXlcCZ7Jt37zAYJXwbpF+4dM6z3CNsbdwmeTyhbdgx
 jNHXM79Cnt2B8i6RHK7wFK6G2Bxcnh1VwXUvgKeKgGYN8tIwpKN0/FZR36SPOLo+GXJmWrNvUnT
 aQFDvZfS+rpBwMiry2m3+k6evXNtI4e2NsFz/d5IM8xv3zhE+UAAs8QNtH/mvVpHCUb8gfO5fpQ
 R77pYN6LXPIVu0ApsGpBJCGAJwJA/Dhhbmd+eT8QVJmBjc1eFrIb0HI2Yaiy02In4+fQmRTStob
 rkLPtDog1u/vLMZIPkjKyt3AUCNRZCyePNn2zKTqxYXrw==

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

TQMa6 need eMMC, I2C, GPIO, regulator and QSPI access during
boot process.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 11 +++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
index 07492f63a1f8..14676d1d905a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
@@ -11,6 +11,7 @@ &ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
 	cs-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+	bootph-pre-ram;
 	status = "okay";
 
 	m25p80: flash@0 {
@@ -19,6 +20,7 @@ m25p80: flash@0 {
 		spi-max-frequency = <50000000>;
 		vcc-supply = <&sw4_reg>;
 		m25p,fast-read;
+		bootph-pre-ram;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -28,6 +30,10 @@ partitions {
 	};
 };
 
+&gpio3 {
+	bootph-pre-ram;
+};
+
 &iomuxc {
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
@@ -38,6 +44,7 @@ MX6QDL_PAD_EIM_D16__ECSPI1_SCLK 0xb099
 			 /* eCSPI1 SS1 */
 			MX6QDL_PAD_EIM_D19__GPIO3_IO19 0xb099
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_i2c1: i2c1grp {
@@ -45,6 +52,7 @@ pinctrl_i2c1: i2c1grp {
 			MX6QDL_PAD_CSI0_DAT8__I2C1_SDA 0x4001b899
 			MX6QDL_PAD_CSI0_DAT9__I2C1_SCL 0x4001b899
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_i2c1_recovery: i2c1recoverygrp {
@@ -73,6 +81,7 @@ MX6QDL_PAD_SD3_DAT5__SD3_DATA5 0x17059
 			MX6QDL_PAD_SD3_DAT6__SD3_DATA6 0x17059
 			MX6QDL_PAD_SD3_DAT7__SD3_DATA7 0x17059
 		>;
+		bootph-all;
 	};
 };
 
@@ -117,6 +126,7 @@ sw4_reg: sw4 {
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
 			regulator-always-on;
+			bootph-pre-ram;
 		};
 
 		reg_5v_600mA: swbst {
@@ -186,6 +196,7 @@ &usdhc3 {
 	bus-width = <8>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-all;
 	status = "okay";
 
 	mmccard: mmccard@0 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
index 1251749a8dd0..67f8f59aff5a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
@@ -20,6 +20,7 @@ &i2c1 {
 	scl-gpios = <&gpio5 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	clock-frequency = <100000>;
+	bootph-pre-ram;
 	status = "okay";
 
 	pmic: pmic@8 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
index 7f526f39e0f2..db552802554d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
@@ -13,6 +13,7 @@ &i2c3 {
 	scl-gpios = <&gpio1 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio1 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	clock-frequency = <100000>;
+	bootph-pre-ram;
 	status = "okay";
 
 	pmic: pmic@8 {
@@ -40,6 +41,7 @@ pinctrl_i2c3: i2c3grp {
 			MX6QDL_PAD_GPIO_5__I2C3_SCL 0x4001b899
 			MX6QDL_PAD_GPIO_6__I2C3_SDA 0x4001b899
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_i2c3_recovery: i2c3recoverygrp {
-- 
2.43.0

