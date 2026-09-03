Received: from sg-2-1.ptr.blmpb.com (sg-2-1.ptr.blmpb.com [71.18.227.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA9A51119E
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 20:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466579; cv=none; b=hNiOCWUnDOIrK+1XklJhoFnLkqfa6d3aUG2A1DU5H2KxJQT3bFpNV3cSPROEtOeOt5PuG6m4xh6L3Lk6ncTr7JhTN/EhUg5OT4DCScFRBib9ghTmwWsy+lsxWOIuCYgbHZ6hSwbtXHL/tkvOqA5z6WDRIEOf9ll/UQ6Pyh72zY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466579; c=relaxed/simple;
	bh=77M/velDp7X7l0MvBb4bkvo6NbiSoZE+zbFrKfeB8UI=;
	h=Mime-Version:From:Date:Message-Id:Content-Type:To:In-Reply-To:Cc:
	 Subject:References; b=iPTa0NK/+F8kvSED87+dqesR9IuC0g/WqcgIfo7L8wZNC12kIDQsdiVfejn6YhZIs5oS5YEKz2ApjgTGMvgGqXt/SRVkE/47blqS7xlitchK0hRby8QDEN2H+RTC7hNd+DDe3m8BUTFWFSkHXYB5a0Uz6f62CKbnJUNmRHht3j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc; spf=pass smtp.mailfrom=cherr.cc; dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b=r5paMQA6; arc=none smtp.client-ip=71.18.227.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b="r5paMQA6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1788466555; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ldLrh1H+v+HY/oP7X4m3JBwZjgD1X/VmJUpYnEeKWmo=;
 b=r5paMQA6eu2cL89pd8I4ySqItuvupzR/B/CacjvNpztDHwJUEVz3fOmshzZ3khENWZVIpp
 JRepyNlPzWjhgAKHZOzGMow1nOXEpgxE1c6nzEIeQHwLkkNFY9mM0ExZrkdi8qTQFuK0Nu
 Ve2TChn/UPe0MTMsHcWYvB00u8X+UC7CnkWFzM0O9ML2AUjSRc4Xk5caokf/drlUrCP5Dl
 RhpaAR99fpRyAxAM7U2Bf8AX6tEBXPGCVGahG8SBICkbyBrQH+lixLsag+ui3AU413czCY
 7MR//1l9vGvmL0F+Ct/bQq5wb1DqJIrESxzFnqXY5HNstfHl5hm4gWEKcsqiEw==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Received: from [192.168.9.107] ([111.42.148.30]) by smtp.feishu.cn with ESMTPS; Fri, 04 Sep 2026 04:15:53 +0800
From: "Shengzhuo Wei" <me@cherr.cc>
Date: Fri, 04 Sep 2026 04:15:46 +0800
Message-Id: <20260904-fec-ptp-pps-event-uaf-v1-2-9af446be4a11@cherr.cc>
Content-Type: text/plain; charset=UTF-8
X-Original-From: Shengzhuo Wei <me@cherr.cc>
To: "Wei Fang" <wei.fang@nxp.com>, "Frank Li" <frank.li@nxp.com>, 
	"Shenwei Wang" <shenwei.wang@nxp.com>, 
	"Andrew Lunn" <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, 
	"Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, 
	"Paolo Abeni" <pabeni@redhat.com>, 
	"Richard Cochran" <richardcochran@gmail.com>, 
	"Troy Kisky" <troy.kisky@boundarydevices.com>, 
	"Fugang Duan" <fugang.duan@nxp.com>, 
	"Lucas Stach" <l.stach@pengutronix.de>, 
	"Fugang Duan" <B38611@freescale.com>
X-Lms-Return-Path: <lba+26a99d57a+0ca270+lists.linux.dev+me@cherr.cc>
In-Reply-To: <20260904-fec-ptp-pps-event-uaf-v1-0-9af446be4a11@cherr.cc>
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
Cc: <imx@lists.linux.dev>, <netdev@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
Subject: [PATCH net 2/2] net: fec: free the PPS interrupt before tearing down the PHC and netdev
References: <20260904-fec-ptp-pps-event-uaf-v1-0-9af446be4a11@cherr.cc>

The dedicated PPS interrupt is devm-managed, so its handler remains
registered until device-managed resources are released after the remove
callback returns.  It therefore outlives both fec_ptp_stop() and
free_netdev().

A handler already in flight can observe pps_enable before fec_ptp_stop()
clears it and call ptp_clock_event() concurrently with
ptp_clock_unregister().  A handler invoked after free_netdev() but before
device-managed cleanup dereferences the freed netdev.

Record the IRQ after a successful request and release it explicitly in
fec_ptp_stop(), before unregistering the PHC.  devm_free_irq() removes the
handler and waits for any running instance, so none can still execute when
PHC teardown begins.  The IRQ is requested without IRQF_SHARED, so its
release does not affect another handler.

Fixes: 4ad1ceec05e4 ("net: fec: Let fec_ptp have its own interrupt routine")
Cc: stable@vger.kernel.org
Assisted-by: GLM:5.3
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
---
 drivers/net/ethernet/freescale/fec.h     |  1 +
 drivers/net/ethernet/freescale/fec_ptp.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec.h b/drivers/net/ethernet/freescale/fec.h
index 7176803146f3..960b9f01c531 100644
--- a/drivers/net/ethernet/freescale/fec.h
+++ b/drivers/net/ethernet/freescale/fec.h
@@ -670,6 +670,7 @@ struct fec_enet_private {
 
 	/* pps  */
 	int pps_channel;
+	int pps_irq;
 	unsigned int reload_period;
 	int pps_enable;
 	unsigned int next_counter;
diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 0036549974fd..5b1d58c85fcd 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -787,9 +787,12 @@ void fec_ptp_init(struct platform_device *pdev, int irq_idx)
 	if (irq >= 0) {
 		ret = devm_request_irq(&pdev->dev, irq, fec_pps_interrupt,
 				       0, pdev->name, ndev);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_warn(&pdev->dev, "request for pps irq failed(%d)\n",
 				 ret);
+		} else {
+			fep->pps_irq = irq;
+		}
 	}
 
 	fep->ptp_clock = ptp_clock_register(&fep->ptp_caps, &pdev->dev);
@@ -861,6 +864,12 @@ void fec_ptp_stop(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&fep->time_keep);
 	hrtimer_cancel(&fep->perout_timer);
+
+	if (fep->pps_irq > 0) {
+		devm_free_irq(&pdev->dev, fep->pps_irq, ndev);
+		fep->pps_irq = 0;
+	}
+
 	if (fep->ptp_clock) {
 		ptp_clock_unregister(fep->ptp_clock);
 		fep->ptp_clock = NULL;

-- 
2.47.3
