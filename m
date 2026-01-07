Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2438325711
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 09:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779832; cv=none; b=SVMZjDiKZdVZplzbkkirePNtqETNnckAH7hgOgV8anUw3oITLg9h5yJJBZuBcevsWOE3hGesyZ59b6kdvHZvpXddF9LLHVkpd1Ucg1L4Tnze26PUVmQ3NM+tiPz26n7rs2dXbSQ5IHCRNRfd33jmIu0tYZ4t472RTtZdlfW39ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779832; c=relaxed/simple;
	bh=DM/D6zwn/uTZ7Pgj/sIygdfJRpLNQ4yHQQTH5gFY43M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtHhIgEjRj062dHlGs8TNG/BhSAex60SF3M4MN55l2EcOYPcVX3t5CWbsuAl2gpt9q5MeaB1OSZ2UimVQx4LBcskvGnBzATdOK47lKKtJwzTuiZtNYRrBTjRUqnklLlYXho/X8oqupbfpZE8kB+weZwXq8VQRwA/gdYsZnEQ3Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vQhgwmik; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vQhgwmik"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 98B86C1EC96;
	Wed,  7 Jan 2026 09:56:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED8CA60757;
	Wed,  7 Jan 2026 09:57:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2E8D103C8717;
	Wed,  7 Jan 2026 10:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767779825; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9jZtxJrH4yjNHJxNoJwo1HCjHiuPX2NJqEJefkI38sk=;
	b=vQhgwmik6I5YnkxAJ7jdfHhUlb5Ae91P4JFwrIEAz4FbfR45JtEECfYqmbIQzgFB/xIsER
	KusKrH4+d6N3ut7QxYtjQau9s2TosN67M2ERj6gBRUKrK4OEaQh9ZsBD0iLG519P/Cb3HD
	62fZ4su+j7loGRaMJsjX3asOnV5Xz7ShWV2KBPJuQk+1dHkBJZupyzd3TZxS3y3b+BcnAk
	h+XR79PFbfYqWKWHl4KH7H/srDK4xn94oRChDC2mMdbvtzTjWNB2sX0zGFSjfBrmSsGKef
	mdMTYyuuezRdsHjAg/1IPaCyH0nAXveIb6sd6FhEzM/+mKL9lbUzYWMM9b5k6w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 10:56:29 +0100
Subject: [PATCH v4 4/4] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com>
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

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

This needs to be handled in various steps:

 * the bridge returned of_drm_get_bridge() is stored in the local temporary
   variable next_bridge whose scope is the for loop, so a cleanup action is
   enough
 * the value of next_bridge is copied into selected_bridge, potentially
   more than once, so a cleanup action at function scope plus a
   drm_bridge_put() in case of reassignment are enough
 * on successful return selected_bridge is stored in bridge->next_bridge,
   which ensures it is put when the bridge is deallocated

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 91e4f4d55469..b3050310a7f0 100644
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
 
@@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
 	struct device_node *port;
-	struct drm_bridge *selected_bridge = NULL;
+	struct drm_bridge *selected_bridge __free(drm_bridge_put) = NULL;
 	u32 port_id;
 	bool found_port = false;
 	int reg;
@@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			continue;
 		}
 
-		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
+		struct drm_bridge *next_bridge __free(drm_bridge_put) =
+			of_drm_find_and_get_bridge(remote);
 		if (!next_bridge)
 			return -EPROBE_DEFER;
 
@@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 		 * Select the next bridge with companion PXL2DPI if
 		 * present, otherwise default to the first bridge
 		 */
-		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
-			selected_bridge = next_bridge;
+		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi")) {
+			drm_bridge_put(selected_bridge);
+			selected_bridge = drm_bridge_get(next_bridge);
+		}
 	}
 
 	pl->mst_addr = port_id - 1;
-	pl->next_bridge = selected_bridge;
+	pl->bridge.next_bridge = drm_bridge_get(selected_bridge);
 
 	return 0;
 }

-- 
2.52.0

