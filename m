Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51723C7E07
	for <imx@lists.linux.dev>; Wed, 27 May 2026 08:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869502; cv=none; b=Mix+bbt6u53F2Csk7uCyjmGDRXTGCIQd3xiqDJKoYLa7X3g+j/1zlHv898eW3teTc8x/aP+lvz1+EyXLAJisRJ2i1lyu+3aocnIu1WEOQfspFjIcN/IuZ/E1Pe06VMhQU40z5QNfGmzUHIS0fuiSkaOreYqpLeX17XMFGDWLALs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869502; c=relaxed/simple;
	bh=W0kvwb9oYI7nmafkyR4U8Vul+N3DYx3OERr2MYEtH+w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U5Ds3bzigIDsXG0CyVVIQch5ak8ybvGdJobe1gELbEWj7a9bS5HFNSpy8pPhJPy42X1h/OdhUM+pUx8uKGE/U1D63NQ9B94dn2ttM3Aoj+lsb9O3pJ2Rdzjh4O48QLun8RopavtIPG+A4kPRySfuTv47Z9EdVtdLPEZKORfJ+j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=bRBsSZFs; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="bRBsSZFs"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4001c3292;
	Wed, 27 May 2026 16:06:26 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: mchehab@kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Frank.Li@nxp.com,
	martink@posteo.de,
	rmfrfs@gmail.com,
	kernel@puri.sm,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	stable@vger.kernel.org,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] media: imx8mq-mipi-csi2: fix memory leak in imx8mq_mipi_csi_probe()
Date: Wed, 27 May 2026 16:06:24 +0800
Message-Id: <20260527080624.1717938-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e6878795a03a2kunmfa06458432849
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQh0dVh5ITEpOHkxLSE4aTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJSE
	5DQ1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=bRBsSZFszClz8dqsA7AGBJppPnp7fWke1w0tluA+26XTIxjYs+d8dTxAVzw+3pc6tiUY8xvlmReUh1t7yuNOCNpTVQFLLoQm+mXHwmjC9IVFK2W5sb2Ni7snC/rNg95oVgSQzedjjMoJ9p8VmxogeJQdZVlotcNMHZpdMK9VTeQ=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=u8Wo8LLSY0pPyy+dyeSotUY0OkUOTz16hb7bl4GVtIM=;
	h=date:mime-version:subject:message-id:from;

If imx8mq_mipi_csi_init_icc() or imx8mq_mipi_csi_runtime_resume() fails
after subdev initialization, the function fails to release the
corresponding resources, leaking the subdev state and media entity.

Fix this by introducing a dedicated subdev cleanup label and routing the
affected error paths to it. This reordering is safe as the consolidated
label chain preserves the correct sequence without affecting other
execution paths.

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing
v6.13-rc1. The tool is still under development and is not yet publicly
available. Manual inspection confirms that the bug is still
present in v7.1-rc5.

An x86_64 allyesconfig build showed no new warnings. As we do not
have suitable i.MX8MQ MIPI-CSI2 hardware to test with, no runtime
testing was able to be performed.

Fixes: cd063027c304 ("media: imx: Unstage the imx8mq-mipi-csi2 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 04ebed8a0493..e5a062cc0788 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -1016,7 +1016,7 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 
 	ret = imx8mq_mipi_csi_init_icc(pdev);
 	if (ret)
-		goto mutex;
+		goto subdev;
 
 	/* Enable runtime PM. */
 	pm_runtime_enable(dev);
@@ -1036,13 +1036,14 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	imx8mq_mipi_csi_runtime_suspend(&pdev->dev);
 
-	media_entity_cleanup(&state->sd.entity);
-	v4l2_subdev_cleanup(&state->sd);
 	v4l2_async_nf_unregister(&state->notifier);
 	v4l2_async_nf_cleanup(&state->notifier);
 	v4l2_async_unregister_subdev(&state->sd);
 icc:
 	imx8mq_mipi_csi_release_icc(pdev);
+subdev:
+	media_entity_cleanup(&state->sd.entity);
+	v4l2_subdev_cleanup(&state->sd);
 mutex:
 	mutex_destroy(&state->lock);
 
-- 
2.34.1

