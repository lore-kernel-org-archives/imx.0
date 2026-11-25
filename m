Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629217;
	b=bESm4Z+N5WWgMSjFv0obhxTXJ7sl+c8wB17t8dITbYxkoGYIqS2/3E76PQFQCcF8dD0n
	 urOZ+1MeTeeHQJDWs2ElsNxeQWM+Xy4gmzAIoJvw/Gv+1xCJ0h26K9yEg/h90f1kGLoEZ
	 VvYrO2pLa8s1QMgtyHIt0Z6BcdqALoXf3V59qvV8MknYW1C8o098R7moAfqcQSkCV4sK7
	 +IPmBPAUkBuN2ykggVPBGhaRrAbdaQfjMTADdpCihjEL/VRFcv0hUt6nUj4MtfGupBe1j
	 a5A4f83kaWjrDFfzGGNVBYSwO8X7/aO+bl6XqYNNyzL7/vNUYChiikdbNKk4l5AACCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629217;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=DuwEjnJtmzJJbWD7jsgAnMyz48N57m/HEq7JVSD/1RU=;
	b=S8T4dpbU6FdEj4k1K6C0mM8K7pBW9dm2PzN8OvPgRYx3PBDqkXeOzYLqSM4SKj1EdAy3
	 j/IuD4HUGLTVbOY0DSnIDd1fMmWsIaVMLCAFLsdyIu/KjdIgUuGh6IOLEzp+zHdWzIjCx
	 JKZOzduDbnucsJaiWGexnNuGCsv36YY8GO6PCrUmAF3gwNyI6eWlLuyOm7s6F8LnIuDJm
	 Ls6CwCVmUE5b3ZXWcrGoeEqLUaRebNR2I3ufIeYsAfcH7nsD8XE3sB70rKhSxM4W34Nu5
	 a7+cF/2/J7rx5wWlmm8KeePMijevk4BGJLYcaFvGf9F8FCq0j5b8sI5W5FdjkwNdW/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JCamUHKa;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532B0606A327
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 532B0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JCamUHKa
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 13F331A1800;
	Wed, 25 Nov 2026 17:53:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD12960480;
	Wed, 25 Nov 2026 17:53:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C938911E6B0AE;
	Wed, 25 Nov 2026 18:53:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DuwEjnJtmzJJbWD7jsgAnMyz48N57m/HEq7JVSD/1RU=;
	b=JCamUHKaQ2mA7dmYO01EBwfRusgAWfmmaj+lLhFcRo4/ii1TsVF2oRKcu0nHylOldb2hzT
	Kd5InTzW63oYO03IPj1q9aeQ08SupDQDnmtko2bpQqp2UFVfECpIlkos2NUP/zmfKLahkD
	IZUVzJCVAYHNiGhXoIU1kfjJl7zHg/4rN/8lcWe5Kvz1IOmqJ+sWpvMQhbtVP96InAH1NN
	4inS9Nbvi2JuD5OKaX8eGh70E8UaLGNx6mAuYsNQHyPdhIkNC2fD4PXpED2ScekceJHkVD
	obJcZprtnTkxyZKVxdZLsGeHeIsN76Qb2F9039OgGW81s4hPGYav8TeBnHM7+w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:36 +0100
Subject: [PATCH v4 23/32] drm/bridge: ti-sn65dsi83: implement
 .get_next_bridge
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
Message-Id: <20261125-drm-bridge-hotplug-v4-23-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
In-Reply-To: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add get_next_callback func to expose the next bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- add missing drm_bridge_get
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 77ef1613c5f5..9e9cf0dda92d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -295,6 +295,13 @@ static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
 	return container_of(bridge, struct sn65dsi83, bridge);
 }
 
+static struct drm_bridge *sn65dsi83_get_next_bridge(struct drm_bridge *bridge)
+{
+	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+
+	return ctx->panel_bridge ? drm_bridge_get(ctx->panel_bridge) : ERR_PTR(-ENODEV);
+}
+
 static int sn65dsi83_attach(struct drm_bridge *bridge,
 			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
@@ -795,6 +802,7 @@ sn65dsi83_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs sn65dsi83_funcs = {
+	.get_next_bridge	= sn65dsi83_get_next_bridge,
 	.attach			= sn65dsi83_attach,
 	.detach			= sn65dsi83_detach,
 	.atomic_enable		= sn65dsi83_atomic_enable,
@@ -1045,6 +1053,7 @@ static int sn65dsi83_probe(struct i2c_client *client)
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;
+	ctx->bridge.ops = DRM_BRIDGE_OP_GET_NEXT_BRIDGE;
 	drm_bridge_add(&ctx->bridge);
 
 	ret = sn65dsi83_host_attach(ctx);

-- 
2.56.1

