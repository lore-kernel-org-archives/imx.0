Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96CE30C35E
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114952; cv=none; b=bsbe6kbdzkMr1LPAvMwO4nb/Zh3gQIm8BkOUN0nth5r3FmVXCYSJbfngqxDxCJyrQWUdDOHff0o6uGC9OChKzvDmm66Tz3XfYArSAIzFDIo0zUHzDdcLB1sHQPn9dS91qUPmmhFPOvMsNm82c2GxqdMcifwOdCNibF3u9wKCcNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114952; c=relaxed/simple;
	bh=D26jPsJTNPT829k201KptmbfiAqK4RS58WCGHZkP7yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxhEFuew9g4h+BS9i8uHRFLLoo8Mt5KSD990qtu7p9nw1G05nyULY+o2UzS7Wdts92QGaTNPm//QhB/Sd0BO43O3XQrtBkLWaO6u3DWpXrDzdiheUNoIj/lJcoEP2qz5zAzdhLPhLafqVxX3Hx/dbeMmcR6RTXy//41Cy89JngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cdvSpR4+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cdvSpR4+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 27D6D4E423E3;
	Tue,  3 Feb 2026 10:35:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F053F60728;
	Tue,  3 Feb 2026 10:35:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 099B0119A8891;
	Tue,  3 Feb 2026 11:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770114942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0J7QwrnMLj6IPv/b8J6urH3umx5hdgFgh5QfijNSOt0=;
	b=cdvSpR4+XLR7dOJEi7ksbitsY6hcG+EvmqrKfy9qgPMzUk7PCFQlm2q9UgVtdt3/ZoMlhc
	/vfqDOJ/qaBi+Vnhd9X2cdkkpVL0n3q9veQsO5+XBKvBLmykj8jAW8N8dLQ7trnTIjdpjU
	N2tjDhYnx86jbjSFtSGqBwn+wjX0uE+uTeMXXAXlckOwmpf4hUis/9qoruEttgrz8npNUU
	YkOZQVlNQxo01RdZHao7yqUL3LzX8xkmuPvz93A5PfrFfEOakRYUoa06yP9NRSo0ucKLiL
	aISI1rbH4WK9QKS6165kRf7a1l71IYlBOUKgh25tvIfauyYj2LIL0f2FhjFrBg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 03 Feb 2026 11:35:25 +0100
Subject: [PATCH v5] drm/bridge: imx8qxp-pixel-link: get/put the next bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-1-66bda8d617b4@bootlin.com>
References: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-0-66bda8d617b4@bootlin.com>
In-Reply-To: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-0-66bda8d617b4@bootlin.com>
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
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15-dev-5464f
X-Last-TLS-Session-Version: TLSv1.3

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

To keep the code as simple and reliable as possible, get a reference for
each pointer that stores a drm_bridge address when it is stored and release
it when the pointer is overwritten or goes out of scope. Also remove the
intermediate selected_bridge variable to reduce the refcounted variables in
the function. The involved pointers are:

 * next_bridge loop-local variable:
   - get reference by of_drm_find_and_get_bridge()
   - put reference at the end of the loop iteration (__free)

 * pl->bridge.next_bridge, tied to struct imx8qxp_pixel_link lifetime:
   - get reference when assigned (by copy from next_bridge)
   - put reference before reassignment if reassignment happens
   - put reference when the struct imx8qxp_pixel_link embedding the
     struct drm_bridge is destroyed (struct drm_bridge::next_bridge)

Additionally, split the somewhat complex if() for readability.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v5:
- rewrite commit message after Liu's review to clarify the per-pointer
  get/put idea
- split the if()s involved in selcting the bridge
- remove intermediate selected_bridge pointer
- removed Maxime's R-by, patch changed
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 91e4f4d55469..e29e099b893a 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -23,7 +23,6 @@
 
 struct imx8qxp_pixel_link {
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct device *dev;
 	struct imx_sc_ipc *ipc_handle;
 	u8 stream_id;
@@ -140,7 +139,7 @@ static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	return drm_bridge_attach(encoder,
-				 pl->next_bridge, bridge,
+				 pl->bridge.next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 
@@ -260,7 +259,6 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
 	struct device_node *port;
-	struct drm_bridge *selected_bridge = NULL;
 	u32 port_id;
 	bool found_port = false;
 	int reg;
@@ -297,7 +295,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			continue;
 		}
 
-		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
+		struct drm_bridge *next_bridge __free(drm_bridge_put) =
+			of_drm_find_and_get_bridge(remote);
 		if (!next_bridge)
 			return -EPROBE_DEFER;
 
@@ -305,12 +304,16 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 		 * Select the next bridge with companion PXL2DPI if
 		 * present, otherwise default to the first bridge
 		 */
-		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
-			selected_bridge = next_bridge;
+		if (!pl->bridge.next_bridge)
+			pl->bridge.next_bridge = drm_bridge_get(next_bridge);
+
+		if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
+			drm_bridge_put(pl->bridge.next_bridge);
+			pl->bridge.next_bridge = drm_bridge_get(next_bridge);
+		}
 	}
 
 	pl->mst_addr = port_id - 1;
-	pl->next_bridge = selected_bridge;
 
 	return 0;
 }

-- 
2.52.0

