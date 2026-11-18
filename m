Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020696;
	b=QJmnfPUPaLY6AMVFupo7XlvCRHfWNVM5K5WgdfR5TviimqdKrtBwl4kOasD28QKzbae4
	 dwWldcYzY2RZDLSI/bZnyFvES4KKWPlkvBevwvvEHXBkXomoJbIgwtFHnjAyWcFR2+H2R
	 U23KVR/+SN2rhgBQC8iQ1B+Otq7e2KDaXYDeblNF84ttTnq81m0C2uY4uoTAEgZhShUx9
	 i06M4C2sWMTmwqA5gezccztrPEPT/Z6v23KUlpAVwFKMfX0yfPA8fGLlolI23y2bHzP/3
	 UPPtiGVjabEbJL4grSkItjBjbFCTUSzPTTKVvd5zdiLIzfslWxA7IYC1WblWJFPmuQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020696;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=dWxfOxs6Q0dpbo4RjDNuIDxsM7SkDxHUe3z8fq4Q1kY=;
	b=PvFkHDbcEdgDd1vuvIpAdkvO8GRGWh/hapFt6/AzVyvNHGsu5CFGjbk+RjaenKhhrikw
	 mOMCpbViR5RYsQZDYiUuoxFpJNaohaI+zW0V1h/Ot+w6DR5cs3zE+r0co8djTvmb8xXrH
	 8mKwg+DMAusgAcwwfr6r3qCj+G/dQOLpt+KSVQ91MTwRC4jWAGhhJJ8ow5mzCIreS/PLj
	 /ewhbsyWMPnW88rV+f50lEYODV2exzTLvyE/I6HgY2THhHb3YE77rhGdOIRtQUl7NMGS9
	 I2xN0FLdR45toViSQTvFtH59IiM5RDP60eZUyDT5SbuYtWVkgth5Oto33awRqowSLBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="J/xp2jZq";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1676460A2604
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1676460A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=J/xp2jZq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AEE48C4F77E;
	Wed, 18 Nov 2026 16:51:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7B035FE9B;
	Wed, 18 Nov 2026 16:51:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7677511BC28C8;
	Wed, 18 Nov 2026 17:51:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020693; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dWxfOxs6Q0dpbo4RjDNuIDxsM7SkDxHUe3z8fq4Q1kY=;
	b=J/xp2jZquTe/vOWqVCmtWy9eaF6Mfv6x/+hq/4vcEivdM9AVG1LNAsrPXT7PhT3MXBo6Gs
	z1RU4KRAqWkY+Pgfbgpuqrcr2pCUjoBTfadAW1a6V+3Xv/sPDL41q1FOtLNI6yNJRkthLv
	+XJyvOI8ddPi838LQpe+OwzaWz2TxVKppoAzg7nH4/Qys2KwGyY7+ydSBZMVpCJWi/Ov2Z
	kOHGlSkEwaypk/x2hQn6Nk+b/CxZdVdl2CC4+AWDW7MjOR05WvGLefkP1l8+mThEr3Hujz
	O3mQJ23axbxKs/tl01yTckTEGChiB3GtX4d8onB/3e2YgJd8a9lhOsoEJNN6oQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:57 +0100
Subject: [PATCH RFC v3 14/31] drm/bridge: ti-sn65dsi86: protect device
 resources on unplug
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
Message-Id: <20261118-drm-bridge-hotplug-v3-14-44bb3b4a828f@bootlin.com>
References: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
In-Reply-To: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
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
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

To support hot-unplug of this bridge we need to protect access to device
resources in case device removal happens concurrently to other code.

Some care is needed for the case when drm_bridge_unplug() happens before
ti_sn_bridge_atomic_post_disable(), so the latter cannot release supplier
resources taken by ti_sn_bridge_atomic_pre_enable(): runtime PM (and in
turn regulators) and refclk.

To ensure those resources are released exactly once on device removal:

 * move the code to release them to a dedicated function
 * register that function when the resources are taken in
   ti_sn_bridge_atomic_pre_enable()
 * if ti_sn_bridge_atomic_post_disable() happens before drm_bridge_unplug()
   (typical non-hot-unplug case):
   * ti_sn_bridge_atomic_post_disable() can enter the critical section
     (drm_bridge_enter() returns 0) -> it releases and executes the
     devres action
 * if ti_sn_bridge_atomic_post_disable() happens after drm_bridge_unplug()
   (typical hot-unplug case):
   * ti_sn_bridge_remove() -> drm_bridge_unplug() defuses
     ti_sn_bridge_atomic_post_disable() so it cannot execute the devres
     action
   * the devres action is executed just after ti_sn_bridge_remove()

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v3

This commit basically replicates the same change done on the ti-sn65dsi83
driver, now upstream:
https://lore.kernel.org/all/20251112-drm-bridge-atomic-vs-remove-v3-2-85db717ce094@bootlin.com/
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 50 ++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 4fd9fde77d2b..75e36bf261b0 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -852,9 +852,15 @@ static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
 					struct drm_atomic_commit *state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
 	/* disable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE, 0);
+
+	drm_bridge_exit(idx);
 }
 
 static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata,
@@ -1124,11 +1130,16 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	int ret = -EINVAL;
 	int max_dp_lanes;
 	unsigned int bpp;
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
 	if (!connector) {
 		dev_err_ratelimited(pdata->dev, "Could not get the connector\n");
+		drm_bridge_exit(idx);
 		return;
 	}
 
@@ -1206,6 +1217,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	}
 	if (ret) {
 		DRM_DEV_ERROR(pdata->dev, "%s (%d)\n", last_err_str, ret);
+		drm_bridge_exit(idx);
 		return;
 	}
 
@@ -1215,26 +1227,57 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	/* enable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE,
 			   VSTREAM_ENABLE);
+
+	drm_bridge_exit(idx);
+}
+
+/*
+ * Release resources taken by ti_sn_bridge_atomic_pre_enable().
+ *
+ * Invoked by ti_sn_bridge_atomic_post_disable() normally, or by devres
+ * after ti_sn_bridge_remove() in case this happens befora
+ * atomic_post_disable.
+ */
+static void ti_sn_bridge_release_resources(void *data)
+{
+	struct ti_sn65dsi86 *pdata = (struct ti_sn65dsi86 *)data;
+
+	if (!pdata->refclk)
+		ti_sn65dsi86_disable_comms(pdata);
+
+	pm_runtime_put_sync(pdata->dev);
 }
 
 static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					   struct drm_atomic_commit *state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
 	pm_runtime_get_sync(pdata->dev);
 
 	if (!pdata->refclk)
 		ti_sn65dsi86_enable_comms(pdata, state);
 
+	devm_add_action(pdata->dev, ti_sn_bridge_release_resources, pdata);
+
 	/* td7: min 100 us after enable before DSI data */
 	usleep_range(100, 110);
+
+	drm_bridge_exit(idx);
 }
 
 static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
 					     struct drm_atomic_commit *state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
 	/* semi auto link training mode OFF */
 	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
@@ -1243,10 +1286,9 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	/* disable DP PLL */
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
 
-	if (!pdata->refclk)
-		ti_sn65dsi86_disable_comms(pdata);
+	devm_release_action(pdata->dev, ti_sn_bridge_release_resources, pdata);
 
-	pm_runtime_put_sync(pdata->dev);
+	drm_bridge_exit(idx);
 }
 
 static enum drm_connector_status
@@ -1514,7 +1556,7 @@ static void ti_sn_bridge_remove(struct auxiliary_device *adev)
 	if (!pdata)
 		return;
 
-	drm_bridge_remove(&pdata->bridge);
+	drm_bridge_unplug(&pdata->bridge);
 
 	of_node_put(pdata->host_node);
 }

-- 
2.56.1

