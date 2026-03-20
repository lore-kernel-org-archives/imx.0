Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FF737C91F
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003681; cv=none; b=uwN74KxcMvhVP0fM9ykGDkPTesSnWIHxgrVchNwKuuf+sZY8WR2/uw8cYimMU3JfEAiQ+J/HzN80QSG2F107gQrIP84oGy+JWd+NA1ErdHUQiVTRtH5DonX/R0UGKXY/m9mOQ35SgrubisPLyo5EUUGKUP+yJTeOvDFbmGZXafE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003681; c=relaxed/simple;
	bh=8yY00GLq7/QZCFWK0+7e9KfD4HG+wxOWqbZcKAHdVJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mt+Y7qWo9uMp2lpejbeJcMIxRCb5gg/OliYiprybhWynselFKW8jYdXkZPUFQRu6tHWTnewr5WDRREeUuqHQo7HgJuJyXZhcgDQR8ZU0E+5Wi3e3Q8KuoFpEt91mF0gg7atdOq73UsZtyRGc09bz94x58CNZWJYHC1x/gCTJVv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b4Mgr3wJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b4Mgr3wJ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 54C9E1A2F1A;
	Fri, 20 Mar 2026 10:47:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 284F0601A0;
	Fri, 20 Mar 2026 10:47:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DF5310450A35;
	Fri, 20 Mar 2026 11:47:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003674; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4T4axWR8ozOJ/Xi7kzHVRqa4a+zl3Ng+9KLl2BPnmnU=;
	b=b4Mgr3wJeBvoLayCkTLc8I0Qd/rCXnaK7pKNSXwumkcaoUPp6XZ8y7WZBak34cq4+ovggZ
	Zzus/vja8EuoI+KEcrFbmYn471Wv6wW1qEXGhcnRv7Lq8anVpAUmYuod/6HkKv6RPBDDCF
	Z6iE412IJ40rF7IrMJbBy93lRazXIwP+PHknq+tP5+k8JBchMqpOJggDQs1jD8eoPuu6P/
	rEWgFa3XJt7668IvDIfYOZdO1WPUXJCG7QYNs668QlUDVZaXThmB5s9v+s3uMfkgof5YlK
	0mYmHWg9BIzIcCct8iB1XXicjpafjEI9QsVMWkaX2T6oI0CO9ZlSDGJTZOEmhw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 20 Mar 2026 11:46:19 +0100
Subject: [PATCH 8/8] drm/mxsfb/lcdif: use DRM_BRIDGE_ATTACH_NO_CONNECTOR
 and the bridge-connector
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-lcdif-dbanc-v1-8-479a04133e70@bootlin.com>
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

Convert this driver to DRM_BRIDGE_ATTACH_NO_CONNECTOR and to the
drm_bridge_connector framework which is the current DRM bridge best
practice.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mxsfb/Kconfig     |  1 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 264e74f45554..1a8a5d1ba8c0 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -33,6 +33,7 @@ config DRM_IMX_LCDIF
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  Choose this option if you have an LCDIFv3 LCD controller.
 	  Those devices are found in various i.MX SoC (i.MX8MP,
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index e40253ad607b..3388d959c93d 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -17,6 +17,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fbdev_dma.h>
@@ -50,6 +51,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 	struct device *dev = lcdif->drm->dev;
 	struct drm_encoder *encoder;
 	struct drm_bridge *bridge;
+	struct drm_connector *connector;
 	int ret;
 
 	struct device_node *remote __free(device_node) =
@@ -72,10 +74,18 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to initialize encoder\n");
 
-	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to attach bridge\n");
 
+	connector = drm_bridge_connector_init(lcdif->drm, encoder);
+	if (IS_ERR(connector))
+		return dev_err_probe(dev, PTR_ERR(connector), "Failed to init bridge_connector\n");
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to attach connector\n");
+
 	return 0;
 }
 

-- 
2.53.0

