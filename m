Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1EB320CBB
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 18:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908020; cv=none; b=TLeMSD1BuHuYbXhu/yMwLA945AvnWS8hIQyeBXhcR+zBdNY40lxeijjo5oBrWYTAoxkGb94T9oCArEo7dnj27BlOfd3Y7E86aDjyElRTaPztEv/6Tse7dJI2BMxVMriIrNt8yYe/dzpG3reNrLVcpoL8xFXlSyxu6gzdp7guExk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908020; c=relaxed/simple;
	bh=FzjRncnA9409KdO3sgoN8e4S5xCpw05G0m7IPYXxPn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DuXNxCRhEemH+kRuYYkf+xE+5t8XL5EGj+fGQL3o8+yGLFgyvZ8EZQTCk2RkaQa4bjSkCtoHaWcBiHbgo4fuDKD/Q+cmBm2XYW3HAaCZDoeeMK/CZ2CmgjYT9TZQQJsPpyUuW1oV2inz1/Yure3CBfaR4t+4e21DgCK4wvFARdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qOkNMDes; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qOkNMDes"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5911C1A2226;
	Tue, 16 Dec 2025 18:00:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B52A6071C;
	Tue, 16 Dec 2025 18:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 017AD119A97E8;
	Tue, 16 Dec 2025 19:00:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908015; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8PkmTgmquqdcxF6G5c67yqDXYmcbCyXSS/SGER/sdIk=;
	b=qOkNMDesYpUKHvxRTl2FGlRCdyvjQOc5XBt7EIazgxDos1FA5lneUXtG0j4QCiFmR0gO+J
	wbLwsWIsOUZfybN4SRSYP7/ilE3uulgNnZGF/hSRWutAttsNN1khF7vVELOJI8rZXCjj6K
	HaXNAumta6a5SiTIrr8wEsdmbaIb1SfQUN0GzaPa/zVi02FDcHqvUz+lWjNXmEH6pGZEGt
	1DV92cYHduLjDn2uS53mUdinu7aeTkTxb1iZ+bRC+Rgpi4GTE1YXeYuudZue4IiSEOWx4p
	bIuc2YaOIDzXjA1PxX/EZOablFifq/Bzq0LPlWbCm7LD8uXRNECn5gtKEbgYLQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:45 +0100
Subject: [PATCH v3 12/22] drm/meson: encoder_hdmi: get/put the next bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 8205ee56a691..dc4e23590a6e 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -38,7 +38,6 @@
 struct meson_encoder_hdmi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct drm_connector *connector;
 	struct meson_drm *priv;
 	unsigned long output_bus_fmt;
@@ -54,7 +53,7 @@ static int meson_encoder_hdmi_attach(struct drm_bridge *bridge,
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
-	return drm_bridge_attach(encoder, encoder_hdmi->next_bridge,
+	return drm_bridge_attach(encoder, encoder_hdmi->bridge.next_bridge,
 				 &encoder_hdmi->bridge, flags);
 }
 
@@ -334,7 +333,7 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 		const struct drm_edid *drm_edid;
 		const struct edid *edid;
 
-		drm_edid = drm_bridge_edid_read(encoder_hdmi->next_bridge,
+		drm_edid = drm_bridge_edid_read(encoder_hdmi->bridge.next_bridge,
 						encoder_hdmi->connector);
 		if (!drm_edid)
 			return;
@@ -390,8 +389,8 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 		return 0;
 	}
 
-	meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
-	if (!meson_encoder_hdmi->next_bridge) {
+	meson_encoder_hdmi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+	if (!meson_encoder_hdmi->bridge.next_bridge) {
 		ret = dev_err_probe(priv->dev, -EPROBE_DEFER,
 				    "Failed to find HDMI transceiver bridge\n");
 		goto err_put_node;

-- 
2.52.0

