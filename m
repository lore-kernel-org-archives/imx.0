Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E040F3CC33F
	for <imx@lists.linux.dev>; Fri, 22 May 2026 10:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445100; cv=none; b=tNEzsKIq8eDHS9h3xHF+vgiqmGYD60iaExsb8tkITzYvIcA8JTH702LAUEMagSjT8jvvb56q/bTVK8MjLs6OXs0UH7ieYR2m+sxUZwbQXh+p+vyndiP/sF23nFKN0IxjOPSRF9TiqeZm1kdOlbkJJvZxcNji6c+wEA+ecGuWdVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445100; c=relaxed/simple;
	bh=x/6Zg3Wi00xuQO62fUSq4YsyxLHa2RWNHXpPt0DMNDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lUVnAEiXN+GKcF8d7H1XAybE77UJXJSFLcamFVLfj//1CPlMpLjWFSBBI+jZRz4JtJlkcpntgrmxtEmZMWAPEK720q6aHK/LZqz1gh07mmuYTl/u/cAbHdp9XgKShduJNRJbrkMLRLM4kH0QZ74gN+33Zmil/IiI0oI+dZdeCjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 32E9937002A5
	for <imx@lists.linux.dev>; Fri, 22 May 2026 10:18:00 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 7503EB408D8; Fri, 22 May 2026 10:17:55 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 1FC35B408CF;
	Fri, 22 May 2026 10:17:09 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 10/14] media: hantro: use hantro_decoded_buffer only for dst_vq
Date: Fri, 22 May 2026 12:16:49 +0200
Message-ID: <20260522101653.2565125-11-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marco Felsch <m.felsch@pengutronix.de>

The dst_vq buffer size for encoders should not use the size of the
'hantro_decoded_buffer'. Make use of 'v4l2_m2m_buffer' instead till some
encoder requires pre buffer extra data.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index e21306f2bf2e..6f72e25fa88c 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -248,7 +248,10 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->ops = &hantro_queue_ops;
-	dst_vq->buf_struct_size = sizeof(struct hantro_decoded_buffer);
+	if (ctx->is_encoder)
+		dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	else
+		dst_vq->buf_struct_size = sizeof(struct hantro_decoded_buffer);
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &ctx->dev->vpu_mutex;
 	dst_vq->dev = ctx->dev->v4l2_dev.dev;
-- 
2.53.0

