Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.121.32.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582962;
	b=aODxsaMLmGkwKbg7onVY1gnrNijsIbzcpzUY0XAtIXRiylyAvvdx6wBGtMwJdZAFfSGE
	 T/TiRpc6BQQxtd1f4NS9Jeq7yJZYBkSe3rVq2FrAv/hUG52Eoel6O5EDjEIEqD+9uO9wZ
	 eifVWrHoLbpPUQcIQUhd/APdaZzUHwS7H8xnXWuGDUrBtqVbghj9TJjEiuQyjgZdey0TC
	 8R3JGquLYBPifGCOU1O2hSqB80X74IvS6xyrtNGGGuQbwChogm5dBdpkQYm6nQDdKy31M
	 eKCngIY6Oo3oXM6v5LgnIvFHgtgnFtNjEk8xSM0JQSm2Ik3G0UineWUj8UDbaEIImLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582962;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=DIMfVwohh24rM2fAwdG4bttjLykQKRusOAyT5DYCW9E=;
	b=zEor/IYxqqKHGTGJwd+HuxH7rnVgUAO2Tv88cuVXBDhV3W5wMy+xU3oRvCp+f/skzB4h
	 CJF1JeEr1U26eGwJJv5ktGoNNiBKa+yggG+OCOddQWrRqyEV0R9DOldyXt4FvhntcLcf3
	 APQ6qG8VudwYb4Mcdkh2PCdEOcHAT3r+0B+7NMr2alwiVaSatkLtaDBWp3O7CJqJ5s2B1
	 XECCwyPc3RCkm1iEcFxHikwuSRCo7pZM936bG5gZBXT7lfBcqbjTsszihUoW+mEyubMFm
	 nkSzLErrkJUAkY2OBcuY/Ngo4QHj0QGO+0Dm8RAcHQOQSAT9ibGktM4YtBXaLTrAN2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=nselector2 header.b=Izb7cOhh;
	arc=none smtp.remote-ip=92.121.32.54
Received: from inva129.nxp.com (inva129.nxp.com [92.121.32.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A751C606A89F
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 15:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A751C606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=nselector2 header.b=Izb7cOhh
Received: from localhost (localhost [127.0.0.1])
	by inva129.nxp.com (Postfix) with ESMTP id 935B0607F43B;
	Fri, 13 Nov 2026 16:10:14 +0100 (CET)
X-Virus-Scanned: amavis at nxp.com
Received: from inva129.nxp.com ([127.0.0.1])
 by localhost (inva129.nxp.com [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3W7AC0M58ch2; Fri, 13 Nov 2026 16:10:11 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva129.nxp.com (Postfix) with ESMTP id CE5026012A23;
	Fri, 13 Nov 2026 16:02:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva129.nxp.com CE5026012A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
	s=nselector2; t=1794582161;
	bh=DIMfVwohh24rM2fAwdG4bttjLykQKRusOAyT5DYCW9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Izb7cOhh1mUxxrVou9Ey8iX9ANaP8cuKqpTBOmqK0O594vH9oSavo0UOPaqJA50K+
	 XAamxIBvEOlJaXjO4OxxJdMXyOeNcY5cqL4qdq8XlZdNrsELd6Dux2821BOjj9kLRb
	 Ey17AiAbduKtuVteZ++ftdZFN7rf0jpIbAyeaC+Mvuz0Va11Ec80Az3b+5z957Q4ET
	 TDG9d2DcNJRXmy8VQSJrXSAS5KQw+QLUKn7UL5IigdfwJVouJ2MEW2noQhleuwRzZg
	 kjQBsqIELvmFTXyCOjTestId1cNsLDVHGfvo9Qcyer3LsjUThyEV5r0d+UVxvl/euN
	 iBVEsaoqfb1vw==
Received: from lsv15141.swis.ro-buh01.nxp.com (lsv15141.swis.ro-buh01.nxp.com [10.162.246.138])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id A574C202B6;
	Fri, 13 Nov 2026 16:02:40 +0100 (CET)
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: netdev@vger.kernel.org
Cc: s32@nxp.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 2/6] net: enetc: Allocate int_vector array dynamically
Date: Fri, 13 Nov 2026 17:02:33 +0200
Message-Id: <8026b245b4ef8e5a4af7bb8f38e4329a9ee9caad.1794581338.git.claudiu.manoil@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794581338.git.claudiu.manoil@nxp.com>
References: <cover.1794581338.git.claudiu.manoil@nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of Rx/Tx ring interrupt vectors, priv->bdr_int_num, is set
in enetc_init_si_rings_params() to the lesser of the number of online
CPUs and the number of Rx rings of the station interface. The
int_vector[] array in struct enetc_ndev_priv, however, has a fixed
size of ENETC_MAX_BDR_INT (6), a limit that dates back to the maximum
CPU count of the SoCs integrating ENETC at the time.

That assumption does not hold for S32N79, which has 8 CPUs and gives
the ENETC PF up to 8 Rx rings. There, bdr_int_num can reach 8, and
enetc_alloc_msix() writes priv->int_vector[i] past the end of the
array, corrupting the adjacent fields of the netdev private area.
No SoC currently supported upstream exceeds 6 vectors, so this is not
reachable today; it must be fixed before S32N79 devices can be enabled
by a following patch.

Allocate int_vector[] with devm_kcalloc() in enetc_alloc_msix(), once
bdr_int_num is known. The memory is released together with the PCI
device, so no explicit free is needed on the error or teardown paths.
This is common code, so the PF and VF drivers benefit alike. Drop the
ENETC_MAX_BDR_INT define, which only existed to size this array.

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
v4:
 - New patch. Prevents an out-of-bounds access to priv->int_vector[]
   when bdr_int_num exceeds 6, as is the case on S32N79, as requested
   in review.

 drivers/net/ethernet/freescale/enetc/enetc.c | 8 ++++++++
 drivers/net/ethernet/freescale/enetc/enetc.h | 3 +--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index c6571b5cc842..855b2d3b8718 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -3641,6 +3641,13 @@ int enetc_alloc_msix(struct enetc_ndev_priv *priv)
 	if (n != nvec)
 		return -EPERM;
 
+	priv->int_vector = devm_kcalloc(&pdev->dev, priv->bdr_int_num,
+					sizeof(*priv->int_vector), GFP_KERNEL);
+	if (!priv->int_vector) {
+		err = -ENOMEM;
+		goto fail_int_vector;
+	}
+
 	/* # of tx rings per int vector */
 	v_tx_rings = priv->num_tx_rings / priv->bdr_int_num;
 	v_remainder = priv->num_tx_rings % priv->bdr_int_num;
@@ -3676,6 +3683,7 @@ int enetc_alloc_msix(struct enetc_ndev_priv *priv)
 	while (i--)
 		enetc_int_vector_destroy(priv, i);
 
+fail_int_vector:
 	pci_free_irq_vectors(pdev);
 
 	return err;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index d9e91832a9c1..689ad82b2949 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -407,7 +407,6 @@ struct enetc_cls_rule {
 	int used;
 };
 
-#define ENETC_MAX_BDR_INT	6 /* fixed to max # of available cpus */
 struct psfp_cap {
 	u32 max_streamid;
 	u32 max_psfp_filter;
@@ -456,7 +455,7 @@ struct enetc_ndev_priv {
 	struct enetc_si *si;
 
 	int bdr_int_num; /* number of Rx/Tx ring interrupts */
-	struct enetc_int_vector *int_vector[ENETC_MAX_BDR_INT];
+	struct enetc_int_vector **int_vector;
 	u16 num_rx_rings, num_tx_rings;
 	u16 rx_bd_count, tx_bd_count;
 
-- 
2.34.1

