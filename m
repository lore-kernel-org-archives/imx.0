Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677217;
	b=nnaHCnIQFOjpuL6nuzsEmWqOCimKeOroabLL74O3gJ5BRrQopHKIZrYoAHiq8Rb7RXok
	 OaOAeO5APwx2Azuf+ty20VfGdRfZkK472VA7DqdN3kRGQCMFqR3gX3ZdMjO2uPXU8mg0w
	 d6zUstAagNWdrfPl5NpVp5d5PNFAwLwxG9qrS3VrbLCZfiaa/BqxlP37QiEGwae/1CAHX
	 L9ELOVEon2wkE6Qx0Zq6k5msTWY2W4cHCoIxV3JEXbzICytn2aA5a5moUHfczIqN6AIC1
	 63puFPt/dsG2BA4f0qYIa41sLgakSEZEREmV9eH/5w2NeQ4mB8xITgFnsX90q5v3rJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qPWijXdqnnf31Uvd9pQegZ3VFu+gZGvbQbzLAzg1T+4=;
	b=UN00BZNCt68K+qx6Uuebe4ZN/Tj+hZecTLmGxoEPR+Sc7Ec65EGBCvh4LUIXmd7hcywx
	 DoJ4SUslGpyALzffn3rWI+r8UTZw35L5ZGo/YVRhQd4Blyj3o7YE6Bj7MmlDlrvh5thVe
	 NRewtwYUzSNBiAWKD2bLlZ1q1I4UZz4adNzGiX74vH3lozE9LRWl3+Cl+Fexmhe4CsPDe
	 K8xQ/RgwrT4rLYoj7/hM9EE6ZdWEGT/otPQHQoFYpir54cFMh5SU4Hg6yLTTJqkt2IbZO
	 0FTN8gV2VKIQirSqXOR3zVIwfbkTzY+E0mP8SvvjRNYBCjdSdJbIs4HrLlWBYu1MGSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lcqNGbxo;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FC4606A32C
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 07:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28FC4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lcqNGbxo
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f03eeda984so37729435ad.2
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 23:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677216; x=1796282016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPWijXdqnnf31Uvd9pQegZ3VFu+gZGvbQbzLAzg1T+4=;
        b=lcqNGbxok3oK/VMhJWn+O4UYwinI8c0JoHVHMLa79quCA94boVHpEZlF+HbH3e2ec7
         iIHgB4x5AeFU0GW5dVDs5HGYMwltxeR21Xm6xp8iPwMg1Q9zim8Y2XdZ6HkrnFUxfhY3
         mxDvOtmCOhmUoXbUoBTsD9Px/NugJoeQvIeus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677216; x=1796282016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPWijXdqnnf31Uvd9pQegZ3VFu+gZGvbQbzLAzg1T+4=;
        b=MDKHp2yQKjtcSCuX9vLWEbVRJC5gVM1MO/FLr2gW3PdQQN7qqRD7m8ZERbM+RYevY1
         /m+jXvmvBUrrD9iYDEWtV2hDFE1uR/WXvJQamvMto7F7nP/IyIgJbuWaNTF5ub1WkOQ+
         Vdi36JHmlZL+YddMPmlI7J4DPoGYXAxurfX+oZywEejmApuZQtbXQygZU0lZT/G4HwxN
         3KT8Yd33LpeyXmyMQe9aAfy5DrWQggxJOBjKm9YPio5ZC075n+u7YMzVsOoAb6bHAmon
         0Oq9qElbfn/NEcbOLR66u4IU71GjPq5CHyLVhbkm1Oqj15n7FPgNBnyC8u/w43zHr7H5
         KPfg==
X-Forwarded-Encrypted: i=1; AL+hErF7k8U5aXYWnLRUwdq5g0OaDrShntZQ/GFVdzTOXo08MpLoELDklbVIXlIdbStvsZzrdTA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/V6twpThU5rkvkVQ5DLyPGHqQr73PKiZnRi4OkMKm1gbUJzJpZ
	zRM+jRvZPoEnfZkuI90Z5zlAj5qsDMpJR3bRed+DUBfyGOxAt6WWWNGPAt1/XwvyZA==
X-Gm-Gg: AZFdTZcpS4ddlOECGlRnQIBa6ogDCx6x8SU5PKokRlxQwubo2AGEkB7FgzcjRq6l+VT
	7p/0oVJathn95H/gpQXjj3d+28NXn/eiFpabQaDAigjUIT3Z9SHEF6k5xvmyiqMTnK41jwtsdiH
	yPUoy3uYfHb53Sn6XrfLuTbJHVNIqjGkXqleZoETN9vD/aE+IReoqAPywV9BVssLeJ2An8GO8o7
	vxTqNlLFcSqWKsUxhif+9EnAwBW/57DkyzTZXv/AHs/h/hPrWvQXUChTlC3XEHZ9fqbUeFLvivL
	KExFN8jLFuX6L0v+9RCUHYDl83QKaXm2Si4EmZvi8GtTM5/MWeuBp2Cvo8pz+zJ3ulnogo22s5F
	5R5+ZzFxs64DoDCeil2HNxBQfz8CxhcpvdST4F4C0rFfGC/TvolSf87Z6N7NJhff/Dk2vCOXZKa
	bwOZ4Zr3TXTZQIFmkj1dLxLMVdJrWoOscmP4uzPSg0If8+5P8l6EhbPE89mWAK58qvAPOSUVdlN
	wyFdMEEEBRZJxtHprZV2sUke9bLIU8ke1rgb42K7YS3efy0xCoC9I2DvXgFFQONae7ya9TTP18J
	j5LutZsoJlc6oTXIPbnRfQL7NkE1X+lYj3Z/Tvx6MzV4uIhKBi2v2KbNPIMk
X-Received: by 2002:a17:902:e847:b0:2ed:c9bf:9570 with SMTP id d9443c01a7336-2f03f1a4599mr214081945ad.26.1795677216392;
        Wed, 25 Nov 2026 23:13:36 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f120769sm99461835ad.57.2026.11.25.23.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:36 -0800 (PST)
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
Subject: [PATCH RFT v4 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Thu, 26 Nov 2026 15:12:50 +0800
Message-ID: <20261126071314.253890-3-wenst@chromium.org>
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

drm_fb_dma_get_gem_addr() returns the DMA address to the "unclipped"
framebuffer. However some display drivers want the "clipped" framebuffer
instead, as they are also using the clipped coordinates to program the
hardware.

Some of these drivers are open-coding drm_fb_dma_get_gem_addr() with
the source coordinates replaced, while others have been incorrectly
converted to using drm_fb_dma_get_gem_addr(), which would end up
causing incorrect parts of the framebuffer to be displayed if it were
somehow clipped.

Add drm_fb_dma_get_gem_clipped_addr(), a "clipped" version of
drm_fb_dma_get_gem_addr() for these drivers to use.

Cc: stable@vger.kernel.org # dependency for next patch
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Expanded kerneldoc to explain clipping
- Added comment to highlight different source coordinates used

Changes since v1:
- Use new drm_framebuffer_get_block_offset() helper
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 50 ++++++++++++++++++++++++++---
 include/drm/drm_fb_dma_helper.h     |  4 +++
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index ab0f37d8a5ff..789e6ac42c17 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -60,15 +60,16 @@ struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
 
 /**
- * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, for pixel
- * formats where values are grouped in blocks this will get you the beginning of
- * the block
+ * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for unclipped framebuffer,
+ * for pixel formats where values are grouped in blocks this will get you the
+ * beginning of the block
  * @fb: The framebuffer
  * @state: Which state of drm plane
  * @plane: Which plane
- * Return the DMA GEM address for given framebuffer.
  *
  * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, unclipped.
  */
 dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
@@ -86,6 +87,47 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
+/**
+ * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for the start
+ * of the visible (CRTC-clipped) part of the framebuffer
+ * @fb: The framebuffer
+ * @state: Which state of drm plane
+ * @plane: Which plane
+ *
+ * A plane may be positioned partially off-screen, in which case it gets
+ * clipped to the visible CRTC area by drm_atomic_helper_check_plane_state()
+ * (populating the clipped coordinates in &drm_plane_state.src and
+ * &drm_plane_state.dst). For example, if a plane extends past the left or
+ * top edge of the screen, only its right and/or bottom portion is visible.
+ * Drivers whose hardware cannot clip by itself (i.e. accept negative
+ * destination coordinates) should use this helper instead of
+ * drm_fb_dma_get_gem_addr() so scanout starts from the visible portion of
+ * the framebuffer.
+ *
+ * For pixel formats where values are grouped in blocks, this returns the
+ * beginning of the block.
+ *
+ * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for the visible part of the framebuffer.
+ */
+dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
+					   struct drm_plane_state *state,
+					   unsigned int plane)
+{
+	struct drm_gem_dma_object *obj;
+
+	obj = drm_fb_dma_get_gem_obj(fb, plane);
+	if (!obj)
+		return 0;
+
+	/* Use clipped source coordinates state->src.[xy]1 instead of state->src_[xy] */
+	return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane,
+								state->src.x1 >> 16,
+								state->src.y1 >> 16);
+}
+EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_clipped_addr);
+
 /**
  * drm_fb_dma_sync_non_coherent - Sync GEM object to non-coherent backing
  *	memory
diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
index c950732c6d36..b2a0bd7ef9d0 100644
--- a/include/drm/drm_fb_dma_helper.h
+++ b/include/drm/drm_fb_dma_helper.h
@@ -17,6 +17,10 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
 				   unsigned int plane);
 
+dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
+					   struct drm_plane_state *state,
+					   unsigned int plane);
+
 void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 				  struct drm_plane_state *old_state,
 				  struct drm_plane_state *state);
-- 
2.56.1.839.g22a8290db9-goog

