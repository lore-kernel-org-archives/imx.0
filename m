Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94307381C4
	for <imx@lists.linux.dev>; Tue, 31 Dec 2024 19:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735673399; cv=none; b=A56z+R+bOr4Ud+GSBn+TDAJ45DmJtfN1JGeSPFPL4uCtFvSYuJFwOMD2+qeIphHKyfW/y8xc9I6D9GpF0cOqcbFgX4Ce1sNDKXalrXRUkZy3kHNTtsW8/zDUotS5eB6wC6D1xEBdV+uZav9XR2dDG3jiDvSU/APmqR8lNUZD2Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735673399; c=relaxed/simple;
	bh=/Wm7e0T+XmN3fW322DUG06kGVHZhBimQoCMVJ8m0tJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C/Qf/5y/cC++I6wKkTlLpI3pOc/MSHCdPFHOUO4bYC+F/Stj1ZozXH9DwnhkZy2Kz5WyxIj1HsHIgmdytY1OX8Z4bRK9faWzTVm5UAEyBa3P2sryVdFINYnXoZrme44F4MBr5cDseq1ihhN967Qa0k3RscxxnHlRlCeztpJGX6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=SSSiv3ir; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="SSSiv3ir"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9802E104855B1;
	Tue, 31 Dec 2024 20:29:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735673388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MZEWmN4GN5G1sABY/mv4D6+HIYv/6uOJhfv6635kFT8=;
	b=SSSiv3irUUXzx7nqQ6tWRryfPL3RUPx2U1XYOP5k8dgpHW9tWjWQWbYGFWKoyBI/lVWaPT
	291ngQmHU1jh3qYi6pXY7hpznxcKYrW/ToN7VKNE2nGq+uS5/N2c537QG2zprE7qhSquMZ
	0WHaNs5fSUrertBEKOltLXIoP+Mm24e/5mdu10VcfREEck46vybCD6tB/ZVQcrfHOBaX5j
	Kf2qAbgWJk/wrg52rumZ819AUsFbUv9Sjp781z25UxkfAa9E7GAp1qGqR1HE83OQO9p3b3
	VVZKVBOCGLHoA3nWYIIC03N1swSdWXafVV3Glykw5lSnI9NcmhOYFpZP+A1CWQ==
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
Subject: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output port is optional
Date: Tue, 31 Dec 2024 20:28:48 +0100
Message-ID: <20241231192925.97614-1-marex@denx.de>
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
use this flag, do not proliferate this flag, please fix your DTs.

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
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++++----
 include/drm/bridge/dw_hdmi.h              |  2 ++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 996733ed2c004..852e73c0f686f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2893,9 +2893,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
-					 bridge, flags);
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		if (hdmi->plat_data->output_port_optional && !hdmi->next_bridge)
+			return dw_hdmi_connector_create(hdmi);
+		else
+			return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
+						 bridge, flags);
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

