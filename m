Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AFC46F481
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 10:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519361; cv=none; b=aYCsauRbI+Od6uO0O405ImLapoM1ORTaRqpPMvUA5eCnRJ6PXgQGjzsH/yrCzPgiJQKp0B9HMjRUAhe5af3VFrqYe4s64UKpZ4qxhEeqr1oTqvFNECPXFOfUxn2qHWc+5cfP8RqsctXT+Gjl70ontPopzglRsKstFXr//3H4NQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519361; c=relaxed/simple;
	bh=v/kjOdY5Lu1zx1XvZRZFRlrggOLQEbcgXqmMq7HMqbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E1mHUqUkjzj/6Z486H9N6Z3obFodXDkrxCGpxCNd8oo2+O+L6rdSsURiHV+NtGHo6OMU9PNj9Ovh8bSurGN/kQjCxJMkUSHvWAT+dKM0knKFxi1ay2r+XI+SMp/ngrJcGfl017L//FfDko6EtqBsMGN0GdRw+y3z4TI4M7LoNG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWhc+7XP; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWhc+7XP"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so967083a91.0
        for <imx@lists.linux.dev>; Fri, 04 Sep 2026 03:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519359; x=1789124159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VKYmUlTOqIu/1cBSCueueKVNw/xbCQqglwL7pQcSE8g=;
        b=KWhc+7XP5MttMg6jmC5/sqn1UF2Z/NsFZH0C3e6SHcF9OK1XG40VMaifT3jNRvWMom
         wg27gl+RXHSWtmbM6Lk9N0BHkiChtWGxl5p6y9vwKlKkBJ3supFm8Y/NKT4XM/ucL6+0
         Z5V/pR6iiRfj/CPzYcqPXm+CBgmqe34dunb4Nx39InUtmIlKMHdC5Er9UU8xmaldVh5j
         FkK0lc/ppzbNMTkTzgtDJyaYsCtXkH0giJoO4p0pGgGGsSVAZhRDW6Q3EwIP8yUGdrBy
         fI51sMCJ5/1PSEr2fY1+GKw+WquOdkmGRm+ujLo+0N4P483UQy7muFV9GaBhvEoM7A//
         niCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519359; x=1789124159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKYmUlTOqIu/1cBSCueueKVNw/xbCQqglwL7pQcSE8g=;
        b=HKnL6tuipc/c3zcQUAPI/8IXLN6Z8WoYdF6ZHTXNaFW9VyPXRzlBr98TolxCenp7FC
         G5v2rPxkVt1hNGFSgh7B5HHdXk6JbzcxzNtS2mMkdip74ZhL8vKHjEKJjECNrfewJCLL
         6rsYhnds4JJWUW4sdlAZjAUKkwFFY+wdxI5ITKJ6ZqBjDr4vVvFRk0YHp5TlvhMbq5WO
         I8Gri9LuVbfwb2oglelekORu2Os3YKPrMfakXcc1Cp33uKGWkEdN9AXLsk9lyKKVncHS
         5AsjMcdMu1CtbNuhymAyYkHtwbZF1XRr7aebgwntzCpjqXeR2JAPZIrQ4pHyrL327/Bj
         iQwA==
X-Forwarded-Encrypted: i=1; AKwUvBzfS5Rm/LIpTCrW2MbGr7ibAtjsF6V77nL0DZgRQBUB41Eqb2pMjUuSd06fOs9ga9Ztc24=@lists.linux.dev
X-Gm-Message-State: AFuF++m76q4ORwRk17smNmXLZyvzN8YzZ3evYmeoUVomwMO2q6FHv/HN
	jl+FgT+Gg02HJYYs/sSCwzlE3Rhv1WifSM7Ruug2xEIhaWr4prlp1Pln
X-Gm-Gg: AYBFou0hoskZVXEfT4zcv750dKtXoDiA28TwYRQqQw3lrJPy5vB/RcMZ/qI/DtbAJdM
	3BSppRFLqZPuox6feI9Zmyk5iM/5YfbxtXBuCzuxMRhemDcP0oYKmlA0NVfhDtIT7gye3bvGtjj
	JT8L+vGpzdJIWy4pbmay2XkroPeRW8vPZV5TE1KcbQpjX61He3oVWHHqSkZfTU1aLzwJdEACynb
	dpX+8YTrorP4LU2+O6u/z1w+CcrMxXd695U0XX9eVmRLtq/y3yFoXzcAoF4w2htUYRyUSYr56Bd
	0y9FqtegPhHFN+UpW9G/THUbVm3uUNvkRgf3GxqiED786RLpiGoZGF4pMMhTtfpCPv2iIU/ph1Q
	oFdfs6v0AVvpDYJ5fU00c1wyh+XTWUDDNF/9VmdXsP8zHHQ6Q58JAdhx8SFlOMNryNa3576OOX9
	7df9USuZfswh30/rYnpuqQ/kzEm4M4WRf5321CYao5zIC2z/8m9HgJGlukNLxk6QmhsfsACih3a
	gbG563zASOWnMUX2LmIdTyUk2i/0wftWo3+CBehxjUXdOjrwajXaixZDeEXfE2mR6RW8MTYbyCZ
	ox8F9MuN5oVUj9cx
X-Received: by 2002:a17:90b:3b41:b0:398:9bd3:d6d2 with SMTP id 98e67ed59e1d1-39b27ea25b9mr3194454a91.12.1788519358927;
        Fri, 04 Sep 2026 03:55:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612ba2bsm3842279a91.14.2026.09.04.03.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:55:58 -0700 (PDT)
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
	Stephen Boyd <swboyd@chromium.org>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net v3] net: fec: Propagate PTP initialization errors
Date: Fri,  4 Sep 2026 17:55:42 +0700
Message-ID: <20260904105542.70540-1-phucduc.bui@gmail.com>
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

Fixes: b86bcb299092 ("net: fec_ptp: Use platform_get_irq_xxx_optional() to avoid error message")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1: 
https://lore.kernel.org/all/20260820111416.97917-1-phucduc.bui@gmail.com/
Link v2:
https://lore.kernel.org/all/20260903092430.354186-1-phucduc.bui@gmail.com/
Changes in v2:
 - Squash the two patches into one.
 - Add error handling for platform_get_irq_byname_optional().
 - Fix error handling for ptp_clock_register().
Changes in v3:
 - Retarget the patch to the net tree instead of net-next.
 - Add error handling for platform_get_irq_byname_optional() 
   in fec_probe() for the fec_enet_interrupt IRQ.

 drivers/net/ethernet/freescale/fec.h      |  2 +-
 drivers/net/ethernet/freescale/fec_main.c | 11 ++++++++---
 drivers/net/ethernet/freescale/fec_ptp.c  | 22 ++++++++++++++--------
 3 files changed, 23 insertions(+), 12 deletions(-)

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
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 794ec427b0ee..a9a458703547 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -5384,8 +5384,11 @@ fec_probe(struct platform_device *pdev)
 		goto failed_reset;
 
 	irq_cnt = fec_enet_get_irq_cnt(pdev);
-	if (fep->bufdesc_ex)
-		fec_ptp_init(pdev, irq_cnt);
+	if (fep->bufdesc_ex) {
+		ret = fec_ptp_init(pdev, irq_cnt);
+		if (ret)
+			goto failed_reset;
+	}
 
 	ret = fec_enet_init(ndev);
 	if (ret)
@@ -5394,7 +5397,9 @@ fec_probe(struct platform_device *pdev)
 	for (i = 0; i < irq_cnt; i++) {
 		snprintf(irq_name, sizeof(irq_name), "int%d", i);
 		irq = platform_get_irq_byname_optional(pdev, irq_name);
-		if (irq < 0)
+		if (irq < 0 && irq != -ENXIO)
+			return irq;
+		if (irq == -ENXIO)
 			irq = platform_get_irq(pdev, i);
 		if (irq < 0) {
 			ret = irq;
diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 56801c2009d5..557a76797eba 100644
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
@@ -779,26 +779,32 @@ void fec_ptp_init(struct platform_device *pdev, int irq_idx)
 		      HRTIMER_MODE_REL);
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
-	if (irq < 0)
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
+	if (irq == -ENXIO) {
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
+		ret = PTR_ERR(fep->ptp_clock);
 		fep->ptp_clock = NULL;
 		dev_err(&pdev->dev, "ptp_clock_register failed\n");
+		return ret;
 	}
 
 	schedule_delayed_work(&fep->time_keep, HZ);
+
+	return 0;
 }
 
 void fec_ptp_save_state(struct fec_enet_private *fep)
-- 
2.43.0

