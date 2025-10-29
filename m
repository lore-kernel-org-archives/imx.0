Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80646354AF6
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 18:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761761037; cv=none; b=nZTlIF6R5Yq9H5lvmTK3in73YinsnF6SeTEn5eawzuGaldrJg9oUBoAxaZ1RfcUh/xSTE/kJsA3MCORVIF6HIEyMsoKDuVfCHbHpERnz5oFfYiWUofvx2YZepRf5dhk4jwC8AsMoTlaZaD2XZYLxzIjSYIhsTj25Po+ZtEYRIFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761761037; c=relaxed/simple;
	bh=C/Cbo20GJtUaPO+g6V4e4dxzNswEm9oCubEV2G/4xwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmORU0TkE9uSBjGyH1iE14OSpdT3LQdIesFIR0fyjTyH8U8KsfLLitxisRUzKkQmC0r7b71a7EiPKyZgHqbGju1hNy7Rtzef5IUVbeWekuXzg4dGxKDMzTLApUbiclkD7t3aPBm1OACX2QWRWAu2XN1kD4RFwhm8MVA4xdMGYjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Og+bquE3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Og+bquE3"
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C66FF4E45;
	Wed, 29 Oct 2025 19:01:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761760919;
	bh=C/Cbo20GJtUaPO+g6V4e4dxzNswEm9oCubEV2G/4xwA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Og+bquE36VrebpPyoAcH64sRciI0I38y1kbpS/xCbXGCwEweP22GOH5Itv0wh1rXk
	 BA8/hy00VVkEYegc0/K2+OpeiAz3RPTIAqXBgkkfplM7qu3JH2JNsLRb0v0wGf9Zbz
	 kQ2ndFbrlToMfRzMAa9qFjHFns4a5LtjaJuhYtU8=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: mchehab@kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v6 2/4] media: imx-mipi-csis: Move redundant debug print in probe
Date: Wed, 29 Oct 2025 18:03:19 +0000
Message-ID: <20251029180321.153680-3-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029180321.153680-1-isaac.scott@ideasonboard.com>
References: <20251029180321.153680-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of data lanes is already printed as part of
mipi_csis_async_register(), making the first part of this print
redundant. Remove the redundant print, and move the debug print for
clock frequency to mipi_csis_parse_dt().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index d5de7854f579..7c2a679dca2e 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1481,6 +1481,7 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
 	struct device_node *node = csis->dev->of_node;
 
 	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
+	dev_dbg(csis->dev, "clock frequency: %u\n", csis->clk_frequency);
 
 	csis->num_channels = 1;
 	of_property_read_u32(node, "fsl,num-channels", &csis->num_channels);
@@ -1566,9 +1567,6 @@ static int mipi_csis_probe(struct platform_device *pdev)
 			goto err_unregister_all;
 	}
 
-	dev_info(dev, "lanes: %d, freq: %u\n",
-		 csis->bus.num_data_lanes, csis->clk_frequency);
-
 	return 0;
 
 err_unregister_all:
-- 
2.43.0

