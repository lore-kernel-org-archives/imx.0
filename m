Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63082C1586
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421104; cv=pass; b=pgQEmT+BLdfs7vIWaPrHz09AFTJ/cfCQiaofnszAXZjpAscueXzIqs2PRUWyj2JCICXq98Dqd/VD1zc3s1SRpwXFpzaCZaOzp0m0l+a7pDhXcCb/bI9Se/gsTreeLLZkZMKwvtPXwO0x7Zr6IRVjJUqfXFeToLgOekjHCMVE4Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421104; c=relaxed/simple;
	bh=xfXwqwBueJTPOc+EBrMOGueLlKYVIP+u+Q5hEbBwUhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0YVeSXkhPUm6KJk7jmGldPtnZJl13rtKlOpj9AvU0Z0ELFlIG1UJ/7wkgkoOzyTJZtf3qbuu/pF8pMp2/aE87rHDJ0dxFdyGszp6jhFDoZBd2x7GYPcODHuRPWmy1MbsojqhsMThtjvdJShGLOxH9+t4t9MnWE6c8VZxVEcBhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=UbGihXHn; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="UbGihXHn"
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=RDEB7Al8C9dMaYAoYH02KGoF+Zms3cmMuP6jo0DNw98=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421035;
 b=nYAzN06pV9KXShbXtA1NUCh/PbV9cXB9hBzhtbhIeMn/9L4yBv+4TX1KkGdsSIHBtWJ8qppc
 vgTBfIV/AYUnV8I5/6mMk0PCU0NDH9IapnjM0PpdwQfOHPvXyXjq7R7nEXAx6cidwWMS/nTc65D
 /80mthJWCd4VxKh89P0O4EUR9Ma9E2+wr7moaRuFTXNdozRvV+A4LKpFPnPMP6cv46qMhkIDuK0
 glkQuEOZvjVhfA3cGT8u4xlLDGsktxuFVuLK1LvYsnVpu0/wdzF4BlwB9/2A/PPbsEdilGPYEpQ
 HseDmFlbxb5JPFTMdNNwdG7fc+0WLsY85vIj0YeE+GVyw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421035;
 b=SCZjgpE7IPJgE4cfC/DnrJpgBVz4M2DVuvANstpoqbBezSWwmdNvMR+58D5V1TRqpwa1T2Y0
 MccZUMHjHUwR+8jl2GIKvAld8ZwuvZUFq9mWPRWsS1pf6RXdkXcu+TCDLQNE7mnCId6zuFePEm0
 Pd+UQgOcQEkR+vvcpORghAL1Ttj/CuzhHcEt4MuZH1RG3mRTNJSFtxrEBSUzXig6oM7t6a6SWYo
 TBydiuJYroH3x6NJ8qjHhLx8D3RKFhWI3edatNY5KZPyv7n9+25ARkAzsGXMfqpnwzK3Ap4MipN
 qzAAO1JshkOF6E+AbiJsJVbZ2lIUAyxl7JmSCjHwDlO5g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Wed, 18 Feb 2026 14:23:55 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3242B2205F0;
	Wed, 18 Feb 2026 14:23:44 +0100 (CET)
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
Subject: [PATCH 2/4] ARM: dts: imx6ul[l]-tqma6ul[l]: add boot phase properties
Date: Wed, 18 Feb 2026 14:23:35 +0100
Message-ID: <20260218132339.32157-3-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4fGHJw6VYjz1kPGCB
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:24d8cc4ecc148cb0df8ddce9d33b9577
X-cloud-security:scantime:1.977
DKIM-Signature: a=rsa-sha256;
 bh=RDEB7Al8C9dMaYAoYH02KGoF+Zms3cmMuP6jo0DNw98=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421035; v=1;
 b=UbGihXHnc3jtHYeRmoxXrUCm1Z/AzDjAi/JiGIU7F2lBGyOI7VNy5wAoYJyn2Jeu+VPaNJ6i
 nRlfUHPCBN1/9Yr/bWpptuycyhfk+q6OcZh3rT8Kttst9daFJ+YQjG+dYVHoL7gPQbdqd3rlzx+
 Ma4KYtSRN+C0y5GZAkHlzKpvWCJMt3lkGk8jmQuhKjbt7SjEOdTaaZ4pqw2gUWsEnmOXhbqjyUt
 0KNUMZeV8aFLjr9GkZxIJ1laUZky4Yljs6INAIc45SRuJVFFN+V7IiMZocm5tek5P7D73WsQibD
 KhGbc8s8zcc59Qzo+W4svqN2np0u+/r6QV9tZ7oVS3fUg==

Add boot phase properties for TQMa6UL[L] device tree.

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

