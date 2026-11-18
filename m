Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020720;
	b=T7Iu5v9xwjF/EsmmDS0rzohO74+MHHqd1lGrcd4/RiDpJcmuUvheoHKPmztoEQvGwYpB
	 1AQiK0n1Xlqh7dnto1iscRnRZFmPWcN2FBWBvc4ZjIwQwwSgV6uBJgyaDZdfRPmQQdGC3
	 s3GH2Id1vlLwHtLabvmeBCeUZWK35eSD9cqwoXOWooFEFFL/O6U/soF5PTdlcUt/S4sSX
	 LjLE9ycU6Sy+qzHlAzD66cw5ZzeBaQLsGAJYF3fmGAstZxvFv7jiLr8gwD6YgzIfszzEG
	 GoWR55pcPGK+VSQxbbKsA2F/lTlkJgENpzMC4r4SiJROP3TLagMCd5MthdkRvqnS5lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020720;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=eocEYsU9h/jwR33n/5xfCsJpDlX1NehsHZ0nbPGW/CI=;
	b=OIjFxIScQr13lCvwcsRMwNlI4f88C3eTlC/46oZpzBHs7zNHnnTdDbCsmrngAAYnEnFS
	 nzQkZ2PAwl0sBS7V1H9SWghZ8QeJlJIVyALxksiiHSCqLmDR5H9L9dYzaPJyaFDbl2Q7T
	 MXHmIVOTO2TbGKs2YHwCbZNhREwu0Zwt8b+/ACwWGkV3qSVRnxEukuQTKDS4jEFzIOB1O
	 l2aBTpckR/R5jEICSb+VtjcgvunkClUAn8VQ0ibZUHfSl3mK7sU4yPyFBFX1J2xtKR7sr
	 zfIIsv42EmjyYviJI9h57Iol1XQpC845NGbdutSkBARsw7uSePz+aYBQ2mpLCgkpo7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=W+mKfVC1;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332360A3816
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6332360A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=W+mKfVC1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D8EA7C4F77B;
	Wed, 18 Nov 2026 16:52:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF3775FE9B;
	Wed, 18 Nov 2026 16:51:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E764511BC28D2;
	Wed, 18 Nov 2026 17:51:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020717; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eocEYsU9h/jwR33n/5xfCsJpDlX1NehsHZ0nbPGW/CI=;
	b=W+mKfVC11JBGEkMq8G9bOcxsUP1/xM0k3Bqwf99ObkK8MmefP6O6q1FNUGHnJDyGTj5Z9e
	WxRD2lrFOy17nR+Thfshj4WGouWlQ4E5RslCOj0K14ruRp42Zcib9gi9wTzqpIvdrQLV02
	tZVQeX0B1ecL3Zgg2XLXY7bGs6x4D2+jOZkeQ9997du7PXNInvogPw0WBdHAN5/8pmaZ+j
	wHR/JEhk+1TbtsxxCbHA1VQWmNMSV3Asp6bUOI/OfRTSAd75hjuStPv7BSsiGpJ5Fjtt4D
	Y9UQmZNGj2cyPMu24G9+mOBv4EycxgC1w8rcQ9TvmDjpsZfFHcTApVvt+5DRrw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:00 +0100
Subject: [PATCH RFC v3 17/31] drm/bridge: notify about added and detached
 bridges
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
Message-Id: <20261118-drm-bridge-hotplug-v3-17-44bb3b4a828f@bootlin.com>
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

In preparation to support DRM bridge hotplug, let the drm_bridge code emit
an event when a bridge is added and when it is detached, so that this event
can trigger the actions needed to (de)configure the pipeline and
(un)register the connector as appropriate.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- also notify on added bridges (for non-DSI bridges)
- use new v3 notifier API name
---
 drivers/gpu/drm/Kconfig      | 1 +
 drivers/gpu/drm/drm_bridge.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 5268bf47b2e3..105dd46a0a45 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -17,6 +17,7 @@ menuconfig DRM
 # device and dmabuf fd. Let's make sure that is available for our userspace.
 	select KCMP
 	select VIDEO
+	select DRM_HOTPLUG_EVENT_NOTIFIER
 	help
 	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
 	  introduced in XFree86 4.0. If you say Y here, you need to select
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d54245f3c4d3..bcf65cddbd6e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -34,6 +34,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_hotplug_event_notifier.h>
 #include <drm/drm_file.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
@@ -475,6 +476,8 @@ void drm_bridge_add(struct drm_bridge *bridge)
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
 	mutex_unlock(&bridge_lock);
+
+	drm_hotplug_event_notifier_notify(DRM_BRIDGE_ADDED, bridge);
 }
 EXPORT_SYMBOL(drm_bridge_add);
 
@@ -695,6 +698,9 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 		bridge->funcs->detach(bridge);
 
 	list_del_init(&bridge->chain_node);
+
+	drm_hotplug_event_notifier_notify(DRM_BRIDGE_DETACHED, bridge);
+
 	bridge->dev = NULL;
 	drm_bridge_put(bridge);
 }

-- 
2.56.1

