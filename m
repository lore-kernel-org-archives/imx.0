Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0961487F9
	for <imx@lists.linux.dev>; Sun, 31 Mar 2024 20:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711916958; cv=none; b=VheQCw+uacYIyE2/3WYXwM5SAMl+/atHDrQKwX6w0HNuDeM0Pl4OXE5s8W3DJBmm6u85eUmpSRJuE6Zp0NedndP73Zh4kO+SY0VoD3KIv45MayLJ95aPe7loI8afl3YN1hp0+ab+/FuIkoSeimvhQCUyh8vp1FYxSE4uOCmTqxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711916958; c=relaxed/simple;
	bh=5YQu6iei1O3icFERDmvk1l0kTnnJ0t2qf5um+94Fdg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kn/+Ux/+sdHl2yxNSOhHYOnV5hbkUja3+JTEUxX3MDVDVfiDqfhDEWaxo2dM7ugZRjMIIyFEQ/ug6/6wBQKU7fu1JImx4fhVRTOuoyCxUVKWDCVS6tHGwE1hC6mGN/AYsKya6/u17zFmK9vhUceHR/PtIpmKyl3bpOYeCekowdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=etoKEzVB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="etoKEzVB"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-513d4559fb4so4206849e87.3
        for <imx@lists.linux.dev>; Sun, 31 Mar 2024 13:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711916955; x=1712521755; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+v9GTIZDIAWX08FzKTARGqVQVzeSJaMCtOVkVitqgmc=;
        b=etoKEzVBhKSkPI2UMvwT+PCm3lq6yBdLZqASF+SRlFVPjs/0UUS9v/eUGER7o/BoDc
         hZD2ilPEi1nkeG7oaDhn/oBMcS+9iHQFdoxjvBEKrmgmW4zQUd4m2g3imiLMriTSCFgX
         30zOh4nqS6m3OnMXSHked1MHHSt0HFJjw4MBjwqnrwYHVrMGFzolesE9TbN5zt73U1iF
         aECnPfHxqmXE+Ns3c9oCsug1KPnQjglxtsgVXU+lTQBCgMJZlaooWwEeQhuEt1XnZFC0
         6Y8w+KkFq4ofkoUFhfoGQ4RJMG1uJ9Md6bOA/6Z/MWYjl2RvraRt7I+clgnIzLt1ZODU
         EqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711916955; x=1712521755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+v9GTIZDIAWX08FzKTARGqVQVzeSJaMCtOVkVitqgmc=;
        b=dtwJeb7+iHiQr/BngnPIfzTgGxN9NPfzVpNtITwLlb6Cr9tjNQxTNUEyBsyU0iZqI5
         PEGO07WUEM6g9HDM444yGYjcMkl7v/WKrh4gg3MJwHyRar1n3x0bomxqyKGsmadahjh6
         pGxTwqDOeTwcJesaGSE2uEWMHy2t3iRQSERk9ALorMmMHe6IzeCm8ATN5wn+GHOF+hQP
         yEL0n5umchLrMPlJFbNmma5Y3xrWcZP+jZtSxcYvIufrd5GfUlCbhazqlxLvas/s23G2
         hsPOsCJBN8qWpSY4ScycQSUyUcC9bv0z/Dy+UKASG+WJpMqs2IuZMSelC87S8OixpSGr
         8E0w==
X-Forwarded-Encrypted: i=1; AJvYcCVbO9R0VDqJmbNUws73fU3dB6od3vuRSZNc3o7c+HQTWH5AXfl/taLKynIgnSScvWz2zbl3bDHxxmLMmhKCVVwa1FXF
X-Gm-Message-State: AOJu0YypcbLYx4aVqPBvZ9aMtXJSKWinz11GJBreepupLROjnhNltSFq
	KFG4LFsqaAN/CY0/21C8BuBuiY/ypGrrv4kiTdOjsvtpUNx8Xjo62F8SnBuCliw=
X-Google-Smtp-Source: AGHT+IE3dsaZsU0ynBFh7eT7zhvlqvKfwqYNj4h+qdo+iuTj8Q2UMpieGDvwPHTYdOFd6ciMJdrZ9A==
X-Received: by 2002:ac2:51a5:0:b0:515:c615:ce23 with SMTP id f5-20020ac251a5000000b00515c615ce23mr5780599lfk.22.1711916955358;
        Sun, 31 Mar 2024 13:29:15 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 13:29:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:29:09 +0300
Subject: [PATCH v2 12/12] drm/imx: move imx_drm_connector_destroy to
 imx-tve
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-12-d81c1d1c1026@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5YQu6iei1O3icFERDmvk1l0kTnnJ0t2qf5um+94Fdg0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCceQDf+olRh9QfALPc+aBKfyzH5lo75neZO7G
 9G/c0G65EuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHkAAKCRCLPIo+Aiko
 1a3kB/9PCf+qZk6BU9uNm4Mq6b6l9aQ1snWLpd5Ocn28EkiTCxoVc7+x/jVRyrbJOf4CizSpcN4
 ahurpK9t+VYswcda71cQTvEEn0yhiUyWAuDObsaFkm5tzVSAuS91s1JFeU+ya3lffWXzV6RqgGY
 CLSiOEl9XV1T6ncjZPjgioIMS7a+2QnMvzCaobKIqdp58Ku/IyhAdOk2CqnZEd6XjG1dNoeZacb
 qbGt9CrEp7uvvf7znqrphQ7pFAu1EjhOBPJqCLV8wJgJsgAwlOqyGLzVnjkyvEJF/gJp46VRISr
 C813XA47F0iXhSoBO/vRA3tmI3DiCh+Gb88qe3xGNAFnNCSn
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

