Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5125C318EDC
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224476; cv=none; b=ag48eGhAZgy/nQbssxls62XqxznxQURup7QHiV5WSnSYZ/uRtdBhYvu1ZK0RmGSGqT1tznQMWKc7IQaQASk9Sa5yyTQ8NzoOrork5ZrY8dEBegpF5gS/41vRVNOX9JLKsOZ34lvvbMk3ruXHglAJ5RlYIKSKd9nFedWJ6uVu4N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224476; c=relaxed/simple;
	bh=0Kx8Gd725wpyS63x5QxMhg2JWPdRrXuRnIUd25tfkeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P/YMlajz/ptjnF3TMxcEccj/M5fUvws3Rzo9tAtDz/YKOPVjEb7sLdGlMUjQKV2LiDvaJUfAGs021Pl4NtGZlxGbLnwon0h0oTBkp6BAaIph2sblctocDEWYmotqWWpddhMRmGzcAz1myUazBPUDGUawYbrJEP91Q2y2Sz6q78E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DV/cjqtc; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DV/cjqtc"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca12086c06eso1358859a12.0
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224474; x=1787829274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uW/q9Ab1Wexm210w5L+2fH7SlAGlBFRAkle3jNwLoEk=;
        b=DV/cjqtcnKVdyp7lxJAgiLyOS4HEWd4R/j6xHKqDyUBQDQhXybzjqsFNU0P7LKWncF
         F8ET9BFXhncGaXnj6Rcx0c+nE3xRKKnIQsQegNFvls81xNrLRSRlpEW182ibK/YxtDFe
         cQvpS/NVa/VpSBsECn8r90sYKSE2jH0XPaSj8rHQPM6y1RwA1Cl7aMKPcx9oQVlLqb1v
         jXd+QLUV9/EPxzEoXp0QZReLvQI8DH/znFMUoUO7BmlTnnMykp9EbEzWQ2CYcHabivOK
         IW/Gr1cHKdWjvInkFqe1r12VcZiX3A3h0w/EvANW2WUnpMEt8vjFsGxq9tPlzJ/ayHgJ
         BUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224474; x=1787829274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uW/q9Ab1Wexm210w5L+2fH7SlAGlBFRAkle3jNwLoEk=;
        b=ZSmysNXa88kmLa6PlxygjOIFOsuvSn9VhQgaYO+JTqs9iDUfYiFcfddvGu2wrQaOJL
         U16oFLFGmLoWfrFxtKH97WP2+JTgPXJL4rxuktgQ5OCOmY/iMG2EMGeIUV3UmXNp7kKA
         ozbpVl3QxPVCqLXvTGYZai3zs8NER1NBlPvC2+gyntE64/PMgSlLj4SpF7TajMRMXl2O
         iEaiFf82FOxl9/CL5RTpKT50yAd7IAaJJAp699jLbZS8VMC6hra3570h5qSMWSENbKiz
         D2no0PEbaZf5SIVpq+d+1Y0jOlfQmqwE4mJpF9pcMCm9XMqI9h6FLVu0mowulAAgGMOp
         ntaA==
X-Forwarded-Encrypted: i=1; AHgh+RoWoC2Kh5YQii6T/QvQR75NU50YlT21p02FnNBFEAywxz+e6QCYMATgfRgH7ejq24rfW9Y=@lists.linux.dev
X-Gm-Message-State: AFuF++lbPqSV87Q3YBPDCeYHfY8BR+nuZf9qgd3ICcTH7YfCkxsYZNFe
	A/1/vSWLMnPnZaWunSyOoF91AaTxGi3487bQdqEYBJQzxDY9ikZKYQRcBouZGQ==
X-Gm-Gg: AR+sD11wb8DUY7kMbvsl5e82aBh7jXay2crd0gYf2hExtyBVn9LUTNA2Y4KDDHTbBpd
	W9aAAr+h9bLVu47LmIcAajpIkvNoVgQTERyvUr2l8cdZ2OiORLt3E1rUYj49KmID8aUE9Da1SsB
	owraXsk8/wqyEHooWdUtNF0/6ER5EY7ARbwbFL/5Q1Zc1XVz9YtVcujInmuMRrAC8lny2+O4nJI
	M3m++rusO7VvuRZRROsuIP+Tf1WSkoryEgh+cvAEUj5q1BmvA5knPQKaJmiv0F0oO17ou+dkLOl
	vdYPwNAV5iGw7IToYD73tUR820iRvBLfonOENguD5//C8qviCNGH34ngCYL/0wsPuQskBySwSHt
	cGHDLNrIIMDvexZgXX+xzEYEOCjSnhjUoMA9WCgfaix8wzfCXHLmB50rLsoZos/f3a7TZ0Ix/cp
	jJQ2l5iNW6NU96AE3QHr1kEqXHKhxdVY3nROm+9zRubsNubLk1Ap7iCtVPkOFzy0H6Q7YKD0z10
	a5BwrEHf/E724BKlGmUyIUavGVioYbeLcV63v49V1tHwUjGWO+2MG402B6+FAx3SMwJncmJ6QXl
	vfN/
X-Received: by 2002:a17:90b:3c8f:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395810e9626mr24040537a91.15.1787224474148;
        Thu, 20 Aug 2026 04:14:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395ada57c39sm719965a91.3.2026.08.20.04.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:14:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wei Fang <wei.fang@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] net: fec: Propagate PTP initialization errors
Date: Thu, 20 Aug 2026 18:14:15 +0700
Message-ID: <20260820111416.97917-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Change fec_ptp_init() to return an error code instead of silently
ignoring failures during PTP initialization.

The PPS IRQ is not required for the FEC/PTP functionality, so its
absence should not make the probe fail. However, an unavailable
optional IRQ should be distinguished from an actual error returned
during the IRQ lookup.

If a platform does not support the PPS IRQ, it can omit the IRQ from
its device tree and the optional lookup will return -ENXIO. Propagate
other errors from the IRQ lookup instead of silently ignoring them.

Also propagate failures from devm_request_irq() and ptp_clock_register().

Update the function declaration in fec.h accordingly.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/freescale/fec.h     |  2 +-
 drivers/net/ethernet/freescale/fec_ptp.c | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec.h b/drivers/net/ethernet/freescale/fec.h
index 7176803146f3..8831da37326b 100644
--- a/drivers/net/ethernet/freescale/fec.h
+++ b/drivers/net/ethernet/freescale/fec.h
@@ -692,7 +692,7 @@ struct fec_enet_private {
 	u64 ethtool_stats[];
 };
 
-void fec_ptp_init(struct platform_device *pdev, int irq_idx);
+int fec_ptp_init(struct platform_device *pdev, int irq_idx);
 void fec_ptp_restore_state(struct fec_enet_private *fep);
 void fec_ptp_save_state(struct fec_enet_private *fep);
 void fec_ptp_stop(struct platform_device *pdev);
diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 56801c2009d5..8ad680411b0c 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -736,7 +736,7 @@ static irqreturn_t fec_pps_interrupt(int irq, void *dev_id)
  * cyclecounter init routine and exits.
  */
 
-void fec_ptp_init(struct platform_device *pdev, int irq_idx)
+int fec_ptp_init(struct platform_device *pdev, int irq_idx)
 {
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct fec_enet_private *fep = netdev_priv(ndev);
@@ -779,26 +779,29 @@ void fec_ptp_init(struct platform_device *pdev, int irq_idx)
 		      HRTIMER_MODE_REL);
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
-	if (irq < 0)
+	if (irq < 0) {
 		irq = platform_get_irq_optional(pdev, irq_idx);
-	/* Failure to get an irq is not fatal,
-	 * only the PTP_CLOCK_PPS clock events should stop
-	 */
-	if (irq >= 0) {
+		if (irq < 0 && irq != -ENXIO)
+			return irq;
+	}
+
+	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, fec_pps_interrupt,
 				       0, pdev->name, ndev);
 		if (ret < 0)
-			dev_warn(&pdev->dev, "request for pps irq failed(%d)\n",
-				 ret);
+			return ret;
 	}
 
 	fep->ptp_clock = ptp_clock_register(&fep->ptp_caps, &pdev->dev);
 	if (IS_ERR(fep->ptp_clock)) {
 		fep->ptp_clock = NULL;
 		dev_err(&pdev->dev, "ptp_clock_register failed\n");
+		return PTR_ERR(fep->ptp_clock);
 	}
 
 	schedule_delayed_work(&fep->time_keep, HZ);
+
+	return 0;
 }
 
 void fec_ptp_save_state(struct fec_enet_private *fep)
-- 
2.43.0

