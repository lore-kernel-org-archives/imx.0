Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629188;
	b=0GJTUnwude6Ff4QgBf2qGeSmnJ75gqRQZ/v5QV+kp6IvGXAM2AEvzWHZMjf5+xLOxBHV
	 NM1Bkjn/5Lj44lpbhDeZIX7k/1DEZk5+KWjimHOYBL7mzB6BUHyqqjWCnMQl5xKMv/WBD
	 5Z8QqqDWRbbELegKp+839RwJ61kh0t9A3RK7a7MhcVUIYi5aT9M8OprPfTt7G/7AzUQy+
	 BOBHerutCNGMJW0eWX5OdiIAf5XcFwdgB4elMaNHJ0ndXA8LGR0mWj4DlN69cVQGsEZXz
	 m4OTsgcf0vw4DpvvvQ9gRIVxAaS0ITagqwrPH+asSue+xO/z7PW0lXg93WBNp/jo5AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629188;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=PawFOJzGO+j7Rk1FiSoFYRQzAZVs1Yl5DoDfqYSRNT4=;
	b=Y54FoNFSSUXXymzrWJ03pLzumq7xdAqPFhwjMvy3eFU8bAWyXu/ifYvsQhQaZ3QDUbdR
	 /VHlq5fPSN+sMtiW3yz3nGJZbea6sHO/BFea9744CZ9hYuwqfvV/X7rdPd3iRVTsc/pEr
	 uQplkSiRl21ot0a6Ri8CHa0PLxgnR1eUGoLW7wKVt/sVhzBr0KR6ydJZq118+8JlFi0Lw
	 wCVS/0TqNrQHHa+R5fBAb795XBa5rksJ76gB4x3MpdFc81Y10wSsxTyVdsFj8rhl1AxDz
	 b5108F02OGl1986Vhk848BMuei70kfZuqqTbAfuUqihMhLn8qWjs2l7G0kmSMowi7EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zQ7pWe3f;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F44606A333
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09F44606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zQ7pWe3f
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD13B1A17FB;
	Wed, 25 Nov 2026 17:53:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A761960480;
	Wed, 25 Nov 2026 17:53:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFCA611E6B0D3;
	Wed, 25 Nov 2026 18:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629184; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PawFOJzGO+j7Rk1FiSoFYRQzAZVs1Yl5DoDfqYSRNT4=;
	b=zQ7pWe3f+cS3XZjICfwqZVaMvrHfpKIlq+qhOx2skWTGKnrchxcjzuAy8VUInqeUh4hlSM
	m7v2ll1mvoEHi0fJfVsmUhVKGHnGy7H9bRF5Rf8x1Juf1q+C+a28WcAXFmh86TG9/fT3as
	8NkpFtbhGYctpiRuCyQwWkCTC+5WGkBCjXwjkbd3kIqGnizEe1oB3PXxYto+QAuCO4CiV+
	1AOpf7+YjiK0bXGzOxImj1j6/G2qwkRwaVxTb4EESusRr/RMkY/OoB/4wGpOnMt8J05KGS
	kEd0Qx1/JlZ0GZPUYlOmbHipL6ff6bp56Xtv0Fj5bsuLm85kTfjtfV41HTZPEA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:32 +0100
Subject: [PATCH v4 19/32] drm/mipi-dsi: notify about DSI attach
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
Message-Id: <20261125-drm-bridge-hotplug-v4-19-822722850492@bootlin.com>
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

In preparation to support DRM bridge hotplug, let the drm_mipi_dsi code
emit an event when a DSI device is attached to the corresponding DSI host,
so that this event can trigger the actions needed to configure the pipeline
and register the connector as appropriate.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- use new v3 notifier API name
- fix commit message
---
 drivers/gpu/drm/Kconfig        | 1 +
 drivers/gpu/drm/drm_mipi_dsi.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 105dd46a0a45..3ebd9388bdda 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -45,6 +45,7 @@ config DRM_MIPI_DBI
 config DRM_MIPI_DSI
 	bool
 	depends on DRM
+	select DRM_HOTPLUG_EVENT_NOTIFIER
 
 config DRM_KMS_HELPER
 	tristate
diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 3ac1dd5ad640..ae49f3aa1b2b 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -34,6 +34,7 @@
 #include <linux/slab.h>
 
 #include <drm/display/drm_dsc.h>
+#include <drm/drm_hotplug_event_notifier.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_print.h>
 
@@ -386,6 +387,8 @@ int mipi_dsi_attach(struct mipi_dsi_device *dsi)
 
 	dsi->attached = true;
 
+	drm_hotplug_event_notifier_notify(DRM_MIPI_DSI_ATTACHED, dsi);
+
 	return 0;
 }
 EXPORT_SYMBOL(mipi_dsi_attach);

-- 
2.56.1

