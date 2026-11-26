Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677235;
	b=qt/r40Pavk0lE9CIvIvpVUd5UATyrT8VTrPMlXunlHX0sIZif9KloPer3TJjCS+Py2Us
	 XfGKgC028tkai9NbRuPy1bPbZCgEPr/P5c1qM814ibzlv+i4F/gnqHK+mfvDAiyJdDqJ2
	 dW9iHiO9MCZ7upvU/nF4f3ZV2nGjJe2xgU5E9CBF+PGa+d8N66BYAaS5KFrRhRDTHbMKP
	 3q7re4GbD96fz6nAmszfPaEm+/Z3oPOxDMShdhogY4l9ank449xqOGQGAQAeWK9pTpd0p
	 Frz5jSKZfhuP8/lVcxrxfU49HDoHs5+tCO9lRx4NGNLg6Mp3j2EufZRAuyy9Pq/fYdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J5KKQj+Grt6zgozyhH1Cn99N5gjYRol48Ra+q72Y3/4=;
	b=tahWuyK76s8O6qU8OE/yufYf7NWdkbmdl0Ow1R8ZunBY5i+0qv1LKHp2DN3+80Ngtc79
	 WFzk0Pz88sZrdL3rk7ciZF5Fn+QhWI/M09GUEKMSrMIkllwO+mjjRdQT29HustXyDvB4G
	 C3x8+m+2gY53L3EBpOgdgpdHP0jF4ux8H+HSD5R+pW48JYEX7NrLtGxHawbOBHnduff7Q
	 xGkZH1mBZO6k0ag+LSfFt9KlnPWFSZ8iBfL6GLDpsI5CgS/Gjep5Qs1pRojD/nbGdiLFy
	 4GbpeJvqYE0zwV68o9BJnGOBY9Y+La0LMxAkuu/ls2uBIvk5RD0qw0GXyGau1VJ3Wqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ORiOu2FY;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA25606A326
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 07:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA25606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ORiOu2FY
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f05b465cd1so36778665ad.3
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 23:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677234; x=1796282034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5KKQj+Grt6zgozyhH1Cn99N5gjYRol48Ra+q72Y3/4=;
        b=ORiOu2FYE0QR/M2J5gUxb15jRVxu3xruswNbjxS8eyvcZMLTK47+BEyLALsu0or/XF
         sJkzjuM94Y6lWPlOE9h1OSHls8vSaoCUpde3r93Hhov3ujMR+by+3ZiEuVguDg8i0rTI
         Gk7kdNLj0PQPqEnwXAAE6tkZHLYs7jqptGSGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677234; x=1796282034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5KKQj+Grt6zgozyhH1Cn99N5gjYRol48Ra+q72Y3/4=;
        b=H3X5g58rwm1K6emz4f+g/EsGNjmNZQXrAjc/hh1qOdxL+WYBOZesW9WbxYBMZYXt5u
         qNlmeVtPZISElA4n1SZHB31XCU2IrTqBrGF2nfRIayq3ibDuNH9waql0We7QCuCKPWiv
         yzfX/w756rVOdhjXrvLXdLcIrn+87l/vvAyNn/8pPplDIUfh/TJGP3P6A7L1f0O5Tjw+
         hN+KPOlP76+MV5W0DLvTL3eq2HDs//DLuJee0YVt3yStDs3J/lkMz9eLL0N1T6XA8ANl
         Udasz2O4W7Aa8JdhIDjc9Z/GNXIzfZ0ieBN2E7d5XQNnzsul8L2b4nMBERvaA2xoUtNv
         kYjQ==
X-Forwarded-Encrypted: i=1; AL+hErH/7lWFW3q+YLd83yOY0czOL90MU5SdUDd7RhGykb15G+ByBw0wmxmOATA05wmewNgphYo=@lists.linux.dev
X-Gm-Message-State: APuU4Z+dcZDsUhAZQLH6oqyzYjUyQvbZzmutY6SSgpqQPxQ1jYTZ2GRL
	Kpw6FoXwUIU4wXc3eEKp1gLsBkkda0lteqjF1jH1D00dP7+GFKNrID5RQjhm/BoOiyYQ4OIfsxI
	prA5UGA==
X-Gm-Gg: AZFdTZf4PQXdDxJ6SgAiv2zHK+Nfp68t6xv+Zb54TNdLzbmjRhUlGTqCndgLSOIcn04
	5CpKu4rqTG5z2UPtHJFM8PI+WZmmgQSDVGunu/Tw81qX7zZkwZDufnHGi+3TW3SGI6m0aGe/8d+
	h8hIEDmkvU6XKbte7n7ZZxjdceWZs6CdgloXSQiBFfPj77HcDVbvh9xYtXkA5tPOjdW16i73yUH
	ejCHqlqAxpDEWw61vbNcgAwAuAcPKLMcu7iZ4S1CG/M848c3OsAcP7nyWSHihbrzhEeTH5+xHbb
	DSJF7xK2AIo9Y1alayIEwFo0tYaOWLQTO8SboPjYNWHZCW6WYQAibKOwDkFGHNOu7y8bG6jud1s
	eeIGFOolgPPDLOJeZMonhobtUM0qRBANvVhTHlpC0s8GnuFFaBhPtk99o+AtB3LCfAOid0xCSRJ
	I1eY+4YoVvSNwMGd1jQRkCFTbSPkM/wSuq4hJ/l+m8/KpjQuIo0qIUgprbBIiy/PD/aT+cwcMxP
	5RCZhxXPwf5AGk/aTmjQWAx7wb2E6On57d9HbN8/RJxqg/hLZ2tmRAytv+mTr0jhYNJ+MCqsKJ9
	0xPKAmpUKSWlHUe75gSijIcCN22xF+2hUBjRjzfi36+5YqCDrx7qxsBsAo2aLt3no5f7+O7Yz57
	7unCwVw==
X-Received: by 2002:a17:902:f545:b0:2f0:585b:8d8e with SMTP id d9443c01a7336-2f0585b8e12mr169849155ad.60.1795677233916;
        Wed, 25 Nov 2026 23:13:53 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f0bc695f31sm41539205ad.49.2026.11.25.23.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:53 -0800 (PST)
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
Subject: [PATCH RFT v4 5/5] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Thu, 26 Nov 2026 15:12:53 +0800
Message-ID: <20261126071314.253890-6-wenst@chromium.org>
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
2.56.1.839.g22a8290db9-goog

