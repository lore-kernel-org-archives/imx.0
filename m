Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA301A682D
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 04:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772772358; cv=none; b=K/J3lVtzkVHtgd8DljSGoWrTnhsOOeN9dP1JpZuIRcbSUYPfI4Z8T4EJJNKk9Z+4qXFK5rgARRoMRAJ3prJ++vtojNOEvlYAFwIjvFNsCInI9TGxNLVwZD/0c9IJb6fxKNMEwBloh5uhrWnZxnrmOm/4gl02ZRtBCKo1SvAqzpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772772358; c=relaxed/simple;
	bh=xA8aQuqO9+A2QlChUKxhqBmLi0Md/XKikSYMta2cMfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aq8Rteej75CVnuvmfAo9FhU09icnxldIkNr4tNyKJUL7bmfV4xRWSIcfR3yXb99bvay+xHLLwmJwWeKWzYxiqZ+sQnO5LhrIWcJnZhNxRy4Wss89tQM6pRQw7U3mvINQVINxtKO5A8jzEsLBr06Gmndik+2UrOn6+yRrIYivcts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dX/Te//g; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dX/Te//g"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae56f8776dso35129125ad.3
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 20:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772772356; x=1773377156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qG3UCHbICIKoqorE0OwQsqzoYP9iJFn4dnjoO73bdjs=;
        b=dX/Te//gv5EZ0PHo8hi1Ep4z+Xz8eMf0dGSlevtOdCD6+kvuSxiDVX0sRPVxuLOsQ3
         ARcbVTB/mHXbU+yXBeMkBne1zHrHfa96jLXPYzirwKHu172qWbsi4g8AZBwAuC+YCmq0
         rOn514EhCY+Z2AcjKebfjIUIMloKvBIKL9uE7/IF3zwxLclVysvGmc5wseeQyyWKckf9
         MgHI+5hZ8nlVSdFnXHHGbpbZ+L+p1eMrfKNcCGrvWZt2hD+NrnNcHlp2nGkkH8S7jD7j
         KoJEp5WRuIexymXr1tYBxpCQEGa1L6Q+uMpsiqNvOTU+7ARFYJfoGpSjz/2BmPs/r6Y7
         /cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772772356; x=1773377156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG3UCHbICIKoqorE0OwQsqzoYP9iJFn4dnjoO73bdjs=;
        b=Egz6bF02qEKjyKZv6QXqLzM20DCpXEvIQT237f6wAg3Hfa6H1Q1i+LeBV/jgiIh095
         TwOzlPsx+bDjmsya/S6a9FJnXqV0NAkFugi6dnYRdFe6qNg+VsDhaB66uPaSimIbIRzA
         HhuQ1/8rKkF/nuhrYtWabe4ne542I0IkuGNGwfQOMkhQcr7MeWMLOdpZQqWqZSSrKgcF
         T5SlOvxu6i1TB7rXqO1+IXqOXYRV50bsQoxmPcuQi/s8fBPRbDwlguaTizxwK1NW6nLS
         kFILKzMrQSn9GlFVZdqFPGIAaKeU4FyzjzYf4jT3jLm/hw2fGsWZ0eW9z+h8ovifimzu
         PhNg==
X-Forwarded-Encrypted: i=1; AJvYcCUguw9qc4OeGkCklrbQUnRFCN18iUntumaorZjdCt3y3JfnICQwYOQxWvtHW/gZPy5BOgI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyynorUIZxvcBM4OsNbD1s7sD08bTczApRDE/vsJ26L946to7yp
	8AKLqAXoEoQYxZDXJ2Fgbp0dHHlZR3d27OsunjE97zNmocYftXcVdKZ9
X-Gm-Gg: ATEYQzyyNkv/YO/zbFjTow4v4EvWM9YiXB6A7qLfWaxc0FlUStYvJKw7DZBj2D3+iOC
	AiVo5qJ4ZLG6z025LQmyxERnXFBwuCk7MnANJFBcUklHVzYGD/eYkYfjmgLlBptWDRzzAZ85kF7
	EUKeJpO2gNP6TDBG6l/CdRHHqZGvw3vV9SKoBhs+g+kNpS2GYdqQIHLihTmqD63xut/Szyx6D62
	u93/cYIQ6wexJvCUMa0mrub83IXUoJSCt7ErjnMmN0K3ddZ2ch4akEJaRqhGX0utaRdSuE1k9L5
	iys0n0SIRukLiVdHf4mQNMaVDRt7KnimL1i2OQJwY9McwFEkCdktjPJe5JT4QhSO0QThWb/6gKy
	NpCtGPVuyd5YEleDvap/T+bE87KjVJrIdl6zEpNOg5Fqq7GJp52Vaq2nhX3gHHSkRK2j/wL4qOq
	cWrjs1ofNJOV/pzUBD9pNaW9LZc7U+1jF35KflNcZFZi8McgIk5LrgQ4Q=
X-Received: by 2002:a17:903:2986:b0:2ae:8092:e212 with SMTP id d9443c01a7336-2ae823ffc26mr10568555ad.8.1772772356318;
        Thu, 05 Mar 2026 20:45:56 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57cb1sm3927375ad.9.2026.03.05.20.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 20:45:55 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-hardening@vger.kernel.org,
	gustavoars@kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
Date: Thu,  5 Mar 2026 20:45:36 -0800
Message-ID: <20260306044536.149204-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible arraay member to combine allocations.

It looks like pipes never gets freed anywhere. Meaning this effectively
fixes a memory leak.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 11 ++++-------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 16392420903a..657ffecc4d7e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -459,25 +459,21 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
 
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
-
 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
 	if (isi->num_clks < 0)
 		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
@@ -487,6 +483,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(isi->regs),
 				     "Failed to get ISI register map\n");
 
+	isi->pdata = pdata;
 	if (isi->pdata->gasket_ops) {
 		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
 							      "fsl,blk-ctrl");
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

