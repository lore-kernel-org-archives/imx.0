Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6E12989BC
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 21:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770846010; cv=none; b=WoYg9EaJGTgNPu+z4jBZJdU2kUNezpk4lVSTn6vPoJGaBfcogqGol66yqD8lKL1VTapKAub9lcfvypij1MAhwKc/6rICg5f9RnvTvlKkV5tdycThTYN2uNVGqpzgJJY138TPhMnaTisk/ANMOZjOGwbVem97Qho3aTLUd4uulS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770846010; c=relaxed/simple;
	bh=0uwStfqWXamljtwZF4cHlK/oGasM1AvoMjnMzhL2ogY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqcCb08S9zOR/jUy59NbysYfbOIvkfOCR8Du42D796YVif1TJ7YjupUQfjo2yYpAYREv2ydN4isK9SIAyihyRxqjZy9pu7e4ZizAcxlp2p2J7LICn/yla1OFahay0DTVD31EnqnKPa42S5maSAN7iphChX1/f8bPllNSTqWCr/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JQvfHHcL; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JQvfHHcL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3D4264E40C73;
	Wed, 11 Feb 2026 21:40:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12C0C606B1;
	Wed, 11 Feb 2026 21:40:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF8CC11949531;
	Wed, 11 Feb 2026 22:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770846006; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KHjTKyUMnae6tYGvVXBopaGafWE5D2GEW7x/Ab5dymQ=;
	b=JQvfHHcLEbWPtH3bGqB+yuadTQv9OG6OEvQoebbz4fBa0oJIf0ySze3+RY7PU80FD+vPfh
	GERCKCgxvWujtOrmA+fBCp/xgEWwta+sTz8D1p+do8EESWsd5pwPFRjAAOvz0mVmgbG/tC
	dp+xWdtUAI++2KEAOBtJzsYCHAUVp/LZwTawtoMoF1pGB00Oew6FmyhFZThnmLe2y09iJM
	JtOgaicmfZ+xrzDMLJ6GfeZq+dzxfceKff4fLtOVsBXepzxPq4ipnCnwAzJRpY4uzA7Inq
	3+akA5riNpHSTkujwaiIgQThOZJAZ08/2s7ZhLF/yasKLnZO0N5F3HBuLcWZKw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 11 Feb 2026 22:39:49 +0100
Subject: [PATCH v6] drm/bridge: imx8qxp-pixel-link: get/put the next bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-drm-bridge-alloc-getput-drm_of_find_bridge-v6-1-651ddfd13bdb@bootlin.com>
References: <20260211-drm-bridge-alloc-getput-drm_of_find_bridge-v6-0-651ddfd13bdb@bootlin.com>
In-Reply-To: <20260211-drm-bridge-alloc-getput-drm_of_find_bridge-v6-0-651ddfd13bdb@bootlin.com>
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
deprecated, so move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

To keep the code as simple and reliable as possible remove the intermediate
next_bridge and selected_bridge variables.

Get/put operations on the remaining pointer is pl->bridge.next_bridge,
which is tied to the struct imx8qxp_pixel_link lifetime, are:
 - get reference when assigned (by of_drm_find_and_get_bridge())
 - put reference before reassignment if reassignment happens
 - put reference when the struct imx8qxp_pixel_link embedding the
   struct drm_bridge is destroyed (struct drm_bridge::next_bridge)

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v6:
- rewrite as suggested by Liu, removing the next_bridge pointer too
  and splitting the comment for maximum clarity
- adapt commit message accordingly

Changes in v5:
- rewrite commit message after Liu's review to clarify the per-pointer
  get/put idea
- split the if()s involved in selcting the bridge
- remove intermediate selected_bridge pointer
- removed Maxime's R-by, patch changed
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 27 ++++++++++++-------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 91e4f4d55469..055b94d75eb6 100644
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
@@ -297,20 +295,21 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			continue;
 		}
 
-		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
-		if (!next_bridge)
-			return -EPROBE_DEFER;
-
-		/*
-		 * Select the next bridge with companion PXL2DPI if
-		 * present, otherwise default to the first bridge
-		 */
-		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
-			selected_bridge = next_bridge;
+		if (!pl->bridge.next_bridge) {
+			/* Select the first bridge by default... */
+			pl->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+			if (!pl->bridge.next_bridge)
+				return -EPROBE_DEFER;
+		} else if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
+			/* ... but prefer the companion PXL2DPI if present */
+			drm_bridge_put(pl->bridge.next_bridge);
+			pl->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+			if (!pl->bridge.next_bridge)
+				return -EPROBE_DEFER;
+		}
 	}
 
 	pl->mst_addr = port_id - 1;
-	pl->next_bridge = selected_bridge;
 
 	return 0;
 }

-- 
2.52.0

