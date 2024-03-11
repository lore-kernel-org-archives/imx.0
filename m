Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B3A3B794
	for <imx@lists.linux.dev>; Mon, 11 Mar 2024 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710156050; cv=none; b=UtXf9izmiiumdfQpp3LmFH46Bz8GCqddH9z7alS0UTj+Qoqm8ljl09RzTlVrhxRX32qdy29xSQBf3Ou13XIrHHSDt2blbSAmezAqpPRiSBPMlzZEDMqOZxQbsf76fFzQs2yFjkiSUHtFbRf91WBk0kCFE6z6SrKLk0FXuqbIiw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710156050; c=relaxed/simple;
	bh=mxqxcoV4ywHN4eRiFdbf9wh8Q/v6lSDoITt0+PUutvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yjt7n7q3kHFdhWj8PaUbdvmz6xDdnlYmGW8BJODi6WzEuD89YSxXAwPA7dn17ULLGD9pSz/41MjAoTCefdwuaWEO3CqE9geBcqK3sIuqPA4NzzzLuhT9Yu/5aqibsvVvCXEPqIAcyGBONGMibrLnb2pLAWr3G8LSoUSLZN7Lo5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v5GOh5Ve; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v5GOh5Ve"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d27184197cso54316531fa.1
        for <imx@lists.linux.dev>; Mon, 11 Mar 2024 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710156047; x=1710760847; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJK48DZXSr/5AkPi4/t7u5Zi6emJ5qg5sN5jW9/objc=;
        b=v5GOh5Ve+bCoFYrn4zlfFsRoLho6xQQHii58vMBhMBdA2DDbZIQN34hy3U+bMQ/imP
         gfpx+Lxk+BzCMaXqDiobPg6n3jbmRLLpHCbTMx/E8GFG9kbM5MqgIihltEDv4galT+DM
         s2trjr1+2Js11HrO5d1a1yZjcru6sESrEQO3tnXTuCQfreogPHtDDxKU4oHwFzcs4dRD
         enhSkPApjca4v0XE9TgqOMLSGIu5or4FVQXRgqSIW2AswKPOgRyE0ZMWJJkGoVjN4ecz
         C4CtIc8OJnn8cIEPs/5UzFL/pvcNm7an8GtyGhHMwLLgHmI/PSqIGZQqhi7Pp3IlNqWo
         2wFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710156047; x=1710760847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJK48DZXSr/5AkPi4/t7u5Zi6emJ5qg5sN5jW9/objc=;
        b=l2Rljl34S7OGhSciHWhpSnjnMIAdTtJB1gMgQvWlY8bFmDbrrr1WWonmvh8PQmFnEZ
         qWTCc7cqeFIFefCU/ce/lIYWHkkyUr/eIl+NcMbXD/obC1PbLMI0hgGG4uig6BsFkoL+
         yT9sSEEIylLMDgJ1cdv36/yjkwLYtwt0yld7Obi2jKVWewWCC00wZBDYEOUlFaRiXfPq
         Uljew6zP1bdC+r4JLqab9VgsH9VBojUzpnfbCgLXrFRSmjQtmXu90L52kgnTNgxaIucb
         j6DEZeAtTpXmTSiO3F1YUQUtpdWgXwQckBS+wmerVs0d0TY1+TwjDSua4A1VOteBjHal
         h2Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWTfUP63MSe6KVhanFn7sjyK1N+Hob9yjcaR3fsbPj11vRXUw4dyuP2uIC9GM/TbaJF+VXG7bl90q3RGkInaA3MJkYv
X-Gm-Message-State: AOJu0YxQCeUJ71vjUUNEYDzU2E6rEqVpYjA6bqfj1EI0pbEB9hCWadmH
	5sLMEhzkjzPoRX28kmrWfvN8PYC23snNP8LV4HK6e9Z4AjO8SDObjG5F1cxxEPQ=
X-Google-Smtp-Source: AGHT+IG1/i8rgtxmep3hUGXbRushzFp9Ad6WkRyc/SX1zThpevPnmWtOKvna1/sbAc57cyIU7ha73A==
X-Received: by 2002:a2e:9c9a:0:b0:2d2:6ed5:e45a with SMTP id x26-20020a2e9c9a000000b002d26ed5e45amr3497683lji.12.1710156047097;
        Mon, 11 Mar 2024 04:20:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:20:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:18 +0200
Subject: [PATCH 10/12] drm/imx: ldb: switch to imx_legacy_bridge /
 drm_bridge_connector
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-10-e104f05caa51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6822;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mxqxcoV4ywHN4eRiFdbf9wh8Q/v6lSDoITt0+PUutvI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukEbA1Mk28fKywnUCRBjFDy98932CZYFRLYg
 6ZPZqvOgBWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pBAAKCRCLPIo+Aiko
 1WAwCACB/ueqYnYQhWGKCt49o1RIVn4xuhow2xGa5GqhlntPVPDJ+hEwT7PqmHBY/VZhbwozIhr
 rvwmj/IIe2nh1cPtQ3t7sxdbyW/LQz8yx0SuI7xXZigMm/UrU+pQ3aPIYsuZ40vCQYL+nES4ZHN
 scISduv5glpkuKPLZvU0tQatrJs8KPjEbpMlahFeZz61c2HRuhhl696ARB04w2lb7x0fdSok75i
 4hArju0y9yqEhbGLQy+2zJcaQlZLJIM9Td+lArfYuShT2ORrdG/DDIyGkMEEu06KpqaLrE5jNfF
 sQS1tu1WfKKHdp7RY5RcOIZ52BOX6UsZY0BBb/npU/hPyvA2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use the imx_legacy bridge driver instead of handlign display modes via
the connector node.

All existing usecases already support attaching using
the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, while the imx_legacy bridge
doesn't support creating connector at all. Switch to
drm_bridge_connector at the same time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig   |   1 +
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 102 ++++++++++--------------------------
 2 files changed, 29 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index 119e1431177f..35518ecb1c6f 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -33,6 +33,7 @@ config DRM_IMX_LDB
 	depends on DRM_BRIDGE
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
+	select DRM_IMX_LEGACY_BRIDGE
 	help
 	  Choose this to enable the internal LVDS Display Bridge (LDB)
 	  found on i.MX53 and i.MX6 processors.
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 74b41a507219..b29253df40ec 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -19,12 +19,10 @@
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 
-#include <video/of_display_timing.h>
-#include <video/of_videomode.h>
-
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
@@ -54,7 +52,6 @@
 struct imx_ldb_channel;
 
 struct imx_ldb_encoder {
-	struct drm_connector connector;
 	struct drm_encoder encoder;
 	struct imx_ldb_channel *channel;
 };
@@ -68,17 +65,9 @@ struct imx_ldb_channel {
 
 	struct device_node *child;
 	int chno;
-	struct drm_display_mode mode;
-	int mode_valid;
 	u32 bus_format;
-	u32 bus_flags;
 };
 
-static inline struct imx_ldb_channel *con_to_imx_ldb_ch(struct drm_connector *c)
-{
-	return container_of(c, struct imx_ldb_encoder, connector)->channel;
-}
-
 static inline struct imx_ldb_channel *enc_to_imx_ldb_ch(struct drm_encoder *e)
 {
 	return container_of(e, struct imx_ldb_encoder, encoder)->channel;
@@ -128,25 +117,6 @@ static void imx_ldb_ch_set_bus_format(struct imx_ldb_channel *imx_ldb_ch,
 	}
 }
 
-static int imx_ldb_connector_get_modes(struct drm_connector *connector)
-{
-	struct imx_ldb_channel *imx_ldb_ch = con_to_imx_ldb_ch(connector);
-	int num_modes;
-
-	if (imx_ldb_ch->mode_valid) {
-		struct drm_display_mode *mode;
-
-		mode = drm_mode_duplicate(connector->dev, &imx_ldb_ch->mode);
-		if (!mode)
-			return -EINVAL;
-		mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-		drm_mode_probed_add(connector, mode);
-		num_modes++;
-	}
-
-	return num_modes;
-}
-
 static void imx_ldb_set_clock(struct imx_ldb *ldb, int mux, int chno,
 		unsigned long serial_clk, unsigned long di_clk)
 {
@@ -348,11 +318,12 @@ static int imx_ldb_encoder_atomic_check(struct drm_encoder *encoder,
 	/* Bus format description in DT overrides connector display info. */
 	if (!bus_format && di->num_bus_formats) {
 		bus_format = di->bus_formats[0];
-		imx_crtc_state->bus_flags = di->bus_flags;
 	} else {
 		bus_format = imx_ldb_ch->bus_format;
-		imx_crtc_state->bus_flags = imx_ldb_ch->bus_flags;
 	}
+
+	imx_crtc_state->bus_flags = di->bus_flags;
+
 	switch (bus_format) {
 	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
 		imx_crtc_state->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
@@ -372,18 +343,6 @@ static int imx_ldb_encoder_atomic_check(struct drm_encoder *encoder,
 }
 
 
-static const struct drm_connector_funcs imx_ldb_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = imx_drm_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static const struct drm_connector_helper_funcs imx_ldb_connector_helper_funcs = {
-	.get_modes = imx_ldb_connector_get_modes,
-};
-
 static const struct drm_encoder_helper_funcs imx_ldb_encoder_helper_funcs = {
 	.atomic_mode_set = imx_ldb_encoder_atomic_mode_set,
 	.enable = imx_ldb_encoder_enable,
@@ -421,7 +380,6 @@ static int imx_ldb_register(struct drm_device *drm,
 		return PTR_ERR(ldb_encoder);
 
 	ldb_encoder->channel = imx_ldb_ch;
-	connector = &ldb_encoder->connector;
 	encoder = &ldb_encoder->encoder;
 
 	ret = imx_drm_encoder_parse_of(drm, encoder, imx_ldb_ch->child);
@@ -440,24 +398,16 @@ static int imx_ldb_register(struct drm_device *drm,
 
 	drm_encoder_helper_add(encoder, &imx_ldb_encoder_helper_funcs);
 
-	if (imx_ldb_ch->bridge) {
-		ret = drm_bridge_attach(encoder, imx_ldb_ch->bridge, NULL, 0);
-		if (ret)
-			return ret;
-	} else {
-		/*
-		 * We want to add the connector whenever there is no bridge
-		 * that brings its own, not only when there is a panel. For
-		 * historical reasons, the ldb driver can also work without
-		 * a panel.
-		 */
-		drm_connector_helper_add(connector,
-					 &imx_ldb_connector_helper_funcs);
-		drm_connector_init(drm, connector,
-				   &imx_ldb_connector_funcs,
-				   DRM_MODE_CONNECTOR_LVDS);
-		drm_connector_attach_encoder(connector, encoder);
-	}
+	ret = drm_bridge_attach(encoder, imx_ldb_ch->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		return ret;
+
+	connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(connector))
+		return PTR_ERR(connector);
+
+	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
 }
@@ -632,17 +582,7 @@ static int imx_ldb_probe(struct platform_device *pdev)
 			ret = PTR_ERR(channel->bridge);
 			if (ret != -ENODEV)
 				goto free_child;
-
 			channel->bridge = NULL;
-
-			ret = of_get_drm_display_mode(child,
-						      &channel->mode,
-						      &channel->bus_flags,
-						      OF_USE_NATIVE_MODE);
-			if (ret)
-				goto free_child;
-
-			channel->mode_valid = 1;
 		}
 
 		bus_format = of_get_bus_format(dev, child);
@@ -659,6 +599,20 @@ static int imx_ldb_probe(struct platform_device *pdev)
 			goto free_child;
 		}
 		channel->bus_format = bus_format;
+
+		/*
+		 * legacy bridge doesn't handle bus_format, so create it after
+		 * checking the bus_format property.
+		 */
+		if (!channel->bridge) {
+			channel->bridge = devm_imx_drm_legacy_bridge(dev, child,
+								     DRM_MODE_CONNECTOR_LVDS);
+			if (IS_ERR(channel->bridge)) {
+				ret = PTR_ERR(channel->bridge);
+				goto free_child;
+			}
+		}
+
 		channel->child = child;
 	}
 

-- 
2.39.2

