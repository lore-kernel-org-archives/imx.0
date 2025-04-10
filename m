Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2AA204C3F
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 06:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268208; cv=none; b=ubTepTnb1MIoxhLwkhoRxKvQkfgptUVPAEwBJHVxmUmicb358gT4ARHJ+QJ8fBdTe5lU/t/OH5c7djAZm3GJKTVTMjOjn8QO/wDQCsf4QR/sjJ16281Nnt6I9pna4vbhpHM7ElsbscHWDVdcvq1CO3U855gpha225de2ulpm2fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268208; c=relaxed/simple;
	bh=G4sTbhNh1HTjBc3AK7UszlyRR4xFAT2Sr/GT5PBoscw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GlmSzULjqZAm8/HhTC6VmR3vaHK8K3BmfLxSOb1OZ3r0mMWpdj25RnoKyIuSYNzHlZ72XbCiOrgXsLuM4a5gyqqMVPZ0B7cGlUWQSStXZc9lhB6XVnU4a+Gq8+tM2UNXZsQh9nQwA15eGOq8Hk2ynGPY4V/YKrVChCsQ4B6MH8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVHO32jz; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVHO32jz"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c54b651310so76805085a.0
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 23:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744268205; x=1744873005; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+wsQP3176D0izkxKNDHdPvv/TXJHsloHJ6cokdroh8=;
        b=GVHO32jzLRh1sDfM4SQwjkW5BExcaWLVm00BaaYuJFDcQwq0Lga/lf1P6NEjmWf81E
         ktJs9VeWs9s9SuTGOzKQXf2XILgz8WY95HdF25jBVRJrbOUHW8HadqsWuNPUPZWw72JD
         tax6CtHtfQqLClIhp6y2W8v4QAbwi92OJrjT7xEknO1SYLAZgumoGHejdShblI/2ABFe
         saRBDgahRJFoFczhSgSsILUINdk2Tod9M5+J2LqsUzIQIDfjEadS+mWmMjSAYSz8WRVt
         Ovv9zQOQ8Ev3NYyG5Miib0iAnquS5nKGvvUWFCheYjJVf0PWbS7cMpHIH6J5fWxtMzja
         tjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268205; x=1744873005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+wsQP3176D0izkxKNDHdPvv/TXJHsloHJ6cokdroh8=;
        b=Q5pQU0cI+pQTcFdZIam7ZMNj2Yh2Aj32efHDpax5fPCBU/bWErKPf4pJOnhtWuL5e2
         ken/AEwSP16ffmPlRRQLu3LahpHz6kEqwhsTnyIdEEBQ9izNRVvxXo2L4t0iUxnMcQyV
         +xYsF96Sue80QnymfjaGazA0BkUZh2LbNuF6H/GgXXBIa381DqCyeX9OqX90CT5e1HFZ
         jr/NDR41kx095/6EWTJ47GWcCKpA2UPfMZmko7+BklaMg5oBMkJKUPfXyHYuEnmSqV9l
         Vq1Jpd2yIxbFysXBLXAhamvw42WXQakuAxZobeGLrHwfNI33Fct+3GduayYQN4NAqbMm
         0P5w==
X-Forwarded-Encrypted: i=1; AJvYcCVIMGV8HF2irrmdHkgxqzV1VP7CWx+ugiuVzojNmZyajtbK+JHRv4wvPQIZpvBHtNHLs8Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfzejAhcWhdw4kgymB00fbxf7XY0B+5dKbx2MD4TTZZGdWpVhF
	6zJLtIsvEXAJs9nvOQBLU8nNx3ZtNS5QGGeF54Wjvmw9W+rgO3T7
X-Gm-Gg: ASbGncvFoISg+nNilBOloYLaufv4iHVyHWsUT16C1Kx3OLK5J47jnUfjb4LG7fn8hx5
	dUd7JP/ysiHLkV0qZJ/Vyv3vAnEiy+l/A68KUMXPmuB8BOiXHHg0JUh9pSt0U+jYP6jiY92pGXj
	zJfxG9mIhbbU/vcmAScuXsPquW9vQd6aun9JM0PnX6H9D/EFPnrTIWWzuK3zsLPP2Z33HifuczT
	QWacsFEvqjQ1ZsfliRaQHcxXXeUNFLgfn/G9JRwcx8rydXpg0K9x3c+5upgkW00zOouu9P2fJlB
	h9OBJvaJtCTdkxtKrBl6XNlej70z9elAebHY9jbUc/w2vvz5pOG0XVzvptdwjA==
X-Google-Smtp-Source: AGHT+IH4InyUfXvFHy9wew0zGMTWWAUknYjQnXzFYFulhKKW5BvpTJXx+LSGl6iMSBJor0GjmjMP+A==
X-Received: by 2002:a05:620a:17a6:b0:7c5:d888:7098 with SMTP id af79cd13be357-7c7a76bffbemr229908685a.44.1744268205265;
        Wed, 09 Apr 2025 23:56:45 -0700 (PDT)
Received: from localhost.localdomain ([128.224.253.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a89515e4sm46547285a.26.2025.04.09.23.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:56:44 -0700 (PDT)
From: Kevin Hao <haokexin@gmail.com>
Date: Thu, 10 Apr 2025 14:56:11 +0800
Subject: [PATCH 3/3] spi: fsl-qspi: Simplify probe error handling using
 managed API
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-spi-v1-3-56e867cc19cf@gmail.com>
References: <20250410-spi-v1-0-56e867cc19cf@gmail.com>
In-Reply-To: <20250410-spi-v1-0-56e867cc19cf@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 imx@lists.linux.dev
X-Mailer: b4 0.14.2

- Switch to devm_spi_alloc_host() to avoid manual spi_controller_put()
  calls in error paths.

- Factor out the hardware disable logic into a dedicated
  fsl_qspi_disable() helper and register it as a managed cleanup action,
  removing the need to explicitly disable hardware after
  fsl_qspi_default_setup() failures.

- Move fsl_qspi_cleanup() earlier in the probe sequence to eliminate
  the need for manual cleanup in the irq failure path.

With these changes we can completely eliminate the messy goto labels
in probe function.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/spi/spi-fsl-qspi.c | 73 ++++++++++++++++++++--------------------------
 1 file changed, 31 insertions(+), 42 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index b5ecffcaf7955e2ec9bb3e2857f8bc14d73a2f90..f879533535e853dac6bff22a3a5e87431a44a1d2 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -844,13 +844,18 @@ static const struct spi_controller_mem_caps fsl_qspi_mem_caps = {
 	.per_op_freq = true,
 };
 
-static void fsl_qspi_cleanup(void *data)
+static void fsl_qspi_disable(void *data)
 {
 	struct fsl_qspi *q = data;
 
 	/* disable the hardware */
 	qspi_writel(q, QUADSPI_MCR_MDIS_MASK, q->iobase + QUADSPI_MCR);
 	qspi_writel(q, 0x0, q->iobase + QUADSPI_RSER);
+}
+
+static void fsl_qspi_cleanup(void *data)
+{
+	struct fsl_qspi *q = data;
 
 	fsl_qspi_clk_disable_unprep(q);
 
@@ -866,7 +871,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	struct fsl_qspi *q;
 	int ret;
 
-	ctlr = spi_alloc_host(&pdev->dev, sizeof(*q));
+	ctlr = devm_spi_alloc_host(&pdev->dev, sizeof(*q));
 	if (!ctlr)
 		return -ENOMEM;
 
@@ -876,68 +881,60 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	q = spi_controller_get_devdata(ctlr);
 	q->dev = dev;
 	q->devtype_data = of_device_get_match_data(dev);
-	if (!q->devtype_data) {
-		ret = -ENODEV;
-		goto err_put_ctrl;
-	}
+	if (!q->devtype_data)
+		return -ENODEV;
 
 	platform_set_drvdata(pdev, q);
 
 	/* find the resources */
 	q->iobase = devm_platform_ioremap_resource_byname(pdev, "QuadSPI");
-	if (IS_ERR(q->iobase)) {
-		ret = PTR_ERR(q->iobase);
-		goto err_put_ctrl;
-	}
+	if (IS_ERR(q->iobase))
+		return PTR_ERR(q->iobase);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 					"QuadSPI-memory");
-	if (!res) {
-		ret = -EINVAL;
-		goto err_put_ctrl;
-	}
+	if (!res)
+		return -EINVAL;
 	q->memmap_phy = res->start;
 	/* Since there are 4 cs, map size required is 4 times ahb_buf_size */
 	q->ahb_addr = devm_ioremap(dev, q->memmap_phy,
 				   (q->devtype_data->ahb_buf_size * 4));
-	if (!q->ahb_addr) {
-		ret = -ENOMEM;
-		goto err_put_ctrl;
-	}
+	if (!q->ahb_addr)
+		return -ENOMEM;
 
 	/* find the clocks */
 	q->clk_en = devm_clk_get(dev, "qspi_en");
-	if (IS_ERR(q->clk_en)) {
-		ret = PTR_ERR(q->clk_en);
-		goto err_put_ctrl;
-	}
+	if (IS_ERR(q->clk_en))
+		return PTR_ERR(q->clk_en);
 
 	q->clk = devm_clk_get(dev, "qspi");
-	if (IS_ERR(q->clk)) {
-		ret = PTR_ERR(q->clk);
-		goto err_put_ctrl;
-	}
+	if (IS_ERR(q->clk))
+		return PTR_ERR(q->clk);
+
+	mutex_init(&q->lock);
 
 	ret = fsl_qspi_clk_prep_enable(q);
 	if (ret) {
 		dev_err(dev, "can not enable the clock\n");
-		goto err_put_ctrl;
+		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, fsl_qspi_cleanup, q);
+	if (ret)
+		return ret;
+
 	/* find the irq */
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err_disable_clk;
+		return ret;
 
 	ret = devm_request_irq(dev, ret,
 			fsl_qspi_irq_handler, 0, pdev->name, q);
 	if (ret) {
 		dev_err(dev, "failed to request irq: %d\n", ret);
-		goto err_disable_clk;
+		return ret;
 	}
 
-	mutex_init(&q->lock);
-
 	ctlr->bus_num = -1;
 	ctlr->num_chipselect = 4;
 	ctlr->mem_ops = &fsl_qspi_mem_ops;
@@ -947,23 +944,15 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 
 	ctlr->dev.of_node = np;
 
-	ret = devm_add_action_or_reset(dev, fsl_qspi_cleanup, q);
+	ret = devm_add_action_or_reset(dev, fsl_qspi_disable, q);
 	if (ret)
-		goto err_put_ctrl;
+		return ret;
 
 	ret = devm_spi_register_controller(dev, ctlr);
 	if (ret)
-		goto err_put_ctrl;
+		return ret;
 
 	return 0;
-
-err_disable_clk:
-	fsl_qspi_clk_disable_unprep(q);
-
-err_put_ctrl:
-	spi_controller_put(ctlr);
-
-	return ret;
 }
 
 static int fsl_qspi_suspend(struct device *dev)

-- 
2.49.0

