Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9438E1D5CD1
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 00:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773966004; cv=none; b=dcaKnja07iedHE+7DQlxvGRr65eG1Ug9ms8RctjytEhag7k088pC9IQ0Fxl9aaBZwHEHG6E/mZDOnHe4m+0Fu6DhTYoikqx8n8yF5toYWJaIzSpHdOKJugTQvCc7iVxI+EAuo0Aez26xaCspKMrJitJ+sI07/c7bC4q6hYc/faE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773966004; c=relaxed/simple;
	bh=gLQNx9glXF6hqM2kMDc3j1Sg/zalWdjszUK7zPegkZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+5qjIbE6ZVcInZEvBiWpODMFrR1MJOdhlAw5KlmZ7XxuQGb0/AIEeqYx84QWYdVWAb0uYwXRcMyyUhq5J+WcetAyTWa4gbuIQ0dRdzYmlpt1dXIuskr/HfJE2Ka6NwtIruNMdOFJ3gdmrNcWyrDB9aXBBr8GZb26pt5EPrs6t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgyrW//U; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgyrW//U"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79853c0f5b9so1359837b3.0
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 17:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773966002; x=1774570802; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MzlIIY7b66i4fIFyZ2+UWe+HudSTmQ+Ey/SWxXk4aRw=;
        b=BgyrW//UduRCvqjEwVGqrYxnPV3QG1/BqAFJbGd5zT+lhCPwdcmxaRKz2xyM6O8w9c
         1GOR/pDg/jv0ci6k+Nuq0S3JA939rE2mhNBgPAojFsv43l6WvApx+TVxtvvoZLfHPkdw
         OSTAepLlr920sBKyoE7jA7b3+cYDha9veyH7f9hUzNE+y+4iNWQWGInHM1l/C1RCOlFh
         iANtIUAV7jJFGxOhsrSNxPJgwdOVkKUm9i7USyshNmMzfwIcD5ShPGrPHzrAoOydn1DR
         XomOADZDh/rdvq/laAUPPQAEcSvGjSMw1nF2Sdar29YJWWW4KDgbdqNV12QbMepjsobd
         8mzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966002; x=1774570802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzlIIY7b66i4fIFyZ2+UWe+HudSTmQ+Ey/SWxXk4aRw=;
        b=piHt3qTiUBZibjbU7u95lwb4x50HOvlTn3NsP8Q5463bwZ5rFOL9k7W0sPg/KLaGRw
         6Flz8ASCTve9RQL3ImogI2K3PAanFAKLtyq8jioAGBY8O/EJFAK4G/TdKoFQ4h023xlJ
         vkZKEyLIzoxNozD5y0Hr5hbWZnOVSCNGyf/8KVd8/Y/3apQuhWvOKsYW/tMc/kicSXkT
         J9FXgdRKb95eU4CLrheUXQpoa2AKwmJFIZ+E3amCrUuwfJnXUulSux8dSUP42p9nyzRU
         WJOGw7F0CYJSg1/iV74JrHDPPBFh9tR5s9uEcY66nTVuIfhpExWjhj3mIa9h/BdYfRtt
         y6Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXPKFkXoHgrgGDkubzMsDHRSnbj5Eho7E/K+QdjEmIXIAkIxNcNl2pnUvlLcfof0RIsUVQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdjPmDpvuRV7x2zaCavvnwqRIwDJ3SaHhdc/bEcr0UMnCMpGl2
	3AUWBTlciVPnk9u40Wj1OJweaHwD7EOrOISnFKu/5+bwnm26OdFuyV59X+tVGsVo
X-Gm-Gg: ATEYQzyvsmgUnxg55uK0WyzhwulmMziV/M5wosWSByf4PePTgPAXz6zDV/W4vp8BePB
	u9TnwO34oUcyo2SKBReNJmMNyfTGI+naZLjzq71oDOSVYvNY88h1JyUwWuawKvp8c3gHeSiPPGF
	J8Ua5rS1mkBIsNrIbOgH5Q7yKWTlRGFvy9DOXM+V9LmijeBHK1dz8Q5gXz6IlFfRMnQmnKRkLZ0
	4bPx7dwDZWz5KCDxicG338UjyTdHjoK1fWFwamttjvBFXQAM6AaBLJiv9ngTpbTPrFeVzKzp9l/
	FAS4JZ+CWbM4Aj5ev9i8z5IJ1lIfWPrlfH2P2TW1STP66Z/8ApBJgXouauUUkVqCpOi55badiNk
	esSYx4EGev5pNEA1nbIb5KxQb2YG35CskFJY5Eh2TqQ2OwNK6Gz+TQswRsbp0w51S2YbyApqcLT
	Q+pc+A2q86KqrgeDvArhTphM13Hk1BugIeutrNOp7SJdKKTkzSGAuwxQM=
X-Received: by 2002:a05:690c:e3c6:b0:79a:65af:7f4d with SMTP id 00721157ae682-79a90aaea1dmr13698267b3.1.1773966002555;
        Thu, 19 Mar 2026 17:20:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903a294fsm6866627b3.8.2026.03.19.17.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:20:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] media: nxp: imx8-isi: remove kzalloc_objs
Date: Thu, 19 Mar 2026 17:19:43 -0700
Message-ID: <20260320001943.19443-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine allocations.

It looks like pipes never gets freed anywhere. Meaning this effectively
fixes a memory leak.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add fixes tag, fix typo, and move pdata assignment to original
 place.
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 10 ++++------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 16392420903a..8d8ee1b3076b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -459,24 +459,22 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {

 static int mxc_isi_probe(struct platform_device *pdev)
 {
+	const struct mxc_isi_plat_data *pdata;
 	struct device *dev = &pdev->dev;
 	struct mxc_isi_dev *isi;
 	unsigned int dma_size;
 	unsigned int i;
 	int ret = 0;

-	isi = devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
+	pdata = of_device_get_match_data(dev);
+	isi = devm_kzalloc(dev, struct_size(isi, pipes, pdata->num_channels), GFP_KERNEL);
 	if (!isi)
 		return -ENOMEM;

 	isi->dev = dev;
 	platform_set_drvdata(pdev, isi);

-	isi->pdata = of_device_get_match_data(dev);
-
-	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
-	if (!isi->pipes)
-		return -ENOMEM;
+	isi->pdata = pdata;

 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
 	if (isi->num_clks < 0)
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 3cbd35305af0..99532efa4e41 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -286,7 +286,6 @@ struct mxc_isi_dev {
 	struct regmap			*gasket;

 	struct mxc_isi_crossbar		crossbar;
-	struct mxc_isi_pipe		*pipes;
 	struct mxc_isi_m2m		m2m;

 	struct media_device		media_dev;
@@ -294,6 +293,8 @@ struct mxc_isi_dev {
 	struct v4l2_async_notifier	notifier;

 	struct dentry			*debugfs_root;
+
+	struct mxc_isi_pipe		pipes[];
 };

 extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
--
2.53.0

