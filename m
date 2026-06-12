Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4063EDE79
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270879; cv=none; b=T1hX1GGqX/br4llELAmwHm5II8teNIzquTZC472/Gr+x8YvO18bICyaZUcmuAs08mlFlhWovTCHLLDf9gZ5IZ6R5VuE/IITofN0MsIqaUZEzbTi8vLsrctJISWxxxtdxbSYH8cGC5yFq3aUX8MJFS+B/hBkcRoSPnCGZjLS30Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270879; c=relaxed/simple;
	bh=/Y4fs1/9QhCczmqk3YkGlZVkwGj2PaT0jGsJY5U02Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cnZEgcV8tXMkSGuLh175Gbq3iOcAHt//Da5uHXOrQR9lZdcIXsFp3wUqbnUC9Sw46w5Oi8gT6FBQHRxYW+xjB4906oyikp1MB1NZNOBr5TAX52ln7PSh1Abxxr5GDbwI2bIeq6xL+9BQzY9WZ/IOGm4IocwLNogsWgtS35rU/Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1BxOXs6; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1BxOXs6"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-137dd523634so1392439c88.1
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270877; x=1781875677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5EcAgUJr/miZOm5euArTUYqCmQuAK60NFxSW5E+pw0=;
        b=L1BxOXs6UkCbpejX/FScscA1xFJNsJVo1Jv1V/ppc8wXNY17G3GUdEjreNduC5vHX8
         p+2W2ZK8UncnksC1kZ1Vx4LHXKyeIyzFPfCMG9pTp6LYjXbjdDmnJu9f1AQYs0q+u4qa
         xt0e1WasJirfuDzhPFhYJpZwO05wOu54/l+dLsWJF4NncEIadxSFY5Xyu4SVIMce2R0j
         h0nlQootYkFqZfj9eSgMA1mSkxXtYmP1INQn+qiVPajtUglqfWe6BCoU0TIVwkdoznyr
         taAno4v9pOXLstB4kWfpE3AoKJQmWK/Zf3Y3PbbBnApDNgY6A/tTEfCQ5dzd4TPP5Jku
         TlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270877; x=1781875677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n5EcAgUJr/miZOm5euArTUYqCmQuAK60NFxSW5E+pw0=;
        b=QVFvFj3H8hS3j0JWBzgHdCSgITlh2nTgeFpDjzV67CwN5AaLNUaSBkoFymEYK2/s4t
         hyNZgpJFtaNlnrrt2XR/vZWTZzJem0fCQHuXaYRBhqXWiA+Fn4KFIlEziJzbrNl778c2
         qApGsSqT2RLr0M7tSrSLJZeLro5fxiCkMeYpXKPWNiG3OnmYpMPhzQCdeensgmX8ebIu
         wuepS3+6ZuE2mjtARgJ2o4kI+S+EclfrFYauTHtQA0tKTYJPE9fc4WVmqThCe3RvOcQM
         WV50ZLBeAoZlIrRNWAJ47ZP9GH6Tg62z60P8YA9EgDK7REkIceDQ6+lyW4nsELHI0Iei
         fvfg==
X-Forwarded-Encrypted: i=1; AFNElJ87RRpY9G4ehloHCcXLIbqlh33TesyCKK7f3xJpXoeP/upQ9sPxMgVNueyZat7p7aYMWxI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyECtufh45FnVIW5k+xlLBYYXvLbpuUECORd7ucr6vwxkCb0bqb
	EN/aSxT+BSmYYUuYdfN5xIebGNamKsABPlCRlP/dow75dmzfB9p3FS67
X-Gm-Gg: Acq92OHArX89J3bc/+bGgueIgaDemYYnJ2b4xWi7f1gvSTLQuxKCrSWdsjt7KGwg/gD
	1x4apkoKNf0YuXL5IIumglgMgh0w4EC9t+vT6iK2z4DH6IRml9+moCam/tn4phi7ckcYgFybRNW
	x/j1UBLCRndqKMGpEgfVnM37htMRulAzhxYO/f2+U0q4k+pf2ZhThD8LuWUjTuJE09QkRt4g8Wk
	6nzQnp7lYnsbiYWt93kM6INTBP5xgNe2xKWIKUnK3W0nAYZMZRoxiD+eRVugCpY+9fxGOfpmt7K
	1VsS7NUQCaNB1RGoexQl8Bpb6N0xrpSfGt3lgh/qxJVWLzGEAkVJYNVKiyg3XAk/Ruq+UwTS5Cx
	RrZVtnGIcvQNM572G97s5UouT462Bn5FEweePARfKPSyIkNzJFZ6vyCyMoA+8Ww0cbJ7iqAMD3D
	7zL3FG2CD5EnulkOV6KekmOUDVo01rwXsEGA7wkd3WuDitLJa3RcSwRu7mHA==
X-Received: by 2002:a05:7301:6083:b0:304:2eb0:2726 with SMTP id 5a478bee46e88-308200a883dmr1707604eec.25.1781270876974;
        Fri, 12 Jun 2026 06:27:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:56 -0700 (PDT)
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
Subject: [PATCH 11/11] ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks
Date: Fri, 12 Jun 2026 20:26:39 +0700
Message-ID: <20260612132639.78086-12-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/mpc5200_psc_ac97.c | 34 +++++++++++---------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc_ac97.c
index 8554fb690772..80666da923d0 100644
--- a/sound/soc/fsl/mpc5200_psc_ac97.c
+++ b/sound/soc/fsl/mpc5200_psc_ac97.c
@@ -31,14 +31,13 @@ static unsigned short psc_ac97_read(struct snd_ac97 *ac97, unsigned short reg)
 	int status;
 	unsigned int val;
 
-	mutex_lock(&psc_dma->mutex);
+	guard(mutex)(&psc_dma->mutex);
 
 	/* Wait for command send status zero = ready */
 	status = spin_event_timeout(!(in_be16(&psc_dma->psc_regs->sr_csr.status) &
 				MPC52xx_PSC_SR_CMDSEND), 100, 0);
 	if (status == 0) {
 		pr_err("timeout on ac97 bus (rdy)\n");
-		mutex_unlock(&psc_dma->mutex);
 		return -ENODEV;
 	}
 
@@ -54,19 +53,16 @@ static unsigned short psc_ac97_read(struct snd_ac97 *ac97, unsigned short reg)
 	if (status == 0) {
 		pr_err("timeout on ac97 read (val) %x\n",
 				in_be16(&psc_dma->psc_regs->sr_csr.status));
-		mutex_unlock(&psc_dma->mutex);
 		return -ENODEV;
 	}
 	/* Get the data */
 	val = in_be32(&psc_dma->psc_regs->ac97_data);
 	if (((val >> 24) & 0x7f) != reg) {
 		pr_err("reg echo error on ac97 read\n");
-		mutex_unlock(&psc_dma->mutex);
 		return -ENODEV;
 	}
 	val = (val >> 8) & 0xffff;
 
-	mutex_unlock(&psc_dma->mutex);
 	return (unsigned short) val;
 }
 
@@ -75,52 +71,46 @@ static void psc_ac97_write(struct snd_ac97 *ac97,
 {
 	int status;
 
-	mutex_lock(&psc_dma->mutex);
+	guard(mutex)(&psc_dma->mutex);
 
 	/* Wait for command status zero = ready */
 	status = spin_event_timeout(!(in_be16(&psc_dma->psc_regs->sr_csr.status) &
 				MPC52xx_PSC_SR_CMDSEND), 100, 0);
 	if (status == 0) {
 		pr_err("timeout on ac97 bus (write)\n");
-		goto out;
+		return;
 	}
 	/* Write data */
 	out_be32(&psc_dma->psc_regs->ac97_cmd,
 			((reg & 0x7f) << 24) | (val << 8));
-
- out:
-	mutex_unlock(&psc_dma->mutex);
 }
 
 static void psc_ac97_warm_reset(struct snd_ac97 *ac97)
 {
 	struct mpc52xx_psc __iomem *regs = psc_dma->psc_regs;
 
-	mutex_lock(&psc_dma->mutex);
+	guard(mutex)(&psc_dma->mutex);
 
 	out_be32(&regs->sicr, psc_dma->sicr | MPC52xx_PSC_SICR_AWR);
 	udelay(3);
 	out_be32(&regs->sicr, psc_dma->sicr);
-
-	mutex_unlock(&psc_dma->mutex);
 }
 
 static void psc_ac97_cold_reset(struct snd_ac97 *ac97)
 {
 	struct mpc52xx_psc __iomem *regs = psc_dma->psc_regs;
 
-	mutex_lock(&psc_dma->mutex);
-	dev_dbg(psc_dma->dev, "cold reset\n");
+	scoped_guard(mutex_lock, &psc_dma->mutex) {
+		dev_dbg(psc_dma->dev, "cold reset\n");
 
-	mpc5200_psc_ac97_gpio_reset(psc_dma->id);
+		mpc5200_psc_ac97_gpio_reset(psc_dma->id);
 
-	/* Notify the PSC that a reset has occurred */
-	out_be32(&regs->sicr, psc_dma->sicr | MPC52xx_PSC_SICR_ACRB);
+		/* Notify the PSC that a reset has occurred */
+		out_be32(&regs->sicr, psc_dma->sicr | MPC52xx_PSC_SICR_ACRB);
 
-	/* Re-enable RX and TX */
-	out_8(&regs->command, MPC52xx_PSC_TX_ENABLE | MPC52xx_PSC_RX_ENABLE);
-
-	mutex_unlock(&psc_dma->mutex);
+		/* Re-enable RX and TX */
+		out_8(&regs->command, MPC52xx_PSC_TX_ENABLE | MPC52xx_PSC_RX_ENABLE);
+	}
 
 	usleep_range(1000, 2000);
 	psc_ac97_warm_reset(ac97);
-- 
2.43.0

