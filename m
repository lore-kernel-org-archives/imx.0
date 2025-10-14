Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CF4305063
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 11:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441483; cv=none; b=FZZD5FX9y7sWbmsY/0zyaFlftCBMZAUKls8baalPWicz5/hAh5K33dJwpmjLDHoCb2JhaqgOY9WQXSVblauAUxCiBYOKO4BjYPSR+Of6DSoVmpNCUQM+ax016AzMMoOe3NgLqly37fBlvywBgd/Qcmw1y4o2ZvIUHUAaukCMRVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441483; c=relaxed/simple;
	bh=61TAgpC6xIxD+GLJmAqAp3NF5w/zqrYzvT3SAiTOGMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oj08t6dPc29/lcisbg+/FAjI6kNFaMB+g8tIjdOa37tvsmI8/W4xjsfhwqYXdIRcG2Yx6/y6u5ffMZS3HzHyZspKw9q+6wuEKPSmxS6TsT8oYx5kgHoVPEvvbrlYlJKxcKZ8YlsB3hvXmff1nRyIOL9gyNWLxOnoU8e7bZTouXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EKoSCROO; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EKoSCROO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 437EDC09F85;
	Tue, 14 Oct 2025 11:31:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 488B8606EC;
	Tue, 14 Oct 2025 11:31:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8601102F2291;
	Tue, 14 Oct 2025 13:31:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760441478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ajkqAPAGtZiGLSW/gfRly6gsVWXDLKcxvYjMA7UtiVg=;
	b=EKoSCROOnzz9cFlAp+jg0Ckb5AMcN2ktPeidsHBVYlRmMbpwY4wKojKI1XwJHHx29ndHDW
	Zt17i1b3gys3m155gnHJ7s/KTH/8yjO24sXTYesUSUYO0YUTfG0f7cqoRgB7gpzPMZWx0s
	Qa5jew9uo0x/DxoB07+JMa26lGkHdyGfO7yGkFvl7rSuX07mxpvDLyfWfHoajiDx6DDFD/
	U19mp2/RfERuhRuS2rWAiX75JbYceqSMA79JfB7DsxYQtCAF/zgo5IFb2a76goA8kSnWxV
	Ketk3uAd6AauihB2UYcsPFArH9CN8XdWC4N7A8C5G9Xl6T4OI7EmT9SXDo9e3Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 14 Oct 2025 13:30:51 +0200
Subject: [PATCH 1/2] drm/imx: parallel-display: convert to
 devm_drm_bridge_alloc() API
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-bridge-alloc-imx-ipuv3-v1-1-a1bb1dcbff50@bootlin.com>
References: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
In-Reply-To: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

This is the new API for allocating DRM bridges.

This conversion was missed during the initial conversion of all bridges to
the new API. Thus all kernels with commit 94d50c1a2ca3 ("drm/bridge:
get/put the bridge reference in drm_bridge_attach/detach()") and using this
driver now warn due to drm_bridge_attach() incrementing the refcount, which
is not initialized without using devm_drm_bridge_alloc() for allocation.

To make the conversion simple and straightforward without messing up with
the drmm_simple_encoder_alloc(), move the struct drm_bridge from struct
imx_parallel_display_encoder to struct imx_parallel_display.

Also remove the 'struct imx_parallel_display *pd' from struct
imx_parallel_display_encoder, not needed anymore.

Fixes: 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()")
Reported-by: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Closes: https://lore.kernel.org/all/hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 6d8325c766979aa3ba98970f00806e99c139d3c3..3d0de9c6e925978b7532b6d13caf6909cc343dd7 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -25,19 +25,18 @@
 
 struct imx_parallel_display_encoder {
 	struct drm_encoder encoder;
-	struct drm_bridge bridge;
-	struct imx_parallel_display *pd;
 };
 
 struct imx_parallel_display {
 	struct device *dev;
 	u32 bus_format;
 	struct drm_bridge *next_bridge;
+	struct drm_bridge bridge;
 };
 
 static inline struct imx_parallel_display *bridge_to_imxpd(struct drm_bridge *b)
 {
-	return container_of(b, struct imx_parallel_display_encoder, bridge)->pd;
+	return container_of(b, struct imx_parallel_display, bridge);
 }
 
 static const u32 imx_pd_bus_fmts[] = {
@@ -195,15 +194,13 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(imxpd_encoder))
 		return PTR_ERR(imxpd_encoder);
 
-	imxpd_encoder->pd = imxpd;
 	encoder = &imxpd_encoder->encoder;
-	bridge = &imxpd_encoder->bridge;
+	bridge = &imxpd->bridge;
 
 	ret = imx_drm_encoder_parse_of(drm, encoder, imxpd->dev->of_node);
 	if (ret)
 		return ret;
 
-	bridge->funcs = &imx_pd_bridge_funcs;
 	drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 
 	connector = drm_bridge_connector_init(drm, encoder);
@@ -228,9 +225,10 @@ static int imx_pd_probe(struct platform_device *pdev)
 	u32 bus_format = 0;
 	const char *fmt;
 
-	imxpd = devm_kzalloc(dev, sizeof(*imxpd), GFP_KERNEL);
-	if (!imxpd)
-		return -ENOMEM;
+	imxpd = devm_drm_bridge_alloc(dev, struct imx_parallel_display, bridge,
+				      &imx_pd_bridge_funcs);
+	if (IS_ERR(imxpd))
+		return PTR_ERR(imxpd);
 
 	/* port@1 is the output port */
 	imxpd->next_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);

-- 
2.51.0

