Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251D63043B2
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 13:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904780; cv=none; b=ayu5u7W5gGTBeeanYVaoy4MerT8TGKnhXmzw3Z4PjXxEWhEwFv0Te4GoH/vh4fAbOjoncLcTpSJJkFnUU0L04LOe/tlF7t0lSTiQzYY8V9CfGEG6aYp2zTUqscYxTVRZ8OUG93HKxi0/aMiGUj+CyxGEM4HpPlMaVZfYsTzw/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904780; c=relaxed/simple;
	bh=37VV1I2Hqg8hD248V3Pbbjkx0VlRNKUxdxIH5c9R6jI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFhBLw5qPOb65d+ISPtzlgq3ZN0x+BttgVWR9m58Gjy85XgtbL9WxaLTIkD8EsUOSLVpiYJotrZey6kipMxh59aWHRKAOy6T/obsGMw9oIUaPK/X8tNYHB4Hs8xTwrhaLTHmwvIpD+KXRlchS9paOmgopB8dryjGO52dhjVqb3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1utnBl-00006Z-SZ; Wed, 03 Sep 2025 15:06:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 03 Sep 2025 15:06:15 +0200
Subject: [PATCH 07/11] dmaengine: imx-sdma: make use of dev_err_probe()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-v6-16-topic-sdma-v1-7-ac7bab629e8b@pengutronix.de>
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

Convert the probe function to dev_err_probe() which helps users to
identify issues better.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index f6bb2f88a62781c0431336c365fa30c46f1401ad..e30dd46cf6522ee2aa4d3aca9868a01afbd29615 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2255,7 +2255,7 @@ static int sdma_probe(struct platform_device *pdev)
 
 	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to set DMA mask\n");
 
 	sdma = devm_kzalloc(dev, sizeof(*sdma), GFP_KERNEL);
 	if (!sdma)
@@ -2272,24 +2272,24 @@ static int sdma_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return irq;
+		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
 
 	sdma->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sdma->regs))
-		return PTR_ERR(sdma->regs);
+		return dev_err_probe(dev, PTR_ERR(sdma->regs), "ioremap failed\n");
 
 	sdma->clk_ipg = devm_clk_get_prepared(dev, "ipg");
 	if (IS_ERR(sdma->clk_ipg))
-		return PTR_ERR(sdma->clk_ipg);
+		return dev_err_probe(dev, PTR_ERR(sdma->clk_ipg), "IPG clk_get_prepared failed\n");
 
 	sdma->clk_ahb = devm_clk_get_prepared(dev, "ahb");
 	if (IS_ERR(sdma->clk_ahb))
-		return PTR_ERR(sdma->clk_ahb);
+		return dev_err_probe(dev, PTR_ERR(sdma->clk_ahb), "AHB clk_get_prepared failed\n");
 
 	ret = devm_request_irq(dev, irq, sdma_int_handler, 0,
 			       dev_name(dev), sdma);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
 
 	sdma->irq = irq;
 
@@ -2330,11 +2330,11 @@ static int sdma_probe(struct platform_device *pdev)
 
 	ret = sdma_init(sdma);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "sdma_init failed\n");
 
 	ret = sdma_event_remap(sdma);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "sdma_event_remap failed\n");
 
 	if (sdma->drvdata->script_addrs)
 		sdma_add_scripts(sdma, sdma->drvdata->script_addrs);
@@ -2361,18 +2361,14 @@ static int sdma_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, sdma);
 
 	ret = dma_async_device_register(&sdma->dma_device);
-	if (ret) {
-		dev_err(dev, "unable to register\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to register\n");
 
 	devm_add_action_or_reset(dev, sdma_dma_device_unregister_action, sdma);
 
 	ret = of_dma_controller_register(np, sdma_xlate, sdma);
-	if (ret) {
-		dev_err(dev, "failed to register controller\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register controller\n");
 
 	spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
 	ret = of_address_to_resource(spba_bus, 0, &spba_res);

-- 
2.47.2

