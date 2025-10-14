Received: from mail-m155110.qiye.163.com (mail-m155110.qiye.163.com [101.71.155.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB70A1A3165
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 02:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760410091; cv=none; b=NwlIkAOXQfSql4RihdbI2AO94b62a37uchSS0Q6HjTj4bGkVWh/czJWXocS7X3okTwmEGFK8eUf+AvZYittnmLEXC+V3LkpnR4HSTHFchCLD6eTdUURIzflixDP3Wk3CSv/0s5PGB/JCsDJJV8wp2G+sKQuY/SnBK8i7+2SXvgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760410091; c=relaxed/simple;
	bh=G9tH+JtbxqLShzsNQzUUFvtnz5O4c0ExrGAfJFLW9bM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f19GqJDUsFHSlKBAGY+6IuNI3W6u9HFk8YKV9mKMKxT41FD8sOD0gCr2fw+P/ePXDyMHaAhJ3ezESCWivSh1FDXsyVWPVdw3h3P4jvqCUWoX2ZkIXndnT7tIJj0/xxSTUL95BSzE3hVX/l2//AnolZfLAKF1R9+xd16YR0/kTAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=101.71.155.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 117ea7788;
	Tue, 14 Oct 2025 10:47:58 +0800 (GMT+08:00)
From: Zhen Ni <zhen.ni@easystack.cn>
To: Frank.Li@nxp.com,
	vkoul@kernel.org
Cc: imx@lists.linux.dev,
	dmaengine@vger.kernel.org,
	Zhen Ni <zhen.ni@easystack.cn>
Subject: [PATCH] dmaengine: fsl-edma: Remove redundant check in fsl_edma_free_chan_resources()
Date: Tue, 14 Oct 2025 10:47:30 +0800
Message-Id: <20251014024730.751237-1-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99e09e0d4b0229kunm9eba912d36a9bf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTBkdVhoaTk4eSUofQ0tDSlYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+

clk_disable_unprepare() is safe to call with a NULL clk, the
FSL_EDMA_DRV_HAS_CHCLK check is reduntante. Clean up redundant checks.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
 drivers/dma/fsl-edma-common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 11655dcc4d6c..3007d5b7db55 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -884,8 +884,7 @@ void fsl_edma_free_chan_resources(struct dma_chan *chan)
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

