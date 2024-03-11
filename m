Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B723B2A4
	for <imx@lists.linux.dev>; Mon, 11 Mar 2024 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710156048; cv=none; b=Ac6or7bqXp2C0v3xVH9VSLCT4r7+ZYvYhb9Y7Rr24S8rRjf3V32qgaQnLOiC3/r+DNIc0sB+DHpfzg615k0yo7DrQKeXJZ314Qj4Pl9AIwmnvsJjyOi/sslAP3f/+IMihC0sDyMe473f3oHHGXvLsrbWgy0HQFKDCoP9YE2AMX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710156048; c=relaxed/simple;
	bh=OGMYbHUNFSBoWDKd5qcnaC+q5URHBrI8YOz8as3SMBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hM0L8kBa3DCHFtp89k3vykhutXG52JSe3u+celfzaIldvwxhCGygPKct8TfMUArpUEPSAQ+yLY0J8N+KEj7n0TI2DdGLyufT1spWAdZ8HU6Gq3JEeK3ptiwr2BSm/C19/aF+aRFdJzglpDjScEVsGH6Y5Ep74qYLmj6qiXMKrPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T3Rp8lgW; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T3Rp8lgW"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d228a132acso53907241fa.0
        for <imx@lists.linux.dev>; Mon, 11 Mar 2024 04:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710156045; x=1710760845; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckBzZnx48RdUyZurHjiq3WjM24jb9QKg0w7hY9V6JDQ=;
        b=T3Rp8lgWWzbjv8lsDFojopx9Zy+ew7H4GhFLwYgNz9qaKAg0qVdrNIDRlplI4Jiucj
         9QweAS+Y6k1UoV/lYQgLgLEL/llaK1qtW7ZEKK5m4gdscMlhUN/MxnGXkw4ebHyAUfwg
         utXN/EwMD0lqPtflMdDDtDUvJ1+Vo7hmIfxQQNgdwWZjdoLq9Q97JbXU7Z30RJfLUl83
         inuCs56zJcis620KdllkBS/RVJ6twS5YSJZsDh++Rf+C9HtqNFIQdPq6VV0FsYUcxD0J
         qx3lNd+/1yh+bTYiec4iPSXOtF1unHDrVgRK4xPcX0P9pQLT4OwLsd87LtUW/ou3C3J2
         nDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710156045; x=1710760845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckBzZnx48RdUyZurHjiq3WjM24jb9QKg0w7hY9V6JDQ=;
        b=CXmDs+7gI5zg/xT4Tw0PvIngOEw7a7m+T+4ok/DwzqWd3lBLTnCi3vfUcq9RhZbzha
         WEznsTiq9eU4CQNZvA/oTdSwt+Ah0fe5kneslUUSqWHMawZoW8G0uXy4HCziTp7wsTv8
         E9kV4H5wALoA6XETCTeJYPPJBs6mBToDMxVsnjvEVihCEuycV6RhnK/c6V4AeVVesC+O
         Pq+eSmutWzWhD01pOxXrVXFntNQfoJqQC1jDUB25L6Z5PpGfzPxH9vEIK8gGs7xuekKN
         bMBmRW3EMTQtiGzE0C0xIQA+P5gPLx1wiYyjvq1LZblfTtnA3vp/Nr5TlCe56zW4bTSW
         GlBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtV2KHo9wYJJy61xjXVeSVng2fj+vIbRec2DAbBmLYSkZPEzpTM+uWJCkCE3e7H1a9AfSg8PWV2Yg2InnZpomu4HAS
X-Gm-Message-State: AOJu0YygKXpO+sZcmkKsuEU2oAxru/yoxN02FGZdpUbAHjbzdyGSLD66
	n1yI52QOAtZeJg9MXPJHlGfWUdYvC/6qBcQaPWlcz3hsNI31EhHRCxdgcaDSqRg=
X-Google-Smtp-Source: AGHT+IEMW6pZQ2eG/0ZxeAV9RTTKWsbi9/nUH/kQZ1SQ/YTeqp2eyBCBOwwst1bBxtobs1RXGk9A+A==
X-Received: by 2002:a2e:7812:0:b0:2d4:142:488a with SMTP id t18-20020a2e7812000000b002d40142488amr4067596ljc.8.1710156045463;
        Mon, 11 Mar 2024 04:20:45 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:20:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:16 +0200
Subject: [PATCH 08/12] drm/imx: parallel-display: switch to
 drm_panel_bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-8-e104f05caa51@linaro.org>
References: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
In-Reply-To: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3282;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OGMYbHUNFSBoWDKd5qcnaC+q5URHBrI8YOz8as3SMBY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukEmKCVfBgBFOhYbAaVKsEoQXHYa2nHGB+FI
 B/IfPnLM+KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pBAAKCRCLPIo+Aiko
 1dMtB/0U8ABgNlb1PN73gBnvPSeUziNmQIXLiqz3b3XbXU1T/vxmrmcz1YCyin30tBvBArKJHnd
 tw7gKlVkt9zj0FFgDl+nXrsVUsq/O0HrXchzBp0mFSkZn6ey4i4pE8Xumq9UwpBTvvmQgIi/Y1P
 wG2D6ilDYD0JS1rRYwzSCvvJZTTL7X2XFL+1F+EATU3PEiYjXTy66AXNyk3nzNMX+wFyqrhztJo
 NaWGXWHfNz7OISUCLnoL93MDYkx9ZlA493hHW7TZ4SEn21yg3w/IWNqC0nBfrZxWs7xB1qZkDvI
 vnVaE8D1u12FsGDOC2n1Sb44NrEoZrHnEfMK0vgzXKfREcV2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Defer panel handling to drm_panel_bridge, unifying codepaths for the
panel and bridge cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig            |  2 ++
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 35 +++++++---------------------
 2 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index 4e41611c8532..8aaf2441bcef 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -13,6 +13,8 @@ config DRM_IMX_PARALLEL_DISPLAY
 	tristate "Support for parallel displays"
 	select DRM_PANEL
 	depends on DRM_IMX
+	depends on DRM_BRIDGE
+	select DRM_PANEL_BRIDGE
 	select VIDEOMODE_HELPERS
 
 config DRM_IMX_TVE
diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 2d044ea1920a..9b60bfbd16e6 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -36,7 +36,6 @@ struct imx_parallel_display {
 	u32 bus_format;
 	u32 bus_flags;
 	struct drm_display_mode mode;
-	struct drm_panel *panel;
 	struct drm_bridge *next_bridge;
 };
 
@@ -56,10 +55,6 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 	struct device_node *np = imxpd->dev->of_node;
 	int num_modes;
 
-	num_modes = drm_panel_get_modes(imxpd->panel, connector);
-	if (num_modes > 0)
-		return num_modes;
-
 	if (np) {
 		struct drm_display_mode *mode = drm_mode_create(connector->dev);
 		int ret;
@@ -84,22 +79,6 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 	return num_modes;
 }
 
-static void imx_pd_bridge_enable(struct drm_bridge *bridge)
-{
-	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
-
-	drm_panel_prepare(imxpd->panel);
-	drm_panel_enable(imxpd->panel);
-}
-
-static void imx_pd_bridge_disable(struct drm_bridge *bridge)
-{
-	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
-
-	drm_panel_disable(imxpd->panel);
-	drm_panel_unprepare(imxpd->panel);
-}
-
 static const u32 imx_pd_bus_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_1X24,
 	MEDIA_BUS_FMT_BGR888_1X24,
@@ -237,8 +216,6 @@ static const struct drm_connector_helper_funcs imx_pd_connector_helper_funcs = {
 };
 
 static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
-	.enable = imx_pd_bridge_enable,
-	.disable = imx_pd_bridge_disable,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -315,10 +292,14 @@ static int imx_pd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* port@1 is the output port */
-	ret = drm_of_find_panel_or_bridge(np, 1, 0, &imxpd->panel,
-					  &imxpd->next_bridge);
-	if (ret && ret != -ENODEV)
-		return ret;
+	imxpd->next_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
+	if (IS_ERR(imxpd->next_bridge)) {
+		ret = PTR_ERR(imxpd->next_bridge);
+		if (ret != -ENODEV)
+			return ret;
+
+		imxpd->next_bridge = NULL;
+	}
 
 	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
 	if (!ret) {

-- 
2.39.2

