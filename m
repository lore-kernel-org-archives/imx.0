Received: from mx-relay97-hz2.antispameurope.com (mx-relay97-hz2.antispameurope.com [94.100.136.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8C0328B68
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.197
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771422966; cv=pass; b=tmPGVQ4gLUHwN7GR6eVCO6PPG7opc+PznOx7LNM0UPyNvSHZEoKrmCIHuERBbb2y/REhnpt1h11SAEeWQTU5tohYkBnqWOsxFIgBTm/plpM/qw3BedruoJSUX5lNRPgUjASlNk0206gn2Gp2zz/2IIyP+s/CwKan6fn0JkCf5RM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771422966; c=relaxed/simple;
	bh=U81t+y2wIrVWwluXE/5ubQBk+/JYkkVQKwvYIUsAC8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EDxgvaqVI9jpp25imCZs146gZ3aiIJ1VUhABNw+HFZJQ2UelNTNLms9jjPpZpgxc/AyucXpcHHZZriK5Y7u3drOqd3DSPt4lFEKbu4f8FvsuAYqnApenTJnCLoSRQRupiMRuORxK+loTLgUNqlQONrvS9qeCVM0RARbc+MkBNlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=scDDJdXJ; arc=pass smtp.client-ip=94.100.136.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="scDDJdXJ"
ARC-Authentication-Results: i=1; mx-gate97-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=TvFkedKwU7Tki1WJjhUdJTuzQZqOqROBb2WWlOoeJHc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771422882;
 b=LA0awuN2M0jWX2q4r6IuApj0+weJZn+6a7uaC48F33HM3SkaORFjmWAiBJXGxEBLg1YtJGYx
 rTXEa3fq4AJdhsFTUVHd+WfKJssCjP4Htg1LbbA+MGJ4aKftaniRa6DM5jrZ8ms/MvrhwLBt5bG
 GfSu3tfd340wo9JhMkoot5RCkhjvvYaRp3NSrMxP7Kh2sRWSANz0x4yjm8BsVpKs7LKX7WF9Qc6
 sWPpVq7NCv7K1fJ0v82iP74fhFyK9ZFNspm27bqx7RiBJe5RngPIikUMcVLkwiyomVmjyYvEnlI
 k9YYRxJ3rjBzPRaBVNR4R8/I5pkOX43lCDoceGlH6dyAg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771422882;
 b=LLRzxqe7Rid/6mZq65uLY+xrCLbJucKaU7qFLbFwWQY65ZNQ9dArWaKKORKI1RISXuB+PW8Q
 KB1uy/2XCIdEZlEFL+OJTvqbCK+71oVu4vHQnVE6FdRZeDkTvBrIBOzeyucnoABsimsIOrXgUM0
 Yl20nJ7qHr33uW2Z/CLmY5Q0/NyBycT/N5h6vXZYwOF7O/gQCGjY2JGeMCi73yebFMtknQVd1kA
 43KG2PJ8rTSNIyMgsZPL1qdfRzeXpmu48nFkbwKHdQoimHn3ThhNp9VvTGlWzgWfzWfq0lDW+I2
 b9ly9k2pzNqatVcC33jgChSwTgcA9dpzXnzr17/dHHEHg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay97-hz2.antispameurope.com;
 Wed, 18 Feb 2026 14:54:42 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8B61D220714;
	Wed, 18 Feb 2026 14:54:27 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux@ew.tq-group.com,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: tqma7: add boot phase properties
Date: Wed, 18 Feb 2026 14:54:13 +0100
Message-ID: <20260218135415.204974-3-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
References: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay97-hz2.antispameurope.com with 4fGJ0N5DXnz1yKnb
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:3ffff1d6d88180f557de01e140f7d817
X-cloud-security:scantime:2.271
DKIM-Signature: a=rsa-sha256;
 bh=TvFkedKwU7Tki1WJjhUdJTuzQZqOqROBb2WWlOoeJHc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771422881; v=1;
 b=scDDJdXJ7Ft/xkofEna1/7808/9++OdACAa6ZJ+U6kSGb3a2aLdug9/0IkWyaSvARrEzQQVQ
 1y7PwdOCDPIyvCSCF1FUpQ5J4ZapHkRE18m1GeKzXP1onrbR0NQ2KlG+ZimB5CbBvxfLlpF+No3
 i2zxXw4SLzb5WImlJHmgBEQ4SZLpjVdWMniERN/yXXlJ4PK3Y5wVZL86Mul2udMt0kB+SeLCoRt
 lzogYFsglBDHsG+tVnaj+CU8UU5qm+4QDil5ELw2hmGWLlBME1jz/37U8i5W7m/FH0Z0nKCFhgX
 rGUKNhvmhIgB3fdu16W7LEkWBtGTYta5rOSsHZ8jvQu/g==

Adds boot phase properties to essential resources in
tqma7 device trees.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi  | 4 ++++
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 2 ++
 2 files changed, 6 insertions(+)

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
index 2966a33bc528..3a01b1cfb5fa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -214,6 +214,7 @@ pinctrl_usdhc3: usdhc3grp {
 			<MX7D_PAD_SD3_DATA6__SD3_DATA6		0x59>,
 			<MX7D_PAD_SD3_DATA7__SD3_DATA7		0x59>,
 			<MX7D_PAD_SD3_STROBE__SD3_STROBE	0x19>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3_100mhzgrp {
@@ -288,6 +289,7 @@ &usdhc3 {
 	no-sdio;
 	vmmc-supply = <&vgen4_reg>;
 	vqmmc-supply = <&sw2_reg>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
-- 
2.43.0

