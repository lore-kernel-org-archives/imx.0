Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320102BDC0A
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908014; cv=none; b=UEjLjtjID417/7lMLL8Z2ujdRutQrgLO2Qvf8YzSiGmgMUmnbLjmMH4te9hfr3fYl0IkM6kfg3XOw1VaKAwVtU7w5CI286fRHkMg5vyhPLKAr865ojqlqijJI6P1YMzs+wNrvJzRyLgrpYGc2/MAxR2VUyEqZpTRCiKnufwsGmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908014; c=relaxed/simple;
	bh=CCTxYDG5esvfG3QapI/vaN7ekcY7tZf4b6//TqloRh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D5Aor9yO9PmCqX9e8dZytK+LdEMSWYtALd35rdfbb/SG+cj29mdeQFmlQ+yTQ9fUyhSZNg4cHOuoEOFQG4w5tYpCyab77keeO2s5T5bYeBOlH0KwurznTq2jGdLmAPFTj5hxrzGYyWWsqgoB9xvQNbG2NcU/OPv8snZF0SAL+KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YTYB0Yhz; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YTYB0Yhz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0AEBA1A2214;
	Tue, 16 Dec 2025 18:00:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCDBE6071C;
	Tue, 16 Dec 2025 18:00:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58956119A97D5;
	Tue, 16 Dec 2025 19:00:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GTpHCQitfi8TKGp4ltc6l5X/3hGUd4W8RAwhKfH5B+s=;
	b=YTYB0YhzjjTTgzdv0SfV0tdpbiL0U77KW7nyVZHlfowvzbiCHbjQIO0Rd92LvYfebaoxsX
	aARGAKYE4LBOiE9c0j0MUm/b+x/I03+9LCYx3eOfneq6yiI8dG0YrZYtU7v1U736PHBkCT
	Ymxe4fTEiykO2aucimaxodwoP5tBolmgftfM6JpwOUCOaux9GoIEt4fdMa8LZ/OPtvNKa/
	lo5xJVqZxsPasCP5cb3+C0EahLqHNLrJsyjeNcGOYDtWpUUVL3Lp2k1KlKFAaFT8q5lA7j
	i8bXREnTqViEXutDMVNTC56WF0U4b69ALtNnqW5Lw/9Bs6mCDp5M7GA5mmAwzQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:44 +0100
Subject: [PATCH v3 11/22] drm/meson: encoder_dsi: get/put the next bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
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
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 6c6624f9ba24..eba246791c68 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -25,7 +25,6 @@
 struct meson_encoder_dsi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct meson_drm *priv;
 };
 
@@ -38,7 +37,7 @@ static int meson_encoder_dsi_attach(struct drm_bridge *bridge,
 {
 	struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
 
-	return drm_bridge_attach(encoder, encoder_dsi->next_bridge,
+	return drm_bridge_attach(encoder, encoder_dsi->bridge.next_bridge,
 				 &encoder_dsi->bridge, flags);
 }
 
@@ -120,8 +119,8 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 		return 0;
 	}
 
-	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
-	if (!meson_encoder_dsi->next_bridge)
+	meson_encoder_dsi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+	if (!meson_encoder_dsi->bridge.next_bridge)
 		return dev_err_probe(priv->dev, -EPROBE_DEFER,
 				     "Failed to find DSI transceiver bridge\n");
 

-- 
2.52.0

