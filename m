Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4651482E7
	for <imx@lists.linux.dev>; Sun, 31 Mar 2024 20:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711916955; cv=none; b=AfMdBoedy3MW1KEuRcLQqf8X9y69v9mWYzZEUKNwaZ0049M0xCVAe2YyyQyyfTBDO1EFWzuS+IvShaHM3j1pijPE3yveGGZUsx06ZZ0RjciwIgFOtFnV3jewt4oqDdUoQ/b36+NznCF+UMt5Flh+92c1M81oM9w37eyHkpwNX48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711916955; c=relaxed/simple;
	bh=tuqhthD0wjId065PEfgLTntUyAjkA53+U+9j/aDpxnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYhQ2q+DiGPHISk56pwMEyEWwRP1jYbBCxLSGdH4tucqIpHYzQrYSCNErvvHPQlc+5Yf9SUHKdp9gQFYKK0RqIFo+sVm9bANvHPF+EM0AlryAXdAqo0/cyqIf3X/jbWuoY3+H7NFAZRQRKzvpH2XaMC4YEWBkn8jqDW/TNDn8OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nUNc4U+P; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nUNc4U+P"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-515d55aaf5aso1029181e87.3
        for <imx@lists.linux.dev>; Sun, 31 Mar 2024 13:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711916951; x=1712521751; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQrqHaLGIND2BZg43nPVGmV36Lb8S+V9//5yRGyhuc4=;
        b=nUNc4U+Ppr38M+ZIpCDFm9EN0QbytYe3vZ4DqkF9+czqcC1wTa8WEL/O8WbMkwZ3//
         UEzwOg/NNUPFfOXtH5+mWDYV1xH1HYLhCqSV73qIxOPvw0OpbR3cYkCTCkrxZRNcTY4h
         1+MsojaWcdYdTiUfAOxiDPgpHeVMpgzSGA0hm+1+MYUj+M618bxWcmu6vXvPEeCTQiyN
         RkOS5HJzXRNCcDo6tQv6cKU4QKthGmJ/X0YwQ8r0JyvU/RmeoNUcyHdHLSG5HU1x35C9
         zU1zFEuuFaEyUc5l/mQcDFBVeQe8t13XKxkYsDJtJAG22PzQhSCHSAwyqzclQt0sNKid
         nF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711916951; x=1712521751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQrqHaLGIND2BZg43nPVGmV36Lb8S+V9//5yRGyhuc4=;
        b=eOFhEKIcwkrF2sm9urel3BUJH7bfBiByp1GLbIv40pVzQnN+zC1erlAMmJvOkKJawk
         OBWZn9duo3L7Mg71uHn6b8j+Vvkb/UjVaRQujDMIU6i0X+pctrEc1Kng8raG5p8P/ZQC
         865FoXImNQV9o1Fff9F71Gj9vZx6g5JOyaQsE1EIMz0Tj1RununSFsyQNpUC26f0TCD+
         CKDGxKx3DkIA5sPB50PtBNzew98tYqTBaTNo/tFkUiuQFuCiHXldrTigUhw2Btn90q/c
         WHKaeqDWIGP1ricpcfSsywPcW0/jqfGaI6/UHFLrB6rbMjr4cSJjUI8dRxg1pVnzNWtp
         e+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVn4kiQhaeVW3CKtp5HRm8tsgh5D5g0sBxe5DmOFwiHg5dIAtMGiKJcoX3txcd67iTPOvTbozKOwsZBIaBSSojTBA2Q
X-Gm-Message-State: AOJu0Yyox7vHcFeSLV2DOhN+V7MLyeNTnmADq25Ves1VJ9/3zzMnes40
	yQWSW0tUw4eYvcg9CLAuoi2LbQsDispjLEi+hxcVdBGzTBGYQd/lYy6H2SeYCHI=
X-Google-Smtp-Source: AGHT+IHZNFdB+w9oA8iYXNkzEeRTXt8zG0fBDfgfV65ywZXBtAV3nCgeam9/v6yOR4pyFiyWnAJI5w==
X-Received: by 2002:ac2:5d71:0:b0:513:c9ca:1333 with SMTP id h17-20020ac25d71000000b00513c9ca1333mr4717198lft.22.1711916951660;
        Sun, 31 Mar 2024 13:29:11 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 13:29:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:29:04 +0300
Subject: [PATCH v2 07/12] drm/imx: ldb: switch to drm_panel_bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-7-d81c1d1c1026@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4608;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tuqhthD0wjId065PEfgLTntUyAjkA53+U+9j/aDpxnU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxrn8f7H+6tj33apnt/0L1MhgCHDR3ON7c4f6uf0krauW
 m/qYJTcyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJBN9h/2cqLFQ1J7K8OK58
 dnlS8fKZPrrHFofLJBdzBu+wVDghqLdnd622otx3F+73Wxp6ZkisZFdYuv2Xmc7hePNZ82ZG7NJ
 awV7jdEhuwfmL33bczzLWdGoVfZipfE44a2Zswa4g3VU29k8mTNH6kc49MaRrm8CBGVpPCp2DNl
 1eVM7iWawzpVyEYSXjGsPAycaZgr/FKrT8Hz1U54n/KBxareI027z9CN+0+cdibwiK/Yz4e2DaD
 hZ18avVy2f0W6umHE26I81lmaTbFGi/bp7khSj3MPb+D84hXRFXMi3n7luhVdZ1cp9mzvbfQm7M
 mXY5ua/PfZtaz7Er7d35imPujadDZr+Yxnx0/5Psw/m/AQ==
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

