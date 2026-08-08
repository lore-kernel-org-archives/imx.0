Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC983E49E2
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786191884; cv=none; b=SuGqHmofXTQqXntLUAHpwJTLYLStfqMu4rA6JLbZcB4WP2Kq5S6aGlJruhxYU48I5bEjWnZv69bvVb8SSbus3fhmiMgK7dSDsjMX/Prdd4PQxLv6Qoh+AUcwmRfWUba2rmNvDTkOtlS10rXqySIPuTSXK6BGZ9QWnOmE09XCZeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786191884; c=relaxed/simple;
	bh=lELpf8Qvj2JHXzcPUsvF7tjmAK7XFrjheBsIKKvTWTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m/KfoUtnX8dL7gLttmojR8dbw0YA3vFsBfMVtp5GIPOq3NUBjto9MGtb6EKEdIKQLiMrT+DsNzK+N9GA4LetotSEsS7WcoGOUlv3Rz4AOBiZ70o/m97nHWKySAtsMweEe9BZU2b+B3A6+fH07HJMZnIuw0MJkxXhSZ9Qd5B8eAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pK7bs7fy; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pK7bs7fy"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so409231a12.2
        for <imx@lists.linux.dev>; Sat, 08 Aug 2026 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786191882; x=1786796682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5h/jAHWXWXDOWdVoAFfHtjsJVJE0oZMUnASj9to5Sqc=;
        b=pK7bs7fyZU9xTYiGIkZ4N8F4en3jzcOoos9j/kF1jaU8QVPKnYj1BPmO2kuGp0tmsD
         HMWJAxoMzwYfy29gOxlp7mPtDQTh+6/axA8eVHjh7ZMDr16dMNsGYC2cV20357oY4nEa
         /cKa0Lna7SLzcfk/sBtE5GaAgHjbr8l/LKP3Ss+w/WlJO8cRH5l6YYIuKBHQvFQJQHty
         dsOGZlWCeV67dYluIJPjWZglPjtGd7dMrOC/4z1zAuxvBLjeCAusrErQrpiLQ576PGj8
         v63lHkr/AsPgUmlx+KexuItbLB046E57W0Q2IJBTtC5tvcjJeSropGJqRkmayzR3Si46
         JtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786191882; x=1786796682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5h/jAHWXWXDOWdVoAFfHtjsJVJE0oZMUnASj9to5Sqc=;
        b=SZGUWGWEo9cUPKXT0/8kyVZa+pRgaquU6TH+1d1M/kmln9vV1yNtKoczfF0++S1Bug
         EEmwAIfPnyYrIJAOFu39R4ZCF/TILiZaSt1nSpBjoH4Rq9oPCUOSaBNef+SUav3n3xxb
         JpsuEdTbUwseTT0lWAMPJe7ciiJ69xVrSJkVxY0D2Ay8svtt4egTSK2qSL71ZbK7PYcP
         DjGMAQF2+PnKIY33E6CqP0nD4U7DO4EYSffXwu8gICAn6Bt65JzDWmqz0ZQPsLiGihc1
         r+xMDzHWOFVedxOOyXCI+O8Po2Go9JlU9nSwx1e0whoVyCyUkaAXlbeNGpmi+Q1vtZcz
         EL/g==
X-Forwarded-Encrypted: i=1; AHgh+RoB0WFWFQShy8C9NnC6RPS2wk74itBzPP+YiwpuqkXw1gXLj4oTD2+F473qyQqKumWeQYM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpTOneCILm7omhSXYA8+KzFjcFlaMlw+SK5x6gtATNEbD58Xk5
	Gvu8VwgaWBxUYdxT4L4arhXjDddxWcgcnE33tluoqkepV3GHfPy1ZM1u
X-Gm-Gg: AR+sD12Fxou+aZPkHRK73bBM+3JClHcCyw99bo7XmvOMxGM5oByo0VUZqLBNbljCWj4
	Ync3cb6I5B9PloXqYBJzgPo0jZ5YOo0KcozsM/ULHiAV5CimdliWSTyGSa33UWP07GA2H+P/kP3
	noGOF956eBMmzLwqN8j5SNvk4ie2HnfIW/fYZJD638ZuUlFftluTVPd/SVPcNF9c8CocL4XHIYp
	E6/RHCizNgkHfImefgMEKqe85TgBDMpI6zXAEqCj385HF/fXl/K3d/YXKnqJmKN+7Mn889eiH+o
	Ko9am1EUG8ekvxx7XfAHfOdJMI9fWm6/uo/H2f/OXTcCUffAOqq5gcD+z5ndeyj3M3QvRJYcLLa
	YkMikAE8ErgKTTMnSnq7y9xSpqyQI0iNDs+64zy8X52OsV++Zqiv0lJrDJxxc+SnOETQ6SYTB2x
	dpwEH2nbqpG707fdd1Tqhn8fsQK6c/7NsZpSikU7dWy0mkzjba2LHm5u+8Gg==
X-Received: by 2002:a05:6a00:c1ca:10b0:84e:915:d7eb with SMTP id d2e1a72fcca58-84f2e0dbfb7mr27063894b3a.37.1786191881768;
        Sat, 08 Aug 2026 05:24:41 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5528adsm2145040b3a.45.2026.08.08.05.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 05:24:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
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
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/imx: dcss: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 20:23:54 +0800
Message-ID: <20260808122354.2825209-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dcss_dev_create() calls pm_runtime_use_autosuspend(), but
dcss_dev_destroy() does not call the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

The documentation for pm_runtime_use_autosuspend() also notes that it
is important to undo it with pm_runtime_dont_use_autosuspend() at
driver exit time, unless runtime PM was initially enabled with
devm_pm_runtime_enable().

Add the missing pm_runtime_dont_use_autosuspend() call before
disabling runtime PM during device teardown.

This issue was found by manual code inspection.

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 7fd0c4c14205..51398852cdc2 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -240,6 +240,7 @@ void dcss_dev_destroy(struct dcss_dev *dcss)
 
 	of_node_put(dcss->of_port);
 
+	pm_runtime_dont_use_autosuspend(dcss->dev);
 	pm_runtime_disable(dcss->dev);
 
 	dcss_submodules_stop(dcss);
-- 
2.43.0

