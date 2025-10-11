Received: from mail-m60135.netease.com (mail-m60135.netease.com [210.79.60.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300CD2AD3E
	for <imx@lists.linux.dev>; Sat, 11 Oct 2025 03:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.79.60.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760151998; cv=none; b=J70kJr9rYH+S4YQptbrZEuYGObMVpK5bY2jRG7Ez4zPHcP53PANj/UzpzStO5QhzpJbFk4c8JbjHHwvfguKmhd4ZP7Y009qTgReoTF8WClFv4Ch+YvSEtL8BddBx7oz+Z0d3tkoncQzaJfdzB3rQUy9drifjJN6MSALSs4nKS/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760151998; c=relaxed/simple;
	bh=FAYzIYzjI7raN5Ez/3fb9mpfl27NtpBUIy9iShZZGYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PxGNKVViwzR1QVtFDk/A9bXtpGMTzCZR6ipFs7nCO0jSi1VEFzSnFYpL+u0mabnxXJzUHhCl0D0jH9BAS/BsEGGIrYHcgTfhyeYJuT25rtMFJbQJT26rihBPMwZI+ub+fJn4X8GH26mEVFcb4b5wCdkXyOCs3LQarF50UGtpYXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=210.79.60.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 115c4daf0;
	Sat, 11 Oct 2025 11:06:29 +0800 (GMT+08:00)
From: Zhen Ni <zhen.ni@easystack.cn>
To: Frank.Li@nxp.com,
	vkoul@kernel.org
Cc: imx@lists.linux.dev,
	dmaengine@vger.kernel.org,
	Zhen Ni <zhen.ni@easystack.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2] dmaengine: fsl-edma: Fix clk leak on alloc_chan_resources failure
Date: Sat, 11 Oct 2025 11:06:20 +0800
Message-Id: <20251011030620.315732-1-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251010090257.212694-1-zhen.ni@easystack.cn>
References: <20251010090257.212694-1-zhen.ni@easystack.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99d13bec130229kunm7f66ab3a97c69
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSRgaVh5JHh9CTkgdGk1ISlYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+

When fsl_edma_alloc_chan_resources() fails after clk_prepare_enable(),
the error paths only free IRQs and destroy the TCD pool, but forget to
call clk_disable_unprepare(). This causes the channel clock to remain
enabled, leaking power and resources. Since clk_disable_unprepare() is
safe to call with a NULL clk, the FSL_EDMA_DRV_HAS_CHCLK check is
reduntante.

Fix it by disabling the channel clock in the error unwind path.
Also clean up similar redundant checks in the driver for consistency.

Fixes: d8d4355861d8 ("dmaengine: fsl-edma: add i.MX8ULP edma support")
Cc: stable@vger.kernel.org
Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
Changes in v2:
- Remove FSL_EDMA_DRV_HAS_CHCLK check
---
 drivers/dma/fsl-edma-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 4976d7dde080..3007d5b7db55 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -852,6 +852,7 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
 		free_irq(fsl_chan->txirq, fsl_chan);
 err_txirq:
 	dma_pool_destroy(fsl_chan->tcd_pool);
+	clk_disable_unprepare(fsl_chan->clk);
 
 	return ret;
 }
@@ -883,8 +884,7 @@ void fsl_edma_free_chan_resources(struct dma_chan *chan)
 	fsl_chan->is_sw = false;
 	fsl_chan->srcid = 0;
 	fsl_chan->is_remote = false;
-	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK)
-		clk_disable_unprepare(fsl_chan->clk);
+	clk_disable_unprepare(fsl_chan->clk);
 }
 
 void fsl_edma_cleanup_vchan(struct dma_device *dmadev)
-- 
2.20.1

