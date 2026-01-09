Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD8E2F0C78
	for <imx@lists.linux.dev>; Fri,  9 Jan 2026 07:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943955; cv=none; b=lj/AmXF8rF/Oy+L67w6j1+dn5P3+F0DXbTjrrNLWFue+s+nxdNDepTBbv0Tkl4f+6V9L+Z6knjOI+ZBnLqvpKZ4ScnQBakRLzXEWVoDLIlYITvxBgEk6+2sHkCDCmUL6a+aijgszlNvvHrX+ItXipJCDNjfmouAk3181hm0zbKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943955; c=relaxed/simple;
	bh=XzkXbCn59QgP9B7qVBSs5EAoHavS4pqXomKdIU7YJrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scI4LDnYeMGAoXQ1Fm1zmMMoss+8zH6eeRLanVdIFvetw9z1Pym5OSEdPlw1vIEAIEJGcS3u0mg2K378JewtIlu2jE9YYmrBWItLwq33DNY8p3MHYShSQGbsFwq5x/Hs6aphLFi9wkZPBAXuDKsQPRSmhHKTzCRx7uW+nlQTpPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=s5o6j5fP; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="s5o6j5fP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E0A80C1F6CF;
	Fri,  9 Jan 2026 07:32:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D19360734;
	Fri,  9 Jan 2026 07:32:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1FEC103C8824;
	Fri,  9 Jan 2026 08:32:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767943951; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d9BhD/PZC1kxqwJeXLHP33WT7i5IxLGIjFxALfOr/gE=;
	b=s5o6j5fP4T/foYWtW4Uw4m4njZIpEH0ozWBO/b2efjL9bvHjFDDIctze0qRdssa1U0UTYs
	sZpGlMgEYhfruFllK8zx6bwqdNyJXgRoTiomC7S2DrfHeZROxJA6aMCgT/SfnZZKmebSm8
	28hJ4ZLbka/uWjPOWcj5PHBaU0HE80z63rCEYmP23oVnAvwv3vArpXoU4axwp9wPlshlaZ
	jA2qcxCwlkcYACxsSeyFr4WPxkWmSD3Z4S69FkLVgKnCOV8OkPOhgaCNXsGVmOr5NroYUJ
	izCcPJkGm35gjctuq3qUhDh5toStD0hDjW9maICZy1MclLrltq9Eb08drAVfRg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:43 +0100
Subject: [PATCH v2 12/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: convert to of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-12-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done. Also switch to the drm_bridge::next_bridge pointer.

This needs to handle both cases: when of_drm_find_panel() succeeds and when
it fails.

In the 'else' case (i.e. when of_drm_find_panel() fails), just switch to
of_drm_find_and_get_bridge() to ensure the bridge is not freed while in use
in the function tail, when it is stored in dsi->bridge.next_bridge.

In the 'then' case (i.e. when of_drm_find_panel() succeeds),
devm_drm_panel_bridge_add() already increments the refcount using devres
which ties the bridge allocation lifetime to the device lifetime, so we
would not need to do anything. However to have the same behaviour in both
branches take an additional reference here, so that the bridge needs to be
put whichever branch is taken without more complicated logic. Ensure to
clear the bridge pointer however, to avoid calling drm_bridge_put() on an
ERR_PTR.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- updated after "pointer set too late" fix inprevious patch
- *not* add Acked-by: Maxime as the patch has changed
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 20 +++++++++++++-------
 include/drm/bridge/samsung-dsim.h     |  1 -
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index afaa63c4d3f7..1d85e706c74b 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1828,7 +1828,7 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
-	return drm_bridge_attach(encoder, dsi->out_bridge, bridge,
+	return drm_bridge_attach(encoder, dsi->bridge.next_bridge, bridge,
 				 flags);
 }
 
@@ -1886,7 +1886,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 {
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
-	struct drm_bridge *next_bridge;
+	struct drm_bridge *next_bridge __free(drm_bridge_put) = NULL;
 	struct device *dev = dsi->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *remote;
@@ -1926,10 +1926,14 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	panel = of_drm_find_panel(remote);
 	if (!IS_ERR(panel)) {
 		next_bridge = devm_drm_panel_bridge_add(dev, panel);
-		if (IS_ERR(next_bridge))
+		if (IS_ERR(next_bridge)) {
 			ret = PTR_ERR(next_bridge);
+			next_bridge = NULL; // Inhibit the cleanup action on an ERR_PTR
+		} else {
+			drm_bridge_get(next_bridge);
+		}
 	} else {
-		next_bridge = of_drm_find_bridge(remote);
+		next_bridge = of_drm_find_and_get_bridge(remote);
 		if (!next_bridge)
 			ret = -EINVAL;
 	}
@@ -1961,7 +1965,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	}
 
 	// The next bridge can be used by host_ops->attach
-	dsi->out_bridge = next_bridge;
+	dsi->bridge.next_bridge = drm_bridge_get(next_bridge);
 
 	if (pdata->host_ops && pdata->host_ops->attach) {
 		ret = pdata->host_ops->attach(dsi, device);
@@ -1976,7 +1980,8 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	return 0;
 
 err_release_next_bridge:
-	dsi->out_bridge = NULL;
+	drm_bridge_put(dsi->bridge.next_bridge);
+	dsi->bridge.next_bridge = NULL;
 	return ret;
 }
 
@@ -1997,7 +2002,8 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
 	if (pdata->host_ops && pdata->host_ops->detach)
 		pdata->host_ops->detach(dsi, device);
 
-	dsi->out_bridge = NULL;
+	drm_bridge_put(dsi->bridge.next_bridge);
+	dsi->bridge.next_bridge = NULL;
 
 	samsung_dsim_unregister_te_irq(dsi);
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 31d7ed589233..03005e474704 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -100,7 +100,6 @@ struct samsung_dsim_plat_data {
 struct samsung_dsim {
 	struct mipi_dsi_host dsi_host;
 	struct drm_bridge bridge;
-	struct drm_bridge *out_bridge;
 	struct device *dev;
 	struct drm_display_mode mode;
 

-- 
2.52.0

