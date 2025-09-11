Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412882C029C
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 21:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757627814; cv=none; b=DIj4/uYuJ9K3lHUJ7fZL+My/s/KMHxA/FT9GCh+6NBfZ2ASxoBdD9yelN4IhDMAx05bWb2UTfrqgdwvmwJS/bjb/WslrODOVvrVoKu4ePPvaMOiKCJamDYBFKKgX7FYdz+wKOQ5MGXSqxGM4OITwipIe7Lp+jnXn1AQeYO6HSVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757627814; c=relaxed/simple;
	bh=Ay7fyy4+Nh1sAgUywbsWUgoNJm6SMj/lBy4PrkKWamU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PrID+xSM/lu95N8Bb8hIbVREhEe7eyL+G8WzhOZvYw1jarPORmYS/WV5wNxuR0CsbsO7OlW65iN50Ol8N2KtgWwWrY9T9KfGxtRK6cjivUnGMS475/l/W43zZv7CZtOBjv1Nri3jcs8I7dNOmBH2CxF5dPs1Gl9ZvjkydCr5Ar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uwpHe-0004g5-D5; Thu, 11 Sep 2025 23:56:50 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Thu, 11 Sep 2025 23:56:49 +0200
Subject: [PATCH v2 08/10] dmaengine: imx-sdma: make use of
 devm_add_action_or_reset to unregiser the dma_device
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-v6-16-topic-sdma-v2-8-d315f56343b5@pengutronix.de>
References: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de>
In-Reply-To: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de>
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

Make use of the devm_add_action_or_reset() to register a custom devm_
release hook. This is required to turn off the IRQs before calling
dma_async_device_unregister().

Furthermore it removes the last goto error handling within probe() and
trims the remove().

Make use of disable_irq() and let the devm-irq do the job to free the
IRQ, because the only purpose of using devm_free_irq() was to disable
the IRQ before calling dma_async_device_unregister().

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index d39589c20c4b2a26d0239feb86cce8d5a0f5acdd..d6d0d4300f540268a3ab4a6b14af685f7b93275a 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2264,6 +2264,14 @@ static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
 				     ofdma->of_node);
 }
 
+static void sdma_dma_device_unregister_action(void *data)
+{
+	struct sdma_engine *sdma = data;
+
+	disable_irq(sdma->irq);
+	dma_async_device_unregister(&sdma->dma_device);
+}
+
 static int sdma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2388,10 +2396,16 @@ static int sdma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, sdma_dma_device_unregister_action, sdma);
+	if (ret) {
+		dev_err(dev, "Unable to register release hook\n");
+		return ret;
+	}
+
 	ret = of_dma_controller_register(np, sdma_xlate, sdma);
 	if (ret) {
 		dev_err(dev, "failed to register controller\n");
-		goto err_register;
+		return ret;
 	}
 
 	/*
@@ -2410,11 +2424,6 @@ static int sdma_probe(struct platform_device *pdev)
 	}
 
 	return 0;
-
-err_register:
-	dma_async_device_unregister(&sdma->dma_device);
-
-	return ret;
 }
 
 static void sdma_remove(struct platform_device *pdev)
@@ -2423,8 +2432,6 @@ static void sdma_remove(struct platform_device *pdev)
 	int i;
 
 	of_dma_controller_free(sdma->dev->of_node);
-	devm_free_irq(&pdev->dev, sdma->irq, sdma);
-	dma_async_device_unregister(&sdma->dma_device);
 	/* Kill the tasklet */
 	for (i = 0; i < MAX_DMA_CHANNELS; i++) {
 		struct sdma_channel *sdmac = &sdma->channel[i];

-- 
2.47.3

