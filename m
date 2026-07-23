Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B6B4C9564
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 18:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832382; cv=none; b=h/eaGVpVXbgXpZ3Xqy5GOEfSW5obpdmZHX4Nakw1+cPS0sRWUYF4PlT0IozRrfJjXiNqe+UsIo/MuHSt4H1GQlBbxi3TuAEFxgN0VDZJlrBmPvAxPyN0nAWtzdlJMcAezy7jp0gphzDsO6pLAbToUpjPkNWSmA151/XRkmq5f44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832382; c=relaxed/simple;
	bh=/V8mneptUPJ/q4aURKAyvm+FJuT8YJEma4JCKxUZvG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QyRiqQQff9/D6mQMpriAsY6weV+7qP4fmYH6mvIbXQDbyt07fbmqSK+UV3oIsRtbM+m16r9b3oMQIr/Gc3S2LKp2vWTPEfhX2f4mR0QNs420rwEJc7DMbngiIVMGq18jNfarv1nCfHfm5YZSbf7sYOi+Jq9QQeAq5LrqLYyOe58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6E2+bn4; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6E2+bn4"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso853130a91.3
        for <imx@lists.linux.dev>; Thu, 23 Jul 2026 11:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832372; x=1785437172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNzFXtDRL36sjfeetYaoRGkJ3BZXJkrvXWbUMZXEOzM=;
        b=H6E2+bn4rGjvlv3Fnp5Vp53/RukPxZDbuoywq/X+TP9fnE+8Z934MOkmx/9BQDAfbV
         VFrq/6olB1JN+cQZkBHh4MQikKqWTVfHQz49cGII58d5r3CnQ6o/0exA8LtTi1ynLsVr
         Y9+BzhQPgmRFpVYuWzMCX6Q0WBafevqwORdsMjOBPrS4uv+qhu9QK0GrYGEvvS8TRQAz
         6gCAEO97VspOjwJR7bKuQXWQGMMCOFaZPpZvQVh7vIisj6hS3CnF+PZgDMe6Y/kdcmjl
         ahwIVk6L9pa+RTFkDnFxPJJ7BVm/D+0U6ftxT9flXesL/JD68xzXnTTkIboCnD5aZRC4
         Zbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832372; x=1785437172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNzFXtDRL36sjfeetYaoRGkJ3BZXJkrvXWbUMZXEOzM=;
        b=RFazZA3vqCXjPlZvSnt/GZgYbVNR5c9nnrUuHlDn1TZMABn+OjNF+HYmMkLpBpS628
         i8/ZfUxPfZKWGQGsbUd1Q2cI1tn/MDYn8zOc6RosJMAVzSSm7YVWlaoqMaV5/fVnb67r
         7RYOwM50/dVtzkfDvH3NynzJ7I7gWyim5uRqyPKUGTPdKtVwzsoObLdMBBFSbK3VEtY+
         TXhPOWn1iCpUFms1oiSg5HQ1AVH6BoiZp90j8YFr0+LztpYMemRRQTbhjLasPKRU5H05
         HO6GqrCPi3D2txyoVi180rqz291tTfwTgwSNTkRA14vokrTiTjW9RRAAZcYUIzHo5r1G
         /ppw==
X-Forwarded-Encrypted: i=1; AHgh+RrcY1M7s3h3fXZJv4Ay976tZz0DceMHLTr3ipfXysjvTr9UymVl0fR8BF7H9JSlnXB6wfA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMac3ey0mnNQG7P6xMwUIiscZ6NPvG4HCFmPJRX9Cg5rGUg3mP
	P1Jd6lZEG+st3OFmsQ4JBGcqaRpcq93lOi4mnz7ZV7W/aJFYvzqxGZen
X-Gm-Gg: AR+sD10uPZNCMph7/+OivRvmBhHp1wDDKZ0Mp98GAKyEQYnC3cWcdzOdRMpJ339b7lI
	mim4PpD2SlFcq4CpCZZUECMsSlKOXvKWjRMOW2mG4ceaHYB/Y/PyQBCTsXamlmlQGwJ88MJ18hd
	2ao37fT8i/sAUVqKIKuiyw4BeQXMkYKXABxeJSsxzvi1ph3R+EyNEmmSA/EL+jHpMxotWECBUHH
	4q8XT/ve643RDABAuR5aRrJ/XroVXeLTVH47FM77/BC41YyrmYYQqhXz9F1bj07QTFVeutqUb+O
	mNLVi6yoDCmYacCd7cFH3pISV7ZMEUo3aXqBAK6QrlyurTLdPLccITNozHiKi5WyS2zrKLrnaJ8
	TK2paUCW3INxaY7yWDMAyP25M+vp/yMDfK9e7ShccpsIuVX8oNM1IecEIsklhY5BkrTJ7tr/m
X-Received: by 2002:a17:90b:1d02:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-38ec6499300mr4568453a91.2.1784832371666;
        Thu, 23 Jul 2026 11:46:11 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:46:11 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: cocci@inria.fr,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 06/36] drm: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:08 +0900
Message-ID: <20260723184538.3888637-7-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |  6 +-----
 drivers/gpu/drm/nouveau/dispnv50/disp.c            | 14 +++++---------
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |  7 +------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |  6 +-----
 4 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 51a0ec043248..52a2334be799 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -55,11 +55,7 @@ static int imx_drm_atomic_check(struct drm_device *dev,
 		return ret;
 
 	/* Assign PRG/PRE channels and check if all constrains are satisfied. */
-	ret = ipu_planes_assign_pre(dev, state);
-	if (ret)
-		return ret;
-
-	return ret;
+	return ipu_planes_assign_pre(dev, state);
 }
 
 static const struct drm_mode_config_funcs imx_drm_mode_config_funcs = {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 364227f5456f..e8fde399acae 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -301,19 +301,15 @@ nv50_dmac_create(struct nouveau_drm *drm,
 	if (ret)
 		return ret;
 
-	ret = nvif_object_ctor(&dmac->base.user, "kmsVramCtxDma", NV50_DISP_HANDLE_VRAM,
-			       NV_DMA_IN_MEMORY,
-			       &(struct nv_dma_v0) {
+	return nvif_object_ctor(&dmac->base.user, "kmsVramCtxDma", NV50_DISP_HANDLE_VRAM,
+				NV_DMA_IN_MEMORY,
+				&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
 					.start = 0,
 					.limit = device->info.ram_user - 1,
-			       }, sizeof(struct nv_dma_v0),
-			       &dmac->vram);
-	if (ret)
-		return ret;
-
-	return ret;
+				}, sizeof(struct nv_dma_v0),
+				&dmac->vram);
 }
 
 /******************************************************************************
diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index 2334b77f348c..16a02527285e 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -58,13 +58,8 @@ static int osd101t2587_panel_prepare(struct drm_panel *panel)
 static int osd101t2587_panel_enable(struct drm_panel *panel)
 {
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
-	int ret;
 
-	ret = mipi_dsi_turn_on_peripheral(osd101t2587->dsi);
-	if (ret)
-		return ret;
-
-	return ret;
+	return mipi_dsi_turn_on_peripheral(osd101t2587->dsi);
 }
 
 static const struct drm_display_mode default_mode_osd101t2587 = {
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 1d6c9a423a41..990805f1fea6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -64,11 +64,7 @@ static int tilcdc_atomic_check(struct drm_device *dev,
 	 * tilcdc ->atomic_check can update ->mode_changed if pixel format
 	 * changes, hence will we check modeset changes again.
 	 */
-	ret = drm_atomic_helper_check_modeset(dev, state);
-	if (ret)
-		return ret;
-
-	return ret;
+	return drm_atomic_helper_check_modeset(dev, state);
 }
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
-- 
2.43.0

