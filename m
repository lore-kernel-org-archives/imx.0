Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13617125D6
	for <imx@lists.linux.dev>; Mon, 24 Jun 2024 10:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719225112; cv=none; b=a/FuT+t6tNeB/uJLLrCLMI/LnqxQO2yBp0dKaCVtiGAWsSGNj6PSfn+JnX6SOI6QCzC9KVzBJ/wY8fsZHHZ5llXYu8tGJe1AHXXvE24O8HVruoLartpKb1iJdxmpWgIBGMMbJiq46nVw5J2X33MpkMzVTBOQDLAivIW6EnyG5bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719225112; c=relaxed/simple;
	bh=eCJNHKpOFyvKm0QEDNLeKYcgJDFGN4EGDIDzjHn6FlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cct715nV649rx4niYPzOsprdbH6fiBhWksHZ8ZwpsujxGejncrRMl6eYkT7FDtKDNLymPH3VxlSsiWVrIIG8DJiuLZervYb4q9xGZYMNRAhUHa/bE3OoMSepTP+6PVt/UHr0THDjTC1PffFzESjmPTPXIrkvJSQPhnnAXpAwRq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g4qMi0MF; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g4qMi0MF"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52caebc6137so3954653e87.0
        for <imx@lists.linux.dev>; Mon, 24 Jun 2024 03:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719225107; x=1719829907; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y79rUxm3lgbaqaUYltDlAHQT1o1yNbGd4AJC95vHYik=;
        b=g4qMi0MFZ4uU18JkWpHfAUcoxYFdkziNmdaHrlBhVajJ+AnTaWMcq5RYV3shsnp9ib
         1boF8pD2RmwYmDbVi6l7NGB/0WTwNMbkwoVBIsrbVwemdkiRwG/KycsVNTIEj1sjJx2p
         hjYlGVHbdSij8Cmj3FNWQimk8UhAgG6mN5vEmCynu6N376r75YQ03e6JI7S8qXoji/JZ
         k8fhCQ6/9Hsj8INRFfrIQjOwS0nC3coX/1nokB6mmaoCpPXucAEAFPBGdHeCBoX/Eeii
         vLRXXuAGWgGz73fIxXcb/hCPdMKqmaKOHcqEHANdNg7ZQyJam+M4TW7IzkhTghA9caXU
         kN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719225107; x=1719829907;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y79rUxm3lgbaqaUYltDlAHQT1o1yNbGd4AJC95vHYik=;
        b=C3VwW/udldZ+btlLsVZxrlO/+ZIingYF/VVD9A8INPlQ62uOLEd/itk+LNwN87gDXF
         j7wEeu/Ic8f9LJeY2bVRZpHrgC4Glum870ZY9P/Ooj6XKkTGP/mBdFsmrXVr3YWOEt3c
         MRJgUAtkxbjlMQitAK/ImENtIOpTUO5pQH0Oy3UES8i5HH5SgnEDArkm3+kVwkqJQv5n
         xtGZH/In/D2i3JAwTZn6EPUvhq9Lcakk5AqBmki1yWyuMmrMiirYprVVF3aR620cD6qs
         rqJ2MgFKwx6sXW5AtAZauCgWdDAByjDhZNh9kTwje8SE9wMIZJYqrkTP9zg7diiWWt31
         vNPA==
X-Forwarded-Encrypted: i=1; AJvYcCW3c3QG5EBEG1XOuJrCD0t0QEK2HuOdww8yxWkwbtcx3qozSF6IUqylvivhF2nwJF89JR2wJX1l/8RfKYR0pTKupSUF
X-Gm-Message-State: AOJu0YyWzgmUfNnWyjALzzbEqBcyX6BAH70MayXtl6vea/hMRyjTq0zX
	Ad7ew/RyFr3fd0q4pztaVdoA3cGvUMS7ygOInImVYhh2ZwA/t52JpRDrw8WgCtc=
X-Google-Smtp-Source: AGHT+IGQ8/4ij15CkMhnOaWlVH+mAJ1XYx0sN2OLk0VHtmIAIuWQqIv+pbQOI4C4fD5y7Z7z3JFAOw==
X-Received: by 2002:a05:6512:138e:b0:52c:e08c:a0dc with SMTP id 2adb3069b0e04-52ce185f753mr2722847e87.51.1719225107235;
        Mon, 24 Jun 2024 03:31:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b46ecsm953874e87.10.2024.06.24.03.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 03:31:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 13:31:46 +0300
Subject: [PATCH] drm/lcdif: switch to DRM_BRIDGE_ATTACH_NO_CONNECTOR
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-mxc-lcdif-bridge-attach-v1-1-37e8c5d5d934@linaro.org>
X-B4-Tracking: v=1; b=H4sIABFLeWYC/x2MWwqAIBAArxL73YJZ2OMq0Yfpmgu90IhAunvS5
 zDMJIgUmCIMRYJAN0c+9gxVWYDxel8I2WYGKWQjlGxwewyuxrLDObDNXl+XNh6VqFXXiXaWrod
 cn4EcP/95nN73A0Xa3slpAAAA
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=eCJNHKpOFyvKm0QEDNLeKYcgJDFGN4EGDIDzjHn6FlM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1qlt9Ar59KYH7VRt3+sPjXB/Fev0SbNiiz7/1tLfh+y4
 Z14d3JaJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmolDP/r+g47nFmZ9R22/5
 efi9nXuhhTE82Suct/H5aV5J9oMrpbZ7L7Waes+VrWm2tc15L9m9AncYm8PiVHtsVBXLjiTN3WE
 lHnctvr2BX0f+9R69+eeKW9UZRKyfaqsxz37umtKgdfCFxaKe+cX5C3Ly0l8mSjyZciVaSlhVWV
 zN5Nj2F2nHQs6I7X/5we3MsobNQW1X7I83GSV6pIvwfmVr27dlGuMdRwazhu+Pvu2r+bXI8kpjI
 cen9qTndWkzN0S4MW3/ZTmpYp3d9X9Ts93q47wvJ1uKOSj95vyuuPZJzsYQg1ivGnmNRbr3pVfd
 Y+LY2nzepa339YqjPd1M+3jzv8o2rO65sYglaLXs8Z/5AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Existing in-kernel device trees use LCDIF with the dsim + adv7533, dsim
+ tc358762 or with ldb + panel_bridge. All these combinations support
using DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment.

Change lcdif driver to use this flag when attaching the bridge and
create drm_bridge_connector afterwards.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Note: compile-tested only.
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 0f895b8a99d6..1d5508449995 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -16,6 +16,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fbdev_dma.h>
@@ -48,6 +49,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 {
 	struct device *dev = lcdif->drm->dev;
 	struct device_node *ep;
+	struct drm_connector *connector;
 	struct drm_bridge *bridge;
 	int ret;
 
@@ -96,13 +98,23 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 			return ret;
 		}
 
-		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+		ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret) {
 			of_node_put(ep);
 			return dev_err_probe(dev, ret,
 					     "Failed to attach bridge for endpoint%u\n",
 					     of_ep.id);
 		}
+
+		connector = drm_bridge_connector_init(lcdif->drm, encoder);
+		if (IS_ERR(connector)) {
+			ret = PTR_ERR(connector);
+			of_node_put(ep);
+
+			return dev_err_probe(dev, ret,
+					     "Failed to create bridge connector for endpoint%u\n",
+					     of_ep.id);
+		}
 	}
 
 	return 0;

---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240624-mxc-lcdif-bridge-attach-60368807b2f9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

