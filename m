Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E9826ED3A
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003620; cv=none; b=i5vOsWeEAlS6yQhqc2c7/bBLVkPdlWA8DC9yw5MPpZ71YFV3ACXzV2rKRxy0CgjwA/Mc2ny8vRQWwQ26GUnipYCY1lYw+7E1rZT0BmXkiUHzFtQrziWIeMi7Ox0i3luDnA13erIoT4I146eYiRmnrV+GDC7QyEWWVBTadETGJbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003620; c=relaxed/simple;
	bh=7sclTjTeAjyJ1uFmwALfvn8o4Jdtfgut1sHma4Wr7Eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BhidUNRIAlpJ2RVI8LXf9PHiOVmbrfUHz5ZzQZzo0wAo62/qIkfiNh1tp3XuJ11NcxDFD7viZagUckXMaVzxPLSDmbV8FXi80bQFSTY1AZDm/OeTQxypHSk6ceIDy2BTb2i0wZF9pALO3p4ux5wW/wGtHxdtTY50SA7vrC2Psjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YzHwYqWw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YzHwYqWw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5A50F1A2F0E;
	Fri, 20 Mar 2026 10:46:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24B25601A0;
	Fri, 20 Mar 2026 10:46:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9EA1A10450B97;
	Fri, 20 Mar 2026 11:46:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003614; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dfwoXcfKZfOcrFCvOGrbRQGdzCvJEFHRdHoxTl+8JMk=;
	b=YzHwYqWw8kdbSA1xpu89lfslknKZSwmuF3aLrpjqoyqFxsahyC4CHj20zWXghkZunEs60b
	5huaASm19Vc3IFxQvRDDcy7Z4B5smg4Aip9oo78qeoj2elfe1lIjnNiKT/YhzKLF9feHqz
	toWHif+d97a5HtGVm3JgTTRarilC0KNxWM5oACGDvzPIkb/ctxbAMeswXS3u8HYyzJC8JW
	6I3v/0Ksssn8rOPDxACW7gmx1jTbyqE6jyfRu7asbg3zgil0cQDQYyUxGg8Tg5HvB39fjp
	s6kHkxRAHf4UdvaAoHngsvaMlaO3+Ma56926yREnEQquPEki9AO03WWePTBVew==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 20 Mar 2026 11:46:13 +0100
Subject: [PATCH 2/8] drm/mxsfb/lcdif: don't unnecessarily loop over ports
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-lcdif-dbanc-v1-2-479a04133e70@bootlin.com>
References: <20260320-drm-lcdif-dbanc-v1-0-479a04133e70@bootlin.com>
In-Reply-To: <20260320-drm-lcdif-dbanc-v1-0-479a04133e70@bootlin.com>
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
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Anson Huang <Anson.Huang@nxp.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Fabio Estevam <festevam@denx.de>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Gilles Talis <gilles.talis@gmail.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 Heiko Schocher <hs@denx.de>, 
 Joao Paulo Goncalves <joao.goncalves@toradex.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 Philippe Schenker <philippe.schenker@toradex.com>, 
 Richard Hu <richard.hu@technexion.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
 Vitor Soares <vitor.soares@toradex.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

According to the bindings [0] there can be only one port. The in-tree board
device trees also don't contain multiple ports (searched thos matching
'fsl,imx(23|28|6sx|8mp|93)-lcdif').

Avoid an unnecessary loop around multipltle ports. This allows to greatly
simplify the code.

[0] Documentation/devicetree/bindings/display/fsl,lcdif.yaml

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Viewing this patch with '--ignore-all-space' is recommended
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 77 ++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 756ca96373c8..83e134c04882 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -48,61 +48,38 @@ static const struct drm_encoder_funcs lcdif_encoder_funcs = {
 static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 {
 	struct device *dev = lcdif->drm->dev;
-	struct device_node *ep;
+	struct drm_encoder *encoder;
 	struct drm_bridge *bridge;
 	int ret;
 
-	for_each_endpoint_of_node(dev->of_node, ep) {
-		struct device_node *remote __free(drm_bridge_put) =
-			of_graph_get_remote_port_parent(ep);
-		struct of_endpoint of_ep;
-		struct drm_encoder *encoder;
-
-		if (!of_device_is_available(remote))
-			continue;
-
-		ret = of_graph_parse_endpoint(ep, &of_ep);
-		if (ret < 0) {
-			dev_err(dev, "Failed to parse endpoint %pOF\n", ep);
-			of_node_put(ep);
-			return ret;
-		}
-
-		bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, of_ep.id);
-		if (IS_ERR(bridge)) {
-			of_node_put(ep);
-			return dev_err_probe(dev, PTR_ERR(bridge),
-					     "Failed to get bridge for endpoint%u\n",
-					     of_ep.id);
-		}
-
-		encoder = devm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
-		if (!encoder) {
-			dev_err(dev, "Failed to allocate encoder for endpoint%u\n",
-				of_ep.id);
-			of_node_put(ep);
-			return -ENOMEM;
-		}
-
-		encoder->possible_crtcs = drm_crtc_mask(&lcdif->crtc);
-		ret = drm_encoder_init(lcdif->drm, encoder, &lcdif_encoder_funcs,
-				       DRM_MODE_ENCODER_NONE, NULL);
-		if (ret) {
-			dev_err(dev, "Failed to initialize encoder for endpoint%u: %d\n",
-				of_ep.id, ret);
-			of_node_put(ep);
-			return ret;
-		}
-
-		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
-		if (ret) {
-			of_node_put(ep);
-			return dev_err_probe(dev, ret,
-					     "Failed to attach bridge for endpoint%u\n",
-					     of_ep.id);
-		}
+	struct device_node *remote __free(device_node) =
+		of_graph_get_remote_node(dev->of_node, 0, -1);
+
+	if (!of_device_is_available(remote))
+		return 0;
+
+	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, -1);
+	if (IS_ERR(bridge))
+		return dev_err_probe(dev, PTR_ERR(bridge), "Failed to get bridge\n");
+
+	encoder = devm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
+	if (!encoder) {
+		dev_err(dev, "Failed to allocate encoder\n");
+		return -ENOMEM;
 	}
 
+	encoder->possible_crtcs = drm_crtc_mask(&lcdif->crtc);
+	ret = drm_encoder_init(lcdif->drm, encoder, &lcdif_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret) {
+		dev_err(dev, "Failed to initialize encoder: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to attach bridge\n");
+
 	return 0;
 }
 

-- 
2.53.0

