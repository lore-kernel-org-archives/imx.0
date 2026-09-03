Received: from mta0.migadu.com (out-79.mta0.migadu.com [91.218.175.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E4B42048D
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 11:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434392; cv=none; b=u7bz2Ob30lTPkxXJm+YLk3xsPABpfH5gO367p+o5lH2RqgotPB6zIG9aIt2qYhOuUPzZqlFXYmTIsmrGIZCxYjw0zJqpkTj7m5QjnOIYMXVnJFhqwpQJ+Md+vUw2YlAWREIMo4SJlpV6SdEV4ZjAK4Y7Ph0wIKqZmSJOs6MXFHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434392; c=relaxed/simple;
	bh=0BqJqH2oy9r9MaltP61gqDnvQNsL7LwNGyFvlSV10/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Ur49fE7AGUM5I/eNFNmKysgXaWmKbr34hrVvWZXHb1tUlWJ2Auw9/WzhAzXQFCBlYfpWabxx6VazcKV/DwkqTd87gUOmz6Ue5049ukCeC/lXFuLVqHg+MNYAEeuZSReix40VRKxzXjL2V7tPk1EZYqAZkD6QPZFXeazx2BDhEn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: imx@lists.linux.dev
X-Envelope-To: imx@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id c1913d8d0fec3ae8;
	Thu, 03 Sep 2026 11:19:43 +0000
X-Mizu-Trace-ID: c1913d8d0fec3ae8
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hch@lst.de,
	harry@kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>,
	imx@lists.linux.dev
Subject: [PATCH 10/13] media: imx7-media-csi: Don't use GFP_DMA when calling dma_alloc_coherent()
Date: Thu,  3 Sep 2026 19:18:33 +0800
Message-ID: <20260903111836.1777265-11-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903111836.1777265-1-hebaoquan@kylinos.cn>
References: <20260903111836.1777265-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

dma_alloc_coherent() allocates the DMA buffer with the device's
addressing limitation in mind; the DMA core picks the zone from the
device's coherent DMA mask and ignores GFP_DMA passed by the caller.
Remove the redundant GFP_DMA flag.

Cc: imx@lists.linux.dev
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 7ddc7ba06e3d..22c0cbdc92bf 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -466,7 +466,7 @@ static int imx7_csi_alloc_dma_buf(struct imx7_csi *csi,
 
 	buf->len = PAGE_ALIGN(size);
 	buf->virt = dma_alloc_coherent(csi->dev, buf->len, &buf->dma_addr,
-				       GFP_DMA | GFP_KERNEL);
+				       GFP_KERNEL);
 	if (!buf->virt)
 		return -ENOMEM;
 
-- 
2.54.0

