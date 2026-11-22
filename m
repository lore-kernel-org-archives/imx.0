Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361460;
	b=WQFo/oP+YKcil7fo9Dq7FIS+VyXW9QTLnUUMAvY6kUjvoRUT3anoayk9utrUi6AvuZYv
	 jGsgW2zKIJW41avYmX0WtX28NdNxcIVlKzjefXxhFRRfVgt3LuASMqGuad1v+rW6NnbGS
	 lsN13rytDfPE0SID955q0qi/QmwPUlXepxl9eKOe/y5weEbAsigejlsrjzOg04kv8EE9v
	 jHLsQ9MtKWSAMLxMxNwEXDSJKORwzZHDKJZK8VSzOCd6HWc02rAt+MXDJhM+2SJGI6pJ2
	 V72XsgcKJxBFiQM7cMODFwM7VjTMwVJ9w0SuCQfK6ImnHiQFlcE7RiokODeVFbKn1iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7itunjG2J42PnC7jSB4jhKO5BUVvNkVP3J0t/6cOCWw=;
	b=PWWiuXz7WI/h+N8HqU8bY8csB0N4aaKXSMWdS9fsnmtEWKcR+LKvqNqYom7NJ80oxDew
	 y/Cpjt45u5h2UsgVKxkVatyVa0gkwJ5Ukc2ZViGk5Xv5QG1o0RjKTtIG8nM/Ql/jLJzU4
	 /tiVdDs8qI/cFF6JRxcHsr1TTW2rwcHy/GxvYa7wzh8GUk3Chsf17v1TID4CPNm0uo6P2
	 0Ndr1802BZEcHfPKadnUAsyIS1v/MDEJQ9HEiF981sIXNFTQbPduVJWOmtL5oN97zNrxR
	 G3fhTQaTmSnYRko5o1qrTHr1AFC2DA4DsJWmssQz+Ydx4D3ikcPBQ8voLQVEYxfr7JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=IWCmayX6;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04422606A32C
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 15:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04422606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=IWCmayX6
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so16570315e9.2
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 07:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361458; x=1795966258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7itunjG2J42PnC7jSB4jhKO5BUVvNkVP3J0t/6cOCWw=;
        b=IWCmayX6BUhTLAz95JeYG+024Sp3bQwI+XFERGKhpldUQ9xxubt7QzLnP9W5cEvf5a
         g9U1sdg7oMD0ZZJFpO/uLvk230Oxje0NSlWRXE3iFS096vGC1xqpElIUog3dAw+4i+lu
         t6xC3hqWty8OHlXXscN890VZTbBGIExfe0r0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361458; x=1795966258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7itunjG2J42PnC7jSB4jhKO5BUVvNkVP3J0t/6cOCWw=;
        b=bFaGY7dGvIeHpIQ7mbeAHYnsXgyzxwI5zntDjATw1duq6B8xcCUW4xDez2L6GMhUSJ
         dyQ/3zJs7485l6oylJW38YGTwaGR0R9N8xVQA11MfzgqM0GvbB+cMy3q7PfaY/oRIOzm
         7EnQxBUG3oP9C2BnYKF29piudi0DozdrGFhfl6XYPUEjj7dZTCp9G2GOlpnXjc0df1ir
         vonOjnGYqKukDTa1PNso/ZEq/ynj/I979nZVvBuqA8NPOIDObdHrPDMYX5XL9BmlA5Wt
         pWqquv4IqzpBjabGNOEc7Cjeql5fGN66PnSJtsbsLjkgxb0dmy91rnTR/Tyi9DQ4DFy3
         pc8g==
X-Forwarded-Encrypted: i=1; AL+hErFc2pwZqXGn+U4MBorBrvQeyVE1tITeX8CGjnIdbZL56Nf8/TFFkwhYNtzoGnhLhKQ1JEk=@lists.linux.dev
X-Gm-Message-State: APuU4Z/mG3vN1IrzzgwxSSQIWxH16JIr+ECSZkIBIQGH6q9H6Oce/7Kd
	fMd2iPnDYHF0TbV0Ag0aPLna+2RrE23CfadCNT3X4aLmLo1ZeRHV5j93Xb9is/rVL4I=
X-Gm-Gg: AZFdTZf6XrGGGrdC8+aX2yjVOCpYGwlANeQOTSi23szhhvmXfA/aoSd3EbSufO3sneD
	wljQxkq1nA6axQwJU4ULC34CkxJk6mZu38MSU4OU42ruGTplCZpeft8QZqekhQ43qx4vA25Tl2w
	7mtYkITItkw2HFu1Y+kx2LwRTAjve0QryZJlHxqplX+1YMUwW8R7p2Xcl51V0T5Hu9iQl1Nv3DQ
	XjQzCXdA4vbm1tmF5GpoRcNbikQKD2AvUb3J4FsMod1wmsJUHd4tZBL6CuhMIMMBlFlCcCZBLML
	KqTIwIySs0+Uv/TXrK218UI+DQnql+o+IDA0xv0cYu/EdZRCJRD1hVraWzz/1GqZgov9EsWB68J
	XQL+xAN1cce17mZdg4fx4yOmpqFCdDCPpZtpOE0z9AFQeh87KXQyI+LZVu5vQoJjowvk7zY3VKy
	uSqB3SmmZvAyOxygDCHvZB9Epq/I9khQpewy9wTpGAyKi1vd2QTI0vQozQ3S/9CsShwobHzPOFM
	PvKCDlZnMIOq51hGmyoT2Kmsryrx0OhVpZnS5szjsV5T8giW4GKGC7Xe8++6q02VtOAx0C1vYzb
	mSfpFh04Lsah05zhC0bXNx8AO7K3+w2oxLdAw4rqTMmUExFu9TTJZCvaEvA1R6JpCXcPop9EdV4
	ZYM/I2pinDaZCq05Ta/rmYa5wWSvkP2+yX4Fdv+0KFtspayyFWgyiZSzapkjeGLLuxqEgDpsoLS
	WfKL32GFna8ihqfjOhmieJeLw6pQ==
X-Received: by 2002:a05:600c:64c8:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb8881de62mr177878065e9.25.1795361458330;
        Sun, 22 Nov 2026 07:30:58 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:30:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/8] drm/mxsfb: Use the bridge connector
Date: Sun, 22 Nov 2026 16:30:03 +0100
Message-ID: <20261122153032.2782768-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
References: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The state readout of a connector is implemented by the bridge
connector helper. Use it, as the LCDIF driver already does, in place
of the connector each bridge creates on its own.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---
The bridges used with this driver have not been checked one by one
for DRM_BRIDGE_ATTACH_NO_CONNECTOR support.

 drivers/gpu/drm/mxsfb/Kconfig     |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 20 ++++++++++----------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 31db7a824a93..78e983b71ec0 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -15,6 +15,8 @@ config DRM_MXSFB
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  Choose this option if you have an LCDIF or eLCDIF LCD controller.
 	  Those devices are found in various i.MX SoC (including i.MX23,
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 641691fc92c8..038f5c896dcb 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -23,6 +23,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
@@ -118,7 +119,7 @@ static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
 static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 {
 	struct drm_device *drm = mxsfb->drm;
-	struct drm_connector_list_iter iter;
+	struct drm_connector *connector;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 	int ret;
@@ -139,19 +140,18 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 	if (!bridge)
 		return -ENODEV;
 
-	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
 
-	mxsfb->bridge = bridge;
+	connector = drm_bridge_connector_init(drm, &mxsfb->encoder);
+	if (IS_ERR(connector))
+		return dev_err_probe(drm->dev, PTR_ERR(connector),
+				     "Failed to init bridge connector\n");
 
-	/*
-	 * Get hold of the connector. This is a bit of a hack, until the bridge
-	 * API gives us bus flags and formats.
-	 */
-	drm_connector_list_iter_begin(drm, &iter);
-	mxsfb->connector = drm_connector_list_iter_next(&iter);
-	drm_connector_list_iter_end(&iter);
+	mxsfb->bridge = bridge;
+	mxsfb->connector = connector;
 
 	return 0;
 }
-- 
2.43.0

