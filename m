Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677211;
	b=KasIetgtPk6S6pzPTco2sx0kdOCnMn33C6zUFaL1qsnhebMk1rTePfA/sH2j5saEqTVc
	 CLE2ge2OXIwcSm8cxubOjpg9ebxyVdt8m5Oy7DsFrGmg/FWyMreMiYMnyMJXl4aw6+5if
	 /Tlih4YMdS41U9ZB1vGZ2vHlHgsyAMt3ErRK2WEmEJO8Y1VYlFQ1lFgXylfuYI2JeqpjH
	 AGYdqJbgBVx5Bb/drfEABRezLUi9QXTpwQMcfoqAq3dRRpO9+7NJ/xi8qm4u6XF1ZrElg
	 pGyY2uv1ourg175BeX7r4mRej8ksuGM6MhoD03Q1+jYTl1l9REW/JeSMg8MxpoegeUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aVE6uQY9znCYqrgi6+/JSfmRMS1q7/GU0dj9T9uQX+4=;
	b=gBbBmYSh/UYBx72HnDl+ys45DvYfqo/iNiHudNKQpK6sVhrGP/1i3k0civ3ha/DLg21W
	 UJnTNynF8+XWY1QLygtVr5EUs6eSDXJLhNAR6txT/gDWvp0ZDE4mRsvvEULkSnlLGRqjO
	 wWU/VaXur0bJ/h+BlLyA3px8/AScTFDvihlDMKFBvO2wLZuCIlq4WZgbtWi3MFwFO/wBP
	 SU10+Y9Wj5HFNBC1ZHhP0f288mcQzJyEBdljRVwA2aC/BcQMnZimiDrHyVt5BeKVqdui3
	 raM16dFV/3TbPdQjhn9SFxf8jd4C2lpuvVzf2axpCsmo4M7FR86QoqQq7ATyh/bnszw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hMGObVyQ;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C62606A32A
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 07:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C62606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hMGObVyQ
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b600fae14dso2410301b3a.2
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 23:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677210; x=1796282010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVE6uQY9znCYqrgi6+/JSfmRMS1q7/GU0dj9T9uQX+4=;
        b=hMGObVyQoONUT6TV+jmjmq6OyK9IfHg4OUEGwqQ/tduHPbz0kdV2htyLclKoX9shbf
         oyzUmdy3NhKMiB/LVMaf8l0+GQg2Oti4fUAUGzLy3SQXvKCPXoLQWq/umdni1uXOWvnx
         kHS8vrBPjJQ8DX1RpKccyhkBhary/6mcTbb9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677210; x=1796282010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVE6uQY9znCYqrgi6+/JSfmRMS1q7/GU0dj9T9uQX+4=;
        b=aQeC73rzw3HItoH+qOvoXQnbPc1Cvug/sEKztIJCqW41259qTBQWzm19HTpxeHo/L4
         wvCE/V3yATtS1J2LvWGGDpuTLRaVsSVm3neFuPA1LZhPS6oq2xpJO5Z0gOo2rHZ9fUed
         mn4NDkdbLInCVLLwA6w11NiSWF7F3UVNwrWZU4Yi65nnXKPFqASr3tbaMdzLWPlKCTfO
         kpJYlyQBxHbkfSKkcRFSYd3x/mV58IvcMhgC7IfX1umVesa+5awaVoBq6PCFLRDFUSHr
         5upHYJGnKd/q1bkmPd9ALyFUJDe+chJh+Y9ar/0haoB0pRjROSmScKPPFThAuyTuTsOw
         2NyA==
X-Forwarded-Encrypted: i=1; AL+hErHtUVScX/FSayOKMvnmvTBMrzUF6yzKzw3/k+5HTrPAhJ/vqMK//SwUGT/Aa7u9OgrkN+k=@lists.linux.dev
X-Gm-Message-State: APuU4Z9zimbUhDBJbPhkX7pQrc6Anoe404HAaO51o5i8okDvuwMJskT/
	k0oWwxJE0okfGtKzyrL80qjuL8hnC7M3I0v9j+Q9bJ2mxJPyHSj3ZgJEV9MDyfqWOw==
X-Gm-Gg: AZFdTZdzaywTuOkCEfi8iZ4bpF328mlzkdcArrQ36JnnKSZnWls1pDnQdOCmD/cF8FN
	BirsZz8hLq7//cJ9dPshltur69DXrCzadU+kNKXplW2fgIAmyPmGitOtYa31HrHlGDaqJ1ZTG4m
	LEQVGduMcb7P7O1Pp5KDwreYE4oyBgOPCrpHCrIjIeDk8g14jIt8tB92VuGdKtSobm/OkXQSQDm
	WxP3dxF4jq3/vuDZ6eO3tjvyOzZ0uUQ2JR9zz6B47mlZI5e53b0G4UCEq8hiZapRXPrNBsRK/3M
	l63/jwc6cRt5tXFbqkLR+jzRSt7CZjpRogDTYnKcgI3uBfYTX83NNSuhlyYAia5oLveKv85lkqC
	66cvEr1meNoA2lZ3YptaJdfuft3Fm+a84TFlSKXVEKP46rOCNdUOFTmL0ndN3N6nQ0+XgPmpDAt
	cxGeAzHG+jhyu5Q5IqzFpZZgEa+MFq4ZxqaseIk4T/c9XBEybHYcsJgemsxB+6p10WNCkAB3HCL
	nVbi+Cv56RVB4UDB4h4E+bEmS88HPMLzjtAW0OKl+CQanbeZatXHXdr1yOIX2gns22f8PjczV3s
	uTm5a+rlG5Py7Z03NIBWouMDS2gHCKEvYTnGzC/xfLIOJdeqGkaIYvI3YumK
X-Received: by 2002:a05:6a00:238b:b0:89f:521:8089 with SMTP id d2e1a72fcca58-8c87bcbcfebmr18588681b3a.19.1795677210131;
        Wed, 25 Nov 2026 23:13:30 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8c87285b60csm10397352b3a.9.2026.11.25.23.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:29 -0800 (PST)
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
Subject: [PATCH RFT v4 1/5] drm: Split framebuffer pixel offset calculation from drm_fb_dma_get_gem_addr()
Date: Thu, 26 Nov 2026 15:12:49 +0800
Message-ID: <20261126071314.253890-2-wenst@chromium.org>
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

Currently drm_fb_dma_get_gem_addr() calculates the offset into the
framebuffer memory for the framebuffer's unclipped source coordinates,
adds that to the framebuffer's backing storage, and returns the result.

We are about to add a variant that uses the clipped source coordinates,
so there is already some reuse of code. However, calculating the data
offset for a given pixel is not specific to the DMA FB helpers. The
offset is only related to the framebuffer.

Split out the offset calculation into a new framebuffer helper so that
non-DMA users can also reuse the same code.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: stable@vger.kernel.org # dependency for next patch
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
fb->offsets and fb->pitches are (or should have been) checked by the
driver's .fb_create callback, either in drm_gem_fb_init_with_funcs()
or reimplementing the checks directly.

Changes since v2:
- Change offset local variable and return type to u64, and use
  mul_u32_u32() to avoid 32-bit overflow before widening
Changes since v1:
- New patch
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
 drivers/gpu/drm/drm_framebuffer.c   | 46 +++++++++++++++++++++++++++++
 include/drm/drm_framebuffer.h       |  3 ++
 3 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index fd71969d2fb1..ab0f37d8a5ff 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   unsigned int plane)
 {
 	struct drm_gem_dma_object *obj;
-	dma_addr_t dma_addr;
-	u8 h_div = 1, v_div = 1;
-	u32 block_w = drm_format_info_block_width(fb->format, plane);
-	u32 block_h = drm_format_info_block_height(fb->format, plane);
-	u32 block_size = fb->format->char_per_block[plane];
-	u32 sample_x;
-	u32 sample_y;
-	u32 block_start_y;
-	u32 num_hblocks;
 
 	obj = drm_fb_dma_get_gem_obj(fb, plane);
 	if (!obj)
 		return 0;
 
-	dma_addr = obj->dma_addr + fb->offsets[plane];
-
-	if (plane > 0) {
-		h_div = fb->format->hsub;
-		v_div = fb->format->vsub;
-	}
-
-	sample_x = (state->src_x >> 16) / h_div;
-	sample_y = (state->src_y >> 16) / v_div;
-	block_start_y = (sample_y / block_h) * block_h;
-	num_hblocks = sample_x / block_w;
-
-	dma_addr += fb->pitches[plane] * block_start_y;
-	dma_addr += block_size * num_hblocks;
-
-	return dma_addr;
+	return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane,
+								state->src_x >> 16,
+								state->src_y >> 16);
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index d32aceb6ca9b..589619bd8f0b 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -21,6 +21,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/math64.h>
 #include <linux/uaccess.h>
 
 #include <drm/drm_atomic.h>
@@ -1208,6 +1209,51 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 	}
 }
 
+/**
+ * drm_framebuffer_get_block_offset() - Get offset to start of pixel block for
+ * the given framebuffer and coordinates.
+ * @fb: The framebuffer
+ * @plane: Which plane
+ * @x: x coordinate for pixel
+ * @y: y coordinate for pixel
+ *
+ * This function will usually be called from the PLANE callback functions,
+ * or from one of the helpers that calculates the framebuffer's DMA address.
+ *
+ * Return: offset from start of framebuffer to start of pixel block
+ */
+u64 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
+				     unsigned int x, unsigned int y)
+{
+	u8 h_div = 1, v_div = 1;
+	u32 block_w = drm_format_info_block_width(fb->format, plane);
+	u32 block_h = drm_format_info_block_height(fb->format, plane);
+	u32 block_size = fb->format->char_per_block[plane];
+	u32 sample_x;
+	u32 sample_y;
+	u32 block_start_y;
+	u32 num_hblocks;
+	u64 offset;
+
+	offset = fb->offsets[plane];
+
+	if (plane > 0) {
+		h_div = fb->format->hsub;
+		v_div = fb->format->vsub;
+	}
+
+	sample_x = x / h_div;
+	sample_y = y / v_div;
+	block_start_y = (sample_y / block_h) * block_h;
+	num_hblocks = sample_x / block_w;
+
+	offset += mul_u32_u32(fb->pitches[plane], block_start_y);
+	offset += mul_u32_u32(block_size, num_hblocks);
+
+	return offset;
+}
+EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
+
 #ifdef CONFIG_DEBUG_FS
 static int drm_framebuffer_info(struct seq_file *m, void *data)
 {
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index 38b24fc8978d..6f838b485730 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb);
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
 void drm_framebuffer_unregister_private(struct drm_framebuffer *fb);
 
+u64 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
+				     unsigned int x, unsigned int y);
+
 /**
  * drm_framebuffer_get - acquire a framebuffer reference
  * @fb: DRM framebuffer
-- 
2.56.1.839.g22a8290db9-goog

