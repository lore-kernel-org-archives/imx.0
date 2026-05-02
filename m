Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30CE13D51E
	for <imx@lists.linux.dev>; Sat,  2 May 2026 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777722957; cv=none; b=g5ll3Nc327YALVZucyzIeqkTUAULJIT/3/pAsPgh8KVLvxIswL219dUV3sheJAFija9lrKXzDAgCx5Fdji5D5Hcw3Chr53oHM2FjQHy1DAlMiChmDg9RnbZ3Lvu73yRxr6MEJ4MSH+fOzaUru+fKLi1hbB3C2npwELn3i/oKB4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777722957; c=relaxed/simple;
	bh=ukA8Li2hr5tYPQA6gEHOkrrU1Q0/VLBNSU8rcMwrk4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZbFhISY0YlY+RsZAcZi6OBXqXsxDMFx/hoHwFE0+z4KAMkLmfyk58gshlARUC1wvJUSYl9GEVq6ryRh7rDhVnhcDlXvYbXU2fU0szvVZGZj72AlTXNVj9lwGWjsR2cu3fEz6N/QWQHt0bm9Z/PY1cEWnNaCXoUCytPLKQzBRcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VALuSmAj; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VALuSmAj"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82f68b3aaf7so1127221b3a.0
        for <imx@lists.linux.dev>; Sat, 02 May 2026 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777722956; x=1778327756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xG+dopoE7tyttQuw5xxPLAnkXqhbsfbklISoHSefbCs=;
        b=VALuSmAj48sn6ie4i8NhtDKe5X8/RuBRwxbBJVfxwumhO0MrWrYeDaivkPgVJ/l+Fa
         oZ3V940jllGHngx+XnVMsb7KdV10baBt6p1I0051nsDxAbEvyue7hj+WHAuWqxrYhdGP
         wgvZqcV6Skki22rvHVR9xKY57NSvvC5SgLFZAVo29ibEkq2aQg61fwaW+zGePOJ/ffTZ
         Ihe6wh4W78jI8yQMdQKBG+pdO6kn3pZIPgnXZKJwo0OvuZHFmPqucEY3w221Wgo/geGs
         rrUL+7kDSDYJanVh11HdcmkfBJK0FCR78Bp+QbGImIBT8WJJkIn827QMeVOiwkd1aeXQ
         YW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777722956; x=1778327756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xG+dopoE7tyttQuw5xxPLAnkXqhbsfbklISoHSefbCs=;
        b=CV7V1yvaV9vY/FvxM+sQcH53Nb355M/Lo03JWLtEVQvJKJAZe4XgimrfXGTcgrjLKf
         0ICzjhlyPsW+ouC0RZNx4j+92gNJtG5yNipgxJZILYgA65wKQ/KUwFH+MUkuh0ag1dFk
         tMqDs7yvdWOFl897LMMpU2wJMdUaj1ai5jFjg/Mi1W2Bc7lGjLsY8NGRL2ClIFTwZf24
         Co7FuXb2nPZt57TJhXYQLd1NNux9mtir4tehTlk7knjWMoTiVsWaWwQaiQwiu5Wfa8YF
         C4BZewIe+B7DI6/ThcMQl/+PnsXMFV15Je0gJM5BdELHehSbG4wpuVAIWrqlT9h/dX0b
         xK3g==
X-Forwarded-Encrypted: i=1; AFNElJ9wBv1PnWSrFaGY/YBur4pa6BTpl2QpXZHhPb/OqwX5rwKON7e3NB3ADAzttKfzggwxIF4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFbUb378smEIAhGj732LdfKTTgPFFy9zM/eBmWmYNHkvSm8LRs
	/Sa2dP9anI1PTpO/Ra7G+WMQI6UAbndc2mKvJknSy3TGht9u9TySHn1H
X-Gm-Gg: AeBDieunwRHbMGoyFPIDTmWfF/THCqt0UHTNYqqRCXsORkVgtr0MiWCf81s2MTpRBU/
	peO66KfFasDlyA40fMTxpxxCuBYwZ6V6GJLtC/8wZu67+4fe+m9jrGhHABqb8XAPMlxf1aMSCBg
	gh5bZ1VxVTz54PQ6PXIgzDRarb0VXAEwP/8C7WhGeMZfjBbm0dA8JIwaCp0OURrAAIIDWNU2u2g
	uck28ILSm6rV6AjBNHZVGXVRFzqxlLAxIoE6iUwf2S5nzRLgXclwSvN+pBrw9HA2mjrxVntAuHL
	yZW1kS8zcf/9kDjai7alDa0RL0drWs+4P0aldbx3PShb0jna03oREzdqECUB0KjvFR3UpSkJYpr
	kGor82FC2kRSvz/gcO79NdRrLQYfFp55xeUmsJIfuq0FW1682issmsDzO6Nry7/layXrUmaeNT4
	aXounsgF4Ghsa522mey3ifxou5
X-Received: by 2002:a05:6a00:2d10:b0:82f:96ab:e011 with SMTP id d2e1a72fcca58-8352d2f802emr2803655b3a.37.1777722955971;
        Sat, 02 May 2026 04:55:55 -0700 (PDT)
Received: from lgs.. ([101.36.109.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b01a4asm5307663b3a.43.2026.05.02.04.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 04:55:55 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with device_node cleanup
Date: Sat,  2 May 2026 19:55:28 +0800
Message-ID: <20260502115528.530401-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx8qxp_pxl2dpi_get_available_ep_from_port() returns ERR_PTR()
on errors. imx8qxp_pxl2dpi_find_next_bridge() stores its return
value in a __free(device_node) variable before checking IS_ERR().
When the function returns on the error path, the cleanup action calls
of_node_put() on the ERR_PTR() value.

Do not let a device_node cleanup variable hold error pointers. Return
the error code from imx8qxp_pxl2dpi_get_available_ep_from_port()
directly and pass the endpoint node through an output argument. This
keeps the cleanup action operating only on NULL or a valid device_node,
while preserving the existing error codes.

This issue was found by a custom static analysis tool.

Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v3:
  - Do not change DEFINE_FREE(device_node, ...).
  - Fix the driver pattern by making
    imx8qxp_pxl2dpi_get_available_ep_from_port() return an int and
    pass the endpoint via an output argument.
  - Update both callers so __free(device_node) never holds ERR_PTR().

v2:
  - Fix DEFINE_FREE(device_node, ...) directly.

 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 55 +++++++++-----------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 441fd32dc91c..a82f10218707 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -222,52 +222,52 @@ static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
 			imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts,
 };
 
-static struct device_node *
+static int
 imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
-					   u32 port_id)
+					   u32 port_id,
+					   struct device_node **ep)
 {
-	struct device_node *port, *ep;
+	struct device_node *port __free(device_node) =
+		of_graph_get_port_by_id(p2d->dev->of_node, port_id);
 	int ep_cnt;
 
-	port = of_graph_get_port_by_id(p2d->dev->of_node, port_id);
+	*ep = NULL;
 	if (!port) {
 		DRM_DEV_ERROR(p2d->dev, "failed to get port@%u\n", port_id);
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	}
 
 	ep_cnt = of_get_available_child_count(port);
 	if (ep_cnt == 0) {
 		DRM_DEV_ERROR(p2d->dev, "no available endpoints of port@%u\n",
 			      port_id);
-		ep = ERR_PTR(-ENODEV);
-		goto out;
+		return -ENODEV;
 	} else if (ep_cnt > 1) {
 		DRM_DEV_ERROR(p2d->dev,
 			      "invalid available endpoints of port@%u\n",
 			      port_id);
-		ep = ERR_PTR(-EINVAL);
-		goto out;
+		return -EINVAL;
 	}
 
-	ep = of_get_next_available_child(port, NULL);
-	if (!ep) {
+	*ep = of_get_next_available_child(port, NULL);
+	if (!*ep) {
 		DRM_DEV_ERROR(p2d->dev,
 			      "failed to get available endpoint of port@%u\n",
 			      port_id);
-		ep = ERR_PTR(-ENODEV);
-		goto out;
+		return -ENODEV;
 	}
-out:
-	of_node_put(port);
-	return ep;
+
+	return 0;
 }
 
 static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 {
-	struct device_node *ep __free(device_node) =
-		imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
-	if (IS_ERR(ep))
-		return PTR_ERR(ep);
+	struct device_node *ep __free(device_node) = NULL;
+	int ret;
+
+	ret = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1, &ep);
+	if (ret)
+		return ret;
 
 	struct device_node *remote __free(device_node) = of_graph_get_remote_port_parent(ep);
 	if (!remote || !of_device_is_available(remote)) {
@@ -287,26 +287,23 @@ static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 
 static int imx8qxp_pxl2dpi_set_pixel_link_sel(struct imx8qxp_pxl2dpi *p2d)
 {
-	struct device_node *ep;
+	struct device_node *ep __free(device_node) = NULL;
 	struct of_endpoint endpoint;
 	int ret;
 
-	ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 0);
-	if (IS_ERR(ep))
-		return PTR_ERR(ep);
+	ret = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 0, &ep);
+	if (ret)
+		return ret;
 
 	ret = of_graph_parse_endpoint(ep, &endpoint);
 	if (ret) {
 		DRM_DEV_ERROR(p2d->dev,
 			      "failed to parse endpoint of port@0: %d\n", ret);
-		goto out;
+		return ret;
 	}
 
 	p2d->pl_sel = endpoint.id;
-out:
-	of_node_put(ep);
-
-	return ret;
+	return 0;
 }
 
 static int imx8qxp_pxl2dpi_parse_dt_companion(struct imx8qxp_pxl2dpi *p2d)
-- 
2.43.0

