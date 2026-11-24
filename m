Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506060;
	b=n4zkbDfw2uUVuemokhbPk1EoIE8N9MimGILlo1lxY5EUT+M00537qvSqiSb6UvOtyVaz
	 v8Xz6p2CIDJlARmX69V6ThrmArno6CtFJ+I/NhBQwiicQDP+DZ4pVWUtjG8gIF5yaN60z
	 j6zu98WTVCCZKmcH5KN1DcvGqV/SnvzVMRpdlutiWuvnlLsmnqpYIgHnhZwXR4Z9KGd3B
	 iWDj9Eddu6D4x9lRkzr+lD47dc/g2vipKxunG1YXJC1fF39oHaBB3j3cjVmsSpZFcGMQp
	 SEUmjGXc1MuViDZvj9spfHW9LjmgH9laDKNdYrQz2HD8eRqajDNQb4QoYVvm/mZjZmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NOv+lCeuytPMgK0k4vfCvQSlUO2ysKfU7YDIKLNZGwM=;
	b=PTcLC72F0S2tjcbsEvyCdNJJ8cL0tzk4UVyGpaSA/mvokXvuE7JEWmQW5sPOXFg62Yh7
	 L4NmIB3R53Dc1xAsUzNzp2SJWkaAlhkkO/KM1X5e/X8TAtS6/sQQiB7J8aZFHQjVii5Wd
	 jc3t6Fhx2sSMk0EqHaokpHp5CgHxyST5usnR2zdku22pZNMJQy08qxUyW3mqIw4Kz71C0
	 GF09NCk/Vcr4n7MhhLosfWGthyb5KYciYgKPi1hoqr525+gLqCjvnbTjMcPcj9d5XBGsm
	 6EuFTivefzN1azYJEibZ2gZFjDtuFDSgxWhdMns/PVzTuUPx6dytUkEUlQw80sh+XrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Amq2mevB;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FB8606A331
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 07:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0FB8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Amq2mevB
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso4235766a91.0
        for <imx@lists.linux.dev>; Mon, 23 Nov 2026 23:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506059; x=1796110859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOv+lCeuytPMgK0k4vfCvQSlUO2ysKfU7YDIKLNZGwM=;
        b=Amq2mevBZ6O7qkH55BtaSPU9fwGjz1E3/tEPR5JRBhBAiUJrYrSK3Zm/yOs9SGZ12D
         8jpp936PMsTCXDwwmz1yanAtFlEFKYuSOUxsKedruh5/IyHrQEKNpDmf+qnA/NzLR2jc
         XDmt1n3M3zTzXF9sygldj5gBsU+ZuC7Ie9TAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506059; x=1796110859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NOv+lCeuytPMgK0k4vfCvQSlUO2ysKfU7YDIKLNZGwM=;
        b=Uw7yUKye83udQF7mB00c1J87Ts74hdr4Tc0Ei+4z7i9iBh3s4V1wx6U6ugSXQyHKQz
         2JNyEXwe8lerJCAu6N7IUSa0hx1qCw8TC8IYQzuQTf3bM5TufTtv7WJtkDl80eTUfCZP
         oP1Zfxv63xXoHvLCQiP26WaXz+UaRsM5rsW8UcuNZHmtwEEU6kXgvMEaCKfaqhzx66I3
         LuUF5SSMP5FIg0YC284Tbd0bQY7Iqo1X4lCaMgFO/0YmxyZ7n24JtJ7YEETR6HqMnf4w
         4+BoJzccMYgHps+kC2GifrtFKhN42LwI6rQh47d7G8fsV6g1Vx5HBz2PFFMQjJ//wZKY
         xqng==
X-Forwarded-Encrypted: i=1; AL+hErHPvZGThiuKTZt6oFaELKVVHDbkrnXSMFKC7kR2oKz7B/+nNd1StbeSBUgYQrNza1OPM28=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Xx8i5cJLKdXq67qD/3+rhYdFPFfBI2i59tTKCJV6pP1VbDRkV
	L+q3N0bYnXwj8cwVj/xyyT+nppu1S6Nw30dpny0upXCAe3M5oaCaD2MnMvJeXx4egQ==
X-Gm-Gg: AZFdTZet9/Ge/tXYNwptOL1UoqZ9p0ZHykasZbuioVTxE40UDugsQbSzrHZMxdZU+jP
	urWYvvwdk+anw0R05NtzrCO5I2QKKkmvBG+xf9UxnFVuHlY2DQpMYMpjdWEbwQDIEpDeJ/6WJjC
	q+aCv8gRQv+6CimUrigMzc1495SB5+S30PUvZuLYfhWt6Zk1Zxs9B3eIcOvu228cOexqbvchlo+
	8/VAJiPNkQErIMPOz8deq16wrn+LRDqg4R+bOzZuBfK/vOPtzPvmywM/kZQeWxcRe8taQDvQd7B
	EPZUiiri1uaw0PcWqWgjn2no/EQLWx38rqfWevN5CP6egPFaaN9Xv6J6gRgeO2m1S+seCtaOFXM
	TkN8+sSK1L0LZU12ckYMmLVrX9UxI7HZzd5jgQyb8ZMTqgbExCNihXGrJunV+YKeor47IiYvlpS
	EDzMGdJg/lp3vrsvbc4KUxH1EgPOg+uR/vtB35C0lhGJ0PM+ec9mGGtMr0XqcpNWxkXuRRFpCnz
	dajXQtFxDDkOq8uVgYnorLV9LVpqqxRp71x/Iopctihv4tV/3Z/3xAiu6+rfjIHzv8HGu52SJjQ
	WSa2AgvCI+CV3DygMYTE1RZBDak2trq+YTY8IvBpO3/9HWQIzu9yUrEZqYk0SRUS1J8B4GnHmR8
	J4FkVYQ==
X-Received: by 2002:a17:90b:2247:b0:3b3:fe38:d8d4 with SMTP id 98e67ed59e1d1-3b40a5f92ddmr11465678a91.34.1795506059023;
        Mon, 23 Nov 2026 23:40:59 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cde6cfc8829sm6568259a12.8.2026.11.23.23.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:40:58 -0800 (PST)
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
Subject: [PATCH RFT v3 1/5] drm: Split framebuffer pixel offset calculation from drm_fb_dma_get_gem_addr()
Date: Tue, 24 Nov 2026 15:39:29 +0800
Message-ID: <20261124074041.115251-2-wenst@chromium.org>
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
Cc: <stable@vger.kernel.org> # dependency for next patch
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
2.56.1.809.ga0b61035b5-goog

