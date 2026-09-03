Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC843FC5C4
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427511; cv=none; b=gzyg++d/ZiAmaMbZG0UZxOsGKiXimIEoQcGcsn0kmrcV2gL6x43iljymWSt2zFb79HsXy8DBwVVJ1vrn2wgZuhi/EtadE10jWicqzCGWB2B7tSovpObhmmQvYqLSkhUA8k+Wrbh29FGnvcLJ+KQ7Ki3WDPufh6wnFfbdd8DRtS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427511; c=relaxed/simple;
	bh=94yqjhsBr5rPIKFH2AgXcHWBJxd83fBZ4CFS7MZdBlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HQSiwz28uy9A5lCSo3ydm7E4dR2p2gGqbQp3/iLTnUTK+EHi3bgAPrd6SUeL/xpEJb+xDLPAlouMcAZVSUUJUqWkxf1AxtPtM7PbZKxFnfnwFqbkcP/tLJo35rGUk7gzm+O1ChbIsqL0w0ET5K2h7QDz915GRs+PFvOjnf6+348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qh3azEsN; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qh3azEsN"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9e7391839cso2260375a12.0
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 02:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788427509; x=1789032309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOIXCrUO/IV1dzZwAc5lm4gP31IHeNSIKWytFXngFg0=;
        b=qh3azEsNuckjvQ413EC6WMHNDKQx2PvjydrQaQtboM92uvDCIxmSTcvKvggKBErx5Y
         2BsDkIXX7sdOACfaFYTm5tmDraLuAqRwbXvvg+YxtWo67vf1a1YC+U5cDc8OESjnzlTu
         OHxzjwoNwcmNxUv/EjAK5c9vHKPbMsxZ5UECXHor7ksR0yB0nmgkzaYT7LeDPx0NJCGL
         zV39ZLlHLcioTvibEObEM+GP/uMsRiGn62dWGxAeippSKfeOs3IyZicY3TV89R0g0wjo
         GYs4YjUIAV9PqO/TwOPjp0jWuykDlOZSnjgx8tgBeoWHFCqNUn4b/yA4hWJIRfdpHjag
         hecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427509; x=1789032309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOIXCrUO/IV1dzZwAc5lm4gP31IHeNSIKWytFXngFg0=;
        b=sTu3zst7GEhADzW8+CAQVlsMPtcdoRjfXYRv9D9E2heUNAH80SxdT7XDehczUdoITj
         3H9md1fVatDvXb+++ODQTcXy2KMz1VIHXLAF3u2KVdcCRtNiMsL2d+d2akz+VDlCM/nF
         BCm3qlTw2BmdHbHUUoxCMXSZVlFlcUN2MLYfaNlExJDDMz180FNE2IeE0iG4Eb2T9wtO
         1Ai4/llHGN1bmX+e2Mm4NzC17lTTWktEcwqNoF+/SadxiegjHfuWiqioCfVW6E+cXefK
         xCadgboIQ76TT2vh2jic7UeD1AckU/pt5hmhainsa6u6ytQ8lagitv82ij4SdoQfEmcJ
         F5EA==
X-Forwarded-Encrypted: i=1; AKwUvByE3NgYO8reihfV365S/Xpf67yZmsUsJKTEMT9SunVC8sFMv+Y5WJImwVUlb2xsyxJfoCo=@lists.linux.dev
X-Gm-Message-State: AFuF++k2lNt7MHSLvgviAL9CHOTtvouSxCa3jXCdk5Mk0+8nc6dovstP
	4KeBbs0VCGWBegdDR7dvw+iwBUiHEhgsGL0sdNdRDh2Lq1PiA5kHwTB/
X-Gm-Gg: AYBFou2iqePxUDMDLUnuxnoFdP/AZWDqiPQpsAvbdWVln4A+OAQoidcGw8EnJkHAe8R
	kA6OmCLnOUkIMgMC26x5kB8nID1ZXcV8slKyJ2gMPwvw+4CbLSaBYODfnI7OxTQVO8tRUK8fJL3
	WD9qoham2qAaVQBbItkX6kXeK2jPZP4FSWJoAvrhYQgcPAMTGiNeJ+Fh0UZJd3zbgdHga0q3GLB
	0ewGAbxJ98ZeYiC8cFBa3X+55rMtiKEfgBTtX2vXhdVQUpAMyHSjP0iAmIa1+uAgkrugefhjZZE
	Mk9oq1H7J3Fh8I0915x/I8UbWfs14UUNLpSI53tKcx6FdFlqr0EEPPXCxx9bkxBbHxmSd9K3k+5
	YBREDnJlr+pMs/1m1kRKGWztdJHdHvlBAS7nZ7H5pheL4VF6rhQ6g8ez6xznIMKUWWNAMM/EpE0
	gC5F6gpTnFc29oBZCG3iaYiin43yrYbcTQboCxj0qC67x3DDnlfvMoBOJkkp9e7wClSO99Ipf12
	WFBjbvCqRKB2qrMi2SFeXyIZOmNwQDWNNgLL8nWrh/fu/oo5T48cPJ5bV1gqkIoNhwbaJFpk0m7
	L60X
X-Received: by 2002:a05:6a20:d502:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3d9b1f5e8edmr19128499637.18.1788427509232;
        Thu, 03 Sep 2026 02:25:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d3a33a7sm675376a12.11.2026.09.03.02.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:25:08 -0700 (PDT)
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
	Fugang Duan <fugang.duan@nxp.com>,
	Anson Huang <Anson.Huang@nxp.com>,
	Stephen Boyd <swboyd@chromium.org>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v2] net: fec: Propagate PTP initialization errors
Date: Thu,  3 Sep 2026 16:24:30 +0700
Message-ID: <20260903092430.354186-1-phucduc.bui@gmail.com>
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
Changes in v2:
 - Squash the two patches into one.
 - Add error handling for platform_get_irq_byname_optional().
 - Fix error handling for ptp_clock_register().

 drivers/net/ethernet/freescale/fec.h      |  2 +-
 drivers/net/ethernet/freescale/fec_main.c |  7 +++++--
 drivers/net/ethernet/freescale/fec_ptp.c  | 22 ++++++++++++++--------
 3 files changed, 20 insertions(+), 11 deletions(-)

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
index 794ec427b0ee..c6e29b5c2abb 100644
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

