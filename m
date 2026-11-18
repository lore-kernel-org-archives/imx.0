Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020673;
	b=Rhys2f6TifCZT9AAzWBu/LWbBRTe+grcqSKET+iGq+HeallXGghjEbmcC+AYHzBtPZ0Y
	 FE1VEkCnyGRuqZCkfB7wEssL22EpCQgpvnHkNPvvLZIluF6XCeVJT2V/VOkmlA5sqpmm6
	 q6TzQDRpRk3ofU8cVMn4at527zd3FKcOPW8JuBceE7N1puzELrx7/XraxpRtpPePNhy76
	 fozkq8Y/geqnHAXPd2UyEzFqtoJsfTaqmmTcyZaW5X2u2eETB6ujGW7a4L4juLcCKeuUa
	 7cOcrypE8HML7Ifjsxdja4g9Is+F/s/dL/vDWPYCtQed6Jdai7eQsRpJ8roGeuS+Hqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020673;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=Eh62CGm2Nsq9fXhqb4JToE+PGEtwNRrXsYjmXaK4NJM=;
	b=oc2MwkZzD0XISB+MXZwupaZpYgA0gt5MARNcZRRiB2qmurObIX5ZU//pZcgo6XA/fr/C
	 16LEOtXk0kK3I0P7EI0fG6pjm0tCFzOUJ/VgMTtSX3On8ODmgh56vbIaXgtQxcioIWadw
	 8XQtnBpzIzpwppPnIuSrU1TfbjdFizn6ab1xjAO97mEZRle732bSJ/kGRcUORzOFSCN/E
	 69K5Hu/NZclFHM1P5QvV2rzXms98YVq3DbYFf6BEAelvoOloL8t/7XGiXTPV9vSyhAW19
	 QZhY5VWIkEmO3Y8qKXOh705kQSx/u43Y8Ial+Ty8JPcGT+3VNTp+g0Qd/StRfde5bXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EiQvB8Il;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1091606A332
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1091606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EiQvB8Il
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9941CC4F77E;
	Wed, 18 Nov 2026 16:51:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B321C5FE9B;
	Wed, 18 Nov 2026 16:51:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0C8E11BC28AB;
	Wed, 18 Nov 2026 17:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020664; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Eh62CGm2Nsq9fXhqb4JToE+PGEtwNRrXsYjmXaK4NJM=;
	b=EiQvB8IlBXeskRVuZIk+9LUmJHb+zNcOEZffWBbadRZyaHwc1Huk+PzHMzT59jPqiqeW3N
	JX0JvojfkWQaZohjDjd6OW9qEyoYKGYhPcuSnAJmjFZl8uysnaz1D55X6J6CE6chbFeShc
	3Ct9pS63qarXZSXGxOKQ2efBfamD6KiiEFHAW3yPX7v1YbIsZEc1PqEaIQjzjFQ28fxTxm
	o1hxvcj8RuoGcjYZRX2MUtzbXeeYxnv7Q2E9aHxKuvEmSjPos9qYEp8+D210ufoabVpSip
	iVyQPQXBlUYduwbVtVa6hOyrbbXdM3m0vpYqe09VHHIkGBnms/edlF8K8mpsHQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:52 +0100
Subject: [PATCH RFC v3 09/31] drm/display: bridge-connector: use a dynamic
 connector
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
Message-Id: <20261118-drm-bridge-hotplug-v3-9-44bb3b4a828f@bootlin.com>
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

Currently the drm_bridge_connector uses drmm functions to add the
drm_connector. For bridge hotplug drmm allocations are not suitable because
a connector may have to be added and removed multiple times in the lifetime
of a card.

In preparation for bridge hotplug, use the dynamic variants of
drm_connector[_hdmi]_init() and the non-drmm versions of
drmm_connector_hdmi_cec[_notifier]_register() so the drm_connector can be
removed without removing the whole card.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- convert CEC code to non-drmm too
- fix connector state error management
- put the connector on error paths after the dynamic_init() step
- fix drmm-allocation leak on drm_bridge_connector_init() error path
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 141 ++++++++++++++++++-------
 1 file changed, 102 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index f4a71801e8a3..015f6750b7f5 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -132,11 +132,27 @@ struct drm_bridge_connector {
 	 * bridge connector.
 	 */
 	struct drm_connector_hdmi_funcs hdmi_funcs;
+	/** @has_cec_adapter: true if a CEC adapter is registered */
+	bool has_cec_adapter;
+	/** @has_cec_notifier true if a CEC notifier is registered */
+	bool has_cec_notifier;
 };
 
 #define to_drm_bridge_connector(x) \
 	container_of(x, struct drm_bridge_connector, base)
 
+static void drm_bridge_connector_put_bridges(struct drm_bridge_connector *bridge_connector)
+{
+	drm_bridge_put(bridge_connector->bridge_edid);
+	drm_bridge_put(bridge_connector->bridge_hpd);
+	drm_bridge_put(bridge_connector->bridge_detect);
+	drm_bridge_put(bridge_connector->bridge_modes);
+	drm_bridge_put(bridge_connector->bridge_hdmi);
+	drm_bridge_put(bridge_connector->bridge_hdmi_audio);
+	drm_bridge_put(bridge_connector->bridge_dp_audio);
+	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Hot-Plug Handling
  */
@@ -267,6 +283,14 @@ drm_bridge_connector_color_format(const struct drm_connector_state *conn_state)
 	return conn_state->color_format;
 }
 
+static void drm_bridge_connector_dynconn_destroy(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector = to_drm_bridge_connector(connector);
+
+	drm_connector_cleanup(connector);
+	drm_bridge_connector_put_bridges(bridge_connector);
+}
+
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_create_state = drm_bridge_connector_create_state,
@@ -275,6 +299,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.debugfs_init = drm_bridge_connector_debugfs_init,
 	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 	.color_format = drm_bridge_connector_color_format,
+	.destroy = drm_bridge_connector_dynconn_destroy,
 };
 
 /* -----------------------------------------------------------------------------
@@ -823,20 +848,6 @@ static const struct drm_connector_hdmi_cec_funcs drm_bridge_connector_hdmi_cec_f
  * Bridge Connector Initialisation
  */
 
-static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
-{
-	struct drm_bridge_connector *bridge_connector = (struct drm_bridge_connector *)data;
-
-	drm_bridge_put(bridge_connector->bridge_edid);
-	drm_bridge_put(bridge_connector->bridge_hpd);
-	drm_bridge_put(bridge_connector->bridge_detect);
-	drm_bridge_put(bridge_connector->bridge_modes);
-	drm_bridge_put(bridge_connector->bridge_hdmi);
-	drm_bridge_put(bridge_connector->bridge_hdmi_audio);
-	drm_bridge_put(bridge_connector->bridge_dp_audio);
-	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
-}
-
 static struct drm_connector *
 drm_bridge_connector_initialize(struct drm_bridge_connector *bridge_connector,
 				struct drm_device *drm,
@@ -849,10 +860,6 @@ drm_bridge_connector_initialize(struct drm_bridge_connector *bridge_connector,
 	int connector_type;
 	int ret;
 
-	ret = drmm_add_action(drm, drm_bridge_connector_put_bridges, bridge_connector);
-	if (ret)
-		return ERR_PTR(ret);
-
 	bridge_connector->encoder = encoder;
 
 	/*
@@ -1053,17 +1060,21 @@ drm_bridge_connector_initialize(struct drm_bridge_connector *bridge_connector,
 				drm_bridge_connector_scrambler_disable;
 		}
 
-		ret = drmm_connector_hdmi_init(drm, connector,
-					       &drm_bridge_connector_funcs,
-					       &bridge_connector->hdmi_funcs,
-					       connector_type, ddc);
+		ret = drm_connector_hdmi_dynamic_init(drm, connector,
+						      &drm_bridge_connector_funcs,
+						      &bridge_connector->hdmi_funcs,
+						      connector_type, ddc);
 	} else {
-		ret = drmm_connector_init(drm, connector,
-					  &drm_bridge_connector_funcs,
-					  connector_type, ddc);
+		ret = drm_connector_dynamic_init(drm, connector,
+						 &drm_bridge_connector_funcs,
+						 connector_type, ddc);
 	}
-	if (ret)
-		return ret;
+	if (ret) {
+		drm_bridge_connector_put_bridges(bridge_connector);
+		return ERR_PTR(ret);
+	}
+
+	/* From now on the connector is referenced and has to be put */
 
 	if (bridge_connector->bridge_hdmi_audio ||
 	    bridge_connector->bridge_dp_audio) {
@@ -1084,35 +1095,48 @@ drm_bridge_connector_initialize(struct drm_bridge_connector *bridge_connector,
 						    bridge->hdmi_audio_spdif_playback,
 						    bridge->hdmi_audio_dai_port);
 		if (ret)
-			return ERR_PTR(ret);
+			goto err_put_connector;
 	}
 
 	if (bridge_connector->bridge_hdmi_cec &&
 	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
 		struct drm_bridge *bridge = bridge_connector->bridge_hdmi_cec;
 
-		ret = drmm_connector_hdmi_cec_notifier_register(connector,
-								NULL,
-								bridge->hdmi_cec_dev);
+		ret = drm_connector_hdmi_cec_notifier_register(connector,
+							       NULL,
+							       bridge->hdmi_cec_dev);
 		if (ret)
-			return ERR_PTR(ret);
+			goto err_put_connector;
+
+		bridge_connector->has_cec_notifier = true;
 	}
 
 	if (bridge_connector->bridge_hdmi_cec &&
 	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
 		struct drm_bridge *bridge = bridge_connector->bridge_hdmi_cec;
 
-		ret = drmm_connector_hdmi_cec_register(connector,
-						       &drm_bridge_connector_hdmi_cec_funcs,
-						       bridge->hdmi_cec_adapter_name,
-						       bridge->hdmi_cec_available_las,
-						       bridge->hdmi_cec_dev);
+		ret = drm_connector_hdmi_cec_register(connector,
+						      &drm_bridge_connector_hdmi_cec_funcs,
+						      bridge->hdmi_cec_adapter_name,
+						      bridge->hdmi_cec_available_las,
+						      bridge->hdmi_cec_dev);
 		if (ret)
-			return ERR_PTR(ret);
+			goto err_unregister_cec_notifier;
+
+		bridge_connector->has_cec_adapter = true;
 	}
 
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
+	if (!connector->state) {
+		struct drm_connector_state *state = drm_bridge_connector_create_state(connector);
+		if (IS_ERR(state)) {
+			ret = PTR_ERR(state);
+			goto err_unregister_cec_adapter;
+		}
+		connector->state = state;
+	}
+
 	if (bridge_connector->bridge_hpd)
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 	else if (bridge_connector->bridge_detect)
@@ -1128,9 +1152,43 @@ drm_bridge_connector_initialize(struct drm_bridge_connector *bridge_connector,
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
-		return ERR_PTR(ret);
+		goto err_unregister_cec_adapter;
+
+	ret = drm_connector_dynamic_register(connector);
+	if (ret)
+		goto err_unregister_cec_adapter;
 
 	return connector;
+
+err_unregister_cec_adapter:
+	if (bridge_connector->has_cec_adapter)
+		drm_connector_hdmi_cec_unregister(connector);
+err_unregister_cec_notifier:
+	if (bridge_connector->has_cec_notifier)
+		drm_connector_hdmi_cec_notifier_unregister(connector);
+err_put_connector:
+	drm_connector_put(connector);
+
+	return ERR_PTR(ret);
+}
+
+static void drm_bridge_connector_fini(struct drm_bridge_connector *bridge_connector)
+{
+	struct drm_connector *connector = &bridge_connector->base;
+
+	drm_connector_unregister(connector);
+	if (bridge_connector->has_cec_adapter)
+		drm_connector_hdmi_cec_unregister(connector);
+	if (bridge_connector->has_cec_notifier)
+		drm_connector_hdmi_cec_notifier_unregister(connector);
+	drm_connector_put(connector);
+}
+
+static void drmm_bridge_connector_fini(struct drm_device *dev, void *res)
+{
+	struct drm_bridge_connector *bridge_connector = (struct drm_bridge_connector *)res;
+
+	drm_bridge_connector_fini(bridge_connector);
 }
 
 /**
@@ -1155,6 +1213,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 {
 	struct drm_bridge_connector *bridge_connector;
 	struct drm_connector *connector;
+	int ret;
 
 	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
 	if (!bridge_connector)
@@ -1164,6 +1223,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (IS_ERR(connector))
 		return connector;
 
+	ret = drmm_add_action_or_reset(drm, drmm_bridge_connector_fini, bridge_connector);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);

-- 
2.56.1

