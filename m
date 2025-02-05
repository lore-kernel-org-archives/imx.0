Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9011615854F
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738769391; cv=none; b=HYqeWxXHJGBoVZMYypw1Ik4vrM9cgBBlb1r85qwUB6sswW/RNtwEb3hU23l+Od0/Px/RxB+n0Maa2TPDtsmQt+9VEzZOiH5G0oL/u5X6kZ4pd/AmYG/nVjhjI3fzXvJDlOv2H1jG/Lkw4JBN3fS+4dx+tZyvE2Dc3sEi/gpRbA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738769391; c=relaxed/simple;
	bh=FvXY0J6HFmz+F4kGGhdiUtByaCV/93S7mXHV8f989j8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MC4V8Xoyi7BAj1+YdI86AvDMgf4xcPS2vJuPz+djJRpChMqCzwu4gbQ21CJXIHMYcsDZaYRhwdJlfpxdu/It2u/DiEqULVcvilCzTAxeDjc+3gHd/km3DWYxvrwziEtWLL3dGMh+T4Ln7T3AwkKaC7spsatPwmjzFA4o/BvcLjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iHqZJuPz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iHqZJuPz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dae70f5d9so1079326f8f.1
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1738769387; x=1739374187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=iHqZJuPzakrIGrXZvh0NhtT3xQClZgTsjltI0L2Y3hRHjkZnw3PreFl4t26TM+27qn
         aE0GS5lFgVV0hOkdZFWqcFW6ZoZObwEab6f4s4flMcqGoGNm0Mmpr1UAGsG0ocs1dS0j
         vAjGsFlCGkm+ejGJAk3XHnMYVrW6DVbxdcZBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738769387; x=1739374187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=hsX3FuU0cImQf1pfjdggAAYj61WdhQjGd6W81No1H+NUNSGzpHT3bDxg9/FbN8Ogn5
         G7UyuEddAFxaSBK1+6VALehIFisnnCKbmKwqAvgVxMLcZnPeh0HX6dEbecvnL3C5K3tv
         gDOyW01J1OkOPg9kAdq4S1evWneggqCqJ85qr94x3AVC08aYCvkhacDy9529wY9JP+9M
         hzhT9M+nrrutpBatkKthCbTJ3eicujrDHRSzsVAO2+VSjVmcyJ9mO6LtCpPDXOnJgCJ6
         cbnu2Pm38faY3Ka5ZsiU6S/HS9kB5LYS1xNPDrpv48BSlQpoI5acnHFq2RR1ivjGd6fH
         9ITQ==
X-Forwarded-Encrypted: i=1; AJvYcCVee+29lmHLfccsTkNuZhqszBz1hkkcqfCEmvuvWVA74HrlUlvEGgmCbNYdv3fcMY/uvt4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkoHy31qSUaSguTR3+TvyoradK2xPX2I1j8rq+DO7+G1tDsjKj
	GkA50BfHmTFLyxH65k5gER+qwP+Sk/c4T8zfU7JOJ8GuheqH5htvDrHKZiTEE1g=
X-Gm-Gg: ASbGncvxWZC9ovUCV9enY9tXq1z1Wc0rXnHV9exFXO+8apXvjYm7mbQ+uJ+NOKDRtW7
	FAdIMzaz16+Di5Z7Mc/xLb40N/S+xVMPQsa9qqVvZmwMC8Ew4gtI1qUi5EttK+B89ITTKpxF61j
	2kKubFN1nM1EVZJES951dmR0zSjHh0d2uFFt3JXnTbbWrOa0I1CGppUd0ep2m4OTmwKEP3JHkKH
	tOADAW8lXYsbNaCeKI2d67yyljwbtV/D1Tio3FBN/gMYXXqTZNq+ETIutWxVJ4Xwl0U8/EDH3iY
	RJnPh6+fMDBUlWLPKER/wQiXPmHdUfeZu75SEI9rYzUgYu1VHiIRZ4e4
X-Google-Smtp-Source: AGHT+IHUegMKoF3Uu+JDrnonpKTLGgAqfUbpAC5vcQvzwsUpc+CNMtcSoxp8JpOvJyhpCCI3zm2NQA==
X-Received: by 2002:a05:6000:1868:b0:38a:4184:151a with SMTP id ffacd0b85a97d-38db48fdf85mr2428469f8f.37.1738769386468;
        Wed, 05 Feb 2025 07:29:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf999747sm4475386f8f.19.2025.02.05.07.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:29:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Wed,  5 Feb 2025 16:29:36 +0100
Message-ID: <20250205152942.954381-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use aperture helpers to remove all generic graphics drivers before
loading mxsfb. Makes mxsfb compatible with simpledrm.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

---

Changes in v3:
- Add 'Reviewed-by' of  Thomas Zimmermann

Changes in v2:
- Use aperture_remove_all_conflicting_devices() instead of
  drm_aperture_remove_framebuffers().

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 59020862cf65..e5eb644b54ae 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2008 Embedded Alley Solutions, Inc All Rights Reserved.
  */
 
+#include <linux/aperture.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -361,6 +362,15 @@ static int mxsfb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_free;
 
+	/*
+	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
+	 * located anywhere in RAM
+	 */
+	ret = aperture_remove_all_conflicting_devices(mxsfb_driver.name);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't kick out existing framebuffers\n");
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto err_unload;
-- 
2.43.0

