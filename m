Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470322F29
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733415879; cv=none; b=UGAw98TedBevJcN0pqainxmqrX3qQGacYS/qsQvvMxHeFid6+3lXShwFygsChFYp07XLFRGYda60M0EiExPNhDummsDuX5s0FadX4nyL1GDVen1F8dTkntOgwbvo5HKQcyf4ULXoNI8CBsM1jc4w1edRtLqMtHbCvEou3qESSgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733415879; c=relaxed/simple;
	bh=dNZEbm7bSlhbjJGLhWJD1Ps63pwrMUfHSEN/U6Xa5j0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u6s6S3Y/mIABz5L5iXJFgO0t5U3pgv9awvGwlT7Zqh0M0zOtWSBsBnMhSNvocRO6SeBCzXgF2DQg99gwX9NV/PwkFIQ30JE4xACQHyFBjoROfxWJjITQ+SaN87F5dFm0d2I06TFgf/Qml7pvh/YgZn4wU7ICZvP47LbmBnbUIvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=K2SqnFss; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="K2SqnFss"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9ec267b879so212379566b.2
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 08:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733415875; x=1734020675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+EB++J/yowUMrD7IvepBqWDVig6KUMpfQ1WpjD4ens=;
        b=K2SqnFssxMsml8szpFgCz80kxl78xs9aBKgmrdc64oQxyy+pafosq90S+8+tblQaSS
         BiFl8Ta671pg4Y5HocmDIJ5jp+l/CeKac8v4pJn//99fV3jQ8RdS2QfNsTB/8TdX0fKm
         TZsQGSqfjBxUe0QRf3MRlXFQaHh2V2WuelWO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733415875; x=1734020675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+EB++J/yowUMrD7IvepBqWDVig6KUMpfQ1WpjD4ens=;
        b=gwPVAJf8gmOlote6cQ7S5wrAfredSYNchmLpQN5uIrS1qDZRMKdp05625cHAFqXGlS
         qoFv9jyii3E3xVnUkRF7gLBM8kjzgvO0ygAhLuVeN8trV8OPwNrAPz5RHDtIc36E3PFQ
         9qHM4ad0ojKZZxAxdMHpu742bw5yasGNGJYtkrRvwhU0t+I3nAiWOzMrQApeqaY/JEq4
         5Xhy6Ot5cz8njLdr06ANBKbzPQyeqxkXjruvTwNgXFDAPFLsV2Y0FBxeDuy4AcnsUhNu
         Frm2QYiOT8rzYLTioRlObjfal6NBiRp+irjgU1L3zthyKW7XxpoH7+U0OOno0DgApIyf
         hCKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqg/hWGugepKxc5p4jLyYDBzQaPAE0YNqRlSxEcd0w3INImWj9MSSCXqplGgRpOf1QI3I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjb2ZeSgTmr4PJwz0HVrg7PUIGxDMAK/OkjUY8yIiE7uLcYfC7
	+ZTDg5Bff+BFJpS6v68ZPX4ypS402EupfGAKkqpj8viQiY+xbMBucApUIRQlo90=
X-Gm-Gg: ASbGncuo4VjfNmdOTrLlK1B338oV/3QddvLK2Hqspmzoj6t/jh4h8h2xX3sA8uWBRPb
	g0pkk5zuEkelRxOEqQijzDmtbKBobZP2cAu8m3fXhGtQ0UBdNmjI4KwLqhrJB7Qx2HRfXHoc6di
	UQjhk449ekCGPHy1MNzbqQji07D2OYU/S+3Ne/fudgYs11f+EEROwJ5fFcKne6GLWUVuQ1pNM5q
	gxXTV9VeRjd6uuOAXm1jt0gC4bcd9hQrCydvtoMbJmya40nkwlSPAmtU+kz2oRyDiFovTIuGGkx
	x7S2bUUAwbi7UBlN5LVinXSG8bMDHzjDxmJwseaWuopXKA==
X-Google-Smtp-Source: AGHT+IGADqZ1DS4WW7fjZME67XfYyJ9/Ms38VwzFpIjDiSj4wLXET1zw9ysNdFxbGcj293rTqfarbw==
X-Received: by 2002:a17:906:9c0f:b0:aa6:24a2:697b with SMTP id a640c23a62f3a-aa624a27056mr315906766b.27.1733415875558;
        Thu, 05 Dec 2024 08:24:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4dee6sm112286566b.32.2024.12.05.08.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:24:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v2] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Thu,  5 Dec 2024 17:24:23 +0100
Message-ID: <20241205162432.1803869-1-dario.binacchi@amarulasolutions.com>
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

---

Changes in v2:
- Use aperture_remove_all_conflicting_devices() instead of
  drm_aperture_remove_framebuffers().

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 6b95e4eb3e4e..10da8b54f4c6 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2008 Embedded Alley Solutions, Inc All Rights Reserved.
  */
 
+#include <linux/aperture.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -362,6 +363,15 @@ static int mxsfb_probe(struct platform_device *pdev)
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

