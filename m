Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2315C1A262A
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516462; cv=none; b=jZZv/6DveulF6UPRy9f6mRdi2m50Eb2S7pOu+vDi8DIYY12VvK49VSuX71Zs7GDCLgYQBreyo3n01KTlmj7chR2oUnRcIzL4nv3VUkF/JhFj1XgkalIuYHpXe00w/dgMfZsmIiJ9dgJpiSQOpZoCvTBiUGHLEZDLEpmrxpSX60A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516462; c=relaxed/simple;
	bh=ilNQGmGpp8rcfqhqtSz2+RO74o+lIPVDFRt4nmgP+9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqyroyaY4YTtNAWfKvHXTgN+5xy+YaiyO3hhETRl7ZjCBt3PGNtUIFVdqnv24E/EExGREtuHNVFxR/SeLg9QWsphZATJ0DZRlWR2zcKnqgIM2o9NJ8ENuCV1ru6IKV4mFojiIPwpXIzuBX4IcfWzJbR035H/Mwv9XFb+14TCWa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpV2oT3D; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpV2oT3D"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so1927845a91.3
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 02:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516460; x=1782121260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=;
        b=SpV2oT3DN65+/l1fPirExSQHuBF1R/V0Jrlsnok5J/JyxYdRq1qnMveNYp74fgSTSM
         6HvlfSbSAqx1tzouzptVoujxcQeQL2j3JFvpd2wlRgUyyNHiT18sIScDuQ2uGEw7e/gr
         eeoKiX8ABhSh8v5Qh/A73zJR1sph1xDHQf0jzK27QK5fyg497IDNcYzAkAia63xcUkx4
         pyMc3ju4cBqOzPEr3CWgBVv3ccj2d9uFLmZ4QP4r8io1Q0kKp2d1bJ1//7JWfqRmkcU6
         BcthttVtll1tEemzQ7mnv3HL3rCwDs3tpq90Phy7RXc68NfnhuUIYJfdYaXurOjY/WFG
         SwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516460; x=1782121260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=;
        b=awDveg7WCkjA3PeNpbECT0XDikIfyvk578KkP+ploqxqEBjfdDMdJPW14sG930yHM4
         ANb4hhQrAP9SesVQloQYBjHi/GTQ1jtlSzM8xcjuNLGDsQwq0n6v3lfO8WVv0dd23jpg
         NxyqvI2nlCcertffRnjwvlP6o7XKNw3LOegu54XMPwW1JtlXnpSyo3/E26hVg5CZcjuB
         ZAbkwF+DKP7cG1u6bJMVGVrVQtNcmLHxkvHa7H0BWZkxsk6Um2Zl48fB2vT5Snh3nmN2
         ClLedB01hOLkpzpiFIqsT6xdNDgCq2JznxsR2Y5F5WkPNUXk34a92d5n9HIQFkNON6Q2
         Dc1w==
X-Forwarded-Encrypted: i=1; AFNElJ+lFsvNZzLQmfpI3EIEfy+GsMepOy6qiHkQUkVxI9lpPzmmyZGHNwNVGBUGZWFNvgq37L4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTzQYXOo5wWfcSzLFBN3MUTCw5zU8hgf+48uUMFsZ5BqKY4W6w
	6guoCuQivsrs9RUD+ZFF1c0xLYk4oFnBlof/ZBa+UfbFLBn110OJ+lms
X-Gm-Gg: Acq92OHSowyGKkmi7mzvDFaYQYRcXlNDHNjPpynRtJ2nulKgKYeil3KjpUkVYHHkz5Z
	/HkRj3etUcs8T5DTU3+8Ig7RLKiWXDj5NjTSYf6nvRjx0AYjgnrWRsdCc8gMpmaDAQu7h1HrNm9
	85tOa/ZnYAvpv5QZvVqpp/y0d9AjdvWq3CYzVdsCCSK1xywI4EkmdlQ3X9iMK0U8aO06W5TbFJk
	wijdM6lGtAKBqZ0+ex0oJVqpjiVypw3WAeZJ/hhFuTURm2F3HyyYboihjp433uhQ1BbKpZqEVN9
	HeDNj7KKP6Ht2d601ZPXncqIexbdD+AXfXFOZMPUNqCpUaJLDos75nnCokmKc6CmwbMK+k7+7cV
	PvdvIkANgBYuvXWzahZbVRPfnyZjdEXVIujM+qcCV5XcdKH3YER+tzveoNgTvDzq+S2uanYZb+n
	cV5v5aI5wM1DNr57IPcb8q6PVVx0yeAzzBVtKb859bwfwTHLQmIg4B/nywCDLimzqn3icm
X-Received: by 2002:a17:90a:d004:b0:36d:81b3:61a1 with SMTP id 98e67ed59e1d1-37a01c34487mr13541493a91.7.1781516460544;
        Mon, 15 Jun 2026 02:41:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:59 -0700 (PDT)
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
Subject: [PATCH v2 10/11] ASoC: fsl: mpc5200_dma: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:23 +0700
Message-ID: <20260615093824.115751-11-phucduc.bui@gmail.com>
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

