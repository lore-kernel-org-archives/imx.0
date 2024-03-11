Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830D33A1C2
	for <imx@lists.linux.dev>; Mon, 11 Mar 2024 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710156052; cv=none; b=NOg7UFtpHrbFOQ7uhoVecp3qJu0/OEx3CN6v0gVs2B6ws4gFj+zj/FrPnj4Farzg7vbzIt30wuxdk4DgFO5USzrCG159LK49lwEHjgLAu3b9hNyHibmKjeKWoA2UwaUA5hCiy/nceAuzh/TzmWg7qt950opDPkxdWdIKiWcEuro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710156052; c=relaxed/simple;
	bh=c/syM85k3g67errNBDbi0QpULM/5w93/bHQAwxlatC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZTJ/35uaDXosU6YXg6bG557ZJCuyDMpCu8d5dcQq/YJ6TrCUA/8Fo3Va2rVVG6Ty3KH6LN9ypmg1bvHVJr/Dxd6Su4xQ8HZyIm7ksrPTTFpjhhlJsZjzPsIRq2foGuRQug9OsBQP5jq7k/h3ICJSrLAJ5KAqOypcceKMM9Y3Hho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T8NAkyRb; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T8NAkyRb"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d309a23d76so45161501fa.1
        for <imx@lists.linux.dev>; Mon, 11 Mar 2024 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710156049; x=1710760849; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCXm2DvB3Yj7Xx92C5Kj2hDALuD84y0JzdGeVmZf4dE=;
        b=T8NAkyRbQ21ppHMD/3jUpcDXhvvNCwxU5v+Jr2LsF9wT62Y9DLEM/lHVAt0Ix3pr9k
         9mwMdiwxMTUBKRwgOxCGbkUyOSDwmF2WRgs7MMxOSzs4kFqRpT+t69nBM9mKdimuJrbR
         uODTH1hQC+nde6drnORdVWC3Femau2QMpKynD1J6EU5xvUPfQ1fVkSjaAbrPRhGAO6jR
         xRdMuzSVtQ9P0/ocoBhEV1ALMarQNugbWYerisA+Lf+pdwZWNa8vuQKf7uEU1IPSkI7H
         et+y2SDfKwrDJK+a6CBaLhqyGCMd7g4/OQh1DeEL0L5oRMTaQqfHqEn8NmYuhmzozXox
         leJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710156049; x=1710760849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCXm2DvB3Yj7Xx92C5Kj2hDALuD84y0JzdGeVmZf4dE=;
        b=oV88fqkHlNuJn7thomkL/u8NTgIXGZ01mlfHqfU0ehXMiS5+jL3tajb8xygi6va1Xm
         A0nmV2zuzCM9/CaB/XhyxE7AMxU4YjiHMokeRRju5uZQOn/UoQBHNXdvCPeifqiZVUjC
         /tYDKABDSmQvK5hEdynXDiovfbKMqYxwFZbxNaUxoTGGBMIUckj3DOE8l/BcjNigS/j1
         vqXRmExxpxK4gqkcUZZO4icw3+qvL45sF4crMu5soMKlBdEK0kJCVR0KmD1q+ypxWPAm
         ihnzA9q1F4d7ZD3MHSwVhTIbItgaElT/e40RbO64VrE9yoXWH/xrysuDc2udHWl5vYZB
         IjVA==
X-Forwarded-Encrypted: i=1; AJvYcCWu/x5D8KgKqjnHA0/eL4qIHHsxgjOIB1Fuk1UBy2Fa3PRAbrw8ctAEGk/30HwWhdcAUGfwo1H42vb19cQ23BB1JEhM
X-Gm-Message-State: AOJu0YwBOtaZpJUask9zTL4aXL5iWE72tGGbPOEB5dfnEVg0uoEwV5gR
	P10Xvt+x6jJUzwTJ3I7c1ylxU34Q12CRYGNbii0QN2DIQ4v7mJsoC4huO1VyIvo=
X-Google-Smtp-Source: AGHT+IHbf4XJ+DXoOulFtxU1Jg17WWBA5XWZO9E7K6YLNf9lvm+H8AQQETB3XuYvtUXahbYyBkzbxA==
X-Received: by 2002:a2e:9f4b:0:b0:2d3:17e6:3b4a with SMTP id v11-20020a2e9f4b000000b002d317e63b4amr2197192ljk.23.1710156048922;
        Mon, 11 Mar 2024 04:20:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:20:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:20 +0200
Subject: [PATCH 12/12] drm/imx: move imx_drm_connector_destroy to imx-tve
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-12-e104f05caa51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=c/syM85k3g67errNBDbi0QpULM/5w93/bHQAwxlatC0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+q7l6xarfPEZ82sD+9dILip7r2zS68yM5uenhHLU0vD3
 Y++6e/rZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEVuWy/1PSWLs97f7Ku+29
 nRGcwvmVcTnhe/8prGHJNv5QbWG3a63a5YoyB6aTqcwGJ9omF7EKP/3xzPnxlPMxwpzqxzzWLvu
 xsTNaa9MdDfcZJ3cdE8kJf6QSUbHOaj1zU53gGeEzhb5OB5e5SpcwdS+zfq7VN9X7XvDM4itHfq
 U4RK+2Z9nKZSuyu054SX9XUFvr48AEEcbt+5f3X+M2DGRcfqRs8rYtfSFfiipat0a9Wxaf9nuP9
 9GZXKfUPsex8KYxPeUrXp9z/cNWVdEVMlHZGcZOjRea7oTMWTU1f4ZOSZfc+esG1/I/bOfr+hn8
 U1lVe6dH9ITMqoQ5TTxtj3lFp14sOjahWDJIadmVnpcpAA==
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
index 57a95926c492..509f4c0a2cf0 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm.h
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
@@ -26,8 +26,6 @@ extern struct platform_driver ipu_drm_driver;
 int imx_drm_encoder_parse_of(struct drm_device *drm,
 	struct drm_encoder *encoder, struct device_node *np);
 
-void imx_drm_connector_destroy(struct drm_connector *connector);
-
 int ipu_planes_assign_pre(struct drm_device *dev,
 			  struct drm_atomic_state *state);
 
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index b49bddb85535..a5118504b522 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -307,9 +307,15 @@ static int imx_tve_atomic_check(struct drm_encoder *encoder,
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

