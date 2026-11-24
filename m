Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519346;
	b=QrPBRzkhxmdKvniX/z4L58qjHIseZx89jk0XEBqRxfSz8pz0BrUT8OIWvSeb8ZFuLEDp
	 aRsZDaVcAiXhyzmm3A4OU5S72yQ5HwqpGq5h6G4DbB+9inMlEoy328znYJtPo5+UDOLzJ
	 PXt54zO9291GdTOIH6hs++ws0r07OJXsrA+RpKW35r+KA1BQa8WAB3Je3OKTivLSlkmQ+
	 l/+i/xqU+SDpw6ab6Q4EEKhJKNpne9AEY1VHPat9snlLC5S2XkmjlADqOVhUPOHHP8BfX
	 I1OSxKvhF5XsZomek4tr65j1BHnUfZoy9ancLCUVMmVwzAWCbpqFW4WbijWN3DHdZ9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zOlLhiHGS+QvddYr4TaDXREtsHzHjMolopc6Gh+4/Zk=;
	b=ZCYMA9sJM6YmIevUwG61l+PsCrCOAyfPU7EJXKMWHSWt8Cl9jmP0PECYRKXx71WsuRE7
	 N9bBFdvKGLTxUbZAIMqOj1LsQYeZps4WUeKS93eqP7XcCTY4LQSnHlkhb/fU4r40HtbLL
	 vvWbn+EBkFRxw3N95JfSwF4zmZ3H10GPaavrFN4Q2KIAvXskFn5i+Dq7NkKfzscv0zQLi
	 YL4zDCAAnAwDjtA88VPZMqOaj6gNkkePwstPUOQ71W7grYVZbnCu5s7yJ7avjWV7ycp87
	 YmxIfzVnigF/Y0Rza388it7ph27M62O/vsx1oFNvBwR41mc9XlLkYZis6EhAo3Mb5Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IBQ/ogHW";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B027E606A321
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 11:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B027E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IBQ/ogHW
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3869f03af6aso3610174eec.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 03:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795519345; x=1796124145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zOlLhiHGS+QvddYr4TaDXREtsHzHjMolopc6Gh+4/Zk=;
        b=IBQ/ogHWOSQwRuWhDUgntJivKuXCaDjiie2TGZHS4Ie3e1N1xeG8d+bcR6bl7GXJne
         Muc8z5CaQ5V2sNBwVdSVM7pK+8vYvquH3x6z6OCyj+f9HbATilOkqpxib/L60LJF6A3H
         /JnV2bAJMJmVTuPVfhr/AM6r9BJHO2/W23RccOCnkl2drVHcQl9mwrY9rj6VbwcsGwHY
         6T3GavFT+YkYbtCwoegQgBo8pXC60gGyTXGO4NAtPqzbbT3u6/LYVfV6iKw1Pls/j4ms
         OlfVsN1Wa+/hZUVjjDS4+INV9JNKF5rnk6JtL8K99hs7311DhBHBNDQ5LJ5kzcey4DoO
         BtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519345; x=1796124145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOlLhiHGS+QvddYr4TaDXREtsHzHjMolopc6Gh+4/Zk=;
        b=uk/BfChlDQEMdS3ctnoKSIBSMihPCJD4dv1QYsoi+xwMwal1kxtswL/SgjX25+NndR
         uwxtokg58FXvWq1btx2FV2Hlj2BxTPLtzyEeU4Jb2CIy7SnHknWRtbnbi2EK9GqeTJmK
         vw4yiaO9a7Bh4u9RoHlftjEMrmUPVwq1SbB6OwDpjeDBLJrmNNQZNvAaUiqTtMZmcHv/
         neJYnj+yJGCreObSJkPySy7l3V8qadhA76cZ+W3qDR4KGjZnXzahuigFQcT4oieINvJQ
         rcZzUSmMomfFCGEbpXYpnbnsJoWXruwibTDxmRskzFaeuc6APi5JJa1cG/JPfB4UdaHx
         1hkA==
X-Forwarded-Encrypted: i=1; AL+hErHAVnwYPjxsVg7BDbYiJLzyBru8X+dyqQUG4OBtV22KrqzTXMaEDAPuh5+LlOoDszzR37A=@lists.linux.dev
X-Gm-Message-State: APuU4Z9foL7XDgUvl6AJ4Qvie9TUlRkHnrz4B7HQP1s8sH2N6SaOn2by
	6+08idQI47WbCj8XhjHHwCcPhlVAny17G2xCujrtskRSoqzlO4lVzFPF
X-Gm-Gg: AZFdTZeVPKb3Qvx5ipBd16k1V38tV2Fy1YU0AAY+cwCORUv5njpSr9NiRI3RYBoUxFF
	AQ4Ygqj7L1x1dTIMZFnwjo24MRrikUfGQGnjXyaiRwcbNZpSZyp0sWBvWpUQjlgZGh/Sj7JVnmm
	2rK9tW55HgLM4fzZHWsOtvdQYpytIIjrydLgwuL13Kukghc+Foa/v+2fgjcrOEsGgxXmddw/raB
	5s1yoob3hm5MNKR5epSxWX42XjBj8jNUqMNOb8TnrPRkyzqXb6EkjSK7Sfgpq35QyLNpfa2s2L+
	eIZeas14fKgnVcDMKFD2/fiVb0UiJj5pm7vUROrcD15WR/uuMH13AaNo0QxbMPOYw16hAZm9DGZ
	KZ8ne9Ci9JC4AfruB74rY/ckuYNu/LW4vzZ1jGqvBLnFkxtSTCc62jlxQNuJXODxmkcf6rf77fm
	E46RZFGdG4bRJE1fQfnThLpYjFOiOrlzgWwRLoKIie4g8yVtv1cqUde6R0gl4xXBiZbrqa8+NYj
	DxkhktaBlhgxlnB045//jriJFXKV6hLePe2LgStIFxc7NEYxPt0sW03VQ6khXx6NbLfmwO0TO59
	gaXGCVL60ffVC0T6br51gtDRerhz7VOkd8vu/kUWkzc8WU2owOJAP/MvQcZC8uRbsfArr14fJS3
	xu+wuhzltN0vTuygYPROQ78U=
X-Received: by 2002:a05:7300:ce81:b0:384:a3c5:35b8 with SMTP id 5a478bee46e88-384b3986ee5mr18053216eec.8.1795519344585;
        Tue, 24 Nov 2026 03:22:24 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:a13e:549d:3701:4c51:db13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm55112634eec.4.2026.11.24.03.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:22:23 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: laurentiu.palcu@oss.nxp.com
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	marek.vasut@mailbox.org,
	mripard@kernel.org,
	luca.ceresoli@bootlin.com,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] drm/mxsfb: lcdif: Fix use-after-free on unbind
Date: Tue, 24 Nov 2026 08:22:15 -0300
Message-ID: <20261124112215.12255-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
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

lcdif allocates its private data, which embeds the CRTC and primary
plane, and its encoders using devres. These DRM objects are linked into
the mode_config lists.

Since mode_config cleanup is DRM-managed, it is deferred until the DRM
device is released. An open DRM file can keep the DRM device alive after
the platform device has been unbound and devres has freed those objects.
The later mode_config cleanup then dereferences freed memory.

Allocate the private data with drmm before initializing mode_config so
that it remains alive until mode_config cleanup has completed. Allocate
encoders with drmm_plain_encoder_alloc(), which cleans up each encoder
and removes it from the mode_config list before freeing its memory.

This can be reproduced on i.MX8MP by keeping the DRM card open across an
LCDIF unbind and closing it afterwards.

Cc: stable@vger.kernel.org
Fixes: 1c71d925c03a ("drm: lcdif: Switch to drmm_mode_config_init")
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Return the encoder allocation error directly instead of storing it in ret. (Luca)

 drivers/gpu/drm/mxsfb/lcdif_drv.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index b7be7e17d1d0..2be5a76e936f 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -24,6 +24,7 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
@@ -43,10 +44,6 @@ static const struct drm_mode_config_helper_funcs lcdif_mode_config_helpers = {
 	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
 };
 
-static const struct drm_encoder_funcs lcdif_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 {
 	struct device *dev = lcdif->drm->dev;
@@ -74,19 +71,14 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 					     "Failed to get bridge for endpoint%u\n",
 					     of_ep.id);
 
-		encoder = devm_kzalloc_obj(dev, *encoder);
-		if (!encoder)
-			return dev_err_probe(dev, -ENOMEM,
-					     "Failed to allocate encoder for endpoint%u\n",
+		encoder = drmm_plain_encoder_alloc(lcdif->drm, NULL,
+						   DRM_MODE_ENCODER_NONE, NULL);
+		if (IS_ERR(encoder))
+			return dev_err_probe(dev, PTR_ERR(encoder),
+					     "Failed to initialize encoder for endpoint%u\n",
 					     of_ep.id);
 
 		encoder->possible_crtcs = drm_crtc_mask(&lcdif->crtc);
-		ret = drm_encoder_init(lcdif->drm, encoder, &lcdif_encoder_funcs,
-				       DRM_MODE_ENCODER_NONE, NULL);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "Failed to initialize encoder for endpoint%u\n",
-					     of_ep.id);
 
 		ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret)
@@ -131,7 +123,7 @@ static int lcdif_load(struct drm_device *drm)
 	struct lcdif_drm_private *lcdif;
 	int ret;
 
-	lcdif = devm_kzalloc_obj(&pdev->dev, *lcdif);
+	lcdif = drmm_kzalloc(drm, sizeof(*lcdif), GFP_KERNEL);
 	if (!lcdif)
 		return -ENOMEM;
 
-- 
2.43.0

