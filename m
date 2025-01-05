Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1D1C5F11
	for <imx@lists.linux.dev>; Sun,  5 Jan 2025 19:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736104064; cv=none; b=FY3glvy5ubXvY7j40LvuDf3PI1aCmCUvU1alKpGogOglaoklznbBW6Cca5jDmXmWR7Uf4H1daIGzmeLmXo0qxf1cWMAME8uFGVx9qBZmxK/6Yiny4kCG9t1aji0dOwb15cfCMqh9BI93gGUTvP0qzaImbD0Nia7uHFSzW+wMLoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736104064; c=relaxed/simple;
	bh=pc4MiVx5zqSlPofiwRJxIQsEuFNGI43vy/f9VSNai98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RTTuCd5iIeQDWj6FsjuE0L3ea1OcSvnxe//TwZZOpR9+LV40eCKKqQyoGaRr+bCr/HXzfgSc3ru2xDAEZvWXzH0/DhhVhYC985SwP56cV4TU7Ep8Qj1c42df7tcZhYs0sD72aCvYKQXp4EC2/glC/o06GGMRqNv7TwCb30gpEc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=By/EIuY8; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="By/EIuY8"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 709A6104839EE;
	Sun,  5 Jan 2025 20:07:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736104056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fh80/M+bjXGuXRz4PihlmmbyVd0aYHy4P1Io9cbXDy4=;
	b=By/EIuY8POky2LcfiA9LAlmGh2QCi0COKihtcKsGJ+cxBJSlnIFysb8sEi1PdOQjNhDuW0
	M+A9mP5m39cEUElXWSI76n4ESXUycjug/fXKH5PLdutfKQJDI6Jil0SmR7sPySqjqtvlTm
	jdKokeI+5ULcAzI59HFPGdxmE09xqIcxWp91+PuCgcqy+Lo+oEJaNtbNnWWUjpm7Sf9/X4
	b5IfcPfRca556XNN8kDunrwkxkh7JuSThbO1scCo0hCA4iCErTGIl+NJ73EOPHo3GL+sWU
	MpWjAnRVvNVLpBvLYn1NRN5iTT8vFNEy7OkYN9moSkglk2PwGHVEEsN225fXVw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
Subject: [PATCH v4 3/4] drm/mxsfb: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach
Date: Sun,  5 Jan 2025 20:06:05 +0100
Message-ID: <20250105190659.99941-3-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250105190659.99941-1-marex@denx.de>
References: <20250105190659.99941-1-marex@denx.de>
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

This makes LT9611 work with i.MX8M Mini.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
V2: Cache connector from drm_bridge_connector_init()
V3: - Add RB from Dmitry
    - Select DRM_DISPLAY_HELPER
    - Use return dev_err_probe() directly
    - Drop the single use fail path
V4: - Swap the DRM_BRIDGE_CONNECTOR and DRM_DISPLAY_HELPER in the right symbols
    - Reorder the patches, swap 3/4 and 4/4 in the series
---
 drivers/gpu/drm/mxsfb/Kconfig     |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 31 ++++++++++++++++++++-----------
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 264e74f455547..26bb2dbba49e3 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -10,8 +10,10 @@ config DRM_MXSFB
 	depends on COMMON_CLK
 	depends on ARCH_MXS || ARCH_MXC || COMPILE_TEST
 	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
 	select DRM_MXS
 	select DRM_KMS_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 59020862cf65e..07784c4f5be48 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -20,6 +20,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
@@ -119,9 +120,9 @@ static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
 static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 {
 	struct drm_device *drm = mxsfb->drm;
-	struct drm_connector_list_iter iter;
-	struct drm_panel *panel;
+	struct drm_connector *connector;
 	struct drm_bridge *bridge;
+	struct drm_panel *panel;
 	int ret;
 
 	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
@@ -139,19 +140,27 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 	if (!bridge)
 		return -ENODEV;
 
-	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
 
-	mxsfb->bridge = bridge;
+	connector = drm_bridge_connector_init(drm, &mxsfb->encoder);
+	if (IS_ERR(connector)) {
+		return dev_err_probe(drm->dev, PTR_ERR(connector),
+				     "Failed to initialize bridge connector: %pe\n",
+				     connector);
+	}
 
-	/*
-	 * Get hold of the connector. This is a bit of a hack, until the bridge
-	 * API gives us bus flags and formats.
-	 */
-	drm_connector_list_iter_begin(drm, &iter);
-	mxsfb->connector = drm_connector_list_iter_next(&iter);
-	drm_connector_list_iter_end(&iter);
+	ret = drm_connector_attach_encoder(connector, &mxsfb->encoder);
+	if (ret < 0) {
+		drm_connector_cleanup(connector);
+		return dev_err_probe(drm->dev, ret,
+				     "Failed to attach encoder.\n");
+	}
+
+	mxsfb->bridge = bridge;
+	mxsfb->connector = connector;
 
 	return 0;
 }
-- 
2.45.2

