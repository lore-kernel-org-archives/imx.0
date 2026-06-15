Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A103DA7E0
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516384; cv=none; b=WVrDBpeRIfh1qOc194QLDSSZ/iyrAxXkcMnS029EbQqW63nt/Lpdf/yNHoOQKnK6b3oWtfi5hhSoqiutOcmKgGWfaymGpPalLypeNPNMIDpJQcC0YRj/4uoKAr+KIfX/6dyUWz48MikyoO8ti2ZkAVKQmSBRabdtxLC5qyAwyVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516384; c=relaxed/simple;
	bh=8wyc3RY6uip+bGnwzBR+Cf6kRzh4sj2U9E0OtlF0qCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+xDu6Z/LHHsLVO0HWT42aXCZ1SHMorqnQN8W28rpYfnWGn4DWkxYZm+axvmgc3FCierLDEzbWUrMWG+uCkO5gWPMgk334MGKd+0NuqSP46BukWwf/5fIz+5qMJOxs9RurTP+cQm+SML3S7vq37ydFCRO8I+76XKz5eKrWhYrZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lq9vzOaP; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lq9vzOaP"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so2221918a91.1
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516382; x=1782121182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=;
        b=Lq9vzOaPPvhojwdcY/3SEp8hEm7GS2AlpeJNt+Hi1vLiTZsMP9T7ger8LOSzqXA2J3
         yDHTyExn42cXeVDLzoP3L4tIcCopEvqjoRJFjPPLq1PPHuWUrAO7KrmtEmJwp2TDU7Gl
         EUafzUInxF5XNZkj7M8ogv1acxXvmMx6kumkuhrRgY8+TY/z6YHsPGgzicGz+hKOlyZb
         BQzHuPfcWOUV5W+SX0gJFvEGYrgzhJLsUse8cge2I+A0HVu8z14JwgzTkizV8wN4MOLv
         37yhk6R+s3j56yf9RIWUF+VmqP3Budz8tOyzutZhoYMfyW19qI8UirZUPkecUo4TuPB4
         rvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516382; x=1782121182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=;
        b=dX67ArXUouk3JyzbGMCq39u9q1YwJFA1nDS9XasZEbgHb4m8rAsZXt4vv43AIVlifU
         I5Ws0v8GSmWd5Zm4wbyTD0zqE8Ept+7GgLc9ITVpglnnVUtMsrojJlErSykYB/SfW0e7
         Ij8nWtl9LYWA3u0rO0H3uBDXHtJzrLyjJl4FczzGkJQZ68LGUlL/VKEOIzGJJSeJozsk
         3Rf0MmSQsUTZ89krntoI7KmLT3Px5CevEt72cR/eoCDvY631u/dyAgaD+SXgNQ/TkVmA
         lD2ax4BPdDRKa1SqtnRLd50WUmZ5a2cQ290rqMMT/rVepuz0yUCnJre9CQEr5NoU3TV9
         wVPg==
X-Forwarded-Encrypted: i=1; AFNElJ9uk2LFnmt1W3UdhUhyezZxGhZ8Aq8eL8zz/3/OGV+5bS1cBhGuxezqf/wz5y63TyjI+Is=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl6CJ1Rs4ZgLULVJemV1Ha2ffZEOhV0X+AKf99gBoV0U2jLKeg
	gWwmHTdZOKV/xuD6zdp0gfece9TczljEhAwNm8yh3SmN7QqzpCk25IB2
X-Gm-Gg: Acq92OEAdnm1UDhxVU1nxnFeN6Z15xc/RCiDrthjW9dB2Aq1BYWbirQb4lXHc1pvoLe
	hJQRh4QnnzpL5eSVepqMupU02B7TX6MrPSD0C6eiUtyeoo1vVOIypHpxiLs1xGYKGYtQG8xnYXY
	tOuHeNEodGD5uU5gimc1j17jnGrO/mlJuqlMF+rT58xrOOjpcfrdRH8zHkfFh7A8JIwsVvVd270
	jHX9onWt+ZNnqdQWSKaOb8w/8sdTzX0aHGLuwqvjcdOc798995XdQPPQ7Eg4eL0wnh6bgxO92Gx
	Q8xtJd8sqW8sn7leW5q6MaaxHXHCq6MGWIith/JGODwzlKSh0riQrkIjK9lUR4+zf4Bm7JgjhIU
	oc5fesx3KbLTgGCPWAuvq+f2SjV8bhWe8zqpfud5rtj5u0GR43Q9O0TW6GeiP/1bSc1h3KG3Nuy
	XN98RSHT0fJtWHKB/BS2960gQOOrtFT2royD37/mABMAx/6Na6hKAPDwEHew==
X-Received: by 2002:a17:90b:33ce:b0:36b:3ecd:88d2 with SMTP id 98e67ed59e1d1-37a01847928mr13640118a91.3.1781516381562;
        Mon, 15 Jun 2026 02:39:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:39:40 -0700 (PDT)
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
Subject: [PATCH v2 02/11] ASoC: fsl_audmix: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:15 +0700
Message-ID: <20260615093824.115751-3-phucduc.bui@gmail.com>
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
 sound/soc/fsl/fsl_audmix.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 40a3b7432174..066239c64037 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -280,7 +280,6 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
 	struct fsl_audmix *priv = snd_soc_dai_get_drvdata(dai);
-	unsigned long lock_flags;
 
 	/* Capture stream shall not be handled */
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
@@ -290,16 +289,14 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		spin_lock_irqsave(&priv->lock, lock_flags);
-		priv->tdms |= BIT(dai->driver->id);
-		spin_unlock_irqrestore(&priv->lock, lock_flags);
+		scoped_guard(spinlock_irqsave, &priv->lock)
+			priv->tdms |= BIT(dai->driver->id);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&priv->lock, lock_flags);
-		priv->tdms &= ~BIT(dai->driver->id);
-		spin_unlock_irqrestore(&priv->lock, lock_flags);
+		scoped_guard(spinlock_irqsave, &priv->lock)
+			priv->tdms &= ~BIT(dai->driver->id);
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

