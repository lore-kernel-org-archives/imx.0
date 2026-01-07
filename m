Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400E6322B69
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 13:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791642; cv=none; b=PxCtN7cejXt/DETx+VxnReisMXssXdQ9Tz+6YwLxXz2kig/en71owVceNVdOIuvqdwShjsIKbF8toX55v3t2OJDn0MB2oLF9MPXo/kvun5UAVZ7BbXqbnTWyRMU2q3eUafg5wgMAYY3F7vQC1fAc9XULtRrxOLAoGiLrDPpRB5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791642; c=relaxed/simple;
	bh=5uyAcdSQaBD0uaR8XwoS4ZuYdnCHaPZwLecUoyO5JN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lu2Cf3FB3VSzehKoedPLb6uPO7pg0CJigoz6iQKnN5MxkEwQAgMRSzMurGQJRKxSDlD9bfHLx48FKZ+ZYKQrjyuKcnDWcoW2Blq0aanx+5H/etgAgkP+TH7c9id7oVzfIyNN4E8/xTxo3levX2wWKjCv+o75+TFc25ofcMYP8fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TIO54g4w; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TIO54g4w"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BEDC54E41FDE;
	Wed,  7 Jan 2026 13:13:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91B97606F8;
	Wed,  7 Jan 2026 13:13:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41B97103C821A;
	Wed,  7 Jan 2026 14:13:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791637; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1CEWiPfXmSvImae/moe/m8LK+rcX6LoChzh68M+VFJo=;
	b=TIO54g4weKu/1ZYRW5/qMJvg/VloZaPMnebU2gnxO2Z3oklO0k4Hr2dZC6D63YBxIm41ER
	26LL9iP9lIRIuv92YvQl8sIdg5/1bBGHap7qjDjV3Zwtj0W/eOxisqaG9IWFiYEBvVUU/z
	3T6fs2YvYwy0VtMTrzZPFwDq/WSXJJFrZ8pPuIwfXJh7+v7x6CwBS9odoR+occeFl+b988
	jHeU5JqmTSDHguvKL8hNuRn/mSwzd6sRDQM2X15sDNZLVstb61hEo7WBCT6hz+tBScV7Y6
	V860pZERTjBsxF9p4yMTISaFr/80f1L5dXYp55LY/3nysr8wp133lO46ycTMyw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:12:58 +0100
Subject: [PATCH 07/12] drm/bridge: lt8912b: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-7-283d7bba061a@bootlin.com>
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
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 342374cb8fc6..8a0b48efca58 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -35,7 +35,6 @@ struct lt8912 {
 	struct regmap *regmap[I2C_MAX_IDX];
 
 	struct device_node *host_node;
-	struct drm_bridge *hdmi_port;
 
 	struct mipi_dsi_device *dsi;
 
@@ -407,8 +406,8 @@ lt8912_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct lt8912 *lt = connector_to_lt8912(connector);
 
-	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_DETECT)
-		return drm_bridge_detect(lt->hdmi_port, connector);
+	if (lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_DETECT)
+		return drm_bridge_detect(lt->bridge.next_bridge, connector);
 
 	return lt8912_check_cable_status(lt);
 }
@@ -429,7 +428,7 @@ static int lt8912_connector_get_modes(struct drm_connector *connector)
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	int ret, num;
 
-	drm_edid = drm_bridge_edid_read(lt->hdmi_port, connector);
+	drm_edid = drm_bridge_edid_read(lt->bridge.next_bridge, connector);
 	drm_edid_connector_update(connector, drm_edid);
 	if (!drm_edid)
 		return 0;
@@ -519,8 +518,8 @@ static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 	struct drm_connector *connector = &lt->connector;
 
-	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD) {
-		drm_bridge_hpd_enable(lt->hdmi_port, lt8912_bridge_hpd_cb, lt);
+	if (lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+		drm_bridge_hpd_enable(lt->bridge.next_bridge, lt8912_bridge_hpd_cb, lt);
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 	} else {
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
@@ -529,7 +528,7 @@ static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
 
 	ret = drm_connector_init(bridge->dev, connector,
 				 &lt8912_connector_funcs,
-				 lt->hdmi_port->type);
+				 lt->bridge.next_bridge->type);
 	if (ret)
 		goto exit;
 
@@ -549,7 +548,7 @@ static int lt8912_bridge_attach(struct drm_bridge *bridge,
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 	int ret;
 
-	ret = drm_bridge_attach(encoder, lt->hdmi_port, bridge,
+	ret = drm_bridge_attach(encoder, lt->bridge.next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0) {
 		dev_err(lt->dev, "Failed to attach next bridge (%d)\n", ret);
@@ -585,8 +584,8 @@ static void lt8912_bridge_detach(struct drm_bridge *bridge)
 
 	lt8912_hard_power_off(lt);
 
-	if (lt->connector.dev && lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
-		drm_bridge_hpd_disable(lt->hdmi_port);
+	if (lt->connector.dev && lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD)
+		drm_bridge_hpd_disable(lt->bridge.next_bridge);
 }
 
 static enum drm_mode_status
@@ -611,8 +610,8 @@ lt8912_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 
-	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_DETECT)
-		return drm_bridge_detect(lt->hdmi_port, connector);
+	if (lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_DETECT)
+		return drm_bridge_detect(lt->bridge.next_bridge, connector);
 
 	return lt8912_check_cable_status(lt);
 }
@@ -626,8 +625,8 @@ static const struct drm_edid *lt8912_bridge_edid_read(struct drm_bridge *bridge,
 	 * edid must be read through the ddc bus but it must be
 	 * given to the hdmi connector node.
 	 */
-	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_EDID)
-		return drm_bridge_edid_read(lt->hdmi_port, connector);
+	if (lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_EDID)
+		return drm_bridge_edid_read(lt->bridge.next_bridge, connector);
 
 	dev_warn(lt->dev, "The connected bridge does not supports DRM_BRIDGE_OP_EDID\n");
 	return NULL;
@@ -723,8 +722,8 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 		goto err_free_host_node;
 	}
 
-	lt->hdmi_port = of_drm_find_bridge(port_node);
-	if (!lt->hdmi_port) {
+	lt->bridge.next_bridge = of_drm_find_and_get_bridge(port_node);
+	if (!lt->bridge.next_bridge) {
 		ret = -EPROBE_DEFER;
 		dev_err_probe(lt->dev, ret, "%s: Failed to get hdmi port\n", __func__);
 		goto err_free_host_node;

-- 
2.52.0

