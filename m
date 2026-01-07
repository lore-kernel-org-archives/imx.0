Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7357C322A13
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 13:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791625; cv=none; b=Tr9NSl+W4UJGJY/zT9vu/Jjmpbu4HV6MMjsS3Si1MJOF/ML1QOC4vBXAb/wRiFfMDdpi2y1iQ6R7BmDUsnpORSp7USJbNFvdwqnRIDTOWO8j8ym0p8Y3rZauCaAw+aR/hb/L2sP2LVdpZ6ITj4spXRyn508tiCKlso4ry3Bo7HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791625; c=relaxed/simple;
	bh=hJm1Yd83zZ6sQm2qX74iFfnuSJ4pHlZuYfaw1c+tCBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JqYu4ggAnW3nYKKuUuUCX5IbxifyiMNriAYcS6byxoOuLQVaNPMthAajj6VD+ZWAqLjRFeM2TSfvsuh+/+Av5tzyL1VACvM5u0dPBrcN/KoTriLwmIl8QAdKa1D0rVmyvTZuGwr5jtsL+4C/bZpKc+Y6S1hb0huW6mK09Gya47U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kHzad9vX; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kHzad9vX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EF2A8C1EC90;
	Wed,  7 Jan 2026 13:13:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16CEC606F8;
	Wed,  7 Jan 2026 13:13:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55DC3103C8740;
	Wed,  7 Jan 2026 14:13:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791619; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PBLw2S40lXZsCWRUXlFPSLF7ZKeEpxdBnBHyiWpX8NM=;
	b=kHzad9vXzEwUE2BmbEnu0SjASKxFslKat9qDMqZAG/D+JHO/BN7FnI2C9e0nNVyMaAhV4P
	FrJ6PAOr3k9W8n5jcyOQR3xgO1a1QhCPkTfEDtJEOPQq0wijrfNyHqoyhPy00rxaZgOhvM
	QQd+OK3QKtydqgwOdYdv/hDsIS95rvJjsYT1hVWCVNAoocYOkr+R0linDC9XfV7/0tZff6
	8k7vdPTqKpss2Pa0q/o3YtQUJ7xeR/Y1dXGLH8OEI4KLBsxrlMVXSDyBTTzxYssRvKJ8eY
	IhkFCaGyEKNBgjHHM4OlMKCJUC5KWEPCpRjTMEm7ranXbuVaMmNzcQgDo5Po8Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:12:54 +0100
Subject: [PATCH 03/12] drm/bridge: sii902x: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-3-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
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

