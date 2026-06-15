Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F23DA7E0
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516468; cv=none; b=IVkIWHI1LsVOQnxpWJxsMNYLBmE2qOcUpsVcsl/EDDkc7WaA9Ig/wyosnpDu0vFEndBbumKzPCmWJPgA4e22V4WM3G7VAcRYrZJ/6JlBRDDwe518wdIazZTQsRzp4bFwAObwp/l91XCu/Bhnr4sbh3M++0W6QkG6cPM7pJyRCEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516468; c=relaxed/simple;
	bh=W3fFeC8tGE3QV93ifp8hjoP3jLnqLch5LsU+YpSWHPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgyjq22TEF+RLWVdxn80cJHU6TIcCaK6Orlm+kW09+qcR0E1X/jgOOjcNsaiWrg9TFvOEQiGYxK5z+l16K/RXunMLA5VYCLQ8R1DIOm3JpTLiWA9EEgC4fJ9fE8BPoLol5vH96FQ+Z8Zpp1qLfyxhB5yQs1qJJlmwhQkGokwc6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ptu9+5DP; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ptu9+5DP"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso1631572a91.0
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516467; x=1782121267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnE4Srd5uTTyhfuQp5PAjqJfajCDEXq0juLBDGnU9sg=;
        b=Ptu9+5DPW3mGwuO7C6rWcXnQojnv2WFW1A89s8zdRmzfg7Ckra6T4YzGm+3U8XJAri
         quoFFUmbt6e96G/ohqTxn85VK8RS1G4rlPn/6dmtkc7rUCWyoOEzyt+6OIrZU+NKCAkc
         anubrfKIl5Ix9R/VnlVYZvyHgcoyH+LPPxS4nF0FVT9bfQQRUP8pWCys6v/T2LQSXRH2
         3x9wTTkEkhRp+ngfuwDTDitI33ydgZROXhIO43TkZRJQhWjx8igc7rtpp9BsmUCNXnc+
         Bt6wiJ9PhnC/1ocZlvlXy2AY9ob3aYBypv0mQtHluIXdQDCWa4RPVylvm/3eudY9rh9e
         W8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516467; x=1782121267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NnE4Srd5uTTyhfuQp5PAjqJfajCDEXq0juLBDGnU9sg=;
        b=lo9twIZg4uzFaNWSvTa2LM7BPRLTx6YQ5KzctXY6NCIr9BiI3gW/Sg0t93YkjowJ/B
         4gP3fManli9phZsmKcHQEyTXOZYvPDzbOBjVT5FGmRk6dUIklIi0H0D8sUv0H2jBnUaH
         bUCnm7cXRYQnNhYfA0BpObrM4oJiOmutYivbJrsFOsFHOyijRrGIZYVy8Al1J8vSa4JP
         TDRDZDK5+SfpRwrNzMC8HIL/5olcHYUi5lPNW4HccOwNKA0LC9/sIrt9D0j9wKhxpKdk
         1cKMu1IBeU7Ed6F0Xa7iBMm6bHXeh6sNsEFFskFi4/qrv+3EF3r3HuBI878gmfKAV7hw
         TnFA==
X-Forwarded-Encrypted: i=1; AFNElJ8L011XS3cuTvErqjpg5DiOXLxwNFzifMGSveqc8i/vQkA0T3ZQG5IiYBFkcS8tChSXMew=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0V3j2B2Kk77Qx3umlecR+ULw8Miw3HwArtUzeINYJTSGcrX3R
	3GOTR0MLdrdsujmcVssZQwNRxDaSsPaxKEVH7t5NOKfBgNZcmzuhpvXH
X-Gm-Gg: Acq92OFqLEd9VcnKpOl/7GB3ykwjbQfo5qmcZ5eaSqhJEbi/WeSp2c5dk+kth+7fgJW
	SVOaxoHhruT6qsw7dS8GHuxJNMRA/l+0+1AAOQ6g6iims+Nkx8PqoghWOJhKzcRQC+wVcEK11ho
	Ns2ZlII4UIsePY5YNuDcQyv+Ay/QAlR9YVcD8+Ik4xKqJcbLwErKI5ZV1BznjfT/WjmHaz9kieR
	q5Mo/N+1xwEYvaYdiuelwAEHZ41hSy8wO5kuu5/m66D98hRBppqdthPNOGp5ggW/FFHOBXeYT+H
	T5oEfo4upr43gOGqEo+RKxZT49PTT6vFJZ5+JlpB5w3UZN6PlxiJ2qGWIVTEmxMctQQvwak/1GG
	4Tm3meeYdCicoht3W2nIec2J90ia2WQ7twofbLdVAdc8iK0fm57EI8A8FIETNdCt5R2/RLTP9iI
	MrKm4Nr2flBklu2GovOKye6tssP5w6ptdWDSpU8Ac7RtL/Nxq0JZwEXmonZg==
X-Received: by 2002:a17:90b:4a11:b0:36a:4074:9aa6 with SMTP id 98e67ed59e1d1-37a01b3f8b6mr13135815a91.6.1781516466932;
        Mon, 15 Jun 2026 02:41:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:41:05 -0700 (PDT)
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
Subject: [PATCH v2 11/11] ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks
Date: Mon, 15 Jun 2026 16:38:24 +0700
Message-ID: <20260615093824.115751-12-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - psc_ac97_cold_reset(): Fix scoped_guard() usage by replacing
   scoped_guard(mutex_lock, ...) with scoped_guard(mutex, ...).

 sound/soc/fsl/mpc5200_psc_ac97.c | 34 +++++++++++---------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc_ac97.c
index 8554fb690772..d4d9f5b6bc07 100644
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
+	scoped_guard(mutex, &psc_dma->mutex) {
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

