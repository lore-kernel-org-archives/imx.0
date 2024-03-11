Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38C3A1C9
	for <imx@lists.linux.dev>; Mon, 11 Mar 2024 11:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710156045; cv=none; b=KTQug2HXfkNnrd4ZjdGIE0sg2pkhu3BqkXhjRfhC+NO4iBSvhnRUfIMUP8bc8Bgqi1MekpgSo7xyY3XkGkt/OetHApimgYMel1Zu6/UOXJ05trs4q3e+jDk0AM9UiJFB94HE6ey25sey1bVsAt63lNHuHKF0ZjBIjZKzUayi2KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710156045; c=relaxed/simple;
	bh=otRF0WM2vzdwskj5zPMELQrxSXcHtXRqOyPOOstx8go=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fAfoW1wSEjf65M9/rIbjBEaQ9Uvdz0PcH3YsUgpaYYw0nGu+M2WqyS/l3tnXBToTf6ZYl7K0XpEZk0Am4ny9kIUSq1Gar5QYWH7aYHvQa9ROgoGv7XkRf8dirapcyrrJP1Kz9I3YJYNHpNkuPfmj0R8lGqavw7kqwnAgNduu1LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cz25+4DT; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cz25+4DT"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d27fef509eso68458991fa.3
        for <imx@lists.linux.dev>; Mon, 11 Mar 2024 04:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710156042; x=1710760842; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8Mz1SrrU5s0SvG5lNUUvBk8SH1QEwpuUJsxf2sSYp8=;
        b=Cz25+4DTVGpCZQixARYnpJQ2qxiWJBmxikoU7yYdDcJjKV+ai8Y8hiv1git/5pXRJx
         TuMqTsHh47ZiVw6WgOS9X/KAr9zTiNUHr0AGokASvrWYOLpDsHCiajfP1KT6dgb36pAn
         UbNNNnLegiXeGhXEpS2vjPJsrlwZ/HFwEKC+cBjDZmnckqRQ2OEKziRsyv1v045RZWXU
         ax5456O4qMW+fcdjz5PGmLPQxCzUbW2m2c0opfS6VSU48NQynYGSvbMzTOrB2lKoGW1i
         x96p+KuvHhCQ/KLu3RJ+5JSNm2Rvbv6ijpc5E0iGfvx0unU9B+AY8vrDD2BdcqkaJvc9
         q6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710156042; x=1710760842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8Mz1SrrU5s0SvG5lNUUvBk8SH1QEwpuUJsxf2sSYp8=;
        b=LSGkDauDv+lNZ9x08LCs6n6olY15cyFMuZB6gFZrmvuI3F08Fc8mKjQz6dWjABWlIq
         VK8EILQ2PRUdmtzDyEWbDvh3nYBXBHqd5xPdP3RgGxouP4wCdWvK633ayT/jXKuPkmlx
         uFBEAKutpdnMa0GFyvPWvElStVFBW8042Iw21ra+lhOrU+tWFT+sJPGKqmfJNb5xBUOh
         7pbkPc6gNXL2rQJmTcvv3Ifj8mKjCgrwQeIc8quEWTPsHR4nsvWhdueykRxCyleqWqQD
         x5vZMKRMDoyUlqJaW0R3a3i8dZaDkZ0YLt2hVbZMAdm5n8JGAzKd8S+KkCDaurCfF/ix
         AYgw==
X-Forwarded-Encrypted: i=1; AJvYcCUuYBT93Q2eH1RChP0IGAJjD5+Ec0FdX0cLpqj996b0vVX5nL7rZ6aYKhl2HWRK2mOo0r/hoO4HuvrxkaQTgmeb6UDW
X-Gm-Message-State: AOJu0YyHZViNcnZvr32KXRa4qlBrWil1UffGKAF0m/sRe5a3vUIcX350
	X4wxY3BhON37sG2iWTtdVbCZaqa3YNWLIMQNgouhi8JvLZdF48Xv1H+SyLATKWg=
X-Google-Smtp-Source: AGHT+IGqAhe+1Se4Tmw4xu0A3Nkx9yGY4+FnsmQk4e2SdM2jX1oMyWDtYqtFTQ/d/Sc3k+n9g80tow==
X-Received: by 2002:a2e:3306:0:b0:2d3:f352:3406 with SMTP id d6-20020a2e3306000000b002d3f3523406mr3846006ljc.46.1710156041996;
        Mon, 11 Mar 2024 04:20:41 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:20:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:12 +0200
Subject: [PATCH 04/12] drm/imx: parallel-display: drop edid override
 support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-4-e104f05caa51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=otRF0WM2vzdwskj5zPMELQrxSXcHtXRqOyPOOstx8go=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukDNBWN5PcXva2X3BynfIJxAxvscbxmupR6u
 Q+OGRG8YUWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pAwAKCRCLPIo+Aiko
 1XJOB/4osTf+FfxlQ2fIHBLSA/xhZy3lpIvGKap6LB4bJ/znr81eejo3rbmP2tbHlcCb7m1jN69
 u0Uarv0On6KIWd+tfUJkhrVa/0L9s7ZKLd3qYdStycR4YOxJLrAZmjyzj2dqjWd05m5IlXNJpRS
 95yIOp8ilWbKOzUp/n++/0QrfM6+ZfuTW76c9w1QolXh2IssHXKwKcWrWkpWsfC4QX5t+d3OIm6
 X1RFRKadRehNzHpmrp7zyFYtlBsHP/cgvEf6e/5a6RIZJAAtVN8PFOQdLOJ/WiqyXNE0ZIdQB7K
 R+YBQtQor6Cb68P6+ShVR3o7mkcMW0WiGg6Rgb7s5OS+1p29
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
index 70349739dd89..2d044ea1920a 100644
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

