Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FC13C871B
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 21:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987767; cv=none; b=BDhajdT7xxjE49ZtP96jNVHl0qrnx8QB61smwpClFqZJxXwfuvGXSleWbpixsVzzERJHB7Da9qdkoYsZrGjBxnF8PDOSLrKNQQ8451uGr/vKAwsE0yk+yZNq3RYwfbxbwi7GZUng5s1E3Sc0+HlpnyvNKJBl2A+uO58SKFBnNmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987767; c=relaxed/simple;
	bh=URW732EQx7Ne/f01+x4cxIvdq8e3brW7+hVxha4kXYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H0bkvrPKxjLuf27hr1LjJma7VmaPrCQbdOEldqJTLTfRPPp+yMkynM76vaGjYnDE5oGFt8hXYaUiWY3dyjdGUXk17Dk9/h2J5hKs7/b+Bx6sTYYSElO7cMUjvZhvZDpRDHMA9GPsbjf+/fP2+toQwSF9e0zgVI1Auk9rI6hPbd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mScFdJZd; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mScFdJZd"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97e9adae64cso1075885241.3
        for <imx@lists.linux.dev>; Wed, 09 Sep 2026 14:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788987763; x=1789592563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q46w9/u2wpQp5QGB3PuR+xp/kUloMNPv1YY/PPVAfY4=;
        b=mScFdJZd/MdSPjeG2YnU/bqo5Vvr/Gghj3aIVBN1qubh8YM5uEw5Ty0sZCHRHKQnMs
         bsmjKCtuxTrV5wKIZOI49pZcLb6xLLST48jpwB/nL1jAa/A+e1bK2UY7gUl8eR3FoIt1
         Ub5n2MJihILXEHEgWmtSkkorBamHd0UbezG69EflnKpg1Lx0izDqhrWfGG+6NvqoZLJM
         kjXr+MD6F3+DUP2FoMXClByFxOzyyFuVsAkCCYf2G+xBNMOcDi4A+AsF2Yhp2ROpEsQq
         2n7hwXomJ6qLYq4TAV2+TpkmGSxdY1PZbedsb1lJzpS+Ohnt/TTvV399hP9zwm9nH9Dy
         J6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788987763; x=1789592563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q46w9/u2wpQp5QGB3PuR+xp/kUloMNPv1YY/PPVAfY4=;
        b=LvhvAJFz1bpLPM9n1DSCzZj3Gz6K14i7OpT2am7FislOHN6rg0NdXwmO5gwPAer5nO
         E4QX5gAUuUL03bjGEwmSvdFFrUqbwu+iXJCc+9e9JKos4I9uM3nPu1N5GPBLWgc0Swcg
         yJAmEc1i9H74SpNFGovaxeGaDKpSMzjp/8DrxbFzOQxDNV8BrtDqVdULeBwhi/z6J1FJ
         6zRQ0+pnnBWkj8saPH3NRDxVxUpldEh5adGVBcS3NLJprQF2iNmUnyfuT4uWDwGeu4pa
         man1J4+gb27e0PZ3w9fk9E9ZtL6wWbCOznZdH4PnG3t+BSQqiSTVO43QvKfWxZ3MEJI2
         AcGg==
X-Forwarded-Encrypted: i=1; AKwUvByw6E2q5PFLduGufXZ6eirhH4/RrEBh5z+T4LtDn3Zd7ICTzSNKzkgvOTfNY2EHMDY4XvY=@lists.linux.dev
X-Gm-Message-State: AFuF++k/k2Qx4lwMrP5iqyls+jRVKjHFA/N7CZ/wORcEJflq37KHcbrf
	DYr24AVlz+GMt5pLf3hViPQ96V82a/J+Fr0WLjfERx3AMBH/dmG/pdlxpivxHg==
X-Gm-Gg: AYBFou10wYAESISU2iGjY7pzr21wJoVO77k9Mbu0F0h8FuUpQddH55BRTuiW8KS6nW7
	466e5qEnq6jFZhX0vCd1w5B4pDzGV9V6I+41u1Sh4jBiajkBpN4Rha+rC41SXRJ4GFC1vGKCvZb
	Lnozv8FZ51OYf3W1Q5o2J2G1DaqZtYOq0yb5AvBYKbxsFPcsjSfFOrfa9R/NnfzTyfFO4nI1RIX
	0Awb+HbaHAjUE0oEM2eXzex/XkRrbOxgWMXAy3RUYDyOjwdNOU04g3K0nmHRI9vML/FzkBv8N/G
	rgwljbyuf4hRTGU4D7Wd2ju2l+NTvKlajDuAegm0UoB/8m2/gTF4c+3aFJsEhk01U3U4KkHspAH
	EAnQtWP3gcqHF7fycFrOTRz2SvZfjlRzGfK7pd7IwtGb93Iwzd0nT1rHFUrSmS6Wh5flnzwhJoi
	4Hsl7u6PIulKkLPSprFc/xUX40sgDzVjTBe6r6vQ4WevcCLRUL9W8TnJs+XdXPeFwJtrgFoY597
	IvomUyz12JdTywA/YJevC6QpRc7bzXeaSST71+S6FZcpKwc
X-Received: by 2002:a05:6102:2d03:b0:786:77e2:d8fa with SMTP id ada2fe7eead31-78a4a943a32mr14848382137.5.1788987763467;
        Wed, 09 Sep 2026 14:02:43 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a803:6c49:659c:692c:9416:2f0d])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a4764e321sm12434590137.0.2026.09.09.14.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:02:41 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: marex@denx.de
Cc: mripard@kernel.org,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/mxsfb: lcdif: Fix use-after-free on unbind
Date: Wed,  9 Sep 2026 18:02:13 -0300
Message-ID: <20260909210213.946159-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
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
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index e2173c4d6fc2..7e9f3b205a45 100644
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
@@ -74,19 +71,16 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 					     "Failed to get bridge for endpoint%u\n",
 					     of_ep.id);
 
-		encoder = devm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
-		if (!encoder)
-			return dev_err_probe(dev, -ENOMEM,
-					     "Failed to allocate encoder for endpoint%u\n",
-					     of_ep.id);
-
-		encoder->possible_crtcs = drm_crtc_mask(&lcdif->crtc);
-		ret = drm_encoder_init(lcdif->drm, encoder, &lcdif_encoder_funcs,
-				       DRM_MODE_ENCODER_NONE, NULL);
-		if (ret)
+		encoder = drmm_plain_encoder_alloc(lcdif->drm, NULL,
+						   DRM_MODE_ENCODER_NONE, NULL);
+		if (IS_ERR(encoder)) {
+			ret = PTR_ERR(encoder);
 			return dev_err_probe(dev, ret,
 					     "Failed to initialize encoder for endpoint%u\n",
 					     of_ep.id);
+		}
+
+		encoder->possible_crtcs = drm_crtc_mask(&lcdif->crtc);
 
 		ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret)
@@ -131,7 +125,7 @@ static int lcdif_load(struct drm_device *drm)
 	struct lcdif_drm_private *lcdif;
 	int ret;
 
-	lcdif = devm_kzalloc(&pdev->dev, sizeof(*lcdif), GFP_KERNEL);
+	lcdif = drmm_kzalloc(drm, sizeof(*lcdif), GFP_KERNEL);
 	if (!lcdif)
 		return -ENOMEM;
 
-- 
2.43.0

