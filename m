Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7424E3B78D
	for <imx@lists.linux.dev>; Sun,  2 Jun 2024 12:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717329899; cv=none; b=rfQAAEUtNND4RcaRVuyzSKWYqG3IdOZtnzov0lTdlUfSwpb8OnTJFDXByIXACIH53iFFd8D1CsPJ0ZOAt3NKswZMdejgoCALRQ6XcvXN7eGveL8LyKblv2Tb+O1dGMw9eEo7/nyuux8lbvFW9MEqL6pYm2B6D0IWHuQIfjLYof8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717329899; c=relaxed/simple;
	bh=9THPTWDLEWz30Ibjsd2CQ6FkoAikde54Swf5aa2vQIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bjEXabct/QthZWIOXjEMdr5b1StitN/C9LSoLYk0Yp+bv/RxjfKdQaP/eRc5QFlXZbzOTPE5o9X9KdQm3NEhC0dAfYbwOXz7tZkC00GZ2R4vnSZeuFy4gIYblDZ6Pm0qqsoXIdDScHf8VF7JuABEbtIUvIqYd+FuJYgiwgPVa5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f3mY0BxC; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f3mY0BxC"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52b912198f1so1553569e87.0
        for <imx@lists.linux.dev>; Sun, 02 Jun 2024 05:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717329895; x=1717934695; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Psv1wSWeGLezc3EhvyN1NOaGwwYnkeJXu6K8/l6sJNc=;
        b=f3mY0BxCdmdcTR04jvbhZEjXoxVWLzWFHphMEy175LyWn2WDSBamHl41XZnORkpQ4I
         +Lv50i0bwbMfEO1tX9pjvZUyAJRTmNaWLUQJDiIkTUAJzyEyraIIF+5YyJK63oRL2LFx
         s1iE2woj5oSMqIGMH896Fnl1WaIZCx5SqtkbVu2eF/aABgxqVDQQpgbq91U/kofBCtLt
         kHxB64eVlyHp+gIgMDjwXZMHDPvLXH3GQ3Y0XFHGIQvruWEoStkOXVZm7PbyNFQviZay
         tXqXDpnunWDVn8vAg39m7Hc8QvpEo54BBD/u4IwwqCPi8GA5LCn8TtdfeFsnrLG+TYkR
         U5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717329895; x=1717934695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Psv1wSWeGLezc3EhvyN1NOaGwwYnkeJXu6K8/l6sJNc=;
        b=utS+v1n8AqJ7SmqmF2SAt2WsKXLPNPk8oE70Zz3439frodirh7OVsRCSSIxoOybIve
         Ga2ZBMbtH8yEeisdxuPfD4aeJn46mNcnJh7+jpyO+kN5jBdSkDndry1jGy8Q4kQI7P4q
         HHxrjE/UpsitqvlSGx79e5X+1mm5hK5wlyeRjj5QIU/i91i5X+SGNYOX30/nY2vgOaDT
         W5SULQlZbUToHsyuakM5E4/dOJxr2B626Z/rmFj10acUNYuErfL3M8lS2YoyDRvLoPTE
         wfy64Muj5o4+Qk5JWyQxuH+GJlA49gRGX/bxwG2ovC3IFJZS9HMb/dJlj4yU8/mGOHnU
         2rJg==
X-Forwarded-Encrypted: i=1; AJvYcCU/mnVgLfdiu22Xl36BMIcRz5w5J+XkZcGs0uwFxHwQCmkgS6LLiSj1y9NPO7yD1yTgBjXW13qvQ101FsIzCnDFQwY7
X-Gm-Message-State: AOJu0YyWIJcIM+1erAxeVKGcpA6eZszt0vfvdaGWGJPHLuEk6MMbEk+O
	8XFtazJP2mZG52w3UTO5DtC0DwkCvEBKSkqaBI+4QbYx9glk3eyrhhqkYBXQmEk8CvnWKYdldvB
	a
X-Google-Smtp-Source: AGHT+IGJ82B9sogYpCSNkw6KytA9AiqcQ8nb7GL9c08zIo2SpwP+zgiNfG/dGL4v7u4vt9Kh/PLfZA==
X-Received: by 2002:a05:6512:2009:b0:523:bbcd:ed5f with SMTP id 2adb3069b0e04-52b895a0b0fmr3610131e87.33.1717329894782;
        Sun, 02 Jun 2024 05:04:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 05:04:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:50 +0300
Subject: [PATCH v3 10/12] drm/imx: ldb: switch to imx_legacy_bridge /
 drm_bridge_connector
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-10-e549e2a43100@linaro.org>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6956;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9THPTWDLEWz30Ibjsd2CQ6FkoAikde54Swf5aa2vQIk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pM/N0L1a5drx688Gi2D3q2woVvi7uTdaTBu5QeIf2IL
 wvSvs7pZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEbhew/49dtK/eNoUjXP+s
 ttvZHzklXtkyG1Y32MkefHDQ3vH9G/f51oUypk9TVrzYp8NwLSf7kdB2pr1aGoe01k7mVP7pkLh
 J7ZTQQuvil5q1TW/NLrfrltw5PyPxQm7Errj/lVNmvQjUU28xeBGvwLHEudlEefPvJxsUTDe9a9
 7C/31nUfNN/9sn9tf2thwxyW7cXv+r6ZfdszubuiPqgueJrQ3Puc9g+UpARJdZ7cy7NG51i1uKn
 wwf3mhfmT15kZ97RU5rZMtB6TVaW77/dzxondxjXdiwb/s1Gytndd17/NEGE893x3VXhkfoP2A+
 WBFe5qjZwP6jWPlF95xbf1PC1ebG2btbczKoibQLbl8KAA==
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
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 103 ++++++++++--------------------------
 2 files changed, 30 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index f083d313d1d3..5a40c878ebb0 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -32,6 +32,7 @@ config DRM_IMX_LDB
 	select MFD_SYSCON
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
+	select DRM_IMX_LEGACY_BRIDGE
 	help
 	  Choose this to enable the internal LVDS Display Bridge (LDB)
 	  found on i.MX53 and i.MX6 processors.
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index bc7ad9697130..ff74018ac5cd 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -19,17 +19,16 @@
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 
-#include <video/of_display_timing.h>
-#include <video/of_videomode.h>
-
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/bridge/imx.h>
 
 #include "imx-drm.h"
 
@@ -53,7 +52,6 @@
 struct imx_ldb_channel;
 
 struct imx_ldb_encoder {
-	struct drm_connector connector;
 	struct drm_encoder encoder;
 	struct imx_ldb_channel *channel;
 };
@@ -67,17 +65,9 @@ struct imx_ldb_channel {
 
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
@@ -127,25 +117,6 @@ static void imx_ldb_ch_set_bus_format(struct imx_ldb_channel *imx_ldb_ch,
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
@@ -347,11 +318,12 @@ static int imx_ldb_encoder_atomic_check(struct drm_encoder *encoder,
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
@@ -371,18 +343,6 @@ static int imx_ldb_encoder_atomic_check(struct drm_encoder *encoder,
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
@@ -420,7 +380,6 @@ static int imx_ldb_register(struct drm_device *drm,
 		return PTR_ERR(ldb_encoder);
 
 	ldb_encoder->channel = imx_ldb_ch;
-	connector = &ldb_encoder->connector;
 	encoder = &ldb_encoder->encoder;
 
 	ret = imx_drm_encoder_parse_of(drm, encoder, imx_ldb_ch->child);
@@ -439,24 +398,16 @@ static int imx_ldb_register(struct drm_device *drm,
 
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
@@ -631,17 +582,7 @@ static int imx_ldb_probe(struct platform_device *pdev)
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
@@ -658,6 +599,20 @@ static int imx_ldb_probe(struct platform_device *pdev)
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

