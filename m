Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506083;
	b=l/jfLyELi5YtzvN33cqWV08fGUp4pPpGXp+rG8OqhK7ocN9XV6DPRL7pHmVBgnX1iXJu
	 1az1dPV6JWJhEPiFJh/GpnbxXR1rlqQkncMStnKcXJWkq+iHQIcBGkUYUfu1sBdI1vayH
	 tTAv3eNtPo8HhU2lkyK1tAJPxlVWwJTQ/pVZRJdA5vUT8/x7Z2+2nDvVkm+yE6CubHWMy
	 sREO0LCxUykEhqImQobmrN21r3vg8b5sSvcvxGqOUofgmQRdu2JF+Ncvc1nA6v3kLngUV
	 4FIrzlVy4WQWHZn/kVe/dC88INsXLJc2Lra7/0c8UvAG/sOWSW/3CWV1RCx6o5Ct9Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h3c2lWC29hGMhiXznbuXjidfPs4Wpjz3u2lyu3ifusU=;
	b=c3f0f2XdFdax/nyAkgn0/U+bSRK8NgbqU+5mtg1YorrGYwM4WKwQBDZuY84Rj5PaU1fi
	 YtHa2WJ8MOx5y7LSFalObpEMUDsY2lI2Md0Cs8M/9kHMw9BzgBiDcGBh2cl6VGzhfL3Ri
	 y8tvKaQCww0FF8zTppyMzT5L2RGc1//tzzWTAyjNVQktKBTFQIifUz5gx8z0s+BDwXbaW
	 5woCD6y9MkqoJ6xd/LKIpKY1Q3V4ZUQLnYp18OhdWYD0UrtKxHIuOwOQHE12V0JcVcSI/
	 HuXy/tP/X3mqUdJV+sF5vvlSPY5sa8eHScjsnhq1PpuqBkEwXYMjSBDdX8KFyx7Uqcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jnktmeSg;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB86606A326
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 07:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CB86606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jnktmeSg
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f045b921caso23169125ad.3
        for <imx@lists.linux.dev>; Mon, 23 Nov 2026 23:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506082; x=1796110882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3c2lWC29hGMhiXznbuXjidfPs4Wpjz3u2lyu3ifusU=;
        b=jnktmeSgP8Lepkc25/UXTZtHvBVCSuOYrinf7LBLYQXwyKa/h7vO6O7iINcoOVA/pT
         6lwtCneshaaR1a+jm1NQrtXHgzJtPbOm6Mb7mQi/XuyNJnHoIs9/wy/pUWaZqDS0Q6vD
         RTUW3K3GdM1U3h53x1dtxUopfJEA6JUZNh33M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506082; x=1796110882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3c2lWC29hGMhiXznbuXjidfPs4Wpjz3u2lyu3ifusU=;
        b=Bp8tclQfy8/CteMZPVX3CJWK27zCDX4YqhvxBy79vn7R0BkfNaDKCDMG+y0nXIusbz
         Dk4vHtWWoEO0JfPQt9bH/RVzCwBhPpHOpJfPHzwLZo+pZXaNte/XMtvcuU2tFS2T/L2/
         gNB6OIGGsEl/A6PHMPci5qPMB8zAi21isN6JJIhr5ko/qoPnUizVLEEfa9FPbMXSXy4n
         z+yc3w3WRga5yuADTnBo9Mf5SUlhrfgO7SJf4rECyZ2k2mQLEOnOF9g1iLujCFHihUJr
         3aU2hpnf2yv7KMcd/jfJcugl3nC4tpMkYLsl2dNU7YP1WPpC3XylXPro4oP/KAnfixkS
         ttdw==
X-Forwarded-Encrypted: i=1; AL+hErGh545cmJpVgygaQZwZIO3k4fkirU65Zwxwn6tBdQaPGx+C3DvWCXGtU8rqLEcP2cXnwVA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Mf1UMIw9va/ylonDVBWp7XVAyDJRbeEqdU11B0/6wr4RO0rC4
	EBCaDqXxP5n1eY6crFyd6M3/skALvjfNILMQ4U60+wHHBgxYhn1ojJcZSmQdUVatfBoH962SU3Y
	1Eq1Wiw==
X-Gm-Gg: AZFdTZdYxssj5N9vDei6XSKIS8BtRDLw8fXSLe6PhN6tQ8+Q64moZhCJF/nlzTOmoPi
	rxEdCMpxXe0jl167ERHgHI8AgV/xoRnrrbEw2iVzvOgRm4dJ1K6EXls+0bdUd+LzfdADA0MtN7l
	501YaY/ibPG6gz4qqwjEmdrP6DWRcnaljTK/CKnrKxDDGRR9eHtAD3Y3GgB6H3BnmfgKpw6o9Zq
	1MLxY3U9x7LVJfLfotB9B3I/4S/lsFLe5GkHaD1jt6C5JL7f78uJasCSLBh0eybvGzku/pt69B/
	0qV0LOOmwcGqKvEIozHX/xonmzFMigHQvaKUcXqwyF3+Xo2ja+r8Jx4/b2G4r4y7F6a32dAG1M+
	xqQ1xgJzQbcLex1FjTsUsB00I+Y+LuAEoTIrymI3E9WWAdnDSui3qSfU4XjgtXZe3OhEs2FCd3k
	wFFVN5heFkQ65uKWdTM9OO3qAGpwJMUndRb9RxCXSqUwvBHLTTwdEcrV/p/xozKKAer42G+YpJb
	zNPp92M65MSBZSIWwuNctY8QQhbCMqYbnwZDpwKGAyPfUbs0Hi0DGFwuXiyLaO8S2nO1LYbpPhU
	VyvQ3eDyyVynCk9fEH6flu4f9VqN2lmv6VYdo2wymzg38n0jQHLyo4LC8hPY
X-Received: by 2002:a17:903:19e7:b0:2ed:b7e4:f5b with SMTP id d9443c01a7336-2f03f18a7d9mr127037815ad.40.1795506082519;
        Mon, 23 Nov 2026 23:41:22 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f120830sm64742695ad.61.2026.11.23.23.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:22 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v3 5/5] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue, 24 Nov 2026 15:39:33 +0800
Message-ID: <20261124074041.115251-6-wenst@chromium.org>
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

The i.MX DCSS driver is open coding drm_fb_dma_get_gem_clipped_addr(),
with only a slight difference of rounding down the X offset for the
first plane if the format is packed, sub-sampled YUV. This is likely
to correct the buffer address to the first pixel of the 2-pixel group.
Otherwise the hardware will start the scan-out from the second pixel,
which leads to the U/V components getting swapped around, and the
chroma component of the next pixel group being used.

Switch to drm_fb_dma_get_gem_clipped_addr(), and offset the address by
a pixel if the X offset is odd.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c | 34 +++++++++++----------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 303e93fd036c..580d9cfb4053 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -219,28 +219,22 @@ static void dcss_plane_atomic_set_base(struct dcss_plane *dcss_plane)
 	struct dcss_dev *dcss = plane->dev->dev_private;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
-	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	unsigned long p1_ba = 0, p2_ba = 0;
 
-	if (!format->is_yuv ||
-	    format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			format->char_per_block[0] * (state->src.x1 >> 16);
-	else if (format->format == DRM_FORMAT_UYVY ||
-		 format->format == DRM_FORMAT_VYUY ||
-		 format->format == DRM_FORMAT_YUYV ||
-		 format->format == DRM_FORMAT_YVYU)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			2 * format->char_per_block[0] * (state->src.x1 >> 17);
-
-	if (format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p2_ba = dma_obj->dma_addr + fb->offsets[1] +
-			(((fb->pitches[1] >> 1) * (state->src.y1 >> 17) +
-			(state->src.x1 >> 17)) << 1);
+	p1_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
+
+	/*
+	 * TODO fix address until helpers know packed, sub-sampled YUV format block size
+	 *
+	 * The buffer address for packed, sub-sampled YUV formats such as DRM_FORMAT_UYVY
+	 * need to be on the first pixel of each pixel group or block. Otherwise the first
+	 * pixel of the next pixel group is read and the U/V values get swapped around.
+	 */
+	if (drm_format_info_is_yuv_packed(format))
+		p1_ba -= ((state->src.x1 >> 16) & 1) * format->cpp[0];
+
+	if (format->num_planes > 1)
+		p2_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 1);
 
 	dcss_dpr_addr_set(dcss->dpr, dcss_plane->ch_num, p1_ba, p2_ba,
 			  fb->pitches[0]);
-- 
2.56.1.809.ga0b61035b5-goog

