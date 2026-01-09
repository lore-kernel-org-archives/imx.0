Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C72EDD57
	for <imx@lists.linux.dev>; Fri,  9 Jan 2026 07:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943919; cv=none; b=ick1pLt0r5WnQctPWPtu0fj8yEQFQlSkIHXD8kluqT2mS0z6ZOJmuUTtAHV9KXe5yVnbr4zDeXR2LVZgy18UKgRbIlcxZM3Ezo/Bp8pq2/MVrsL2HlK1AcC5HH1pyqs0LYV++b8wDL1IR/QyLUB/aOR3NaxJcNTCLDW/GtWjweE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943919; c=relaxed/simple;
	bh=nT+4wy5IuQ1fTasRk376WO3GHIalG7SRQ/MlMuxaomM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dmW4i0287H/AvSYypWXoR6qlSwZpa49SU+hd5w74CNj/VaHAhcajr2LzaLnd3DgGU2kqTsyxsj0MwokTFSHCaI6ltiImlT1ptX7OZYXYIHDEvbu+C98DXBg5Depv4il0ok0PRjTcBVLdmRHnObFFNmaEeMMiomNm9ICyrowBcd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Wj+4gEOs; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Wj+4gEOs"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2435E1A272E;
	Fri,  9 Jan 2026 07:31:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED8A360734;
	Fri,  9 Jan 2026 07:31:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E56EA103C87E8;
	Fri,  9 Jan 2026 08:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767943915; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xbfkkRL/MGRcgqDvDpIMuvcsCJnlzFYd2Dd6uEyNIfE=;
	b=Wj+4gEOsRDpvVFKtj85yDoEYt0GlQBO/GV44M9b6EjHHFe2U47E2xYOG2Y6Nho9UJHBkyH
	t53Y7OJYp/uu1v8nuQgSwSj3lQyfJR+sLkr8OrkKWiBjsu6hKdgxUuHY6lMU+WLE28kugh
	lt1ImhFCS3fknd8S8kJQaKuGp8IH4JW/q6fe5/8ym7KWXTVM1dTzy7zhKJwOjE4kyESM7K
	aDhqUvDW1LZhHE0RlYJVtNpp7hakA7X1WHECacKR82S+pr6vtgJX3S0jMsceQobszIE2fK
	Q6Nd/+RE0tlV/3M9KNk3GLR/lFER7XYiMZfiZgfsyf428iQvqOoIG4dacgQGmQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:34 +0100
Subject: [PATCH v2 03/12] drm/bridge: sii902x: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-3-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done by using the drm_bridge::next_bridge pointer.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 1f0aba28ad1e..12497f5ce4ff 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -175,7 +175,6 @@ struct sii902x {
 	struct i2c_client *i2c;
 	struct regmap *regmap;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct drm_connector connector;
 	struct gpio_desc *reset_gpio;
 	struct i2c_mux_core *i2cmux;
@@ -421,7 +420,7 @@ static int sii902x_bridge_attach(struct drm_bridge *bridge,
 	int ret;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return drm_bridge_attach(encoder, sii902x->next_bridge,
+		return drm_bridge_attach(encoder, sii902x->bridge.next_bridge,
 					 bridge, flags);
 
 	drm_connector_helper_add(&sii902x->connector,
@@ -1204,9 +1203,9 @@ static int sii902x_probe(struct i2c_client *client)
 			return -ENODEV;
 		}
 
-		sii902x->next_bridge = of_drm_find_bridge(remote);
+		sii902x->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
 		of_node_put(remote);
-		if (!sii902x->next_bridge)
+		if (!sii902x->bridge.next_bridge)
 			return dev_err_probe(dev, -EPROBE_DEFER,
 					     "Failed to find remote bridge\n");
 	}

-- 
2.52.0

