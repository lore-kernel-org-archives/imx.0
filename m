Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEA54CA266
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187237; cv=none; b=ntFrHf2YBxv354YO2RieajXhqTc8o7BfOTNJVJCFM2rUn+tVunjCKEqT0aEYhFYHg33d3oaLevM6tyF2ldQ3LEA1mcAHyAYdYkG4+xMUTXh0D3rVjtpyOK2WVfScyGmJKsYXGUy4yEolLNif7azYb/HBKwRZ48ERuDE7NhM4QuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187237; c=relaxed/simple;
	bh=QUuJhgNdmX36u2PudlO4XK1i7xfIVurX4c/zAXmuxP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ob27J6N+b3eOdteK7keLF0oYSeix9E8IMZwvhYgR5GyIfDxDXl/6EiujzaYUCLpCZMKNyzTmb9dqamz3Vglj3D2mUatBCPFz1MBzVU4WrO8WMlFDNRGMmejDw/EXWqzyuDeNvWN3Qvb7VQBNr/lSOeDAc3kKQ2qva0QoLpI80lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S3onPUPW; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S3onPUPW"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2AF801A362A;
	Tue, 19 May 2026 10:40:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC8E8606E9;
	Tue, 19 May 2026 10:40:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93ABC107E8A20;
	Tue, 19 May 2026 12:40:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187233; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QTBgLfeJdbyLF0o3Uh3AuWsgdFoP94RbZ7q3dzi5n8w=;
	b=S3onPUPWiUkG14dSDJ/4D30iXq6YVZFYX5uox5ys0ms9npERtrayEyx+5AxFFEi7XkUOY0
	MY44obR9CEebjZGxzRYJo9h/hsz7E8BWk6A8nHdyW7JPkF5eqg+qCB/+mOjMejoXa1GYnf
	hgcDq2iqtRrA2rUXqOvwOfQZm1y1v9vDb4HuCFn89tQvMBMB4o7a3E//dl5Ed+pHOYS/9w
	IQT8be670py57dEyhp8Rwn9wRLqhbkh0X3zMby2aAcAOYKs/GG7r56+PBGI7Wp6WOqBSUA
	ezYlvMiEHnIdL8dQG7V5CDzMKlFb1PPpzH4NnlJU4+6+j2zorAtN15yWFbXgjQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:51 +0200
Subject: [PATCH 34/37] drm/bridge: ti-sn65dsi83: implement .is_tail
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-34-45e2bdb3dfb4@bootlin.com>
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

This bridge is never a tail bridge, i.e. it always needs a following bridge
to complete the pipeline. Add a is_tail func to expose this.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index a4f2a86a09be..5613c8812318 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -293,6 +293,11 @@ static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
 	return container_of(bridge, struct sn65dsi83, bridge);
 }
 
+static bool sn65dsi83_is_tail(struct drm_bridge *bridge)
+{
+	return false;
+}
+
 static int sn65dsi83_attach(struct drm_bridge *bridge,
 			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
@@ -792,6 +797,7 @@ sn65dsi83_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs sn65dsi83_funcs = {
+	.is_tail		= sn65dsi83_is_tail,
 	.attach			= sn65dsi83_attach,
 	.detach			= sn65dsi83_detach,
 	.atomic_enable		= sn65dsi83_atomic_enable,
@@ -1066,6 +1072,7 @@ static int sn65dsi83_probe(struct i2c_client *client)
 	dev_set_drvdata(dev, ctx);
 	i2c_set_clientdata(client, ctx);
 
+	ctx->bridge.ops = DRM_BRIDGE_OP_IS_TAIL;
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;

-- 
2.54.0

