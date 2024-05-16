Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D2F143895
	for <imx@lists.linux.dev>; Thu, 16 May 2024 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715855154; cv=none; b=Y+mF5Y7pSdXeGLZ1BdhUI4l6uBPspvYQucVggoEqujxpuiRYHR64kbcTCfukcRZngfGzu4QPvryP2Otsv84TLDzQuKM79KR5EfHqJbk10HRDhUxQFLXxyjADUXcG9Mjpg6G1k/oBJQegIzpv26mJyqs1yXbFaDHrrpTI8v8x1xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715855154; c=relaxed/simple;
	bh=Fi/3Std58Ou4oxdk4xv5fAxp4eTJlp6AyhxONtEIpxE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OAjHDa8wGZYeiIaTe/W3TKvk7nBfYIfB4TuA6H1q9+lp3ErZ5mR/r1o+O6sDcdZWY6jip0kWVvFcmoc9uOuMsj+SbfMWmW6CDY83AGqaoC6P6elgEmF79a82ZPh7wklOs7M4tg5xLnIABi4C2w3bRrnlHOrbCWKgJAAFpAp6sk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s7YIn-0003dH-Lb; Thu, 16 May 2024 12:25:33 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s7YIm-001h9D-OD; Thu, 16 May 2024 12:25:32 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Vinod Koul <vkoul@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	patchwork-lst@pengutronix.de
Subject: [PATCH 2/2] dmaengine: imx-sdma: don't print warning when firmware is absent
Date: Thu, 16 May 2024 12:25:32 +0200
Message-Id: <20240516102532.213874-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516102532.213874-1-l.stach@pengutronix.de>
References: <20240516102532.213874-1-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The SDMA firmware is optional and a usable fallback to the internal
ROM firmware is present in the driver. There is already a message
printed informing the user that the internal firmware is used, so
there is no need to print a scary warning for what is normal operation
on most systems.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v3:
- v2-link: https://lore.kernel.org/all/20181112160143.4459-1-l.stach@pengutronix.de/
- Adapt to new firmware_* API
---
 drivers/dma/imx-sdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 9b42f5e96b1e..b94aef57c2c0 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2057,9 +2057,8 @@ static int sdma_get_firmware(struct sdma_engine *sdma,
 {
 	int ret;
 
-	ret = request_firmware_nowait(THIS_MODULE,
-			FW_ACTION_UEVENT, fw_name, sdma->dev,
-			GFP_KERNEL, sdma, sdma_load_firmware);
+	ret = firmware_request_nowait_nowarn(THIS_MODULE, fw_name, sdma->dev,
+					GFP_KERNEL, sdma, sdma_load_firmware);
 
 	return ret;
 }
-- 
2.39.2

