Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208C531AF3B
	for <imx@lists.linux.dev>; Mon,  6 Apr 2026 15:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489865; cv=none; b=fCpIqXKgOm7cFdMb1EFdUsATMwRExXifAwGlGmPgOGqbbjXbjocSadGiMGp8t5ni8jBC4Bo75zyhlr8b1oe9Imbu8uaM1gcvp9fWN6Be7PXirdtr0mqfhPtUjE/WQ9E1D2fb0zGtPODUmGkBMJIO14ccSsYHZ+EFftKJGCy/I0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489865; c=relaxed/simple;
	bh=DW8zlTGwJiHy7FewsrXhORkxRsEFt1IHmZzhoztW1c8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mBxJPKIC76+qguNSfRbL90DfuvNviWVcX1yxj+rHRYXJr1jnwB6zEScH3x7qKcclWdX8MFxw3pGbT0tAGfcIvVtl9CG1zNSJeD1jP6DkGzBuw637EEPZMDmYtr2T1ObuNuVKbieq61cNFQuotboNil+FdQv1TG4Q+kHO5Ud56oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alefors.se; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMp6ePHG; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alefors.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMp6ePHG"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38dd8e7f131so21668201fa.1
        for <imx@lists.linux.dev>; Mon, 06 Apr 2026 08:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775489861; x=1776094661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OT0m2cjrqDSfo99BQTDsCGng9x/9w2Ex3suv7RFRwgk=;
        b=aMp6ePHGMAzBq94wWn8FecQQX1WaJ5NHmczy00vAorOSfCkFjxjqC97DPmho6rZsDb
         NOTz882wiP1+pEv9PsFNqFB84WSN6v3ePoZB79gmAMPADF93lKJIsi03S3yU6CzBx2RO
         Qj5tdhR6eioQUBMTsHNyLpuCBs/mueHiCmKQkDZMXC1HFlXcvRovmwRP/yO3iWdspYa/
         2D4/W5zC7F9019ZV3EWElZXi4Z0eRoWZ1grIRIWHOZT8hxD9r/gAt43qLfCJvQCUtPlT
         0l0i5Wzw3wnzN28UslyTyQexphXU7r5pmd5gPjtWHi4tZu2o7UG9bkL4oTdyjuM93xVx
         d8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775489861; x=1776094661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OT0m2cjrqDSfo99BQTDsCGng9x/9w2Ex3suv7RFRwgk=;
        b=aOEHH71AWcdZWscJz8V0zwkPEvzsWBWhUbmp4xf0MfVa7+08eYDQ/+RJ/6O/hRYmTP
         ka6sDoXN5S81AYwmQ+Gef0BF+zz8rP4KRJaVV71Oa9ODDKQwroT3Kpi2PmeJmhKomwhi
         pSAs6B0S4L5wo/X8RrsREixXrAx+536ZW2+K9St5hKO5Mnjj4uWLVcaxB6QTALCgjbAT
         60d8piritWupRy+PYTDI9zeLCY19bAoUA/CAQ1XNVAEaG9URowmf+h7DZqIFAPiPH7Jq
         h/NpcAyiMYHoVwlLPBWOVXVSKv0Qbc9BBrUCM5pmTH2IZwHcNLcxU8T40NBM7aWgKfXD
         OX0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVu0WUMjM2LO410KEGVu6kP0/drrcCZe5tMCV5n/DQd4EJXt6+v6wtUu7eiyw4PnwI1FyM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZWLNd7xuoy07Uiz/sttQ5uo1+3QQLAwwyQ9w1bCvuh34vCd/f
	G/a+Mtqvuf5PAGCLEICNPh+Y3Sk1Fr8TQILweAx0jZBrpeA8pafFi9h5
X-Gm-Gg: AeBDievI3tlrR6viZakZhaX5Y82ZiUqC/cSLDwPHvoEFGIMtL/5zO6/ou4P6tnF9RtS
	fmuIZBhwjXjyzHWkLFpXdBWo/D1Vi964lzNz0ZdgAMjFem5F7Orw3TvauLfnC0kKOXkjZolmL/O
	jbdkje8bcCCgLbfxNc//VQiZ9UTMdetDkuS+iC5DM9MpmzbWXpsO9Or231yDvYJq+0Qiek15DW9
	uMPllqOdXr2D93tysWbcjmxDpxzXX5RtOjNNORdnVEKkGl70ui3uARpx+WqlDwemxqYZhZcTh3G
	TS+BQ1OFG6Z3vqz9CJiL3dScYicF1z7iiEvwP0bIBDI+EviCmBw3H4XNZvRc0Zeg+lTOLi93ON/
	73ho2xUbPu/ZzqKZwT1v91slAigk+jjM16t5+BRkWl7wu1DZy+q6WyzuP/ByW66doMtvpvPb29H
	cskUxybAXjRyWYR7iw4RKkNEzknDdfdAc+QxEWMPAKzh9cZca7rBhA
X-Received: by 2002:a2e:bd81:0:b0:38a:5102:9190 with SMTP id 38308e7fff4ca-38d91d72c8emr37975631fa.28.1775489861128;
        Mon, 06 Apr 2026 08:37:41 -0700 (PDT)
Received: from nano.alefors.se (83-233-6-82.cust.bredband2.com. [83.233.6.82])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2108a4fsm30781991fa.23.2026.04.06.08.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 08:37:40 -0700 (PDT)
Sender: =?UTF-8?Q?Magnus_H=C3=B6rlin?= <magnus.alefors@gmail.com>
From: =?UTF-8?q?Magnus=20H=C3=B6rlin?= <magnus@alefors.se>
To: p.zabel@pengutronix.de
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	=?UTF-8?q?Magnus=20H=C3=B6rlin?= <magnus@alefors.se>
Subject: [PATCH] drm/imx/ipuv3: do not adjust hactive for non-8-pixel-aligned modes
Date: Mon,  6 Apr 2026 17:36:54 +0200
Message-Id: <20260406153654.2094908-1-magnus@alefors.se>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The IPUv3 display driver rounds up hactive to 8-pixel alignment in
mode_set_nofb(), stealing pixels from the front porch.
ipu_src_rect_width() applies the same rounding to the IDMAC read
width. While this keeps the DC and IDMAC in sync, it causes the
display to receive more active pixels than the mode specifies.

On fixed-pixel displays whose native width is not 8-pixel aligned
(e.g. 854x480), the extra pixels cause visible skewing: each
scanline is offset, making vertical lines lean.

Remove both alignment overrides. The IDMAC and DC now use the exact
mode width. The DMA burst size is already adapted to arbitrary
widths by ipu_calculate_bursts(), so no alignment is required at
the pixel level.

Demote the DC warning about non-8-aligned hactive to dev_dbg, since
it is informational rather than indicative of a problem.

Signed-off-by: Magnus Hörlin <magnus@alefors.se>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c  | 9 ---------
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 9 ++++++++-
 drivers/gpu/ipu-v3/ipu-dc.c             | 5 +++--
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
index a18b9d1a6..47b88f29a 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
@@ -304,15 +304,6 @@ static void ipu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	sig_cfg.vsync_pin = imx_crtc_state->di_vsync_pin;
 
 	drm_display_mode_to_videomode(mode, &sig_cfg.mode);
-	if (!IS_ALIGNED(sig_cfg.mode.hactive, 8)) {
-		unsigned int new_hactive = ALIGN(sig_cfg.mode.hactive, 8);
-
-		dev_warn(ipu_crtc->dev, "8-pixel align hactive %d -> %d\n",
-			 sig_cfg.mode.hactive, new_hactive);
-
-		sig_cfg.mode.hfront_porch -= new_hactive - sig_cfg.mode.hactive;
-		sig_cfg.mode.hactive = new_hactive;
-	}
 
 	ipu_dc_init_sync(ipu_crtc->dc, ipu_crtc->di,
 			 mode->flags & DRM_MODE_FLAG_INTERLACE,
diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index c1c7be4e2..58e7853e6 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -34,7 +34,14 @@ to_ipu_plane_state(struct drm_plane_state *p)
 
 static unsigned int ipu_src_rect_width(const struct drm_plane_state *state)
 {
-	return ALIGN(drm_rect_width(&state->src) >> 16, 8);
+	/*
+	 * Do not align width to 8 pixels here. The IDMAC read width
+	 * must match the DC/DI hactive exactly, otherwise the DMFC
+	 * FIFO overflows or underflows causing IDMAC timeouts or
+	 * display corruption. The DMA burst size is adapted to the
+	 * actual width by ipu_calculate_bursts().
+	 */
+	return drm_rect_width(&state->src) >> 16;
 }
 
 static inline struct ipu_plane *to_ipu_plane(struct drm_plane *p)
diff --git a/drivers/gpu/ipu-v3/ipu-dc.c b/drivers/gpu/ipu-v3/ipu-dc.c
index b038a6d73..f5990e3dc 100644
--- a/drivers/gpu/ipu-v3/ipu-dc.c
+++ b/drivers/gpu/ipu-v3/ipu-dc.c
@@ -168,8 +168,9 @@ int ipu_dc_init_sync(struct ipu_dc *dc, struct ipu_di *di, bool interlaced,
 	dc->di = ipu_di_get_num(di);
 
 	if (!IS_ALIGNED(width, 8)) {
-		dev_warn(priv->dev,
-			 "%s: hactive does not align to 8 byte\n", __func__);
+		dev_dbg(priv->dev,
+			"%s: hactive %u is not 8-pixel aligned\n",
+			__func__, width);
 	}
 
 	map = ipu_bus_format_to_map(bus_format);
-- 
2.39.5

