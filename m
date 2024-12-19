Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D9D154BF5
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 03:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734578935; cv=none; b=GVs0LG9SjmpK82SeqC2rCtmez+G95USK0nK5SQ+FDb7jjzz0xddsVsCttKWxk0iBS1su7IrGvIoS9wYtoPbYfW9tUZ+qZ2XbXN7e99qnDLnU8fH6cDEDv9BGXAGQVq4J/Of1cpXzcXIHJtiFyi2TYbA134by1dLTyGWzYbd4AhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734578935; c=relaxed/simple;
	bh=TgQoTM7RHgTyd5kqZ0+JqwQZh2zE0y5HlFmNDBfPuQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PKvZh6ostwV1xI5WYXs0ZXcs5XcuqSpnSakRrFGzcy1R+3D1sOgO9ht8rinxLO1Nmde7H9kzJy8vr3KqD+MXWUyVmNv2qKfGtxPTQP00BDZkpaYHqjmCeYz/538BAoPEw31RMfDWeadyCIXtmiEpZ/5xyvORJGDgM+70e3I9Ed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=toCDQtDP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="toCDQtDP"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216281bc30fso4235725ad.0
        for <imx@lists.linux.dev>; Wed, 18 Dec 2024 19:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734578931; x=1735183731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mu/Gp2AfOLl5gMxEWfSrJwQIXStZLSI5hTx+5EDV72U=;
        b=toCDQtDPtMkmMNG7kw5SSboEBggICdCbRUF7or79j/UIAmiRIajojtBwrtMMmEKlXT
         x35Zam7COjkFBIeWr5GBUnA+wZNtrXcCc7n5p0NgCbnruwCf6dgDC8xT2R+ovR5FH2sr
         dmZaJx9JELqKde34OpNH6t92iNAbvZh9FsGXyjiPSXhrIuSzYT2SiqX9pDIspgACSvQ9
         HXi8cr8XjJtZfuSCBOT6aHVh3t4pE5/VQXkFKNXYgDDbG/GdGjCIXTxNUM14j11kypg/
         GS2FUnioNF6pXS8fHjBVZQUrsu1ZXiMYEG+4E4mcX4toe6iQrvHSKpFCjozaBh3CuBKH
         CZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734578931; x=1735183731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mu/Gp2AfOLl5gMxEWfSrJwQIXStZLSI5hTx+5EDV72U=;
        b=Dl7oT5V7wHZRdVmpSvQHiysqVdAyY7jc6rUt3mMjyNqtbmhkaIPrOXSx4ly80asgVA
         HM7G5lkDnEYXEvRN5rMlyky/aGX3AsVFPlshMxlgK+yotZEP5oqxk9KObmYAihpcPGzI
         3oUUbmkwrgPigzlxL//u684kDPP9xFQO+kCtxI8GOtlSY5x/TqLYEXMRfX6fV9cQGT73
         yLtB5b0CH623dARgbA4iBB2iSJmphXWzyP0u6y10XUkFtZW2mnMfwibbrDo+PIkqSquu
         wCpwJHbE7G0/DV6qpE6OCQ9TefQQsoNR6kiKcISkOM81SkXLnVr59NqLug5WwpKT80gJ
         685Q==
X-Gm-Message-State: AOJu0Yw0R8AvBltTPkUE6XbIHFlEpT/0/tVrZnWFUZZJS/fq+HroOJI+
	XYRopS3oxR0fsl0hqXZsZmWRadCWAgDxpl29mjoa+cC8ZYeVTbp3spTurj5eyIU=
X-Gm-Gg: ASbGncsLXlXfuWrEazc6zIVv0vu5nnb/c49v29227Em/lK9RySwW6U2eO8AfTRDmhX5
	20BK+OYUKm3tveGWOvYcaPWVz9Eti2Dt6tkmHUi2KYbDiyWT31Jn77r7NRcQ7ysjPjtlUU/eIZv
	7LiuwqZq9YH5KC85dpnqkPHFq5tZuQDnXsXSrc8lGlQ4Twr64rYINAStAS4Sc/0MpbTv7rYpEcS
	JWQWYpSPXLB7U2n3CbBgWE/4dVFVsauU7pkDxmofwhRqUxykFSOtDvvKrwjuiU1eHyxQg9EJXZH
	a2yJ
X-Google-Smtp-Source: AGHT+IFXq5353qTVSLVrDkezfOVzQ/mZfo7SKeKFilsdMJtLUejEcR/ferSFclNacdrsgpca8n1vWA==
X-Received: by 2002:a17:902:d512:b0:216:66d2:f172 with SMTP id d9443c01a7336-218d727de69mr78095825ad.56.1734578931097;
        Wed, 18 Dec 2024 19:28:51 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:fecc:4d38:da26:bf4b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4fbcsm2671865ad.174.2024.12.18.19.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 19:28:50 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: Frank.Li@nxp.com,
	vkoul@kernel.org
Cc: imx@lists.linux.dev,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v2] dmaengine: fsl-edma: implement the cleanup path of fsl_edma3_attach_pd()
Date: Thu, 19 Dec 2024 12:28:45 +0900
Message-Id: <20241219032845.2067851-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current implementation of fsl_edma3_attach_pd() does not provide a
cleanup path, resulting in a memory leak. For example,
dev_pm_domain_detach() is not called after dev_pm_domain_attach_by_id(),
and the device link created with the DL_FLAG_STATELESS is not released
explicitly.

Therefore, provide a cleanup function fsl_edma3_detach_pd() and call it
upon failure. Also add a devm_add_action_or_reset() call with this
function after a successful fsl_edma3_attach_pd().

This bug was found by an experimental verification tool that I am
developing.

Fixes: 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in v2:
- Use devm_add_action_or_reset() to avoid goto in .probe().
- Use fsl_edma3_detach_pd() in the error path of fsl_edma3_attach_pd()
- Update the commit message to elaborate the leak.
---
 drivers/dma/fsl-edma-common.h |  1 +
 drivers/dma/fsl-edma-main.c   | 41 ++++++++++++++++++++++++++++++-----
 2 files changed, 37 insertions(+), 5 deletions(-)

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
index 60de1003193a..1a613236b3e4 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -417,10 +417,33 @@ static const struct of_device_id fsl_edma_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, fsl_edma_dt_ids);
 
+static void fsl_edma3_detach_pd(struct fsl_edma_engine *fsl_edma)
+{
+	struct fsl_edma_chan *fsl_chan;
+	int i;
+
+	for (i = 0; i < fsl_edma->n_chans; i++) {
+		if (fsl_edma->chan_masked & BIT(i))
+			continue;
+		fsl_chan = &fsl_edma->chans[i];
+		if (fsl_chan->pd_dev_link)
+			device_link_del(fsl_chan->pd_dev_link);
+		if (fsl_chan->pd_dev) {
+			dev_pm_domain_detach(fsl_chan->pd_dev, false);
+			pm_runtime_dont_use_autosuspend(fsl_chan->pd_dev);
+			pm_runtime_set_suspended(fsl_chan->pd_dev);
+		}
+	}
+}
+
+static void devm_fsl_edma3_detach_pd(void *data)
+{
+	fsl_edma3_detach_pd(data);
+}
+
 static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_engine *fsl_edma)
 {
 	struct fsl_edma_chan *fsl_chan;
-	struct device_link *link;
 	struct device *pd_chan;
 	struct device *dev;
 	int i;
@@ -436,15 +459,16 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
 		pd_chan = dev_pm_domain_attach_by_id(dev, i);
 		if (IS_ERR_OR_NULL(pd_chan)) {
 			dev_err(dev, "Failed attach pd %d\n", i);
-			return -EINVAL;
+			goto detach;
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
+			goto detach;
 		}
 
 		fsl_chan->pd_dev = pd_chan;
@@ -455,6 +479,10 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
 	}
 
 	return 0;
+
+detach:
+	fsl_edma3_detach_pd(fsl_edma);
+	return -EINVAL;
 }
 
 static int fsl_edma_probe(struct platform_device *pdev)
@@ -544,6 +572,9 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		ret = fsl_edma3_attach_pd(pdev, fsl_edma);
 		if (ret)
 			return ret;
+		ret = devm_add_action_or_reset(&pdev->dev, devm_fsl_edma3_detach_pd, fsl_edma);
+		if (ret)
+			return ret;
 	}
 
 	if (drvdata->flags & FSL_EDMA_DRV_TCD64)
-- 
2.34.1

