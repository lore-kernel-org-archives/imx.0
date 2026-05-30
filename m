Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311FD2D23B9
	for <imx@lists.linux.dev>; Sat, 30 May 2026 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780171184; cv=none; b=XcmlPYc1HudTa19dUUQ1GZZ31BVS+eM1zSVwzELQMShV4Fc1iSOsPvmhWyfAy7fz7NT0mYofs76Cgz6li3iyrq3ktvjDIFSP2TUNd5so6xw0IPe9NcT2gJ2cDq4Z/7+8SYQVlysPSE4UFZcFtHdjnmdd/OQNj1CqQgVdLmzNmZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780171184; c=relaxed/simple;
	bh=h3ZXSVSddOJlH3EHXOrVqWGF0G6nSAhcWRFRiFbi3/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VED+UaSNGE2Mq15riTwZusHmoD+VolnxAp1H0XULI+NfGlcdBPsDOeUelsQ1MwYCPIavxeSBSZiq2y3WkpdrClil+ieH67rFokstiIMQpWSGQs6V8O8pidcuOZ5FWXe4ddGIFalr/O5QxblzuiPoQmRgnrJFduRkW/f9fu6JhQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSTBSww2; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSTBSww2"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c85a2c012e5so31543a12.1
        for <imx@lists.linux.dev>; Sat, 30 May 2026 12:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780171182; x=1780775982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xDsrez4hENrmsOP6DpqaPlhTbFkmYHTO8HsVENUs2Sc=;
        b=sSTBSww2GqiCJYffzw6Ow1YeOk+QrAU0rmIDkowIrEZAX2X00kYUSeZds2evhtrKd1
         e8NfsZ68+B1wo9OwFfXehXE3TLpMFcFVLpeBASReZd8m+76H94c1VHnwgFeRU08uu/4u
         S1M9aHQ6s2orlPzYyGGC6v1qHPvnvpuY5mSMwO9KeEqSX9tBKtOPMixZu0EdxYtCheo+
         OHOuNJd+/U7WjE2WWtaE8i1hxD18pCwvH2FpMdKg78D8HuVvQTXUdwaQgndvfeomavRf
         6fYLiyD6OfveEjQHbkWRVhqslaC8/hJDgA+kF4pnPFw4MHMRimH5OWH2Ql4zmuc5Sz9L
         ikDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780171182; x=1780775982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDsrez4hENrmsOP6DpqaPlhTbFkmYHTO8HsVENUs2Sc=;
        b=hzdmMv4gbLjCHsoOxTsEmP2JYvqxc9Y60ao0B9a/0Sk+QinAC0+UbMdgJwgTfMMlUx
         HAZVoVQ6lmGzTURqIT0KkDTKxBmrKDfCf9ELWS0DTiXWJ1L8/cR/uYrLyg/J+mHOnNl0
         uCbMAKolZljjvUSH8t2M6Gxy/bK1k9PHNfN0J9gjCMWI4eHmb14XYFgKfS/WDLyTvs/t
         bk4MOsxoYxrjXqGEHoTLOaM4KQtyfHvgkqq1qO7d+migrAo0pFjrdCkBy0+GxIFUj4Ct
         Qk5QePHKJeGkM0dDsr5FOLjiACAVMSnUdq0gtBOf1UdoL3f/ji2n5CL+47TaEwEMpF9r
         qJpA==
X-Forwarded-Encrypted: i=1; AFNElJ84ZVy4FUQCgyzGyIVsF5RA7E1OrM00xwZU2Fu0cQSPHSleE4cGkseP5CqeSH+CCCImYqI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSYjp006ESgTLZk1fypb6YvQ2EvNQkmlymx9ec07Zl5mooFd86
	xjkXdLHHvvoowoD5gJZ0z0Tbr278f7Cfk6AiBVi3oJ21kaak81+EQnOd
X-Gm-Gg: Acq92OEZyxQNwpRqoK7Qmwh1a8A3Rsfs5uJPW106V+Q3xqfb3i4CHBot4PamA7fGhgP
	EMYGtNImVeMxR5D7W9RIM9mUnoOfWYUCfFHUQs9yf5kmOqZXC5F7XfMg1Gj5ER7yNoyGf+gB9Fr
	OeUwwCsuo2W7DF0Y7cRgOWQsF6HP5TnDVd28kX1+dlYLCBx1mb9BK8QgGIfMMIWH1Ie0rfuq7SC
	lIvBSV0WmxNVdgay8QSRevffDyHvPlQe9+kxUEGcRFb4hdxhvOKes4ntm9BZLsFtH0SdD8eqArA
	dnXYmirS8b0KrkTa++ZnxhRrRlv8xWfFzHGQyvAqiyRO9vgeUtTAhnrWdtRglUpx/CcXU6tP3hz
	b0r7CoYaedNXINfBU4zPlNvUTPOwzyaa6WEf6j4OY/DbwwYpyXhWanrXryGWYF9QnyBPVwc6q57
	12Ib/Fh3Q5MwtJ3WeramcGfKw1BAI77vUKJ0ZayXzMpzUXWYRfhrnfDfmmKVKQgJwHSnyPq4rxy
	Tm29sSoRwJqg0/kgb0NTPaDfbJbpqMlog++xYpxju22rA==
X-Received: by 2002:a05:6a00:4296:b0:82f:5726:be23 with SMTP id d2e1a72fcca58-8422575fed2mr4382838b3a.49.1780171182401;
        Sat, 30 May 2026 12:59:42 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422b170f31sm2682850b3a.33.2026.05.30.12.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 12:59:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/imx/dcss: add missing kernel-doc parameters for scaler functions
Date: Sat, 30 May 2026 12:59:25 -0700
Message-ID: <20260530195925.5477-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dcss_scaler_gaussian_filter() was missing @phase0_identity and
dcss_scaler_filter_design() was missing @phase0_identity and
@nn_interpolation in their kernel-doc comments.

Assisted-by: Opencode:Big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/imx/dcss/dcss-scaler.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-scaler.c b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
index 32c3f46b21da..e48b3117efb9 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-scaler.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
@@ -166,6 +166,7 @@ static int exp_approx_q(int x)
  * dcss_scaler_gaussian_filter() - Generate gaussian prototype filter.
  * @fc_q: fixed-point cutoff frequency normalized to range [0, 1]
  * @use_5_taps: indicates whether to use 5 taps or 7 taps
+ * @phase0_identity: use identity filter for phase 0
  * @coef: output filter coefficients
  */
 static void dcss_scaler_gaussian_filter(int fc_q, bool use_5_taps,
@@ -262,7 +263,9 @@ static void dcss_scaler_nearest_neighbor_filter(bool use_5_taps,
  * @src_length: length of input
  * @dst_length: length of output
  * @use_5_taps: 0 for 7 taps per phase, 1 for 5 taps
+ * @phase0_identity: use identity filter for phase 0
  * @coef: output coefficients
+ * @nn_interpolation: use nearest neighbor interpolation
  */
 static void dcss_scaler_filter_design(int src_length, int dst_length,
 				      bool use_5_taps, bool phase0_identity,
--
2.54.0

