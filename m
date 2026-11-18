Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020643;
	b=B2OCoRaVfwzfX/IdOnmbmnV370icfVVh4I5G7lRBFIaup9wDmiwOTOwZ07iNo480Pe+M
	 /TwxFwIP0ae1AkQTOR1rNPtDJmIWmp8mgI7K+lN2ypnYE9cSUbLmf2kIoxTo3k/Jaixs3
	 Zp46bzaD+gGL2NzmybO66161MIWkJh/0xParVJX08jpoADTUMFjUfvS8qN1YTwo2dr024
	 tTXyXdxcgkhjHSiTk6V4r+CHMOsY7zwb0R0ZdL/sFHeDMBB47m74d4+YePpy2KXDobe8c
	 beMa4/lO6XFy9p5/RZH4NazREBweIVKSzYQ/BS7AGKo4dL/gDsIVoVpGiqXmgNZJhMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020643;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=DomKAZah0eNhI098eAShLZdloqTw6X9onjOwyu3TQpk=;
	b=hS6NK93VpnbkU7rU2M7RN3Dh/ToluOYArUzXaO0nAnZtzB6v+oOsZhFRO4jPdJzb6zEH
	 TVVM6epnkZ6sDVDM2d/E87tkWguSl0tBweo6sjKy0Hnah+uQ1SGDX6+N3tKX5aXJE25l1
	 RsenupOqr8NIT7AZPC0JvtHQ9Byt253BganKKDWY3XKMsqUp9KGNf6xsY7sjpf2gcOIaI
	 POHCaw++qDQG45hsTz9HghRX9Tksa4o8BEoXSMAEntbcUO1bJ8S4Ew5tHsseen2P+2ols
	 W5g7OJqYJgj6KgB/mkosIwRoa48GTmchqBZaOHgRpcDvGlibrL+xVf8bh8TSLT6Gstg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rPQJseuB;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FD2606A336
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09FD2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rPQJseuB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C2BBC4E40546;
	Wed, 18 Nov 2026 16:50:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92E335FE9B;
	Wed, 18 Nov 2026 16:50:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3CFC11BC28A6;
	Wed, 18 Nov 2026 17:50:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020639; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DomKAZah0eNhI098eAShLZdloqTw6X9onjOwyu3TQpk=;
	b=rPQJseuBimuYbMsVFZwYBpdH25+EgCGQGdbZxfauCn8QqexKNJ4b95ZoPwFi6VdZhyyOA/
	w9kiPsqIF3YVxzHDJWK1TmPFh+YOBqUiIgRTBFVXB/wSVzSqJcQo9mfta3VW8dhQ+0k3iy
	UNtHDoCdHGJRqMXKsRIvqgWL0BxOv9AeIAWI+wrjVdMcqnFtLRBNLwcYV02uZKvTbrJM1o
	beZ92+EGGuD4Gt962LY93ZbqaVWtaYutH80ah5/AyzwDDkv8tgDgxBGlcDjU3IyYU2/zqd
	cW1fw+Xm/swFj3+/DwMC7vbwxuVdidFf48qkM+jPzgJCfvKH1P7cLzkrTnvb3w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:48 +0100
Subject: [PATCH RFC v3 05/31] drm/connector: split
 drmm_connector_hdmi_init() in 3 parts
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
Message-Id: <20261118-drm-bridge-hotplug-v3-5-44bb3b4a828f@bootlin.com>
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

In preparation for adding hotpluggable bridges we need connectors to be
created dynamically, both regular connectors and HDMI ones.

For non-HDMI connectors drm_connector_init() already has a dynamic
variant, but there is none for HDMI. Creating one would be easy by creating
a mostly-identical copy of drmm_connector_hdmi_init(), but it is a long
function so there would be a lot of duplicated code.

drmm_connector_hdmi_init() currently has 3 sections:

 1. sanity checks
 2. call drmm_connector_init()
 3. initialize HDMI-specific fields not initialized at step 2

For the dynamic variant, sectons 1 and 3 would be an exact copy, while
section 2 needs to be different.

To avoid code duplication, split parts 1 and 3 to subfunctions. The next
commit will introduce the dynamic variant.

No functional changes. Just moving code around.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- expanded commit message to clarify rationale
- rebased on current drm-misc-next, which required a full rewrite after
  the signature of drmm_connector_hdmi_init() changed in commit
  400c9ede1ea4 ("drm/connector: Add drmm_connector_hdmi_init() with new
  signature")
- renamed drm_connector_hdmi_init() to drm_connector_hdmi_initialize() as
  or it would look like an HDMI version of drm_connector_init()
---
 drivers/gpu/drm/drm_connector.c | 88 +++++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d66188521881..877c12b75090 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -542,37 +542,11 @@ int drmm_connector_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_init);
 
-/**
- * drmm_connector_hdmi_init - Init a preallocated HDMI connector
- * @dev: DRM device
- * @connector: A pointer to the HDMI connector to init
- * @funcs: callbacks for this connector
- * @hdmi_funcs: HDMI-related callbacks and capabilities for this connector
- * @connector_type: user visible type of the connector
- * @ddc: optional pointer to the associated ddc adapter
- *
- * Initialises a preallocated HDMI connector. Connectors can be
- * subclassed as part of driver connector objects.
- *
- * Cleanup is automatically handled with a call to
- * drm_connector_cleanup() in a DRM-managed action.
- *
- * The connector structure should be allocated with drmm_kzalloc().
- *
- * The @drm_connector_funcs.destroy hook must be NULL.
- *
- * Returns:
- * Zero on success, error code on failure.
- */
-int drmm_connector_hdmi_init(struct drm_device *dev,
-			     struct drm_connector *connector,
-			     const struct drm_connector_funcs *funcs,
-			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
-			     int connector_type,
-			     struct i2c_adapter *ddc)
+static int drm_connector_hdmi_sanity_checks(struct drm_device *dev,
+					    struct drm_connector *connector,
+					    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+					    int connector_type)
 {
-	int ret;
-
 	if (!hdmi_funcs)
 		return -EINVAL;
 
@@ -613,9 +587,15 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
 		return -EINVAL;
 
-	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
-	if (ret)
-		return ret;
+	return 0;
+}
+
+/* Initialize HDMI-specific resources of a connector */
+static int drm_connector_hdmi_initialize(struct drm_device *dev,
+					 struct drm_connector *connector,
+					 const struct drm_connector_hdmi_funcs *hdmi_funcs)
+{
+	int ret;
 
 	/* TODO: remove after conversion to new drmm_connector_hdmi_init() */
 	connector->hdmi.supported_formats = hdmi_funcs->supported_formats;
@@ -680,6 +660,48 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 
 	return 0;
 }
+
+/**
+ * drmm_connector_hdmi_init - Init a preallocated HDMI connector
+ * @dev: DRM device
+ * @connector: A pointer to the HDMI connector to init
+ * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks and capabilities for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ *
+ * Initialises a preallocated HDMI connector. Connectors can be
+ * subclassed as part of driver connector objects.
+ *
+ * Cleanup is automatically handled with a call to
+ * drm_connector_cleanup() in a DRM-managed action.
+ *
+ * The connector structure should be allocated with drmm_kzalloc().
+ *
+ * The @drm_connector_funcs.destroy hook must be NULL.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_connector_hdmi_init(struct drm_device *dev,
+			     struct drm_connector *connector,
+			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			     int connector_type,
+			     struct i2c_adapter *ddc)
+{
+	int ret;
+
+	ret = drm_connector_hdmi_sanity_checks(dev, connector, hdmi_funcs, connector_type);
+	if (ret)
+		return ret;
+
+	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
+	if (ret)
+		return ret;
+
+	return drm_connector_hdmi_initialize(dev, connector, hdmi_funcs);
+}
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
 /**

-- 
2.56.1

