Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46C8511214
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858496; cv=none; b=X0aPbcEWNxoEy3Hfx1MDWDJxAoTIWA51fdj4VXP5AHZZiGQYbOyWCwNAV9P3fpbP4jpNBfwMDIoV4iPsP0INV5Tvgt5DSZWL7qWkT2iAFZV6tCBdWVwyhnMZucSZuw31eQH6z6gg4ewvBOsQKmKi2kCYqXppUCAPfX6Qd1/NrKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858496; c=relaxed/simple;
	bh=qJDTSQf3mOWj1wTBmShDO4bnN0jyzbEKQlcjgoU7YP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+5IMaiUxYaFn0voD9ofKpms6KNE2rzC0rtH+ZeVjozbQwL8wH/bBfVGimxqvK/NDpelp9qwFHNO/PJTBPa1gwk3lbdNsdf7FM7jZip1QAJ2+wzJpLrxBv02OTH2Y3S4XSM27/aq2dHb2CKJ4PlBaWFXHZVrVDKxDZE/7NeyoU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S678CECK; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S678CECK"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso4780705a91.3
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858494; x=1789463294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZyOo+ygFnvVbouyZiGeNffeUNQ7tsTzDFqw1u+OtP0=;
        b=S678CECKn6ux/Wupl9Kj9K4SaCTjSzZPC/8GM3oiUxlfonoj9oBwTPleb5vMzhEj3o
         qrrnwWOu9cuxnSZQofbbB+5BDyDoZPzP/DGfzUoB39QUTc2KRifvYE45afJ6FYoXrMrE
         gunFPQU34LPljz+0wGCvDjofl6r+XzTuObWOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858494; x=1789463294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZyOo+ygFnvVbouyZiGeNffeUNQ7tsTzDFqw1u+OtP0=;
        b=midD2HqAHu/ga2rr0JeRtM9KQvcVJ4eLZEnaxob4ywjPBOGysZ1m14rsPDbmXMYkMI
         S3phj1Z9E+dac8FREzUVgoU3Ia7wmyR5Kmcdv8LcMgHFNl9nrL94oJ635iuYQeUMOESZ
         IzIiNB3jbPqBtNXgq+1lqk/ieRvN7hnw970vytp6Fu+hiZj1mmzDEDY4IU57UMyeA549
         +7j1ncO6axXRQxnWpnPE3WqNGAQWiSup7VcabCEbPCCCENyspi2ywWbIfe5BhBs4uprt
         3TnNcG4jLljVIyuwX4h42AaF12C4IZyg5YpN0RkEehIBEAgdAdy512ACHreYV3Q3aPs8
         RHxw==
X-Forwarded-Encrypted: i=1; AKwUvBz/js/H2fgv2GDaIiHdn3ye426d1rQrlfLiR+QDS9uOpceAr2DgO+puG+Vvsg4oGdmOXTw=@lists.linux.dev
X-Gm-Message-State: AFuF++nwuKSYdGjRm3mDIJpQ5oianEVmhvX9ebcTXhXY051zDoOkfhvB
	HVfMf0nbYMv/4Wl3ERHG7msqn7Xx32d2oJO7RWMCefJmzjfxFwvWAjTWNxSUYFg1UQ==
X-Gm-Gg: AYBFou37ix0/Knu0MW3R5eqIENR2SPVcZDdwYsOfHv6mUYyA50N6SyqPALhGecMB3Oo
	YhtQGjrnNrl8PukYPbru1vJyg2xQ+UqN9OTm6UUBOI677ayet/lfBL3YrTpxB0uRsPhBNxvGr4I
	Ji8KdrC5j6upg7Y0QlCxtM0NdEsaJk30KObRRMoeXljxC3AtrxWw391wueADYrPIiKTX6JBPqJ2
	Av3vuDPxuNyrlw6RTRSoV0fJIbbQ4AaK9xH5jHkpim5J8uoCQerdtrvDBd7r+hCam/MfQ2yz/yo
	egmniXb9e4B4qdSYwxFQdbeN+ni8LUSKmKuJvHFoUVQ5TL94zf1pmhiAp4jMd1cEtUYHLLf9dd4
	y7jZdcLQbd5XWz+eC2qmUgCHLiNTnsE9UNf27tT6ar5dVtwWxS3w9uaK5UIEnUljzdBhfGi3ihQ
	h+xcZ/5X1z2MQanV1akMWB1kkniFvGCDW5apsZdV9GXTl/FtVeydcIeOpABy89h0Oopegjq0Jwo
	QuVbGjfgZZrMW5b1+sYi/Wd7BHtP72/L/pvFT5CG231Dhs=
X-Received: by 2002:a17:90b:586c:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-39b2623ef65mr47890193a91.24.1788858493952;
        Tue, 08 Sep 2026 02:08:13 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:08:11 -0700 (PDT)
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
Subject: [PATCH 4/4] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue,  8 Sep 2026 17:07:43 +0800
Message-ID: <20260908090745.1089143-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908090745.1089143-1-wenst@chromium.org>
References: <20260908090745.1089143-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
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
2.55.0.979.g7e5102b832-goog

