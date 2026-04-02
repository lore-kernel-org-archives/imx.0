Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A8739EF33
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122155; cv=none; b=dlbfQPS7clldnVrhERTDUiMfbqsEkgrrCU5Z6FuBcFcQ6ECynMe7vspMYcBr07hwWC5GUTIiLCmNAkXXS2PUaBK6rPqozeRZsch/jeLFloW4qQk4T1ksRmOtwosWUZ/ixe77i8Vhs8nHq/JAi0ca5+JyV2/wwgpR1lsO4l/ebH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122155; c=relaxed/simple;
	bh=kzRJ0oJa/Zcsh1hbeO9DstRQpwVqFH/JmMMnA1SD13o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FK3k5RqGfdTAeqLdATznQj1KeUbLJEvVs04/vtJNhcWQPLSiOgkf0VOygEtFfKVBvQoQLkqhXaF26ns2iI4FyyB4cvWKOp4N/PtYBE6q+VMx4qrxy5RPzMS87t7qY3TqbbgV/HEJv6lq75D5PAXc4mnMqVD5TovqgY6vdScU6jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bpVyTLM/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bpVyTLM/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B196E1A30F1;
	Thu,  2 Apr 2026 09:28:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 814D25FDEB;
	Thu,  2 Apr 2026 09:28:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA28410450A10;
	Thu,  2 Apr 2026 11:28:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775122136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pzQa4LFTxQ05HmhgeiPTDH3E+TPAwdvNa3fkB5+WstU=;
	b=bpVyTLM/HvorqoMr7X5qp8JVDT4ql864Pt6NUE/XMakMFkybxl7001h+pLgJx5hZRbaPP7
	I3tdH3KU3f8CVg4PINMIcvV+KEcYCjih8Jp/+CAumYOC29b7uQ83qkp3srhkyHY1jLctbv
	ozVjj7WEwk+wH4pQN5i/YQx3dSl9eoVtMGj30lUgtiWyMiMG0/8VPptOxwc61RV6AELufM
	9kSS4IrEE5i75008f9f1Zj1G/NPBniOcCOL0d49MmlJupJWqr/bnnH3AXkGJzaCJofMiAh
	TDCK4e/qN5UjcB16PAttrVUzhpUAmV1pF/KRLqmGq+yC0DwkOBn2h3N+3x77OQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 02 Apr 2026 11:26:02 +0200
Subject: [PATCH v3 07/11] drm/bridge: dw-hdmi: move next_bridge lookup to
 attach time
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-drm-lcdif-dbanc-v3-7-27cd247a0847@bootlin.com>
References: <20260402-drm-lcdif-dbanc-v3-0-27cd247a0847@bootlin.com>
In-Reply-To: <20260402-drm-lcdif-dbanc-v3-0-27cd247a0847@bootlin.com>
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

Tested-by: Martyn Welch <martyn.welch@collabora.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8MPxL/MBa8MPxL
Acked-by: Liu Ying <victor.liu@nxp.com>
Tested-by: Damon Ding <damon.ding@rock-chips.com> # rk3399
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- Fix returned error codes
- Added missing cleanup.h include
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 45 +++++++++++--------------------
 1 file changed, 16 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ab1a6a8783cd..f4a1ebb79716 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -6,6 +6,8 @@
  * Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
  * Copyright (C) 2010, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
  */
+
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -2914,9 +2916,20 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
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
+			return -ENODEV;
+
+		struct drm_bridge *next_bridge __free(drm_bridge_put) =
+			of_drm_find_and_get_bridge(remote);
+		if (!next_bridge)
+			return -EPROBE_DEFER;
+
+		return drm_bridge_attach(encoder, next_bridge, bridge, flags);
+	}
 
 	return dw_hdmi_connector_create(hdmi);
 }
@@ -3307,28 +3320,6 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
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
@@ -3373,10 +3364,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
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

