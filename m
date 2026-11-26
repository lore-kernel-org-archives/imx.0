Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677228;
	b=w2FbJQD1wTwY5uWSE3X91e5pN/JArt0Xy/7PoFtif9YwMoZM6qFCpq/EN7IsBqq58xza
	 SUiD2tdLbMwh9cs93CC5WrIYgtMKcjh+/NqcYVGRWcWI2xzIKqrieffGOqEX+4aT0itOM
	 lpIj3t7uebGOXeWnYui7Hni1RILgxrp+rfczMWdEnhotHuQ2ld985X55MXY4mz/FXdR3h
	 nWU4H50r786w9Pc7Y2Vx52RIVPGETV0In/ycr/XcKk0qjune2X3XShK6ov3/171kncT7F
	 T/cIzR+w/z4/F0igN/AVT0wlhXjnH63ilEjCjLqGmt94sG2QVBIU+XG7J6jYGLs51tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s+aLuJucBwaSWJgFUDaZ/eOjRwoee806v+5/S5Iceo0=;
	b=qSZxzsPnXL0CwkraX7hYjWwDZw1nl+gEU7tDtfz3xDQOoOqcnZqVgN5YlGhlaqIemBss
	 POGo/HJ5+U9Adcr4Ni9LiOvNCqywr5k/ZG2EYrDb8DBT87CpwKTJl6/bLW1IdRKJobrLA
	 O8p0L7fBvDhLZCaHZseRibK4FVHarUENxE7OiyPHzp+mJVPWdeHhM+s3l+M0RgqNVJ2Rx
	 w7YWhYmy4igwvTZQ1aXOYmvORMnIZR3vQL6ZgBUGdMAHIOlR0FxgzBnk4gtUp3FCriv1x
	 V144eEm0oRnIYieOYdDsaEXXVKb8bCBF0CYjzdEpmr/eMKjWe54ubgeZW0FTHoIUmBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j0Yfg70j;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55850606A326
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 07:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55850606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j0Yfg70j
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8c6c06b3321so5348219b3a.3
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 23:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677228; x=1796282028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+aLuJucBwaSWJgFUDaZ/eOjRwoee806v+5/S5Iceo0=;
        b=j0Yfg70j3D7YoZlp5dH+DP+HhG1lGBqwxySxdioM3B9oueaBKBaBPf/O3NkdCrL/Qt
         GyFta90zVRAnn83as52GRg7n9zeT6mbl7lTnaQXxwJ4HenewtJ6LzAmIPHmcW3OQtApo
         7UEJ/UvtySEBPICtoRlLZkLxG4v8IhLT7zAxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677228; x=1796282028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+aLuJucBwaSWJgFUDaZ/eOjRwoee806v+5/S5Iceo0=;
        b=ocViVoQK9WIbf1l95f7o5+UVE1xIIOmAZy8ru4ELNKy2dDddIQ3RY5EGut9xoLvFXo
         xUkhneccCkZpq3McWWp6mf7CtJea0WFDrKDlRPNTMScRfkCbDXfF9fl931D3MQqNLsuf
         lqM31e10uqxZfLSSRTpzpgQBfPgMRs1E0X2pOGAYOgF19VqBhMk2SFte/HRtFyHHihoa
         Qf9yrSX+RYRzC2QihYvdtWWknT72b3g6XA2qpBSRDZhSz1A4mLxjolc8ATULLR7X30+/
         7329JBqoKulYbt+XE16ViShQ2VgxP+FIT4ueH73uV8rucp82q/vVRU3EDR80XAFcwhHD
         BJCg==
X-Forwarded-Encrypted: i=1; AL+hErEtW97uis9FhY2hIZKxxnFlcb/M1ElYCbB//kxS+ffE5kmICOvAzfi8H7b3CkVP0c7CmWA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8k4H3o0ISJ7zSY3Gt4nDqYOUDATjMnLtlFYsXf5E/VTD89AE3m
	ZqBLz1THSsbiYA+Ze3L7icNrN6V10y3CcnI1z4GVTRvgqp8DC8FKNhDpqGQ1b2twiQ==
X-Gm-Gg: AZFdTZdweF5ah5Px2H3FuypGvg5NzObnwsxWRRQ1Sv4zNoMAKuR8xADwebrk/WwtO6K
	0K8jCi8OCrY0XaZMk10IhJcEJQ/4plomwUpa9iJ/JYXb/yrYfQgxsJzbY/+aOGSWEgft4Awqzfo
	s0fZ5j3YO4WLojQtlA1MmAaQfcfIVuA0iJ3IbnjNU8jeGP82g/ZWI+m0dOURBRYGDy3hnamdlWg
	crTqfoT4pVaNk0MsSleTphjNsRdWbiCOgCWSaTc21ZuoJdYQncycvPWWvbo1NFYx6FluNVR7Xm1
	eGcE9hZXwRrZLGXveiJXBs8bEiaK7SF7UephoAbml+/4p3N+mniRUEgf1kaiZFS+6iO9n9n8oUP
	KvZeqGAsrp1RGQctrfw5maG4GoJGIJ+0bf/IFMESTfZbiqiN627D3AXGZzDEtxxMlCAUO/Z/6uK
	TL3hKNb1xzLn1rJEtsK4iFFIFUZ4+aPvV5rsY5W1VisB4pNgf700Sn51PVaaJ5dh/WN+a78pNLU
	/8AKuNYd5KyHeusaC4rsbVueoBlLXEKsU+sSmecL8ypVXinmncJsdBDGzRCfDns/XydeAtmT8Eh
	iqxHu8mVxSa+vMe+DVEz0MH4x+ZnM1GW7DV0rnnkMQGbZVjSc7M9Qq1003OJD2Oc+CUNUFuBS5C
	u9xzGiw==
X-Received: by 2002:a05:6a21:3f94:b0:40a:56b8:2551 with SMTP id adf61e73a8af0-40a56b82debmr793737637.17.1795677227780;
        Wed, 25 Nov 2026 23:13:47 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8cdfd2d2fc4sm4664437b3a.49.2026.11.25.23.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:47 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH RFT v4 4/5] drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Thu, 26 Nov 2026 15:12:52 +0800
Message-ID: <20261126071314.253890-5-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126071314.253890-1-wenst@chromium.org>
References: <20261126071314.253890-1-wenst@chromium.org>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hardware is programmed with clipped source and destination dimensions,
but the framebuffer address is calculated using drm_fb_dma_get_gem_addr(),
which uses the full source dimensions. This will not match the source
offset if the top and/or left sides are clipped.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary.

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Cc: <stable@vger.kernel.org> # Needs drm_fb_dma_get_gem_clipped_addr()
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index 62dd0576fadc..35eb5039f5ac 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -65,7 +65,7 @@ static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
 static int dc_plane_check_fb(struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->fb;
-	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* base address alignment */
 	if (baseaddr & 0x3) {
@@ -146,7 +146,7 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_commit *state)
 	src_w = drm_rect_width(&new_state->src) >> 16;
 	src_h = drm_rect_height(&new_state->src) >> 16;
 
-	baseaddr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
+	baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, new_state, 0);
 
 	fu_ops = dc_fu_get_ops(dplane->fu);
 
-- 
2.56.1.839.g22a8290db9-goog

