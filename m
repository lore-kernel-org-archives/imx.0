Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020677;
	b=T07t05z/t0t1uv7BoBg9p1t3FpKEl054klLLfRgZUsnbZ2mFMMdfIEgepbopEMyDrxu3
	 zFg93LMdph+ybtvo5c9SG9o71sayuXgiVWGCs/38l64MCPLyh5qj41TmMAoMpE+gbnZtP
	 dCnNDODvZvglS69HlBEw0/E953xnjaPHZ4smTWsV4nLCJLNk4BE3REpMuk6mngAcrq8lj
	 u7RId8kAqqWCRoldRk0U/OlrR1kEaZ22INlYllMIYWvnNSCnJ6EuRIOxlD3gQyElAxF1Q
	 5e/tyy2t0bbygWnq/EBGDXamSAAGi0D8fsHyhS6OIDcEaZhzx8fkuDU3X4e4WUMSo1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020677;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=kfV/vPTlNu0kow2S0xdSta9ITU6sSETmynTVNkXocck=;
	b=h+nceCgQHQGzRPrTlGLEBgKziNxhosCGINUljNH3scIA8xJSUAtO62/1RTTC/80mcVyh
	 MAJFgLiAlibBF5xO1Ut9SQ2mHWrn6O905+wsIV95Np7cC5XlVdn/XajU/3942m0aSoM3y
	 qS7dUZY5dnC5xCEC9XbxXrRv+vvIdAv0hVRDKFGhwZ4ITP+bMsY3e1cT2ejwPsGt3EGQi
	 twkVLbP8/LS04EUuHMt13vQRmntkp/9m0I4Nnxu6f33KlLFl5GuCkAcffzib/QU/+iIHG
	 1h9qZ+F8gnBGna/fDMWLO5B8/MfkUvV2I0hgJIhkHUDnyT85ovXB59yVwXqiNZral+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UbgJILgQ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3235D606A32F
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3235D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UbgJILgQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B1FCA4E41635;
	Wed, 18 Nov 2026 16:51:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8242C5FE9B;
	Wed, 18 Nov 2026 16:51:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D823F11BC28AA;
	Wed, 18 Nov 2026 17:51:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020673; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kfV/vPTlNu0kow2S0xdSta9ITU6sSETmynTVNkXocck=;
	b=UbgJILgQlMlkKJPgr+qGpTeBAohC79QYDlYAhcbPOsnSgeF/3ZWJuf6Gny3me3j0o7nsrO
	GpsR0eO7NLHDg1y3oBcp5hhnI0B73FBfSdqTAS+A4btlJrhQyEFcPkJZxvuOQn2AEFL/yN
	mdQCSC2NKV2wr4kU7jZn369ji3j37Rpx094eCPwQqwdVsVeZ+zJA467+0ObpKyy4rDX6hb
	M8JLR3mWe4qJA3gVxFUkoatufAVRME7e3SKIYW7U+hKDzHvd0+F/sKnfDe/VCeolBFWy9X
	ZzPxwDU8Zdz9AY7mTlrZ6xJKGWVqQ9eyl8UULl4NQka2osauY7sQiMuEhUrstQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:53 +0100
Subject: [PATCH RFC v3 10/31] drm/display: bridge-connector: add APIs to
 add/remove the connector dynamically
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-10-44bb3b4a828f@bootlin.com>
References: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
In-Reply-To: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

drm_bridge_connector_init() adds a drmm-allocated connector. For bridge
hotplug drmm allocations are not suitable because a connector may have to
be added and removed multiple times in the lifetime of a card.

In preparation for bridge hotplug, add APIs to add and remove a connector
using regular non-managed allocations.

For the dynamic connector, this requires the kfree() the allocated struct
drm_bridge_connector in the destroy func. However that func will be called
even when using the pre-existing drmm API, leading to a double free
(kfree() in the destroy callback + drmm).

One option to avoid this issue is introducing two mostly identical
drm_connector_funcs instances, one with .destroy and one without. But that
would be an annoying code duplication. Instead take a different approach:
always allocate using non-drmm kzalloc_obj(), so that deallocation always
happen in destroy->kfree().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Uhm, maybe the change from drmm_kzalloc to kzalloc_obj and addition of
kfree to the destroy callback should eb a separate commit?
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 24 +++++++++++++++++++++++-
 include/drm/drm_bridge_connector.h             |  4 ++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 015f6750b7f5..4bd34dce44ad 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -289,6 +289,7 @@ static void drm_bridge_connector_dynconn_destroy(struct drm_connector *connector
 
 	drm_connector_cleanup(connector);
 	drm_bridge_connector_put_bridges(bridge_connector);
+	kfree(bridge_connector);
 }
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
@@ -1215,7 +1216,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_connector *connector;
 	int ret;
 
-	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
+	bridge_connector = kzalloc_obj(*bridge_connector);
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
@@ -1230,3 +1231,24 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
+
+struct drm_connector *drm_bridge_connector_dynamic_add(struct drm_device *drm,
+						       struct drm_encoder *encoder)
+{
+	struct drm_bridge_connector *bridge_connector;
+
+	bridge_connector = kzalloc_obj(*bridge_connector);
+	if (!bridge_connector)
+		return ERR_PTR(-ENOMEM);
+
+	return drm_bridge_connector_initialize(bridge_connector, drm, encoder);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_dynamic_add);
+
+void drm_bridge_connector_dynamic_remove(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector = to_drm_bridge_connector(connector);
+
+	drm_bridge_connector_fini(bridge_connector);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_dynamic_remove);
diff --git a/include/drm/drm_bridge_connector.h b/include/drm/drm_bridge_connector.h
index 69630815fb09..de6ec91dbfab 100644
--- a/include/drm/drm_bridge_connector.h
+++ b/include/drm/drm_bridge_connector.h
@@ -9,8 +9,12 @@
 struct drm_connector;
 struct drm_device;
 struct drm_encoder;
+struct drm_bridge_connector;
 
 struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 						struct drm_encoder *encoder);
+struct drm_connector *drm_bridge_connector_dynamic_add(struct drm_device *drm,
+						       struct drm_encoder *encoder);
+void drm_bridge_connector_dynamic_remove(struct drm_connector *connector);
 
 #endif /* __DRM_BRIDGE_CONNECTOR_H__ */

-- 
2.56.1

