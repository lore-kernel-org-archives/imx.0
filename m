Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA70413D244
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 04:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737347192; cv=none; b=NKIjhd17zLxxS4j6qYXEHH3iMX2Ubpb34sJbGKNTHlxYHe9+CkfOSJIAdKvhW3z+Bzci0sLcGHIpPJbnS6b2zouicIszp1IXZ1vcvY0zNKZ27F2wUeDNOLuxrMIYnHjYMrC6teadDS4Pk2n47pkTFCIiloLapQKgYory4XIra84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737347192; c=relaxed/simple;
	bh=YUV/kZlqp7x5oBoGxQBRhNwBZgCb/VkEHX5Q4FFN+Uc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UD3gSCVUX9niW2brD8c9BcwEOwtN6vtKQE8HkprIlQ1uUHXtMaVPata4C48ceV/4YdtHLyDyLwkQ2dw+uMkE/IKfQKJT2vbUjAD43i0n2YA5OcrkWKWcWWplvTbWGzdvsnj58y0D9joqYtV9z1y1aZmnSntShW1KTeVqnHIRE5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaDbhQYQ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaDbhQYQ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216401de828so68264905ad.3
        for <imx@lists.linux.dev>; Sun, 19 Jan 2025 20:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737347190; x=1737951990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b5FC5Qqw1jL3v7FrQx+Z2e4fqL2PltW+m+8hWqQHPpg=;
        b=HaDbhQYQv9ByBbWTaRbLf2js/abPSjXQr8g9WqShXgBOWwzUEycvBdjRrI+UGqkH19
         hUJShsxiPvyLRDyaDdl3kb7LdftsXAYXvu0bX2chP0e5fpIL5ZqmZh6KiL0PVfH4Y4H9
         Q1LgEZ/9rGtUoRQXVGwBsMdqXJyU0XUmlZurFcyHjjW5zOBcYKeVW8/hGIyzUKmzclIX
         IcvpkjbGq0MPtsnjHpw4+rwtKVa4g0jk0xPbOehkdjvcv0o5pEuQSj+j4bVwKx3t6oWE
         Ka8cQ6bxGHpcFV7H4YnBw+BJaKIn/Ymw9MhG5k90dJzWPi1Jnx1DuRLFa7TLpCKkDZtT
         7hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737347190; x=1737951990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5FC5Qqw1jL3v7FrQx+Z2e4fqL2PltW+m+8hWqQHPpg=;
        b=bokdttovflozkPEQcxgoCeso4xLauZEG1z1rBkcGgQSIIeoOs91QleGSjZQNqSI9zp
         BDLBlTdnuLURR+6uAw+kifYDXvTJcX4uKATsCV60+zIHS/TnDTf5Qvtsg8dmtJobkuoW
         O+J/hcjLuigDoPs9lah/rR3av024EfCCevmKzAwSS3lXG38h8uZCpF3DAuauhVB9fQYV
         LKDIGHKmwRppldU2Bd9VS9PwxS4Eoy7CU8tbyJF7t0NEoR5ksA5xxdYZKCvpAlJvf1i4
         wJGZiWX6k706h1T4628GTgPkfMLTg1xoSYO4VYQd6VpFC/kKdoOYTHC1kHoCPOV8IA0X
         l02Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYGlajO+zI2btG2OcOJYTFKLsgNy7Au3LxDBRKqL5wnbWpdVZqTDg+HS7gTOrlJXX5ijo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7VKSaPqBK2hnMpTTDSMc5+qY8OJGiqlG+iqCZt6Wkb202esVB
	OFoIruTcVbZca9rxaKVNX3V7C8MsntolZrsUqXxNamSgzxkF1APA
X-Gm-Gg: ASbGncs1B1KANolR5WYkgk9fWpgbt++kiRkOte1WzgLplyRyiBTQt5T1sHZQDPrmG3V
	N7yt0HZ713wqU/mhYN3PZty2YZ86iNHUIbq9I6nAZospjnrweGh8OJP9qUn32RaFeKO+4ubuW9k
	4015T16HLlmYIOmFwIphk3dsepY7BAkj1H5LTYp+OgVQ23N7LzVW7n5O3dF7QdjMBkZbvvtuJUK
	/DVbEAYy37DYAzm8zIOLwzG71qHdx+oAGJ3zpRez4U+yU+23U7mcKuL4aQHmQX0EC/hHF90cQ==
X-Google-Smtp-Source: AGHT+IFreBXW8qMfUZdbH38vaaqKKX3QrsSBIPF8z1VO+RAxIh9FlcywQ5RZy5gYFYZfHzAMqolr0A==
X-Received: by 2002:a05:6a20:3d86:b0:1e0:9cc2:84b1 with SMTP id adf61e73a8af0-1eb2158d07amr20098664637.30.1737347190100;
        Sun, 19 Jan 2025 20:26:30 -0800 (PST)
Received: from HOME-PC ([223.185.135.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabaa751asm5971652b3a.162.2025.01.19.20.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 20:26:29 -0800 (PST)
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
Subject: [PATCH v3 net] net: fec: implement TSO descriptor cleanup
Date: Mon, 20 Jan 2025 09:56:24 +0530
Message-Id: <20250120042624.76140-1-dheeraj.linuxdev@gmail.com>
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

Fixes: 79f339125ea3 ("net: fec: Add software TSO support")
Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
Changelog:
v3
	- Update DMA unmapping logic to skip all TSO headers
	- Use proper endianness conversion for DMA unmapping
v2
        - Add DMA unmapping for data descriptors
        - Handle extended descriptor (bufdesc_ex) cleanup
        - Move variable declarations to function scope

 drivers/net/ethernet/freescale/fec_main.c | 30 ++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 68725506a095..9ac407d30e85 100644
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
@@ -913,7 +915,33 @@ static int fec_enet_txq_submit_tso(struct fec_enet_priv_tx_q *txq,
 	return 0;
 
 err_release:
-	/* TODO: Release all used data descriptors for TSO */
+	/* Release all used data descriptors for TSO */
+	tmp_bdp = txq->bd.cur;
+
+	while (tmp_bdp != bdp) {
+		/* Unmap data buffers */
+		if (tmp_bdp->cbd_bufaddr &&
+		    !IS_TSO_HEADER(txq, fec32_to_cpu(tmp_bdp->cbd_bufaddr)))
+			dma_unmap_single(&fep->pdev->dev,
+					 fec32_to_cpu(tmp_bdp->cbd_bufaddr),
+					 fec16_to_cpu(tmp_bdp->cbd_datlen),
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

