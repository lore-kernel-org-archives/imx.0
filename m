Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7734D90C
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 14:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599591; cv=pass; b=UMiU07ZIUVpNBAQID2Y5nb9n15c8Pog62qaaU9ZtAPAWnnd0bJZ5HbC/a/JUlgVJ5nL8W5rM0uoLF3+10KUpdtc4VTMDTux9urWHoLUhCGLg8gHZxDq/81CFl8qlLFb7mNga8mVOiG/DkTOQUz3lgAcRduzYTCKh3M++DNwTOEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599591; c=relaxed/simple;
	bh=96Wz/bkNndSvc3WlFxoHebFEUYaCxPJDd4qW6WhIAT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQ4ywyRFvcUpnVjZd5Aj9z3L3lLTTcDJPDJWi3cL6xP+0NijUPgpxbziAR88Nb+yE67GZLPOVPxTrH6Xp7WkYoLXLdKqmaV2kLjdtbSijg+a+Qcuw6v4veE/9F7O+4Cy0yc6x9i96kTv6rZF+oLN1f+aoV4OjGZT9X4E9uAJhGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jFC2MLjD; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jFC2MLjD"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=/lSimGn8R/KlKdPR732stuvnpUl5cin/7RFYylcQ41o=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771599575;
 b=q5i3GicBzLPMOsC5e6sQUOXFLjwhnh91sUvmY4B33L71G8gm+7vg8c9xDgd3cul6lR99kXJ5
 tLsILF76TuCdnbfCUYUtkZUX/Yj3cuWmnoUc6fU8mVobbZLhbuntza+2n0smVx4XN5X6YLwPn0O
 6+dkrR/LCYV0WU/KKitvJ9N852UXS9vzN/zXr7sEvslGPEemYdIm82UAJ3yzaC+Okyhe7LbuU6m
 zl/nG5b6PkunVm35YARmNvzX17beu7rNK2JsVC4UmfiB+Tvjk2uMAp4dNXHLTUYLz5auSUVz5dQ
 3dJ9NpdhE+RyYpYBZhGRw1tQlvD08oJRfN03s5eRF91JA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771599575;
 b=A2X0/EwAoIR3g7EpfmWJ9v7/CziOr3dUPdD7iuy8zG8ilA8UfdAvkxmAdT8S8Dp7D1h6QU6n
 YZNp92FSDvaSFQfCiVjKL7hJQmUwKsQgfHAkDhCOjxxYxZkgsugj333PcI9j+Yh5KdI8JiPkbe/
 0qxpI/8fpes+RoW50jTMePEEXvnCg4J8YXdsI8g2hTvh8Ni4anfg+HJE5YmxCE8cQaiqIDH84oR
 WJsFUqIwcUrcxEThy/cGN3ul1YL0Zs1Yb8idvF0XNabjkmlnj5+lP1tFqOBnAQ9MY+S8LIj6IEt
 5j6tdakBPfqehCCNgmUMD7pgCLy1trqxgguXrbmOm0Xdw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:59:35 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 08E0B220B97;
	Fri, 20 Feb 2026 15:59:22 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Feilke <alexander.feilke@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Subject: [PATCH v2 2/3] ARM: dts: tqma7: add boot phase properties
Date: Fri, 20 Feb 2026 15:59:08 +0100
Message-ID: <20260220145917.1797286-3-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
References: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.feilke@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fHYLL4ymKz3yZPl
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:49a31fb894d709dca0bc3171073ce3ec
X-cloud-security:scantime:2.031
DKIM-Signature: a=rsa-sha256;
 bh=/lSimGn8R/KlKdPR732stuvnpUl5cin/7RFYylcQ41o=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771599575; v=1;
 b=jFC2MLjDLfs6Li2XvWwdDuZX9Ax/p+XOmvvNUpdlngzWTDReTHWr9ofDY7pqZnCRhqi58+rQ
 +BrSKerO58UQ2iuWrfpnPwvCaw9lmx4xpI+sm1jODszMOmBngOYNLMl6HI3IaHMGpqD/uzyK1Ib
 Y4+T0tOgv65928ZUklwUjEntUCBSVXig6aogGhutw/qgLCwHlHzlvKRiqgI3bfEew8FhZIJX+wK
 zxulyLG8lxJpZUr8a5IsWV5ZPAgSYJwq8MHZwVHPcF3lWi46msvEpK6o0LpndKX+781jshO35dR
 /N/h3HB4c5a2yi7mRNG22BX5mnIR1hePMDke9jY7YCAkQ==

From: Alexander Feilke <alexander.feilke@ew.tq-group.com>

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

Adds boot phase properties to essential resources in
tqma7 device trees. This includes UART, SD-Card, eMMC and QSPI.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi  | 4 ++++
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index 4d948a9757f9..03f2f2cbdfbc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -477,6 +477,7 @@ pinctrl_uart5: uart5grp {
 	};
 
 	pinctrl_uart6: uart6grp {
+		bootph-pre-ram;
 		fsl,pins =
 			<MX7D_PAD_EPDC_DATA08__UART6_DCE_RX	0x7d>,
 			<MX7D_PAD_EPDC_DATA09__UART6_DCE_TX	0x75>,
@@ -511,6 +512,7 @@ pinctrl_usdhc1: usdhc1grp {
 			<MX7D_PAD_SD1_DATA1__SD1_DATA1		0x5e>,
 			<MX7D_PAD_SD1_DATA2__SD1_DATA2		0x5e>,
 			<MX7D_PAD_SD1_DATA3__SD1_DATA3		0x5e>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1_100mhzgrp {
@@ -602,6 +604,7 @@ &uart6 {
 	pinctrl-0 = <&pinctrl_uart6>;
 	assigned-clocks = <&clks IMX7D_UART6_ROOT_SRC>;
 	assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -646,6 +649,7 @@ &usdhc1 {
 	no-1-8-v;
 	no-sdio;
 	no-mmc;
+	bootph-pre-ram;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
index 2966a33bc528..f3d7a2d0cb7b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -193,6 +193,7 @@ pinctrl_qspi: qspigrp {
 			<MX7D_PAD_EPDC_DATA05__QSPI_A_SCLK	0x11>,
 			<MX7D_PAD_EPDC_DATA06__QSPI_A_SS0_B	0x54>,
 			<MX7D_PAD_EPDC_DATA07__QSPI_A_SS1_B	0x54>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_qspi_reset: qspi_resetgrp {
@@ -214,6 +215,7 @@ pinctrl_usdhc3: usdhc3grp {
 			<MX7D_PAD_SD3_DATA6__SD3_DATA6		0x59>,
 			<MX7D_PAD_SD3_DATA7__SD3_DATA7		0x59>,
 			<MX7D_PAD_SD3_STROBE__SD3_STROBE	0x19>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3_100mhzgrp {
@@ -257,6 +259,7 @@ pinctrl_wdog1: wdog1grp {
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_qspi &pinctrl_qspi_reset>;
+	bootph-pre-ram;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -266,6 +269,7 @@ flash0: flash@0 {
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
 		vcc-supply = <&vgen4_reg>;
+		bootph-pre-ram;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -288,6 +292,7 @@ &usdhc3 {
 	no-sdio;
 	vmmc-supply = <&vgen4_reg>;
 	vqmmc-supply = <&sw2_reg>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
-- 
2.43.0

