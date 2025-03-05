Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64471FDA82
	for <imx@lists.linux.dev>; Wed,  5 Mar 2025 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741183776; cv=none; b=aJSJrKh29YVO8KpY3Mh/cZw7h9oELcnoFElbbjqp4AisVCs9RR7BshZXn2XzffrPVmM2hH433n6QkUdyn71+sFcmejfu+SOUY8T41bsion48Fma5npB+bp6asPUcMvQ4nEYLlbdlmSKkNbnayoePHmWBcJQI468ynbiYbSFRqhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741183776; c=relaxed/simple;
	bh=FvXY0J6HFmz+F4kGGhdiUtByaCV/93S7mXHV8f989j8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U2ROjpQbMRkUqRBwO8Y+x0sa5eUV3RDXn1yVaVBRB7TDO03IpuIO909KKIyzS42fXCbnru3F5d23KzdI4U6Cp/WiADIsGORp4YYsAFTEn3mPfBxQvtXnvZa/EZKjGxH6k1Ba1WWWXFZtRprvfYhKJiR4eCMVpGxQNf0pWmwZBKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fUVMj/t/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fUVMj/t/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390f5556579so3035189f8f.1
        for <imx@lists.linux.dev>; Wed, 05 Mar 2025 06:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741183773; x=1741788573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=fUVMj/t/J26HsUB7Cv14N01+XGbfPnsFFuthCygGszmnfQb1jWkt6SO8R03G54eg4k
         fElTsykvTunv/vWVP2A9mRj7NRdsMR22yyQqXC96W9ZQLirOAmQ59WBI6ku0aPA0zUfy
         d0dsLkDGmvZFVYsXOE3u1VAB+q59YNKjY0rxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741183773; x=1741788573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=xKuqOsJmjX6zdbOghTwWoSvdJVcu9vbEEci3tavnZOjk61YMDipw0X5rJ5T+TIHieb
         VQp9fgv8KEt4QWOER5nLoTSbiOrdETGrwxpCgZgG97cItfJnb3x5SjoFkQCE2KlGCGfd
         P6OnCnMHgo7v+yQcpJZjP7UielcJf+pqSzPLks7A6sjlMeiygUkMXW29MncJeDZVNjF1
         yOYUOnC9mVxovt2UVyMp4NWuWUMcZIdLPvOBAwm59fivlNUz/blg5WjEBDyTOJEY4wnf
         FxnCOqY/gxHHd9VgRnzBDInxIMBqHcgzIAix+Aus3H3e4L6yynmQyqDP0xy41SZpoE/E
         QWrg==
X-Forwarded-Encrypted: i=1; AJvYcCVA3vXLJjZbzfdRdDP2DO67Qa9V6ZKAQxUv2pPmvkFHiqC3LB8xg+k/cOMeGDgHF0VM6c0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxisl56EVZg7JX6Y9NwO2klbI99cNh2iOR/6VzXJGMYFVFjfc2l
	PUjypDoY8AAdglyLbN2dYoX/IIQ7ZQeDRp7THOt04xkZqyvYxhulfF/sUlwO9u4=
X-Gm-Gg: ASbGnctiWiNOjrHJ2PAeWe31/qJ0vUMmM3MaYRCPhGVrwLf5oD/VT0o3eO7AKsTVuGj
	1IXOBwUdbiJ9FsggKHffEM3Y+o44g44M5OGe3ibfSILT2Z+8AuSm6oZjbzXDcnBH0mstPpdmC3G
	FRUnee2sJ0f49SNzV/g5YiQo8FOT03sRwcz1GzCKmWQPQ2ZL8eMOKjpMfliNi6JIOJuO90jBGcv
	e5oUEyAnJrvaSS520oY+hz3s0Ge50Soua9byIxnLKlk/F18cEb8hnSVYPK9aqwpUrNxu9cCC2Te
	inlEQXEhv0XQl9WT4OkhU1F1Z8vqd+WIaRs5Cs4kFGncvICv3tk8CuTlmWZKiQLExWhE12+DBA1
	kkVaf
X-Google-Smtp-Source: AGHT+IHdccH4w20LAtL5Tnt1zvD+qT2oMJLO3EagpAUtyRarROFNC3ETwO4Ig2JSfhHI6IHFm6KeuA==
X-Received: by 2002:a05:6000:1546:b0:390:df02:47f0 with SMTP id ffacd0b85a97d-3911f7bb461mr2279778f8f.42.1741183772882;
        Wed, 05 Mar 2025 06:09:32 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:334:5d7f:7a52:9e84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4847e62sm21374802f8f.67.2025.03.05.06.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:09:32 -0800 (PST)
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
Date: Wed,  5 Mar 2025 15:09:16 +0100
Message-ID: <20250305140929.174398-1-dario.binacchi@amarulasolutions.com>
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

