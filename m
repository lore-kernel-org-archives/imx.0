Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020638;
	b=JRP/FvmV9wnUTGZgLRBTmvm0NSHLIjvp+DUBHQWwnsIK6KjbLx1HGDwTMBkL6qZaVDkY
	 K640Y9p63C/ShqdREiJdJDSi840ateSZdU5u3TOvgjaAZOyFGsSvXQC/VFygkuMTywAsU
	 S6+/0ZmvC1xroBVyCfWce05IL2DjvCd6hqyHYRs7njFRAMvqThBC5A39eUlem1oUUvoH7
	 5w/Ssxu4edRf53oa8P9Itihbk3jhc0RIyXk0+6zRX9psFfPdey6d2zHSiaFPDHJiXs/+X
	 8UjjSRc0HpNs+2rjaZuU3RYdu/NJnIx7DSa+X+6UUrEFbp2avCEAXHGPOokMUbXCCkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020638;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=3A5cjW5s6Vm9YexlzjVRgl0QgTWKhVvRpSlRJjfgWZs=;
	b=sM72f/nXvw3v6Q/Qg1ITc/5ol+S6eZ4RertCbHcL9l9In6QMRJEhDDrd3mMuJCf6W2mC
	 KNobKgVsrTFcWVxcllqAl749TdORhb0kcHaU9YEakFE3IUslJ/lKcCYnG/mc+PoyGVQSC
	 6yL7nfEURXF7MJRwT/dDFwxvRew5PXnrSMf5DPEBcguImm/BzzT/UCgGv7lgU8mFAPLP0
	 QyeloakElek0DcUK7a4DyQLsmVLhuyI2C8O7rURgfDbq54ZaR6d1q5x47RwcqV8Uba8SC
	 NZBVXh2UeWWG/VPoGxtV1RzQ3PI611p/1BJ6PSe9L6SKcPyA1Yb3cOQVD3aiPcCZlTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uXsdnIBJ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8B5606A31C
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B8B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uXsdnIBJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EBE6B4E41635;
	Wed, 18 Nov 2026 16:50:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD5E75FE9B;
	Wed, 18 Nov 2026 16:50:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B65811BC28A0;
	Wed, 18 Nov 2026 17:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3A5cjW5s6Vm9YexlzjVRgl0QgTWKhVvRpSlRJjfgWZs=;
	b=uXsdnIBJW3cWzNbsg9sgsfFjyH0gh/gnRrE+oFrbwgpp2CCif7wpjosWbY0+RJ8HowHyzD
	OPDLJZlTS/Ja+rK6g/vQi85Te21gz6FvNZyag8aE43c3nNMDUBRG7V1XgJzNNZpCRrEkXs
	8clje4Rp9PFld/PsUbUDtjLpxQKe7DuC8SA1Y3sbawlDJ1LgXnqirHp2P3v78zVNic2daX
	rHHojt9p9rsGW99i4o4U5KfpED5P4o6V3GBuZAJYmEAfLDrswzlJK+ArErTbjK+F2y2bsi
	B2W+venGvYhxjcXNwecYWXrtpygbK4Dkw6kZXx9BIygmg7pc0KtA95vDSPpT4Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:47 +0100
Subject: [PATCH RFC v3 04/31] drm/display: hdmi-cec-notifier-helper: add
 non-drmm API variant
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
Message-Id: <20261118-drm-bridge-hotplug-v3-4-44bb3b4a828f@bootlin.com>
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

For bridge hotplug drmm allocations are not suitable because a connector
may have to be added and removed multiple times in the lifetime of a card.

In preparation to support hotpluggable HDMI bridges (and the
drm_bridge_connector) add a non-drmm variant of the CEC notifier
(de)registration API, with an explicit unregister API.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v3.
---
 .../gpu/drm/display/drm_hdmi_cec_notifier_helper.c | 30 ++++++++++++++++++----
 include/drm/display/drm_hdmi_cec_helper.h          | 15 +++++++++++
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
index 47662bdc5d08..2f30844fcdad 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
@@ -29,8 +29,7 @@ static void drmm_connector_hdmi_cec_notifier_unregister(struct drm_device *dev,
 {
 	struct drm_connector *connector = res;
 
-	cec_notifier_conn_unregister(connector->cec.data);
-	connector->cec.data = NULL;
+	drm_connector_hdmi_cec_notifier_unregister(connector);
 }
 
 static const struct drm_connector_cec_funcs drm_connector_cec_notifier_funcs = {
@@ -38,9 +37,9 @@ static const struct drm_connector_cec_funcs drm_connector_cec_notifier_funcs = {
 	.phys_addr_set = drm_connector_hdmi_cec_notifier_phys_addr_set,
 };
 
-int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
-					      const char *port_name,
-					      struct device *dev)
+int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					     const char *port_name,
+					     struct device *dev)
 {
 	struct cec_connector_info conn_info;
 	struct cec_notifier *notifier;
@@ -58,6 +57,27 @@ int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
 
 	mutex_unlock(&connector->cec.mutex);
 
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_notifier_register);
+
+void drm_connector_hdmi_cec_notifier_unregister(struct drm_connector *connector)
+{
+	cec_notifier_conn_unregister(connector->cec.data);
+	connector->cec.data = NULL;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_notifier_unregister);
+
+int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					      const char *port_name,
+					      struct device *dev)
+{
+	int ret;
+
+	ret = drm_connector_hdmi_cec_notifier_register(connector, port_name, dev);
+	if (ret)
+		return ret;
+
 	return drmm_add_action_or_reset(connector->dev,
 					drmm_connector_hdmi_cec_notifier_unregister,
 					connector);
diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
index 7e76a163e3a5..8d648532eeb7 100644
--- a/include/drm/display/drm_hdmi_cec_helper.h
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -63,10 +63,25 @@ void drm_connector_hdmi_cec_transmit_attempt_done(struct drm_connector *connecto
 						  u8 status);
 
 #if IS_ENABLED(CONFIG_DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER)
+int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					     const char *port_name,
+					     struct device *dev);
+void drm_connector_hdmi_cec_notifier_unregister(struct drm_connector *connector);
 int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
 					      const char *port_name,
 					      struct device *dev);
 #else
+static inline int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+							   const char *port_name,
+							   struct device *dev)
+{
+	return 0;
+}
+
+static inline void drm_connector_hdmi_cec_notifier_unregister(struct drm_connector *connector)
+{
+}
+
 static inline int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
 							    const char *port_name,
 							    struct device *dev)

-- 
2.56.1

