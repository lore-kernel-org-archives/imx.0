Received: from mx-relay13-hz2.antispameurope.com (mx-relay13-hz2.antispameurope.com [83.246.65.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738712C3259
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421045; cv=pass; b=iLwMhTq7Ic2JSWMS4GFAJBtoLBNRQaECK5IHy50XQNUqDmnxnACZBgK8mF7SjuClu2gvkUJd+LcQEMPMUUzthiNsd+lWclbH1jJgUEmZ+Iu5P+SHojA+rLCU6ezScvaw3HG2BimV98LEjikzm97UBTvbFysrEOrr+jaNeq7iF/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421045; c=relaxed/simple;
	bh=Lqa+W/InJiMsJcFaCqPhqA0VqCeAVMN/8wOxNHkZJ0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDGpYshAcUUy7UBWQLNRDrysyKjOHW7+2TM5P/Hvvfd7F3AtZXZci6hTUBZBPLQEeun4b7SYfkM4EkB4TgoccMOZFjis5WQ1D0yhDLX9YfWPshxNGAOpGdMFOhS5SHWhRwYOUu5m7Lux7RUddZhEqMkI92CcQPrVVT9OrKn39rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=osC03EMP; arc=pass smtp.client-ip=83.246.65.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="osC03EMP"
ARC-Authentication-Results: i=1; mx-gate13-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=3X41+/DDb79VlrAXhpveO5mOonDaOzhaJoIuv+461r4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421004;
 b=Oc1pFsdJtRWvqgLVAqJnQOLJvMA5qT2twQ7CnbTX2/cOqtIWsrpjhs4+vGvtY3fB/7p5Zjcl
 lhrpYPB3KPvG4DoitMTxHNWh76XqnAJ4j+sXZ+Rur0NLsGKUDBE3TpV4rZESFqkJvpI8gRsHVxO
 zdgZXyPyiKCQJ5pGZ3r4rIUpXJA2ss25J6HIl34uArZThXkcAyYqCG4oa3kh7LETolYt0sF72pV
 PfNzjHqpDtpcRY2kKjfA2+ixFQI28NrIItziw6WbMnNjJrydI9qwJyENYFHCDPYN6d0NkopyJgz
 Uq1oHgw8kIqZzj9lluSZbGv6JaTh9SXnc+/sLVV7Y10Lw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421004;
 b=Vnguwe7vflsGsHWH9AeH6rXA9VJyTv7eK22NEPflIu+xAfyCkI5138/+SG/pA26WpIrvy8r/
 RbeSx0V7KqVpfT3QXt53ea8r5L/7c7Q/rOvie8wPgJnPRIfAjlD+QcCYt7arZDHYi7lJ3GZOlqD
 STmnr9mgvufRSbD4TYdGSBCpZdbglWxZrdcqGPO6BZWwVrG5pfGMr5n46TdshS+J8ZGr/THZURI
 G97yLgi27BqjBAmM3cYsWCCqoUO67P+A5GPFLBObUplrrOv9aI9pE5V0itSSaHiNcgSiy3VzC1K
 7T3aeaU0FMMaJTh9XdUS7zqDTJ0YSFGS7eAA8xUi3vCVw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay13-hz2.antispameurope.com;
 Wed, 18 Feb 2026 14:23:23 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 89519CC0CC2;
	Wed, 18 Feb 2026 14:23:12 +0100 (CET)
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
Subject: [PATCH 2/4] ARM: dts: imx6qdl: add boot phase properties
Date: Wed, 18 Feb 2026 14:22:23 +0100
Message-ID: <20260218132228.32056-3-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
References: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay13-hz2.antispameurope.com with 4fGHJK21JZz3skYp
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:6bfe6034a05854dbc69e031af52159fd
X-cloud-security:scantime:1.909
DKIM-Signature: a=rsa-sha256;
 bh=3X41+/DDb79VlrAXhpveO5mOonDaOzhaJoIuv+461r4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421003; v=1;
 b=osC03EMPthfXa0hnHmhGmPjbE1HQjiEHhD7rsRGLE0sCIIKU0T3eN9oywPZ2+GoZTW5pUZbI
 Ov5d+X3m8QGXLTbDNcqKSO05c2vFsahBwwzKrdr95V4hZfkAWj6Cqvll44VTr3gyG67vm/7/H9X
 onqpXFw4H2Cu1i2for4oL78tSEN7MO+mnVVxLPEIifbIIj1+LSsCEFW6Q1D4iF0ib5T6u40eCYA
 /MYTpCT5T9oQR/pqnTV4SqaF4/DJY/qyJ9GzV+yTvcfFuSbx/GF/bfke2V2TklXCvVnOTa7L2er
 k4eX/w63YphkzPcFoGR/xA1gIEN/KYsqasyMBL3vepZ/Q==

Add boot phase properties from U-Boot device tree.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
index 76e6043e1f91..1fcfe0751327 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
@@ -149,6 +149,7 @@ soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gpc>;
 		ranges;
+		bootph-all;
 
 		dma_apbh: dma-controller@110000 {
 			compatible = "fsl,imx6q-dma-apbh", "fsl,imx28-dma-apbh";
@@ -297,6 +298,7 @@ aips1: bus@2000000 { /* AIPS1 */
 			#size-cells = <1>;
 			reg = <0x02000000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			spba-bus@2000000 {
 				compatible = "fsl,spba-bus", "simple-bus";
@@ -304,6 +306,7 @@ spba-bus@2000000 {
 				#size-cells = <1>;
 				reg = <0x02000000 0x40000>;
 				ranges;
+				bootph-pre-ram;
 
 				spdif: spdif@2004000 {
 					compatible = "fsl,imx35-spdif";
@@ -920,6 +923,7 @@ mux: mux-controller {
 			iomuxc: pinctrl@20e0000 {
 				compatible = "fsl,imx6dl-iomuxc", "fsl,imx6q-iomuxc";
 				reg = <0x20e0000 0x4000>;
+				bootph-pre-ram;
 			};
 
 			dcic1: dcic@20e4000 {
@@ -950,6 +954,7 @@ aips2: bus@2100000 { /* AIPS2 */
 			#size-cells = <1>;
 			reg = <0x02100000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			crypto: crypto@2100000 {
 				compatible = "fsl,sec-v4.0";
@@ -1320,6 +1325,7 @@ ipu1: ipu@2400000 {
 				 <&clks IMX6QDL_CLK_IPU1_DI1>;
 			clock-names = "bus", "di0", "di1";
 			resets = <&src 2>;
+			bootph-all;
 
 			ipu1_csi0: port@0 {
 				reg = <0>;
-- 
2.43.0

