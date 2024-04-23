Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EEE13B582
	for <imx@lists.linux.dev>; Tue, 23 Apr 2024 14:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713882773; cv=none; b=O2LAJgqkyWhvX6xf9+JsELqqqSvPG/r+5hvPHda30joXZ6lEKYjG58NhTijXXfxz1oV1vw9wSCi48VkL66TaLKakCGVIQD49ErC6dfJ33VyUXhOivDFVJWwu8+CijWP3ICpMpNpy8viaM00pFprEKcHNQoSjQiKs6FrrCgGd4cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713882773; c=relaxed/simple;
	bh=rhanHVe3z+7fCFfPykj623sG54XyU9274IQHaPm11Hk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B3ATOdrwY1dBIdMhyfjjZePICO9D422zXm/Tjhj523GKT68puVW8Ukt6BVeL1Jqmc5wJxD+izezba4P1QAoYV3nCW8vdgZGVRtM6asuAwiA2CUW8Ar/WAEyfeAd44xtgzDPzle7+moPZ+1AnQarCAOcmWW+lnTZLYg4gNqOLkRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YHarZTkS; arc=none smtp.client-ip=45.254.50.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YHarZTkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ARYwg
	qGlUlLRaTcXZttU9ahIzTed8W0mvg6q9Al2vLc=; b=YHarZTkSNPVFAAlOYA/VX
	hz/5+Eg9eOOB/qA9I5n9lhnyqWS7VbTbE4bLK9Q5LjV/ftbFm90jSXAUU0wRRMZh
	G7LZcOohnXtzOfX6MkMBadDP0ZXohHWhP4xo+MvhGEfEY//Fu1raOf9eTJ6fKIb9
	qlkwU/ODkqDcAL7IBZM1nE=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wD3P65oxidmlQBkCA--.58334S4;
	Tue, 23 Apr 2024 22:32:17 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: vkoul@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make_ruc2021@163.com>
Subject: [PATCH] dmaengine: mxs-dma: Add check for dma_set_max_seg_size()
Date: Tue, 23 Apr 2024 22:32:05 +0800
Message-Id: <20240423143205.1420976-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P65oxidmlQBkCA--.58334S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw43ZF43Xw47Xw4kAF4rAFb_yoWfKFX_Z3
	WUurn3XFn8Wr4rtw13KrsxAw4IqF9IgFZ7uF13tayftr17uFnaqr4DZrykXry8Za17CFWq
	934UXrWSvr4DujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNkucJUUUUU==
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbizRLJC2V4G40UqwAAsp

To avoid the failure of dma_set_max_seg_size(), we should check the
return value of the dma_set_max_seg_size().

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/dma/mxs-dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index cfb9962417ef..90cbb9b04b02 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -798,7 +798,9 @@ static int mxs_dma_probe(struct platform_device *pdev)
 	mxs_dma->dma_device.dev = &pdev->dev;
 
 	/* mxs_dma gets 65535 bytes maximum sg size */
-	dma_set_max_seg_size(mxs_dma->dma_device.dev, MAX_XFER_BYTES);
+	ret = dma_set_max_seg_size(mxs_dma->dma_device.dev, MAX_XFER_BYTES);
+	if (ret)
+		return ret;
 
 	mxs_dma->dma_device.device_alloc_chan_resources = mxs_dma_alloc_chan_resources;
 	mxs_dma->dma_device.device_free_chan_resources = mxs_dma_free_chan_resources;
-- 
2.37.2

