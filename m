Received: from mail-m2494.xmail.ntesmail.com (mail-m2494.xmail.ntesmail.com [45.195.24.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFE11E3DED
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 09:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.195.24.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433055; cv=none; b=dmMmeJNdAVgksDGW5aeBOt3Az5Y18UiPlT6kNM1BK9BgJFsY48A+q62U3wOFYMJ09BSlvntvQifWKWZos25OZt6/DalH2WduT7d3QoqCzMBMYV7rGXzRHE4voijMCZUr+u2wfdloH2EWsZSm7hd5lH6HNT5xTdg5R5ha9NdNHgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433055; c=relaxed/simple;
	bh=wIX9z9fGBkzackI3qTx/wlLQYePO6us1ly3fqDoLPSE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ggYjgYBcNeM7zser9N7BKfbeyeTdJf6Biy9ALsYG1sVXOnzs+QpHuOtOWE2JhVCBkH1tO3YgiUPdNCfEIVmwZC4m7hZOo0hmKNnpvMsFKow8AQ3Sc64xX3NFskUG5XWAhh/goPPcJ1q2Wu7zTrkw0ZD2/vqinB1XtWvBU/L+0Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=45.195.24.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11843a334;
	Tue, 14 Oct 2025 17:05:30 +0800 (GMT+08:00)
From: Zhen Ni <zhen.ni@easystack.cn>
To: Frank.Li@nxp.com,
	vkoul@kernel.org
Cc: imx@lists.linux.dev,
	dmaengine@vger.kernel.org,
	Zhen Ni <zhen.ni@easystack.cn>,
	stable@vger.kernel.org
Subject: [PATCH v4] dmaengine: fsl-edma: Fix clk leak on alloc_chan_resources failure
Date: Tue, 14 Oct 2025 17:05:22 +0800
Message-Id: <20251014090522.827726-1-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99e1f7b29b0229kunmab906d2b3d2473
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTE8YVkJOSkpKQkNIT04aGlYVFAkWGhdVGRETFh
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
Changes in v4:
- Re-send as a new thread
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

