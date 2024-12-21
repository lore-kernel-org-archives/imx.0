Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FB48837
	for <imx@lists.linux.dev>; Sat, 21 Dec 2024 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734767842; cv=none; b=NJhnhZeP4jzWFGg1D5br1YOz/rQ2VrdxSnRpMoOKUCeK6TCKn1nPk1Uqr5uOEz3V6Usp6UC+028LiU31s3GdTXWYjRWvVBfe3CGeX0oV1/Vh0kLhlP8a3jczodPYLGxpBFZdIPRUB7HyzQ6A5NP2Pl3/pTkYKNyx71trGphvnuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734767842; c=relaxed/simple;
	bh=hGupqWQM2THrdA0T1NYk0Ac44lsQ4hY9BXLuT7lFICQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bIQQFA5W/NayLPtbJ9JrXpY1IyBeEEJXXWS3t89FyDGCAZm8ZpoyIbWFN0gSleuOCLl+zOlNcSmvES59H+8s283+xb/WU3i9oEf2XPbU9NycLtq79lRb/tAZkEdGJ9ZeOIFvEsi1Xak88btAfnGmG0dRNsFEtplR3mTq5N6w5Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=qCYL/8yP; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="qCYL/8yP"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-725ee27e905so3412688b3a.2
        for <imx@lists.linux.dev>; Fri, 20 Dec 2024 23:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734767839; x=1735372639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S3ADUakN/RLjaNPky2iv2S0c+oiR3d+sV+jQWn1c0nY=;
        b=qCYL/8yP7GcwtxnSx59vjB9W9u/HbMCMd0JBFS+uaiNHa9DCiCa6vH77BkySDhMmFn
         K8qAQalym6+l2otfPDSNEd/4UFyh3DJeau28S/i/8Bq3i90U6bSklCAYCJj9IFfA9vod
         dYgVrARmf/DkQBc6HCHO4Xeowq1j5zZHCDuSxeSA6fn2SKjkBZS5cfn6JF9D3453XOId
         esKP8HDUNQ6YFMwfJ1jO9Tyo96o3PqYPConIKXUHMA26T7Vr6X21rbqtlbf1rrvIoj2N
         eIm4seqoX8FiIwmgzUVS/sQFwXMFR+YgA7RnvyQNbPT7o+nwL3wEWZmMlTGa6cJCL2id
         Uqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734767839; x=1735372639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3ADUakN/RLjaNPky2iv2S0c+oiR3d+sV+jQWn1c0nY=;
        b=DBTY9S/68jYSNgkEjCPuuU0H3EcKHo9/Q9yBdC8U2Nr42s4MElJAK8+3USY646ks2l
         gWgpZ6lw732F7TdcjeAzY6rrFM65V0Jg6RZRLxQzjEsNwyBtnY9K8yYcC3g26qjgu8oT
         0bOMUBo58p2DxFKi3VfjeLYiLCAMo7iyBzHOagetm2JZwO1sYVzaV11YVXdS8fHTd+k7
         jU7AWYbY0vnMCcTDU4gh7apGZa/Uzwx4FS62HdD5dD+8u5ggn0/jd+PsGCctMyvph0eO
         Zmi8BnpPbHHrNXr7qetSmicxKMFEPErHr+3WfaWA9BW/TCd2HJVEEgMX7CsXCuFZQDdV
         03ow==
X-Gm-Message-State: AOJu0YzntkXmNVZHZo+vLiRfVCXrYO80j5Klgf6eS4mmucBRq1lZm5bi
	9SpWLpDRuFFDN71bwIxjo8M/YmTGf0vKaaCXogMVS/RlXZxNPZvCcrb/uxbjWTY=
X-Gm-Gg: ASbGnct9scGQgjb4O2/mIn+rbA0QIkp1awmgwjD4xGtxYRA0UGxXsdoa7XEJ0GXQ8aS
	rNWGdjgMOA25979cmUtgSphn6MwKd+ifl5x2qXhujsfePbagFeEsOFVDjA2dOPb25ck+uqRmO5D
	d0yQSy0OY1EQ6nmh27ZGMu2RpGhN0yXbOulr3ryazz9odndXqMW87bmeccqY+9q1VaSHaM1NJEq
	FcmRbGAJ5piItXsxRTpJ8m7jSjl9Uqnwr/4r2us6R+2AzhNiR/OxRX+cYvSD88syb8P4Vu3TEbA
	RcfBmc+JSwW1iJF4M5U4hvNzBcEJei3j8uJG5xEZWXU=
X-Google-Smtp-Source: AGHT+IEyQWWbeCYRwxnI8VV8GSkSDQ4lxsofzMyTHhJG/edHTBabUmC8KwgxolFtMAOrS/jDwZfxhQ==
X-Received: by 2002:a05:6a20:d80d:b0:1e0:d848:9e8f with SMTP id adf61e73a8af0-1e5e046decbmr11463332637.13.1734767838714;
        Fri, 20 Dec 2024 23:57:18 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbb6sm4238013b3a.95.2024.12.20.23.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 23:57:18 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: Frank.Li@nxp.com,
	vkoul@kernel.org
Cc: imx@lists.linux.dev,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v3] dmaengine: fsl-edma: implement the cleanup path of fsl_edma3_attach_pd()
Date: Sat, 21 Dec 2024 16:57:12 +0900
Message-Id: <20241221075712.3297200-1-joe@pf.is.s.u-tokyo.ac.jp>
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

Fixes: 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in v3:
- Update the commit message.

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

