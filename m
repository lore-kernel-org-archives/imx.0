Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020716;
	b=3YL9O8+YDDXZ+8eMJXMkSPQ+Efo6YZu26XXBzzT4hkOM4J9iYRje3zIddFIItZa5ez2P
	 SuQt2ZdpvN2BXGwOo/K8BZqMv8Ls2+0QULazyYaT7nC2cEYpZor+KCDHRsPna+S2bhLIZ
	 2gLVQKmSAt/wQtmzzCMDuiKpGlTv8OJmvMq2cp1Xw0Ez/EXf0sWEV/bF9/H0AQOZfoMTR
	 K7HPwV/cp12LI2cEkNJBTMnLMmB8ExLxTZAaIOe4pM4Diy3ZuEQSE6ET4QjdiCG9bKApu
	 t+UPm+/rd/cjiVqZSixvlSp0E0S3L0IQFUgnGFuBYyb2gHQCcNc5saOB61TUNX+jO9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020716;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=uSF6Lm8D9ry+Y4D3XvKzoxiIo/io7aCbvge+8z/Jst0=;
	b=Kkzvcw+i+/ebvXEps5PMzzENvRY9+HvxK8ytHbq/uebTMPGe2P0t3Nux7zSn8xRci9Ib
	 vY7OeqBYPyrXIy5+hr0fQrjGbZgCld0qFvIsPHkNtHXjSSMEJMBv8/uRZ9jzXF0MF5Q8j
	 V0dZtHHTpUW8YwdylDNeHBl5MAmLES65Kea6Y24ZLrjFWw7tMMw7H+8iZrubCTjp7YBmL
	 w9DpmiV6QSgmAzxjd8jiE4bNNOw1cr3zqjkvM0qNwzCXiubygR4Gv15bsxq1p7Q49DVV/
	 lZlEM28qvm8C23sCm5+CRkPUxtIfni4FGOnm3H/jNOMUxjhitQzBiL4H1h9mjblFx+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PogcMlwB;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5A160A2627
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F5A160A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PogcMlwB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EEEA74E40546;
	Wed, 18 Nov 2026 16:51:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFC015FE9B;
	Wed, 18 Nov 2026 16:51:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9782911BC28D5;
	Wed, 18 Nov 2026 17:51:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020707; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uSF6Lm8D9ry+Y4D3XvKzoxiIo/io7aCbvge+8z/Jst0=;
	b=PogcMlwBR63e9momGn9yjG4jUwb6nd2qRa7NNgPHc43TLqn91hUljIQrJSJWfM8AyZ+9Q7
	CstFhlZ3Gt5JuM+JsircvYwm/qipxMd77w0ET/+GbelZA8DMIKgT5OzSvq4Hzv1yDvigm/
	N3yEVF8VYu9B8tbuPjfSeDluw208JkeHFIPLspSl1TaavtzMceifzEdiOe4WexlyvghBul
	K3GA2n5TY9Mky9UbYWPqDaVMTbYBBPfauFfhE/mNGXt/nYBG6oGI/Z5QlChVB6iqelWIhy
	NQS2NjUVOQYUXYJALwwOk6uS7o3tZictG+ILfoobCfSRWcmrBFrvjUywYRyuww==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:59 +0100
Subject: [PATCH RFC v3 16/31] drm: event-notifier: add mechanism to notify
 about hotplug events
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
Message-Id: <20261118-drm-bridge-hotplug-v3-16-44bb3b4a828f@bootlin.com>
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

In preparation for supporting DRM bridge hotplug, add an event notifier to
allow interested parties to be notified about events they need to react to.

For the initial implementation of bridge hotplug, a few events are needed:

 * A bridge was added (happening in drm_bridge.c)
 * A bridge was detached (happening in drm_bridge.c)
 * A MIPI device was attached to a MIPI host (happening in drm_mipi_dsi.c)

Being originated from different modules, implement the event notifier
mechanism in a new module with minimal dependencies that event producers
can easily use to send events.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- Renamed to clarify the scope is only about hotplug
- Extend enum drm_event_notifier_event documentation
- Add DRM_BRIDGE_ADDED event to support non-DSI (and some DSI too) bridges
- Reword event description in a more concise way
- Make DRM_HOTPLUG_EVENT_NOTIFIER a bool, not a tristate: DRM_MIPI_DSI
  cannot be made a tristate with current code, and it depends on
  DRM_HOTPLUG_EVENT_NOTIFIER
- Use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL to avoid GPL-bypass of the
  notifier API

Changes in v2:
- added missing include
---
 MAINTAINERS                                  |  8 ++++
 drivers/gpu/drm/Kconfig                      |  3 ++
 drivers/gpu/drm/Makefile                     |  2 +
 drivers/gpu/drm/drm_hotplug_event_notifier.c | 62 ++++++++++++++++++++++++++++
 include/drm/drm_hotplug_event_notifier.h     | 52 +++++++++++++++++++++++
 5 files changed, 127 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ebc0f35ae59..fc404918c938 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9319,6 +9319,14 @@ F:	include/drm/drm_gpusvm.h
 F:	include/drm/drm_pagemap.h
 F:	include/drm/drm_pagemap_util.h
 
+DRM HOTPLUG EVENT NOTIFIER
+M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/drm_hotplug_event_notifier.c
+F:	include/drm/drm_hotplug_event_notifier.h
+
 DRM LOG
 M:	Jocelyn Falempe <jfalempe@redhat.com>
 M:	Javier Martinez Canillas <javierm@redhat.com>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 61111d50b1c6..5268bf47b2e3 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -33,6 +33,9 @@ endmenu
 
 if DRM
 
+config DRM_HOTPLUG_EVENT_NOTIFIER
+	bool
+
 config DRM_MIPI_DBI
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c6bc093a923..e4268c5b771a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -95,6 +95,8 @@ drm-$(CONFIG_DRM_DRAW) += drm_draw.o
 drm-$(CONFIG_DRM_RAS) += drm_ras.o drm_ras_nl.o drm_ras_genl_family.o
 obj-$(CONFIG_DRM)	+= drm.o
 
+obj-$(CONFIG_DRM_HOTPLUG_EVENT_NOTIFIER) += drm_hotplug_event_notifier.o
+
 obj-$(CONFIG_DRM_PANEL) += drm_panel.o
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
diff --git a/drivers/gpu/drm/drm_hotplug_event_notifier.c b/drivers/gpu/drm/drm_hotplug_event_notifier.c
new file mode 100644
index 000000000000..9cc252d10c73
--- /dev/null
+++ b/drivers/gpu/drm/drm_hotplug_event_notifier.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Internal event notifier of events about DRM bridge hotplug
+ *
+ * Copyright (C) 2026 GE HealthCare
+ * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+ */
+
+#include <linux/module.h>
+#include <linux/notifier.h>
+
+#include <drm/drm_hotplug_event_notifier.h>
+
+static BLOCKING_NOTIFIER_HEAD(drm_hotplug_event_notifier);
+
+/**
+ * drm_hotplug_event_notifier_register - Register to be notified of DRM
+ *                                       hotplug events
+ * @nb: the notifier block to be registered
+ *
+ * @nb will be notified of events defined in
+ * &drm_hotplug_event_notifier_event
+ *
+ * Returns 0 on success, %-EEXIST on error.
+ */
+int drm_hotplug_event_notifier_register(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&drm_hotplug_event_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(drm_hotplug_event_notifier_register);
+
+/**
+ * drm_hotplug_event_notifier_unregister - Unregister from being notified
+ *                                         of DRM hotplug events
+ * @nb: the notifier block to be unregistered
+ *
+ * @nb will stop being notified of events defined in
+ * &drm_hotplug_event_notifier_event
+ *
+ * Returns zero on success or %-ENOENT on failure.
+ */
+int drm_hotplug_event_notifier_unregister(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&drm_hotplug_event_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(drm_hotplug_event_notifier_unregister);
+
+/**
+ * drm_hotplug_event_notifier_notify - Emit an event to be notified to
+ *                                     registered entities
+ * @event: event ID as defined in &drm_hotplug_event_notifier_event
+ * @data: metadata associated to the event
+ */
+void drm_hotplug_event_notifier_notify(unsigned long event, void *data)
+{
+	blocking_notifier_call_chain(&drm_hotplug_event_notifier, event, data);
+}
+EXPORT_SYMBOL_GPL(drm_hotplug_event_notifier_notify);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+MODULE_DESCRIPTION("Notifier for DRM components addition/removal and attach/detach");
diff --git a/include/drm/drm_hotplug_event_notifier.h b/include/drm/drm_hotplug_event_notifier.h
new file mode 100644
index 000000000000..008e041444be
--- /dev/null
+++ b/include/drm/drm_hotplug_event_notifier.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Internal event notifier of events about DRM bridge hotplug
+ *
+ * Copyright (C) 2026 GE HealthCare
+ * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+ */
+
+#ifndef _DRM_HOTPLUG_EVENT_NOTIFIER_H_
+#define _DRM_HOTPLUG_EVENT_NOTIFIER_H_
+
+#include <linux/notifier.h>
+
+/**
+ * enum drm_hotplug_event_notifier_event - DRM bridge hotplug and
+ *                                         hotunplug events
+ *
+ * Describe any event about DRM bridge appearing, disappearing, or getting
+ * connected at runtime (hotplug). Any of these events may need to trigger
+ * a response in order to start or stop the video pipeline, including
+ * creating or destroying a drm_connector.
+ *
+ * Each of these events is accompanied by a void* argument, whose meaning
+ * is event-specific and defined per each event.
+ */
+enum drm_hotplug_event_notifier_event {
+	/**
+	 * @DRM_MIPI_DSI_ATTACHED: A MIPI DSI device has just been attached
+	 * to its MIPI DSI host. @data is a pointer to the attached &struct
+	 * mipi_dsi_device.
+	 */
+	DRM_MIPI_DSI_ATTACHED,
+	/**
+	 * @DRM_BRIDGE_ADDED: A bridge has just been added by calling
+	 * drm_bridge_add(). As such, it is not yet attached to an encoder
+	 * and is not part of any encoder bridge chain. @data is a pointer
+	 * to the added &struct drm_bridge.
+	 */
+	DRM_BRIDGE_ADDED,
+	/**
+	 * @DRM_BRIDGE_DETACHED: A bridge has just been detached and
+	 * removed from the encoder bridge chain. @data is a pointer to the
+	 * detached &struct drm_bridge.
+	 */
+	DRM_BRIDGE_DETACHED,
+};
+
+int drm_hotplug_event_notifier_register(struct notifier_block *nb);
+int drm_hotplug_event_notifier_unregister(struct notifier_block *nb);
+void drm_hotplug_event_notifier_notify(unsigned long event, void *data);
+
+#endif /* _DRM_HOTPLUG_EVENT_NOTIFIER_H_ */

-- 
2.56.1

