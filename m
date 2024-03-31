Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76A9147C69
	for <imx@lists.linux.dev>; Sun, 31 Mar 2024 20:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711916953; cv=none; b=fRIlFzcDzgMSSU3TOwNlEA5MPloUL4+VHyRHJEWAQ1pinFFCK1q3fJxmKrllthO9FJ18DsfMjMoTFXuL10FTZFv2YoJokNt7tf3JhakwTjHBf0Z/nS/1vV+SptrmN9mqOq/4rtUVeJa2K4LrFqmhPragt5i6iArnRQNfD0Ssi/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711916953; c=relaxed/simple;
	bh=Ur4bgiHo+4NL+0zs7qW21KEsP+z03vz9MHkP96MxsJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GI/3btkK6STTMx09zB4jksiiygqlpde5h+p+6YM4PHY/RDd12ZWMNU+VsZIkvaeehEsY7Ye57XZ/BxkxQ9OUgTGGLH8CTZIJccBQTEVB6UyK8Hc5XzlBVKcGuVPvRbs4lVtwtBFmGO/H32mtqDf0Py+YZTgRoQyFlwnBxGNVghU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INr3ZKmz; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INr3ZKmz"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d475b6609eso37242091fa.2
        for <imx@lists.linux.dev>; Sun, 31 Mar 2024 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711916948; x=1712521748; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zef0nzZ2xvfKTTGhbb7RG1PfMMOjv1sjApX9pDJjmRc=;
        b=INr3ZKmz8ZEffXu+deC20vfM2QnOqQ0XO79IsyMR21p09MivaC1kvkj18lbuwwBd2y
         qySgDupegLGVHoqIhOnvkSV21edreta9tnUaweG0bgzq3okSiqNXSLn0bliJ3owJ3PFX
         6d77oyWBBZQ2ZqAcrib8lKEOJrY3fsFXBLctMtUKr5P3R2NaE2X0NnIp8SaUlR6ryH8x
         w6jQabGBtpWdeLsC7Rvdg2q5cbURg5uqMSuHoVpfK5j4pfLHemWZJPYTTwZEiizn+vNM
         25pIvwXnlGOhcFi2WgOBRpFEVTNWL+PdfDoRLEf8drzlK9OJzaMLlzPlsR0Prix4j1hr
         IYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711916948; x=1712521748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zef0nzZ2xvfKTTGhbb7RG1PfMMOjv1sjApX9pDJjmRc=;
        b=FddtlYof/mo9TcEp1mXS86HzvO2U9iZXpvYAZDGhD5WjoSYfpGiug3BnTm8pZjhAiM
         pwLcmV12Ok2NlBUpwLHyhUvCu3D4d3N6fnVR84ynWiCmk6BO5Im6FSPgdsxssQujo7LF
         LWPZmVkJTCFCLbbaDeG/cfI/4IfOA7X2rBSDs1IRAJ2q3RJXYoQSdL3nlHZtXCs67wF8
         GtziUGrFYVQGl/YbWCHfLsEtPu5eVd33DShjApiLrSBA+cgAlhdFLGAymKWChjwQ1TbO
         1LCoPq2fqYaLdEWVxHRhLOI3v8TS4RYC/5S4W5Ib6a2JkGnDVCjeDfOn9uTg3PqNx6Sg
         b/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWojxzTxKuQWaiLNJBnuC/chbz5u7iY/h5z7mvDZLaqkClcI9UO1BabS6hcYOQTY0gVwLpQustIEnSskso8Fe/+Fup
X-Gm-Message-State: AOJu0YxEuF90NOvTXaL+ay7tJmzb94bXFsxFgf/CYVviL3uTQrViqKdw
	KxEqxCmocahzFjBweo89g4FaxhXgxrYbT6450xHC/3Uqb9nK76fErKN8Frw1Wlw=
X-Google-Smtp-Source: AGHT+IEeBeqNuZwIfLQbwY0vtR41HMctXhZ/hlhyqOsgFR3m8enJB1rayNnKs0HiihAbaUaz+EUPCQ==
X-Received: by 2002:ac2:55a3:0:b0:515:cd30:cd4 with SMTP id y3-20020ac255a3000000b00515cd300cd4mr5778415lfg.43.1711916948521;
        Sun, 31 Mar 2024 13:29:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 13:29:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:29:00 +0300
Subject: [PATCH v2 03/12] drm/imx: cleanup the imx-drm header
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-3-d81c1d1c1026@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ur4bgiHo+4NL+0zs7qW21KEsP+z03vz9MHkP96MxsJA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCceOtaRv6AfyisrG+WrNl8dGCI3K0Kw6vglYg
 sqv7jAKSTuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjgAKCRCLPIo+Aiko
 1STjCACN1Fcy46Njl3mD9RbVJ9J8+l5TVGpyE/uU2LNja6WGRJwELYrPl7UrBkzUfEKao7AhQ7w
 wKuB2eJNzk+5bi7T7wT3ICVV3mq39cxEK5weLsTGZTKKb9EDMuZwtI0CS2XIPRAHbQg/fPMRDo4
 IvcpTt6sLExVGzjyJ2Wg7TwLT0xHwkrmJY4jLAmzefKAesmiyXwG6X6ubAeGnU8nbO+Gjw0G8Wm
 V03iQeFZ4f8ddwMkS9fH9FsOz7IWFekfRnHyvl3iY0xIk2mLAd+vZOx4IHTOp0S8FrvY3s2foC3
 9BD/zTWcq0kEgalTxeqXaS2F9/s1TBSW+9/XgefKm00Im+1I
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop unused defines and obsolete prototypes from the imx-drm.h header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm.h b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
index e721bebda2bd..e01f026047de 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm.h
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
@@ -3,14 +3,9 @@
 #define _IMX_DRM_H_
 
 struct device_node;
-struct drm_crtc;
 struct drm_connector;
 struct drm_device;
-struct drm_display_mode;
 struct drm_encoder;
-struct drm_framebuffer;
-struct drm_plane;
-struct platform_device;
 
 struct imx_crtc_state {
 	struct drm_crtc_state			base;
@@ -24,16 +19,9 @@ static inline struct imx_crtc_state *to_imx_crtc_state(struct drm_crtc_state *s)
 {
 	return container_of(s, struct imx_crtc_state, base);
 }
-int imx_drm_init_drm(struct platform_device *pdev,
-		int preferred_bpp);
-int imx_drm_exit_drm(void);
 
 extern struct platform_driver ipu_drm_driver;
 
-void imx_drm_mode_config_init(struct drm_device *drm);
-
-struct drm_gem_dma_object *imx_drm_fb_get_obj(struct drm_framebuffer *fb);
-
 int imx_drm_encoder_parse_of(struct drm_device *drm,
 	struct drm_encoder *encoder, struct device_node *np);
 

-- 
2.39.2

