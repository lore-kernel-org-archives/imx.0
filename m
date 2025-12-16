Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8590233EAF3
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 18:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908061; cv=none; b=giUiPwXfvWWFH4VN1J3OdzKAKKRSMssfE/75H5/ZVwyAjpAvRZ1uHxfKjNTJ2Co3H6Qlcbz81qqr/fSUlf8uajzPbqlGny+LqwARtZ1OrXpZo18viZduLf8UBZg9EuOPRdC2Sw9xnTw8vhNnKTD+cvbcF+BUTheRsXPG6cFEf4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908061; c=relaxed/simple;
	bh=MwUMFLJ/RkqkvWfrJIKs03Tad6Yy1fMBdkva9COkWzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cyeuLqKwSRqvzNLJkNc6uvAJbeWx2S1V4I6BWXdOV86wQQ8qfQIaQ3JbAKOdK/Ah6ay5rvYuDIW+jYcJ78HoDvuHqTzQ3rPjeVfFDlQYH1k2OMXKIeqcACDUb1teieaHHcVPChgUYHS44nPl9y0rS4K7GDApXAOV6kxj3Zfc4YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R9hNIcnl; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R9hNIcnl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 376FE1A2256;
	Tue, 16 Dec 2025 18:00:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0CE706071C;
	Tue, 16 Dec 2025 18:00:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95A4B119A97F1;
	Tue, 16 Dec 2025 19:00:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1h4T3/Lh3rCQeQ9eOfLIUP5TXiLulvJd3zq71FlR6xk=;
	b=R9hNIcnlYCkXarhLF0X6W8am+BlVymbAKKatHVsaeqLo6QG6Twk6Svx94X4POW2l9CDr7D
	qjFsVbU0S3k6qkXcXhRzhGcivnHKbgYulRPH3m3K4js8ywfuPZdr2Vqfes/d0IcWyVtFY9
	re2W/DtlbKjS+UBsghvEg2XBKDsalAfyto8ArrDASui6c96myVwwmZ+ABDU79qL9n1MEn9
	00PJ38qpHX28C62lv1IKa6YMiBxX2Wmwrl2FICXiC66GRmXQ0VvIodCx1zUKXeH5zhGinh
	+gINwUZzEb1SxIZ0NlSfka+DAgYvNACRqJtD0sbCgq0RrBeFEFQEbKt35O/32A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:52 +0100
Subject: [PATCH v3 19/22] drm/bridge: imx8qxp-pixel-link: simplify freeing
 of the remote device_node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-19-b5165fab8058@bootlin.com>
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

The main loop in imx8qxp_pixel_link_find_next_bridge() requires calling
of_node_put() in multiple places, complicating code flow. Simplify it by
using a cleanup action and making the 'remote' variable scope local to the
loop.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 53016f0d53a0..2ecc3c1051e5 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -260,7 +260,7 @@ static struct drm_bridge *
 imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
-	struct device_node *port, *remote;
+	struct device_node *port;
 	struct drm_bridge *selected_bridge = NULL;
 	u32 port_id;
 	bool found_port = false;
@@ -286,7 +286,8 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 	}
 
 	for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
-		remote = of_graph_get_remote_node(np, port_id, reg);
+		struct device_node *remote __free(device_node) =
+			of_graph_get_remote_node(np, port_id, reg);
 		if (!remote)
 			continue;
 
@@ -294,15 +295,12 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			DRM_DEV_DEBUG(pl->dev,
 				      "port%u endpoint%u remote parent is not available\n",
 				      port_id, reg);
-			of_node_put(remote);
 			continue;
 		}
 
 		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
-		if (!next_bridge) {
-			of_node_put(remote);
+		if (!next_bridge)
 			return ERR_PTR(-EPROBE_DEFER);
-		}
 
 		/*
 		 * Select the next bridge with companion PXL2DPI if
@@ -310,8 +308,6 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 		 */
 		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
 			selected_bridge = next_bridge;
-
-		of_node_put(remote);
 	}
 
 	pl->mst_addr = port_id - 1;

-- 
2.52.0

