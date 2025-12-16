Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC2633D6DF
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 18:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908045; cv=none; b=VAwDLEJkz9mErMtCHrIMxC/fuPziA23g27dvqZI6vUCYZKRxGM3vvf6m33KUJxXfcOjasM5Qw19Ospl3IqEZ6So+a265RM4wM7EQl/afD3IYAjp59DVWu29FOBGQR9KE/3vUG/GoB0y6cFa2q3i/XWVsOu87PBv/QJMWKzVbBtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908045; c=relaxed/simple;
	bh=fw3DTgUqur3v1/aF9KW65sNakYQpqN7mideRArARVSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1R0eNtbji//eHm/iC7YZXMTOphQ/vDxz4qKDWC6btOwFpEUPZLg6GL5BnpwzdR2KgN7k7DyCawGdywwFtQ+AbRpdoDnhHjqnVuewrNVuyiBdkH9XD2Lnic3uzFKQgvSVDJ78XkXcfbjAv9wkt/EIqH73cyBYe28tG2WKBfnMm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D2bkKi7N; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D2bkKi7N"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DBA66C1A585;
	Tue, 16 Dec 2025 18:00:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B1616071C;
	Tue, 16 Dec 2025 18:00:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6613119A97D5;
	Tue, 16 Dec 2025 19:00:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908040; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NYJEE2opxHghuVaIu6hgRW6HhV8SDpecPQJMZReKags=;
	b=D2bkKi7NoHC8TwpLYNq5yMx4usGX0uvHXODIrL/9+8JmdwSPajQgn/E7vPF5RS/thnq03V
	qj2HkSYZb/93l2sCultbAcfT58vfNWKl0owNvXpZyKVhfcz4ayDQsq4G5DLU8+DuMUGuOa
	KwsqVHY4bHAggDoNUIg/QjeSBDmIcNWtXBY8CieJUK827NCquljQkRuCW7rQ8NeC1/yVeq
	+E8RJVZfrfrm53JS8LVCjR+25aw2ks463N64RZJ9/NMsGeH9dPCllo86xtIL8WpLMCw4AB
	ilMgq6YwXcipvxchhqY5VGYZqI8O41TDlaNyR3VOndvt5Aa+8d/SIftUOY8VnQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:49 +0100
Subject: [PATCH v3 16/22] drm/bridge: imx8qxp-pxl2dpi: get/put the next
 bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-16-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 2e66b003386e..556aec3b3734 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -35,7 +35,6 @@
 struct imx8qxp_pxl2dpi {
 	struct regmap *regmap;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct drm_bridge *companion;
 	struct device *dev;
 	struct imx_sc_ipc *ipc_handle;
@@ -60,7 +59,7 @@ static int imx8qxp_pxl2dpi_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	return drm_bridge_attach(encoder,
-				 p2d->next_bridge, bridge,
+				 p2d->bridge.next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 
@@ -271,8 +270,8 @@ static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 		return -ENODEV;
 	}
 
-	p2d->next_bridge = of_drm_find_bridge(remote);
-	if (!p2d->next_bridge)
+	p2d->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+	if (!p2d->bridge.next_bridge)
 		return -EPROBE_DEFER;
 
 	return 0;
@@ -351,8 +350,8 @@ static int imx8qxp_pxl2dpi_parse_dt_companion(struct imx8qxp_pxl2dpi *p2d)
 	 * the next bridges are connected to.  If they are marked as expecting
 	 * even pixels and odd pixels than we need to use the companion PXL2DPI.
 	 */
-	port1 = of_graph_get_port_by_id(p2d->next_bridge->of_node, 1);
-	port2 = of_graph_get_port_by_id(companion_p2d->next_bridge->of_node, 1);
+	port1 = of_graph_get_port_by_id(p2d->bridge.next_bridge->of_node, 1);
+	port2 = of_graph_get_port_by_id(companion_p2d->bridge.next_bridge->of_node, 1);
 	dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
 	of_node_put(port1);
 	of_node_put(port2);

-- 
2.52.0

