Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D61C1B219E
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729766829; cv=none; b=LsPEPH51qVZ9NWpn55Ivl8zDuAuMDpRPZOMQYWNHuKPcWtBrZgrtj9982q6fjoNqiuJrShgoE1yys/9ODXiNwlxLRa0OMBCcUxuZKvBpLvlBOqAQ2l3HCrIAVZODEpAeuw0MPtUJK06+Ir5iLsEPjRNdlYKEqSmqNtpt2GsUKQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729766829; c=relaxed/simple;
	bh=J+Ml2vYTBt/Fy6h5aoBXUKaZKw4ZkG3ADLT7XdI9X74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qH32GSuzdGwugXXLHFBvdqUtAo+wjBIc+U3YEwRZELYiirmDWmhISKuYwnA7AqptZjbvVNQxEWymbWyFa6sXOBt9SSjE9bOiqrpLb1zyrE7LWtrKdygIv2oNdh+MiXL1uE1UyZdZy3qCyfIzoWmWEEkAX04ZmzGJdZrvN4GJ0h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=DTEcevbI; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DTEcevbI"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c99be0a4bbso946904a12.2
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1729766825; x=1730371625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9ybzaQqZA8Pvjk1KH4zw/EHpgyxOggbtBG60Qj3t28=;
        b=DTEcevbIfA7pFY9dDyxencE4vWC3lTIb1VjbmgonfTiXVioWpXnu60BNWUTd4o4sh6
         ncT9f+YlRzT0HhRlva90l6Ewryev+bosU67gzyxACrGKswo+4DzwJaR0uTqV0x5ZNoRw
         3txOviM2fj2tFQ4UAt5P7Tt8NFO3mPoLG+gGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766825; x=1730371625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9ybzaQqZA8Pvjk1KH4zw/EHpgyxOggbtBG60Qj3t28=;
        b=oLskzBwcfZ3zO/sVck07Im+vJuc3zvcXZz8SIOTk6G8305O4ZHE8z+B+ec9uBOIto2
         JGWY1JxSmbeREHE37KPaUxM0tw1IdGdEDhS7+9mxNarUUSO7tagvsGcvfFoYgAgwRxZ0
         SRgccKHgE2N3GVvOAe9yPbT1YXOf4y0SlpAkqd8oVwTmsqxgfliab5zS44OrJJUnz8mp
         AWMd+TejbFD1PixacjYr+LySiynZHkeRdL//cKUtAIAm08jPRM9OzC6yrmvreMnYIaka
         xCWE72MXRj8dP/YUsdgY5IKpECp8R7DfRaXMjAenEXAelg/vFkb2/ZomszX5nHEO4tsd
         MclA==
X-Forwarded-Encrypted: i=1; AJvYcCUt+dIpgZa1A+aw35OBdFFfMyKhazU2bIVhdGaGjeiwqmai1M1lcnLTx0cOT4ea9jAi1cQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvXruIhfRy6Q4npHlXKF+X4/8iwEmZoOHAecBx8otxlCBt320C
	3T2/1qX7DfloG+2Avy6Th0qWOErxLQzZfBFg1gEk5vQy20NC6vQ9L1yFq9wFoKQ=
X-Google-Smtp-Source: AGHT+IGhRRSH+oniiEMk6gBxA1VDr8hXYtyBVOVbECHZq5NiyEASc4rpB50zkmMNgG6T0wMWjBuJiA==
X-Received: by 2002:a05:6402:278c:b0:5c9:709c:247f with SMTP id 4fb4d7f45d1cf-5cb8ac380damr4405184a12.2.1729766825261;
        Thu, 24 Oct 2024 03:47:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:f79d:49dd:b804:3f48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72866sm5525261a12.95.2024.10.24.03.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:47:04 -0700 (PDT)
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
Subject: [PATCH] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Thu, 24 Oct 2024 12:46:49 +0200
Message-ID: <20241024104654.3483125-1-dario.binacchi@amarulasolutions.com>
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

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index cb5ce4e81fc7..a8d6dffcd02c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -17,6 +17,7 @@
 #include <linux/property.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
@@ -360,6 +361,15 @@ static int mxsfb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_free;
 
+	/*
+	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
+	 * located anywhere in RAM
+	 */
+	ret = drm_aperture_remove_framebuffers(&mxsfb_driver);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't kick out existing framebuffers\n");
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto err_unload;
-- 
2.43.0

