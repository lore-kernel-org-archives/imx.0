Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C6C290DBB
	for <imx@lists.linux.dev>; Tue,  5 May 2026 08:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777969334; cv=none; b=SXLiT4sOznOh0tptXWh2ODliOUe4cOvs0f/TSgGE1iSzbsFgYS2AzopPTRO/yIKR82i82GwKuF19ew8EYvJg+4c81Hgie334vJ7jR/xw38+D5t2e8cw9zQhBBBkr/nM7ZWHaKlQ00Dp1QhzmqvQs49IsxASVsF1MQAGphO0uJdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777969334; c=relaxed/simple;
	bh=nK0j9juRgg0ZsV/8NnbWOopdIAYdgSZX1Hdc5+iIKv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GBeld9+gC1EpAcMyvLQA49ykCdOR7rzklKeyRVcOS36CLyhI9PAV6+KPlZq+KfEOcFQgSY7k7vTuPt5tOfLBPpd5foLCcXFYBQlUxydNxXqNMt6AiJZyBfy1bxww5xrww9+GkMHXeu71ZTuT/3ElvglT8698FrrhzfQbwmrudi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmrFh42M; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmrFh42M"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36520a83186so1795734a91.3
        for <imx@lists.linux.dev>; Tue, 05 May 2026 01:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777969331; x=1778574131; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DoyB8695OKHFJLVaXhyFdUBCqi4FGLL4BEcb0wuk4uw=;
        b=cmrFh42MI81O+kl45GDZ/sngXzJcyUlVJjoXIMwcr4FXr+jQ+nSPOst9BZREJLY4WE
         l43yKIoFQbsS2GbQk9kO2rKp7CEe6VlGynO4lu5AT/NnpL1vXdxEu8aJKkWt7kVq7X0x
         2sT5nTQ+RddC49bXJDrRx2m72cG3CnBY1c5zu0h9HKz9yxcYNME5EMnNEUDBVUkqnm5R
         xdRrIoAi1iL0dNYvHcWMNLGrW9UcIUJqbHD4KqCqD0o3EHXOlEVCXBs96zYhPVxlpi1O
         G2GVODPDzSL2bamxgFXWxPmLQQw0zjaVIscazkuzaQl3Uj+8GvuG0Zr45IDPxNIFgemc
         D2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777969331; x=1778574131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoyB8695OKHFJLVaXhyFdUBCqi4FGLL4BEcb0wuk4uw=;
        b=D5nAhRo9FInxSbmc/cpadUZJoF26Ez5buhcicDkLPK0IsU/01AmNyp/+yU+uFWWVrZ
         4OhXeN1qU0m6PpgYN2kiRIBOFm5r8anHnWp/vCcnNTpYRL9R7PAf9uR+q70jpvW7NLtU
         ktEIRqyWtcZ+rIA8plwfNkLq4fTyAYWTxkuoraNJvgsb4lO64+nqxIfHm8VTkIhu3ZJD
         zuEpux+J/RFdYjuUgA2bJPpMloPx/PvjkOCOa+iKbuu5nfng0/XZat6Nhp5JQyl1eASM
         8lLsyVRmr97D6c1OTIuhVIfINKQTG0RlrqjLZahg6xWWWqSaJ3F8XbzNUK1ymxj+WPTf
         PUSw==
X-Forwarded-Encrypted: i=1; AFNElJ8DG8znU3cCXzKaRzr6I5HCqA873Q74qYNJqIeZzXnEwOveQpDVQL+zWSivsuAIUUETXik=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnGt6LonkRuaM7ABcyJ54MVQWWugwV3MbSqja0GBSnPoKgRzWL
	3Vx4Asc+VPX0g5cQmopgb9p9kR1rRzqA3x8mJHuNRQqjz1GV68TkJzB2
X-Gm-Gg: AeBDiev8NJCbWVnWOydgdTIKd4CQNnwSKSVBwXJz6Q1qBaJZYAW+KKG4pqkjay/2RQY
	jMRRRDRgrXkui4zz4OOr3HW9+pkISo9NMsR9fY9YK+LHMicpvFLaQdhyUccnNE9Mj7B9SFEII4L
	WdbCBij8g0DmPTOyOYkF0MqLz5WDOLne3V1lHDcU8bynaSqqOlezXItAfQwC4oRJPiLxNCe9/bM
	Myaj1Qu5Hck1y337p263lssVnyoMsk+Ax2zHeLUaLmgIKYToUlHJU0DNOXNuvZjwIWZJsxEhhxY
	CG8pdi96zhM7zgAspka0Hkf49xBRW4kvLokzKP89zaGCjhAHcsgA8QUhYl7PW5sVucC7tIT7Rj2
	hRZMopNCbEWv4MmkqE6BbpZMPIZUg+a4P3gCQz+4HRUV+hcXhb+F2gPBOORHiWp+dp+/4rjIFxA
	qpk1tZmwKIgo1VTaN1OyBsb86d
X-Received: by 2002:a17:90b:3807:b0:35d:95eb:879a with SMTP id 98e67ed59e1d1-36577487bccmr2309864a91.13.1777969331396;
        Tue, 05 May 2026 01:22:11 -0700 (PDT)
Received: from lgs.. ([152.32.133.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3650e94126dsm11439814a91.5.2026.05.05.01.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 01:22:10 -0700 (PDT)
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
Subject: [PATCH v4] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with device_node cleanup
Date: Tue,  5 May 2026 16:21:45 +0800
Message-ID: <20260505082145.603262-1-lgs201920130244@gmail.com>
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

Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v4:
  - Drop the sentence mentioning the custom static analysis tool.
  - Add Frank's Reviewed-by tag.
  - No functional code changes.

v3:
  - Do not change DEFINE_FREE(device_node, ...).
  - Fix the driver pattern by making
    imx8qxp_pxl2dpi_get_available_ep_from_port() return an int and
    pass the endpoint via an output argument.
  - Update both callers so __free(device_node) never holds ERR_PTR().

v2:
  - Fix DEFINE_FREE(device_node, ...) directly.

 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 54 ++++++++++----------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 441fd32dc91c..881ebb811eb3 100644
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
@@ -287,26 +287,24 @@ static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 
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
 
-	return ret;
+	return 0;
 }
 
 static int imx8qxp_pxl2dpi_parse_dt_companion(struct imx8qxp_pxl2dpi *p2d)
-- 
2.43.0

