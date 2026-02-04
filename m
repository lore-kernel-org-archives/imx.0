Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C742F2914
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770196080; cv=none; b=ctHmYz+V1/9L4zcdUBVXJnliqt76c9j+TlQ0XVCKyZX+3UC6S6arkZuBz40tmD6rFboIHTlEKki6UT5b401p7InZTdbYYJmdMTd/WYJsxZVpVM8L3omenBFGpE9WpcJz6/XLOM+TyR+p/+wjQRCcVJqEV49B38M1sD8R2cSwAPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770196080; c=relaxed/simple;
	bh=FZTLP1KYKmcvJ0xf9LwZAFgwjJpgsCxJb+hTRIWwSzM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MA4/5MsfEbb+bbGYeBUtOtcuOJww08dZu/0vK/+ddCwYCZ9ZiAvXQbI+zENWAPkfO59ucNpSp3fTcVUIZBpTNhQxmfgsBU1d/lRmECoUgPvbNvmaZ+guYpSlqGa6DGnqDopSs/z3veXNe7pAv8l+p5HUcLTGo1VYKsiDQXEsVnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowABnD2tjDINpCwsgBw--.19519S2;
	Wed, 04 Feb 2026 17:07:47 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	luca.ceresoli@bootlin.com,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] drm/imx: parallel-display: check return value of devm_drm_bridge_add() in imx_pd_probe()
Date: Wed,  4 Feb 2026 17:06:29 +0800
Message-Id: <20260204090629.2209542-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnD2tjDINpCwsgBw--.19519S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF1UJFy3tF1DWF43Aw45trb_yoWkWrX_uF
	1j9F1rXFy5CFnFgr17Gw4fAryvvwn8uFWxAFn0gwsIqry5Aw43X39FvryDZrWxAw12yry5
	Gw1UGF47AFnrCjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTkFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRrsqAUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Return the value of devm_drm_bridge_add() in order to propagate the
error properly, if it fails due to resource allocation failure or bridge
registration failure.

This ensures that the probe function fails safely rather than proceeding
with a potentially incomplete bridge setup.

Fixes: bf7e97910b9f ("drm/imx: parallel-display: add the bridge before attaching it")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 6fbf505d2801..590120a33fa0 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -256,7 +256,9 @@ static int imx_pd_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imxpd);
 
-	devm_drm_bridge_add(dev, &imxpd->bridge);
+	ret = devm_drm_bridge_add(dev, &imxpd->bridge);
+	if (ret)
+		return ret;
 
 	return component_add(dev, &imx_pd_ops);
 }
-- 
2.25.1

