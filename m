Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B4A3DA7E0
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516443; cv=none; b=gKT3e/ujXgmEzqlOvWaajAOz9juR2KWvJ/zHth3MVVPK9Tw7ua2fQbVg1PjaKkbZYXHek+D5plD5utV5iWyFG0RonTO1PiH/z6tWJ/tCpTDQEc2OmOqEqGhvUf1i9yoi1jaYQYwxq4BbypKNO1Ks4dDoL2HVgN6xI1zo29KJoEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516443; c=relaxed/simple;
	bh=uVOODI0dcvu4VrcEd7Pee45Ik1Uu9/KkXXqPodrFKkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5PgMyXMvKg6afy8iwOeA9jXchtgpG4eRktXmuonsraMw/EZ9CL0/e2GkjgDS5tw31bHHn/cjacMgnQll5gBZgx35+KcewNxMtxG+fjh9JLZXpLK0f53UHXik1ph+7Oc0luaDq4Zg69fNcleXIKZXqD7KGRG9FsphzM+QoMOXWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRy5Szi9; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRy5Szi9"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36dac5d5d05so1473129a91.2
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516442; x=1782121242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVq+Lu3avSLljn1bjHDwqj7k0Y9nxoC/mnINOIpcocM=;
        b=iRy5Szi9otxAWRPVAPcgPLIqc8PQhG9jnVeT0jUgbN/qL5kdxzJzuQcEh/bZWiyypP
         7BUQYV2Sn/ddgtEQCNS+r8brIVmmlRfYJXlX/WAsLNQg1BhwwQSQ0Ld46YVdHAHCiU5r
         J4YTLozm1mU001R7NK5g1iT271WUl02Wv2mqL/47ycA937ZfjW8zw8xji2ImQ6YZNe0e
         ikGiK21vdO8/O1ueRGmj6kFOSfaOpyd6Hht1LOnzLE9qPwrBo2Nu6Nhq5PINUul1IE+u
         b3tlaLzs8o1xI8FYje8Vs27aga4/uaoAttdzSZSTsUUtN5XyKcWTrWBG/copRmBHilJP
         I3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516442; x=1782121242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVq+Lu3avSLljn1bjHDwqj7k0Y9nxoC/mnINOIpcocM=;
        b=aURnbinGp9U0So4Rl99vjv3yGSjRWvgtOkvFPKOxJ8HproNEjH8PAOJPSvuHV8xfM4
         l47SYVSaYVccTp42I/uVd51WvY58WUkyGsa8ZFGyB9DMW4UTSqYvRwJNlPGjD5T/oSzz
         s5gThaxfKsmP5TfTLk1ZE+5aZexwedo3pClIfkfirTLZYtMveuhJTbO+9VoG/huTN+jD
         DrFv9HemyLuZRFsdh+mHcX3RFQ/yvtHBjC5ssKqRRJZK/bbFNYheGL/rxBDT2K9LjWPi
         x1KO8dSMNG1cO8qrDTOfvg58j2Dp0VWWUsIDT+PAZ+PJH8gyWIxQfWsxcojarlFmWmoq
         EqJA==
X-Forwarded-Encrypted: i=1; AFNElJ+7hBOh6QbyCg+XHZVB+1lhwk8DFVFHdz9s88E2FZ3op/6hy9Mx4qfAciMMRTIXP6voGtM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDhLk76RlU+y9WdDud2FfHnKiKqMj95yHsbzaUTumXVemL6XpK
	KSKf64fFkZOHEuJDPqIp+ReDIPzJgg0VBaziq2NsITonxlop5Cvrz8EB
X-Gm-Gg: Acq92OG932gEVTq2ziMvn6GuQng2ZIw5o7gS9ENECokm9LhWSd0J5F/ZRDmTPiTzjIi
	ZZ9DKQXWIMd6StWKgswomfu3QWADO6cC/RYxaTe9z2INGuss0JUG4DCWhpuQhu8R3dN8NOLEN3C
	CNN2D39mIPJ5jzLXCiEldOV3mZb9ykyFhqsCZOeA19BxvMFs+XfrJwte+pUW+YWlfpm2n6mQXyo
	d4BZ3I1816ZLCOEoCqpbuHAGRKNtWCBqr5BrUEb7KBgmieo2cXg5WtjbLbKfMwL5wyJdQaQwju3
	Hnka5KzSpFSBLlhhigwYGqlIBYzNdSjrsfkjSu0FCE+7B7oVVVIG/19mXuqOyBfruKZaGLcHP75
	Epq5DoKCVRUMfvkheU4l0+EAZ/uLs8Li8bs54XI5QgFpUD1AU2YGBf+WG2B4KDYQhibAXO4BqNc
	ORmcoSnClXnYDhtoT7E1BgNM5lMAKIAsUAZVJsBn8q9Scu+JTIBfTTEzKfFA==
X-Received: by 2002:a17:90b:2781:b0:365:a5f6:4a5c with SMTP id 98e67ed59e1d1-37c2bc5d202mr10797246a91.1.1781516441891;
        Mon, 15 Jun 2026 02:40:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:40 -0700 (PDT)
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
Subject: [PATCH v2 07/11] ASoC: fsl_xcvr: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:20 +0700
Message-ID: <20260615093824.115751-8-phucduc.bui@gmail.com>
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
 sound/soc/fsl/fsl_xcvr.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 6677d3bf36ec..41d100500534 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -797,10 +797,9 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	unsigned long lock_flags;
 	int ret = 0;
 
-	spin_lock_irqsave(&xcvr->lock, lock_flags);
+	guard(spinlock_irqsave)(&xcvr->lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -812,7 +811,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_EXT_CTRL_DPTH_RESET(tx));
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to set DPATH RESET: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		if (tx) {
@@ -824,7 +823,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 						   FSL_XCVR_ISR_CMDC_TX_EN);
 				if (ret < 0) {
 					dev_err(dai->dev, "err updating isr %d\n", ret);
-					goto release_lock;
+					return ret;
 				}
 				fallthrough;
 			case FSL_XCVR_MODE_SPDIF:
@@ -833,7 +832,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 						      FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
 				if (ret < 0) {
 					dev_err(dai->dev, "Failed to start DATA_TX: %d\n", ret);
-					goto release_lock;
+					return ret;
 				}
 				break;
 			}
@@ -844,14 +843,14 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx), 0);
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to enable DMA: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
 					 FSL_XCVR_IRQ_EARC_ALL, FSL_XCVR_IRQ_EARC_ALL);
 		if (ret < 0) {
 			dev_err(dai->dev, "Error while setting IER0: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		/* clear DPATH RESET */
@@ -860,7 +859,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 0);
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to clear DPATH RESET: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		break;
@@ -873,14 +872,14 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx));
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to disable DMA: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
 					 FSL_XCVR_IRQ_EARC_ALL, 0);
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to clear IER0: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		if (tx) {
@@ -891,7 +890,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 							FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
 				if (ret < 0) {
 					dev_err(dai->dev, "Failed to stop DATA_TX: %d\n", ret);
-					goto release_lock;
+					return ret;
 				}
 				if (xcvr->soc_data->spdif_only)
 					break;
@@ -905,7 +904,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 				if (ret < 0) {
 					dev_err(dai->dev,
 						"Err updating ISR %d\n", ret);
-					goto release_lock;
+					return ret;
 				}
 				break;
 			}
@@ -916,8 +915,6 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 		break;
 	}
 
-release_lock:
-	spin_unlock_irqrestore(&xcvr->lock, lock_flags);
 	return ret;
 }
 
@@ -1448,11 +1445,10 @@ static void reset_rx_work(struct work_struct *work)
 {
 	struct fsl_xcvr *xcvr = container_of(work, struct fsl_xcvr, work_rst);
 	struct device *dev = &xcvr->pdev->dev;
-	unsigned long lock_flags;
 	u32 ext_ctrl;
 
 	dev_dbg(dev, "reset rx path\n");
-	spin_lock_irqsave(&xcvr->lock, lock_flags);
+	guard(spinlock_irqsave)(&xcvr->lock);
 	regmap_read(xcvr->regmap, FSL_XCVR_EXT_CTRL, &ext_ctrl);
 
 	if (!(ext_ctrl & FSL_XCVR_EXT_CTRL_DMA_RD_DIS)) {
@@ -1469,7 +1465,6 @@ static void reset_rx_work(struct work_struct *work)
 				   FSL_XCVR_EXT_CTRL_RX_DPTH_RESET,
 				   0);
 	}
-	spin_unlock_irqrestore(&xcvr->lock, lock_flags);
 }
 
 static irqreturn_t irq0_isr(int irq, void *devid)
-- 
2.43.0

