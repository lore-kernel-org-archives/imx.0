Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1143DA7E0
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516390; cv=none; b=nYPtvvQ2ByKKjOKPMZXmpejYAlhDWr1nrn4JftkjpBSDPtSXvciTfqw5sCqrZWxyPx8KTbVKj71fcOGhemh2ejATAApeoPltA6RjSJIEU7jsdRKD1qV+Lik2moGGMK52CDgqn+k4hCHmtDwWv3fbCQn1xqZe6iTJOEGZV+79tEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516390; c=relaxed/simple;
	bh=eGIrG7UB1lhufDoMtkQ/eRxkJrt6N3pqPE1KjIIgjbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9T4SA8YjPxhIt29pjCsxDDrBZlCvHsOg2j1kp6Dcw91S1v6DWIXoMnhCSUg+oyyD7AUYi69nVW9nJ1GEXoW7p29jwAaqQrKdQig8nGFPi2makiu+22Zg55ienrQ6+jaoAsH9/7JOVFysnTpdG/tHLlCrV+4q6qn1EH8Qvn+Ing=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glHDoQ5H; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glHDoQ5H"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so2159724a91.0
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516388; x=1782121188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANb0KIfsTx8/8tZ1jjFTsAAUSzrIuzqzfqRTdMc2tcQ=;
        b=glHDoQ5HRF07LD582mOQQU6yiHYlTOmLKBsJDsZjjZhfW4QDmyfIZUCrDadZDGI+fs
         69lfw7nEA9s6lTyn37oizx3youqbX6XYbcILHT1SoTPvjBdghE5x5r+dfDn2msp5E4gP
         MXUy6fEGDX7gB0WiiS4ksFkfQL/BPKYee22R1Quwb9+NeW0Ki/6Va5g1iOL/RbHs90tW
         6Rp7hW26CM/NlqVXWwrNKRFW/uhPGN8Xo00mU/sPJAlbajoJjvJILbuQSPLBvlJSEoeO
         250QstA7pTzYohFbRH8e9Rr+9TobeHS63Kf7uh8vNuV85huXrTNLDPqB8St/LIIvUUq0
         E+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516388; x=1782121188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ANb0KIfsTx8/8tZ1jjFTsAAUSzrIuzqzfqRTdMc2tcQ=;
        b=EgO/EYs9jjf+iZKbq6bnOU9wLsKzrkc8hzKv6Lb5lppowiJEdCyQOJTdYeRWWXqKge
         jP0OeRLus+kRogSOPNLpkkUdIM/sEs7lpNhRULS2tYBruV49lSHHLkhXft7U7gxLRCM0
         hC6wRpvrK1wQQ8DnXE2dYKeODALOTUDdGsSLhvuLvAXeapdeIL+7OuaNejwAWkLj/i9d
         279BE9ATvvYp84ntiU4j8zUc2tyUu39ORIA4Qt3aJ6saG4aMThVZq5+lHhJhBASpzPsk
         nIX8lJjS/B+C1LaY4uNlhP2CWOmr8+eZcgiHaj34hPEz42m9Ev9lap1E4QrObwtqIp4r
         fYQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/EyHA/p6xc9xHRw8JGlJ3WuyCLeHBMzCyJGWvSJ+deeUf4n7JOizWDeZ71U1eZH9QXnno=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzrePOAXx+7tNAcq9cN4Huwo8+zgY51+/9bqbLhdQTSvwT8xIh
	NuNLayPgEF4n7CkBa+hwh0/2/DTDkKDCcSLS6e/ciIRBlTPlIy1qpudR
X-Gm-Gg: Acq92OGjBfuFMPK23qbRbtY1BlRvE4GhzEjPI9ab04f00SYN+RACZtPezZc4Zmykxnf
	wsjSPRzcSeISLD0GcUySBHmxt1JkLtSbnYj2IRGSam7WfaETITDCvTQMReZSvO++WbiUkjA1M+D
	6+wTq2+9PGASznl225ina6n9DQcfG1+6B5hsA2VCiIFuYDlr3HrGJ7P4U2Us2HdKd+GyZPfwiFZ
	7W2NQgR2wBKyJqKwowCBsQY+hip/ZNsPkxPS6+MptIwXjYw77ToyI1FkwTDbTzy/BboDuTMbDHv
	1bypwXdu+XGv9t2ergxkuhI4SOnCjhcKn5MzUx6PnkuWnoq1b8YtHzHiHqAaloVXPfoO7GtmRow
	f+PMrtpsbv3HOGLLUVBzfxARvyLCtNx2eg9TQl6+v26xvUEFsSbILjVKkll2oIEWNLq+ku6V/1o
	Qn/YBLkq0Vm+Dona7+wo4YEI9l549mV84OjWj3p/1fY7mgAO0Hmv2ogLlSxw==
X-Received: by 2002:a17:90b:1d8a:b0:36d:86a5:5b8 with SMTP id 98e67ed59e1d1-37a20016cf1mr10407905a91.11.1781516388272;
        Mon, 15 Jun 2026 02:39:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:39:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 03/11] ASoC: fsl_easrc: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:16 +0700
Message-ID: <20260615093824.115751-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_easrc.c | 36 ++++++++++--------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 114a6c0b6b73..edfd943197a0 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1025,7 +1025,6 @@ static int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
 	struct fsl_easrc_ctx_priv *ctx_priv;
 	struct fsl_asrc_pair *ctx;
 	struct device *dev;
-	unsigned long lock_flags;
 	int ret;
 
 	if (!easrc)
@@ -1053,9 +1052,8 @@ static int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
-	ret = fsl_easrc_config_slot(easrc, ctx->index);
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
+	scoped_guard(spinlock_irqsave, &easrc->lock)
+		ret = fsl_easrc_config_slot(easrc, ctx->index);
 	if (ret)
 		return ret;
 
@@ -1301,13 +1299,12 @@ static int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
 	struct fsl_asrc *easrc = ctx->asrc;
 	struct device *dev;
-	unsigned long lock_flags;
 	int ret = 0;
 	int i;
 
 	dev = &easrc->pdev->dev;
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&easrc->lock);
 
 	for (i = ASRC_PAIR_A; i < EASRC_CTX_MAX_NUM; i++) {
 		if (easrc->pair[i])
@@ -1331,8 +1328,6 @@ static int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
 		easrc->channel_avail -= channels;
 	}
 
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
-
 	return ret;
 }
 
@@ -1343,7 +1338,6 @@ static int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
  */
 static void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
 {
-	unsigned long lock_flags;
 	struct fsl_asrc *easrc;
 
 	if (!ctx)
@@ -1351,14 +1345,12 @@ static void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
 
 	easrc = ctx->asrc;
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&easrc->lock);
 
 	fsl_easrc_release_slot(easrc, ctx->index);
 
 	easrc->channel_avail += ctx->channels;
 	easrc->pair[ctx->index] = NULL;
-
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
 }
 
 /*
@@ -2292,15 +2284,13 @@ static int fsl_easrc_runtime_suspend(struct device *dev)
 {
 	struct fsl_asrc *easrc = dev_get_drvdata(dev);
 	struct fsl_easrc_priv *easrc_priv = easrc->private;
-	unsigned long lock_flags;
 
 	regcache_cache_only(easrc->regmap, true);
 
 	clk_disable_unprepare(easrc->mem_clk);
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
-	easrc_priv->firmware_loaded = 0;
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
+	scoped_guard(spinlock_irqsave, &easrc->lock)
+		easrc_priv->firmware_loaded = 0;
 
 	return 0;
 }
@@ -2311,7 +2301,6 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 	struct fsl_easrc_priv *easrc_priv = easrc->private;
 	struct fsl_easrc_ctx_priv *ctx_priv;
 	struct fsl_asrc_pair *ctx;
-	unsigned long lock_flags;
 	int ret;
 	int i;
 
@@ -2323,13 +2312,11 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 	regcache_mark_dirty(easrc->regmap);
 	regcache_sync(easrc->regmap);
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
-	if (easrc_priv->firmware_loaded) {
-		spin_unlock_irqrestore(&easrc->lock, lock_flags);
-		goto skip_load;
+	scoped_guard(spinlock_irqsave, &easrc->lock) {
+		if (easrc_priv->firmware_loaded)
+			return 0;
+		easrc_priv->firmware_loaded = 1;
 	}
-	easrc_priv->firmware_loaded = 1;
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
 
 	ret = fsl_easrc_get_firmware(easrc);
 	if (ret) {
@@ -2377,9 +2364,6 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 			goto disable_mem_clk;
 	}
 
-skip_load:
-	return 0;
-
 disable_mem_clk:
 	clk_disable_unprepare(easrc->mem_clk);
 	return ret;
-- 
2.43.0

