Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2168A138490
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729872896; cv=none; b=Hx+TWKgOoTcX42E0zJGplKI5QpYUwQ8icjt+Lo4O0XejqYVWIn9YnWAFv18DMpzVqBlugSR6lP3kFsHapweUrZBzG2m4rkVHTnS9PmbZ63x8II8/nuLghp1BghSn6jO04FPvrF7CWLJXFVLSJBZg7gOJaXy29tMvX5WnlnsU0ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729872896; c=relaxed/simple;
	bh=zXNxA16DutWXewQPnZ8VHN2QySLaJsJ0j0Tu8vE6LFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F9kaAGToeQJmuTmLvoJNHqiyO6pTNkG87n19NJc5+D3ZUPvOdXyEfjHesmyWOYAoLEyo2nR8GFaoB4jQC5JeiQylQzMDGFOELGK1K8SZGVde9QKWwFFBuHU6E3Wjmnl0qXEI5XoHVdRCddHKF84zyAIyP6dXoiUhdsJ7Lz73SkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Obgeyo86; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Obgeyo86"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539fbbadf83so3071995e87.0
        for <imx@lists.linux.dev>; Fri, 25 Oct 2024 09:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1729872892; x=1730477692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GN13PFFztO+RVXylp070AHdpchWjZze0aJo+onIOSo0=;
        b=Obgeyo86vO6ZLM2zkpW70yqzBpZSOlViEqekxImT6NqzzkQ35TQAX89BVAGnEPwSeF
         26qrHWeBlH1sWGsTrhNUzB8Dtf1nMfERkjcwtenm4dG/JS7jMDA43gyJvcMCpJGBPk8G
         1yYlEoICOvSnQ/hyy/ELu2zKEXyzADcfEgry4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729872892; x=1730477692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GN13PFFztO+RVXylp070AHdpchWjZze0aJo+onIOSo0=;
        b=VxwTYznqti6GwhMvvfCBNR1lNurfTcJ0y5DMzeO1zAx3RO3SQj4HilS3e9QkSKc9o1
         QMDSEBoFNp1ua++kfBIucRLF4YcW7IxsuRkSGC0RcEuEu71AmpCkOYf74KWQqo5xu87W
         ycHKJnEKaKRwlFzl+FpT6DUj2nTjfY4X0S560rwhfOOgTEfN0PGH5P8ZSqKTI6w8gUYY
         WWiIW9fs5sysjBbaHiRIsYUw8XoexKo7RttBLbNPmQqs2+TNVzQFvjab/I0YjqJRWhEd
         GA2tFUNDz8M9WGBQxSniYwGSLF4iLIkpw2+pcDqRoCmS8BOsyzR99yPJdgug6oWkRKUp
         G36w==
X-Forwarded-Encrypted: i=1; AJvYcCWELaMFpyXeM2AnMFSz0bCucHyJURrEFi324GkPBf6aCKnj/ZuKiNxh7OS9O51nyzqBPRw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCWVcP7RduMA6OPMi3yZoTCrEtpYwmfND186RJxuWVxYD+cCDt
	o0lsVw+fl0NbOz6vPhihCKne2bP23gMqXKM1ajxnTAaoQZp2LG5XmFstfHhcbKo=
X-Google-Smtp-Source: AGHT+IG7Ko0ZaVVixb42kGSXnwInD9+MTWs4okp1RbVG6KUd/qf/uSPa2qcn+su4qqA0sbbCFTHNBw==
X-Received: by 2002:a05:6512:3054:b0:535:6992:f2cb with SMTP id 2adb3069b0e04-53b1a36c6f3mr6404231e87.42.1729872892194;
        Fri, 25 Oct 2024 09:14:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b579613sm51759005e9.38.2024.10.25.09.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:14:51 -0700 (PDT)
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
Subject: [PATCH v2] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Fri, 25 Oct 2024 18:14:25 +0200
Message-ID: <20241025161435.4114877-1-dario.binacchi@amarulasolutions.com>
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
index cb5ce4e81fc7..d140984923fd 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2008 Embedded Alley Solutions, Inc All Rights Reserved.
  */
 
+#include <linux/aperture.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -360,6 +361,15 @@ static int mxsfb_probe(struct platform_device *pdev)
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

