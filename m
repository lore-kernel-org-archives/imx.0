Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629184;
	b=JICRq5TgagMiWUB3Vf2W9k0pqcOyM1B9m8VghUuuSGyxA2HeYmwz/hYDQKtwvmNYlYH4
	 syJ6D5mrmN8MhAC5Jrjfu/Awev6cK8tPnNHQu5UYfWR0aMH2eU/WgW0LO0m9XUKR0P278
	 067iUchWskC3ECcde09VBbeubNkxrdb0L1oCPvMBh/SdbREYFUX+NEdGQxdgkwNpEp+1p
	 JuALQx6g5n34og/BAoFu5gXNACZV38fv0tmzzr438tdsbd7AU013Hd1LCpJdJCnP+qvsI
	 v2nalPHk6mm72lpgZDW2FkA3vlxa5G2hpdfN4m6963nduyL66ygGLdeeh6UoZ9eBriQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629184;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=lMt6anh8JalluqU5kZ6TRVlDWq9+fId3H2x7OFRSZmI=;
	b=mAIrIrJ/w8JBo+ut+aus0r9oUricH7g2Mo5t0isxHtp5TA2Bqpy3jwR5E0ccYlPDmcB9
	 TXowZWvnnlc2EPXNYnndPs/35bkwRvMoa2Jid5uAJSJdUx+YsWKcmgflZf0thEiVMEI6p
	 FSn+nJk9YTgs8Hg2vvzl++VU4E43KZqN2n3qH0nbYBr3bBcw+M87U+zSlO+DSMv2p/61/
	 NHWBGES2QJU6e5KZmHuyVdxahI12aa71XNES5hOKks3DSzT3bc2fHX4zn78z2t9z/oStx
	 gKWBBGzL5rPOQqHDQksQBr/q0NWCZW/GAJxDje5NbulYvqr6TfpXaIn3rrWk0epTzlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="YpdhlpN/";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB70606A6AF
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB70606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YpdhlpN/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3F7081A17F9;
	Wed, 25 Nov 2026 17:53:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B24960480;
	Wed, 25 Nov 2026 17:53:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68B8C11E6B0D5;
	Wed, 25 Nov 2026 18:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629174; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lMt6anh8JalluqU5kZ6TRVlDWq9+fId3H2x7OFRSZmI=;
	b=YpdhlpN/qCOaaG4Tk5QIhmIna5ETohW4LU/v9ZZdHyZRpKdYksArMU0ujj0FGXuOK+qcKF
	Xkl/GmnG3uGykI+HlLhWWfZNmLV1MTiixbEUmPVZT6VuETg5Rky87AWb5V4Lh64zltjivm
	YsfEqV6e1g+I9FPskaWw17EePqjUTTVorF5Tj1BkWKPEfPz0pVO0+xXB3DC6+bx+D4pOfi
	X5XeAl2wYUfEdbauZAd3GSqy16R3DKAyhszLtij9LtZa8J774J58lz85h0L/AtDBgZ37I0
	CpSuR1vlN9JErQFevz1E1vsgGNnAhoT4RPTj4OKy+0rjN0Jq22wQvMYLm82S4A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:31 +0100
Subject: [PATCH v4 18/32] drm/bridge: notify about added and detached
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
Message-Id: <20261125-drm-bridge-hotplug-v4-18-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
In-Reply-To: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
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
index 310f03bdb744..a50709ac8b06 100644
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
 
@@ -710,6 +713,9 @@ void drm_bridge_detach(struct drm_bridge *bridge)
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

