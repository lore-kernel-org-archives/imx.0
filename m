Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133F83ED5B9
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270842; cv=none; b=YtWNjdR/Tio1J9Ahg39r9s0R+FUGtvN80r1nDnnF/mULX8V1FbF4IJnKD/NAbrik9dF5m8EIdn0hxc54e4KwuHJHsNtS3ZWJD0mlP5XoDmwvZ4vCW3vq0NDL1RkKgd2X6WHx9apmot6riwqiXGkQVX/VJgzh3W/RwDNnHtiECe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270842; c=relaxed/simple;
	bh=qSQmlpC0OGwGcB+/9udOFkuHWL4YoPGy1E9XqZycimM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k19dBxoXQuEdPKCH/tM2uRD5Js9jgXnMBMq2yOR5F+VeYWlr043fE+ayGVkLGMrNZKKjr8/SStfAplf0w4IqIYjqOrTS/2pWaPiAF9RZioulz/W2zFVGXTv0slRQAAO8fYuSSvh8FCrPHgUebGemFZAt+8G+8HjxQPsIciBOx6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fq/Pp+pX; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fq/Pp+pX"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1363fe80fe8so1467822c88.0
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270840; x=1781875640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=;
        b=fq/Pp+pXPRqpB2homOa059LF+XXmc5wp5WGixt1OWj1to56+kBAGKJ7AlGb9Ij+PlL
         iFQ449cdK1pIfjte9Y0px0MPkIeq2qhSSdd0vsQgn0H4VtJGkP4SzuMIwiqlZegIyWIi
         Dlo2afrWEoPOoyDq1FN9GL93zOVSR3p/vHT6eqCzbhiZ7Q06YQyLoMvVep5P3aQw3V51
         /5VlLOomdhqHytbvodHbNXWgV8YSHvavIJT5WHTlv9s2geQ7u5eWvk4AgZEQZxR9RnKg
         9mhWq9m2TR6AsU3jEp4dvwGZKOSN9hv05jBKDUSb+/YQk4F4CLq+El62qlriyFpjqqnE
         pwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270840; x=1781875640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=;
        b=HIXkbMlM6Z1YFS3oiVUAI1ztDPbOi4Yyhu3Ic8WwkGr5C6tSdzH5VCIUvpT0SyAJYF
         HAwMK1gllyR96zoekOkdtKAV3c0aQ2G2tH0uY0nHn+SgRYVK01laKcS4wz+bgKNbShNU
         rHiz0HHtZmKYPl7zWvPSQrge5v0mEHI4kUrrmu1foAiTUqp46Nu4+cu2EjCm1RabljTv
         5Uqr8PaG3y28vGWsEzIhoupVGIp8Gv8t6zWmBC+buwKmapwaG36ZctsA8a+8IFfF05hK
         zKrSg0Jce9cA0UH1Ws4X/Lg6ybR9QBUyWeehXsxNJLAfyKyF17t0YxyACKa73LKIPj5B
         xuZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LGPNQ0q9pdU1UyyiXwosCpoFwWzd+OAY2WOquLf6jjqsmtTR5WoDtqFr4jG1NdaIqGas=@lists.linux.dev
X-Gm-Message-State: AOJu0YzU4ooKd6yHgPKWVbc3NmK4DK+YE6Pv+Mp+ch0oxzQIxlcmGeCN
	gBveSEmpKmIYstqjiV/H57Ld/OjgQuTmLjK0v8heff9wwaGYa9T7/qSH
X-Gm-Gg: Acq92OH3xStjIssWM9qG1OweGOHCU9v7023ESQRCSityasS9D72HczwU/0Ruy2yndbd
	ePVhajEtzrMPO8/79BCui1dTBtyZKkqxHjKT5epDYyxfFpD7QQWinvuA3kksJLQETmPZsgrEh7D
	L1BMo1BeqbJR3/j+cxcIdR/nRH6sTZXVjU/NIxupjX5hP/Mojtm2y6wjcPpkv/mrgGxCt/9z1qj
	vYbhYXqZ6cBbYNLd713jpbh3q6fcjW3enlSICy3CCuHMQCoNGk6AGnRL8awxO166eJ6Je3m5iyx
	Qe+6XnKgN3CseCr+9K6SlB7hu8AsCB/hrbl808JyN6q0wNu8508xAIbGRd1XWRwHqggcihpy4Gg
	NQCJOzKxmNtDtio1wzQdbPTqi5KzDPVnaDMI4I+/U/tm5rliM26C1WFWv09zFjU4O5s36c8B2y6
	u7bvOeO3WV006OGwa7KBZO9tPO/q5DHfI5Bt6IbdKtWSI2zK5ioqeEL7cBUg==
X-Received: by 2002:a05:7300:238b:b0:2f5:3fb3:4a76 with SMTP id 5a478bee46e88-3081ff73b6fmr1678230eec.10.1781270840085;
        Fri, 12 Jun 2026 06:27:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:19 -0700 (PDT)
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
Subject: [PATCH 04/11] ASoC: fsl_esai: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:32 +0700
Message-ID: <20260612132639.78086-5-phucduc.bui@gmail.com>
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
 sound/soc/fsl/fsl_esai.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index cde0b0c6c1ef..4a530a6c33f0 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -709,10 +709,9 @@ static void fsl_esai_hw_reset(struct work_struct *work)
 {
 	struct fsl_esai *esai_priv = container_of(work, struct fsl_esai, work);
 	bool tx = true, rx = false, enabled[2];
-	unsigned long lock_flags;
 	u32 tfcr, rfcr;
 
-	spin_lock_irqsave(&esai_priv->lock, lock_flags);
+	guard(spinlock_irqsave)(&esai_priv->lock);
 	/* Save the registers */
 	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
 	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
@@ -750,8 +749,6 @@ static void fsl_esai_hw_reset(struct work_struct *work)
 		fsl_esai_trigger_start(esai_priv, tx);
 	if (enabled[rx])
 		fsl_esai_trigger_start(esai_priv, rx);
-
-	spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
 }
 
 static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
@@ -759,7 +756,6 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	unsigned long lock_flags;
 
 	esai_priv->channels[tx] = substream->runtime->channels;
 
@@ -767,16 +763,14 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		spin_lock_irqsave(&esai_priv->lock, lock_flags);
-		fsl_esai_trigger_start(esai_priv, tx);
-		spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
+		scoped_guard(spinlock_irqsave, &esai_priv->lock)
+			fsl_esai_trigger_start(esai_priv, tx);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&esai_priv->lock, lock_flags);
-		fsl_esai_trigger_stop(esai_priv, tx);
-		spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
+		scoped_guard(spinlock_irqsave, &esai_priv->lock)
+			fsl_esai_trigger_stop(esai_priv, tx);
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

