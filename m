Received: from mta0.migadu.com (out-85.mta0.migadu.com [91.218.175.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E28044CADC
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 11:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434403; cv=none; b=Z2A0ALBbzvupooED5GDLWYHbSVZqQTIu/tSrBTtub6sSTyLMaMVR0Y2mqHyqN15E1ETxzXrOVIqChRe6QIdhFUg2bXbKMO9f1Oviq+OaP6/qklEIYfqEkJiSLr504AshGT19tB7rIQxp4MBAu+cGnsVLlU6kzQmCtS0Uu5T6lC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434403; c=relaxed/simple;
	bh=ibBI7TTPWT18sm5kWAI8gRRDutRKACx4sAMOTHBLpoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=ButLJJNHwu1ui3jzpp+hJCayim1Syr2HX9XhpjEf4SWiU+muHT6yxglpgTb91epvEg6kN/lP2dKRwExMAaVTvbIc+eDv5lFPUfWtwl+qhKECvlzy8BKtAnR7mAl/gPWoDiOgY2mG/hOaJEvB48bDOwMjSKX3FsMpMU8GensecpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: imx@lists.linux.dev
X-Envelope-To: imx@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id c7b7b7d9b31ed531;
	Thu, 03 Sep 2026 11:19:51 +0000
X-Mizu-Trace-ID: c7b7b7d9b31ed531
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hch@lst.de,
	harry@kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>,
	imx@lists.linux.dev
Subject: [PATCH 11/13] media: nxp: imx8-isi: Don't use GFP_DMA when calling dma_alloc_coherent()
Date: Thu,  3 Sep 2026 19:18:34 +0800
Message-ID: <20260903111836.1777265-12-hebaoquan@kylinos.cn>
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
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index f45c2aae59ce..fc907d357149 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -773,7 +773,7 @@ static int mxc_isi_video_alloc_discard_buffers(struct mxc_isi_video *video)
 
 		buf->size = PAGE_ALIGN(video->pix.plane_fmt[i].sizeimage);
 		buf->addr = dma_alloc_coherent(video->pipe->isi->dev, buf->size,
-					       &buf->dma, GFP_DMA | GFP_KERNEL);
+					       &buf->dma, GFP_KERNEL);
 		if (!buf->addr) {
 			mxc_isi_video_free_discard_buffers(video);
 			return -ENOMEM;
-- 
2.54.0

