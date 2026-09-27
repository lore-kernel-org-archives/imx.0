Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755FE3D5221
	for <imx@lists.linux.dev>; Sun, 27 Sep 2026 11:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507514; cv=none; b=jX74JgItkqHxDHdL70mIAGk2csS6tCAhA/eWcBiLbWWY1UruAriaUi95ugVdOhISvgEDEKWO1iIPRXzCSl4O8BEsX3UpIxPMsSJ1RnoUo+dnqnfozIPtovmb8VcOQDlC7Ty0069fV3v3tZjsrI8587oUeUYgfwN5w520bYOoox4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507514; c=relaxed/simple;
	bh=HolQLVpDIvaICvH6EklsF3sLiuPfGnUvjiP6g7MUWaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CuG3wFKKZ77s2qJhq0qG/lhdqjuUBurT9M+DC4t2Gl0Wk+qwxFCu6Pcpb7p3wBYUjVyuR+KnFHRQ1j4rJY6D9SDdXaAaEE4rqQ/bcmH+xlH2UqE5oNsvc3RSrCDMpq00Ao6MCSlx/FV60E41C++4HSpUeFeu7bxh/Z3+vagEOcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Vl7Ygofv; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Vl7Ygofv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ax
	rklA1m8y12PQjg+uXAzie8haQnXslHN47pj2/k+qg=; b=Vl7YgofvKvEdpRMVqY
	YpxHzh8oCw1D4+khWC22SEaSj0PSEpQsqnY4407C16mtTqRXsj2UXBaU0JP43ogc
	QcrpesxaeUWKDBahhEPV990oLuspotgJaoYACqJ1H6MNwrs5/vqDkNAhoAlR6RyK
	/0nPra6DyrCoopuisUAHwPO9g=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3_92P+bhqB9V5BA--.4648S4;
	Sun, 27 Sep 2026 19:10:12 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Wei Fang <wei.fang@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/7] net: fec: manage the netdev lifetime with devres
Date: Sun, 27 Sep 2026 19:09:59 +0800
Message-Id: <20260927111005.1035089-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927111005.1035089-1-yaojiale02@163.com>
References: <20260927111005.1035089-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_92P+bhqB9V5BA--.4648S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFW3GF1ftw15JrW7uFy7trb_yoW8Wry5pF
	WDJay09rykGr17W3WDJr48AFy5C3y7t34DW3yxK3yfZ3s0yr1qgr1kXFWj9r4rZrW8uF1S
	gw4jvryfZ3Z8XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zNNtcXUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xRspmq4+ZT3eQAA3A

fec_drv_remove() frees the netdev before devres releases the managed
IRQs whose handlers use it as their data pointer. A late interrupt can
therefore access the freed netdev.

Allocate the netdev with devres so that the later IRQ registrations are
released first during teardown.

Fixes: 0d9b2ab1c376 ("fec: Use devm_request_irq()")

Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 794ec427b0ee..23e794a31ce8 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -5219,8 +5219,9 @@ fec_probe(struct platform_device *pdev)
 	fec_enet_get_queue_num(pdev, &num_tx_qs, &num_rx_qs);
 
 	/* Init network device */
-	ndev = alloc_etherdev_mqs(sizeof(struct fec_enet_private) +
-				  FEC_STATS_SIZE, num_tx_qs, num_rx_qs);
+	ndev = devm_alloc_etherdev_mqs(&pdev->dev,
+				       sizeof(struct fec_enet_private) +
+				       FEC_STATS_SIZE, num_tx_qs, num_rx_qs);
 	if (!ndev)
 		return -ENOMEM;
 
@@ -5480,8 +5481,6 @@ fec_probe(struct platform_device *pdev)
 failed_phy:
 	dev_id--;
 failed_ioremap:
-	free_netdev(ndev);
-
 	return ret;
 }
 
@@ -5522,7 +5521,6 @@ fec_drv_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	fec_enet_deinit(ndev);
-	free_netdev(ndev);
 }
 
 static int fec_suspend(struct device *dev)
-- 
2.34.1

