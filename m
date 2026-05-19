Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A790C4CA278
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187149; cv=none; b=WYtEURjBYVQO6FVYAX9g9vhq5muEgEwsEAsstnwstuvoDh7MICZk1uAHTwGi9HnIfhx6mfT5JJFS6aCJ6bwX/XO/3zlBgLMtE9Z/CyV5XoJzyhOYXjcnMtKZtTKcvCZef7wKNgDPDn8BcWqQaIBgh+wHm+zL4fI47eHPzhrTxCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187149; c=relaxed/simple;
	bh=tmhahMhHtslRheRjGpc6XZyT6YbZPI0cQYdJQHNSbJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cl0/ThX+821FtXHLbQnGfIPRlrMXs0QcMVWl70HBC5/RhJsmPLwkXiuGSAbLY+mYNWXqa3oQQuI2auu6CZib78pSxl14JCKARg9poDSZqdDaMZL1cMIdE+Q+Ap/tOClIc4KU8lGn9oE/lp1uMOIS/rgiFoZceCD/FSPvyt05nR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mvr5e0VV; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mvr5e0VV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AAEC7C2B9DB;
	Tue, 19 May 2026 10:39:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F33E606E9;
	Tue, 19 May 2026 10:39:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9ADA107E8AC3;
	Tue, 19 May 2026 12:39:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187144; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MXzXfL976Jh5LzLUVnfB4dSuaOKmXeLa4YHSSt3GjME=;
	b=mvr5e0VVd1QTAoTY4anq7bRyw806/vu0HCW5SbK80z86N8zp0Mfl3BqaF33jMA/doGTFo5
	k3U0N0lmciuV/30HYvH2FXk/QJy/2fDqpN0rCSVyB3+/xpy61VRFQOdjDyYq/cViH9MVqL
	HXAfdtuT9GVGvDqMMJEJD8NFWLOWa8GI5ApFLC6gtc6pN8/RbfIKt53lJQHkA2NM7H7pF1
	PsaiVu3x4XZebT/g5MQ3GL2l3wnHvFc5waYJRTdeqHYemx/Pb6QsVfhq0fAX5ab4CpxLVn
	1BzgrKx05o/youqmRQi2Tar7gFmUpG3RH32mTBh+EAxIwlS51Ox3BralXNDE6A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:31 +0200
Subject: [PATCH 14/37] drm/display: bridge-connector: add non-drmm variant
 of drm_bridge_connector_put_bridges()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-14-45e2bdb3dfb4@bootlin.com>
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

drm_bridge_connector_put_bridges() is currently meant as a drmm cleanup
action. In preparation for bridge hotplug add a non-drmm action, so it can
be called more simply in non-drmm context.

To do this split drm_bridge_connector_put_bridges() in two variants, both
doing the same actions and only differing in the name and arguments:

 * drm_bridge_connector_put_bridges() (same name as before) to be called
   directly by the drm_bridge_connector code with a drm_bridge_connector
   pointer as the only parameter
 * drmm_bridge_connector_put_bridges() (same name + drmm prefix) providing
   the same drmm calling convention as before

Update the only call site accordingly.

No functional changes.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 2e96af8efb55..1fd104f1647b 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -140,10 +140,8 @@ struct drm_bridge_connector {
 #define to_drm_bridge_connector(x) \
 	container_of(x, struct drm_bridge_connector, base)
 
-static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
+static void drm_bridge_connector_put_bridges(struct drm_bridge_connector *bridge_connector)
 {
-	struct drm_bridge_connector *bridge_connector = (struct drm_bridge_connector *)data;
-
 	drm_bridge_put(bridge_connector->bridge_edid);
 	drm_bridge_put(bridge_connector->bridge_hpd);
 	drm_bridge_put(bridge_connector->bridge_detect);
@@ -154,6 +152,13 @@ static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
 	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
 }
 
+static void drmm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
+{
+	struct drm_bridge_connector *bridge_connector = (struct drm_bridge_connector *)data;
+
+	drm_bridge_connector_put_bridges(bridge_connector);
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Hot-Plug Handling
  */
@@ -1099,7 +1104,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drmm_add_action(drm, drm_bridge_connector_put_bridges, bridge_connector);
+	ret = drmm_add_action(drm, drmm_bridge_connector_put_bridges, bridge_connector);
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.54.0

