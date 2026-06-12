Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A601E3F1AA2
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270873; cv=none; b=GukviiGIZiJO9/SXR3utubyExaezVb10Qaj6N8acobQi3zhBDDMvrNKeh8hfjyKcQ2IXsKoJczz/3Wths+U+Vrmi+GyF9d3dtf/Ba0ywdLKAC0O8OIFPDhP4JwzLrR32Blf2yc+Np7f2ZcVAKrEaUpJQD55Xtoj04XmDLGv9xls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270873; c=relaxed/simple;
	bh=ilNQGmGpp8rcfqhqtSz2+RO74o+lIPVDFRt4nmgP+9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GqzScNrDDp5KPLKjxFlgFIG9Z/k7BH1YitSZysk60D+YeuR82LuEsR1scKuRcqqmJ+eZ6GwfQk19FW3GCTGFdmW2MTNjfuItlBaHFb7tzAoq7XXj2e3V3dFzNjwHI4KRXyvRgnJ1xKN/+CPAqq2D+k15RB9928BGVb2trhU72k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgxS3xWb; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgxS3xWb"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3078e0dcd67so1211883eec.0
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270872; x=1781875672; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=;
        b=jgxS3xWbu0017xUcdVSXVJzcTuscDF81PbyMJj6y3vw5Ype9n+YAQ4JxjIMMq4BHq+
         hbPGkl7XQ8yxPc1D84l0RYYlpvB0Latwrt2e38oDbzNSmsdGxnsJTHkaFi52tF5Ta7Wz
         szh88UvzmxVH2ko5uDTKy5ATN3i1CDXaURh8lsy9w+hlIck3ZgwXEHi85MaZurYXLR8F
         H4FLPD4P/V6macOt31k1UPKQpYty6OVbjqaSmwijFGh0jKHvFA+wcMFeL4N2bm1uNMpu
         5t5/0Gj/yrcUYptsx/60ac2H1gnhii1PT29vZVRrfrb7eW5txg91dOwFBTEHgK9nWeZP
         f3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270872; x=1781875672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=;
        b=gwUvdzKQbUcWVHzWFSMjdwH+9XPWaCTE2KTqvtMtU8K7WDMJnWCI4QblVfiGt0iGnl
         PaA9D+qb2ezW3d9F4+vcEhvrklWhYQA5K0Oz681c/impRmgqYYIPT7r0sYhE4R+q5vDA
         LetGBGysqsuiO3DGQat1Tc6lrCiKZ+6K/V/f/rFs9tRmUZ/yJhMEzgdROBha0UOxjnEX
         pQmDdx64Q/NIRRu8fboX72KHqhbiBzHFa59RW3hEfPniMAiC9rfSnMwqhDnXfssd9A7E
         xGkah9l0sAvNt3lNhuLMMxuco8HT/L1lqYK2YCzAZhkBOJYdxu5HbH0Wv+PishwyEXdU
         EsiA==
X-Forwarded-Encrypted: i=1; AFNElJ8IBmd+Twkt/JqEIgB+41WnVHUlKqtjDlytgzcfyi2CrlAJoahMBC1yTdLotIMJoh0i7Zw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyRfqJRBHl8OW2WbP8WB7/cFoaJYXGlGuoHsUGbCSFJyOqy9GG
	c4vRwWQwmYh10X7GUnBEmFRxKOtmx/A0ASNp9JU4ufLbGqpFBIpyrNP4
X-Gm-Gg: Acq92OGcMdfyxzAnRsUdUn1d0/EAuhv9fttibJbGB/ocLNS6hqA5UNMqOSnifVKmNdj
	NkJuhSBK0/mplqfXQGhYjskUph1urKm5E4Yod4TtaXzeQxcGHYX0aESNCM1qwm4DxmnPj24w0p2
	4XGpyW3RfxsKJRXIsqyp7hLihJln9vhXsi/wz0aFNA4rH3ayMckbt8ZQLMRw1mlUFGiIVvoVphk
	ZzDo4eqi+iuD4TkeyKz6SwAlPZd0QJQB0dNFk1dPWsjxPkXpkX2nsZdsCnc4wrD1wlG4QB4nUVf
	1NcN36curPSuSlaXzjisnrSQqXC5iEMa2xYJbIeomD9Sk8k4V0fMq9Sc6n2jgK8wr7d7TYwTztP
	WuXA0aErzDTtDYByuMLArOL2RasZ+6NkLV6WkeK8fob81QyjJY5WoiCc4ZHuCWe2Ok6T1+Tl0FB
	LcBStukoxQRIG6a7Vexvrjnqai8P4ro90+VEe2RKDXozY4RpdvgGE9SX8JbQ==
X-Received: by 2002:a05:7300:c8c:b0:304:8364:e95c with SMTP id 5a478bee46e88-3081ffb2789mr1848291eec.15.1781270871669;
        Fri, 12 Jun 2026 06:27:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:51 -0700 (PDT)
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
Subject: [PATCH 10/11] ASoC: fsl: mpc5200_dma: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:38 +0700
Message-ID: <20260612132639.78086-11-phucduc.bui@gmail.com>
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
 sound/soc/fsl/mpc5200_dma.c | 56 ++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index 56e2cf2f727b..bfedb2dea0b3 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -77,18 +77,20 @@ static irqreturn_t psc_dma_bcom_irq(int irq, void *_psc_dma_stream)
 {
 	struct psc_dma_stream *s = _psc_dma_stream;
 
-	spin_lock(&s->psc_dma->lock);
-	/* For each finished period, dequeue the completed period buffer
-	 * and enqueue a new one in it's place. */
-	while (bcom_buffer_done(s->bcom_task)) {
-		bcom_retrieve_buffer(s->bcom_task, NULL, NULL);
+	scoped_guard(spinlock, &s->psc_dma->lock) {
+		/*
+		 * For each finished period, dequeue the completed period buffer
+		 * and enqueue a new one in its place
+		 */
+		while (bcom_buffer_done(s->bcom_task)) {
+			bcom_retrieve_buffer(s->bcom_task, NULL, NULL);
 
-		s->period_current = (s->period_current+1) % s->runtime->periods;
-		s->period_count++;
+			s->period_current = (s->period_current+1) % s->runtime->periods;
+			s->period_count++;
 
-		psc_dma_bcom_enqueue_next_buffer(s);
+			psc_dma_bcom_enqueue_next_buffer(s);
+		}
 	}
-	spin_unlock(&s->psc_dma->lock);
 
 	/* If the stream is active, then also inform the PCM middle layer
 	 * of the period finished event. */
@@ -116,7 +118,6 @@ static int psc_dma_trigger(struct snd_soc_component *component,
 	struct psc_dma_stream *s = to_psc_dma_stream(substream, psc_dma);
 	struct mpc52xx_psc __iomem *regs = psc_dma->psc_regs;
 	u16 imr;
-	unsigned long flags;
 	int i;
 
 	switch (cmd) {
@@ -135,19 +136,18 @@ static int psc_dma_trigger(struct snd_soc_component *component,
 		/* Fill up the bestcomm bd queue and enable DMA.
 		 * This will begin filling the PSC's fifo.
 		 */
-		spin_lock_irqsave(&psc_dma->lock, flags);
-
-		if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
-			bcom_gen_bd_rx_reset(s->bcom_task);
-		else
-			bcom_gen_bd_tx_reset(s->bcom_task);
+		scoped_guard(spinlock_irqsave, &psc_dma->lock) {
+			if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+				bcom_gen_bd_rx_reset(s->bcom_task);
+			else
+				bcom_gen_bd_tx_reset(s->bcom_task);
 
-		for (i = 0; i < runtime->periods; i++)
-			if (!bcom_queue_full(s->bcom_task))
-				psc_dma_bcom_enqueue_next_buffer(s);
+			for (i = 0; i < runtime->periods; i++)
+				if (!bcom_queue_full(s->bcom_task))
+					psc_dma_bcom_enqueue_next_buffer(s);
 
-		bcom_enable(s->bcom_task);
-		spin_unlock_irqrestore(&psc_dma->lock, flags);
+			bcom_enable(s->bcom_task);
+		}
 
 		out_8(&regs->command, MPC52xx_PSC_RST_ERR_STAT);
 
@@ -158,13 +158,13 @@ static int psc_dma_trigger(struct snd_soc_component *component,
 			substream->pstr->stream, s->period_count);
 		s->active = 0;
 
-		spin_lock_irqsave(&psc_dma->lock, flags);
-		bcom_disable(s->bcom_task);
-		if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
-			bcom_gen_bd_rx_reset(s->bcom_task);
-		else
-			bcom_gen_bd_tx_reset(s->bcom_task);
-		spin_unlock_irqrestore(&psc_dma->lock, flags);
+		scoped_guard(spinlock_irqsave, &psc_dma->lock) {
+			bcom_disable(s->bcom_task);
+			if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+				bcom_gen_bd_rx_reset(s->bcom_task);
+			else
+				bcom_gen_bd_tx_reset(s->bcom_task);
+		}
 
 		break;
 
-- 
2.43.0

