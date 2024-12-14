Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C84621
	for <imx@lists.linux.dev>; Sat, 14 Dec 2024 04:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734148883; cv=none; b=gUlfXrnA9ILuIUD9P9zHrbhQcNLX/Yyg+YG0oS5HpWAPRqv4UwtpyrzQRlIisfsgC/Z2vSHhqF7GX8dIxqzV5X2kuYNtcajimgGULFM9NjZCz4jUxHN/g/AkzyzgsRfsqH5vT+E2rBpQfEysB0NnCcWVyMJuDMxX6BuU5wVtWzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734148883; c=relaxed/simple;
	bh=VyQcI8SjHJjXGJ+5uU80L4eDlT2m+54Nk4TAd7cE/34=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mod1/H7uTI+CulX0AsBYM7AR7c0tpLwfUk31QLkYzsAXDfFSDVY2OCo2SKNVpoAmxAP4Hrjy7coqNomqqo/J2pYfUjogk3NTISGi8q2RQY58oxFeYj4FH8SGtHquRs7UF8kZs8Mwnr8iK3MF0b38WjwnrkfajW40fmZ4l46/OIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=a00+oxhW; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="a00+oxhW"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2164b1f05caso23394485ad.3
        for <imx@lists.linux.dev>; Fri, 13 Dec 2024 20:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734148880; x=1734753680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MALQw/XluvoUYF/KYNnLdKzPrsS2oJCZFTD81sjOr7A=;
        b=a00+oxhWw3Dhz2L3SrYRwlIDS6WhUhzLIfxxKiurkmQRbtbqBaRkfpF3AccdZqs73u
         AW+UL5YmxfSGUcDwraRT7fyJ9RrgqNHxtLFPMCMCkf0ieINJ/SzAPsL7fICcyeQtrdVM
         B9mOJFSykJ/XZIQM+N/VOghKvCc1HYROXTblaLprEm+RWQoUjEpHAYiIR+IoVrIZcTsu
         lgGwDk4XsdOspQ3nAk4GmnDeTVOtTWH+5u3XWWvnXzTwnDatEY+hMufcL5NPBRnNcTyy
         4R9dCVryX82YM5dSlf1OfLEvx13VTcNSbA7BkI3k3xo2+t0Hq93r2Gd5W40ClRnlKsrp
         1+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734148880; x=1734753680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MALQw/XluvoUYF/KYNnLdKzPrsS2oJCZFTD81sjOr7A=;
        b=qSm3CiuhiwAXhKQ3oTtv1WypBw1V9k38xpYYCx6kmso+ogMxZRbFKwL5eBi5gJzCyT
         3zf2I1p/L+bl1cq3jp/wJR2B2JjW43h2NzMdqlQ8ZV5NEEGKNIdDbf3ZTRi46Q1mad3J
         j6dZp1xWXCkbiwFirSjs5Eg1u2y5IIa2/QlDOBRR1SeNb57KuV1WmWG9vz3z7KzG/k07
         7bmlpj2iwsTBilKI3LPAS+cATnprD9a/wUOhQTVg+6621ImxbBi1yV1DVeHNmmzIdrPv
         PNxCWyEd9p2UNYZWW9l/TfBL3/Re7Qjav+07srb6wqLHNxOZr2Vuw82vbAc+QP/LZ0aT
         uPcw==
X-Gm-Message-State: AOJu0YyD87X5nU29C1WfUVdQOt3X7jpTdqfgXyAegU374A63MKsrgJv0
	wxnoIa6Y3zDruZORyembmCqu4XfMVgai2RUSKfi7qGM852erd2CeU1UsZwLNvS0=
X-Gm-Gg: ASbGncuUhJ3MkaVEsxjLj4Ps3BgZAVYR7wlRg5mrgjfXDlEsFLH1Copv2aBQEqCai/k
	sJFzmn2Q5xebTINjAcnOCHTnDepOK5HEa+F4ZAE/WpPWHShblWaz24eHrmIdbAJiiiqk86aK7aP
	pNNKgIYDEEKqr42XzPv2WX+XIDe5Kwu2uU6uk/GyJLQNbxDYHg2j1CDqBpJiC/edLUY/po8i2Fl
	BW9wNtofho9yCWnZr/9gnQAewTwmL1FW+yUGFHCz3KqhSewixbfEgg3hnxN0prMdjtBu9xeFKiw
	t51ym+QPlW6K4gn8oFsDtK+lX1gbsH1bnBeiTATQqQA=
X-Google-Smtp-Source: AGHT+IFR248qbkBa6qxvZ558eqDEoKls0QRdzzDgk9o8Joatd6cQom4m874VGnv0rWI2qShfZjUsxw==
X-Received: by 2002:a17:903:22c1:b0:215:6cb2:7877 with SMTP id d9443c01a7336-218929814dcmr75137715ad.4.1734148879035;
        Fri, 13 Dec 2024 20:01:19 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e50333sm4865825ad.147.2024.12.13.20.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 20:01:18 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: Frank.Li@nxp.com,
	vkoul@kernel.org
Cc: imx@lists.linux.dev,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] dmaengine: fsl-edma: implement the cleanup path of fsl_edma3_attach_pd()
Date: Sat, 14 Dec 2024 13:01:13 +0900
Message-Id: <20241214040113.626275-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current implementation of fsl_edma3_attach_pd() does not provide a
cleanup path, resulting in memory leak. Thus, implement an error path of
fsl_edma3_attach_pd(), which detaches PM domains, removes device links,
and unwind the runtime PM settings. Also add fsl_edma3_detach_pd() and
call it on the error path of the .probe().

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/dma/fsl-edma-common.h |  1 +
 drivers/dma/fsl-edma-main.c   | 54 ++++++++++++++++++++++++++++-------
 2 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index ce37e1ee9c46..fe8f103d4a63 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -166,6 +166,7 @@ struct fsl_edma_chan {
 	struct work_struct		issue_worker;
 	struct platform_device		*pdev;
 	struct device			*pd_dev;
+	struct device_link		*pd_dev_link;
 	u32				srcid;
 	struct clk			*clk;
 	int                             priority;
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 60de1003193a..5204c06589ea 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -420,7 +420,6 @@ MODULE_DEVICE_TABLE(of, fsl_edma_dt_ids);
 static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_engine *fsl_edma)
 {
 	struct fsl_edma_chan *fsl_chan;
-	struct device_link *link;
 	struct device *pd_chan;
 	struct device *dev;
 	int i;
@@ -436,15 +435,16 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
 		pd_chan = dev_pm_domain_attach_by_id(dev, i);
 		if (IS_ERR_OR_NULL(pd_chan)) {
 			dev_err(dev, "Failed attach pd %d\n", i);
-			return -EINVAL;
+			goto err;
 		}
 
-		link = device_link_add(dev, pd_chan, DL_FLAG_STATELESS |
+		fsl_chan->pd_dev_link = device_link_add(dev, pd_chan, DL_FLAG_STATELESS |
 					     DL_FLAG_PM_RUNTIME |
 					     DL_FLAG_RPM_ACTIVE);
-		if (!link) {
+		if (!fsl_chan->pd_dev_link) {
 			dev_err(dev, "Failed to add device_link to %d\n", i);
-			return -EINVAL;
+			dev_pm_domain_detach(pd_chan, false);
+			goto err;
 		}
 
 		fsl_chan->pd_dev = pd_chan;
@@ -455,6 +455,33 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
 	}
 
 	return 0;
+err:
+	while (--i >= 0) {
+		if (fsl_edma->chan_masked & BIT(i))
+			continue;
+		fsl_chan = &fsl_edma->chans[i];
+		dev_pm_domain_detach(fsl_chan->pd_dev, false);
+		device_link_del(fsl_chan->pd_dev_link);
+		pm_runtime_dont_use_autosuspend(fsl_chan->pd_dev);
+		pm_runtime_set_suspended(fsl_chan->pd_dev);
+	}
+	return -EINVAL;
+}
+
+static void fsl_edma3_detach_pd(struct fsl_edma_engine *fsl_edma)
+{
+	struct fsl_edma_chan *fsl_chan;
+	int i;
+
+	for (i = 0; i < fsl_edma->n_chans; i++) {
+		if (fsl_edma->chan_masked & BIT(i))
+			continue;
+		fsl_chan = &fsl_edma->chans[i];
+		dev_pm_domain_detach(fsl_chan->pd_dev, false);
+		device_link_del(fsl_chan->pd_dev_link);
+		pm_runtime_dont_use_autosuspend(fsl_chan->pd_dev);
+		pm_runtime_set_suspended(fsl_chan->pd_dev);
+	}
 }
 
 static int fsl_edma_probe(struct platform_device *pdev)
@@ -577,8 +604,10 @@ static int fsl_edma_probe(struct platform_device *pdev)
 			fsl_chan->clk = devm_clk_get_enabled(&pdev->dev,
 							     (const char *)clk_name);
 
-			if (IS_ERR(fsl_chan->clk))
-				return PTR_ERR(fsl_chan->clk);
+			if (IS_ERR(fsl_chan->clk)) {
+				ret = PTR_ERR(fsl_chan->clk);
+				goto err;
+			}
 		}
 		fsl_chan->pdev = pdev;
 		vchan_init(&fsl_chan->vchan, &fsl_edma->dma_dev);
@@ -591,7 +620,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
 
 	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);
 	if (ret)
-		return ret;
+		goto err;
 
 	dma_cap_set(DMA_PRIVATE, fsl_edma->dma_dev.cap_mask);
 	dma_cap_set(DMA_SLAVE, fsl_edma->dma_dev.cap_mask);
@@ -642,7 +671,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev,
 			"Can't register Freescale eDMA engine. (%d)\n", ret);
-		return ret;
+		goto err;
 	}
 
 	ret = of_dma_controller_register(np,
@@ -652,7 +681,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev,
 			"Can't register Freescale eDMA of_dma. (%d)\n", ret);
 		dma_async_device_unregister(&fsl_edma->dma_dev);
-		return ret;
+		goto err;
 	}
 
 	/* enable round robin arbitration */
@@ -660,6 +689,11 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		edma_writel(fsl_edma, EDMA_CR_ERGA | EDMA_CR_ERCA, regs->cr);
 
 	return 0;
+
+err:
+	if (drvdata->flags & FSL_EDMA_DRV_HAS_PD)
+		fsl_edma3_detach_pd(fsl_edma);
+	return ret;
 }
 
 static void fsl_edma_remove(struct platform_device *pdev)
-- 
2.34.1

