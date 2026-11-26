Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677223;
	b=hSB4o8oDyVA+lqnfMTqFcEki012We2IZU1Ej/CBrt0vYTdO17JIaEki1i6ygVx6mXyNt
	 XwgQCN9vwYXwNsyzNcp+/qTXANtgiYoJpPJxaqHnSavbpTFi+DXWLCcGdWW3Dc/80cDDg
	 FXiRS0Npq9CEDfNvu6zUfZW1kfVf7oW82ou+HxOmZUVhu0aAFcbUx78GjvuUqFa1LC0Q5
	 DUAAFG+6go8bVudZQ9IhvYGCbF175+Ftx6EfXLk+A7/Xb3oNq+ABy0CdsPaDdvEuRGV0a
	 9R8g04ezIPyYJNcwVsp7g/LpXMiY/xEiMHpAnFdSAfwf+DsFIPTnPb4CUgP9hVQvVJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cQV4QP0qYKuYxZ6jnr2bO2k6G5yVFMpzRyKHmSwnLAg=;
	b=NBWx3JtKRJSQYG4SQpbgsB6e++aygKJeiqeFp5o8oLI+V9KagRsLMZ6qNly+FIEM35Yw
	 zsJnPWfrD/vk0H/BQC8dHEiFOLa7shdpYVL/7P0jGOkPnUpSPABnlSTLoCyRr44neg0PW
	 m8SDPCEZquVwnnL9JDkjDuvuKFsxI5ZiXsFuTgyRC9xj1lMGbcKlqG4ZoaGY3GU40hCOd
	 ZtW4qPxj9hV0Ilsi7naBXwZRYRBcmWXO1G2AMVgUePHo3yOhX5rzrT1vAxmIcaRSE7Jg6
	 N/Mq9Ep67jciqCIo0kWkfOpt2w3/SLytkpewqQTrA9zyUoSYgzt5vh3ycZ7hqjJxjqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cmMh9OXF;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88D9606A323
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 07:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A88D9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cmMh9OXF
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso2652318a12.2
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 23:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677222; x=1796282022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQV4QP0qYKuYxZ6jnr2bO2k6G5yVFMpzRyKHmSwnLAg=;
        b=cmMh9OXFMXvJF333soS+LT4A49X3NbmtXHv6eVccZYNuP27l4w+Ty3HaP9MJQaWY8H
         6DThb48yfTpdfTKMHVK2uMNuOPHGxKCa39S26+ln/LRGoWBpYyHokjW29ieRmCkemvAg
         AAqJnj2R6xeOuYKf4W+PclXtT4Nf87BPwNtRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677222; x=1796282022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQV4QP0qYKuYxZ6jnr2bO2k6G5yVFMpzRyKHmSwnLAg=;
        b=LJOqR6d/Il+pDrEKJsoqmGlWcLBWPrwCPyJarJXdy7BlGD0t2h3s4kIMK4pCF3JFkm
         2BpYf+8Kqo+XLpjuDHBSaGctxNw6uM+aNFdRMqFCMqGu/KCEK68VO0S6qUpR2ERKp/0M
         4gLAHvz+ZV1S+pO26Wlt51Y8bl8pQE7alClpJdCAm6dADEYQ3Y9T6yF1iRRX9yOuoZRA
         603CPMWNQ8u04iz8rZRMa6IT/1S8rpSzyuLxPq5C7TCeiReWGQHUB0y9HOLVUT01MOCt
         j0wahgIg/h1n0WEwkTj5I8KPsnIfbPRlqRnuTB5WECx5kIHHoeN5qZK/TiygyW81bD8U
         uJAw==
X-Forwarded-Encrypted: i=1; AL+hErHyDJK+QyYVVzUvQOK7EGKcCZ5X76bx6RlR/Pf3WB8/Dr3ld70+pC6wn8SkZ1Jz2C0oCz0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8zse54kMluOTERaDltadauQ2uapzGFuQESudBjDeeG4tb1WhaH
	Fl5ZJbaRitTitxIlZkApCfFjIoiKzVppuMmVWrXNyvc/63IMG1OtjSxANKtqzKrg5g==
X-Gm-Gg: AZFdTZde8TZpu0L77I6ZtYlqqSBx+yfJpWYcyo/0Pb5ZywD+I4K8C+V+DIeJw645dUp
	BBzXqBGjgGQe5ax7IYY+oqhxRNd1F/Mv6WeKLpjXkpTzOLnAhJUYHqnrvgn3WDRA700xDCwc1hF
	kTTRe8pdz+qHx7opPhG21FTRNAyQhUArN53VXTqX97S21doMy6uRfpEXcMjuIpqdJUKa+5NFiS9
	ia62DPmNHQVaLIEplk+zFvG2gLz02d0Q1E2ad0SCZThNJBe5yvTzGiyIiSOwjLOUQFi9NZewg5P
	eztm19mPC0gNN4A0xDx3QsyYYZKSWSHY3ONfympQpVVXKTNoKXIKKGh7f8Of0nOa+vtJp6KFBAZ
	Jl0Qi+Utjgu6sfzMmaW4U5ZWW05iMjowPzrWSwjP/KQQIehoN7I1F/gAD0XMv6V7IZo0mNLHcSa
	q9M49J0YOFkax0+mzU2TI5NmzP6lTEJUrqOmLpobJ3nF4iy/awGzwUKJgE8ewZR61rQq2OiLZ+8
	qGfFlN5JjiQe5rMOT5KGzFJmASS2rWPMrvPGVRVIGIro4wWyG+zzhL4GNxvXScdeBdca+AI2IEV
	/6lxJRkP/oGqoiVWzDECZxFzYywnwkuaJ5IQjgHqlpKl8cpzQPbtPo0SuEdA6t+rDrxRlgThbMl
	vO8Kukw==
X-Received: by 2002:a17:90b:4b0e:b0:3b1:8380:a9a0 with SMTP id 98e67ed59e1d1-3b41c95c18dmr20709401a91.46.1795677221915;
        Wed, 25 Nov 2026 23:13:41 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41ad0b52dsm33777492a91.5.2026.11.25.23.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:41 -0800 (PST)
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
	stable@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH RFT v4 3/5] drm/sun4i: layers: Fix VI buffer address for clipped offsets
Date: Thu, 26 Nov 2026 15:12:51 +0800
Message-ID: <20261126071314.253890-4-wenst@chromium.org>
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

Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
get display memory") dropped the code to calculate the framebuffer's DMA
address in favor of drm_fb_dma_get_gem_addr().

This turned out to be wrong in a couple ways. The hardware is programmed
with clipped dimensions, so it needs the buffer address to start at the
clipped boundary. Moving to the helper negated the clipping. Also, when
clipping on the left, the buffer address needs to start at the first
pixel in the sub-sampling group even for the luma plane. The hardware
handles the interpolation internally.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary. Calculate the intra-group
offset and adjust the luma plane buffer address so that it points to the
start of the sub-sampling group.

Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory")
Cc: stable@vger.kernel.org # v7.1+, needs drm_fb_dma_get_gem_clipped_addr()
Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is an alternative to Jernej's original revert:
https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com/
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f9c7f28f9fa2..67cce1b0e70f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -130,7 +130,7 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
 	ch_base = sun8i_channel_base(layer);
 
 	/* Get the start of the displayed memory */
-	dma_addr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4d3fc03f9877..b6796416d550 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -205,7 +205,21 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 
 	for (i = 0; i < format->num_planes; i++) {
 		/* Get the start of the displayed memory */
-		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
+		dma_addr = drm_fb_dma_get_gem_clipped_addr(fb, state, i);
+
+		/*
+		 * The mixer can handle odd offsets into sub-sampled YUV
+		 * planes, but needs the address of the first pixel in each
+		 * sub-sampled block. Adjust the luma buffer address backwards.
+		 */
+		if (i == 0) {
+			u32 x_diff, y_diff;
+
+			x_diff = (state->src.x1 >> 16) & (format->hsub - 1);
+			y_diff = (state->src.y1 >> 16) & (format->vsub - 1);
+			dma_addr -= y_diff * fb->pitches[i];
+			dma_addr -= x_diff * format->cpp[i];
+		}
 
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
-- 
2.56.1.839.g22a8290db9-goog

