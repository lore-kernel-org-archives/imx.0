Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA42E2BD5A2
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 17:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908001; cv=none; b=VhNHmhFPPXVeFjH7s65Yn1KxAg8KG5WFgCezgYGVJ1nRNpCCCfgFL5GzMqNUKkodZLrj4l/pvW4tQmJMY5pacciD5jFnprNwrhZVuKVMETWWOO5m80CXwcnxwiKgm12RChK4R5d3+JR7OyiLNK53b02mms9O93KGGJkgaFfu/8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908001; c=relaxed/simple;
	bh=0Gg8k7um+Yg0UT1+BliEPMflV3ublRcJ7Mf7PPZcgVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OldWZ5YuggnQDGb0rTE0VkVqDljAHUQwS1FaWr9oEXGj4XhpFVJuyfM8zDFsFOKsQPaGV47yPBGCtS9x8usntmvpJ8U7Ly2IUJq3VjB2v7iUDIjgytkAL09Dj85WeqiJFAw37ZoO5zu0CzUduLO/nlRsJu+ADy4eD8isFvlJydg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DghY/Hrt; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DghY/Hrt"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 589374E41C36;
	Tue, 16 Dec 2025 17:59:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D3616073D;
	Tue, 16 Dec 2025 17:59:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C56FD119A97F1;
	Tue, 16 Dec 2025 18:59:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907996; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pdfuvq8Da5wDFIV2j2xMDJsP1aZVRXCSX+C3BQ6euSA=;
	b=DghY/Hrtc+jcjjGQOpuF405MXO3TebHRiT08Bn8h/TiUKqQp0c0PFS+aUhjSgcqbw3gpGt
	Z1DDBzwsJb4snp+EygzdAxCrdm4Fq8zSiyid+QHayT8bD09vEtrGJ2sG+6r5CfMzM+W1Jj
	22KH3Eq/dBU4r54vP0wbPNkrhYD6daFllEWRzAfvLl7GsIa1Wl4KeTbS0xSMWQB6YdkGao
	P/4M1YpBGGxIzQ9KLLb9sneh9t0dlVllJtl6zBc0d+rTKr2gzkmNV6X4DdznBp4zeoadwT
	4ehJooGXCFff86lQRMd8k9zMhdBQrldfoaof6uMPkNd4fTf4JQlkiKsuWeWg2Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:41 +0100
Subject: [PATCH v3 08/22] drm/bridge: imx8qxp-pixel-combiner: get/put the
 next bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-8-b5165fab8058@bootlin.com>
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 8517b1c953d4..74eda8b54023 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -60,7 +60,6 @@ enum imx8qxp_pc_pix_data_format {
 
 struct imx8qxp_pc_channel {
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct imx8qxp_pc *pc;
 	unsigned int stream_id;
 };
@@ -120,7 +119,7 @@ static int imx8qxp_pc_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	return drm_bridge_attach(encoder,
-				 ch->next_bridge, bridge,
+				 ch->bridge.next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 
@@ -326,8 +325,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 			goto free_child;
 		}
 
-		ch->next_bridge = of_drm_find_bridge(remote);
-		if (!ch->next_bridge) {
+		ch->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+		if (!ch->bridge.next_bridge) {
 			of_node_put(remote);
 			ret = -EPROBE_DEFER;
 			DRM_DEV_DEBUG_DRIVER(dev,
@@ -349,7 +348,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 free_child:
 	of_node_put(child);
 
-	if (i == 1 && pc->ch[0]->next_bridge)
+	if (i == 1 && pc->ch[0]->bridge.next_bridge)
 		drm_bridge_remove(&pc->ch[0]->bridge);
 
 	pm_runtime_disable(dev);

-- 
2.52.0

