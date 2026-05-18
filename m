Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C93396D1C
	for <imx@lists.linux.dev>; Mon, 18 May 2026 21:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779138803; cv=none; b=N44JKXNj0KxYhZ2/mwoCOrTaiUbOJxS+k+Vt5dzgyNrId8ghDX1ByeqxeiDD1S8Af2IQCT+x3nmCa4+qOKGKgLn1CGp0RZpntK7XL9eXTXIxx3l46qL09Vwyn/sWUoWt+GMp8uZOlpvI3nSggezzi6wE7niuM+DNnM9a4Ncw22s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779138803; c=relaxed/simple;
	bh=f14EBHDq2i549qJGTfXyZXOwE38/F7SK5VJW+mFje14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fqEoQrSqoZasLJVix9kizcyUdvSJbfr5wJ5a4B8kaoNEXu6BRCDfBWtRZhO0Kb6YJMHY4OC/0HBR8YbCEo1XusBgVUDB5tYGH0dk8ZWHQ1s+aHEO9WfRb0ukVLdWhX6UAKme8CDOccpc1w3iSpz/WnciIcDsn4xs5LxnAazB+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tbk+1Wb9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tbk+1Wb9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so1084779b3a.0
        for <imx@lists.linux.dev>; Mon, 18 May 2026 14:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779138802; x=1779743602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5kHLteZtDYYZ0uPDSlKWBJ8+KtD0htFyv3V8YBKOEqE=;
        b=Tbk+1Wb94bIaK95H3AHGRGpFUJGsgq117oQGTggRQ51uKr0iWmWSpl80Alry8i3cqt
         CflsesDzxbmE9vI8y1mEVEGEHvtyZ6yxfXDoJT0AvDpI0NUgoHshGBnmSQEt3yNY8lGn
         ZoLZmv/UuOoSqOfoAr3MXRAeA9jMhA+QyKF9NpXClMOBYabpPhGNLTZPA+SUF26Txpy2
         fh4QGhMFL75WT1I9kyo/FxxGvOi7CQqVmklFasd5pmKk1MX6Ow3sYZyVtlWoTIc64KAk
         RLqVLORMzhOY/PRglZ4jHbx6UXAtMcCnstbkP3j2XTiumyulaCEbq4bovdr4gp2865LD
         Z/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779138802; x=1779743602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kHLteZtDYYZ0uPDSlKWBJ8+KtD0htFyv3V8YBKOEqE=;
        b=Ttws/+QxptC/Vxhdj7xZEA4EtvgnkSEWGXd9eQFZJigpzmvyyQmZiE7q4zWBPIgGSV
         +LmHI7x3XLAJmzv6Hqdx0IqE1tGImlsdSJ1qMKOJCpPbONR70HGBPUybqUwfjshO03iO
         SXk/aZBHLiDNydh5YOillgOgYaZj2MA0WjrD/z6AUH46rCtfQeFgtFZqfIwUjM+T4w95
         wvNbTCP6ZjYAq4UnG1nSEo/1QEpbleyT9C5V1aBiQTfkVoALO7lgWctmnHI26yMGZeWw
         0u/4Eh36qYG+KmoWkzvQH7iWzXFl8rOOy2I5wOxyB4kf0qCeL7NdJ+fOze8rbJPtuE3d
         Ho6w==
X-Forwarded-Encrypted: i=1; AFNElJ9ezo0tFdR6B9wUREucA7xh8KUj6PzbSFR4SWpAg68Wb+WleNszzP3JiZOxznvbU4Hw4DE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDEk81fqa/ozClEZJZDJc4Xx3MG23stMigbmvM/1HB1LchWeF1
	PRJ6c73VKcT5jOsulMBuTGBtRj8V9iXYM3kSyH2mcmwl6GMheLJgnwbM
X-Gm-Gg: Acq92OFFOVDOniMb7IAjsG+rRMZFkM85bPK6xYZa+qQBKGIRVSYEpzCZ9Figoqv5y+F
	WVp0KQmYO0Ms4KBtDw2Tn0ZOe3pba0SdKvrhZ4tM12US9O16680Hcnpyfxj+SNBMoqctoEimNbe
	vGljDyTEPIoS2J0LUoNQVY1B1VhDtW1AS8g8qewNyK+WxXAPt3YxFgySXuA0OPPe1Vzr7SMCYu0
	n4GcKe7oKICBKOpaoIFMWo6bbNltA+bHMc65/0v+KNtMjm5dsGgxXsxkN+vUSKDxtUGQbG8AsfN
	n9oMwI4hG5u3qnYYraWGyxqwHvZe/1TrfTPho6/rDw0uGW4CVCT+O1k0sHdBtFHXSwoqO8id8Zk
	DZSGOZ518a2DXJLysMdtQO8aN5Dt7/CWj1EiqSU5q1whA1b2PKxAyj7UP0M2HkDnjZTd6iUT/ON
	1QBexI1WceDvZJn04NsPTMWoMedg/YXN6b6FrWzOcnEz/SjlwQBaag0vFrcdFhGc/GpuzfCnRSS
	fOBqo9q93WS85zdAAZ4qHySgT42Qhswt3zldLK5AdrmrA==
X-Received: by 2002:a05:6a00:88e:b0:829:7e6d:cf22 with SMTP id d2e1a72fcca58-83f33dbe4famr15918075b3a.43.1779138801540;
        Mon, 18 May 2026 14:13:21 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196638d0sm18775306b3a.7.2026.05.18.14.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 14:13:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Helge Deller <deller@gmx.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE IMX / MXC FRAMEBUFFER DRIVER),
	dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] fbdev: imxfb: Use of_device_get_match_data()
Date: Mon, 18 May 2026 14:13:03 -0700
Message-ID: <20260518211303.10777-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_device_get_match_data() to fetch the platform ID entry directly
instead of open-coding an of_match_device() lookup. No NULL check is
needed as every compatible string has a corresponding data section.

This also lets the driver drop the of_device.h include.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/video/fbdev/imxfb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index a077bf346bdf..7a021da0a32a 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -30,7 +30,6 @@
 #include <linux/lcd.h>
 #include <linux/math64.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/bitfield.h>

 #include <linux/regulator/consumer.h>
@@ -880,7 +879,6 @@ static int imxfb_probe(struct platform_device *pdev)
 	struct lcd_device *lcd;
 	struct fb_info *info;
 	struct imx_fb_videomode *m;
-	const struct of_device_id *of_id;
 	struct device_node *display_np;
 	int ret, i;
 	int bytes_per_pixel;
@@ -891,9 +889,7 @@ static int imxfb_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;

-	of_id = of_match_device(imxfb_of_dev_id, &pdev->dev);
-	if (of_id)
-		pdev->id_entry = of_id->data;
+	pdev->id_entry = of_device_get_match_data(&pdev->dev);

 	info = framebuffer_alloc(sizeof(struct imxfb_info), &pdev->dev);
 	if (!info)
--
2.54.0

