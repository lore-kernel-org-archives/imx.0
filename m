Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E77341661
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828668; cv=pass; b=OvNkpRtlx2ycCFshQ86SNOgYnDMUnrCwdWMZIHW+sYrxXXIH4rMc4hjvsXdOUYwuu6P8Hd3hFRjw6/ydUteXCUYx25e7U3Dd3mJ24rAa5nPDVF3eRxqPCmbWm9p4fPhMVdfT+IG7D9NxsqFcW7eDWPPw/qtaU2W2/GIBZAEkifk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828668; c=relaxed/simple;
	bh=a8HQgogvK4zUKTZ4FzXujcdIdsCm+/5nLbwQ0VbXq8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHfTa/YtRSmLtu/rmjkV8FgL97BpGXXcc8LOEldKshSFlkYEhzAjQPcni0U9uvYMIpYlisbHVKvwZZwAHAcSLvVAxH+a6qiATLpshxZCsnhJ1YgIuWHFvo5CBWk8oeMyE2otPgBWEUIRtYHjPf+Sp96r91bDqEnjejWWBZvw3so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=fH7lS7b9; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="fH7lS7b9"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=PK5ZZtJo+tl9vrIOwQupM3QlXvu4Jm4LnZkxXhrCHtU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828611;
 b=M6GIio7ma6+vAJky41PoAknnWkByc3CU44Et39BGFLEfAVY2GjSZC7oJ1c2IwOJxm+CsF9Zh
 3TLVqoaPRZbosu3BxYbD+B2RegSFSKFRc7gUwhYNYdO30/JZJNGordeg2Vemm4VDzAgnfcZE9OW
 WA6XJIpPdujXa6kpnRH+x2tM7qj6Sr1MymZrxLpap4Xd0ywbOr6nNAUmsmON82xkNSJXJ/pmoGm
 N1pzGew0e+5swZzixHEEbZPRDff3ANi3y83fykHhJy+pWyYe9eETU7pdwracPOREfHPow+JwYge
 zHPKsTO1H7j3I9RDZdazkWwIrr8vSLTIJ/Z4IRhvPwsFw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828611;
 b=AZK+X9YB8UY88hT3xSe8YJkSD1bp/mqZVAeC+6c1RlUAculeFv12E8Ilr2Ey7bR/TSNDHFG/
 AoLccyU8ZyrGlFT88Z7160WHDwWbRD2Je4t4mEDu6bXUPPT28A8UhFVF3CbdfyDFl5lIds5qb6O
 rLJoo8S1HaGGym9QdWvh9yZnzpKXuv6Cv5pbZTWtvj3tKcGwPa7q9MHlQnjhxnSGkvFjjFEi3xe
 Norl/oAdmLTi9CZ2a7gRrJxjECSjzR3fgBxsBKYH6fDTCpP56FWPpmEH+nx0xT6kgDGyHjlZG1b
 nbrftYJgJtEraQ+1cVlFnHkfb2ANxhDg+DMcC7IB2npAg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 30 Oct 2025 13:50:10 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7E327220D26;
	Thu, 30 Oct 2025 13:50:00 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/19] arm64: dts: imx95-tqma9596sa: move pcie config to SOM
Date: Thu, 30 Oct 2025 13:49:15 +0100
Message-ID: <20251030124936.1408152-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4cy3qF1SYTz3yc2t
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:6e315f0fcc0e47734d335f45771da7a3
X-cloud-security:scantime:1.865
DKIM-Signature: a=rsa-sha256;
 bh=PK5ZZtJo+tl9vrIOwQupM3QlXvu4Jm4LnZkxXhrCHtU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828610; v=1;
 b=fH7lS7b9YnSGy/mGzdFIyMdUZF1jqd+qbJoRF7a0+Kq8kBG5sUkm45blzQ81DgcNYwwhT+sU
 AJ/+RAKmc/POL94ftPS+9gMZjXlD0sNUbr1bETUXvwNyXGebQ/farwM5Djjorw+ehgzpgDcOHSq
 JQCD9mXs1E+tctWVZFMlmZvxNUXre+qAL7yQiR9hnzQtKR5TiE5mrU78XSNtsMsAN/wk1HxScUW
 LVmunwQujaP7poCpFj2Qi6MSzCga1waKRlaPANE8nKux6qOU2gZMTuY02KWCPDGmn+BEoErkSps
 aUNlFqQBThFbtaG4NppEc/cTQVDuTLMf3uMsgZGVgl7Cw==

The muxing and other features are mostly determined by SOM, so add it
at this level.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx95-tqma9596sa-mb-smarc-2.dts | 16 --------------
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  | 22 +++++++++++++++++++
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 5c94d8cf28c4c..8caf0c68ba9fc 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -225,27 +225,11 @@ &lpuart8 {
 
 /* X44 mPCIe */
 &pcie0 {
-	pinctrl-0 = <&pinctrl_pcie0>;
-	pinctrl-names = "default";
-	clocks = <&scmi_clk IMX95_CLK_HSIO>,
-		 <&pcieclk 1>,
-		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
-	reset-gpio = <&expander2 9 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
 /* X22 PCIe x1 socket */
 &pcie1 {
-	pinctrl-0 = <&pinctrl_pcie1>;
-	pinctrl-names = "default";
-	clocks = <&scmi_clk IMX95_CLK_HSIO>,
-		 <&pcieclk 0>,
-		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
-	reset-gpio = <&expander2 10 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index e7edeec712dcb..832c753abcd75 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -391,6 +391,28 @@ ethphy3: ethernet-phy@3 {
 	};
 };
 
+&pcie0 {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX95_CLK_HSIO>,
+		 <&pcieclk 1>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+	reset-gpio = <&expander2 9 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX95_CLK_HSIO>,
+		 <&pcieclk 0>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+	reset-gpio = <&expander2 10 GPIO_ACTIVE_LOW>;
+};
+
 &sai3 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-- 
2.43.0

