Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5F73EDE75
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270858; cv=none; b=bYy60ADO1te5WHC7JgW+w5viS5kGurg1VWxL5PgIaO768nVxPo8wP2TUwUrfx2IFfhSVluVpqZcY9tjzj2nFnDTuAHb9+OcZXuTQSdZpg3VJwW9ZadKRqRq9mq1hdqj7BuX/wQAMnliSwXozinnVM+OMcUgWWV+0C8XWlc7j3yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270858; c=relaxed/simple;
	bh=uVOODI0dcvu4VrcEd7Pee45Ik1Uu9/KkXXqPodrFKkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUn2wKz8ovM9zKbPKi3hs9nzC3GIyD2SurZxye4kzYczLoyXg3/sh4Lq27GZhN1oU4XFXQ8C+dnYXqt2oBnPidXWDzHhUCb4rsVJi1Hq8E/fgMjSYnZr+tx6JyFBIJHGT1dlUHISkV5EL41qEsFfNXWYrj4Bvbnfjg7jMN3rfOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6EhkIP2; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6EhkIP2"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3074adb8fcaso2529179eec.0
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 06:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270856; x=1781875656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVq+Lu3avSLljn1bjHDwqj7k0Y9nxoC/mnINOIpcocM=;
        b=W6EhkIP2Xay1GWwNR/tAVezyRzIGB3ckAr9QC9nUDlKSVxqD9254MO82dfko94+WPv
         eI5lyM2T8agG+Tz/+NAM7fUCmbsIA2BVTCRXUD0rbcDdsgvqjaRuqi4DVcoc+GCrJeY9
         jICUTk8aU/pSfLPTMY9YWq725R4FwiyKsWPdhmKD3mu2zVwj7kg+Y9Sc1JsiM+LPju8J
         MCG/+57O4yxHINt9U4gkj/73VVX4ZZkSGiYkzwHXr7IlSgX43pE2wrFOLiaP7eyW2z2g
         NopFJsu6HzV93s/j6WzdvvH/ruBsyxlXuRhHeTNb17WUvN9TbBzZVmUPp7zm+mm21czv
         nx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270856; x=1781875656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVq+Lu3avSLljn1bjHDwqj7k0Y9nxoC/mnINOIpcocM=;
        b=kbs+YpGyBj+PVE1nWwSDy/sicyWuj5AejPu4D+w+BoWOKkreCyOi6vYoTHCgR1M7ij
         hpRIX13lSWWTSBLIYkC52rhlAk6yMlL0kamUHaSNzJUrGCOiHMHpCgYBSxVwblVqUb0H
         0m1hp1FyYhzz8hLLwCqeZM1ogfk/5zSw1F6bon8MujbwLbCRCIzPk1S/+xSoUe/su3iD
         lGxCf7uBL0jXBbSqfTVJz7qnkjE+tQyKvF+cirOuWGZy2maiRqjHhbuLFf9QOxsicRiY
         7UytW6vmQTTypHOe5uNN9DTFYhGKr1fGEVp0APdeXGsJOJnuypNcMkPLKc6vSEdO++9X
         DQTw==
X-Forwarded-Encrypted: i=1; AFNElJ+4kQOgGrTVsU/Vqf1QUVvSzMw/26DZEIRpZ/QlG4J+c2twZIdWevobp4rMzKZIMlKgYak=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0dscNEK0eFSVV5D4m1DP5YLyAR5dR3OXMUUZC2EbGPr48yToX
	fH0HdslrsS7E0RpcPvm0xbU2RBE1E0dATwQ0KgcR6ueK1kV2Eqh7Tsv3
X-Gm-Gg: Acq92OFgSji1Eru3SlLJ3Ds3fJr49ZfEOa1wc52ze1kvZa1MujJ46F8athHfAy7HSCC
	/VKt3P7aq8K5SSryj6l8pKaCUC9Kho0kwscleQkEwKJIoiBrYYXS/x4SbkCkml6lkKNkeUavU0I
	ZHwIEEYvUZVNkGy1fFYWk3djMv+0jIspLdPTgokFU/BLO8ppu27GJ4GSnMGM9ragRn+1ULVPLmM
	Prad7Svr9RHDtOF7Qy6138vDHz95W/VB2C8JSkSamG05aH5HYpOxr3oZdcuqgHk0vnhVJax0yAx
	54omLQRYaO4bexdubMvghEm0v3K2RrNJeKZ4KCxCVw9u38k/T/LxQQ+QrR1YNigGRSpri6CkNMN
	hNvU0u3j6HUPadMAVN+mnuQaWrKElDSERDYvmrA5M8ZD+w/75RstETSTaCyLNEYvgn3l0ZxC0sQ
	Yr/FMcNxnmbnB9Leb5UpH8VvDMISPDk2dgxssLjX/TPlEeyZvOi2nqTBZQCg==
X-Received: by 2002:a05:7300:f082:b0:2ed:7e1:975 with SMTP id 5a478bee46e88-3081ff64a8emr1866575eec.1.1781270855805;
        Fri, 12 Jun 2026 06:27:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:35 -0700 (PDT)
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
Subject: [PATCH 07/11] ASoC: fsl_xcvr: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:35 +0700
Message-ID: <20260612132639.78086-8-phucduc.bui@gmail.com>
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

