Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A223839C
	for <imx@lists.linux.dev>; Sun,  2 Jun 2024 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717329899; cv=none; b=fHJxPjBCDhKdh7Evb4KGnyNmOlufIPuDxo64fvwhNjsqbPzsj1e0cLX5k0Vm4QvZfFRldsJMzcRtskr3k0hxFlRWaQtnv34uij1TEJv+i4iwdICOAaUAA/PutvJjHU3fSkKPJXUgpLLf9hOd8rgn/cEVVwuhwa8ULKzZJEF/arc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717329899; c=relaxed/simple;
	bh=h/DSMM9BfsUckdlfOnVl0fUleOjgfbtfRzHBaAfH+mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMbPeyQtzfw0KL22W/wWB78EGOM6PVjuhPWAV+kzIZwtwHVDZiVSgWkRFwnwJwX2I3dyG/SSW8RkVYj1pKJikzJrzm/cmrnwP9Hr4CflZdmZoyrIsXN45/tySkFbmt+GE8RtSIzqALu25I9p7KIpxsvrg+NFFfy1xsY+Czu30wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZyGDHBj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZyGDHBj"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b950aa47bso861467e87.1
        for <imx@lists.linux.dev>; Sun, 02 Jun 2024 05:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717329896; x=1717934696; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNuDl566fdESfLAQYfAX73LiPJqclp33YW6YrFo8/hQ=;
        b=pZyGDHBjfiJrwYr+MymKBAYM48iaI9CZRWhcGEhud+VdeycLZfXHchK6kaY658Fikk
         R4jraN59S+uYHxnW6667lb2F/RV5hj8mr7k97E2goL2o3rMi+4YcG8gTnAYSOSi/6Mxp
         V5KcsWF32bxP/jQwyNBwmJrQhnDCGUHRO6stJIyOmG+dpAsQ5Fo82/ELcXeQwul+6QUA
         cAHT97Q+IrfoSh6bMa0B77HkMqMUwb9x4e6v3dorsCQekZX7lJNoV1MqUV+e81d3VacQ
         rhKaIaVuXBi7G9Uu3yFL091AzweFKtHrZZDtkBUZyjIDP/v0Kta0cKFU9PKk2G+PUjho
         +w1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717329896; x=1717934696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNuDl566fdESfLAQYfAX73LiPJqclp33YW6YrFo8/hQ=;
        b=i2N7JAdJ3k6dviBuNLkbPoNaCe1u9wXE00fpvzQGGMWMLK7Aa8GKETCzOUUuwg7CpA
         CC7J0Z+NVa3ieKbZ10zRlSAgd7yUWqyAVMuk5HlT1lXIBTYTh5Wt1ZE/hC4DGrD2O6kY
         15vQs0zrWiqklkstu2TcIi5Yi6X4tGdtrsTnU/X3iWIeBwFrKHMnoGPvp8dq4lbDdopv
         kNb0PtTTVBRm+E6n6yA0h6U/dPCoP/BrzZSA5iairuF9WEs1+2mg87sClyQAIMV42832
         mAntGLIhHRDBKPlMGmLJNuH5EMvl+Um9eE48TzT//YQ+G0gD5slJ2JYLcnhwwi1FFjJB
         p+2A==
X-Forwarded-Encrypted: i=1; AJvYcCX1DIUSN79wvMUUFT0+yrdakuuoTKBPv+Q/T8/7uhqZBkB+vi37rnCa8rsu11/54AVVVvLN3AGyj6J+NKyGONLAOi4V
X-Gm-Message-State: AOJu0YwdJUUncYF/S3FQu85KRaETRkmzYFCWi2aYdNpqWNSUv6qDRzGk
	mjYVTUTq+h4HPqLsIlNJaCOApgenbzeOSiWZxpqn4jadONwnlHMAavL/UGwgcew=
X-Google-Smtp-Source: AGHT+IEFQgWpWrVek9sgb57OqXvq4Yl2GmvGbIbFNiQhz8GQhgLZZKzZdXR7VkMjAFTMyvzTXG7Rfw==
X-Received: by 2002:a19:c514:0:b0:523:70db:7a0f with SMTP id 2adb3069b0e04-52b8958b9fdmr4091009e87.8.1717329896464;
        Sun, 02 Jun 2024 05:04:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 05:04:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:52 +0300
Subject: [PATCH v3 12/12] drm/imx: move imx_drm_connector_destroy to
 imx-tve
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-12-e549e2a43100@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h/DSMM9BfsUckdlfOnVl0fUleOjgfbtfRzHBaAfH+mc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXF/eWV2GMqKPP+JRWmUQkel1cF728TylDcmgO
 0eEmDycmaaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxf3gAKCRCLPIo+Aiko
 1dhZCACRu+PPllOgalpri1YjKo6EeMiZwJWGWbZB7vOG0XyWYSRR5eOJXBxq7Dj/kYq1tegFmZ3
 sXQtiS/j7TCmbhCYqvEG+QiVIv0VxmNuCjq9qOFsMBTD6/FUpIAzVeNrhl5Qy7mrMXjC1M6bHZ+
 v6/8k3KX4MHbqfZRU5Dpp2zbGsEAc2rTMc1oDNLCYVtEGVj6iBBwBREE39J09ROUeymKQxN9zyL
 eUrLTC+oNnRZxVOhJCFH3vqAPavR2QAJ0efqynRhJ+JKGykNLo0kYI/5rrBb/NVGncTm86QrMCI
 xXuY1XxZTkkPPdY/sYjc+KccNcaJHNxc/1mFxsBUvQSY06WQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The imx-tve driver is the only remaining user of
imx_drm_connector_destroy(). Move the function to imx-tve.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 7 -------
 drivers/gpu/drm/imx/ipuv3/imx-drm.h      | 2 --
 drivers/gpu/drm/imx/ipuv3/imx-tve.c      | 8 +++++++-
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 4cfabcf7375a..189d395349b8 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -34,13 +34,6 @@ module_param(legacyfb_depth, int, 0444);
 
 DEFINE_DRM_GEM_DMA_FOPS(imx_drm_driver_fops);
 
-void imx_drm_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-EXPORT_SYMBOL_GPL(imx_drm_connector_destroy);
-
 static int imx_drm_atomic_check(struct drm_device *dev,
 				struct drm_atomic_state *state)
 {
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm.h b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
index e01f026047de..0c85bf83ffbf 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm.h
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
@@ -25,8 +25,6 @@ extern struct platform_driver ipu_drm_driver;
 int imx_drm_encoder_parse_of(struct drm_device *drm,
 	struct drm_encoder *encoder, struct device_node *np);
 
-void imx_drm_connector_destroy(struct drm_connector *connector);
-
 int ipu_planes_assign_pre(struct drm_device *dev,
 			  struct drm_atomic_state *state);
 
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index 29f494bfff67..d46d07d25f51 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -305,9 +305,15 @@ static int imx_tve_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static void imx_tve_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
 static const struct drm_connector_funcs imx_tve_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = imx_drm_connector_destroy,
+	.destroy = imx_tve_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,

-- 
2.39.2

