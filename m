Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A139AEC
	for <imx@lists.linux.dev>; Mon, 11 Mar 2024 11:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710156044; cv=none; b=mtGGpa9d6W7BsfiO4MmCHZplvhX+1RQYHd3Le5NyNrzylnMh2MDajzO9fSJnju+5E3GcOZFruJQKtuYZRD27otXeyuwLrDJgQmMgRFYZWxEdYI2SWaMr7QFoBUhLtChK+EgdgEYMj6v+qGr1GhXZEEcGIjkfX9fIfMEn79o7OtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710156044; c=relaxed/simple;
	bh=Ur4bgiHo+4NL+0zs7qW21KEsP+z03vz9MHkP96MxsJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QVa9FAi5UgjBmQInTIArwd+3n+KZFOwoPB1CraZB7yXwGKT75GKHIHN6dCiNXG4dCvp3sYEqtS+xgLrgKHsV/t8yubuXHtuS7frBVya0p1lgeXCdgTHLX0oFEA/MHdESScpHJcIHBqwoA7xiPlz6k7ta3O8QoYmja18trVdDZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JhhjmBmI; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JhhjmBmI"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d311081954so49544061fa.2
        for <imx@lists.linux.dev>; Mon, 11 Mar 2024 04:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710156041; x=1710760841; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zef0nzZ2xvfKTTGhbb7RG1PfMMOjv1sjApX9pDJjmRc=;
        b=JhhjmBmIBtd0eL6hCBf5WC2xmgF4p9qM9z9l3xp3v69R1yTZTykeiV3DRcBNMnLvJw
         vEihQeZSvM59Kk0DyKM9Ti+1pN7CQVueM86t8IrwJ012IzXJIg69+OKjCxzUHMbcRFv9
         E1CkhgdoZ+3OsLF2KPiA08aJxgx9RFzgmPj7vslMHCE7AnowYWj7hyWo6Za+1CGO9MDN
         aeJkA3x1Z/f3/6wGBEODIW0KoahR4opYeoMLJKrc+zo8srEslEOFiF69Rxj/3ASKmqpu
         jdKZYHAbLn8t/y7xC2dVUOBrF4yVxAPI6FcPKy6qRrcvmYiotBmGbCMa5Us1wWTQcxAN
         43mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710156041; x=1710760841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zef0nzZ2xvfKTTGhbb7RG1PfMMOjv1sjApX9pDJjmRc=;
        b=Oq2FK6LVQuPWk4LtwkYTeFI1UnY9GIeNrFfXtjP1aMifA4pTw/au9EAVi84JNYri3F
         7AkPjC2Odc+mSo+vcz2kcXLzCVT0u+BRH3Kcpwk9DwfV5Cr1to+2pD9GgxC+Nj+OKsVA
         pqczNEu7gj2tLWFaNNEIZhtVBvdbXu+S0rXX8KxarKeuUyeH2dSqiJLfqaGmxywqWWXW
         DEEr6gbLFBhZ3lOslFgqLD7/8X2faUFy/3MKaKC8qyc2J/AOmKAXgZJBzike4UzOR7lO
         8Z8yghMIKAMvhRi1LuGoRXOrJsLPXPHuVdbj33nKquTUy3SiXqHZW7nvOWyNzvqvzGYO
         /x+A==
X-Forwarded-Encrypted: i=1; AJvYcCV0C9pHieh0IXneIs31a2c8dIUI0vwvaYqbIQTGzL1QYA6wNI0QRkQeCqejx6rastavkY+48mBRkCs6OKDiVchhhMF5
X-Gm-Message-State: AOJu0YxQ9aD9SIsEN00FsYky7KYVfYCYrpsF9vgJB8YX4SAdI3YI6HwU
	he3ha+2nANyadQta/EcdfVnw7xVg9sT90AhzksKLE9q6HeafdzM+htRDVT2Tvjo=
X-Google-Smtp-Source: AGHT+IGayv+PpX9zAAHSP8SflubaUb3k6JWZQzkHKZXejF/ylBMmobaETzEOak+dTBGpNFNxaR8l9w==
X-Received: by 2002:a05:651c:1a0e:b0:2d4:49d2:a3d1 with SMTP id by14-20020a05651c1a0e00b002d449d2a3d1mr187992ljb.1.1710156040918;
        Mon, 11 Mar 2024 04:20:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:20:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:11 +0200
Subject: [PATCH 03/12] drm/imx: cleanup the imx-drm header
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-3-e104f05caa51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ur4bgiHo+4NL+0zs7qW21KEsP+z03vz9MHkP96MxsJA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukDYTLRCINK5qAZo9ZeD9v6zVyvNykpsNtd3
 gn8XZDNDTKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pAwAKCRCLPIo+Aiko
 1dGLCACi2am7a7E0ilLnUCgllinsWaJWythlIwTcuZOie4ikmbjYL4Luka6hmBbxx7mzPZT0T9K
 /v61fhn0eAbp3pvUrj+2Bi7N7fUszoaqRnsYDUqNThrQmNXrL88AHRHWE1KOKbcwVebi+hC6sBO
 dLiKou1b7bVLZiRbw14yy0IHSrbye1n0k9qq7gGgXwpVJHrEpFu7hAr/BlCrzOUCPfbS1MDOB2z
 O+hzrmfY5oZEcT3HZxr6QYeanQaye4pmmFnVEDe7dQUy+pbgxzJ3tNPyzpus3pVYQ6GikNt3bXB
 7kiBHQMJYPpISn0Zi75Uc3XnIq/neudkPfEOQgcI7NSUXFA3
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

