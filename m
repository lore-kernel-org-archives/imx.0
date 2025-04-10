Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E93020E334
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744327380; cv=none; b=A+2cWl/69kPiSOgCu+I5EMD5DYGqC5+CLSyZgMc+qJ25iuYIhaq6TPraViRWvVhNgwTb6Hvyr8NaU9tsb1u4y7c9lkDJK27t148kVNl8IDsnS6RR7V74aLViU4W8SGtup3REk3hl8AYk/x9a4JY8j997LYwgSQquuLuZ5OPmO+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744327380; c=relaxed/simple;
	bh=UuvVdBxxYx1MeEhGMp0WsJfZf020E/Pc7oVn28z/1ms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OxtU2vx5iMNCUeUdYkp7V043tPteJUaUDGP1W0QmwBXzvtuP7XTF+3Kr2UKBqthN12LmkgT+aa8oXxnFKS+iyydUvjWUbKvVpkMNTHcRxt8XipD1rQ2+2JMGCsEEwl2eVOuHAThdU/dRLV+U4KMLXh/YdVMqX6gZmtuJJYyVlZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1u31EV-0003vb-7N; Fri, 11 Apr 2025 01:22:55 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: kernel@pengutronix.de,
	"vkoul@kernel.org, shawnguo@kernel.org, Sascha Hauer" <s.hauer@pengutronix.de>
Cc: dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] dmaengine: imx-sdma: sdma_remove minor cleanups
Date: Fri, 11 Apr 2025 01:22:37 +0200
Message-Id: <20250410232247.1434659-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410232247.1434659-1-m.felsch@pengutronix.de>
References: <20250410232247.1434659-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

We don't need to set the pdev driver data to NULL since the device will
be freed anyways.

Also drop the tasklet_kill() since this is done by the virt-dma driver
during the vchan_synchronize().

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 699f0c6b5ae5..9e634cbc1173 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2424,11 +2424,8 @@ static void sdma_remove(struct platform_device *pdev)
 	for (i = 0; i < MAX_DMA_CHANNELS; i++) {
 		struct sdma_channel *sdmac = &sdma->channel[i];
 
-		tasklet_kill(&sdmac->vc.task);
 		sdma_free_chan_resources(&sdmac->vc.chan);
 	}
-
-	platform_set_drvdata(pdev, NULL);
 }
 
 static struct platform_driver sdma_driver = {
-- 
2.39.5

