Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3877B380FDB
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187144; cv=none; b=Dsh+9Jq95E/Sb2Q2OQ8owNT1VWj9Mu/+YIvPxt1VH1At9nvqx7ZefCzrwL3uYVmuKlaJedZpppzSnvazPTsFb9w2+GItMBtgDVFoIGSBVJyQfnwYt+Bj47LQj+d/Y5pjhbjIR2oP3rgdUDISXisHBZBBgRlsH37oSfIk/LyuFS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187144; c=relaxed/simple;
	bh=zNX7ZP4bATyMe0VbnJRflDbvEQlRNgwODK4r4YRj0LA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gaFCPg4iZ2ttEDPhNSq1u7kXDY7fo6wJw+jeaia0MFbjXwNUMUjHKNi2cWGrzblndsDcsbo4KH0YtJBNtSGsiW3XwMqXyus7GEtvZJAgi6OZRKrTA9LHjxYpBxEXV6yDKfYgJGowTTWWFWuCNmikbBLthblNwBSFj7vBVE7A8FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GKHaypOT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GKHaypOT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E7E811A3628;
	Tue, 19 May 2026 10:39:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC99F606E9;
	Tue, 19 May 2026 10:39:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62166107E8ABA;
	Tue, 19 May 2026 12:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eXrW0ECpdGk5EiWuXlmwmG6z3fjuIFkFvy0niDvkinM=;
	b=GKHaypOT9EOpAT/GxwwkPK46WJ1CA+Uh9a8HtbOMpYsDRAGLIwUJFM8pefN+wQ7OXKEaKG
	8/x0SVw6OeAoVvtqfeTIEzPAYfaN7rVWNY4V8st4UfLCocQq0pTC+7QMNGcJQAp1YjVscx
	Jz1sR9KE3uZgbGgyeL2VB0x+kRkuqng9jdH6VUmo5z3KedHbDzM+Ml8V+/vocaIa0j97eQ
	Jqlj8eT+kjHzScNSYgYehnOf83QQFuI7AWVqV5iSjeU3tSFjT13ZNA+1SEUblUTp+y7KOj
	GzacZcazm9OoXDnefCmB0VqH1dx2ot0OTq5o+KI33MhCSogWFyc/IQL6ahxVUQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:30 +0200
Subject: [PATCH 13/37] drm/display: bridge-connector: move
 drm_bridge_connector_put_bridges() definition eariler
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-13-45e2bdb3dfb4@bootlin.com>
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

drm_bridge_connector_put_bridges() will have to be called in other places
to support bridge hot-plugging.

In preparation for bridge hotplug support, move it near the top of the
file.

No functional changes. Just moving code around.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 28 +++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index defe29e339b0..2e96af8efb55 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -140,6 +140,20 @@ struct drm_bridge_connector {
 #define to_drm_bridge_connector(x) \
 	container_of(x, struct drm_bridge_connector, base)
 
+static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
+{
+	struct drm_bridge_connector *bridge_connector = (struct drm_bridge_connector *)data;
+
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
@@ -758,20 +772,6 @@ static const struct drm_connector_hdmi_cec_funcs drm_bridge_connector_hdmi_cec_f
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
 static int drm_bridge_connector_get_bridges(struct drm_bridge_connector *bridge_connector,
 					    int *connector_type,
 					    unsigned int *supported_formats,

-- 
2.54.0

