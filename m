Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECE93A1A5D
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187124; cv=none; b=VVOQkr0ZJuRrF+sUn9XIe1aX+eGAq+aJGxQacI1nhUhCafckr8KQSnpV8+++oyMH2VFmMzfFqaRnp111M2Hz9PiaKlbh+mQN3wnZXuJR/dnAqcfL4HzEBLVXb6+20kpOcHVLjtLeOeoKXv1BLyQLED/j8hDKhJqHFt3fjVEz6BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187124; c=relaxed/simple;
	bh=ORraiVM5xRGoKCEQfhJEwM/1gAc6itzDbntC5kcW9jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+B/UutTXgE1VUchRl1VuiddgCYIMyknAXwAUvI1qNuKIazff0yEqAq+FWflveDeUjCVBv7Vp5TYfVridvmqVNGHJ/SyepXvN3qxv7pc/DCghPGBAwIZqKn68n5rZq1QNHG48ysn9Cefe7U3vlsmYxo/qMSQcZFKv2DuCmBfXQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wSuFZS48; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wSuFZS48"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 42FF51A3620;
	Tue, 19 May 2026 10:38:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10C99606E9;
	Tue, 19 May 2026 10:38:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 531A1107E8ACA;
	Tue, 19 May 2026 12:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187119; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xJoUF1IkVlOZYxAgNMP8prmYYcvN97zlEjbFr/2f2Tw=;
	b=wSuFZS48WrOXLF1huzOWOX2I009n21Dn2TUZBOGSogCD1S3yJcBB7sX1OzRf5EP4P3Q1b/
	snTJI+Bi89+upN0esGvmQGFUXecJSHazcA/Qbh8fnRISaLtDJh8pb3OpE0sIrSUpoIO2Xe
	4UVfgSdPts/m87SP6W7FqSJYGHrRYDaOG8okESkiUJmX6qEzOPv0pKNIfh1ZG2ZzSqlNpP
	IKrZ6PbXCo9tZYepuhNOonx3wTle+mXEkdYDyBBpkWcpT2T+3wNzaJ9Sm+I7D+QT51IuUA
	Xfr4RUg9ZnLdXDG82zE4NNUH5TnjKNxbRvhnij6B+bBpWuyM9/Lk/0FvQWMmGw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:25 +0200
Subject: [PATCH 08/37] drm/display: bridge-connector: return int from
 drm_bridge_connector_get_bridges()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-8-45e2bdb3dfb4@bootlin.com>
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

This function returns a struct drm_bridge_connector * because this was the
case in the origin of its code. In current code it does not make sense
anymore: it can only return either the same pointer it received as input or
a negative ERR_PTR.

Simplify up error management by just returning an int (0 or negative
error).

No functional changes.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 61 +++++++++++++-------------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 97d9a4c6d166..d8a033ed8f41 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -772,14 +772,13 @@ static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
 	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
 }
 
-static struct drm_bridge_connector *
-drm_bridge_connector_get_bridges(struct drm_bridge_connector *bridge_connector,
-				 int *connector_type,
-				 unsigned int *supported_formats,
-				 unsigned int *max_bpc,
-				 struct i2c_adapter **ddc,
-				 struct drm_bridge **panel_bridge,
-				 bool *support_hdcp)
+static int drm_bridge_connector_get_bridges(struct drm_bridge_connector *bridge_connector,
+					    int *connector_type,
+					    unsigned int *supported_formats,
+					    unsigned int *max_bpc,
+					    struct i2c_adapter **ddc,
+					    struct drm_bridge **panel_bridge,
+					    bool *support_hdcp)
 {
 	struct drm_connector *connector = &bridge_connector->base;
 
@@ -820,27 +819,27 @@ drm_bridge_connector_get_bridges(struct drm_bridge_connector *bridge_connector,
 		}
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
 			if (bridge_connector->bridge_hdmi)
-				return ERR_PTR(-EBUSY);
+				return -EBUSY;
 			if (!bridge->funcs->hdmi_write_avi_infoframe ||
 			    !bridge->funcs->hdmi_clear_avi_infoframe ||
 			    !bridge->funcs->hdmi_write_hdmi_infoframe ||
 			    !bridge->funcs->hdmi_clear_hdmi_infoframe)
-				return ERR_PTR(-EINVAL);
+				return -EINVAL;
 
 			if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO &&
 			    (!bridge->funcs->hdmi_write_audio_infoframe ||
 			     !bridge->funcs->hdmi_clear_audio_infoframe))
-				return ERR_PTR(-EINVAL);
+				return -EINVAL;
 
 			if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME &&
 			    (!bridge->funcs->hdmi_write_hdr_drm_infoframe ||
 			     !bridge->funcs->hdmi_clear_hdr_drm_infoframe))
-				return ERR_PTR(-EINVAL);
+				return -EINVAL;
 
 			if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME &&
 			    (!bridge->funcs->hdmi_write_spd_infoframe ||
 			     !bridge->funcs->hdmi_clear_spd_infoframe))
-				return ERR_PTR(-EINVAL);
+				return -EINVAL;
 
 			bridge_connector->bridge_hdmi = drm_bridge_get(bridge);
 
@@ -852,57 +851,57 @@ drm_bridge_connector_get_bridges(struct drm_bridge_connector *bridge_connector,
 
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
 			if (bridge_connector->bridge_hdmi_audio)
-				return ERR_PTR(-EBUSY);
+				return -EBUSY;
 
 			if (bridge_connector->bridge_dp_audio)
-				return ERR_PTR(-EBUSY);
+				return -EBUSY;
 
 			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
 			    !bridge->hdmi_audio_spdif_playback)
-				return ERR_PTR(-EINVAL);
+				return -EINVAL;
 
 			if (!bridge->funcs->hdmi_audio_prepare ||
 			    !bridge->funcs->hdmi_audio_shutdown)
-				return ERR_PTR(-EINVAL);
+				return -EINVAL;
 
 			bridge_connector->bridge_hdmi_audio = drm_bridge_get(bridge);
 		}
 
 		if (bridge->ops & DRM_BRIDGE_OP_DP_AUDIO) {
 			if (bridge_connector->bridge_dp_audio)
-				return ERR_PTR(-EBUSY);
+				return -EBUSY;
 
 			if (bridge_connector->bridge_hdmi_audio)
-				return ERR_PTR(-EBUSY);
+				return -EBUSY;
 
 			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
 			    !bridge->hdmi_audio_spdif_playback)
-				return ERR_PTR(-EINVAL);
+				return -EINVAL;
 
 			if (!bridge->funcs->dp_audio_prepare ||
 			    !bridge->funcs->dp_audio_shutdown)
-				return ERR_PTR(-EINVAL);
+				return -EINVAL;
 
 			bridge_connector->bridge_dp_audio = drm_bridge_get(bridge);
 		}
 
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
 			if (bridge_connector->bridge_hdmi_cec)
-				return ERR_PTR(-EBUSY);
+				return -EBUSY;
 
 			bridge_connector->bridge_hdmi_cec = drm_bridge_get(bridge);
 		}
 
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
 			if (bridge_connector->bridge_hdmi_cec)
-				return ERR_PTR(-EBUSY);
+				return -EBUSY;
 
 			bridge_connector->bridge_hdmi_cec = drm_bridge_get(bridge);
 
 			if (!bridge->funcs->hdmi_cec_enable ||
 			    !bridge->funcs->hdmi_cec_log_addr ||
 			    !bridge->funcs->hdmi_cec_transmit)
-				return ERR_PTR(-EINVAL);
+				return -EINVAL;
 		}
 
 		if (drm_bridge_is_last(bridge))
@@ -926,9 +925,9 @@ drm_bridge_connector_get_bridges(struct drm_bridge_connector *bridge_connector,
 	}
 
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
-	return bridge_connector;
+	return 0;
 }
 
 /**
@@ -956,11 +955,11 @@ drm_bridge_connector_add_connector(struct drm_bridge_connector *bridge_connector
 
 	connector = &bridge_connector->base;
 
-	bridge_connector = drm_bridge_connector_get_bridges(bridge_connector, &connector_type,
-							    &supported_formats, &max_bpc, &ddc,
-							    &panel_bridge, &support_hdcp);
-	if (IS_ERR(bridge_connector))
-		return bridge_connector;
+	ret = drm_bridge_connector_get_bridges(bridge_connector, &connector_type,
+					       &supported_formats, &max_bpc, &ddc,
+					       &panel_bridge, &support_hdcp);
+	if (ret)
+		return ERR_PTR(ret);
 
 	if (bridge_connector->bridge_hdmi) {
 		if (!connector->ycbcr_420_allowed)

-- 
2.54.0

