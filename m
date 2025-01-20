Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A356194C92
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363277; cv=none; b=qS3/Gjt5E5+/dNB6+EH7O1XEixHludxqf0KY6g2WpThXWHFYcW9e6RoVZmuuxy9UkiafRhsj7e62SSHxXvOif4vZvPrAJz4ka+KbnpoSLhu+OJ/MYsFyo2Mm+hR/uqt7A99Sj4TgkSMuuTq9dzNGFqN+2mjGzj9VugL1E6WviU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363277; c=relaxed/simple;
	bh=ITRStiQHXvmZSkeU6QkY+Un384bN2CWEtLkFd5X62jM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R2CvfLZLaSqP8ZlBUCvfY8HOcV0nKoaefpHOVuz6ZwLFBurElBwYhNQW7FDxAE+maAE8VIHcnW0whkfJnUBzD8xAmYgkIiZD2KK9Q3ohoOCpQudb/r8aNLlL/m4uqX233e+w9UEAcN9g/w+DDRXugG6FmJ9IGB7U8NtiiEhc2zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3AeLPO2; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3AeLPO2"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21649a7bcdcso71962895ad.1
        for <imx@lists.linux.dev>; Mon, 20 Jan 2025 00:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737363275; x=1737968075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6gzGw0TGSeLlBT+PXh+TmInRomUcMmT6P6MAXrdk0NE=;
        b=M3AeLPO22ZGRPkXpyOihfIFAIOyppg5EDvxhfygdWSuuOcuA4XRD6/mMhYcgQvn7HR
         2CmgPeVE0SGjIDvWuR+sLrlF2ZB5VnitWmPMPp0cY/5QlI3ZUc3c7IAO6aOE/J14Zylu
         cQcsDiEClvT5ZRGDsxpEyBEQMfmPS/nYc2FYMugWN9hZ8J5YjFZK17aGL9hxrjPi9LnG
         TwWGV/ciEp5eC/C5hD+ODxERxlVFApDKcYtjjwCTR1V4V3SIeOsN0dcn80MiqsvmZ5oq
         WZw6/7YHDNMUSf4A+N28dY/7ypAL7YZDvtldI+/kB3DbRd4jt9Tn/FRhOfY+PUidNU0j
         /bNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363275; x=1737968075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gzGw0TGSeLlBT+PXh+TmInRomUcMmT6P6MAXrdk0NE=;
        b=X0Xj7De2CZOqyYx6FiENmtJP+vj7B4wIPPHAErVkEoqoFOJ9q9MZDfrNbKb5CZ2G6r
         Ctv/3R+gdYGtBw9nCxWH7ElvWi7YlwLtoaeYrd3krXmdwAW+XdtluEcEAp3datDYZkYn
         wsGUd+fxv6L+420/JlRBsLh7vAMc8LOxSF0/+NFSIu5Q5hivmA+ucktp4hhkfTjLZFd6
         HruuFTbbik2uzgg1HfrWbI/zaUm0TYh3/RF5DkWR+0aZQjApFRJLDUZy9dTHc3pkI1w3
         UAT4XpgoZvcOezZs52ss7+IhSZjlvIeB7eCE/c3faHXG48+aBvE8e+nd7owqA+adsI4b
         TsMA==
X-Forwarded-Encrypted: i=1; AJvYcCXNgpdrh0yCjz3Gh0AK0j03qKUpP2f7fsMwrxQbVBL6OwtOp/nsMTOHKEtSTkcoFrllkPc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMXdvFBt7fmb99/DkwX/N1PpX4+dGyur4Am2nYuojGYGNKyxNT
	53znBHC/PvaSNs7l7nJ2ubP+9yQN10NCZ4nzv2VXKggkjPW/f9cF
X-Gm-Gg: ASbGnctYcD3w+U66DHbkFjN91idRf6F7vWfw+ksZ0mWEnj5pkyPL+2vODU+ylJMxMQg
	YhW5ZXJs11SGvajxSgUbr+1f5o6YdadQWQcbJY082PXKIgesWGAzmzCrkAe0FyRzwexqo/QS+/x
	s9NAgYG7E0+7avF6IQov+jJ/C5rJFk5eKqV9CbYwkZW+LG1RVRb0tM7u75bwpohpzc4VRw8hpZi
	T+mqG3Eexh6S0e8XmHZYLZbLpGm3MjDOWrRCVPbhkXVYSD6eokovG/Ai1HLnz1zhcVyAbaA5w==
X-Google-Smtp-Source: AGHT+IG1Ikwlf8hT9+rwA9+g+Ks4MwShL+e4FuTQhDR/yhQyIgu0oKyJOv++HVvQBmKvMMVognNZew==
X-Received: by 2002:a17:902:d2cd:b0:216:5556:8b46 with SMTP id d9443c01a7336-21c3562998bmr173720355ad.49.1737363274809;
        Mon, 20 Jan 2025 00:54:34 -0800 (PST)
Received: from HOME-PC ([223.185.135.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac64csm57075545ad.149.2025.01.20.00.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 00:54:34 -0800 (PST)
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
Subject: [PATCH v4 net] net: fec: implement TSO descriptor cleanup
Date: Mon, 20 Jan 2025 14:24:30 +0530
Message-Id: <20250120085430.99318-1-dheeraj.linuxdev@gmail.com>
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
v4
	- Add a blank line before return
v3
        - Update DMA unmapping logic to skip all TSO headers
        - Use proper endianness conversion for DMA unmapping
v2
        - Add DMA unmapping for data descriptors
        - Handle extended descriptor (bufdesc_ex) cleanup
        - Move variable declarations to function scope
 drivers/net/ethernet/freescale/fec_main.c | 31 ++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 68725506a095..f7c4ce8e9a26 100644
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
@@ -913,7 +915,34 @@ static int fec_enet_txq_submit_tso(struct fec_enet_priv_tx_q *txq,
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
+
 	return ret;
 }
 
-- 
2.34.1

