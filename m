Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087E0526ABD
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172731; cv=none; b=nW01Cccq9hDH63f/Ebf99piopCfejyCLUK+b8RhzZOIjOy6OIfAtDUWhCZUZPsVYs3alzHSSGoEeN/MilE5bP9141IumgxYMN7gRAXrWQTgDGtfAvP+ulLmsop/3QD8sI/A6btjKeaJTbBtOE5mpTMeNVe7hjam+EX8Lpl5xibc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172731; c=relaxed/simple;
	bh=ktR9e2h8nCd9S0EFkl5DruJEUJcripKPI1tSmR1JOBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bxha/3CEMoCIKaXemsk5DXASu6FDhodnmbVtpCxpHTf5bLTrhyw5wFAgtYWbQ1enDA0P7Ncf75WAjaG7luN7l6S4li0mfXLaWZjQszyAB/ywwflanOXOy3ErdIvbkERBQSmcKDTvwQtdmCYNsz0mHptp62U0jLj8EaaWcrG+0Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzhBuoMx; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzhBuoMx"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a156f4so574069eec.0
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 07:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790172729; x=1790777529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZvYoYp7T3tg2JMG9Cckdchh+Egbf2tNmPcdBTT/ZU4=;
        b=DzhBuoMx7s68m0XEJBimuihQPU4CWzBfdgjoIHWD84OYs61ZtJlR+V27uktKBHHav0
         nrAHeuDjDXWRO6OoyKWp41BagChx/BYZHvcBrckRF6iwTt+T4zSSk3VCEo22XU4Myycl
         kYG6zcpT9WapY1ixym2IF3I1WCp29DYNVqEF/5S1bxzNobiZfQ/pABO9oPJx+QwIsPFo
         E0IMWqm/cLINCaNAAddBKsNYnFQUJHeSjNvZo3MJn282KGUlpq8T+kcoaaBrFDyz1ESM
         ep+Q8F0e4gjExMwJFOxZYSnaJ4my4zDktkrdKwRha2FQZDWpsiyqjp9GZByZ5QKnGtEe
         IOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172729; x=1790777529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZvYoYp7T3tg2JMG9Cckdchh+Egbf2tNmPcdBTT/ZU4=;
        b=MFSMzqBzyDeqZamiNerKJ2R/hqj8/A+d/5AxnJXgVTgLtQcMSx/fUblycs+LIVYrAI
         uTYgXb/RlSCCrR1f37ellciM/47zaURzkCPfPcP/++E73dKaZRqLLMOgGu2mIw2w0yTH
         R0qHiD7CQsdRPdZfnuMuKFxGZ4wiVCXAAB7pIWfKeyBoDORQUoEc3Lp/X2W1mcSXa1sn
         Aqm+nZousk/7zsHED+nYww/NpALJXxDrnuyZIMVQKwSWEnFjNPuwy9yn0vMgQPtF4PfV
         BApeVRfo5es7qXEEdIkVz7QQtzHT9inU7WvUxIm7ZPfoe9puYy4S5Sd3VBdxx4wZFmCd
         qmMg==
X-Forwarded-Encrypted: i=1; AKwUvBySmIOIzibbyg0SPkWwwqOd8ZRVLoGanmHwBbCUoGCAsPYtft01CJVqis1ULf6/qfKw0eg=@lists.linux.dev
X-Gm-Message-State: AFuF++mtkhnCKcVgoEBH6AFkHPC2UcGLDhL0efbMO82LvDUmAUupoLhM
	8a2Hr6NBNOaWUj3IN1YrPrEoJiJYqCl8ndbnD4c5T0VGF8daZbTYXmD5
X-Gm-Gg: AYBFou1ry2/7apTYvOzuDnQTWZHhGfLGzg99co5jZtfNFSYQ2Ui4t0cZJprGl2f6jaL
	a3psRavQt8gIMtKTpAEdr2LknC3r33O8tyq/QBC0uj6pfZUOqol0kIuy1hdYG8ROiLyMk6z4O4/
	Qp8GfsGtnRKFmbXZ3SykdzXuFBOM5AFpB2xtdm3w/4kebXu78xK5UJnJZRwT73Bh6l+Gu1S5KKr
	zip8AuUXuV2lS2aUGMEhrcAXKhiRrEP204ZQ4190Su7usyeu7PrsfvWVIr0wBX3dRyu6WT81e1p
	WTx6gLf70827JOxzwP7gI+0qxQoJ4zxzV08sWtOSWqPy60iPYSmzYu/4UfufwpyJ5fOZJx4G53H
	6Td/2HyBxzsTaSZwy0M82wqn1KnE1SMNxpRX/t+gNw5KH13XouM52Dz8LwQB4cEq7EQtgeFSt5d
	/KkiGStaqKyuxVpYyz8jYmdCgQB+lrgZLGMxKEbueDQRHR6JJHE5mhYoVdGJ+3KAUF9rwRXRRMn
	A==
X-Received: by 2002:a05:7301:6196:10b0:33b:fc9d:947f with SMTP id 5a478bee46e88-33e8ea87051mr2781245eec.40.1790172728561;
        Wed, 23 Sep 2026 07:12:08 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm7193489eec.5.2026.09.23.07.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:12:08 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: wei.fang@nxp.com
Cc: frank.li@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] net: fec: reject oversized fragments before bounce-buffer memcpy
Date: Wed, 23 Sep 2026 11:11:54 -0300
Message-ID: <20260923141154.2415545-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fec_enet_txq_submit_frag_skb() and fec_enet_txq_submit_skb() copy
transmit data into a per-ring bounce buffer when the source address is
misaligned or the FEC_QUIRK_SWAP_FRAME quirk is active. The bounce
buffers are allocated as kmalloc(FEC_ENET_TX_FRSIZE) where
FEC_ENET_TX_FRSIZE is 2048 bytes.

However, skb_frag_size() can return up to PAGE_SIZE (4096 on most
architectures) for scatter-gather fragments, and skb_headlen() can
exceed 2048 for certain GSO packets. When this happens the memcpy
overflows the bounce buffer by up to 2048 bytes, corrupting adjacent
heap objects.

Add a length check before each bounce-buffer copy. If the data exceeds
the bounce buffer capacity, fall through to the error path rather than
performing the out-of-bounds write.

Fixes: 6605b730c061 ("FEC: Add alignment handling for FEC driver")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 794ec42..8614984 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -558,6 +558,8 @@ fec_enet_txq_submit_frag_skb(struct fec_enet_priv_tx_q *txq,
 		index = fec_enet_get_bd_index(bdp, &txq->bd);
 		if (((unsigned long) bufaddr) & fep->tx_align ||
 			fep->quirks & FEC_QUIRK_SWAP_FRAME) {
+			if (frag_len > FEC_ENET_TX_FRSIZE)
+				goto dma_mapping_error;
 			memcpy(txq->tx_bounce[index], bufaddr, frag_len);
 			bufaddr = txq->tx_bounce[index];
 
@@ -634,6 +636,8 @@ static int fec_enet_txq_submit_skb(struct fec_enet_priv_tx_q *txq,
 	index = fec_enet_get_bd_index(bdp, &txq->bd);
 	if (((unsigned long) bufaddr) & fep->tx_align ||
 		fep->quirks & FEC_QUIRK_SWAP_FRAME) {
+		if (buflen > FEC_ENET_TX_FRSIZE)
+			goto release;
 		memcpy(txq->tx_bounce[index], skb->data, buflen);
 		bufaddr = txq->tx_bounce[index];
 
-- 
2.43.0
