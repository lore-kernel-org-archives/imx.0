Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266323043B4
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 13:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904780; cv=none; b=MIIkUWYaE6D2ybU0CITE/VbPUv/66lgNCcBm9HvvUsx8KoCdD/23iTCe/UxArJv0skHnoWXY9uymiCCfVnXZb2W3QMx9XHuhvlAURNMhmT7HwZVu36m7iGwqLqdd2DpNC2O3SJcfL9tUZdrPAKJCIyQ5WcRKf4G2nKlx98U9KEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904780; c=relaxed/simple;
	bh=KdPXw4hyYoeQOfh7XWD/Ki07ADOS8erkRPk2SJ7dy+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Usq1jNtWLnxjbQaOEv3HY0kABzfxP9As+Frlpa/ir+SjNfbiqR8hWw7eF7jogCqtbgwnZugacTowoPunGjpRZ2yGphRqAwwzNUV26ZKTUAR3Wzfm0CtTp0EA7KfdZIfry3ILz7DlyeVZqtAHuML7afdQtRQq/RZm1TqB/gkvfRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1utnBl-00006Z-PY; Wed, 03 Sep 2025 15:06:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 03 Sep 2025 15:06:13 +0200
Subject: [PATCH 05/11] dmaengine: imx-sdma: make use of
 devm_clk_get_prepared()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-v6-16-topic-sdma-v1-5-ac7bab629e8b@pengutronix.de>
References: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
In-Reply-To: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Make use of the devm_clk_get_prepared() to cleanup the error handling
during probe() and to automatically unprepare the clock during remove.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index b6e649fda71dbce12a2106c94887f90d0aaaf600..5a571d3f33158813e0c56484600a49b19a6a72e2 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2270,26 +2270,18 @@ static int sdma_probe(struct platform_device *pdev)
 	if (IS_ERR(sdma->regs))
 		return PTR_ERR(sdma->regs);
 
-	sdma->clk_ipg = devm_clk_get(dev, "ipg");
+	sdma->clk_ipg = devm_clk_get_prepared(dev, "ipg");
 	if (IS_ERR(sdma->clk_ipg))
 		return PTR_ERR(sdma->clk_ipg);
 
-	sdma->clk_ahb = devm_clk_get(dev, "ahb");
+	sdma->clk_ahb = devm_clk_get_prepared(dev, "ahb");
 	if (IS_ERR(sdma->clk_ahb))
 		return PTR_ERR(sdma->clk_ahb);
 
-	ret = clk_prepare(sdma->clk_ipg);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare(sdma->clk_ahb);
-	if (ret)
-		goto err_clk;
-
 	ret = devm_request_irq(dev, irq, sdma_int_handler, 0,
 			       dev_name(dev), sdma);
 	if (ret)
-		goto err_irq;
+		return ret;
 
 	sdma->irq = irq;
 
@@ -2330,11 +2322,11 @@ static int sdma_probe(struct platform_device *pdev)
 
 	ret = sdma_init(sdma);
 	if (ret)
-		goto err_irq;
+		return ret;
 
 	ret = sdma_event_remap(sdma);
 	if (ret)
-		goto err_irq;
+		return ret;
 
 	if (sdma->drvdata->script_addrs)
 		sdma_add_scripts(sdma, sdma->drvdata->script_addrs);
@@ -2363,7 +2355,7 @@ static int sdma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&sdma->dma_device);
 	if (ret) {
 		dev_err(dev, "unable to register\n");
-		goto err_irq;
+		return ret;
 	}
 
 	ret = of_dma_controller_register(np, sdma_xlate, sdma);
@@ -2399,10 +2391,7 @@ static int sdma_probe(struct platform_device *pdev)
 
 err_register:
 	dma_async_device_unregister(&sdma->dma_device);
-err_irq:
-	clk_unprepare(sdma->clk_ahb);
-err_clk:
-	clk_unprepare(sdma->clk_ipg);
+
 	return ret;
 }
 
@@ -2413,8 +2402,6 @@ static void sdma_remove(struct platform_device *pdev)
 
 	devm_free_irq(&pdev->dev, sdma->irq, sdma);
 	dma_async_device_unregister(&sdma->dma_device);
-	clk_unprepare(sdma->clk_ahb);
-	clk_unprepare(sdma->clk_ipg);
 	/* Kill the tasklet */
 	for (i = 0; i < MAX_DMA_CHANNELS; i++) {
 		struct sdma_channel *sdmac = &sdma->channel[i];

-- 
2.47.2

