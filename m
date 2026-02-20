Received: from mx-relay68-hz1.antispameurope.com (mx-relay68-hz1.antispameurope.com [94.100.133.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E7E257ACF
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597903; cv=pass; b=nVx+mpFlA3POXjoW57Cl1tdu0LYpBoRO/V+KPXQny0nplBpGip+ijown55YIGKYx//pOIjgf3Rw9k/R/Ys8vPvaePSglpDyL2GGFqv1SJMmKelufStJ0ujC2FIGaAvREHPDq85jXzgaryHR6ihvr3jhYX9hTIYv1LT0AZ3i6lIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597903; c=relaxed/simple;
	bh=pknrNsXMvT/3ufvgZ7TLRGEdUQ5fD05TrbjxoeTVUn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fr32HBw5Qn2t9nSmMbrZmXBS2AzPXyyD+wYetKb69tUleeK191YKp3D5nTacEekfQqWZQfqpbVd0l6aX5Pg/eMeAwAlYb0AxzE1YMZzD9gGESLCzg6EbbKU8Wi5rhkFTixbJtdTDOl2AZU2d42u81MJ0ZevPMzHOWaa9ClQTpns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Dra9hp7u; arc=pass smtp.client-ip=94.100.133.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Dra9hp7u"
ARC-Authentication-Results: i=1; mx-gate68-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=603U3ROzybwhiSlbS4OAQhgc3+1jl0bt89ybh3NF/Nc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597882;
 b=e6C/Lp/Za0qrMlqx+dx6ywOOoWRuS/cnE4O1gl/3eCz+CRNK5rx2WFZVpCVmSy3bQy/K/4il
 B0KiDvpmVdid6VG92a1SsJMnC58lr/yjdJ8sd04CfmZQpDwW8A+PLzhUiRbljd3Tdsfztu4M4/K
 zIbLgEUIqtHMU6eNOJFjwnbITHb9zjxgQ+WUSewWI1ZgkgJcZEkG+rFirowWSNSyFnZDxsErIt/
 3tz8V8V8Ii+Qp7I9uWJMD5rduiDfLoUceJYfqDYSrPUzhCzrQopP600wQVFk1jHCwC8A2q1/3CB
 try36L7ITQsDLnv569lZvWdzg2H8Mwp1kJ4nCrvQAi0Gg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597882;
 b=WyTRA/S4UgVKE4P4nFnKIorGCkMNg6Z6HYB6PfGFueog2s4bz5t34nybUf4I7aQ77+/75a8K
 Hz5RtfZVKm0P0qO0XrAHMNTsTYYcjfekedgr0ku9yUSnSBSeU6KzNbdx/7Zj1KVpC1j9WY55Uxf
 buV6+YDf4jnDuNPpSnIYMTdfSRe0qFRGj01/B1ZcItnffUGXkOGhkof+GlOv33E5R8dw9DZ7ocr
 W/Te/TRA48Qv84q8ENaqKdw66wBvcWhQKe64KoKBiU3oLjitkyr+nPzpfvgNlhD+63MVltjXOur
 dTKsvJrYUCzBotSD9ZPEOSlBUGXAjgLg9PgFgRmyM1yAQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay68-hz1.antispameurope.com;
 Fri, 20 Feb 2026 15:31:22 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 18AB4220CB6;
	Fri, 20 Feb 2026 15:31:11 +0100 (CET)
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
Subject: [PATCH v2 2/4] ARM: dts: imx6ul[l]-tqma6ul[l]: add boot phase properties
Date: Fri, 20 Feb 2026 15:31:03 +0100
Message-ID: <20260220143107.186956-3-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
References: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay68-hz1.antispameurope.com with 4fHXjq5LdBz2QYhL
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:39bf467f7897a36c62318cbf4ba7f61d
X-cloud-security:scantime:2.185
DKIM-Signature: a=rsa-sha256;
 bh=603U3ROzybwhiSlbS4OAQhgc3+1jl0bt89ybh3NF/Nc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597881; v=1;
 b=Dra9hp7uUWGMntnL+adlilPc/erWSqO1lygpUk4HZ1ztTY/up/gF7p8KLBF+NQG6dDht8nkK
 Q/nKhTNzmJ5TUb3zCOWIvXGlgP/gcsrGVykBsxejF1wL4FA8XOR441EzXgYFXUbA9jit0uqU9l0
 n0ZiC7IejdhblElLyafleNKhkgYFsEEPVPJzCslx2LXgFeMgTtgyUmaCwrJZLMhYA3nAILHkUNN
 Au3X7f/Q4epE/WwbRIY+4gqr57UYvKKxzyGNiR4yuUO2r45DSlLpFdP+KwmC/juqHTQtcZi0MaL
 raEDZc2o0S+yr0etLve/0HfjEO1vMfvZMOqEvpZNDjn4w==

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

TQMa6UL need eMMC, I2C, GPIO and QSPI access during boot process.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi   | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi         |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi        |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi       |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi      |  1 +
 7 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
index 2dd635a615cb..4fa98e6a66d7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
@@ -26,6 +26,7 @@ &i2c4 {
 	pinctrl-1 = <&pinctrl_i2c4_recovery>;
 	scl-gpios = <&gpio1 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio1 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	bootph-pre-ram;
 	status = "okay";
 
 	pfuze3000: pmic@8 {
@@ -140,9 +141,14 @@ rtc0: rtc@68 {
 	};
 };
 
+&gpio1 {
+	bootph-pre-ram;
+};
+
 &gpio4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pmic>;
+	bootph-pre-ram;
 
 	/*
 	 * PMIC & temperature sensor IRQ
@@ -159,6 +165,7 @@ pmic-int-hog {
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_qspi>;
+	bootph-pre-ram;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -168,6 +175,7 @@ flash0: flash@0 {
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
 		vcc-supply = <&reg_vldo4>;
+		bootph-pre-ram;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -189,6 +197,7 @@ &usdhc2 {
 	non-removable;
 	no-sdio;
 	no-sd;
+	bootph-all;
 	status = "okay";
 };
 
@@ -212,5 +221,6 @@ pinctrl_pmic: pmicgrp {
 			/* PMIC irq */
 			MX6UL_PAD_CSI_DATA03__GPIO4_IO24	0x1b099
 		>;
+		bootph-pre-ram;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi
index e2e95dd92263..f81cd09fe0c7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi
@@ -33,6 +33,7 @@ MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x00017051
 			/* rst */
 			MX6UL_PAD_NAND_ALE__GPIO4_IO10		0x0001b051
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi
index 4b87e2dc70dc..11c8f1af4173 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi
@@ -33,6 +33,7 @@ MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x00017051
 			/* rst */
 			MX6UL_PAD_NAND_ALE__GPIO4_IO10		0x0001b051
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi
index 5afb9046c202..5c90d0a3ee2e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi
@@ -39,5 +39,6 @@ MX6UL_PAD_NAND_CE1_B__QSPI_A_DATA02   0x70b9
 			MX6UL_PAD_NAND_CLE__QSPI_A_DATA03     0x70b9
 			MX6UL_PAD_NAND_DQS__QSPI_A_SS0_B      0x70a1
 		>;
+		bootph-pre-ram;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi
index ba84a4f70ebd..133961ee7283 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi
@@ -44,5 +44,6 @@ MX6UL_PAD_NAND_CE1_B__QSPI_A_DATA02   0x70a9
 			MX6UL_PAD_NAND_CLE__QSPI_A_DATA03     0x70a9
 			MX6UL_PAD_NAND_DQS__QSPI_A_SS0_B      0x70a1
 		>;
+		bootph-pre-ram;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi
index 8541cb3f3b3e..1224ef132439 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi
@@ -38,6 +38,7 @@ MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x00017039
 			/* rst */
 			MX6UL_PAD_NAND_ALE__GPIO4_IO10		0x0001b051
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
index be593d47e3b1..6dd1b359e086 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
@@ -38,6 +38,7 @@ MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x00017039
 			/* rst */
 			MX6UL_PAD_NAND_ALE__GPIO4_IO10		0x0001b051
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-- 
2.43.0

