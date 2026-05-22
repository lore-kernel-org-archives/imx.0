Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78D53CC7CE
	for <imx@lists.linux.dev>; Fri, 22 May 2026 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445094; cv=none; b=PF5plnxqbamHEDjgup9+i/n78Usp0ChFydvl1RNx2j/G6s+TdjFTMr4D5TSk7NovVVCkM73JP/ofeBCEAJvdH6Wu77NDuILXRkPVo+tAs5QO+RvWWdqqP/hvMqcGZ3UQbasQqwgP8Hd6jrQ+SjwhOERGCuBesLVau3EhEieX7EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445094; c=relaxed/simple;
	bh=H4ahuP7qK6F1laIsAeO9Wq5rgaRo+/IalAB1WKxGgjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohKhLXBnCcnoOTyUcoQ5QCZBccSF2LW3hljQAejT97CWze2A9zJixsa4yTPttM+HxenKA9uKahmC3iPKCdSLPCsAsKmbCCD5aULH+zfOdmVaOSWCnRjonjKhYtOcqqaHBMviJFUpQa7VxkQH/zYLhZO+zj0bZZ4eiCP/H5DUHxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 9E117370029C
	for <imx@lists.linux.dev>; Fri, 22 May 2026 10:17:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 16C74B408D7; Fri, 22 May 2026 10:17:54 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id A4C02B408C9;
	Fri, 22 May 2026 10:17:08 +0000 (UTC)
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
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 09/14] media: verisilicon: Cancel job with runtime pm put/clk disable on failure
Date: Fri, 22 May 2026 12:16:48 +0200
Message-ID: <20260522101653.2565125-10-paulk@sys-base.io>
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

The no-pm variant of hantro_job_finish is only good to use directly if
runtime pm get failed. In other cases, we need to do a runtime pm put
and bulk clk disable to correctly undo what was set up.

Fixes: 892bb6ecead9 ("media: hantro: do a PM resume earlier")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/platform/verisilicon/hantro_drv.c   | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index e0c11fe8b55c..e21306f2bf2e 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -169,29 +169,34 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 static void device_run(void *priv)
 {
 	struct hantro_ctx *ctx = priv;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
 
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
 
-	ret = pm_runtime_resume_and_get(ctx->dev->dev);
+	ret = pm_runtime_resume_and_get(vpu->dev);
 	if (ret < 0)
-		goto err_cancel_job;
+		goto err_cancel_job_no_pm;
 
-	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
+	ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
 	if (ret)
-		goto err_cancel_job;
+		goto err_cancel_job_pm;
 
 	v4l2_m2m_buf_copy_metadata(src, dst, true);
 
 	if (ctx->codec_ops->run(ctx))
-		goto err_cancel_job;
+		goto err_cancel_job_clk;
 
 	return;
 
-err_cancel_job:
-	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+err_cancel_job_clk:
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+err_cancel_job_pm:
+	pm_runtime_put_autosuspend(vpu->dev);
+err_cancel_job_no_pm:
+	hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {
-- 
2.53.0

