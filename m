Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A261255F5E
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597899; cv=pass; b=iTUHep76At0G9XAeHgFIga6PAv9xh0YGYxTI+oklxNC03k2RsNqCL10W+vzk71y/gWz7H3I9zp+rE/SBfgx7ShYz/ECXr6aEx/nQNK1+zeYQvbLPREvQZ8T5piwKfgHYM/pyTVlsuIwZlZd0Dgm4KDrjeu46wstf4sd7Srd5/Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597899; c=relaxed/simple;
	bh=9adFiLf/3aoD178kX9YPYxjWWPmRlnssIJbGisN7jsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjv8snAyL8f9cvrq/WJGtT+a08/ZEI8M0chQnMDnzjchCMno3WYLbfLXROIAbAUmg0dtRgOrKcvin9V4w7YICm8XjLgefZo7Mk1jTQ9c7NnDFt5F9FjLTrjL28vjp0wHZ9QisHXMttKNIP10d9WuFQG7C9I7Th50RHydUUUepm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=MHYmONjp; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="MHYmONjp"
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=8Wg8hhuphaDA1KXI4FRar5JXbbzUBqxPKxV6zXxqMdA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597881;
 b=MDfPOkcRk+03WzBfb859u7XLTgSES1i41naIgq4JiNOKcJUJDpY7lN51t10xneaDts3X+gLZ
 YnskzR4dD13n8C/cKHerWeoVLKh8vV5lAQlZaKrRCWfO+2B0OBm+y0UcbbrHW17U1EWVTv12fuH
 HDuZlnkbSSA6xGW9UHm9TkPvTQnPSD41AlfBGYS0syXm8bOJ6ym/TSYVDRBVJ4ss/pD1LvT2Nez
 dA4M4YD+Qfj8OpDhT5dlIvJKRIjPHFlP0WaR1/wIQt4fF3c70ftkqPnk9U5918xC+mheF5YoNgU
 lgo3DznAqGW3dS+wcaw1QdxAhvAjGdhyNOEwrdiJcdJeg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597881;
 b=O0jg8ke3nPRaUvu4XtmXZgn94oq9mrJC75GXYc6brZxHjf0F9Rf2mcGLnxpnmtL44UOdRjyC
 hNtdXw8t8zeN+svzq+Lqy8kXX+HNO7xgkh2HaBKhjvd8YqnPrnMNdHugYTBYLoATnJYBQKMmIBq
 0Ixkr46ZVYYVURiI4RFdmPln75nzdC7WJRCpna0Evp821+QBQPyuPWC0Tb2NV/urTuTOu7wEYyV
 B9F9pjukW2MakK8utJP9w7w+n2A4PcREMlXJhBLNK8iFE8gM3idXOfUBAGQN7jnSt6fpbmBBAOL
 YB/Oxa7JU/oCnfCFpKQCsfZwwz766fMhy3Nwt+dc8JPYQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:31:21 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6C8982205DE;
	Fri, 20 Feb 2026 15:31:10 +0100 (CET)
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
Subject: [PATCH v2 1/4] ARM: dts: imx6ul/imx6ull: add boot phase properties
Date: Fri, 20 Feb 2026 15:31:02 +0100
Message-ID: <20260220143107.186956-2-Max.Merchel@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4fHXjq10Y0z1kNt3l
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:b31b8f68e1352bc9e8374fc850558ebc
X-cloud-security:scantime:1.849
DKIM-Signature: a=rsa-sha256;
 bh=8Wg8hhuphaDA1KXI4FRar5JXbbzUBqxPKxV6zXxqMdA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597881; v=1;
 b=MHYmONjpy4UgMqD3pXIWY5PuCVSRatzF/fZBYA1MSr17br50TWLT79c6KZxJdYqayCA1h/Kv
 THRjs7eTMqi4ni/JMnZg/AF2aWKb8xKC6Hl+jM/sv87INme+TbLFCAdfFnBr/Bhj6+AAQAWbL4I
 3dEeq6XQVsG5fOsBi1HtkX15sEZTlCIek3cGgbdRjqLxqXWfQnp9NPjbWzli5ZU8/p/bEz0Aweo
 VxIpe8wKp8USSIMZFUXpt7qpN+CV4DQvgj68/UxwdQAU/8d15m2cuWhXnLVupJE6XNet0M+CNXe
 aG4I/+umPDChgfmOmiaJWWP15nkBwpWPRuJXAZYYGOErw==

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

All SoCs require buses (aips and spba), clock, iomuxc and SOC access
during boot process.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi  | 7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6ull.dtsi | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
index 6eb80f867f50..24541fdf49ce 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
@@ -115,6 +115,7 @@ osc: clock-osc {
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
 		clock-output-names = "osc";
+		bootph-pre-ram;
 	};
 
 	ipp_di0: clock-di0 {
@@ -143,6 +144,7 @@ soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gpc>;
 		ranges;
+		bootph-pre-ram;
 
 		ocram: sram@900000 {
 			compatible = "mmio-sram";
@@ -202,6 +204,7 @@ aips1: bus@2000000 {
 			#size-cells = <1>;
 			reg = <0x02000000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			spba-bus@2000000 {
 				compatible = "fsl,spba-bus", "simple-bus";
@@ -209,6 +212,7 @@ spba-bus@2000000 {
 				#size-cells = <1>;
 				reg = <0x02000000 0x40000>;
 				ranges;
+				bootph-pre-ram;
 
 				ecspi1: spi@2008000 {
 					#address-cells = <1>;
@@ -580,6 +584,7 @@ clks: clock-controller@20c4000 {
 				#clock-cells = <1>;
 				clocks = <&ckil>, <&osc>, <&ipp_di0>, <&ipp_di1>;
 				clock-names = "ckil", "osc", "ipp_di0", "ipp_di1";
+				bootph-pre-ram;
 			};
 
 			anatop: anatop@20c8000 {
@@ -745,6 +750,7 @@ power-domain@0 {
 			iomuxc: pinctrl@20e0000 {
 				compatible = "fsl,imx6ul-iomuxc";
 				reg = <0x020e0000 0x4000>;
+				bootph-pre-ram;
 			};
 
 			gpr: iomuxc-gpr@20e4000 {
@@ -826,6 +832,7 @@ aips2: bus@2100000 {
 			#size-cells = <1>;
 			reg = <0x02100000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			crypto: crypto@2140000 {
 				compatible = "fsl,imx6ul-caam", "fsl,sec-v4.0";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull.dtsi
index db0c339022ac..ba0ea10c7b74 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull.dtsi
@@ -57,6 +57,7 @@ aips3: bus@2200000 {
 			#size-cells = <1>;
 			reg = <0x02200000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			dcp: crypto@2280000 {
 				compatible = "fsl,imx6ull-dcp", "fsl,imx28-dcp";
-- 
2.43.0

