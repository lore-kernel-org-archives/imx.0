Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B8B2FB6
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 00:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735001121; cv=none; b=GS34mcYnqFarmsncJ0xY7QWtxZ13ovbVl1mzxMOJHWxqoB7dSNDm67WGZo4yLSCCwf9wcKjbilatx/EEvUzt0ubdU9HsdvyIbta7N523EVJd5yKg03hKmp+mYDXWISTC42wQHbr03SfIuVhwQOw/BSSwhuKdu7Zm3stzQL3EnJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735001121; c=relaxed/simple;
	bh=ad9jLTQ9yFhBgMK4SpCzx666hsLZCWWQHB78uYt216s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTZatC/L+Y0qEBZMvhLX2a5TrR/0y5/6QCAogMY078b9CUS8lYwS0B7yBWPAyYUyg0w3z05ZY3tJfWFdtZwPqaOY6AOmhr4SiIwXnpwhtyAeUQZh0ZxHo1jMeajSE2l0Y2jicEMXaVPbMor24f3pg0NmUrH4i19WZ3kVs/kpdXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=hRANGfKp; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="hRANGfKp"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA5F2101EC114;
	Tue, 24 Dec 2024 01:45:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735001115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Eu/UkuEd73FgMvGaujLuGdH66PYZ3/sKN1baeAfyWM=;
	b=hRANGfKpPLgd86CE9yahz4RtaiI0v6/m3Bfa9/NzDI3l9LxNAjolc/ZKfXXDF/KsHuB0Zi
	/hKmsw1IHLnZgoC6EJ4gXPF6hAtqRTxxVTc0u3mCmEN14BEdO2QHvbRF2mrNdw/Xn4RYN3
	zGJACBpU9GA+akeWAlZvqbyf63MzHMGo7nQIrEgZe++o+742Kq3q2lX5hov0fMt/IiLEi2
	aoD1HpwKX8AT+H0Dy6bwvj3eD45/IAGLThTTxa00VxbJ8rI/sqOhIgcSSa8KFQ52I5mQu4
	WEe7p3xmZ+Y9QKPR4N1tHCle+Pimt8LM+BnzQpl0RASFSxfWd+PnBr7RauQQxw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach
Date: Tue, 24 Dec 2024 01:42:48 +0100
Message-ID: <20241224004439.239880-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241224004439.239880-1-marex@denx.de>
References: <20241224004439.239880-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
this flag in some way since then.
Newly added bridge drivers must no longer contain the connector creation and
will fail probing if this flag isn't set.

In order to be able to connect to those newly added bridges as well,
make use of drm_bridge_connector API and have the connector initialized
by the display controller.

Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")

This makes LT9611 work with i.MX8M Plus.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mxsfb/Kconfig     |  1 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 23 ++++++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 264e74f455547..07fb6901996ae 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -30,6 +30,7 @@ config DRM_IMX_LCDIF
 	select DRM_CLIENT_SELECTION
 	select DRM_MXS
 	select DRM_KMS_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 8ee00f59ca821..40dfbc3e6118e 100644
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
@@ -48,6 +49,8 @@ static const struct drm_encoder_funcs lcdif_encoder_funcs = {
 static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 {
 	struct device *dev = lcdif->drm->dev;
+	struct drm_device *drm = lcdif->drm;
+	struct drm_connector *connector;
 	struct device_node *ep;
 	struct drm_bridge *bridge;
 	int ret;
@@ -97,13 +100,31 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 			return ret;
 		}
 
-		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+		ret = drm_bridge_attach(encoder, bridge, NULL,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret) {
 			of_node_put(ep);
 			return dev_err_probe(dev, ret,
 					     "Failed to attach bridge for endpoint%u\n",
 					     of_ep.id);
 		}
+
+		connector = drm_bridge_connector_init(drm, encoder);
+		if (IS_ERR(connector)) {
+			ret = PTR_ERR(connector);
+			dev_err_probe(drm->dev, ret,
+				      "Failed to initialize bridge connector: %pe\n",
+				      connector);
+			return ret;
+		}
+
+		ret = drm_connector_attach_encoder(connector, encoder);
+		if (ret < 0) {
+			dev_err_probe(drm->dev, ret,
+				      "Failed to attach encoder.\n");
+			drm_connector_cleanup(connector);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.45.2

