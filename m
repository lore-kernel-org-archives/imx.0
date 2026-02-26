Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D682EAD15
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 13:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772110984; cv=pass; b=Xt7OSKnz0SMp84K1pK8T3tD+f10ctQAZBspedWCPpHdD5Pd2E+4Ds6IHHirW2lFUCzUSoAstQ1QBb/M39KsKr4WTPDN8QcbGaFf9PkxD2tvOJl5GnqYWctEo9ngxpGIgTGtDMRwIf46EnIUexz5SNWZBmWdvAparE/kr/cP2Px8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772110984; c=relaxed/simple;
	bh=SljvMyVpWZagSTeRRnT8VtO028A6jXhZWcyKuHNmTRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+9F8JT8967yMhX/3L6KLvP+NeTIDIxCEvjUFu7cRscAdJcFiWUesRVrbMXl/YuqUwF4XgSsc2Bsah0j2Vesq1oJKjNv1QCXpiN7uCcRrcCMf7mqSAlYQUEhReiqliKX032bOzuzXXTSi5KtAJqWuM1aB+2EQyG3QScjx4iEzw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=LoH9KX6G; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LoH9KX6G"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=3+0rShqS9k9rFyhHYa5/c8HF+LK7zM3g98pXYzCnqk8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772110954;
 b=XGpUJwhLG1oKqa53KkA9Pi1vLPBsPGQtJCIvb1kdZqXr3An+sa4jRxduz2EqJ/FueoDRB7wJ
 hdHX1aFnomXlJFC3LN3RJNk2fyPslKAomP1qvT4fXLMnu9HY38DjSrrGsiqY5CqnoJwX8GPrvIT
 6GDTbdTvZvSMH5e/ErRBBhaBG1LN2YShLvHhAGyz1gIXPj0D8ZQj7N/UVSMCSACTv1FVXGqG4WW
 XnmO3VyJ+/LSTgHXGM+o7tFInnauw3OE/Vao2KgBOqDMeD+BkvK+VWSfWMVdCT7924HLS6rSYy2
 VDt9lvNN1jrw5O9sgPUk1oDFOdjFN4eueHHxmRROo4E3g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772110954;
 b=KmFePpjw3e/GAGQeS5HtNbA4658kOz8Z0ozCEuwwBaHZHHAmzM4cthYF3FEUA8FMqeNBg+Lq
 Cv9LEcS5kBd2bPLEAJFkXRc97l+MjP0/d3uiIrgI/pMcQug9IEo+hf9pXXMa1TprO77Bs3mWbv7
 AkzEn00KorRN1XuoggkeXqhXgJkiLiXNq8pVpIEZU+YOxevsbUZJRxj9u+e7MZZNe5eaegBaTNS
 orz2zSA9OktGeNdclM2Il8b5dqJ/Sbr7pERegnpK+CPZYzUW74DoeTms0dClLWMx7bdfmj3NbBL
 FHmFZpyagFHJ5kOnvPqw+9a/Mm8QZ2OFs7zk0z0s3JGlQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 26 Feb 2026 14:02:34 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A4A97A4079E;
	Thu, 26 Feb 2026 14:02:24 +0100 (CET)
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
Subject: [PATCH v3 1/2] arm64: dts: tqma8mpql-mba8mpxl: Configure multiple queues on eqos
Date: Thu, 26 Feb 2026 14:02:20 +0100
Message-ID: <20260226130223.613325-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fMBSd33hjz3yb2J
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:fbd8ca17c9567a87f8e16a470c36f457
X-cloud-security:scantime:1.606
DKIM-Signature: a=rsa-sha256;
 bh=3+0rShqS9k9rFyhHYa5/c8HF+LK7zM3g98pXYzCnqk8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772110953; v=1;
 b=LoH9KX6GiPyPb+qur2hxM6jbfAVUgZXJlm0oEHJzw/o3RUm7b88igrCy3saJjKO2Gx+YbPZT
 E/SjQDNZ7wPlysUx6oK7Uf+X7BwNzDR5IU/HVGflnZo9ZCk554lqPsdNZoKhiWOP4kOtialbEbu
 Kx57MGzOQoWfL+GdM1+CbnXGqxSH51vu76hde+bLwfMIk7yPUCODzBTEEIRfgr8HLgiSobbuo7V
 LkPmxMlRYxoDqUv1D8OX3gubI5jIPQj0lLGdLwud/tFoc4HeDeX+lt/P4Eb/KqOlIo6xFnRCG6I
 qlYKZu4M2Kd27FOijxffSHNfyjL7auxUakWScc1aXHTpA==

The MBa8MPxL mainboard has an integrated PHY connected to the EQOS
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

 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index ad49bf85a04d3..890d1e525a489 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -336,6 +336,9 @@ &eqos {
 	pinctrl-0 = <&pinctrl_eqos>, <&pinctrl_eqos_phy>;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy3>;
+	snps,force_thresh_dma_mode;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,mtl-rx-config = <&mtl_rx_setup>;
 	status = "okay";
 
 	mdio {
@@ -359,6 +362,70 @@ ethphy3: ethernet-phy@3 {
 			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
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

