Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8562FD1CA
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772110975; cv=pass; b=KnDFmF8fhzgDZCfBpdkJyNQl4zjoasyAord4UOfW53mtQ7KGyhbhsSmkne3HbyXDLFx8f2QQ0frbBB7h4T5gFdpsTt0BVhEQ0uOpKDh93QZja9XZhrDrY+kZXzVcyCGVF9pPu3PVCIZ/9prkeCk3xIpr/2ETJxwMCAJUxHoRmW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772110975; c=relaxed/simple;
	bh=neGoqTdsxF3OhXcAManDw77ql/4CB9cgSHMgCNf8xyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBrYNEn/ESmXxbAH9QanpIZ82efguFBJQtuPrkIOS27ChvEjOXX5eSg4UQIuDU0qeRi0MZFDdaZueGZjZV4nY8WVuTQR53prUrChiFMnE7zmWwAoy881rTBHqx6mpOOkZCe2rLQAYMNmYSQBh/MwYVGnDykpp8BjZ0/PJ+VSViM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=IddOjANS; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="IddOjANS"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=LUO1CiLCZdzw6+XANnBhTKj15uDGYHmVnxysnV9OeO4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772110955;
 b=CbM/uJIcMpG3Sdw6ZoYSFg2OemtGVpanO8k7Du355+I5wO9jXt7jJZWl9yj03eFrLLAipgxh
 ueL1CsYpIa6VhVop7lWKPlYRTYJnCHKBcjt1+YR1S3niS5zCeC8BF00I419be6NXnwsc+27ve+5
 n73OLWIcok5f81YjwAVwkHJjiE2uyHWTi+tFCsfWH0tayled2Ic7YiNCPrxBKhQkBeBP/M6XCEu
 vj0kI8Zmq1jhgPbjHTLr07KDmq1g2q1LeFC6XUAukzb6KWi3JuKNDuEblsojq2npsGR85zWzEJJ
 2q+Z+SwPuIpn6yegmKxyYqr2iEW1RFQ4c5FNKyCuQEDrg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772110955;
 b=sCaV9cSzHXPrO9pWW9XEBFLMW2rl4naiqq/tbMTqXPO3Kf7+5j0HFvL0BYzqGzui2/PQtlCH
 9Kn6wVwcnaHn5LyUmQmpGIVtNtXyxejBTCRc0T2FsVS40snt5Tobd/3kFe2GO641yqZ3b6SJAVf
 xRZnSLv0wWi//R4fNkpHeGacSJTjviQCbsXuyZyuIr2d8fep4yBxzHlii9sm20OyjeK/oQnLMMX
 0QU5OHD8GOedLmEYSjjVj/0rYOA2TIWZ8GchrSRXMsxRvI1+wodK5PoVpy+IB6FjjfKVNhG0JOc
 tuEY1T/t8XAgOGOSKH8mjlJci06vRXASJN/C6HxS3Fbsg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 26 Feb 2026 14:02:35 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id EAAA1A41357;
	Thu, 26 Feb 2026 14:02:25 +0100 (CET)
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
Subject: [PATCH v3 2/2] arm64: dts: tqma8mpql-mba8mp-ras314: Configure multiple queues on eqos
Date: Thu, 26 Feb 2026 14:02:21 +0100
Message-ID: <20260226130223.613325-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226130223.613325-1-alexander.stein@ew.tq-group.com>
References: <20260226130223.613325-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4fMBSf4s71z2nHTC
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ac72cfc2a7cd79e53cd99911ee7956b3
X-cloud-security:scantime:1.506
DKIM-Signature: a=rsa-sha256;
 bh=LUO1CiLCZdzw6+XANnBhTKj15uDGYHmVnxysnV9OeO4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772110954; v=1;
 b=IddOjANSLI0GMN27hZAA1ibBsvHminDRaHl2jmsXvUCyXK1mVWriVympecRQqgl2oiikHzEb
 FWHin/9NikvckhHp7UBqbKI1IobKhx5VVZ4+yBO8AICH9KV2jSRHGY89FkpojuCOLnPuFT6fV3I
 Pn7omuL7Rkz0iJg+oWjPuu4VK3Z7eP7sQqpdy2bi94IO+BoL2yZg2K4uaIvHaMBAoZHKFAvIUKQ
 tL2oTe1FNX0x30PQVMyHfqq99rE0PP94Yztd7YWullSMz6GDanvzWouR7iiiz4fq/g6Gqf0nvVQ
 NxXKa4AzxxUH5czbjJYnNRkDspexq7Edjm+XSqVGUD3tg==

The MBa8MP-RAS314 mainboard has an integrated PHY connected to the EQOS
ethernet controller which can support up to five queues. Configure
these queues in the same manor as done on the imx8mp-evk.

Setting DMA to threas mode is necessary to prevent FIFO overflows, see
commit 0bc3e333a0c82 ("arm64: dts: imx8mp-evk: configure multiple queues
on eqos")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
* Add empty line between paraphs
* Collect Frank's R-b

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

