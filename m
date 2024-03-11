Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505723A1BE
	for <imx@lists.linux.dev>; Mon, 11 Mar 2024 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710156048; cv=none; b=l1uBuOqKPX44fkc16jWSyVAFLthDnUNKC5aHjDzyU0DCo2D/g/BIgp0nsOL6eeindywljiRsdU5IweLKZXBGe3TiN8XBJw6lwd0Q4KpfU4Bs8b9PZnXzhgGxAEwz9lpUgRqih+99BB4w4CdttXZ+R+2WdeJA5co6YN82ZmT0Yn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710156048; c=relaxed/simple;
	bh=tuqhthD0wjId065PEfgLTntUyAjkA53+U+9j/aDpxnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7xRqXF5/J17aG0U8jbbfHfOjE5BTVSsjVcLkrjSVjOlYV50om/XyfPpLdUQUbDUqBuph/ymq9FnwarN+Hprl1I4vWqIyTyU1Vi8UCyASpR1oTDyXNhQw9lrqWCYqYN+emscu27XaT8ersvoulqN0VRHh3sWjH71Kmv1mfS++tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QgfY6Oeq; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QgfY6Oeq"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d309a23d76so45160711fa.1
        for <imx@lists.linux.dev>; Mon, 11 Mar 2024 04:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710156044; x=1710760844; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQrqHaLGIND2BZg43nPVGmV36Lb8S+V9//5yRGyhuc4=;
        b=QgfY6Oeq5/jaTspymCXzJRXVcKi19Qr+U5XkwyU61+9DZIdg5kW6wrcH6kmxdpN4xQ
         Gut1L1hWLIlxIibTKQ+kMxqy7Hi+IbmX8M4x4XENU1REo1HmneyZEcTmZ9dP2rmFB05y
         h95S+4+uTuP5P7tqXdBB4VonBx+zPXRTiWCG3lwSfg8iq1S5hAKRpv5CknJgYdwQJz1o
         UvZR9kC2n+mgKLxfWrBUuwOxfiiG6KVfUWlomduuqEjA57fLBi2T2zeH8oFguQzu/m6o
         RQ5YDVrgBMLQcV5DiGDJolwUhIvjJg7Xyjdf0C4nPscdHleN3hVqgvUHtjB1BCu4hzPL
         npnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710156044; x=1710760844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQrqHaLGIND2BZg43nPVGmV36Lb8S+V9//5yRGyhuc4=;
        b=usjWIPMgnZR8KCDJDwm3fz3ZwnLwCufNMUC+QMgwqPhqQUfa7cR+BR58jAQF1lTAuX
         DJLpGJ/62dxjKDZ6Q8/7doVNiwO1x0i1N4Qw2dunRWyr/sD+nJPGRuxcmu67Jk7X5wkN
         5TPsXhvwFjJOQdGpWPbLmqsMLGvWaumFUb5qC7hJ8dOYgRO/3kzDctdEUT658w6OMko/
         61m6UQTd5ioNCzYugNxzCrs+6ozqIPkpCWMmYpzJdlK3wWpud2sXb4DkYFLm3GkfcY8X
         9nNkOGYk3IU+nDGh4QsgJOa8Gq5MGyZ/QKX27cVWC01Ytb0G1FvfzdpV6bM9gtylQw3I
         /lDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6J2uPXCIB8zAl4vbk5fpTOVZvZx/ut8boUhYOv2wA1WBsC6bqObeH/Z7S5RTk6bD1t9b7nTCbja5k/uwnnT2w8AEo
X-Gm-Message-State: AOJu0YwkOR3IhAC9xufrkdbVLuy6BXaLw11wGKsi4ymRAvr9WOLu72zl
	CfceMBFuSJp1sopu77gNvVrhSkqp5szZsNLlH/fdUuFEpVd6eD7IAOSINEQdoTw=
X-Google-Smtp-Source: AGHT+IH6UahIcH0xokwgC7YJw7isfzx6l8sVfamAGKfOqjY8LOUzxiZzIWKs2Nzu6jrVlAhbY6hHJA==
X-Received: by 2002:a2e:9c06:0:b0:2d2:31a8:cb1a with SMTP id s6-20020a2e9c06000000b002d231a8cb1amr1858765lji.13.1710156044598;
        Mon, 11 Mar 2024 04:20:44 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:20:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:15 +0200
Subject: [PATCH 07/12] drm/imx: ldb: switch to drm_panel_bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-7-e104f05caa51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4608;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tuqhthD0wjId065PEfgLTntUyAjkA53+U+9j/aDpxnU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukEmhT2g9v70pVpRjRRLZO32HM8uH873G4o0
 jbzBvbpyEaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pBAAKCRCLPIo+Aiko
 1TO3CACoX3ore58uBQubmaeZX8paIziCF9nJNUNQw1M6qI4YJt24XMx4KTE1rP1N0ERtW36OhF3
 JSPEZKvuvF4Vad7qPhkOIWVvnfLdAlPnTBzXpq/i16Sck8cKpYiLrcyw1O+VaCYJV4ji2ZW+2Pm
 UNfneiaArfU7I/wp/kCJuFGuesJH/CRIi9VYoOshitCjE29rsGcRHqJ/7o1xD0bgLYavkxqlELb
 xnbA6U+X86xaFV5p7Rui1hs/qiUWrkEo9wAIBl/OWPQ8IbIds40CJaZ/+uGiBvfR1SJUVFUhkLp
 8EAuK7OnT8wCfWs3qqOtdU8v98W20yDUBiU5CLcly6Y8uTcu
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Defer panel handling to drm_panel_bridge, unifying codepaths for the
panel and bridge cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig   |  2 ++
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 44 ++++++++++++-------------------------
 2 files changed, 16 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index bacf0655ebaf..4e41611c8532 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -28,7 +28,9 @@ config DRM_IMX_LDB
 	tristate "Support for LVDS displays"
 	depends on DRM_IMX && MFD_SYSCON
 	depends on COMMON_CLK
+	depends on DRM_BRIDGE
 	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  Choose this to enable the internal LVDS Display Bridge (LDB)
 	  found on i.MX53 and i.MX6 processors.
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 380edc1c4507..74b41a507219 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -28,7 +28,6 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -65,8 +64,6 @@ struct imx_ldb;
 struct imx_ldb_channel {
 	struct imx_ldb *ldb;
 
-	/* Defines what is connected to the ldb, only one at a time */
-	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 
 	struct device_node *child;
@@ -136,10 +133,6 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 	struct imx_ldb_channel *imx_ldb_ch = con_to_imx_ldb_ch(connector);
 	int num_modes;
 
-	num_modes = drm_panel_get_modes(imx_ldb_ch->panel, connector);
-	if (num_modes > 0)
-		return num_modes;
-
 	if (imx_ldb_ch->mode_valid) {
 		struct drm_display_mode *mode;
 
@@ -194,8 +187,6 @@ static void imx_ldb_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
-	drm_panel_prepare(imx_ldb_ch->panel);
-
 	if (dual) {
 		clk_set_parent(ldb->clk_sel[mux], ldb->clk[0]);
 		clk_set_parent(ldb->clk_sel[mux], ldb->clk[1]);
@@ -234,8 +225,6 @@ static void imx_ldb_encoder_enable(struct drm_encoder *encoder)
 	}
 
 	regmap_write(ldb->regmap, IOMUXC_GPR2, ldb->ldb_ctrl);
-
-	drm_panel_enable(imx_ldb_ch->panel);
 }
 
 static void
@@ -312,8 +301,6 @@ static void imx_ldb_encoder_disable(struct drm_encoder *encoder)
 	int dual = ldb->ldb_ctrl & LDB_SPLIT_MODE_EN;
 	int mux, ret;
 
-	drm_panel_disable(imx_ldb_ch->panel);
-
 	if (imx_ldb_ch == &ldb->channel[0] || dual)
 		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
 	if (imx_ldb_ch == &ldb->channel[1] || dual)
@@ -347,8 +334,6 @@ static void imx_ldb_encoder_disable(struct drm_encoder *encoder)
 		dev_err(ldb->dev,
 			"unable to set di%d parent clock to original parent\n",
 			mux);
-
-	drm_panel_unprepare(imx_ldb_ch->panel);
 }
 
 static int imx_ldb_encoder_atomic_check(struct drm_encoder *encoder,
@@ -641,13 +626,15 @@ static int imx_ldb_probe(struct platform_device *pdev)
 		 * The output port is port@4 with an external 4-port mux or
 		 * port@2 with the internal 2-port mux.
 		 */
-		ret = drm_of_find_panel_or_bridge(child,
-						  imx_ldb->lvds_mux ? 4 : 2, 0,
-						  &channel->panel, &channel->bridge);
-		if (ret && ret != -ENODEV)
-			goto free_child;
+		channel->bridge = devm_drm_of_get_bridge(dev, child,
+						imx_ldb->lvds_mux ? 4 : 2, 0);
+		if (IS_ERR(channel->bridge)) {
+			ret = PTR_ERR(channel->bridge);
+			if (ret != -ENODEV)
+				goto free_child;
+
+			channel->bridge = NULL;
 
-		if (!channel->bridge && !channel->panel) {
 			ret = of_get_drm_display_mode(child,
 						      &channel->mode,
 						      &channel->bus_flags,
@@ -659,15 +646,12 @@ static int imx_ldb_probe(struct platform_device *pdev)
 		}
 
 		bus_format = of_get_bus_format(dev, child);
-		if (bus_format == -EINVAL) {
-			/*
-			 * If no bus format was specified in the device tree,
-			 * we can still get it from the connected panel later.
-			 */
-			if (channel->panel && channel->panel->funcs &&
-			    channel->panel->funcs->get_modes)
-				bus_format = 0;
-		}
+		/*
+		 * If no bus format was specified in the device tree,
+		 * we can still get it from the connected panel later.
+		 */
+		if (bus_format == -EINVAL && channel->bridge)
+			bus_format = 0;
 		if (bus_format < 0) {
 			dev_err(dev, "could not determine data mapping: %d\n",
 				bus_format);

-- 
2.39.2

