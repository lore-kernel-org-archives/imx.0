Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA34730F7EB
	for <imx@lists.linux.dev>; Mon, 18 May 2026 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109396; cv=none; b=bzjpyJnM2DxtklF8t8N7n3x7X06ClKbN7n8FN3LZOKFq9vK3pXiIdPUhwKgGH4EFwkHonCsfA4ghj/pZhyki2VuDGThjqBPbKIABno/YwDw17oh9+jTqTTxWTmDNV9v8gNuMvCT7f6AN0jkZ0CzU32/Dc0wvu9tGnxVC3E+Hlr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109396; c=relaxed/simple;
	bh=wssxgGrG4IDoGJpbDk8e0YhsxqyFUXYrnmnvjioRl3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUZW5lu5/p1Pppc3E+6TMgr7PQjzQ7FABXSu+fCypsVxooIKk9Jgg/Ys+doopPWda+USgwPUgb1NUDQDWTrEML6Ozn2aRrA5DFSAzjVEFKq7MiYU6ROQtWbk6c6tD39lyUoTkMed3wFaL5a1Y2b/8K/owScOmtBTkzGP+EyTBRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKrlU9X8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKrlU9X8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b788a98557so12809645ad.2
        for <imx@lists.linux.dev>; Mon, 18 May 2026 06:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779109394; x=1779714194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/IrfhLvzq8OFRdclHXEtAh9TYJ/Z5qr3AsT/nk30p7k=;
        b=qKrlU9X8uk4ek6svskC53EekvydYxt7eAzz7Rg0wV15LbI3rJjy349wpohhUQCNWyI
         585LVnpmx9DOgwoSkdtXuO+Y7Ad3N6yASmYpu/835DSgn1x/PTb8gkgGf1s6YRP8nXwU
         6Jn/b8nUXYzk/fCF0S93WAwxqGi/zoUOzUz6EJRoZ17QLur9s2/QHVppd7TN03xi1W+P
         eVJpFx1mXv0QFpQAcM/fDaOjLszK2ByTeRcaC3jTvyksgwYyxCU06z+IdHb+NwzVNuN2
         J2bLy+z+Az4XipibBO0OEnwsfoc/Ob+jxjBoRmdDc2shRp7H/WPSeeDQjLKJ/HZNTZt6
         WeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109394; x=1779714194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IrfhLvzq8OFRdclHXEtAh9TYJ/Z5qr3AsT/nk30p7k=;
        b=kRT2Nua4ox3wx/U3Ovxigp7fRweRdO/uMNhCaxth3ULbgW7C0eI2QnmvEDQeRheNWa
         ARrBjsl63fBLq4wNKyaRKCFZPubXozf7fDjZ7id/s0SpdAqlQC0yW6sBtmZsnihYlNsp
         WBqrikQ+35ulmMIa4ld1YG/a2PTjW42Kaf8DYy0spcoXZ5tL12zE96+7UQbkWrcaHloP
         5qO48z9UYnqKNB/UFBxR/q7a8G+d5hlh9yIeQVP+Gqjv7WRsxbR8XFtojmZRnB++rfxk
         xxbGqOltnsfakDT6WdNrSIr5SQ+pGtwrmtuWH7qie9gS2X2shxUgmiq73b0UlTiG25CA
         W+lw==
X-Forwarded-Encrypted: i=1; AFNElJ992ovbo7LGYzehp9g9i7FXwam/Ca+vbq+sQ/wMSsXyulosd3rlflBtpCQFbRwjQmCH5Co=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6L06OefM7VIYCC5N/CHRRBeFMKvEgpas/B1JZBNu+FMn/J9+a
	7G1kpptAJvWcyS6mvMgYH+/hqOnDB5mONrA7/3ONJxJcIlwEA7OIzeav
X-Gm-Gg: Acq92OErMOKwfEllWVZikKw/bUdkCOBMykeAUEyAQFlUntIhmpUhPDqSPpvZWk44GRY
	wZO5Ps8L428FuPgmV5nyr6k5Al9Aao7T2r4ZuwDBcG6RNY1YsZsnvHMvpS2qkHddC2W7m9+EPMK
	Um7Ox2IhfaX/uY9lGhJFXRdUL4la+eP8mW0wHRvA7/Lr4oIe7ohNj9CV0Qhp9ryq3N0NRJyKhQa
	5zBSpP5QW1+zVuj+rAly7jNQmuJQcRIbv/KhMa3QeiJyFgzj1cE5tq1ieVDvq68uOEwmjykEMK5
	mQ3QK+VB70N1Avw5FtzlDyg99N1iJNB/g4mIuI5NC9QltCZ/aVk3uVm3bTXnDwuaOiN7MWAYWha
	V8bfBbHPYYUb7Mw0+pbBK2fqbW1hRMcfQamL6orYHf0nX7OeOb/KiSzPmSmI+TtqM79tNFxkK0H
	BQRZEHKbeqF67Y
X-Received: by 2002:a17:903:28c:b0:2b4:5b82:a8e3 with SMTP id d9443c01a7336-2bd7e8fdd1emr162494125ad.24.1779109394031;
        Mon, 18 May 2026 06:03:14 -0700 (PDT)
Received: from lgs.. ([101.36.106.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d2360e8sm159283565ad.82.2026.05.18.06.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:03:13 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: imx-jpeg: avoid double free on video register failure
Date: Mon, 18 May 2026 21:02:59 +0800
Message-ID: <20260518130259.1001956-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mxc_jpeg_probe() allocates a video_device with video_device_alloc() and
releases it from the err_vdev_register error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  mxc_jpeg_probe()
    -> err_vdev_register
       -> video_device_release(jpeg->dec_vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free jpeg->dec_vdev through
vdev->release(). mxc_jpeg_probe() then releases jpeg->dec_vdev exactly
once from err_vdev_register. Restore video_device_release() after
successful registration so the registered device keeps its normal lifetime
handling.

This issue was found by a static analysis tool I am developing.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b442dcba02e7..fe8a373576ef 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2943,7 +2943,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	jpeg->dec_vdev->fops = &mxc_jpeg_fops;
 	jpeg->dec_vdev->ioctl_ops = &mxc_jpeg_ioctl_ops;
 	jpeg->dec_vdev->minor = -1;
-	jpeg->dec_vdev->release = video_device_release;
+	jpeg->dec_vdev->release = video_device_release_empty;
 	jpeg->dec_vdev->lock = &jpeg->lock; /* lock for ioctl serialization */
 	jpeg->dec_vdev->v4l2_dev = &jpeg->v4l2_dev;
 	jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
@@ -2962,6 +2962,8 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to register video device\n");
 		goto err_vdev_register;
 	}
+	jpeg->dec_vdev->release = video_device_release;
+
 	if (mode == MXC_JPEG_ENCODE)
 		v4l2_info(&jpeg->v4l2_dev,
 			  "encoder device registered as /dev/video%d (%d,%d)\n",
-- 
2.43.0

