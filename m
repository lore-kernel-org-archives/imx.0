Received: from mx-relay164-hz1.antispameurope.com (mx-relay164-hz1.antispameurope.com [94.100.133.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3452276028
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647825; cv=pass; b=Guih5NBj14ycjQK7b3FtsqyiK3JfsT+zh33BNI4kKNDtGN8nClT+ALihZ9Xu+riSrdUuSeSFYTWfwS6nDcBRA1uvIfEUSpG0RM5KyN219qhC/6Itv00Xx8ictbLh4peAmiLRF9FMYO/Dp62kiXHpSMRxJg2zoTagBShm5KRYn8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647825; c=relaxed/simple;
	bh=p+F91ljW0bVfglBbCAx0nM0MlEOrZXBD3ZOKdCkZLbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZa5/U4clKcH0VQjkkJPQNQtzCNJDECqDtL1rdVG2kwnalcheuNu94tco2J8BmlHKUZAu+NWpmTcnG5jDMixbx2CqINDlBJBtm3GGh1GSeoZlZH3wz3HNTtSauGnMcayvUGUjUHKpa6lDB1dZxssHNUH1VJg9e/Z5EF14JkQEfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jNjy3Q6D; arc=pass smtp.client-ip=94.100.133.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jNjy3Q6D"
ARC-Authentication-Results: i=1; mx-gate164-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=nNqZ4azVDWNnIZl+k4NcxK2btx7/ux4KOp+IkAVL6dM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770647779;
 b=IkuwVgYrLqb+ZAEU6k6dVGvmzwR149us3v7wifCpeywsown/lqzbudjSWB7Nb9HGSqByVbt4
 O4ETlqYlv6r3fr2AH8vagT1fXVKcIXq2gYoFDWByYPYI7svAnSgtkAll4afcGOrti7xZxX+keBh
 Pvl4iDO6jGmd479gTujEDvzq6dHTWxzm4kBtk0+EG1KZWHwJAUYW15doblYBcOorSvkcpuRZGpi
 OpA1bmUmyw2DWIuItQSuB31lAfSvEq4Y4n8KSRd5PFcJLPgXSd9ZE6ONM67tD6qWGypdIsMWdXg
 Dy+lFBUEaw3eoaf6YLaowz24XHnMGz0ljhf48kMB5kwdw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770647779;
 b=TdrYerO/4JOgshHWNDTO9JEnAnXCIsEjxYTx0NWVyCtk9QG28wxuScaMuznZArzgW7HEcSS/
 XBQzSlOFdUPxMLTBfPqUIE6yOIq+PqPOX7WW2CXnjlLk2JOsL8LgOD3sX6Z/2IFe7RucbGheIw3
 F3b0Ct6kW1O8AenpXygfYRlJ9STbdjlqaQuXBjt2/PwQqhdGF2b5DKpaPZDFF4PA8VnpWavIiQD
 NlKSmiM8TwR0pRUZj95+BrAKlpjlPlVHOXjAXNyIlW+p2LcgbVuHiwq4+WfKnfRMV6YkP57TwIl
 GSsZCknqU2NOPxV6M0sT4FKwUAh3AxI2U6DxYw9NGsC/Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay164-hz1.antispameurope.com;
 Mon, 09 Feb 2026 15:36:19 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 41716220DA4;
	Mon,  9 Feb 2026 15:36:06 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: tqma8mpql-mba8mp-ras314: Configure multiple queues on eqos
Date: Mon,  9 Feb 2026 15:35:53 +0100
Message-ID: <20260209143555.202042-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209143555.202042-1-alexander.stein@ew.tq-group.com>
References: <20260209143555.202042-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay164-hz1.antispameurope.com with 4f8nLZ6kgdz3xc54
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:489f5f296e1f10bc703973de13f918e5
X-cloud-security:scantime:2.157
DKIM-Signature: a=rsa-sha256;
 bh=nNqZ4azVDWNnIZl+k4NcxK2btx7/ux4KOp+IkAVL6dM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770647778; v=1;
 b=jNjy3Q6Dp+E7ZsVU2+7CacOfIjdXOAIBmFCA1GL6NGB0LWbP+44FOdFl90ZXUMyDz8pSF8+Y
 cle+2Al3CWpNHco544xFQSc1eJ8qql64AavJ8QQtXAq7UUHFotG8o9nUEZiqbkJ0ie0QE0CdlkC
 LSd04lFrEoKSUSpUx0p7LnRw0JrqHBuhOLF8a78lrQ2wzVqwwM4XZstUTElropGwuPM2H3vNoQx
 yiRDRh9dW6Yvf/cWxQtYRaPIwe0ynUgjEbeU5mNu7yR7iC94Z/pk/pTJ/K84tuW5fkyHIy18BwG
 O6Yg9akd0oGtXoUDZWSOWK0f4de0n5JXBwClFG66zferQ==

The MBa8MP-RAS314 mainboard has an integrated PHY connected to the EQOS
ethernet controller which can support up to five queues. Configure
these queues in the same manor as done on the imx8mp-evk.
Setting DMA to threas mode is necessary to prevent FIFO overflows, see
commit 0bc3e333a0c82 ("arm64: dts: imx8mp-evk: configure multiple queues
on eqos")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2: None

 .../imx8mp-tqma8mpql-mba8mp-ras314.dts        | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index b7f69c92b7748..04f4c2fdf2992 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -184,6 +184,9 @@ &eqos {
 	pinctrl-0 = <&pinctrl_eqos>;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy3>;
+	snps,force_thresh_dma_mode;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,mtl-rx-config = <&mtl_rx_setup>;
 	status = "okay";
 
 	mdio {
@@ -209,6 +212,70 @@ ethphy3: ethernet-phy@3 {
 			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
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

