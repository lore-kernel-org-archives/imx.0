Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B123F1AA0
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187229; cv=none; b=KTz3oeHWjWVTx88wC6ROzgRwP4K9MEjl2WZegCxOMQgiudTmR6VujaY1IhYUqQ9BNqDv1eWWsO6vahkuoikgzUDUAUi1s4TJZ4AD1FYKG5Ydbout0EremD3vPVHmQcRhrXbM5UjsYGRrOb7rSNtoZcMRa35Zkam6SDzgJOtXKm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187229; c=relaxed/simple;
	bh=lkjVZg9vpS4ljCAhd540O9Rhi31RLmW0pLx/SUaTQfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eA4+/a6C7+NchDjZDjJWt7fwid0HJYIvfHSO1oC4T2Fxh1W7GnFWG7izd9wNiZhQPL2rVOECMmKyQdkq9jCC8dF83iopALx294xeYyYVHngwswVu5JBA94ochdnQ/s0T76QRfkN4Zc1h4vOlgp0pZogm6Uz9PowEU6e2rKxuCZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T2N7PCEV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T2N7PCEV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A929A1A362A;
	Tue, 19 May 2026 10:40:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D843606E9;
	Tue, 19 May 2026 10:40:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48445107E8B03;
	Tue, 19 May 2026 12:40:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187224; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oaDZzNhhlsYfML//xOFG6wXWu65nBogs+zUTIz1RF5A=;
	b=T2N7PCEVTYuTIU/5aFtL7cpuaWtxZfffb3xfVtA1+0l/280seqzJHH8z3a/bdTY6qX2Phx
	oKG+/QhlBnQZfNJ5rX3rGKFbSn7vXUx8uBPdiqPsUIzfFuR65GWIaKc3hmcSTOnTBVeIRz
	xG9jrGkyD223AxSEW2TUMqu6WQ0Geb/xr4X6CLxuEg30pGGb8heXHi704vaN+dRhDREnGy
	x0KKbq7d/YONoI+Qan9EJ+f6kSQLIqfh55AxPUD7mqrRY8eCBQ0RkCLOZL2VoSJdRsQfXB
	xSFH5qg0P3s3x9Js61QcoCHSCkAataRa3DRieMQtzs1d/4s1hARFu47Y9jrYXA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:49 +0200
Subject: [PATCH 32/37] drm/bridge: display-connector: implement .is_tail
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-32-45e2bdb3dfb4@bootlin.com>
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

This bridge is always a tail bridge, i.e. it never needs a following bridge
to complete the pipeline. Add a is_tail func to expose this.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/display-connector.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 16c0631adeb1..1c8111bdc89e 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -33,6 +33,11 @@ to_display_connector(struct drm_bridge *bridge)
 	return container_of(bridge, struct display_connector, bridge);
 }
 
+static bool display_connector_is_tail(struct drm_bridge *bridge)
+{
+	return true;
+}
+
 static int display_connector_attach(struct drm_bridge *bridge,
 				    struct drm_encoder *encoder,
 				    enum drm_bridge_attach_flags flags)
@@ -176,6 +181,7 @@ static u32 *display_connector_get_input_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs display_connector_bridge_funcs = {
+	.is_tail = display_connector_is_tail,
 	.attach = display_connector_attach,
 	.detect = display_connector_bridge_detect,
 	.edid_read = display_connector_edid_read,
@@ -370,6 +376,7 @@ static int display_connector_probe(struct platform_device *pdev)
 
 	conn->bridge.of_node = pdev->dev.of_node;
 
+	conn->bridge.ops = DRM_BRIDGE_OP_IS_TAIL;
 	if (conn->bridge.ddc)
 		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
 				 |  DRM_BRIDGE_OP_DETECT;

-- 
2.54.0

