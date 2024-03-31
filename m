Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616BD147C88
	for <imx@lists.linux.dev>; Sun, 31 Mar 2024 20:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711916956; cv=none; b=V4mXlRuKeEr9hQREph57Zb6ne7gAM3fS/OoPjZQugy3NNkV1fUqSpvix6i5I+YxwhuxTwcD5rCDTlJrzs1zFnspYDSdYumHWc3g6/GuDMM2DDh1SL+qSW8GBwp9M4nHlc3OnvssdvvboWhdedDQDWWOMqgsqh5Ms/dFz+X2Akpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711916956; c=relaxed/simple;
	bh=Pi9W5qgy4T7+J9hP9AVFepGfzI8GpfyO2Ku1B6h2Uks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fuE7vl6i78Ig7LAPpWF1bd+39Pb7hYp6vQbOLNNpmogUVHw2D6e+4VwdeSxGMbdyv/8gGld4zswLXMDvGSlcbPAEpbmAoDRye5Zlfamgwujta5fBHhwTpP6Oykj66gp8uKRGeDon4Raf/+AnoXU3uMg9KRId3JGcZjqooFZp/h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lwk1IKbt; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lwk1IKbt"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-515a81928faso4226945e87.1
        for <imx@lists.linux.dev>; Sun, 31 Mar 2024 13:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711916952; x=1712521752; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NWUO8Sy6JPSgwKkrutWi5HBoELv9lWKNmrIdWaVqOA=;
        b=Lwk1IKbtF6JlxzH4uC19j2wWvJwfXlzs2UnNWlfQmVbSI7Qo9GmsEkd+YoV+og+bA9
         po0XzYWwmkdReyi9WkqkR+6YsF5l0OiBZZbvyN9pn3wcB9gkGIrtal583U/yHBga/Qxr
         BElkimpwr919ZU6DEYzPdQWS3Gii/3rUWMntSB1DvlF4eUs2OnHrPPyndRQ5uETd5FL/
         T61yn6CQHWc3GY6q+j/r6rs4hfTfsOda95Eo9ia3PedVhbWh4VKOsHCQLNIL213l544h
         lR8tXmAwPUoY/lT0FkFke9E40MTIJyJqMMnWeWGLnkipw89X6rGXy9jbcRvUTEwdmNzC
         6lIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711916952; x=1712521752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NWUO8Sy6JPSgwKkrutWi5HBoELv9lWKNmrIdWaVqOA=;
        b=IdzG2rYVtJcyx0DZj63uqZOOOIaS2E5hBbZdZsVg+9yo3GkmOaqoXxGkvQsc9PbG1w
         9afhHt7V3YmVubZwzMwTzsEwHy88s4p3MXQa2Hqi8paNAiOaJD0AhVpXtEYSOggZE2P5
         1Rv3Xf2mFrc5IEjNg35TWH2b0Bi96dtomFAHmecrUJA9Y9DrTdkyUMjOHPPRMTdFFjZO
         dZjULrIMhR7uihRgqGDhPDDHXLqOlS4zd7qDo0CGK6bLjsR+6a7wiVndGOnTuTsc5ElY
         aD6WppjIaA7JZUJVF1w0+j1pSBPWIf7ucqdCHPe+xjSjz9Xo+Hl2tXsrXOlUAjdVDIUp
         aZbA==
X-Forwarded-Encrypted: i=1; AJvYcCUdfZNmZ+E/lhl7p+3OWxdn384jdYm3hWun+7a4oVjerZ2sT1t7jH8g7ULB8A8xUV8FEgsihSJe6Mjdq5fwBiJncWR0
X-Gm-Message-State: AOJu0YyrUOs5OqA52dhotKgJi262VlzBpikPg6LG0kb+hEqrGsLJPsbg
	0r/pgQn596R4MywLf1CI5ghHPVGCJqY1ceJ83KPV6OSQi0cTugbkitSso5vUA9w=
X-Google-Smtp-Source: AGHT+IF/gwVAQwbfxLT+LCIBhCaRg+FxT10/Jh8nnHOQd/9xJ4bySdg9cI4XUR3gXC85ea19gCneCg==
X-Received: by 2002:ac2:5eca:0:b0:513:da24:fc0b with SMTP id d10-20020ac25eca000000b00513da24fc0bmr5142760lfq.33.1711916952439;
        Sun, 31 Mar 2024 13:29:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 13:29:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:29:05 +0300
Subject: [PATCH v2 08/12] drm/imx: parallel-display: switch to
 drm_panel_bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-8-d81c1d1c1026@linaro.org>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
In-Reply-To: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
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
 bh=Pi9W5qgy4T7+J9hP9AVFepGfzI8GpfyO2Ku1B6h2Uks=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCceP58j4g6V4EltAY/XhET22h9ioI6gibKjLi
 hKvmJUXjKqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjwAKCRCLPIo+Aiko
 1fEiB/9T1bnL+hT0p34ArbfJieqfBkbDb+2ZxrhzWsW6faJ9TPDPbi2BzBS5OVUPiLcj9/oAVew
 /tn/sGqoEGOrF92bR61BAKbHftzP4+5SrFsr6Az/ZTxsw8hYvyNlf/YjqwX85Nl4wOhEnropG5o
 C9/wgT79YfIvzN+jlMN7yADPKHiBB9DiOXD40bvqfBbo1Upf9KyzvmFWAt2/wCTOSxdnYWiU0xv
 Wg0CMH8K4178p8BkPwC613/e3u/SjQ5p9KokbOBMozXM2iFmrq84hPXGrVFZm+Xx1aALV34Sd6k
 3TrVuFLbRtilldWxJFk6JBv6d0pyObAZDTv33enq71W6La0x
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
index 4d17fb96e77c..b7743b30475a 100644
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

