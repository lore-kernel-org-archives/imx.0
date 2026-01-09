Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB552ECD2A
	for <imx@lists.linux.dev>; Fri,  9 Jan 2026 07:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943926; cv=none; b=QS7e4ObpVNHVgcqFDG3ym7e+LkPBrbDltiAh6/YCnSchdfNbBMoAEgYtlQBes2/Aq2dm+hUNtBOL31Vs5owHGPNeGyrIZqe6eZy9MHWu75xfgYe7FXRXAcDH4JMpYZRTTAEpfbds95UiPi048m//RzmsU+Mk0gDe0LFBMkEvTrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943926; c=relaxed/simple;
	bh=DV+r/ISEZOQSU+HJQZA2LHrKuK9CqCC70n2/SzpZbVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n5m6jtSP6JiNuZDyj8YGCXMIiBLcjdhTiGgEuC4JGfNr5Me17ymF7Cb02gNlgFHDcGZTxHrk9Y+1/Em4xtRs3K4FXPA+EJ1S7By9RNiNBKTgExJqbdow7CiZohQB9rcE6Ghj/SM7mhK9hBFcBHy9HO1Ce9OGt0MSGZtKmSkppB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1kO/tS9S; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1kO/tS9S"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4775E4E4201A;
	Fri,  9 Jan 2026 07:32:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D8B960734;
	Fri,  9 Jan 2026 07:32:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD607103C87F9;
	Fri,  9 Jan 2026 08:31:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767943922; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tEemrmaT5Vu69sGAU9788b4b4bAHyoioGXyQ1NCe9sE=;
	b=1kO/tS9SGm3MhUt/nJLbjtVQeGUWbQQwTYY7Zr7xS2Ls6WEVPc4QbnSBZryoMW0uMAvrKt
	A5KDF1NtJLYt6QrofdXbTefl0KKkjZPTKqcFhS+HEFqsm2E4FlcMSjHb7hDI0ev0VXheRq
	WEpdUmefRvpWDKUK6z57Kako5EUTrVxSFM9ypvGAbCB7zATtyACOVJItenRJW7xPtDVPUZ
	M3vkIZLIBWmW1kbCpAjp2EGpUO0tEQUQaVd+waVgVXeKVduYB8iomNxkR99taSqRIAxoAC
	mUAbUYFHeWQh7ZCkSImKeeI6fuMOBjnVIFpzF80ZZaT6qRmsK0hgVtpmr731xg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:36 +0100
Subject: [PATCH v2 05/12] drm/bridge: tfp410: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-5-8bad3ef90b9f@bootlin.com>
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
 drivers/gpu/drm/bridge/ti-tfp410.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index b80ee089f880..11b5bb50e9f4 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -30,7 +30,6 @@ struct tfp410 {
 	struct gpio_desc	*powerdown;
 
 	struct drm_bridge_timings timings;
-	struct drm_bridge	*next_bridge;
 
 	struct device *dev;
 };
@@ -53,8 +52,8 @@ static int tfp410_get_modes(struct drm_connector *connector)
 	const struct drm_edid *drm_edid;
 	int ret;
 
-	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_EDID) {
-		drm_edid = drm_bridge_edid_read(dvi->next_bridge, connector);
+	if (dvi->bridge.next_bridge->ops & DRM_BRIDGE_OP_EDID) {
+		drm_edid = drm_bridge_edid_read(dvi->bridge.next_bridge, connector);
 		if (!drm_edid)
 			DRM_INFO("EDID read failed. Fallback to standard modes\n");
 	} else {
@@ -89,7 +88,7 @@ tfp410_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct tfp410 *dvi = drm_connector_to_tfp410(connector);
 
-	return drm_bridge_detect(dvi->next_bridge, connector);
+	return drm_bridge_detect(dvi->bridge.next_bridge, connector);
 }
 
 static const struct drm_connector_funcs tfp410_con_funcs = {
@@ -126,7 +125,7 @@ static int tfp410_attach(struct drm_bridge *bridge,
 	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
 	int ret;
 
-	ret = drm_bridge_attach(encoder, dvi->next_bridge, bridge,
+	ret = drm_bridge_attach(encoder, dvi->bridge.next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		return ret;
@@ -134,14 +133,14 @@ static int tfp410_attach(struct drm_bridge *bridge,
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
 		return 0;
 
-	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_DETECT)
+	if (dvi->bridge.next_bridge->ops & DRM_BRIDGE_OP_DETECT)
 		dvi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	else
 		dvi->connector.polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
-	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+	if (dvi->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD) {
 		INIT_DELAYED_WORK(&dvi->hpd_work, tfp410_hpd_work_func);
-		drm_bridge_hpd_enable(dvi->next_bridge, tfp410_hpd_callback,
+		drm_bridge_hpd_enable(dvi->bridge.next_bridge, tfp410_hpd_callback,
 				      dvi);
 	}
 
@@ -149,8 +148,8 @@ static int tfp410_attach(struct drm_bridge *bridge,
 				 &tfp410_con_helper_funcs);
 	ret = drm_connector_init_with_ddc(bridge->dev, &dvi->connector,
 					  &tfp410_con_funcs,
-					  dvi->next_bridge->type,
-					  dvi->next_bridge->ddc);
+					  dvi->bridge.next_bridge->type,
+					  dvi->bridge.next_bridge->ddc);
 	if (ret) {
 		dev_err(dvi->dev, "drm_connector_init_with_ddc() failed: %d\n",
 			ret);
@@ -169,8 +168,8 @@ static void tfp410_detach(struct drm_bridge *bridge)
 {
 	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
 
-	if (dvi->connector.dev && dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD) {
-		drm_bridge_hpd_disable(dvi->next_bridge);
+	if (dvi->connector.dev && dvi->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+		drm_bridge_hpd_disable(dvi->bridge.next_bridge);
 		cancel_delayed_work_sync(&dvi->hpd_work);
 	}
 }
@@ -362,10 +361,10 @@ static int tfp410_init(struct device *dev, bool i2c)
 	if (!node)
 		return -ENODEV;
 
-	dvi->next_bridge = of_drm_find_bridge(node);
+	dvi->bridge.next_bridge = of_drm_find_and_get_bridge(node);
 	of_node_put(node);
 
-	if (!dvi->next_bridge)
+	if (!dvi->bridge.next_bridge)
 		return -EPROBE_DEFER;
 
 	/* Get the powerdown GPIO. */

-- 
2.52.0

