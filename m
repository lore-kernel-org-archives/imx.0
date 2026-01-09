Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F252F657C
	for <imx@lists.linux.dev>; Fri,  9 Jan 2026 07:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943930; cv=none; b=GtrzGXRAzYnvRx/8vW6bOQYIWGjGs/y2T9TR/vs2Y8f+itxAAqXwCevBUKm9CPWeweK1r+QEKA3BT7+iUtpsDbZRMzHLmFRun5KRdH1jJmXZWDlmOduG4+UzGIHp6oGjQ2PD+uNoO3VcZAOmCOVAYbhuYs1ySIj67PS86T08v54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943930; c=relaxed/simple;
	bh=+GQeLLeQGiiqeSkUPzm3KmieaFZlwilwQOvruzSGIAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p30iH2ciQBv3MRhR/moFpeNbuY8tppzEYHOHAOvBLs90eHblVo4JYNQXAeIMzFSbUf//y1p6J1BSjEMw/GU25nOVTSKNTsdhIERxevYmX8I/Gz+NGG4BJfZLmM4kqEvs62bVMKYWKpl7yYAFO6PWrioB0+PKur597a7NJ4P0oMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jVXcrIc4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jVXcrIc4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 485B41A272E;
	Fri,  9 Jan 2026 07:32:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CBC060734;
	Fri,  9 Jan 2026 07:32:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60D54103C87E8;
	Fri,  9 Jan 2026 08:32:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767943926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pvuq5NEmZ16/DzSCFHN8BV0xmbV1KisdqLZgcDHC9U8=;
	b=jVXcrIc4JnfqfMct2bEuj9t8dkEePcr6nz63e9VJ67RavE+olD8VyP1qMO/a09x4+h/wDb
	ivg7VZ25KTYwG6Wb9vGOC/R2e0zbQjm18wPAR7OIXRFuRh/QIdichOL4F/jmXwqpUlrEMW
	X8GACYbPiHJ3MnDEvvGeerWqrYSmfayl6TODTt582TKWJ468VT57HEQ38M6lgqG5uwTFhA
	y6PMstdYOc6ShDTmndTVUSA7AVCDCssCup/n4jiIA+6FiekPnToWlC9ApQUglx/Vcy23Rh
	KSfKGTilVtWZDdw+MECb89yG6Fs/mkvIOGZEO+BzOqQGBPower3RF1fFjZnkNQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:37 +0100
Subject: [PATCH v2 06/12] drm/bridge: tpd12s015: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-6-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done by using the drm_bridge::next_bridge pointer.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ti-tpd12s015.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
index dcf686c4e73d..136e47ad1a10 100644
--- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -28,8 +28,6 @@ struct tpd12s015_device {
 	struct gpio_desc *ls_oe_gpio;
 	struct gpio_desc *hpd_gpio;
 	int hpd_irq;
-
-	struct drm_bridge *next_bridge;
 };
 
 static inline struct tpd12s015_device *to_tpd12s015(struct drm_bridge *bridge)
@@ -47,7 +45,7 @@ static int tpd12s015_attach(struct drm_bridge *bridge,
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	ret = drm_bridge_attach(encoder, tpd->next_bridge,
+	ret = drm_bridge_attach(encoder, tpd->bridge.next_bridge,
 				bridge, flags);
 	if (ret < 0)
 		return ret;
@@ -138,10 +136,10 @@ static int tpd12s015_probe(struct platform_device *pdev)
 	if (!node)
 		return -ENODEV;
 
-	tpd->next_bridge = of_drm_find_bridge(node);
+	tpd->bridge.next_bridge = of_drm_find_and_get_bridge(node);
 	of_node_put(node);
 
-	if (!tpd->next_bridge)
+	if (!tpd->bridge.next_bridge)
 		return -EPROBE_DEFER;
 
 	/* Get the control and HPD GPIOs. */

-- 
2.52.0

