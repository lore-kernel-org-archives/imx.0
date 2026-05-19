Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4264D2EF6
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187163; cv=none; b=X69Rfytj8+L0/epgDBa/FTdOKvZrJzjnILCge1tw0+2eHanfgZEQUXMK+tr7SAnl7w0H6rZvW0ZwJbOpNjfK+i2/efWoksRE4vu5sXo5Xpbe2sJ2+xMZUTXFWsDRh9kJzt9wVs7suzkjSGO3Xdl2fCUF/8yrjRs9wuy6HcFKQD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187163; c=relaxed/simple;
	bh=6tZr755GEhwo/7aN3+ctTOpQ+AiSu4iO5zIwvlPSnOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJO3uUA7m9JXiIIPU+WFKrXdyG2WDs9B83nhWwOTF+HVTo4JPleUKVFtFM49HpmCYrmom4Jml0NjVW5mr26N+4FdHAAqEQSeODqDgYHGzUqucx5mHJZGInHHAMJQdfsWcXRT9EDsAwbAynrWts9W61xPB64t3UhmQT6MUERqLS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B8IVN01N; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B8IVN01N"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E22854E42CF1;
	Tue, 19 May 2026 10:39:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A9D18606E9;
	Tue, 19 May 2026 10:39:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8938E107E8AE7;
	Tue, 19 May 2026 12:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Hruhb1ZCQ/MBija+fhFHFu8qDzgA34c2IABg7xr74FQ=;
	b=B8IVN01NRf+lvOHxqOAWPpYJOgdPVyJMoN+pKM3crUPNsOwQ6/0jMT/Ug4Nebna24uoapa
	mtDelWsbPRs9BYKYo8+M24XUYWPeBUDjJUvlGvhex4UeR6lRjMVjN9saKY2tZ9mEy15VVu
	lynCgYEA6tVoVMJm2bBGpMjQjEfVcE0tqyqpn+tpghSSy7kZeAN10ZTRFNNi6q0iDANvbx
	1n641SLj8gnd8VgQ46kfjal6Z6sEJt1e7UFwyj3mRVLK+QbgjkR4xCR0OO/rmcVAOfVA5s
	WryYGacIJ8LUCHaIKH2+oKLeLKLaVzB0+qGE2E3MqGh0PqBOzbOjWTwDR0W3vg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:34 +0200
Subject: [PATCH 17/37] drm/display: bridge-connector: protect dynconn
 creation and destruction with a mutex
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-17-45e2bdb3dfb4@bootlin.com>
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

Bridge hotplug will make the connector dynamically created and destroyed
based on hotplug events.

In preparation for that, add a mutex to mutually exclude connector creation
and destruction.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index bd421b6beb7c..b83da529cc7a 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -8,6 +8,7 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -152,6 +153,11 @@ struct drm_bridge_connector {
 	 * @dynconn: The DRM connector added by the drm_bridge_connector
 	 */
 	struct drm_bridge_connector_dynconn *dynconn;
+	/**
+	 * @dynconn_mutex: Protect @dynconn from concurrent creation and
+	 * destruction
+	 */
+	struct mutex dynconn_mutex;
 };
 
 static struct drm_bridge_connector_dynconn *
@@ -810,6 +816,8 @@ static const struct drm_connector_hdmi_cec_funcs drm_bridge_connector_hdmi_cec_f
 
 static void drm_bridge_connector_dynconn_release(struct drm_bridge_connector *bridge_connector)
 {
+	guard(mutex)(&bridge_connector->dynconn_mutex);
+
 	if (!bridge_connector->dynconn)
 		return;
 
@@ -1050,6 +1058,8 @@ static int drm_bridge_connector_add_connector(struct drm_bridge_connector *bridg
 	int connector_type;
 	int ret;
 
+	guard(mutex)(&bridge_connector->dynconn_mutex);
+
 	struct drm_bridge_connector_dynconn *dynconn = kzalloc_obj(*dynconn);
 	if (!dynconn)
 		return -ENOMEM;
@@ -1177,6 +1187,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_init(&bridge_connector->dynconn_mutex);
 	bridge_connector->drm = drm;
 	bridge_connector->encoder = encoder;
 

-- 
2.54.0

