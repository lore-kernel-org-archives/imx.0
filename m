Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0C547C11F
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 20:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195877; cv=none; b=MTXqdD4XvkTJPZNsU2EzBE0l6ZWWLfBpgPb9aylz10/Y5OrdADL0Xo94D0QgAj1MU/Y/7HeCkKbckQajwMq7AQw0gAEb8jUXHhJ3XXJoyRfd3S9br38fArpjB41NabIgBgwyw/q9S/q9xgTWHuN3U7pUCB7SwsjS8P7gLKk3l/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195877; c=relaxed/simple;
	bh=ktR9e2h8nCd9S0EFkl5DruJEUJcripKPI1tSmR1JOBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C+nQEFN68KdLVTQela1CMOv41zzWYkSH7Mil01tN6GHtTrRaS4+FbHG9d0KXESkJocVkrL+/ZLfQh9Y+RJ4/s/1M8Rlzxil4fPseLAiFPt64CeyQ4/qh71P0t9AdsoHWZo6CyNp5xn6FyZlrsiKg2CeC2N8rBgWASlqWfluqi8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsbrmJbx; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsbrmJbx"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso1608512eec.1
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 13:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790195875; x=1790800675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZvYoYp7T3tg2JMG9Cckdchh+Egbf2tNmPcdBTT/ZU4=;
        b=dsbrmJbxRu7rXL+mLHz1H4fnuKahPfY/Nho6c6DWWXM7T+nDuLjPHxRbX3Uv3Ah+wU
         JJ0HHhUsfbWDxQkRNDvAsNhRQOPSrERTxiI0O5vCX1KYaQMpd25TDsDLX+fXWKJfgk6T
         Enq6Y062G453X5wBRpw+puuVWljsF8novu3dawl8QMBOrJj3BOGA9OyKzPfww5Pvw40Y
         OPyqo8k7O79H12ROkoqMholxtII1NMHNk6PvXpeyxXlk+zxPM7THxTVXGnN2RBmeFbV/
         P2+krYFsjVP1thxfHqdfm8EGKSywM0X0T6evQhLs3AKjfpvg9BJphs3E5rFRZL3ddLIb
         MeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790195875; x=1790800675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZvYoYp7T3tg2JMG9Cckdchh+Egbf2tNmPcdBTT/ZU4=;
        b=TwJ3edGMr8lz/zCiv1N4RXvYH74zgtjNro58coAzbntO8367pa7sZmFXLQMrCjaISg
         kfzlxpgIcL4Rox+cadhCEocdg2Lq1jiz8+1SZ+TDFSlfbeA2glKKGh1jaDky9OQmA7TQ
         70+eRL10aNnxUXZcZJtvWjseUa5viZL5vBBzCVGCOHR4Ee/KIW+P5dlhNxNQjDyfQOlW
         ALf5XlYLjUug7h2XMKCimChTbRyjc8K0d4PuiCtbZAyVJa3zdYMZk1y0872GSZJfMS+D
         ZAkLB5e43UVyx6g6twFMHyuSrDFX79rkzRqU8yQg2QAs/x3O5Abthhx5/bTJtF1D5m54
         nWww==
X-Forwarded-Encrypted: i=1; AKwUvBzcIrmU8YSXHTau/hf6q24dIMCAqRkL0efvRXPZlSOiFToz6xSu8iouodQ9LlWQbwBLwJo=@lists.linux.dev
X-Gm-Message-State: AFuF++nGWxSGj0iwPncq/CE7+EuR64pzUL1DFifxgqPh0/tL46wRRHTu
	qucVIVIhWi4+5FYgZvOykx0VpVpxoeevEV8H8PQvvNHzKQmHKl0DTE5S
X-Gm-Gg: AYBFou29NrIJFWBtJ0BjwrC18Lit6XbW2YqGFnwjXxtGkEYaD2r82YAL9PlfdMteYv4
	MQcYWGRYOuXG+Vn1r7zx3fXcKVRb80sSIT1wGTjmdWBGD6xysGS9jXh1SqY3PAm3uNtpvstdVsq
	mSfOzup9GShKTf4aWJ28HiglnD7nJqx2ijBa3gpgPHcT6IikrJgPXulSQg3Zkvl1w4jxo0GXdat
	drIKHvgxOceh8353GhkVqfAoaflDeyina83F47xm5qNnapSv8ByUcGhCprJKGP3dt2SATKfk6yc
	ZgH2iFSEE2JAxULlZgtXaRvTUSg7P25kOroYjAL+wEtSZmb8tSqudRgiwxAmNNwZF5PA4CDTgtM
	HYOeo4hAw3ZPRbpeDCedgFBLwXZbFDvIbrH3JcIcvWqAFMnREvUhwhn5ujA82SXjlHSuOr91boG
	NeqIoOR3bRdfuNuXLnzGr42KrZwa9VUhJ72Xy0eXq8wUEc5HJiEZdjUb7KBiwvbfk=
X-Received: by 2002:a05:693c:8206:b0:339:8131:424e with SMTP id 5a478bee46e88-34006978035mr212595eec.34.1790195875080;
        Wed, 23 Sep 2026 13:37:55 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm8375052eec.5.2026.09.23.13.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:37:54 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: wei.fang@nxp.com
Cc: andrew@lunn.ch,
	frank.li@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net v2] net: fec: reject oversized fragments before bounce-buffer memcpy
Date: Wed, 23 Sep 2026 17:37:38 -0300
Message-ID: <20260923203738.1583735-1-qwe.aldo@gmail.com>
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
