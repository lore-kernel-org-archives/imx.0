Received: from mail-m93158.xmail.ntesmail.com (mail-m93158.xmail.ntesmail.com [103.126.93.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B883054DE
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 02:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.126.93.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760409476; cv=none; b=Y1pVXoavNXsRMdKHvp7yPZleqbGEKDy3qXj4VPCItXHPmqsco/K6nVWfxPgxLXQPynJFTmASzWsibcp+2P2bn+pLZ+okwuKgG4qxr1djeHWnq6UUHaprLnEOWSVaGVbZwudw5hL7hs7P098CGirh4RtOVY3+shV3OTpCEjMH7Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760409476; c=relaxed/simple;
	bh=L9Y3eF1geh2+BQ/4saZ/aUi4gJsi0xAL+hVTnEBiCSA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bjdrXc05I735vqfG+XZQtd/sR/JFtzENo8kzSF7lfb37nvBLnUcRk/xBpWwNXP/lRfs8z1RHvPjhH0qhIfmKqeT4owkvtCdsSIEj6Oe2nQQ/BQcII+K60cP2cswBlodPCcQlfOfU1HU7Ae5/aWQeni0jF2z32+DmWwN0d24v1xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=103.126.93.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 117e7b8a4;
	Tue, 14 Oct 2025 10:37:38 +0800 (GMT+08:00)
From: Zhen Ni <zhen.ni@easystack.cn>
To: Frank.Li@nxp.com,
	vkoul@kernel.org
Cc: imx@lists.linux.dev,
	dmaengine@vger.kernel.org,
	Zhen Ni <zhen.ni@easystack.cn>,
	stable@vger.kernel.org
Subject: [PATCH v3] dmaengine: fsl-edma: Fix clk leak on alloc_chan_resources failure
Date: Tue, 14 Oct 2025 10:37:28 +0800
Message-Id: <20251014023728.749845-1-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251011030620.315732-1-zhen.ni@easystack.cn>
References: <20251011030620.315732-1-zhen.ni@easystack.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99e09496740229kunm914d1350367853
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQx1MVh0eHkhKTRgeHU1PGFYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+

When fsl_edma_alloc_chan_resources() fails after clk_prepare_enable(),
the error paths only free IRQs and destroy the TCD pool, but forget to
call clk_disable_unprepare(). This causes the channel clock to remain
enabled, leaking power and resources.

Fix it by disabling the channel clock in the error unwind path.

Fixes: d8d4355861d8 ("dmaengine: fsl-edma: add i.MX8ULP edma support")
Cc: stable@vger.kernel.org
Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
Changes in v2:
- Remove FSL_EDMA_DRV_HAS_CHCLK check
Changes in v3:
- Remove cleanup
---
 drivers/dma/fsl-edma-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 4976d7dde080..11655dcc4d6c 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -852,6 +852,7 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
 		free_irq(fsl_chan->txirq, fsl_chan);
 err_txirq:
 	dma_pool_destroy(fsl_chan->tcd_pool);
+	clk_disable_unprepare(fsl_chan->clk);
 
 	return ret;
 }
-- 
2.20.1

