Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791C71E52C
	for <imx@lists.linux.dev>; Sun,  2 Jun 2024 12:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717329895; cv=none; b=NBAj5hxSHbABF/4nZi5klbDVkNRlB+WGT35NTO2Fc1M80j8dIjvrtx4qzjmFlwgClm9M2dtxsxdPIGzWaV0COohPWmixgIk1t34WEgLJyaNtq1nZl78Jy3p/7O5ra0/SdUaZ+owePjQsAKD3YkIU2KyKjm3uvPCaYkKcRe+45PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717329895; c=relaxed/simple;
	bh=OpWhxY1X8SkMml69I2Dn6lgdN1AEsg7Y8hzUgxz6Gx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dex2jRGb5Qu2B/V6hfcG5A9jq8dIm3DwSJr08up2Hea4l8OzqI7E6Z1Z6MnwqhQ+1fulNFl2pLEf6ZFQrGMAC//WwBeuCa45a16rfs1z+JGwV9b8y2kpSNv8u2FfsfSaDt4SDWat7aEPf42PtycH1com8C2kShAGlx2lC36+IqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ffN6NMYy; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ffN6NMYy"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eaa80cb573so7536261fa.1
        for <imx@lists.linux.dev>; Sun, 02 Jun 2024 05:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717329891; x=1717934691; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3z71OOWoNWZE+/hRN9KTPkL2PegZfYXg/orVwPR8kc=;
        b=ffN6NMYyH7mh7Ftx6ljIxw/WN4F9UTsfpMrPolz9W5hHZrYzDZ5wJnnJ3+cUeHcu07
         MwP5PpAmFECpNvlUv/Aw0XA46Fj+y2petg0+QkENOS+3ZA7x6K9/7e9zMgY1lBjWSO8T
         tIb3OyhjHspEH+RvzxMaDBisHIurTBQugOhXEzIZIYWKsOEdIXl0xA4NiPP8Bvx74lBW
         ma4GaYCVO0MI9oWVLEwfvh9vEOP/1xPbT9EorCeNbj7QzgyFLUp4M3Y0YS4rmsam9LrD
         JpDWW30y5o3vchceFMTRBU0UYUcJKjc4igsLLiDXQo0rbLmQ8xpat2KR6Gjjch3i5K93
         S6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717329891; x=1717934691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3z71OOWoNWZE+/hRN9KTPkL2PegZfYXg/orVwPR8kc=;
        b=lNGm6v4rrcUICFIx8edVkFx7jmW8+TPuWfhRVYg7m2Hc8hiNhVUfHHBzC6d6Qhpmqg
         pf32q3GqN6e1aZqNRelesOhR4u6D14cHSL8kE2ViPb6qMuPKv4r0mtPM2xXkwY7OMg8S
         cxdwShkZIH1YTltpX37iDGqg9+ispHwTz0rPEjxXOj/R25mk1MbJw3CPm1vEpAdGSRIN
         zdkuGwtMknhSYVkZdnl+xqC/S77gMPWs3u5ZqvafzgPZbtzILkVt6BtQBlVhdQD3B9a+
         D7cPp/0LkgTE3rFGEwRCQEAehkc5ElP3sIbXSmfYVdVxtNgP2+M04JL1rLMxhk9A3uo3
         phbA==
X-Forwarded-Encrypted: i=1; AJvYcCVHlBKW2pPsMX0LJmzrrAxadqJwcfjdOj6tsNCv2waYAc7ObtXSswV94L6QN3cyaVWPDvngpAiRcq403Bt5HTn7S8Ts
X-Gm-Message-State: AOJu0YzZOxCLjW4wvHnGFvyz1s95KBLhO/bjwdret8HuTbLcH9Rzq2P7
	0y7TIEhxGaWLbWOYYp+WRmPSlVQihV5CVA+JNZy8fbjA1Szfr5rw2W2Mp9Aghic=
X-Google-Smtp-Source: AGHT+IEU1T1JPwAyrMO5IbBAXktjwF9BMNKR9KPMqWrnmSSf9vVuZkPir8wiF0D+duaCctX822ai1w==
X-Received: by 2002:a05:6512:b24:b0:523:8cd3:42cb with SMTP id 2adb3069b0e04-52b8957ff7cmr4204463e87.7.1717329891515;
        Sun, 02 Jun 2024 05:04:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 05:04:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:46 +0300
Subject: [PATCH v3 06/12] drm/imx: ldb: drop custom DDC bus support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-6-e549e2a43100@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OpWhxY1X8SkMml69I2Dn6lgdN1AEsg7Y8hzUgxz6Gx0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXF/dvzraZ7ctB4FChev2m27M7qCFXal54iU0h
 YugcsfUMBiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxf3QAKCRCLPIo+Aiko
 1dQHCACQB3JwnhGjzPIYoevRPyg+W/8rjb+b4FiGCX+8kr4tglyyDGDSnXk3TUYYOIH6n2zC0RH
 LkkwktFI2o9qKaRhqVxLe27I7goSpmnC0mPwKCoOFj5OumAxioG+Yr/QDUsuwsmw3h+NMODYwEo
 gmIxHDx3DQ4M9HKdiMgLzoAyK5qOluYntgRSjeFQnYW0ailrYrcufrco7bdLl67alAiN6AcvNJ7
 FH0eg2FEpb6RdAavpMCIYXfAZHZ0Ti6Y2ssjWXo4cjxcXsFg9Oo5IV1O1QLU8AE+DWuX+LkrtWi
 7eO+NGUo1rAm68FAuK5z66cLuVS1LQTHEFw8cuoOfgtEKfAz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

None of the boards ever supported by the upstream kernel used the custom
DDC bus support with the LDB connector. If a need arises to do so, one
should use panel-simple and its DDC bus code. Drop ddc-i2c-bus support
from the imx-ldb driver.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 73 +++++--------------------------------
 1 file changed, 10 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 1924d8921c62..3f669604377e 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -25,7 +25,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -70,7 +69,6 @@ struct imx_ldb_channel {
 	struct drm_bridge *bridge;
 
 	struct device_node *child;
-	struct i2c_adapter *ddc;
 	int chno;
 	struct drm_display_mode mode;
 	int mode_valid;
@@ -141,18 +139,6 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 	if (num_modes > 0)
 		return num_modes;
 
-	if (imx_ldb_ch->ddc) {
-		const struct drm_edid *edid = drm_edid_read_ddc(connector,
-								imx_ldb_ch->ddc);
-
-		if (edid) {
-			drm_edid_connector_update(connector, edid);
-			drm_edid_free(edid);
-
-			return drm_edid_connector_add_modes(connector);
-		}
-	}
-
 	if (imx_ldb_ch->mode_valid) {
 		struct drm_display_mode *mode;
 
@@ -481,10 +467,9 @@ static int imx_ldb_register(struct drm_device *drm,
 		 */
 		drm_connector_helper_add(connector,
 					 &imx_ldb_connector_helper_funcs);
-		drm_connector_init_with_ddc(drm, connector,
-					    &imx_ldb_connector_funcs,
-					    DRM_MODE_CONNECTOR_LVDS,
-					    imx_ldb_ch->ddc);
+		drm_connector_init(drm, connector,
+				   &imx_ldb_connector_funcs,
+				   DRM_MODE_CONNECTOR_LVDS);
 		drm_connector_attach_encoder(connector, encoder);
 	}
 
@@ -551,39 +536,6 @@ static const struct of_device_id imx_ldb_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, imx_ldb_dt_ids);
 
-static int imx_ldb_panel_ddc(struct device *dev,
-		struct imx_ldb_channel *channel, struct device_node *child)
-{
-	struct device_node *ddc_node;
-	int ret;
-
-	ddc_node = of_parse_phandle(child, "ddc-i2c-bus", 0);
-	if (ddc_node) {
-		channel->ddc = of_find_i2c_adapter_by_node(ddc_node);
-		of_node_put(ddc_node);
-		if (!channel->ddc) {
-			dev_warn(dev, "failed to get ddc i2c adapter\n");
-			return -EPROBE_DEFER;
-		}
-	}
-
-	if (!channel->ddc) {
-		/* if no DDC available, fallback to hardcoded EDID */
-		dev_dbg(dev, "no ddc available\n");
-
-		if (!channel->panel) {
-			/* fallback to display-timings node */
-			ret = of_get_drm_display_mode(child,
-						      &channel->mode,
-						      &channel->bus_flags,
-						      OF_USE_NATIVE_MODE);
-			if (!ret)
-				channel->mode_valid = 1;
-		}
-	}
-	return 0;
-}
-
 static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
@@ -694,11 +646,15 @@ static int imx_ldb_probe(struct platform_device *pdev)
 		if (ret && ret != -ENODEV)
 			goto free_child;
 
-		/* panel ddc only if there is no bridge */
-		if (!channel->bridge) {
-			ret = imx_ldb_panel_ddc(dev, channel, child);
+		if (!channel->bridge && !channel->panel) {
+			ret = of_get_drm_display_mode(child,
+						      &channel->mode,
+						      &channel->bus_flags,
+						      OF_USE_NATIVE_MODE);
 			if (ret)
 				goto free_child;
+
+			channel->mode_valid = 1;
 		}
 
 		bus_format = of_get_bus_format(dev, child);
@@ -732,15 +688,6 @@ static int imx_ldb_probe(struct platform_device *pdev)
 
 static void imx_ldb_remove(struct platform_device *pdev)
 {
-	struct imx_ldb *imx_ldb = platform_get_drvdata(pdev);
-	int i;
-
-	for (i = 0; i < 2; i++) {
-		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
-
-		i2c_put_adapter(channel->ddc);
-	}
-
 	component_del(&pdev->dev, &imx_ldb_ops);
 }
 

-- 
2.39.2

