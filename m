Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D44A211487
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737542635; cv=none; b=SaCLo+XtfMQdBCmAtVkTmz+heyFXYsrBjE1/CHL4UFAXfmtaOAjl/ROhNKQBMkdkHC5jT+gShFxL55RxkyLeUoEaZvwULz363aZYnVLdpqS87kK8+0OmIOop5xEYTQ1sM3yme6GwiFwpWZhDQkisw7M3m2QVSMyPnAKD3QwaIT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737542635; c=relaxed/simple;
	bh=7IGm911vUOkWZgIy+Be/s5qjNLSpBCaq3uAzUvgev5I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vuj9t4TSrXIrNv8X5mYnW6MDSObo3F+WLSeYeugVzisAlwnX2bGWXY5ZFkuqk/0GNHtHNStBk0FglJkUme2qJ9fOMeW6MJChdK+QNH3HUjOzMNl7JtqnYJOTvGZIukPJYwkusmFmi8aG7rucbWZ56eV2b3m0ya9CtRQhoZJxdac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6MBDLLC; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6MBDLLC"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so1114064a91.0
        for <imx@lists.linux.dev>; Wed, 22 Jan 2025 02:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737542633; x=1738147433; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fkPC1i2sSxMmUrTx0VCnD5+d9HTeCHfJmCCgbIfq+Rc=;
        b=L6MBDLLCk1BwpddrJpvv5VZDr1tBub5RPMzdGLWJMdqoJqgjomjasuqWyj9/U7fXAK
         n2aWJD4Wl8f57wPnnyjtoxH1KNIzXsMh0hiNS/QvQgJSKoAiVvZar87qc65pzvtKIS0u
         3YMFhFopuq6zVGhgAhyCB3fxPOcJK36Vco2uBgcHsR9OwyB0y/vrKSQZdRJnLURu4Tx4
         zD0AqzJOw3+n0AwSxS1AOc86irGXQzkZWAODNPSFT2VHsn0GR+zrsfZksMw7GVdUD6sc
         47okt//tc4Y9UEevckXBLrV7wNZohbb1/NzmgtEX1BfufWndhLvHnM/N1ltvgcBLdDrc
         dUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737542633; x=1738147433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkPC1i2sSxMmUrTx0VCnD5+d9HTeCHfJmCCgbIfq+Rc=;
        b=WeqLqZReDPg5bPTSHrd+blmjDzF6UuMBmvwg14xchBcVfuVIqqClvNymsRTEwyxslY
         nlxG4J5pWMhqqPaqEAcg3cG7bKm66Nzdd/naoBCwsJSRVVL0d7c82X18TBMiQPlJiY0H
         BkfQsh9lU91cehNKBiAb+IAM8s3UkdGVPH6/MzbqL/n/3AwxWyDj9swTV6pkMjkZFf3Z
         ltVwygt84qJaigoGoF8oqjj4ZRmaIQqvczx90jZaW5LNrmiIrLyHBQGMCaWz6ZFd/WkN
         UKSvCsdT0uT/tTXtl4HimS4tBtnctgvBTU6/XLVZnJPJXBhlWdrgwyRCyRa3L1gfybbu
         TKzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXirqq4XCtqIxi+KIZjqIDVY9z4IM4Um2Td5hruddbAY1klHJ/bPbPnCGO7jj01FINUGZ4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHYQvrPJVGbAmJ7L1wTBNBhCFDc7isr69v3/1YRzBJEX+zp+9J
	W3wff1Yge2/4kgpoYLWAWlissSgEW1/JUefsepsB2PvyQ8jUFcVB
X-Gm-Gg: ASbGncsZFkw4JkYsSIJymATFOcFqrwztbDvD7d+J2dTbddKx7p8wgZ4O0t4bK2r2Ffw
	Vx6W7NBijwzoW9dyjWyTycEsyXeoOnWB8DbTavh82WtOhNCOfhJPpWCSdypZexiVae/PXbnClTP
	BdcZ3Rjor+LAaN3DiPrA0yXuczKE97QjtkXv506UJonfLPmbgeJ+8Poe+K8dpZ/p5JbvF1j5fyO
	BAkiAaYwgwdVqZpW/sqwltdpmFURQwMvgAi3NQmBc6kQbdPL9KYm+h5l4EVKeskzwAkZtRPQQ==
X-Google-Smtp-Source: AGHT+IEfVKkJ4GS364V1u71OAFpPt8DZDMt957lkAWfFJGA9SgKVgggY0puJYiM0NEkyy1x3KCPNNA==
X-Received: by 2002:a17:90b:50c3:b0:2ee:5c9b:35c0 with SMTP id 98e67ed59e1d1-2f782c455f8mr28375950a91.9.1737542633388;
        Wed, 22 Jan 2025 02:43:53 -0800 (PST)
Received: from HOME-PC ([223.185.135.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6a78d0bsm1396369a91.15.2025.01.22.02.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:43:53 -0800 (PST)
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
Subject: [PATCH net] net: fec: remove unnecessary DMA mapping of TSO header
Date: Wed, 22 Jan 2025 16:13:07 +0530
Message-Id: <20250122104307.138659-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TSO header buffer is pre-allocated DMA memory, so there's no need to
map it again with dma_map_single() in fec_enet_txq_put_hdr_tso(). Remove
this redundant mapping operation.

Fixes: 79f339125ea3 ("net: fec: Add software TSO support")
Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 68725506a095..039de4c5044e 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -805,15 +805,6 @@ fec_enet_txq_put_hdr_tso(struct fec_enet_priv_tx_q *txq,
 
 		if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
 			swap_buffer(bufaddr, hdr_len);
-
-		dmabuf = dma_map_single(&fep->pdev->dev, bufaddr,
-					hdr_len, DMA_TO_DEVICE);
-		if (dma_mapping_error(&fep->pdev->dev, dmabuf)) {
-			dev_kfree_skb_any(skb);
-			if (net_ratelimit())
-				netdev_err(ndev, "Tx DMA memory map failed\n");
-			return NETDEV_TX_OK;
-		}
 	}
 
 	bdp->cbd_bufaddr = cpu_to_fec32(dmabuf);
-- 
2.34.1

