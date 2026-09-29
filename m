Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D5351CF45
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678272; cv=none; b=ZfwA1+CjlRNEIHPCq62PGAqnAzRW7hXeCp2lvvtHfZwRQmEJHLG6UANCMeTPgmVBoVFw7RdB4v40VbFKT5vvCi12V1j027LlUYhSHzp0RocARgo6kzutdoQukZqluJN2Ux4oqDCHibljwbRraHPjPg6UF95YD7sHlxH79EW4faw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678272; c=relaxed/simple;
	bh=kMg9CyEpRG6j7s4GHZ0KuFt0d9OuafQqS3yLuECoiB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GPAPeJPSWK0xDrQT3iR57i2KdF79p5Xu7n5w3TWy2rSuNQ9HqxNmgQmY7Hxbds+TMF4r7J54mhSvJeSDrl2RJE9giIYZLMymZq9VSI3pImdR6wqB0wCTWxpn24o1VMDOXvjDSpL4l75MMY1vUxUd95TDHgc3m/IL1laHugvFkB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xFWWeVC+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xFWWeVC+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0AB8D1A1059;
	Tue, 29 Sep 2026 10:37:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D24AB601BD;
	Tue, 29 Sep 2026 10:37:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6BBB103297AF;
	Tue, 29 Sep 2026 12:37:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790678253; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Aq/miDDh+FHesOvczcSzM5kxiy3v5uRbviWlnSzPe50=;
	b=xFWWeVC+oeNOjqXAdOi77g+AXgAib7PPbvOa6ZG181NE2dQGdrSTU4VLiyGxXRwcIlXA9a
	IuntcrYc3PDfrZ7K8pWtNJvwhaW1jsaM0iyBAebn8La4S600cbQBhcpDfEAqvoH2kXrKct
	/Om21RGpyULsuJKb0QZ5WVh/Phg6TO2TvMjdz5tmA7qfvwiWJ1tajgbpkHFPj/V4mmqYCo
	d6hNljqygdk0a22n+iXBdh6I1abYB2aMR+1gQfGyVh3zP4BDdhhAuGLhMCkpkI7Il9+6KW
	EfNXZ8ICN74ad3DTYMKCMbg2Qa7fyDRcKF1gxMxilTgUUEcnJk8YoGlO4mE+HQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 29 Sep 2026 12:36:39 +0200
Subject: [PATCH 7/7] drm: renesas: shmobile: stop using deprecated
 devm_drm_of_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v1-7-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

devm_drm_of_get_bridge() is deprecated, switch to
of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
a refcounted bridge, ensure it is put.

drm_panel.h becomes unused, drop the include.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 328a36215e39..51bae2008cc6 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -28,7 +28,6 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -447,7 +446,6 @@ static const struct drm_encoder_funcs shmob_encoder_funcs = {
 int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
 {
 	struct drm_encoder *encoder = &sdev->encoder;
-	struct drm_bridge *bridge;
 	int ret;
 
 	encoder->possible_crtcs = 1;
@@ -463,7 +461,8 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
 	}
 
 	/* Create a panel bridge */
-	bridge = devm_drm_of_get_bridge(sdev->dev, sdev->dev->of_node, 0, 0);
+	struct drm_bridge *bridge __free(drm_bridge_put) =
+		of_drm_get_bridge_by_endpoint(sdev->dev->of_node, 0, 0);
 	if (IS_ERR(bridge))
 		return PTR_ERR(bridge);
 

-- 
2.55.0

