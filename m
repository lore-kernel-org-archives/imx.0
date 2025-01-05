Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3761547C5
	for <imx@lists.linux.dev>; Sun,  5 Jan 2025 19:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736104056; cv=none; b=Q5VWaPmb90TGb56ZeBkKJcoJXJpcNduszzD3/A6u5uYEFHQRX9hn8EmI8zsLM7H/E6CIP7BDOy5n9XoVlG8cGFl4UDStiUqYh6uVUiNVh/SHD2cXRddOwKEyyyDWXcwsPJrP5MQ865q3wxeq3T5GRA2m94WVWnQ6iBB0D8BKBk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736104056; c=relaxed/simple;
	bh=ieldy8rj5ZqLVlbnW8V4Vl64kKyxdjNPmlN1RySDfzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iygY8auoVoTr7jzWsKn8+HXkKSbM45+cY7QsRgpnBIB354iwNxa63FjccR1GEvKvasc5e2MNazzNmx7A9iAbtcB9TDUmCFwMEjTyVTijjP3ayTtVA5nFTyFJzuqCJKhrFrPVEd8gNAGFrvuJpSmGCj4Oh8OM3Ho3VPkftX0KAUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=GHqctiTM; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="GHqctiTM"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B97A10408FB9;
	Sun,  5 Jan 2025 20:07:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736104043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qbPaYdLjULZi5RoBrt7rDIF6XL0fx+U5ZuOgdKQUJ1E=;
	b=GHqctiTMczjRVgtsWG6Soz6dOGmoEeW8z37m9uwA+hZuvRarmIeegBvKgFYToYoVKINxVX
	rh6GLlAcd6VU4jZcvKpn4AqDJftLXiqcmx1RPoQ+yEWcDDC/kLFHlfRGfcmY9IhirnmPq/
	W3xw7W4tQYBQEMG2cFeCH+f8jAWI1FGkAnYgit+O0EwVNHna3AekTg9cM6op4FBO6ZessL
	bDSzgMgJ95TC3ggcD5Ky2+Ql1mbpH5f+txiIWrwsl8zBpvzJ/y4Fsm4hyavU9ntFDWcK/A
	i/Ln2IVfyuD5ZlEFJcv76cInMmt6Xdm5xK+X5pTk2ZXdd6wAcTEoqsf4iv0nEw==
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
Subject: [PATCH v4 1/4] drm: bridge: dw_hdmi: Add flag to indicate output port is optional
Date: Sun,  5 Jan 2025 20:06:03 +0100
Message-ID: <20250105190659.99941-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add a flag meant purely to work around broken i.MX8MP DTs which enable
HDMI but do not contain the HDMI connector node. This flag allows such
DTs to work by creating the connector in the HDMI bridge driver. Do not
use this flag, do not proliferate this flag, please fix your DTs and add
the connector node this way:

```
/ {
    hdmi-connector {
        compatible = "hdmi-connector";
        label = "FIXME-Board-Specific-Connector-Label"; // Modify this
        type = "a";

        port {
            hdmi_connector_in: endpoint {
                remote-endpoint = <&hdmi_tx_out>;
            };
        };
    };
};

&hdmi_tx {
    ...

    ports {
        port@1 {
            hdmi_tx_out: endpoint {
                remote-endpoint = <&hdmi_connector_in>;
            };
        };
    };
};
```

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
V3: New patch
V4: - Add HDMI connector node addition example into commit message
    - Bail from dw_hdmi_bridge_attach() if DRM_BRIDGE_ATTACH_NO_CONNECTOR
      is set and there is no hdmi->next_bridge , so the connector can
      be created in scanout driver.
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 8 ++++++--
 include/drm/bridge/dw_hdmi.h              | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 996733ed2c004..e84693faf46dc 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2893,9 +2893,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		if (!hdmi->next_bridge)
+			return 0;
+
 		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
 					 bridge, flags);
+	}
 
 	return dw_hdmi_connector_create(hdmi);
 }
@@ -3298,7 +3302,7 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
 					  hdmi->plat_data->output_port,
 					  -1);
 	if (!remote)
-		return -ENODEV;
+		return hdmi->plat_data->output_port_optional ? 0 : -ENODEV;
 
 	hdmi->next_bridge = of_drm_find_bridge(remote);
 	of_node_put(remote);
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 6a46baa0737cd..3bb6e633424a8 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -127,6 +127,8 @@ struct dw_hdmi_plat_data {
 	struct regmap *regm;
 
 	unsigned int output_port;
+	/* Used purely by MX8MP HDMI to work around broken DTs without HDMI connector node. */
+	bool output_port_optional;
 
 	unsigned long input_bus_encoding;
 	bool use_drm_infoframe;
-- 
2.45.2

