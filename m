Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BAA375AC3
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003660; cv=none; b=IgyW4SE9aRerkckDm7yukKve3izrgWcF7GfhEmchcuaEtFT4aCY0MHIMenfybCXeh7Qr8yAAJEJZa7p5L5GUS7jG1Lw6CRKuemZb7TPK/vfesaCXuvEwckmGpzaOE01o2KDagc6uAgYn0z4Ohw0Ci3cOiPjvhLAAJcpgAXP006g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003660; c=relaxed/simple;
	bh=ZZwn4L0ybODysxUKm03rAH4gUKFsaVf10PmNRRT4aEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aoZNr8ec5Ij2extFDbApD0xcCMW2J81YF12m9SvqcyBGwWZmmXBYv5Q327i0mJxbY1ve0akyuWtV6++6/YKFQsZBJSuurpg/xkcTT7r8A8S8/F1dsz3ca+45MDe3/JIK7z5KvAw/55Gd+K1h4zpg4a493st1FzsbvVgZSHQhkAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YyDIv8/7; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YyDIv8/7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AAB72C4042D;
	Fri, 20 Mar 2026 10:48:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4697F600E0;
	Fri, 20 Mar 2026 10:47:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE56910450B7D;
	Fri, 20 Mar 2026 11:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003655; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pETdlghxzqqCiEaPvqoDlYYapxYDufD9KCFbn4elZEk=;
	b=YyDIv8/7bYdeDocu6CUlzpZGjMnkb4PjerL8Ig+ktu5K5fgHaHUFSkG5523JrwqPi1KXsR
	jslev06n9xeaxJ+FEFr5Z9p9u28uuIpCRAjLlu2gQ9QXFW0m+YO0QiUp47fr9MzuizaVqu
	IgYFjTDfLJqJkHrMjfNrT+5E5OLbX4y50tgdR1CA62DFk/hqaaycr8K2LvOcSmmQ9T32Zp
	DfGoybuKtc1Luv3ACMFPEB8nPRCJTh5tbdsc1VPx3XcqqsWYaet4aRCKB1Yod4YeKCWJRE
	Tc7ta9eaQHs/oM937/IGyw0d5CTg4kZaL92GvKauTB3rjTq/8mK585OFd0+LCg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 20 Mar 2026 11:46:17 +0100
Subject: [PATCH 6/8] drm/bridge: dw-hdmi: move next_bridge lookup to attach
 time
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-lcdif-dbanc-v1-6-479a04133e70@bootlin.com>
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

This driver looks up the next_bridge at probe time and stores it in
hdmi->bridge.next_bridge, but only uses the stored value when attaching,
and only in the DRM_BRIDGE_ATTACH_NO_CONNECTOR case.

This will be problematic with an upcoming change, adding an hdmi-connector
using a device tree overlay when not present. That change is in turn
necessary to migrate the i.MX LCDIF driver to the bridge-connector.

The problem is that, adding the hdmi-connector via an overlay, devlink
considers hdmi-connector a consumer of the dw-hdmi device, generating a
chicken-egg problem:

 * hdmi-connector probe won't be tried until dw-hdmi is probed (devlink)
 * dw-hdmi probe will defer until it finds the next_bridge (the
   hdmi-connector wrapper bridge)

In preparation for those changes, move the next_bridge lookup from probe to
attach, when it is actually used. This allows dw-hdmi to probe, so that the
hdmi-connector can probe as well.

Also avoid storing the pointer in hdmi->bridge.next_bridge: the value is
computed when needed, thus a local variable is enough.

Finally, this also allows to slightly improve the code by not doing any DT
lookup in the !DRM_BRIDGE_ATTACH_NO_CONNECTOR case.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 41 +++++++++----------------------
 1 file changed, 12 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index a668d66aeece..4ee865a1a6c8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2914,9 +2914,18 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 	if (WARN_ON((flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) && !hdmi->plat_data->output_port))
 		return -EINVAL;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return drm_bridge_attach(encoder, hdmi->bridge.next_bridge,
-					 bridge, flags);
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		struct device_node *remote __free(device_node) =
+			of_graph_get_remote_node(hdmi->dev->of_node,
+						 hdmi->plat_data->output_port, -1);
+		if (!remote)
+			return -EPROBE_DEFER;
+
+		struct drm_bridge *next_bridge __free(drm_bridge_put) =
+			of_drm_find_and_get_bridge(remote);
+
+		return drm_bridge_attach(encoder, next_bridge, bridge, flags);
+	}
 
 	return dw_hdmi_connector_create(hdmi);
 }
@@ -3307,28 +3316,6 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
  * Probe/remove API, used from platforms based on the DRM bridge API.
  */
 
-static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
-{
-	struct device_node *remote;
-
-	if (!hdmi->plat_data->output_port)
-		return 0;
-
-
-	remote = of_graph_get_remote_node(hdmi->dev->of_node,
-					  hdmi->plat_data->output_port,
-					  -1);
-	if (!remote)
-		return -ENODEV;
-
-	hdmi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
-	of_node_put(remote);
-	if (!hdmi->bridge.next_bridge)
-		return -EPROBE_DEFER;
-
-	return 0;
-}
-
 bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi)
 {
 	return hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format);
@@ -3373,10 +3360,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	mutex_init(&hdmi->cec_notifier_mutex);
 	spin_lock_init(&hdmi->audio_lock);
 
-	ret = dw_hdmi_parse_dt(hdmi);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
 	if (ddc_node) {
 		hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);

-- 
2.53.0

