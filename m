Received: from mx-relay37-hz1.antispameurope.com (mx-relay37-hz1.antispameurope.com [94.100.133.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57383126B9
	for <imx@lists.linux.dev>; Mon, 22 Dec 2025 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.213
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391547; cv=pass; b=JyVzP3f5rtUdugdHGXVvlp45gHEPiKfbzGZx0+BCpJ3x6JVafhnhWCkHJt64d9aBiM5SAvR/AuKZRcD0sU+6d/302oEgL4ZW2HlY7zkW6nAlZgBpYToHOrrdGUXUsXOsgdpEskQ1feKWSzYytsowxFp9/v0kasJpDfnAP6pHDoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391547; c=relaxed/simple;
	bh=VZ3Rp6U+xMdsGwsMUPytKZdQfwzTwhM8ZpFGjBnSL0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AmshedrFeAnOPg9x0ohQ2nKaGb5aJwn0GzB0OGil1DK58ynzjDKE0LRK8KqAKNxN078ICDFSN44UkLxQQcPaec58kS9tSrQTidt9/aAcpOGl1AlL6uNnuUP1+1ySDiloLXeUaD7CG991yQmZMHs9omf/jqh5wAiVJudMnHqj/oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=aeMEUvK1; arc=pass smtp.client-ip=94.100.133.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="aeMEUvK1"
ARC-Authentication-Results: i=1; mx-gate37-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=kABrYCRuxfjnmNnzzhb9u7inWlE7qpx9z7CqlAxlLjA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766391506;
 b=Hqqt+a/o9iWykil4vQPssp7XfzjOOO+3saXkxd5dY1zM9R1sjwZCoQcOf66aZ3YEo9iMjLe2
 b3V+g7z1yd3noP4DwWq8nu45Zl4UKiDOOeWyLSN/MYsj9BBgVACvxpGLLGnK0P4+R9CUVLNwhTJ
 SPNAZaT9Yh3DlJDnc235HdC7C7wg6ns/eH/uaco2gSwjDcfY+ro1/J0CsV7kP0YeFIZQnFNDINU
 Y/RmzRawZ1TkNz58OWyapYjYJw9OK/fhRE2tkba18/8hI8qmZgfEcHrgDlIV709oFxLolYedxcK
 wmee6teRJcbdL+HvdZb/WxM/XDZAWoEFfHYbkPmoDEEhQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766391506;
 b=QI6pMq2OGe4uW2fqumthJ7ESBlZXJidMobKBUh4R9jeV0z+KoX7cbdFKDFcIG/eej0M+N8cD
 8LVCEBslUSo24P7nuMuvSB5MgSa014EA52IZU8wPn9vmqIBX4CbVWG5zSRfUXwNDjbFw3QuUVh4
 c4iq/A4QiWyoXOxZPFnzmoGZRUV5gaf5FgxbdsNifhVG2aLpMtqG/rEEcmqIgYqs7ERBMzGIAe0
 Q+rS1pmfeclQ6vFA+Tvuq9BVkX/6g2YVRryBG3nH7MlEDHS+nz8kCTOW5cC31lD8l5dRJHu+Np2
 S+noPDkzhYw5aAlgfblv6fw1V5d1dAu0H4S9fndxcfgFQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay37-hz1.antispameurope.com;
 Mon, 22 Dec 2025 09:18:26 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C8BC2220C57;
	Mon, 22 Dec 2025 09:18:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: tqma8mpql-mba8mpxl: Configure multiple queues on eqos
Date: Mon, 22 Dec 2025 09:18:08 +0100
Message-ID: <20251222081812.1120998-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay37-hz1.antispameurope.com with 4dZWHF30qtz2YfPq
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:3b6200eff25a10e53cebf53f6f11a937
X-cloud-security:scantime:1.715
DKIM-Signature: a=rsa-sha256;
 bh=kABrYCRuxfjnmNnzzhb9u7inWlE7qpx9z7CqlAxlLjA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766391505; v=1;
 b=aeMEUvK1cd5A4Xn68Eg/OX3CGJeQCruPWQTNuJWyk8TSa7vlWv/9ELGEsTSaKhMO5RXHbItu
 3foTAbCekdNJUatEd3de98QshLUORnBxJhpXYTzRTLZmx9r3LNrjKhYdQ0g/gd7W4Zkq93gjG6t
 cgU1vxXFq5MhfOJwqKfoKiAt1Qhl7dZsIHyDk2MXOmxvrS1okxGg3Xv6TA7HCIOcXcbcwW9+ARg
 RfkuKxchAVEVcjUOqujkcvWx0NOH1H0NtpwUu84hR3L4gTpkREk7PIOtp+S+ev3S2LHWoLhvVG+
 Ra126xAL4PqYt2BMQMuFRiJc2VTpXSXI9QvEW4XEOTMEA==

The MBa8MPxL mainboard has an integrated PHY connected to the EQOS
ethernet controller which can support up to five queues. Configure
these queues in the same manor as done on the imx8mp-evk.
Setting DMA to threas mode is necessary to prevent FIFO overflows, see
commit 0bc3e333a0c82 ("arm64: dts: imx8mp-evk: configure multiple queues
on eqos")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 68cecb0987b6b..eb25828f3b26d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -360,6 +360,9 @@ &eqos {
 	pinctrl-0 = <&pinctrl_eqos>, <&pinctrl_eqos_phy>;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy3>;
+	snps,force_thresh_dma_mode;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,mtl-rx-config = <&mtl_rx_setup>;
 	status = "okay";
 
 	mdio {
@@ -404,6 +407,70 @@ led@2 {
 			};
 		};
 	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <5>;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+		};
+
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x4>;
+		};
+
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x8>;
+		};
+
+		queue4 {
+			snps,dcb-algorithm;
+			snps,priority = <0xf0>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <5>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+			snps,map-to-dma-channel = <0>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+			snps,map-to-dma-channel = <1>;
+		};
+
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x4>;
+			snps,map-to-dma-channel = <2>;
+		};
+
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x8>;
+			snps,map-to-dma-channel = <3>;
+		};
+
+		queue4 {
+			snps,dcb-algorithm;
+			snps,priority = <0xf0>;
+			snps,map-to-dma-channel = <4>;
+		};
+	};
 };
 
 &fec {
-- 
2.43.0

