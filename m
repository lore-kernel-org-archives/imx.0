Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AF137D12E
	for <imx@lists.linux.dev>; Wed, 16 Sep 2026 03:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529631; cv=none; b=ZE49Zk7QFBLHkR/H8lz02T53uSPzi+FVOXAfjD3HYG04JMfplsLPHdsNCWcxgukSp7J1VOsert5xCHqS784A79z4nc388aglXcR2n/dDYrkpgup7zvbJ/6/X6ZZfPyCKRGi+14agNTwS3HYheuZl9EAFjdRnIg/PCrBTiOy20bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529631; c=relaxed/simple;
	bh=TbBricvTVGAwifGX896eoMTqhERlhv8wQE0G/lmRl+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Movlv/CWctsaAwsZtMraZtIm+D+BmvwbxOcFEGeeqZXrtFacoOlGUkvyJq6vQ2xyLFI5D0TBiqTNX+ZjNUrgQccbcE/DJ/r9KqG/MOv8+N4zO3kCVTRjbbgTlPdAKJZv8Peg2qrt78sWYgXflg9M0NXXzySpeaxCSr4Y46WxPzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SGDFbIn9; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SGDFbIn9"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so280186a12.0
        for <imx@lists.linux.dev>; Tue, 15 Sep 2026 20:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529629; x=1790134429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3+7MkmB6aG1HjinH/gRhRGDcVk6ogklV5sjoZ/OmL4=;
        b=SGDFbIn973zAnIjWvy7/yVGvWD/jDI9UFyGJYp/5F8yQ6bS03RoPzpGjeJ1gcsKUX2
         ck1t3vzAQ5NX1roEZTVrzH7JxMZnvHVAjLEVtWDKZxtT0ws1M8408THTbIOrK8J81Km2
         YWOBgl68qFSX1yALmIJ+0k5nVptioVavy9CPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529629; x=1790134429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B3+7MkmB6aG1HjinH/gRhRGDcVk6ogklV5sjoZ/OmL4=;
        b=Yn6YIJelWrxOvxx717qSVa7DdFF61pknfOEgdWtvxKond+7rJOV2J1BtnRssFnwLYT
         ATZ1XgHRQld3Esr6G2id8d5LmalBljaimHcSitSQE3xdLO9J4hk4cDR1m8wyQrU/DCwy
         +EfYGNUuEw1lC94Y8xiMboZ3mjHCYMl4LwjAkv6PvEi1iXVivI3HKsiW5yBbpgX/mcmm
         mBj8APRa5SeVAS316Mh/hYOPESR7VABzG62ZdBKY1Zxv9AAclbSXfZ3T1/sCqa3iu94l
         xk8ftEgU9y3t/IvFIqI4vtCm4wRluFMZBpYbAM2z8A2GOnQVCeplki1//Gy5UxqSywCt
         M+dA==
X-Forwarded-Encrypted: i=1; AKwUvBw9Ji7MQhdWAJOjkl3+U8fCJ1X6SiIFgyLgr8JQZetJs6siDZl5SriVXdYtcJEPa94bX5E=@lists.linux.dev
X-Gm-Message-State: AFuF++mIxHC3pkraXh4yU8JnrADgY3C8DEgKWqnbLXXNy/qq9EacgPB/
	lvlTUEBZvJC+5xnfw1w1fY8gpAvMHlHuDNJVrfPOx5H5X742A0Cf4bP1BT/GLrOdNg==
X-Gm-Gg: AYBFou29tjcLzehYSiW80w3nqDW3EL5YmHXvT3sj+mgD8HnbClN+dLeZyPNr3IjjcU2
	NpCCaobnjdkbuVZtAwii57rTrU/wZO8eifaF/uQjVOR6++CvmT6qB15IMiPWJxA74005hxlNkST
	3qkHw2WAG1HM98zEDMFudVznROHPYrbfpaLcijnozL5MGpviiclxCOJ5MKHm66KKXEGZb+aNhjq
	2qVeRgjtmrIgCLEglYFKNsnNUI3JuXsaD7wNwjnLM4Sut+D5V/QgfwEqmNLEhzN4rlCR/L+hybV
	7vjX2a6+LV6OaUKBKyiWAcwCekTsTlCeygINwzcRNFGoEbEOJbXQgdY4167WEfjatf1YYeLBfsf
	zb3dmg6mcDwyMklkKjOSX0K9uHFxf6umX/eIwd1UmHhvHEA7lU4IsobhUeG0ue6lcgFqu5FbSUD
	+R5G9ORJAnq/Ym5y2B9vGEf5a1bc/3bWNIPdQYqaUc9enPqBCVvG1A9+ct2fRSGt8P95XoApWNO
	fIAWSNoh4lxXY++MClTOnbjk5MObaRMbfH5P6iEpd3T4DRJ8hbDDUVVbA==
X-Received: by 2002:a17:90b:3b41:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39e1e48a416mr2215669a91.15.1789529629173;
        Tue, 15 Sep 2026 20:33:49 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:48 -0700 (PDT)
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
Subject: [PATCH RFT v2 3/5] drm/sun4i: layers: Fix VI buffer address for clipped offsets
Date: Wed, 16 Sep 2026 11:33:24 +0800
Message-ID: <20260916033327.3054126-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916033327.3054126-1-wenst@chromium.org>
References: <20260916033327.3054126-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
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
Cc: <stable@vger.kernel.org> # v7.1+, needs drm_fb_dma_get_gem_clipped_addr()
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is an alternative to Jernej's original revert:
https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com/
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index bad102134726..530efae7e13c 100644
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
index 2e9cda45c04e..7a1d5f1db037 100644
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
2.55.0.1032.g73a4cd73de-goog

