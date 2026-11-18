Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020654;
	b=S0nSDT4LqaeGMSPAW4wBYFl9vlJe34wrO4M4bnqfRxeicAGk7rK6SZAFNg7Jz1hrhflv
	 fIBlLitVRxouUaUrfWHGKlf1sN8BeD+bMc6THChyzb4xQiKnm/6SKl5rV2Mv25pzZAWLJ
	 uXXjcrUqVFAbd8nrejNoPtDQ2TV36tTbg6qX8vRzCZBinwI06AW5h3d/RJ5FmjfoZE4BI
	 tIqEyaulgfK1AKQZK0MsZCDWnbzTrWKnhPuXiTDCkYnMNi8QNVONDM9lsjebWMiNIi9Qs
	 6c6mRSOhlDU4iKtCy7OfpuIKZ1X7svt/Potz4ZY/A6u+EkZLis6zVtaVt/gthMZwVIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020654;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=P2dly+ossNj1qDZwGJA919lBU17RRLe3L+ZW85zZWic=;
	b=tZkk5bROk9IF/ftn6GEoKGHdieyWAf0pftqi3WrSnpXdd/H38TDncu2l7s5dRHb6rjs+
	 6WSg0rs28EfC9r4kHqSaZH1QEuorXmgALeNyNIUZ+W/ZbcU3kvjt5y550dd2SHoO1WZYB
	 p0CE+5BAZs4eu7Ex++0fZYu2FJ64Q3fh9uWlOV64NSTPERUJEwIwLIL/mP0XtUq+erJ5q
	 QF8VDQqKZyuE3cBtHGw0oHtJ13LOLImqSt9p7ZPVF22oV5gOqBLzw0S8xWwDJW4jxQ1/F
	 iK6v1QbKbMaCgrJ7AA8oSWLcLfqVxJIFsReKnTmY3mUMb7cuVIRU1bPcWsNr8XBh3/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HAxlwcXm;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1AD60A2633
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1AD60A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HAxlwcXm
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AB48F1A16A7;
	Wed, 18 Nov 2026 16:50:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B83B5FE9B;
	Wed, 18 Nov 2026 16:50:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 028A311BC28AC;
	Wed, 18 Nov 2026 17:50:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020649; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P2dly+ossNj1qDZwGJA919lBU17RRLe3L+ZW85zZWic=;
	b=HAxlwcXmCDxdApzA9951AoGuBWc3vIXZwtTR0Cpq3imVWHntGdI2kstKq2VQ15qSC66nOz
	s/aK1h41Hws+y+mWVP+w4Otn5yDROpxGKBJexVF7zX3WDdshG0ruPw4nKT8EM01jOp3/ua
	uChOtd3zKkwcE2O1Ta3GEZGb5Ypr4BZzTvA27rp7YL8dctoogL772JJNQPiFtMGD+zsXBb
	EosTLBqaJVMDRrXG297lIeJ32BmCZ933+HmWlLjr+xhBcjapXNYlfOgAXZcuyBEoFAf4n5
	HRg9NlJ3+JOLe4hf7BVW0ru+KmGdKR8e7E72CMSJeW6q3PFtBpuN12dvJz25qg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:50 +0100
Subject: [PATCH RFC v3 07/31] drm/display: bridge-connector: split
 allocation code from initialization code
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
Message-Id: <20261118-drm-bridge-hotplug-v3-7-44bb3b4a828f@bootlin.com>
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

Currently drm_bridge_connector_init() does two things:

 * allocate and initialize the drm_bridge_connector
   (which embeds a drm_connector) using drmm
 * initialize and register the embedded drm_connector

For bridge hotplug drmm allocations are not suitable because a connector
may have to be added and removed multiple times in the lifetime of a card.

In preparation to support that, split out from drm_bridge_connector_init()
the code to allocate the drm_bridge_connector, so new (de)allocation code
can reuse all the initialization code.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- Slightly tweak commit title
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 62 ++++++++++++++++----------
 1 file changed, 38 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 2202e6044444..19cacae617dc 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -837,27 +837,11 @@ static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
 	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
 }
 
-/**
- * drm_bridge_connector_init - Initialise a connector for a chain of bridges
- * @drm: the DRM device
- * @encoder: the encoder where the bridge chain starts
- *
- * Create a new &drm_bridge_connector for the @drm device. The connector is
- * allocated, initialised, registered with the @drm device and attached to
- * @encoder.
- *
- * The connector is associated with a chain of bridges that starts at
- * the @encoder. All bridges in the chain shall report bridge operation flags
- * (&drm_bridge->ops) and bridge output type (&drm_bridge->type), and none of
- * them may create a DRM connector directly.
- *
- * Returns a pointer to the new connector on success, or a negative error
- * pointer otherwise.
- */
-struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
-						struct drm_encoder *encoder)
+static struct drm_connector *
+drm_bridge_connector_initialize(struct drm_bridge_connector *bridge_connector,
+				struct drm_device *drm,
+				struct drm_encoder *encoder)
 {
-	struct drm_bridge_connector *bridge_connector;
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *panel_bridge __free(drm_bridge_put) = NULL;
@@ -865,10 +849,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	int connector_type;
 	int ret;
 
-	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
-	if (!bridge_connector)
-		return ERR_PTR(-ENOMEM);
-
 	ret = drmm_add_action(drm, drm_bridge_connector_put_bridges, bridge_connector);
 	if (ret)
 		return ERR_PTR(ret);
@@ -1154,4 +1134,38 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 
 	return connector;
 }
+
+/**
+ * drm_bridge_connector_init - Initialise a connector for a chain of bridges
+ * @drm: the DRM device
+ * @encoder: the encoder where the bridge chain starts
+ *
+ * Create a new &drm_bridge_connector for the @drm device. The connector is
+ * allocated, initialised, registered with the @drm device and attached to
+ * @encoder.
+ *
+ * The connector is associated with a chain of bridges that starts at
+ * the @encoder. All bridges in the chain shall report bridge operation flags
+ * (&drm_bridge->ops) and bridge output type (&drm_bridge->type), and none of
+ * them may create a DRM connector directly.
+ *
+ * Returns a pointer to the new connector on success, or a negative error
+ * pointer otherwise.
+ */
+struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
+						struct drm_encoder *encoder)
+{
+	struct drm_bridge_connector *bridge_connector;
+	struct drm_connector *connector;
+
+	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
+	if (!bridge_connector)
+		return ERR_PTR(-ENOMEM);
+
+	connector = drm_bridge_connector_initialize(bridge_connector, drm, encoder);
+	if (IS_ERR(connector))
+		return connector;
+
+	return connector;
+}
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);

-- 
2.56.1

