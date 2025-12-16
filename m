Received: from mx-relay93-hz2.antispameurope.com (mx-relay93-hz2.antispameurope.com [94.100.136.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7C6398B96
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891912; cv=pass; b=d5n+eIZ19hHArL1fl0+0ePCeeHeX2IExi6hApZOT2brGCrpTjGWziJCuzCSvXqBQbogDJxbEeGlThkGjHGmlU5YBSCskKKZxYgtXCnK6x1fIWz25RLrHqUqGZYc33cY4hdnFVrCxPfZd5jTE9FIhg8mxoZk0Ti1hEba+nVi0a48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891912; c=relaxed/simple;
	bh=1vcbNES+su2OO2olrrDYQUbPCkKYn8vT4vs9BjA2X9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLicuyuTnPGxqCfhy7H5395ZKWnvuJX7D6x+Z0OCuOk6tDxFVDZfd2BhvCQI+qD4oRq0OuXj6anlMlOA/lL4gsapFX5tcO+00+OtN4nDzZPFLBm1jvqsKO44PSWUoWzUuShwfLrRo/R6TtMhA4L1X+7BRwi5u83ggiF7+bgu6fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jedvmb5A; arc=pass smtp.client-ip=94.100.136.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jedvmb5A"
ARC-Authentication-Results: i=1; mx-gate93-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=x9mGmXqHfOmeLgdEOLDPoxQ5MFnm0tlfSuhg2kM00pQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765891887;
 b=Q89vDzY0wiR1X7np21N2MiwcIo8Yun7b+zYFFzZmT3JLluKEA85o1Oze+9jyeQMYKgO1GK0s
 hQBheAgNI3grjCpSytyrMdRRe99pLFctT5msJKhEPzT2ptqrMr9jqbr52SoQW0vA4K5AOrd56zg
 z3jrcT77TTYg5TvBNVPLM+2QoRz9Pj8qHg32TW/WhlUPLUbDZVjIbcRrRDD8s4d5DVOJhvhjZBi
 frwzSo98zR4VTuJhV7BpVsbW1evpApWcFjeB2dDk6rlGZJk5SqXuwecviIu/iH3lGgPFY+VZ78r
 OS+z9EGfOFmJgwhP8JhgHD8OtR5Qd75doGB24YKOEgsqA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765891887;
 b=rnOX7Jnu31bTH1aW37wz/BzI8fCHYVGMdDwauo2RTmC482SFb6DJ7+il5ZuNdHLvsjRdtCGZ
 E8onw50NAWXj1fe59D3Z3M/Ph/2t3IsPX5FkvV2hs03mTaTc/Vq42xL6pfbdUDuejdCYPwd+21Q
 +xRixs15rk1AFCT/owFA3S+nSZM7pgJ2qMFvessdCgcMOBgxXYuDumYFP+bi2XVp9XQBGOV9Ipz
 kzrR8zwiHhZ1+O0QPkjZWB4fwzCEK+5wZ+yN+NZrTgbXzuVzoiRY6VT+Ej/EGuXXjGRQ7X8TR80
 2ipXJC6NDQC4Uwla0KAWa5FFD1TwDI+Fyon2ya3Ro7apw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay93-hz2.antispameurope.com;
 Tue, 16 Dec 2025 14:31:27 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 56EB55A0F66;
	Tue, 16 Dec 2025 14:31:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 4/4] arm64: dts: imx8mm-tqma8mqml: fix LDO5 power off
Date: Tue, 16 Dec 2025 14:31:07 +0100
Message-ID: <20251216133110.905950-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
References: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-body-digest:f05457902f37798828b49e9ea5497943
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay93-hz2.antispameurope.com with 4dVyW90kQLz4QHDJ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:8607d1a79e30606a7dcee9ac57a97bd3
X-cloud-security:scantime:2.034
DKIM-Signature: a=rsa-sha256;
 bh=x9mGmXqHfOmeLgdEOLDPoxQ5MFnm0tlfSuhg2kM00pQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765891886; v=1;
 b=jedvmb5AghQl5BMRJhxedJbA6F9tPUTywE1UIUGl0+oHFlm81tCvAe8gs+1Eq7zKK0B2cJUM
 dH0u7j4CNNX0NTT8zNm9bYzktdZpZMG7Ke2fONR2qr1fK46ZXTP5ovOgBhxURmQlXSk3LfsKpw+
 0g0FWZr7Pqm1OXlmGaC9RfkS6Vuvsx136jQf36Ety20/3iu9XKqiBofgGONs4YA1eoEUCn130wF
 7hkZksQNG0LwzSb2JfsWxuur3RYbaJskqH4+cSENEZvYznnSVgXwkY4lwTz/RpfK9coNXUzW/E7
 IHxiOiWN0oSo/KQMLP7f8ZS2qjH2y4EvTI8XYu3mCyS0Q==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Fix SD card removal caused by automatic LDO5 power off after boot.

To prevent this, add vqmmc regulator for USDHC, using a GPIO-controlled
regulator that is supplied by LDO5. Since this is implemented on SoM but
used on baseboards with SD-card interface, implement the functionality
on SoM part and optionally enable it on baseboards if needed.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx8mm-tqma8mqml-mba8mx.dts | 13 ++++++-----
 .../boot/dts/freescale/imx8mm-tqma8mqml.dtsi  | 22 +++++++++++++++++++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
index b941c8c4f7bb4..8dcc5cbcb8f66 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
@@ -101,6 +101,10 @@ &pcie0 {
 	status = "okay";
 };
 
+&reg_usdhc2_vqmmc {
+	status = "okay";
+};
+
 &sai3 {
 	assigned-clocks = <&clk IMX8MM_CLK_SAI3>;
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
@@ -276,8 +280,7 @@ pinctrl_usdhc2: usdhc2grp {
 			   <MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4>,
 			   <MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4>,
 			   <MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4>,
-			   <MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>,
-			   <MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x84>;
+			   <MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
@@ -286,8 +289,7 @@ pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 			   <MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4>,
 			   <MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4>,
 			   <MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4>,
-			   <MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>,
-			   <MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x84>;
+			   <MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
@@ -296,7 +298,6 @@ pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 			   <MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4>,
 			   <MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4>,
 			   <MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4>,
-			   <MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>,
-			   <MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x84>;
+			   <MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index 2e3860a5f4fd2..29b298af0d739 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -16,6 +16,20 @@ memory@40000000 {
 		reg = <0x00000000 0x40000000 0 0x40000000>;
 	};
 
+	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
+		compatible = "regulator-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vqmmc>;
+		regulator-name = "V_SD2";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x1>,
+			 <3300000 0x0>;
+		vin-supply = <&ldo5_reg>;
+		status = "disabled";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -227,6 +241,10 @@ &pcie_phy {
 	fsl,clkreq-unsupported;
 };
 
+&usdhc2 {
+	vqmmc-supply = <&reg_usdhc2_vqmmc>;
+};
+
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc3>;
@@ -281,6 +299,10 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19		0x84>;
 	};
 
+	pinctrl_reg_usdhc2_vqmmc: regusdhc2vqmmcgrp {
+		fsl,pins = <MX8MM_IOMUXC_GPIO1_IO04_GPIO1_IO4		0xc0>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x1d4>,
 			   <MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d2>,
-- 
2.43.0

