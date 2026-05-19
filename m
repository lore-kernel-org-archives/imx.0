Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B7A3A6F11
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187110; cv=none; b=bGq99f12AhIuq+YTsTKuJbBrwHrK0J5fxtXxyrxS4AcEsH+eX2ij6Ec1fJvI8QuagVfThCQ7nZi6O7K3GGT/PiAYMsVNG8dpR9Tun/0+2ccDp0W+/J2fhQ0IdjszdN43K3S2YJTqAeCS5tIbIlQ1tsxQWJFosSEOd+kK1qwhi7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187110; c=relaxed/simple;
	bh=c5VwM0zOXf52fMgluI/UhyL/8m78TvXodDVSx3JscIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sg8OSptCVECxa0P98u9/l+yMVidMoE1ATJWyQ0OCbr4OabKEIFF2pWz27s0KsroTsQyyUuLnEQ3yG8VlUrtFL5xvv70nm5uAA8AQd1IEvOOsCq/MknKuw3OwnVF8FhICm8IBajnq38MeFCPdYQjj6vQnm3kE5qhSX2VmtobWqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fRLPMHBu; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fRLPMHBu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AC9DD4E42CF1;
	Tue, 19 May 2026 10:38:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79416606E9;
	Tue, 19 May 2026 10:38:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE763107E8ACB;
	Tue, 19 May 2026 12:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KI66U/01m5OEBxUl36NyMu4JublFhpjqljtSlWdzHko=;
	b=fRLPMHBuiYiV/qsr2Jj2gZRh5XI18yoYzKXjyJ7++lceEmZOdXzcoIXMr/DttS8tA3bCT3
	AOMLo3vDiAgYbK6rClApHhfs1cVH579q8077g2uQk7/8vUMdl34oFJ5YrkKd+xaSzzJUvr
	uYCJ0uOv953A1aiJr1u9u2WGX3xWiNs8KDwDy4w2VtAS7wxUTSfmHut0XH87qqO2upbP0Q
	bV7+6DkOSgQooMZr70kk2r7Ct5o75cV/MgdUE43YZvEGIBv4RKD8YxgMWc9h0YD7hVUgxR
	ccDQydCfxkeQm0JvfsDlmYo7EuacwTUT6bHsLtxq3g+GllM/C5xuWwjvYWWkHw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:22 +0200
Subject: [PATCH 05/37] drm/display: bridge-connector: split code creating
 the connector to a subfunction
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-5-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

In preparation to introduce bridge hotplug, split out from
drm_bridge_connector_init() the code adding the drm_connector into a
dedicated function. This will be needed to be able to add (and re-add) the
connector from different code paths.

No functional changes. Just moving code around.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 81 ++++++++++++++++----------
 1 file changed, 50 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 62c4cb1e241f..6813c6008985 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -773,26 +773,19 @@ static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
 }
 
 /**
- * drm_bridge_connector_init - Initialise a connector for a chain of bridges
- * @drm: the DRM device
- * @encoder: the encoder where the bridge chain starts
- *
- * Create a new &drm_bridge_connector for the @drm device. The connector is
- * allocated, initialised, registered with the @drm device and attached to
- * @encoder.
+ * drm_bridge_connector_add_connector - add the drm_connector
+ * @bridge_connector: drm_bridge_connector to add the drm_connector to
  *
- * The connector is associated with a chain of bridges that starts at
- * the @encoder. All bridges in the chain shall report bridge operation flags
- * (&drm_bridge->ops) and bridge output type (&drm_bridge->type), and none of
- * them may create a DRM connector directly.
+ * Preconditions: the drm_bridge_connector is initialized (the
+ * @bridge_connector->drm and @bridge_connector->encoder fields are
+ * assigned at least)
  *
- * Returns a pointer to the new connector on success, or a negative error
- * pointer otherwise.
+ * Returns a pointer to the new drm_connector on success, or a negative
+ * error pointer otherwise.
  */
-struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
-						struct drm_encoder *encoder)
+static struct drm_connector *
+drm_bridge_connector_add_connector(struct drm_bridge_connector *bridge_connector)
 {
-	struct drm_bridge_connector *bridge_connector;
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *panel_bridge __free(drm_bridge_put) = NULL;
@@ -802,17 +795,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	int connector_type;
 	int ret;
 
-	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
-	if (!bridge_connector)
-		return ERR_PTR(-ENOMEM);
-
-	ret = drmm_add_action(drm, drm_bridge_connector_put_bridges, bridge_connector);
-	if (ret)
-		return ERR_PTR(ret);
-
-	bridge_connector->drm = drm;
-	bridge_connector->encoder = encoder;
-
 	/*
 	 * TODO: Handle doublescan_allowed and stereo_allowed.
 	 */
@@ -828,7 +810,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	 * detection are available, we don't support hotplug detection at all.
 	 */
 	connector_type = DRM_MODE_CONNECTOR_Unknown;
-	drm_for_each_bridge_in_chain_scoped(encoder, bridge) {
+	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
 		if (!bridge->interlace_allowed)
 			connector->interlace_allowed = false;
 		if (!bridge->ycbcr_420_allowed)
@@ -984,7 +966,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->hdmi_funcs.spd =
 				drm_bridge_connector_hdmi_spd_infoframe;
 
-		ret = drmm_connector_hdmi_init(drm, connector,
+		ret = drmm_connector_hdmi_init(bridge_connector->drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
 					       &drm_bridge_connector_funcs,
@@ -995,7 +977,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (ret)
 			return ERR_PTR(ret);
 	} else {
-		ret = drmm_connector_init(drm, connector,
+		ret = drmm_connector_init(bridge_connector->drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
 		if (ret)
@@ -1063,10 +1045,47 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	    IS_ENABLED(CONFIG_DRM_DISPLAY_HDCP_HELPER))
 		drm_connector_attach_content_protection_property(connector, true);
 
-	ret = drm_connector_attach_encoder(connector, encoder);
+	ret = drm_connector_attach_encoder(connector, bridge_connector->encoder);
 	if (ret)
 		return ERR_PTR(ret);
 
 	return connector;
 }
+
+/**
+ * drm_bridge_connector_init - Initialise a connector for a chain of bridges
+ * @drm: the DRM device
+ * @encoder: the encoder where the bridge chain starts
+ *
+ * Create a new &drm_bridge_connector for the @drm device. The connector is
+ * allocated, initialised, registered with the @drm device and attached to
+ * @encoder.
+ *
+ * The connector is associated with a chain of bridges that starts at
+ * the @encoder. All bridges in the chain shall report bridge operation flags
+ * (&drm_bridge->ops) and bridge output type (&drm_bridge->type), and none of
+ * them may create a DRM connector directly.
+ *
+ * Returns a pointer to the new connector on success, or a negative error
+ * pointer otherwise.
+ */
+struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
+						struct drm_encoder *encoder)
+{
+	struct drm_bridge_connector *bridge_connector;
+	int ret;
+
+	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
+	if (!bridge_connector)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drmm_add_action(drm, drm_bridge_connector_put_bridges, bridge_connector);
+	if (ret)
+		return ERR_PTR(ret);
+
+	bridge_connector->drm = drm;
+	bridge_connector->encoder = encoder;
+
+	return drm_bridge_connector_add_connector(bridge_connector);
+}
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);

-- 
2.54.0

