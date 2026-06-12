Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769463ED5C9
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270836; cv=none; b=OFWvfHigatN3ikBVolBC3Ut/HL1BA0RtU5bzal8iFiuWL/GmvYYVnHK2fo1OrpGIr5YEEUFXPqkW9KvDifg8tkfL33NRo6Qj9cIjlYsLNsJrKbUVj12LNvKo7+LLDy1Hr9BsZMCYcnnibIP9gXJyZGoi24C7l0NWK0mHyOQzaSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270836; c=relaxed/simple;
	bh=eGIrG7UB1lhufDoMtkQ/eRxkJrt6N3pqPE1KjIIgjbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ArB1wwKu58Q1ihSfq5DmFQVJ7O5XqpeJVxvR3UV2UElugls/b6Eq3RdvrdGKO+l/9m8xWbWRFMSNzOSHr14lbHBUmzOUNtTv8JgmuCjKQlVxi4yrBj7NJQdypm7Tg6R8Obra41712pUv3WYUjxGx8DBzNlk8Eb5bcjH+RL9qZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P97eyOiE; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P97eyOiE"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30749947917so2923784eec.1
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 06:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270835; x=1781875635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANb0KIfsTx8/8tZ1jjFTsAAUSzrIuzqzfqRTdMc2tcQ=;
        b=P97eyOiEXAOwCHnhSbR7IvrQfpBTzHeqv7m7Scn1EKFyXUD8lc9Z921aBQ/LDAlnye
         Uniz7/9of+U2Ew5qOXIKRi712dpriVRdzZkacOjhhH4on6X/RfTwG0h7B8A2AaxigulA
         F8OptfkM3TVAI4i0N28J0C/Rg0asP/bZRPABdPtw5wjk2CmozErxTBJrB2GpZTSW3/uP
         dLjYF1AV8iez8jBx3p3KVzYcacn1gMS7woZgJY5MjeBK6cWiuM/xIdTOSPeSdRQarGzz
         Neiygpme2vknp/uugVmAM0MRbT94kE17QnCrbuGQzvZzp5/6oz4+zN9d/7UzrYzM41SS
         TVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270835; x=1781875635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ANb0KIfsTx8/8tZ1jjFTsAAUSzrIuzqzfqRTdMc2tcQ=;
        b=k/KA8of0xjOjGIkyso3V58D/sSZh/VIIvSNOebFmbG4c5WXxY2mTOQeXESQD0e/jpL
         WiLlQWbSIIUiwR9smfleXe/5n2voLAGb3pmRtFw+yKDWEwmQ/YoPUw8Vs0UdnB2349Un
         FN+SQVVu/AxT2mpS/jTKoFl0q9oWFhPR+hnMif0vCSh9GSF3thWc9ndxgvEet0RQKosJ
         JvIFoZMS56y34Rm5Qd07sYnCZlfaWQB8VUNkgqE8xMWcqXQrxIQQ6iAKYDmF6LilRmgj
         cthJWbaq7EL6et/w6Vtzeua6DzzfaSdJ9jq1DZOgscpyF6ELaOgy5HY+pVz0NJCfE0jZ
         AXMg==
X-Forwarded-Encrypted: i=1; AFNElJ/eM8dYO4hMTxZ4wR6Cde7la9biugR2wxLz/OIloV2jYYtT5RVIFZxvwNHpuTicVWy6hB0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxY5/ajuaA3taBH/rxTO8w4Wc8ZXWFf3lOncUsrXki2JjnbbvLR
	RP4+dD9TGyihC5S34ApS1OS19LnzjU97np5oYv+qfUL2A/56W+wfvWRL
X-Gm-Gg: Acq92OFPCFmSsxqKDX0F4gw4OmJoNjCaJK11M0ZEp1TbRa0v6gPoSLB8+V/uHxUFbba
	kkHhnKW0mSPSD0O0ppTLiaqGJwJjkL8XzjbCpaLJQ9CF6mP47K2tV1A+a/X7i6Lr3nTaxaQEMVm
	cRuWAeqsDLzw2U7BE2C2fTgvf1TpkfeqElS56YEXXjWMmtRt//KcbIJ/e9bUZ7XrsFZYcTOmwfB
	oFKVeDLIB1Db7dH3VqIGE0vFBvFFK+NdxXEh/vC1cGodI3xOA1OPzrVYVJA4xCJqifPg4Joe9Z5
	rhvi5unOZHl8yIuWaHnfeVp0510Ygr4TsiBZ3Ng6OenNBVRNSnFdU3qXLdANdz+i/ZK/Opy/XCw
	2ShqC9wmUUMY/pPw8piw/2gZ1UxVgVdlrXLFbwU5BVfUpMHJmXGq7U3FOjrSbLdCfcqbIkkDlau
	6BQmF/d0iQn8ufqr3ikyIzqsawhQ7X7CHd2xjAivBxTVR4+jZUG9g2ZT5AaNoLI5VunrWa
X-Received: by 2002:a05:7300:ec09:b0:2ed:e15:c927 with SMTP id 5a478bee46e88-3082021fa5fmr1811315eec.35.1781270834683;
        Fri, 12 Jun 2026 06:27:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:14 -0700 (PDT)
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
Subject: [PATCH 03/11] ASoC: fsl_easrc: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:31 +0700
Message-ID: <20260612132639.78086-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
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

