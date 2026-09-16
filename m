Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7D9391E50
	for <imx@lists.linux.dev>; Wed, 16 Sep 2026 03:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529628; cv=none; b=mkQxJAn36l+KXP6efPS5jtdL5ZCMih6EptyDiku/JIyVUedUiynzUeHSSWUI7xSDnAk7OyyXeLKSsk2zhEJnsBLULvspJWDMIoD+zHLJKsRUiuQM20IQgnp5WPwSmQHxn7jf3q1MyvAjPlRmWB9IwJPXPSFX7cWtNDk9Pl6KQ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529628; c=relaxed/simple;
	bh=4OYvQ72/SKMSJjpx0h+y2ofjW3s/V32EvXQ/gsEJdiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jqmpQx/iU3hGbnrXx2ysFkq6ss4xNjlUNkNu7C6VkY7odOme9/+05Do+0NfKXKNZFDicxP9zCTiLEqoinFp5q7Anpy3TcFr1ZsRZUlw6hh5r5Jb7/G5phnVm3SQm6WC7MxjtxTbaOTpckyPXd+qnkZ7Sa+ZSTDp5L5kwXyi1jBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=My+4johJ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="My+4johJ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso460303a91.0
        for <imx@lists.linux.dev>; Tue, 15 Sep 2026 20:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529625; x=1790134425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tuWaqYdx3lVj9cpjPj9FHjq5qpjsbWLYsj0P75i5UJE=;
        b=My+4johJ2Los9Oc7ONqfw5GLhK8VL6k+racfCspYrSha4KnM8yQBzgNjc5/qIbraX/
         vK7Qj+mq9n+D43vP/K56S1WaH2LBSWPQTcy3aYFul9aGEUTRVJwIPEkrnn3bomB621MG
         VL39k6jLPF2CV5uGsk7AnVaugXvPgzfpGy8RM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529625; x=1790134425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tuWaqYdx3lVj9cpjPj9FHjq5qpjsbWLYsj0P75i5UJE=;
        b=gFNP5Jea3nyjU15r2XvaZ7zdaao1lK7ktCjNyyciLKiKfOHuPKf2IQrBBsUpXNleru
         +3nMMSq17k0srM8xLGBU6wRFEm+NmUykvcWamyTtd3GTK/RHqVW/nV6qGrA39imwNz4g
         ejp5JPDlgZdzUlY9u+C3XTfMDRR+BN0GAY3dn/sjzQZNOy6C1Hafz7SKjRuGhMzrfiEj
         HFWzlIaFDmSZPVYiJBt/0lhJXPOB8BMC+dO3Rz5qPwqQSbqcoAnvpKvEyouOgFkAgNI1
         CdYwOUxDknzswWKIFim23GDV5gbMgaxZJeB4+sUglWtMAXCZfe2v5gK2ahNTBKoCvYC1
         xmBw==
X-Forwarded-Encrypted: i=1; AKwUvBxCRtVDAkO18Or6J94lNEi2WKVixgWhjhl2IIC8lFrNOiIUAEq1MOqc7NAq/5TWVJu4Bf8=@lists.linux.dev
X-Gm-Message-State: AFuF++k/52e2Y0dtPDqc0t0dan6EY5s6cFOMpN5lP/+jcvNjDTcN72wQ
	P7/ffTnqZI3Y9xRmpcZI4UBOnzBXharfWi0y2fpikL/6Rhv7HbuKRO06Tf65VEchVw==
X-Gm-Gg: AYBFou2B4Y+jiWZbcLZ65xHZx7S5KcVBzhItamApFAmfzltRJa1I++eoNooeS3tE1lU
	gTf5rksoMgtB92YPqiDn67pxkil5Fps7wYBcaUbrx+qCYIZIdPWzwxPeugqx6bPpstf72HsZO5V
	23Jm8+O2PFQbSoRhLdjpHqYLRMxvOd898EEI6e/BYFjaa/HFDLDzTQa2WsLr42QpyWh/AUd6ne3
	vxQwMHQyTkI6rgK8t+cb0Wm/td/564o+hRzbUCIyduJMIMpaIii+S8wO4+S1Z/jkjpImlMr91A1
	05gPDKLozkrGk8H+sBZx9jwSrUKwfFEp6ncu6FZbYDs1HsGmiSZ7lOnvbwiXR+6Pe/+eF2wG3Wx
	A5X1Sl+b8fgM9F/5duDelpVv4+bw19/YS3o/u7kMlOraiNUB3c1cXBy2lIIW6LiI59/9EslPii4
	ThajjQegfX9MnJfPUP1lqzM1TWYWhJSvOeyB+f+ODQ0oVjI8vYMvyt2r7k4syQV42bQn71wq1Y0
	0b0WXVB2MY2SvdFS0zkQGm2nfsr5QpW6BvRtrvGCeRnZYONoP8NQsChnQ==
X-Received: by 2002:a17:90b:2604:b0:39d:f114:8f7d with SMTP id 98e67ed59e1d1-39e1e27ad34mr2355684a91.3.1789529625104;
        Tue, 15 Sep 2026 20:33:45 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:44 -0700 (PDT)
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
Subject: [PATCH RFT v2 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Wed, 16 Sep 2026 11:33:23 +0800
Message-ID: <20260916033327.3054126-3-wenst@chromium.org>
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
2.55.0.1032.g73a4cd73de-goog

