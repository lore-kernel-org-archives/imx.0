Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD0C1862A
	for <imx@lists.linux.dev>; Fri, 14 Feb 2025 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739545544; cv=none; b=fnXQlCAlrxAWb/mAoaTwSe4AdSVfmTq3mypIiF2HqfU3PbBM7Xswmx50mx8zF46WW9tPwKGelXsRtgx2JkdYZmmlnPKNXWjlzCfaF/UpPy6UoNODpBq4fKhsrYNerDK0Teca3QH2MtFOTW+q4ZCe99Q2mV1G+A3ZL1QSj/HunQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739545544; c=relaxed/simple;
	bh=FvXY0J6HFmz+F4kGGhdiUtByaCV/93S7mXHV8f989j8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fKF19UVuBgiPKZ/N5Q7+YJ//VBu6BwHTmPUsAd7AM5tqQsNqm+vGaJ78oiviW9+V+Xi4/3tQhARj5asJO7bTDDU8QN5K8GAJdzqY6mGuRgU5rkofacEX/WB/q8q92XkdAAZrNJcqigGRGaMlu6PR6Ru/a8v/EqO8aMmfF47BOX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=onemmsR6; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="onemmsR6"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7c14b880dso73565066b.1
        for <imx@lists.linux.dev>; Fri, 14 Feb 2025 07:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1739545539; x=1740150339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=onemmsR6SqmS8p7scYFzL8kc+M/chdfDAYfz2H7cSSnmMA5yxjV5Tmj4JRzhUaBT9J
         HKh+KmeqEeLCz8uPTDTufWRpT5IvEEXaO3J+oOqJCc0lZzkkftK1P3buSjJnBjnePnPW
         xC/wAghliXsOROJxlEtUM0qasemIwrXkl/ZQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739545539; x=1740150339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=oC5+oL0JFvbl0KbQfQKfEUwQyEewcgSBe/iPTa3C4PkRdzxPxRIB8WK9JpnLndPNrl
         UHyc9EwlbfITv94ocoAk3f0v8sdF6fUYihF+m52Kd8eKwSxnb80140UeutNAz/O4lEQY
         mLKjbb2la6e6kz9+dKxCdGlluwx9wUJ40wbLWWAi/f0A3WqVB1UuTPH4Yr9iPVblWdhW
         Enyx30U4WDCWMv2TbG46LEVNZCQyYtaDsXLexs/k4JCiPKQjHHAw/Iu/o8M8fkGIIrZP
         3AtktFNQEN70uZcmnIv5g5uNLs0J65bImIo5vxntrZhl4gJrHkbTyDfTmMkDZ77VDMfO
         ZlUw==
X-Forwarded-Encrypted: i=1; AJvYcCXerBzi47mMbfm7Hb8QGjzHoAxrP3FfL1Qh76jwMUxdVX0YtCa1CyP3x8NguphpPAgeM9s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfOOpkURbyu8zf0LdYs/6LyOGM896fJFeRBNyd7dQ6hHkHT981
	//uBdSuxuX7Nsi0v5TU095e5z5/x0mgLYbHnVfyCUcAYZhmNv472mBunpcsfRr0=
X-Gm-Gg: ASbGncvoOTRSqIQO9T6x8/DIiKLpVEDKyBoJa+mj9IoHCKfYX+Uj2zV6FuJbmNanQsM
	QdCgrZBWRUX+mX7VIEsIuApNtXweOd+i8gKbA7gt1R5pSjaovofFbNZ3dQDo1tr9jnzumIb3xff
	v9gckVIRD/O8YSlLhOZFHA+qyQUj/N6cs9k7jOvkZGBEwhDxb1BjaFbTJpshE97z4zpTAQcKcWD
	Avjd1oLCXfKReRn2LYYB+H5l6zmwAZWui/NW85P8j6mEWQpY5zLQGmVPz542LmZGCwV6lhkXyH5
	7P2jbUPWbj7WKNfoiIBggI1AmvBEyBQXGq9xeSbmfCR0aCN9cNg6HggK
X-Google-Smtp-Source: AGHT+IFZ+c7+go5Wo3r0b5Kv+36ob4O06Y3nn1YLZvsFSFjUvUi9yBoXLR53Qg4HfytiBB896uYB9A==
X-Received: by 2002:a17:907:2cc5:b0:ab7:d179:24a2 with SMTP id a640c23a62f3a-ab7f37149dbmr1273515166b.1.1739545530075;
        Fri, 14 Feb 2025 07:05:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([176.201.8.20])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dedddd5b82sm1421906a12.30.2025.02.14.07.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:05:29 -0800 (PST)
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
Subject: [RESEND PATCH v3] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Fri, 14 Feb 2025 16:05:19 +0100
Message-ID: <20250214150525.1505210-1-dario.binacchi@amarulasolutions.com>
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

