Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB041397E7D
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774898816; cv=none; b=HckfcXzAgNYmj1QUCc+3ebthZXXtbmFAbeBnDdEBh/CLZak4Cj6rmQePxVbMX8UXq/BdjGrtbiskmGxS8nEWA/EnRJip34lC0p6dHmVGwjmGTDbL+r9Zbk2VMmET4RZkvLS9nX9KmFUxw5KmGZr3grw7/LUmZFtPAtWRyRRAg0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774898816; c=relaxed/simple;
	bh=6Pcf82giUoyz4el+483qK1+q2iHJAfuimQRDnd6B49k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhy51q2o2k9SxNNou95MBhbwDtcNHYy2XRA66EAEi0qwj6n9HiAczuodzFeJrba8foEgI7NjZuNeyPPq+N9Y56V0tCPwWhQ3eXqzc65VLkCmdF9Cq9fi4+VfEEd2ms2Ye0XQvUdFXhK4MhC0RS5Rq3V8n1zdT//Vj4AJeA+IIBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CipHVpMu; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CipHVpMu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 83A034E42876;
	Mon, 30 Mar 2026 19:26:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CC545FFA8;
	Mon, 30 Mar 2026 19:26:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A46FF10450CE2;
	Mon, 30 Mar 2026 21:26:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774898810; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r5YD/yxjXsXR/FTuyz0kb/x6C7V4fkojRRR9SHdzDk8=;
	b=CipHVpMu1QXvt145DSbXYeg6wDRBgyPwSrsA3rmWjAr9xhneOmVEAIrlfDq0sLCBACK+g9
	P6Wrf9YJybynvalCqXBZW33gqQE9EsdtKgGCoK+EuayXGtnk5ppmD24zUjpgx6AtErXGlA
	k6wx+6tCFSI3OjSzrEakUrJ1eWd3OeWbRxoz8luAFGZ+93+gX5sYehYIl54e5L4xJBlDNt
	Wp023PeUgPFeqdN7YdzWIz5oyEwbWkS2rg1Nu1+lpqk2yc0RUMLHCjO2TtyRi8hPXR+9kS
	3XesAILVcMNxjKHGI1nh+0I5dHy/rG4LJBmkRbwBbEum678UFwgNgoX3wHU0ig==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 30 Mar 2026 21:25:43 +0200
Subject: [PATCH v2 02/10] drm/mxsfb/lcdif: simplify ep pointer management
 using __free
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-drm-lcdif-dbanc-v2-2-c7f2af536a24@bootlin.com>
References: <20260330-drm-lcdif-dbanc-v2-0-c7f2af536a24@bootlin.com>
In-Reply-To: <20260330-drm-lcdif-dbanc-v2-0-c7f2af536a24@bootlin.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Liu Ying <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: Damon Ding <damon.ding@rock-chips.com>, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Fabio Estevam <festevam@denx.de>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Gilles Talis <gilles.talis@gmail.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 Heiko Schocher <hs@denx.de>, Josua Mayer <josua@solid-run.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 Richard Hu <richard.hu@technexion.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
 Vitor Soares <vitor.soares@toradex.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3

Putting the ep device_node reference requires a of_node_put(ep) in many
return points. Use a cleanup action to simplify the code.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch is new in v2
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 7719629487da..8da8a265c05c 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -49,7 +49,7 @@ static const struct drm_encoder_funcs lcdif_encoder_funcs = {
 static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 {
 	struct device *dev = lcdif->drm->dev;
-	struct device_node *ep;
+	struct device_node *ep __free(device_node) = NULL;
 	struct drm_bridge *bridge;
 	int ret;
 
@@ -65,23 +65,19 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 		ret = of_graph_parse_endpoint(ep, &of_ep);
 		if (ret < 0) {
 			dev_err(dev, "Failed to parse endpoint %pOF\n", ep);
-			of_node_put(ep);
 			return ret;
 		}
 
 		bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, of_ep.id);
-		if (IS_ERR(bridge)) {
-			of_node_put(ep);
+		if (IS_ERR(bridge))
 			return dev_err_probe(dev, PTR_ERR(bridge),
 					     "Failed to get bridge for endpoint%u\n",
 					     of_ep.id);
-		}
 
 		encoder = devm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
 		if (!encoder) {
 			dev_err(dev, "Failed to allocate encoder for endpoint%u\n",
 				of_ep.id);
-			of_node_put(ep);
 			return -ENOMEM;
 		}
 
@@ -91,17 +87,14 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 		if (ret) {
 			dev_err(dev, "Failed to initialize encoder for endpoint%u: %d\n",
 				of_ep.id, ret);
-			of_node_put(ep);
 			return ret;
 		}
 
 		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
-		if (ret) {
-			of_node_put(ep);
+		if (ret)
 			return dev_err_probe(dev, ret,
 					     "Failed to attach bridge for endpoint%u\n",
 					     of_ep.id);
-		}
 	}
 
 	return 0;

-- 
2.53.0

