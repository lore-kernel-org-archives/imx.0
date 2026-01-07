Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEC83148AC
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779827; cv=none; b=aLCLiC/9Le1/QvofsRaYrnjYs90RYh8d+bsoQ9AThq+2nCosnkmr/SZSHp0g1+Gjh4Kcm2a8J0CKuTF/G5mPunQV3caV6hJptilTZAQOZAEPcDaZotgB1ze2z/R+ZD1GRVfngxkaLNqAk+hwIAzU9kI1NX7kURShSdWbPqfspwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779827; c=relaxed/simple;
	bh=GnD/10b+8eRTbFi7EEfQ4yX6GWkn0KdClBqUxuPEWNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oW0W7qv0ScRBs37dwwQ7v9ewXnGF6dg/GvqZIABEBhZZvEFE46nj79XMKL4/wKdPiddNlzGeuNAjZqXQKyuj39e5gv44B2rcfCYHlmX35o+7ZCPM+1zc3a+wBfm9g+UHRCtOZIDkCnrVpc0NPiA5dDAgsidVs/GWlb3/Bxq/pYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Wkh0MxEN; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Wkh0MxEN"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A70191A26DE;
	Wed,  7 Jan 2026 09:56:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D380606F8;
	Wed,  7 Jan 2026 09:56:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5CBF103C8711;
	Wed,  7 Jan 2026 10:56:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767779817; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wS6YbhsKzRZdVKVOke4vSg+5H3aJM7c2KrQk8UTxBXw=;
	b=Wkh0MxENAKkZZ27YuXWGx4Ou6jdTB9dvCKXtlNkRjx3mNk7mn0Aoi4o8AqWlOHvRuFNUJW
	9qrq1Pn/jiUdEC3vIsf9waYkl/1qJqrbbNp7nSGsP4H5Hycr7/BpoDi5dql8ttUZrmiUxM
	5rm0rCQ8PPdyhyiNkm26ZFGi/ob47H9zRyNL65I9SJPTDFm78Qqj0jSvKPZIt3XnBMMDlM
	EXcD9E3O7x6FQ4BF8fHj+cOxPgvDH4VqETdfMzK85t0dp28r/h+0lt7YBDlei8FsLxIStf
	lBeK1hB7n64XD+LALMhLaxmG7jHz3J32c5UqlNKyc9ScZ7StpxiU+sUyu/5ATA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 10:56:26 +0100
Subject: [PATCH v4 1/4] drm/bridge: imx8qxp-pixel-link: simplify logic to
 find next bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-1-a62b4399a6bf@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

imx8qxp_pixel_link_find_next_bridge() uses a sophisticated logic to find
the preferred next bridge, using an array with two supporting index
variables. This is more sophisticated than required because we only ever
need a pointer to the "current" bridge and to the "best so far" bridge.

Additionally this logic is going to make the addition of proper refcounting
quite complex.

Rewrite the logic using two drm_bridge pointers, which is by itself
slightly simpler and is a preparation step for introducing bridge
refcounting in a later commit.

Also reword a comment to make it clearer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 433c080197a2..4f84825fddca 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -261,12 +261,10 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
 	struct device_node *port, *remote;
-	struct drm_bridge *next_bridge[PL_MAX_NEXT_BRIDGES];
+	struct drm_bridge *selected_bridge = NULL;
 	u32 port_id;
 	bool found_port = false;
-	int reg, ep_cnt = 0;
-	/* select the first next bridge by default */
-	int bridge_sel = 0;
+	int reg;
 
 	for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
 		port = of_graph_get_port_by_id(np, port_id);
@@ -300,24 +298,25 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			continue;
 		}
 
-		next_bridge[ep_cnt] = of_drm_find_bridge(remote);
-		if (!next_bridge[ep_cnt]) {
+		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
+		if (!next_bridge) {
 			of_node_put(remote);
 			return ERR_PTR(-EPROBE_DEFER);
 		}
 
-		/* specially select the next bridge with companion PXL2DPI */
-		if (of_property_present(remote, "fsl,companion-pxl2dpi"))
-			bridge_sel = ep_cnt;
-
-		ep_cnt++;
+		/*
+		 * Select the next bridge with companion PXL2DPI if
+		 * present, otherwise default to the first bridge
+		 */
+		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
+			selected_bridge = next_bridge;
 
 		of_node_put(remote);
 	}
 
 	pl->mst_addr = port_id - 1;
 
-	return next_bridge[bridge_sel];
+	return selected_bridge;
 }
 
 static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)

-- 
2.52.0

