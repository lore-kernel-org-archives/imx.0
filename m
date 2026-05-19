Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D002370AD0
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187094; cv=none; b=s2f2BGEEadw41vbBNCVwW4JYX/SFovNhJstoBCmyxlp/XBNqYSH46PVI4XLQ+GsGrRBw6VJshfzC0hIp9d/hMObS0xCQfq4VrhRmwb1ewrkQHkfPf4iMRrCjozoIPbuHchY8H9qOZthuDRs3+eDSBfOwyNmIQB1dackKRit1wik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187094; c=relaxed/simple;
	bh=cPeDAyvQg4XpfYpV4wQkA7Syl5qYKPeL/Ro5YVklY70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUQ2CsrmCCySjcFt0eKhUuDYv2rm/pLIgDFWA5nhppoo99u58wi8kOYdWfVGIOTJSKNnnURYMBm8ARtPIm50XhGu0VIEtkdGQOJO1d5iCUtS0OT8yrcFAS48Bde4l7fEhURYj7HGp2QSwbqyXtOLGc8X1O20jZ0VhGBijjc/1N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=i6mHAuI7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="i6mHAuI7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C0BB4E42CF2;
	Tue, 19 May 2026 10:38:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46C0F606E9;
	Tue, 19 May 2026 10:38:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C05FF107E8ABD;
	Tue, 19 May 2026 12:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187088; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=blKbTTwyDFAtSUCP5vAQgBxGuxdjJMITQpGkNOB3QT8=;
	b=i6mHAuI7Z6z0XXyfO6xvodt2fFIx7CJsxEsXRW7q8+ucjA2ZtN1qD15+9+DPBMmDDPXp0N
	L7TMVhvoLE3xeeJH1VKk4AuI1GWV7draVlvdZCbkLmNgShstoc07BVap1VQZDEXgeUWfHu
	dgFdDrhDxSgf+pqqDCNJSMDqrQ7j0XHh42yvfoFUYtHExwaODG7cdMIkRAPrVPcIN1Tjf2
	AjPgy1lr3Id3fOPvIv7TTzaQ1waE29boOCHArNDiJgFNVvy5JarkQo3J/8JKEZXm142FPO
	hgL/PY9C2miGODN0aeWlppLIXyJClO6hWfmdAFM9wDedhR747M0ViuDSxMFHpQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:18 +0200
Subject: [PATCH 01/37] drm/connector: split drmm_connector_hdmi_init() in 3
 parts
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-1-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

In preparation for adding a dynamic variant of drmm_connector_hdmi_init(),
split reusable parts of the code to subfunctions.

drmm_connector_hdmi_init() currently has 3 sections:
 1. sanity checks
 2. call drmm_connector_init()
 3. initialize HDMI-specific fields not initialized at step 2

Split 1 and 3 to new functions, reusable independently.

No functional changes. Just moving code around.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_connector.c | 105 +++++++++++++++++++++++++---------------
 1 file changed, 65 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 3fa4d2082cd7..37ed73300a18 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -542,44 +542,13 @@ int drmm_connector_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_init);
 
-/**
- * drmm_connector_hdmi_init - Init a preallocated HDMI connector
- * @dev: DRM device
- * @connector: A pointer to the HDMI connector to init
- * @vendor: HDMI Controller Vendor name
- * @product: HDMI Controller Product name
- * @funcs: callbacks for this connector
- * @hdmi_funcs: HDMI-related callbacks for this connector
- * @connector_type: user visible type of the connector
- * @ddc: optional pointer to the associated ddc adapter
- * @supported_formats: Bitmask of @drm_output_color_format listing supported output formats
- * @max_bpc: Maximum bits per char the HDMI connector supports
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
-			     const char *vendor, const char *product,
-			     const struct drm_connector_funcs *funcs,
-			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
-			     int connector_type,
-			     struct i2c_adapter *ddc,
-			     unsigned long supported_formats,
-			     unsigned int max_bpc)
+static int drm_connector_hdmi_sanity_checks(struct drm_connector *connector,
+					    const char *vendor, const char *product,
+					    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+					    int connector_type,
+					    unsigned long supported_formats,
+					    unsigned int max_bpc)
 {
-	int ret;
-
 	if (!vendor || !product)
 		return -EINVAL;
 
@@ -606,10 +575,15 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	    !hdmi_funcs->hdmi.write_infoframe)
 		return -EINVAL;
 
-	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
-	if (ret)
-		return ret;
+	return 0;
+}
 
+static void drm_connector_hdmi_init(struct drm_connector *connector,
+				    const char *vendor, const char *product,
+				    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+				    unsigned long supported_formats,
+				    unsigned int max_bpc)
+{
 	connector->hdmi.supported_formats = supported_formats;
 	strtomem_pad(connector->hdmi.vendor, vendor, 0);
 	strtomem_pad(connector->hdmi.product, product, 0);
@@ -628,6 +602,57 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
 	connector->hdmi.funcs = hdmi_funcs;
+}
+
+/**
+ * drmm_connector_hdmi_init - Init a preallocated HDMI connector
+ * @dev: DRM device
+ * @connector: A pointer to the HDMI connector to init
+ * @vendor: HDMI Controller Vendor name
+ * @product: HDMI Controller Product name
+ * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ * @supported_formats: Bitmask of @drm_output_color_format listing supported output formats
+ * @max_bpc: Maximum bits per char the HDMI connector supports
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
+			     const char *vendor, const char *product,
+			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			     int connector_type,
+			     struct i2c_adapter *ddc,
+			     unsigned long supported_formats,
+			     unsigned int max_bpc)
+{
+	int ret;
+
+	ret = drm_connector_hdmi_sanity_checks(connector, vendor, product, hdmi_funcs,
+					       connector_type, supported_formats, max_bpc);
+	if (ret)
+		return ret;
+
+	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
+	if (ret)
+		return ret;
+
+	drm_connector_hdmi_init(connector, vendor, product,
+				hdmi_funcs, supported_formats, max_bpc);
 
 	return 0;
 }

-- 
2.54.0

