Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506071;
	b=yoH60SruSHi6Fd1dtVak38kKpYeBv/4XmpO8sAbuZuqnj2BwBNrC9qU76CMIBfE4ysL4
	 Gftw6Kg0nt9fwhUMy3t0l0wjENWIIaaDHV2QacKlsvQ/3qH5DC4WWnuGCVTvVEmo54s2j
	 FBI7xz0OrllLkzjwf23cTlfnrWGNl5sX4m9vLEyImI55r9P93KG6Zc5tSZc24jf38qrbr
	 89/FcQN4PcOcYeR7varPdB7jyXS7L8mhr80ypBkO0odgdBnQ6GKkAXktwJ7c4kxhQljnE
	 fp0B3CdaXJO+VsHhVm8y6Gqk5zf0D80xy1rnNGBUdd2ljUnA5hvF1uWw3ts57Y6Vcpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZnUOXR4q7AEOdZeeEt7YaH+i+q8V7R+T5wpH12+fNyk=;
	b=sb5apRmEM1on6hxLM10AO8DXArEm1tz8zTFWQK1jV9Zoa43UPie6RajSGA6r86FnMTrg
	 lPVxZKqVrNxfyf678LQIdcjU9gJi7XXhCBUmidCpZB7yV2wguAx5jiYl4tX8e/qzjgtKu
	 rnMEmSH8KYAjhyDlfDCSjY685Z3C1hj8RLtP06zmM71jc9DjmKCR0eooARujEj3kpDxga
	 aQk9wI/UBdXBEZGZhNUWk3p8ZuL3Nys7QdxmzFmc+LjNhCQRZzMXuWwEQph6PSseNNT9d
	 3PMvrT9mLyTuGPhpGoF3dvqO9tv9CvUc4KS1yDDQqMVSaEmWWTMeIq96Rhp7zquI/lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=b8x46XrY;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E56606A31E
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 07:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E56606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=b8x46XrY
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f046b0adc0so21557355ad.1
        for <imx@lists.linux.dev>; Mon, 23 Nov 2026 23:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506070; x=1796110870; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZnUOXR4q7AEOdZeeEt7YaH+i+q8V7R+T5wpH12+fNyk=;
        b=b8x46XrY1/atSUSyLUoM/2eaaylMsYFMHPpmYI3q1FkVxHVK4rktiHUkcC+zRxQsMy
         In8/kF9J5ED8bNcCubm678wsq7mB7Xl+pd+Q09zpYNQkHhPJTquDEBDY8pw6rQionpIq
         VM/A0AtrrPBY8HXo9rvTjELAxyl3DEAdU2qKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506070; x=1796110870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZnUOXR4q7AEOdZeeEt7YaH+i+q8V7R+T5wpH12+fNyk=;
        b=TaacmGpXWRuaz1c/oV+Jyq51F2jQrfHxwmdU0xZ7LvjdGgR+qko3zin+wa4LOOUJJg
         EAnP7UbISOZ2KcrOOLKDpbLCOQa7CHPwE3OQjPZk6Mw6Fc67mkqcXxINRjXPE7lN12D7
         lZtwyvIyJOJ8pEx5VcwYkLJN1R6uQjL9Cgbv2uolPeQtoKRezp3C+oBEKZ0YWg8RY/SX
         F6htB8MCnUMKim6VMQs5h1i0CO7BopkEbOxX8Hi0dy6ol6hsTswVvTsTChmM/sPCgUDF
         28bxcvI3NH25bW+3kHxRmzpgH25jXJd7ea9Hkhr6EMFhhFJ84/gqDYwGADOqL48ZMg6a
         Zvbg==
X-Forwarded-Encrypted: i=1; AL+hErFeYs+uIMzUcnOIKd/dGEJJjnfrUnAg6pe7OC77fswpUqEveuYtXyjvcbRkCheLtM2Qkr4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Vpl4lX5pm4GLSustlS3ZerYPopR8MxvG54U9kSVC8iCf2TgKa
	Ry37XMFcIOs7Ectyy6VJsaGe4ImCbwFixIM8nKtKoZIfppRgY+Qz+jqWIQXN2C8A3g==
X-Gm-Gg: AZFdTZec/pesWZ6AAFacs128/hoHD+ZrXTJYfVPbKBojyJOIVGlSQsicdL5ZMUeKL8Z
	+Ox57EvLJitNNCFYtjM8hcxpWGsUKzzYsFoEWWoAVr1u+3uFxYWhiikGDtliZYktuT1vcm0QBWh
	yZOeL3h1g/0SxWEZLWYDMJw1SrmzYyXyuD835prGBcxDWYTr7V1B5kzCcc8Q1HBYCKGdtBXQxsZ
	hRNADAsrAYvt0BLSuTK7xVx3OsFDrkWrPfRV/t/nMe/8VR8O+2g3FZ6DJR2cT1DwZNLJ2lbBQ5V
	XwEb4TJL9NxGSEGzTuViBzLFUjng7W6mKZveGP87m+ZhqEbMkD/dJSPqQgJfDJ1mZZ9DGuYo18b
	p5KPZ/z+KIL8Ri6KgBLJblHmFP+5T8N9RF9QlsJx8oZIhiUKTgGI7qNaao2P2z3biZFrWc9C891
	OvxJcJ+xBG1pCVdyPiwcHQoCBnpJ2g+W/01TTcuwDyn6MEG9lArnCubI60/WhuESvA10C2WdvQQ
	Qi0mGMwLv+axUqIJ4rhfnmXQOZk1Lp+vG7+xcTol7ALRyD2PdM0iXkD20L61vioKIk5S/BFhqhj
	u+VRbQFbzdgLtXLRfsZ1VsyyP7zKG1QwEdvJVhRlwOEBiCIS1SqflHHAbOdG
X-Received: by 2002:a17:903:298c:b0:2e9:5714:6075 with SMTP id d9443c01a7336-2f03f117c82mr126158455ad.17.1795506070067;
        Mon, 23 Nov 2026 23:41:10 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f04f6049dfsm55300615ad.19.2026.11.23.23.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:09 -0800 (PST)
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
Subject: [PATCH RFT v3 3/5] drm/sun4i: layers: Fix VI buffer address for clipped offsets
Date: Tue, 24 Nov 2026 15:39:31 +0800
Message-ID: <20261124074041.115251-4-wenst@chromium.org>
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
2.56.1.809.ga0b61035b5-goog

