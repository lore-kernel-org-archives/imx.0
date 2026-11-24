Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506065;
	b=5HhqcO+EV6kr0V7M7PY6oR1A+N/0WavmfGQxFkRgwVypD8Pw7+KAdo9Qo9YmwGJa+PSz
	 Qx4xEj/4yJIhr6LTjNwGMRFRaGTo67Vli/soDeTk0RHxxlpIR0Pjcp4kkqRoxI5l+8BVb
	 X85hqxAnZxAGED4HcTDrCTKvoYUEmy+X1Ix1n/cyhmG+KywC4OErWkAIVMC/w6c0ZAPul
	 EgfPB5lPuP7oLg40VXl+Ehc1Sjfe7jZ+ygCIR75AcdQo3vphzkLb/E02QDUm/1o1bC9Yf
	 UU7uJUIdr0esugY/wNr2XrNSudIBpVqzU1F91+JqhQYJ2sOyk5uiNZQZkWZXm7nyCcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WVGnOxIIOZpu68Nyn3y7Nw6nHdmb3NEH0yzfOULERRk=;
	b=KNKp6YauhAtr7FFOkO1aMWmEhXhzxDRgSEIbfkOaKUqOOokPm5kEZS/65FUw5BN7/J1P
	 y+kx7bQ951ASt7McWTjzVkDcW7u7j6dXjcHTW2zb4qgsvFMLVT3IEMueuSkRe1ZKzxq9l
	 FwyC8BfE2PEoFgZAz5Bqy7CWWCSJvnq0MjMCEzWag70FUUVcpJU+7MSX1gVfpP5c+268r
	 9ZIhM9Ho2hrEihA8H5DBn6iDnoQsJIqu+K3YyZDU+V+dZrWqJ5MWKjepXEcmDwqpcekgV
	 pPtMOTOB+XtXLj0U4T2IP5oQzX8lL7AbsS9MyHs6a+sJJoiRl8Il1v0DgZ0jTqFK8YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SAkeqVsb;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B9D606A327
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 07:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B9D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SAkeqVsb
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc751eddf25so2806788a12.3
        for <imx@lists.linux.dev>; Mon, 23 Nov 2026 23:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506065; x=1796110865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVGnOxIIOZpu68Nyn3y7Nw6nHdmb3NEH0yzfOULERRk=;
        b=SAkeqVsbIl/7H1xJmWepftNsdiymn4ArXt/ttx97/hWAbqrwOhDw5ZOIqrkwuX/NM/
         cGLQUEi8x6WATpQolGCr6Han7wgfS3d7krKpTIh5h2yzg64jTGaPHuUVIN5XDAYGO3r+
         TFuAayg6NARtMFsciaT8waP/OTQCJyiAyS5Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506065; x=1796110865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVGnOxIIOZpu68Nyn3y7Nw6nHdmb3NEH0yzfOULERRk=;
        b=qqoA5WBDN4eyYvGFI5Dal86aznZWAi3Fm6bKBgdjLwYkIgls1f7+D1vZ6dnq2rgDOW
         9Ra1NWEkxld4bpRkRgk0rpWgzxbCLAE2RegMT7zdAIlJHIYCiiaPd+wHnY1bzUxUxKUs
         z/ZCkqmHHstv0iliRNTE9pLa/XdU0jUMuMx4gkqLnaxIMv4hFNqjarXYXXwhegb9g6tw
         fFcG3LSUEvKp+buVFM3kP2YsnegSnSUlDHVZeLxtRhkReGKjWsgGhJH2Ae0lUqW0YWWq
         Tf0uZtlxjp4FxHggN65xoL0gSnGMZInT//FsC3BeYd2INK4bcyGuYLpMWEESop9kCdoV
         lk0g==
X-Forwarded-Encrypted: i=1; AL+hErHmR37TiFWFM4XJKTER9ZhWI2k7LhF4VcdVMpO9k8Ou9rdGAmquxo9QAX2XVFHwQIwxHUg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8jEI2o/aZpXDknyuiieF5E7ttSph0DZfpzakawiTqr9i7CFykr
	5kzFF21aHiB2i7AXL/hMggbcCZUvYgZyYcNhlviXp6OBbScUBuCiRCkpgMxiOIgxKQ==
X-Gm-Gg: AZFdTZf5rx2mlgajgP3JH8BfLTfo5hpB7CnezXzZMLTbW837SQTtLlHFxxB351E0Oss
	cAZY1ep/i6bDvDNgAiCgQ3XldOAl5dE4M/146GWSGJJ2whyOpi2Z3jIUQAn7j8vZkxKCz+97Bmu
	pBaCj/WNI6gp+GvLSuM6PASlQASAGA3CwQyLnU3Ou8YVKsuo9k2TAg5X3mGeHNEToVBnvSJ5F+N
	PK9xiE0pPDdQX5fNo6kr+QWs3kWgSzBryvwQ+L0NvCotjNV1mSStXzs3f0nSnVJx3YsRpHb/Sn0
	8wxjzjn3aelFb8nxz+xjnHEJ04b9wgRSRGCzmajuB1kUL7brUULonV1Vpy2d1XAFIEY1tGOY2VI
	1v4HMsbYTWOs8XzfbFObi75RhaSnEDRCDA5rTJq2d9njLkEd1GFUaTqsrhtrkh+9JbfZAIlueyq
	HGUhXhkNw+hTKJfWwZNCtA3RBTYRxk9OxKQKvtGXM+9osCWHgm+6TC+Q1g3rmRKbzMdUsNbuDaK
	YtJOSL2Y2kNcl0IJWU+H77t3RR5JDapURM3uLorbexFWgWPchnz1iefIEahUOfz1b3u6w3I06Hr
	UhqTymiyBP+sRQBnW9BtE0XAQXfsu7OnM9av+5dDjIWkQ4bGkV31/G6dTjBF
X-Received: by 2002:a17:90b:2c86:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b41c8d9179mr13079197a91.12.1795506064871;
        Mon, 23 Nov 2026 23:41:04 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b405d639fdsm24820073a91.10.2026.11.23.23.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:04 -0800 (PST)
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
Subject: [PATCH RFT v3 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Tue, 24 Nov 2026 15:39:30 +0800
Message-ID: <20261124074041.115251-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261124074041.115251-1-wenst@chromium.org>
References: <20261124074041.115251-1-wenst@chromium.org>
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

Cc: <stable@vger.kernel.org> # dependency for next patch
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Use new drm_framebuffer_get_block_offset() helper
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 37 +++++++++++++++++++++++++----
 include/drm/drm_fb_dma_helper.h     |  4 ++++
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index ab0f37d8a5ff..0aaf4926db4e 100644
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
@@ -86,6 +87,34 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
+/**
+ * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for clipped
+ * framebuffer, for pixel formats where values are grouped in blocks this
+ * will get you the beginning of the block
+ * @fb: The framebuffer
+ * @state: Which state of drm plane
+ * @plane: Which plane
+ *
+ * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, clipped.
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
2.56.1.809.ga0b61035b5-goog

