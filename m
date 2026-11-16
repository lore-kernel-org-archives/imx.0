Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831114;
	b=ixedXa7gAq3W7bdtmAq4wsaRTeLRDpN2u/Y7klSgjx8X6dTb/YGlKuWwsQ+JL0JqOv4h
	 RZxFqCuDWvn2qnw+ZxEO2CTcA9pchkmr0GrQ2zI3R/sY/nGP9Hs8scIR7ZymjJflSsuWm
	 Je9AVP2ozBEaE++HUMXM7o+81do9ixly/3nOVg2nm4qbzUZrSrqKY4B8XS2yd8yHkw8Pr
	 2PCMTLv51bEhSAzUc9zKv+UZDxCXfP/ch19la4PhcKc4K9P5RrpmvmxWW3WBPOFIpPfFB
	 RYeZqXNslZhL3E6PLqsUwOT+lqn47GakJWFaqEmdfyG2GK0ObNlv5HEMDECCcYmCLXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Mh+ToPltBb8mnDHqsdQlNCdlhh90EXZrqETmJQ+oo/w=;
	b=W54yVD8Yx3MLh816V3JBice1Tcc1ogsCr63tHz7R3rLlfcUuEuBmhPlAieQ2x1wToFIQ
	 WZs7ufkv967nkSYoDXQEJOW9l79G118IEm8H8xDtZRGYAd2bS+dqRdrvbWvd9o1CN2bPl
	 Asxaz10DdlBbwHZyOdvU4EzcqK1knris3E4OWgaILX8p6UWiiVNAs9i9yL7tUFZfKmlsT
	 14pWlxcZZU+xnct7Z8XW3YT5cLgmsSxam0aUxo0IlwCKNMe4r358C06FKXxq0V2UO1ftB
	 efHahiqbcIqepLhHeLw+GMMapIv/oEv4tNNB2xmSsnhqMmb5Fy4EOkuJosk0uLMqLyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DN7NQGhc;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81587606A336
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 12:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81587606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DN7NQGhc
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so41792335e9.2
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 04:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831113; x=1795435913; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mh+ToPltBb8mnDHqsdQlNCdlhh90EXZrqETmJQ+oo/w=;
        b=DN7NQGhc/wHKER/VCNZVQb488dKxxAzV4cIxfQ/MKOuKXFvA74JZffbd+z1RUfVw/n
         Z8HslmuFZW3EblrzZGpW++IQmbbWo5O9HK03cnrE9/6bnt/p8zBJqTIOMUKy5nbQ49yI
         d6OSkWTXsDGR3Zmw+ZDKLxxFSF2ogi8UCUNAoeztCkKCZqNtW7fePTooFFpVfaeXjrVw
         v+R4wmkbcaGKQCYdrFKRuJVFO3a8RdAcaVTNBQT1Cnh+B7Uz9jdZYIyPz4GmGs2g9QvM
         yCp5kJP30VNh4nyVudZ6lPXqjiEdT+JNDT4RfaAB8TJjJSJb9fIvCnILinv4OycK9kJ/
         k4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831113; x=1795435913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mh+ToPltBb8mnDHqsdQlNCdlhh90EXZrqETmJQ+oo/w=;
        b=R6PZ706cFis+oXkNzxLaWi/coI+Gke0Unf3Q3xnfjFzl9mSGhmVNuG0tScTgbE+hn2
         m/Bnbjyb3Zsi7EJpoAgTwhScX0+jctgsoMu8mV0CCgUeQjiKb/9J5pJML2QuAzEstKMi
         8Djq3k0/JAEJx41JK50pqfacYbXF5aC/C1RyOZcGiLLCflRMiKf03ghVBjCYue8YfxRt
         llVynIPvjx8lEbJKUQqaRey+sQDIpGoZqhwCCM8NtF7pKy1UVP5QJz5fq0H+rcjavjod
         I02cUKUN1Re4rQAJP+q/vuD0yibupaQK4cOsloQAJKDJLYrggfkdmOlDew/qB7wSw4xK
         m15Q==
X-Forwarded-Encrypted: i=1; AL+hErFI9Fe6/+0bkEqHCqiYZ6GcoV8Qcy6FdjRk3MmPrr2/MLZfgLVp8WQ9HOiPXjnqC3Lz3vs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+RyGr/w2xcDWNRYYx+YOQz8wbGcQZM5doxO9mvXJT2j7VN3j7D
	jV9R02bfGIqYUjcd8E2O0y5i42cjHePfT2PXXz81runj7Bmkibf+K2lh
X-Gm-Gg: AYBFou0b1NcIGpEI035z/kLkK7oR8O02SXX6ThyheZYA3832E2UYnuPqv5iLBOOuQTk
	yXcBfqdqxf/tmhcC3HCBeZCC3dZQIWDv9rYWYyjRdnaxRfFBReQYpFEmQtJXcVPr/cLph37l8xu
	rZ8quWSI6G3jRM6uqR4XL1Fnajctkpe/YVnEIywvUnjXysVZLJCPB4myZzuYj9Si0nWjPuM8L2M
	kTx4hzRnPan6/7n1nPWANh8NXwfmq9PmS7zhCpsoeM7xGqASq8bIr4AqCX/Zuw6CXowrr0i3qS/
	cOMi3G4wDfVJ1bjV9WGmEO1a5wzW6wIhlPyJheOE5MoptbYroFL48spG6rHW23Hdfg5MntJPgih
	VwFBcQrnaz9SQ69Y/QLbuXoRsQzA+8LRxg3May2eMxDsAO6JaqhDiCS1+rn6B5JkGRkYapZVYxi
	xCxIC1z/nPv2ZWfrYj1QdHMMWZm1Lf3KpvioyqB4pSre09vyKlHfcFOtjz9qLH64h7uS35yAHD1
	DG01ckoh9aYfQXX8vEfI8UlrlyrccE3CZh3/dbgemfALQJzcD5ZE87qMuKcR4VdU3ke3xvgUonz
	lWpyMAbK+/Ke76ogEJI1XcsvcmzAcZmCocEfSNlO0RvSRufkWs6oRNwomfpzGL34hLivAdq1tQL
	OAIddJQrmw17euESpL69GoTCfmGE2QFUeJooGLJ5bQxbsbjc7JL0aBb11SdA248qym+eV5ngC
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb69b2d82fmr91695095e9.25.1794831112818;
        Mon, 16 Nov 2026 04:11:52 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm61442005e9.5.2026.11.16.04.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:11:52 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 16 Nov 2026 13:11:48 +0100
Subject: [PATCH 1/2] drm/panel-edp: Fix Innolux N125HCE-GN1 mode
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-reform2-internal-panel-v1-1-765cf8d5ff4f@igalia.com>
References: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
In-Reply-To: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

The mode has a pixel clock of 162 MHz, which is 70 Hz. The EDID of the
panel only has 60 Hz and 40 Hz. Output of edid-decode:

  DTD 1:  1920x1080   60.001038 Hz  16:9     66.721 kHz    138.780000 MHz
               Hfront   46 Hsync  30 Hback   84 Hpol P
               Vfront    2 Vsync   4 Vback   26 Vpol N
  DTD 2:  1920x1080   40.000692 Hz  16:9     44.481 kHz     92.520000 MHz
               Hfront   46 Hsync  30 Hback   84 Hpol P
               Vfront    2 Vsync   4 Vback   26 Vpol N

On the MNT Reform 2 with i.MX8MQ the picture flickers at 70 Hz. Use the
60 Hz timing from the EDID.

Fixes: a14c6b0eef77 ("panel-simple: add Innolux N125HCE-GN1")
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f7add22ccf69..0ebd756d14d0 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1364,15 +1364,16 @@ static const struct panel_desc innolux_n116bge = {
 };
 
 static const struct drm_display_mode innolux_n125hce_gn1_mode = {
-	.clock = 162000,
+	.clock = 138780,
 	.hdisplay = 1920,
-	.hsync_start = 1920 + 40,
-	.hsync_end = 1920 + 40 + 40,
-	.htotal = 1920 + 40 + 40 + 80,
+	.hsync_start = 1920 + 46,
+	.hsync_end = 1920 + 46 + 30,
+	.htotal = 1920 + 46 + 30 + 84,
 	.vdisplay = 1080,
-	.vsync_start = 1080 + 4,
-	.vsync_end = 1080 + 4 + 4,
-	.vtotal = 1080 + 4 + 4 + 24,
+	.vsync_start = 1080 + 2,
+	.vsync_end = 1080 + 2 + 4,
+	.vtotal = 1080 + 2 + 4 + 26,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 
 static const struct panel_desc innolux_n125hce_gn1 = {

-- 
2.56.0

