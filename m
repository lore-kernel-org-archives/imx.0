Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1991C39AEB
	for <imx@lists.linux.dev>; Sun,  2 Jun 2024 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717329893; cv=none; b=LzL78HtRlEgBH/RzawP+lRGXoomcUBbRK2OxHSirkwWPwiyObFcu41zxiWDwd1RbheH3+YYMEkCOcHu6Ik6foib8CRt+vG+RnDp69rsK9ra/UvruQwMyHnOM8B1k8d468409PkTXgqVEuGmXdIbkBp/xSHTSl96ueUGoVvzvdsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717329893; c=relaxed/simple;
	bh=p3R84UdnZzJNiooJHROp8P8TIKNW8VASKGnwF+31z+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AjVgw6tM7t66uge6PNkVg1EHm0Hy8xZu6EJYdMrlATEONIpO66B4UZ6suI7TDzHCyAaHkkMy2ppPHImz6m66yJXlmPKBOQYh6RIhMaC+FwTyVMPj9Fn53v6qVsbtSNwCwy17Avp0uJt05EhTlEMIDQh2ItKlbnFjMd4shaNzueM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fTHJZHYp; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fTHJZHYp"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b89fcdcc7so2736488e87.3
        for <imx@lists.linux.dev>; Sun, 02 Jun 2024 05:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717329890; x=1717934690; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCmMEV20sJhl6q9JP4BtOvE1ThwKifoA/eb2lcmOX/k=;
        b=fTHJZHYpJnOy460Izb+GAqqgVUpo7drAnPtQRVhsGpaNOK6URmzczGufx6wmlzHH5s
         QM4o89wmzrpSpexWdiTLmcs9ZzPZtcwORu+f1swktOi2HDrfj9T2/F/+lKqK2qZgw4EV
         wK/0s1AVQlu0HR2D0lo2ZF9Tcu/0Z304AkQExu3Nl3+VWyzPFbh6onLBvebm1zmyOcAr
         0OlJJ3dri1MmBOUvLsr4sJ0try5jt4fmlmfx6tWJJ3ELzeKxEI1tDICLo+qlHr+LV24W
         dnkN22w8Eumeza43ktiieUYzHR1F6jEZa+UdlSNjRt3PhTrrBcrrkrU4v//zLMWdnlOS
         abpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717329890; x=1717934690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCmMEV20sJhl6q9JP4BtOvE1ThwKifoA/eb2lcmOX/k=;
        b=oBW6P95gH5F9MsogwXV6s713HyFlClZk7OKs7F5VxwvzdGKgjks0pwKlIsJdMk0cAh
         WJHKFnHp2lyCQ8ZtcP86p7WLDp+kPC6phyHovn+pJEHtz6njSRId+0fXfo2Zv6t1cm45
         +2xzsDKXVqG7ru27ysOXQjoNDMt63ThfF+iUdznhdkW1RxyJTxbbZ1kXA+6UoLotabTn
         oS2yw0gcm/+MTNb4hHm4c0LbtNK8uLBTipgB4vz73LzaL8p3bjEN/+pRuuHWaVoLKUKp
         EKmBwXCplgh1njP5oamPBGHxMiuoXhcoGP4AwR7r6FyXWghsWO8C+hKov8nglYPFHKWr
         EF3w==
X-Forwarded-Encrypted: i=1; AJvYcCVIZQQokNZvV10eS13sv7AXJuNVTBHGkKfSxLdIUBmu+Ur0cIHNEtDmfyYLmsV6yleVkrCokuxi71xQ97enUCejFJIl
X-Gm-Message-State: AOJu0YzEccGI1qeQegxipISvjB+5n0LefYp989kS0TCugCIJqJfU7nQV
	MZFdU3BW2i9EGIzeDYfJp54LftbLj1pTNHuD5Tc+Ehjuieqje+ziGEBpi9mMu+g=
X-Google-Smtp-Source: AGHT+IGCiCd1TG61yPuHP2aBTp9MSL5cxIMjf2EW/NA9zU4V8f7CT49VmAhc+8/OK+n9wpRK9ETuPg==
X-Received: by 2002:ac2:58ed:0:b0:51c:c1a3:a4f9 with SMTP id 2adb3069b0e04-52b896d8790mr3599090e87.64.1717329890158;
        Sun, 02 Jun 2024 05:04:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 05:04:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:44 +0300
Subject: [PATCH v3 04/12] drm/imx: parallel-display: drop edid override
 support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-4-e549e2a43100@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2329;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=p3R84UdnZzJNiooJHROp8P8TIKNW8VASKGnwF+31z+M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXF/cNOEQ83ng70X09QmeKaF0NL8z0h92yMj9M
 305afztkWaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxf3AAKCRCLPIo+Aiko
 1XexCACDSDdz/1zzBjj/fpPm9P74sgM1RPvq3rFuMSGAAgAMTldnUNhsH2r3LcogCivWWmXLeQF
 FqDenyVNvckt6NZDDg6cToyVSWnoY0/ZPbdNrI7al6UeND2y/snsiBo+L3ozuiDfoDdPm9ntfyI
 kBjy+bvMhGTmH9M5MvVwx9D5yk3XRVD6h2WP7dYTK0WpupSnRdq1EMF9Tl4jmYZY5LxwM41oc0h
 xvy5dVsY3tkCZI0dutTeNAPMJ5H4I6LVRLSiqOob7HGMrppHtwBbxjKtIro4Lqr1zr3Co29GKT4
 Kx6xBvRoI1UOucJZYh4Ditfs6oa2OpLJk1rEb2MW/QQnLOZQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

None of the in-kernel DT files ever used edid override with the
fsl-imx-drm driver. In case the EDID needs to be specified manually, DRM
core allows one to either override it via the debugfs or to load it via
request_firmware by using DRM_LOAD_EDID_FIRMWARE. In all other cases
EDID and/or modes are to be provided as a part of the panel driver.

Drop support for the edid property.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
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

