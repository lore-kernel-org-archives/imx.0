Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74EB1487D3
	for <imx@lists.linux.dev>; Sun, 31 Mar 2024 20:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711916953; cv=none; b=SPDN5vnqGyGYqzjJMjWFeS4G1LdJVew3OxGDNN4NA9VRxVoxEuaiPDtuFqnvbGxPPotU5cun3BtA3Q2JV/nf2aP0bJrrB5w2stV9TJsCTdwxs4zkoCRBUsdqPNm2oGN9sVdVL6+KNtbNF6ajMBQGhloz7QlDVSs6uHnC4tsISKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711916953; c=relaxed/simple;
	bh=Q3tsX2NxDW1TnkNSTRHZJWIJp8sJ+Hj1Kz/G4qOQ9+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W3rcAz+WMwVA5NEk1hl8DwdI53eEdxgUA7Mio3ovzkV8Br2sNaIEmwWtS1UEpq6G7fjI5FnD6IurImfBiOMi2VDolRzVx/EBSvNUdm2hV66Pnj76Gx14ZIcNCfVfz1dBOgjom3661upXzrkHaIJDXFgPtpbAMHNQeY86fvpqLJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oU6TTqvX; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oU6TTqvX"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-515c198e835so3855837e87.3
        for <imx@lists.linux.dev>; Sun, 31 Mar 2024 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711916949; x=1712521749; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KzzvmMhfp7akZBSkslfuhmya0L5lQxB1AJ+Wft0o54=;
        b=oU6TTqvXPqGRgjIYDSAoYVrPBeaetWDDftn/2Q5n3CXkrWYlj9e4dCzJ0lrZbLQ27I
         sqeZoU7aBiAT86qOnKbJs8PsEbPdpF9GlmLzMZ8vgIhharBnZlzqyjQw0KlKQKCX8kTj
         56bSKKG92a4qT28GrRd0/U97bcEKH/0nUKPNqww/7Ah/XF2Tx+bcJ/v5xBLuFAqHZxpy
         CKG5gWLqVezvnD4ItPoHw3Ckg4E0YTk3PfdMo4QSEqelioiCm6wGdgbPBHEPWgwkY6V6
         VOAygmQL8xASk/iAkN+MlWUtYOQrVkVc4w5h3PGBxV2aF/piX9Q2cqJ9nIHfECGF8ClF
         2+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711916949; x=1712521749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KzzvmMhfp7akZBSkslfuhmya0L5lQxB1AJ+Wft0o54=;
        b=nAe4tPsMFD8+K72uQCBUKJdK64z7B55Pwx5LvS0zMQTNQYBYp5rR1+CoJsmX2hRXId
         iCVf3KniBpvhm1Tg2QvNqg440lxMV9deAfnxmkKUlkSwHx3jNw/i6EDhsQidjwcaTK3y
         ux0Gyk2Pd1blsFJYqt/EPF153mqtJliaO6cHXoj6qZ7qQBKAVMaRmurZzggXdqFiCPKw
         adClkeJzQQPSc6cuoPNEi5434asrcch3nkftFzzeQgVVPEtrnGoombNEvKuYMGSB6n+8
         qoTBDiNIlh9h/pJ35BQolcbvXhHDev4d2Ea0BRGN81nuXE6X70hdzrjQmaaZNrM5mkV+
         a/MA==
X-Forwarded-Encrypted: i=1; AJvYcCVmChZrrY3W+oYULuo5QTkIMyuW3YAw9JcFcLTO4o9aPeLtdlIvCrYQD+B62/7uZR7BILe4DnTwKqVKgbkTb895oXyY
X-Gm-Message-State: AOJu0YxaNffK2BeQ4xKdpJcG1X/8PgsEHDk3rt0KKE3HwtBrtzIeWrV8
	ntoJSLnuj5lGiWlN7/idFxDs3tAYq8FCSt/gHNlCqMt8w/9WoTcfQQPmUlVIq+I=
X-Google-Smtp-Source: AGHT+IFlkJbTHllJhmxuQLe8rza7jxEC5/tq80FTXBgl9MrRzWWrHRQfdLsjPQ9eVX4jnPTBNpNLUg==
X-Received: by 2002:a19:6a10:0:b0:513:aef9:5401 with SMTP id u16-20020a196a10000000b00513aef95401mr5436071lfu.66.1711916949484;
        Sun, 31 Mar 2024 13:29:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 13:29:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:29:01 +0300
Subject: [PATCH v2 04/12] drm/imx: parallel-display: drop edid override
 support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-4-d81c1d1c1026@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Q3tsX2NxDW1TnkNSTRHZJWIJp8sJ+Hj1Kz/G4qOQ9+Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCcePmSKVxsfb2BiMoKNsmfnhrGb3P7osuWj7O
 9DlQcsEYQuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjwAKCRCLPIo+Aiko
 1Qq2CACzcRHGJvXSJ7Ml0+GAsmRZ4aF7aq9y0LhhBKlCwrSYCrgMog440nF/nbZUYZiK8u/syu7
 X7M9jd37lBHflsClDpkrCAJAFgL8Hy1OrsgnkPfJcJGNqR/ReWQeiIw+nvjFjw82vTwVdbH0g2L
 v+7eIkFQJRCLM73SR0E0NEkn/asUVzqJH4GCtRJGk795BuD5Yh/al4Noqb7JNS6+/5o79bnEYqF
 YcexNCg3EklMvns+D8cGpuavkOoPp87gn18lL6wGJCeewjR8Z6Y4Cv97kxpChprIzs3uAK+XbJL
 Ueb7+4iT2BBwCcNThuXHvZBvxBNr3Z+G/ZsWs8lNmtlT6Czi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

None of the in-kernel DT files ever used edid override with the
fsl-imx-drm driver. In case the EDID needs to be specified manually, DRM
core allows one to either override it via the debugfs or to load it via
request_firmware by using DRM_LOAD_EDID_FIRMWARE. In all other cases
EDID and/or modes are to be provided as a part of the panel driver.

Drop support for the edid property.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 55dedd73f528..4d17fb96e77c 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -16,7 +16,6 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -34,7 +33,6 @@ struct imx_parallel_display_encoder {
 
 struct imx_parallel_display {
 	struct device *dev;
-	void *edid;
 	u32 bus_format;
 	u32 bus_flags;
 	struct drm_display_mode mode;
@@ -62,11 +60,6 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 	if (num_modes > 0)
 		return num_modes;
 
-	if (imxpd->edid) {
-		drm_connector_update_edid_property(connector, imxpd->edid);
-		num_modes = drm_add_edid_modes(connector, imxpd->edid);
-	}
-
 	if (np) {
 		struct drm_display_mode *mode = drm_mode_create(connector->dev);
 		int ret;
@@ -312,9 +305,7 @@ static int imx_pd_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	const u8 *edidp;
 	struct imx_parallel_display *imxpd;
-	int edid_len;
 	int ret;
 	u32 bus_format = 0;
 	const char *fmt;
@@ -329,10 +320,6 @@ static int imx_pd_probe(struct platform_device *pdev)
 	if (ret && ret != -ENODEV)
 		return ret;
 
-	edidp = of_get_property(np, "edid", &edid_len);
-	if (edidp)
-		imxpd->edid = devm_kmemdup(dev, edidp, edid_len, GFP_KERNEL);
-
 	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
 	if (!ret) {
 		if (!strcmp(fmt, "rgb24"))

-- 
2.39.2

