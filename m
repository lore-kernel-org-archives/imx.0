Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA643019C1
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 13:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904780; cv=none; b=UsE+QVE0B5/CfspzZqMJztBZR645EIrlBFNynJ1rvYIqp5tfpUOjemNxQhBlCVHX0H1VeDCq31jUR+az+w1M/8y028vJ+qinXxO/SddEsqPHRXSEoj2xasC1luTfC2E5qcWN90Gj9jBsUZaksRsQTx4N51qHL5wrALoGN+JTdoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904780; c=relaxed/simple;
	bh=R4rQ0QjdqK60jUB9CHycckkXdaZ+8SOys9bWYtlGlY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j8c7s0u3HfgvMsR2+v3MYKflJECbYZOYMjlm0Ht6cA6u+NdZh2sFj86LKT0WjpWDItGOaKIquJtZz+AxrCYIxF61wdStgsmZ9JfVQEHxKNl4cy7Sqe8q5BHkjBxtTXt+Jun/dsZsydEBTmylfkVGGrRVOcvcON0xJoQQkZcV3bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1utnBl-00006Z-Ns; Wed, 03 Sep 2025 15:06:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 03 Sep 2025 15:06:12 +0200
Subject: [PATCH 04/11] dmaengine: imx-sdma: make use of devm_kzalloc for
 script_addrs
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-v6-16-topic-sdma-v1-4-ac7bab629e8b@pengutronix.de>
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

Shuffle the allocation of script_addrs and make use of devm_kzalloc() to
drop the local error handling as well as the kfree() during the remove.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index a85739d279f51fdb517fce90b3dc67673cf2b56c..b6e649fda71dbce12a2106c94887f90d0aaaf600 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2253,6 +2253,10 @@ static int sdma_probe(struct platform_device *pdev)
 	if (!sdma)
 		return -ENOMEM;
 
+	sdma->script_addrs = devm_kzalloc(dev, sizeof(*sdma->script_addrs), GFP_KERNEL);
+	if (!sdma->script_addrs)
+		return -ENOMEM;
+
 	spin_lock_init(&sdma->channel_0_lock);
 
 	sdma->dev = dev;
@@ -2289,12 +2293,6 @@ static int sdma_probe(struct platform_device *pdev)
 
 	sdma->irq = irq;
 
-	sdma->script_addrs = kzalloc(sizeof(*sdma->script_addrs), GFP_KERNEL);
-	if (!sdma->script_addrs) {
-		ret = -ENOMEM;
-		goto err_irq;
-	}
-
 	/* initially no scripts available */
 	saddr_arr = (s32 *)sdma->script_addrs;
 	for (i = 0; i < sizeof(*sdma->script_addrs) / sizeof(s32); i++)
@@ -2332,11 +2330,11 @@ static int sdma_probe(struct platform_device *pdev)
 
 	ret = sdma_init(sdma);
 	if (ret)
-		goto err_init;
+		goto err_irq;
 
 	ret = sdma_event_remap(sdma);
 	if (ret)
-		goto err_init;
+		goto err_irq;
 
 	if (sdma->drvdata->script_addrs)
 		sdma_add_scripts(sdma, sdma->drvdata->script_addrs);
@@ -2365,7 +2363,7 @@ static int sdma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&sdma->dma_device);
 	if (ret) {
 		dev_err(dev, "unable to register\n");
-		goto err_init;
+		goto err_irq;
 	}
 
 	ret = of_dma_controller_register(np, sdma_xlate, sdma);
@@ -2401,8 +2399,6 @@ static int sdma_probe(struct platform_device *pdev)
 
 err_register:
 	dma_async_device_unregister(&sdma->dma_device);
-err_init:
-	kfree(sdma->script_addrs);
 err_irq:
 	clk_unprepare(sdma->clk_ahb);
 err_clk:
@@ -2417,7 +2413,6 @@ static void sdma_remove(struct platform_device *pdev)
 
 	devm_free_irq(&pdev->dev, sdma->irq, sdma);
 	dma_async_device_unregister(&sdma->dma_device);
-	kfree(sdma->script_addrs);
 	clk_unprepare(sdma->clk_ahb);
 	clk_unprepare(sdma->clk_ipg);
 	/* Kill the tasklet */

-- 
2.47.2

