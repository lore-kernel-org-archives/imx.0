Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDDF194A6C
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737205200; cv=none; b=ftZ4IDJj7f5blwnZhdmx7ydEkr8oU5oUeu86z4txkqLZ3nT94Fcq5BrH6Ab458zyAZ5r2KnHr+a+KWBtynj8uiHy3tVqjQY1BP2/cFVO8q+lTaYwcTMT7ml8McjRGHBOcXsMO2YdyosMX+5xHg26mOZ/1l8hBrd59KPp1wqLM7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737205200; c=relaxed/simple;
	bh=7Ds/AB65ztB9QuAavFN79YiSgvPDbfRibJI5Zw5XaJU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oW2a9SPveFfcCwOxMbciQaDZfFTyUgLtcbgpXvTVsfqnk9krLQvUuzTlRKwBxhQptI4ZXTnpKn6sC0QRqf1AKSyt95b2HcE5O/AnmP8JsN5U54OFrDxWKN1pDehQBNLmTlb+fmoQm+HA0NOfJvxU2q86DEMhr/YC9DEReBxyBNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4EHv2lh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4EHv2lh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2163dc5155fso56909105ad.0
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737205198; x=1737809998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wkHM0UCI1WBkqufXXmJcj9rLCEup3Pv0OZjQv5gTB/0=;
        b=k4EHv2lhHKXUZB5Y4Yho/7OHffnsSK3yU7fanVbf6bYeGZFeDSTCF7Xlw5LjuyrG7E
         jrsJOxe4TmgJCGTp95KGQmSJkFQRWNuKcTb5D56c6CUxTyN9pmzgTHPW1d4mAQ+hJpW1
         gj2wxjsND5026aeVfhGb7zzVXIFvvR3UMsoW7U8dAy4a7NBljtjDgIz3Izm/rD2FQVN7
         6M411YjY1rmK51PFRUosf1AZq76PZJsVyp5F0aggCYSHdKpeVL4S6cxnQMyiqvO/kfpb
         Msikth/O9Rq8LOlCRiDSp3TK4FAeg6avcMCoCzqANuN673Ybcey6wT4WnQuJM5RdgiNo
         HohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737205198; x=1737809998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkHM0UCI1WBkqufXXmJcj9rLCEup3Pv0OZjQv5gTB/0=;
        b=v1HeR1tcjzumnk2Uzb7DXLJz9qdkVk7mdcmEF3VxJkPfZ4RtDkvHFhftcKgbt08m71
         9c0MRGwuvRoIahIsAo1+NzeEDIRtTyiIQ/GnzXZPxpkcuWDzicdbs546m/JSsgQcU4eb
         fFcuiZtvCHn6/+/lqfxde6s1IEY4jwkjHbAp1NB/jh7LdNNXFN7NxZIBDoCCQHu6yhF3
         38+STd9s0LuQR7n7Zb8XOCN1tDwERnCXzoYtYeAnpzNUqoNSj7cTGELCiAFbyNd2rILn
         qn2Mv3u+NnCGZtyU40MrHFFKkAROttbDQiiFpa41caBdUKQWKbFjtyAglHy32j01yV5f
         /l7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSh2w5U8AGERxcXfRcvkyL3QszC+x5lbnuwBi7K0KCYmqlCr1iZ9zYSwjha8CPBJYzZ1Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKjBNOE9NhLk8qZrBp6C0xt+Kvq0kobJA1lzBs22PwtGII2Rhl
	ZSsWHOeUwWMqHxQSrdU0pwFu6O5SF6i4FxJatHpbe23dRoLYHHbS
X-Gm-Gg: ASbGnctDks0XlzMleiFeBN8qxXr21i5CtejyKf9F1+ctJfm/arcmzKiuhmSMXEgPzFj
	dJedcLg2u0CxYBGzqhZtjs2B5voivlKAPUYw8lwtUwIkCYKO153h7cwumihD9qTCa9DSKZXNMdK
	3yGWChOst05/92+32jvOdaFurOxhwNUFydj2jwDLz9IZWvG6mLoFs6wHIjssc7qHbskHiZVJMFF
	a8HgkbAyCba3SNoVbUA+PZ2q8SrWJQHvY94LdruR3UCWaLG+YKtZhGY4w44HQfUTO0HrwFHyA==
X-Google-Smtp-Source: AGHT+IFIGARkaMBlFuzV4VNvag2krQYyWbVBGYYyK7DMvxVgbCKL1dMuvkos15ubTl8+3FBFOuVLbg==
X-Received: by 2002:a17:903:320e:b0:217:9172:2ce1 with SMTP id d9443c01a7336-21c35544407mr96895095ad.22.1737205197864;
        Sat, 18 Jan 2025 04:59:57 -0800 (PST)
Received: from HOME-PC ([223.185.135.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d43252bsm31067135ad.258.2025.01.18.04.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:59:57 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: wei.fang@nxp.com,
	shenwei.wang@nxp.com,
	xiaoning.wang@nxp.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH v2 net-next] net: fec: implement TSO descriptor cleanup
Date: Sat, 18 Jan 2025 18:29:52 +0530
Message-Id: <20250118125952.57616-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement cleanup of descriptors in the TSO error path of
fec_enet_txq_submit_tso(). The cleanup

- Unmaps DMA buffers for data descriptors skipping TSO header
- Clears all buffer descriptors
- Handles extended descriptors by clearing cbd_esc when enabled

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
Changelog:

v2
	- Add DMA unmapping for data descriptors
	- Handle extended descriptor (bufdesc_ex) cleanup
	- Move variable declarations to function scope

 drivers/net/ethernet/freescale/fec_main.c | 29 ++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 68725506a095..acd381710f87 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -840,6 +840,8 @@ static int fec_enet_txq_submit_tso(struct fec_enet_priv_tx_q *txq,
 	struct fec_enet_private *fep = netdev_priv(ndev);
 	int hdr_len, total_len, data_left;
 	struct bufdesc *bdp = txq->bd.cur;
+	struct bufdesc *tmp_bdp;
+	struct bufdesc_ex *ebdp;
 	struct tso_t tso;
 	unsigned int index = 0;
 	int ret;
@@ -913,7 +915,32 @@ static int fec_enet_txq_submit_tso(struct fec_enet_priv_tx_q *txq,
 	return 0;
 
 err_release:
-	/* TODO: Release all used data descriptors for TSO */
+	/* Release all used data descriptors for TSO */
+	tmp_bdp = txq->bd.cur;
+
+	while (tmp_bdp != bdp) {
+		/* Unmap data buffers */
+		if (tmp_bdp->cbd_bufaddr && tmp_bdp != txq->bd.cur)
+			dma_unmap_single(&fep->pdev->dev,
+					 tmp_bdp->cbd_bufaddr,
+					 tmp_bdp->cbd_datlen,
+					 DMA_TO_DEVICE);
+
+		/* Clear standard buffer descriptor fields */
+		tmp_bdp->cbd_sc = 0;
+		tmp_bdp->cbd_datlen = 0;
+		tmp_bdp->cbd_bufaddr = 0;
+
+		/* Handle extended descriptor if enabled */
+		if (fep->bufdesc_ex) {
+			ebdp = (struct bufdesc_ex *)tmp_bdp;
+			ebdp->cbd_esc = 0;
+		}
+
+		tmp_bdp = fec_enet_get_nextdesc(tmp_bdp, &txq->bd);
+	}
+
+	dev_kfree_skb_any(skb);
 	return ret;
 }
 
-- 
2.34.1

