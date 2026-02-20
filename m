Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9B01DDC28
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597866; cv=pass; b=Q2C2WzN5PK3wkIacHGsmQGBpAC9yCp1AFbzW3i7Ld194L3fYaSzTcApTq2heuNY1+gDiSs2GEP3M47mrGxUxKkabXXkXhnzpv32rZ9XdHARopArBCZaIQB4pU8gJ4dmu0wcdCek2CJuzkbHSC2P/HfTf2wpB+mbQpi9rNuzK3Fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597866; c=relaxed/simple;
	bh=8opdbXn1Tvmi/3MjFI+df/Amk0QneWTb0kemtUQg5ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRMw3KRJqNzQDjf60gDk02XX5te+n4PKckXgHhJGtZR22AqjYJhLcGELkHKLIXWRt3LeEpXI2vFgMsXIlOyNY/b9DjbsB1fSk0+M4UWxT1Wu4VcZhr2WiY4XiKf64mkpowyetip7fbnmjQcq9A/CyuxjISYwE9lQj8z+NYXkZ0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=JNkjesVT; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="JNkjesVT"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=DVSOsN1ks7VLJzQhKDw9Gx2RfSThw2ZZvzsniVKDgAc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597841;
 b=Vt5nUEIjNcDCe/VldMxGJGjQvP9ObnSsv77XYlyU5xvsU4BKvvhi8uk0361dqrev7eD2BpA1
 IXJFOuQ2bry2iQK0zbu/giUk5U+BVo2Iguh5NhhlwKOZxyVy5UEqDw/Mbm2avjPjYcf3D/Cdwr/
 91GpnMtH+88sBDQHEeoupLFvwBgJH2mBI9x0eSBKA2BSHa4C9Zi5mVr88aj6eOpgqVnDy0YWmuT
 MRlC+mmXzUIiPHw13TBLBVQ0Bs9e607NTgY84nREW9knYQ0VP9xM1NsNbA34F9qLH5QAAmp7sAi
 qgEc6JoumZ4upOZ0YNC/7mmgyOlSkKHy7N5oURWo3lCbw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597841;
 b=e+ywZEWAFPpLG837aEWuX42hU6VLm/WQ7W1+8sQ9hYLcgcqzWPUPJr4aQJ6HJy0CJVrmHjVF
 5sy/+Dz9ZwuCJUeGUu6ZMHfe8Y2SoD/Eqfss/q8YpJfJRvROLjjCHv5nRK/amoju63ZtCyA+2Ww
 KRcio2jppEclKV2MYY1nt7Ml/Oi5/cXM2sP6k5hZ+BbOAYGkhVU8ZlnDQYrGSVmb8nHRfDne3ib
 ggB6x8EQDOv7zRbDJaJg+jaGBEfNrtUTRo6UWoT00FUi4UGSghY6ihLmsyFDKYIWZXf611AXV7c
 jJO3FdkZp7RG24430FRPkMzNSCMdfPbco7pVBCZW2R9dA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:30:40 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3A846A412E6;
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
Subject: [PATCH v2 2/4] ARM: dts: imx6qdl: add boot phase properties
Date: Fri, 20 Feb 2026 15:30:03 +0100
Message-ID: <20260220143008.186851-3-Max.Merchel@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fHXj16dSwz3ybpL
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:3f64774df25daa84c68bb334c57fd5da
X-cloud-security:scantime:1.961
DKIM-Signature: a=rsa-sha256;
 bh=DVSOsN1ks7VLJzQhKDw9Gx2RfSThw2ZZvzsniVKDgAc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597840; v=1;
 b=JNkjesVTvcZxYoWPAvFB9ghFnFr+ixHwr7MeQBKKGy8w9dRVAYBJ3zlPOkdotY89ImXvHL12
 /8I+yiGDTsLDj2niK0pALlE0P37pqI/hrM089KgLrLrcDfs2ZMzq9jm50QqfQKTlIjZEOtKg6aj
 UT4DpjSg/n6tqwgd3Xc0AJkW5Ur4n1bBWvSo8FywgBMjY2dTnQdzEhT6Nf99M7WTPQSnVSn1CS+
 REOcOkA9NO6I2qvqUseWugTOIHI8qfGZpCB8844JGd/21CR5Zf6e42FZ8TB5uI+FVpVOjlEd4A1
 3j6D0FnpLKckEhdpV7YZtOwUZR7fS/4SjbbvHka++gnzw==

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

All SoCs require buses (aips and spba), clock, iomuxc, ipu and
SOC access during boot process.

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

