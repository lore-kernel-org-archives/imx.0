Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A392261B9B
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516425; cv=none; b=sc+TMPHvbXbttWLjQ6w1gyWi3rVt9PQcugfkhzveQGVLdMaNF5Be/EXjNaso6GT0TfFh613v7JNBNa+UWgtJ2qRtk9AMXjedEYW3BBmW5PqI3GcRo+Y0bSZHiWbsNmrc89VRpNIAiTFc+9sqLnL+SDKpbA5WciR5mSlG9A0oNX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516425; c=relaxed/simple;
	bh=qSQmlpC0OGwGcB+/9udOFkuHWL4YoPGy1E9XqZycimM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMyjAnUkFVlaO/AAi6ueZuA8fxAdybgEzskrGSxTn3t3AnUolSn8eqFaumSQ6gE1/KtFuHp8aIDEB7SN8XS/fXrMfd1iTcXSNQql4BV7SWjt1NtsNlggcNADg4Jkpx2H2f9s7xD2Z2ibg17qv8plgmjHx6HgkYA1EmSY/1m1HVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3Q/xnUO; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3Q/xnUO"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36da151a152so2154957a91.1
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516423; x=1782121223; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=;
        b=g3Q/xnUONi+6DNwGuIJNce0OKzf4OiKzqgL8jeeQlzdNZ/6tIipq1UHBfK1gbtKJ3j
         2SogJ+iF+qP/boDDFk9es1s2chLPlbh0r8Jep1HBw+LFht9sPGm09pw7WkEi7I0wGDV1
         tzWr4jDx/XMXZgAuTZ4+A9ZHPH86D1GIwFw46Tq6I4OTs90upB2wopUHUGeGz94bzSGU
         eW/APlJKhs9a3Z8BBKlWJysH06Afq6aZKgS87cBZ+1BcQdvdLxPW6ENX5SQt9KbAIXxG
         CiUPknRtwZ0LKrdWh6MTpY0JSlUySC0JP6nh9m5spNdE5hDa5Yf/hoKsvF0dXgtH9zT2
         GSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516423; x=1782121223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=;
        b=jMv1PlOBzmZLgGstBxRLmVkzegRyTierXsoYfX74guYYvbNyq6MSfQ4EBYTCvXxqSK
         BVmWWBrwRGpb4WENMUZEnDa4fnkZZ1H5AXbj7JC/p7tWI9MrywT1knfhDtdVLDqPkEVe
         4NevlnVXT1zM6LTYyIUxqh/hmoKq4YiB8wp+Z0z3tU+YqdZo2boIJPRGrCCqbzOCBAkx
         iLVIj4r6wJXPablSqhwShhDMwHd/d5K0CxEKNkDr/RZCehDGOxvR9ZO1Ypm0D4KDAD7K
         Yl51bcTljXE8b75w0d+JF7kxMjeJbDVx2pqdgrQ0+jVriCyOOAm/qV5VxgmCOe0FyGvG
         mWNg==
X-Forwarded-Encrypted: i=1; AFNElJ/G6hwOHxg3A0Qq+kA3fP6qIG7AAvOxmqlXeq6fnK/9sl/zWA6zM0/J93zfR4iz/jrrjGY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5BfpjUpXzjFP1FKRtLuJyArmRChD6AUszPI/jicQ2xOy/NPcd
	Cerv0jAg762zpOFvgrw5ekXx5AW9HRvyxeVJSPkq6X4vXGPs4YySCW1H
X-Gm-Gg: Acq92OGLqa6ItUAo61wLyNbHe8O8Hb5euZbsutJJ4ZzTd86auQamQgSHl7VC1ITRoS0
	kWjGDhhtDUprsiOIgUI6vTf2T1mdmfVjoAwRryNjIF22xvgOmZAZwHu51AsTQHk+87k6oJqn/dM
	oK1kkPOmDhtdWdQItViyFT0wb8jWqhyiWwP+cwc/2bD+6HcsJMpXRpeKpylcbPcLWO9tSvgxatv
	RRz1QtpTT2uovA479pfhUA4UZcYs/MXXDFlIQnKUJjgh3l/oglqP+XEoRyS4VERYxSAveCEABYt
	nnAPkbKxNJ/PvLbB7UsklzvPklcDMUA1WQ7WD+oufaQldeg+oveLVq5uou0O3AZt5RM0GG5CG9D
	bHdihCW316vpTGDcEm5AMYBWqSBwuIKq/HxAv7BDR14qe0EUlXuwYdCocD6iLvwoELzvbF1ebXU
	WbZVRAO0gHtInYQGkxC1BV3rRCJYw5A3tc42d8/gCy9hGak3LQI8iGrTjqgGPidA8ICLhq
X-Received: by 2002:a17:90b:3a81:b0:36d:633a:e7e5 with SMTP id 98e67ed59e1d1-37c2bc5d64bmr9860091a91.3.1781516423443;
        Mon, 15 Jun 2026 02:40:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:21 -0700 (PDT)
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
Subject: [PATCH v2 04/11] ASoC: fsl_esai: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:17 +0700
Message-ID: <20260615093824.115751-5-phucduc.bui@gmail.com>
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

