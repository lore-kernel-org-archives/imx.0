Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ED63043B0
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 13:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904780; cv=none; b=mNt3OE4EdTy55Lt9IM0oWCviDEPEelLxh6GpzxRI5XofqvHpJ9m9+W9Keev1rbzZyLpuFXMAeUFFi7pJCA5PKGuv5iISKjV7I2Cxfebk07UuZOpv4u7LGyZx35NZHbbN8SP+qn8kryIGB/xBOcecoumkkC212ssqT77frb1dNwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904780; c=relaxed/simple;
	bh=wK9kqRE+190Nmnm4ozR9PGQi5dhCYAkQNurhvOsKnTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gqdPSGFzcFOs7JJRXqOvzQAiOkr51OOaLm6lmaNsXYuheisdklaxKAqBy0dcP4MRQ9TmVjJFOiEpjc4z/vwDi1/AProsCXp67vwTZ8vNgblxtvbxycKfLJnpQkPwQyXQp6miCIr8o0dZmhOQ5HgXV7St8REmgJAu361ulqNNGzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1utnBl-00006Z-U1; Wed, 03 Sep 2025 15:06:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 03 Sep 2025 15:06:16 +0200
Subject: [PATCH 08/11] dmaengine: imx-sdma: fix missing
 of_dma_controller_free()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-v6-16-topic-sdma-v1-8-ac7bab629e8b@pengutronix.de>
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

Add the missing of_dma_controller_free() to free the resources allocated
via of_dma_controller_register(). The missing free was introduced long
time ago  by commit 23e118113782 ("dma: imx-sdma: use
module_platform_driver for SDMA driver") while adding a proper .remove()
implementation.

Fixes: 23e118113782 ("dma: imx-sdma: use module_platform_driver for SDMA driver")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index e30dd46cf6522ee2aa4d3aca9868a01afbd29615..6c6d38b202dd2deffc36b1bd27bc7c60de3d7403 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2232,6 +2232,13 @@ static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
 				     ofdma->of_node);
 }
 
+static void sdma_dma_of_dma_controller_unregister_action(void *data)
+{
+	struct sdma_engine *sdma = data;
+
+	of_dma_controller_free(sdma->dev->of_node);
+}
+
 static void sdma_dma_device_unregister_action(void *data)
 {
 	struct sdma_engine *sdma = data;
@@ -2370,6 +2377,8 @@ static int sdma_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register controller\n");
 
+	devm_add_action_or_reset(dev, sdma_dma_of_dma_controller_unregister_action, sdma);
+
 	spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
 	ret = of_address_to_resource(spba_bus, 0, &spba_res);
 	if (!ret) {

-- 
2.47.2

