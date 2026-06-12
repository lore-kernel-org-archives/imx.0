Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC0730B502
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270831; cv=none; b=gvsLW/J2yK1D3sNpBVMZ2nfgU0rBOEYPhF0yNbXHzOTal44Q4GwvxMwmZGdUKqrkoQdn2xTyl+XNcZBv+3gQztzR58AGyiF5j4tgatWpWI7mi+02vgaVEWBpQ+/EpGtEOU44KRIHqXRsZXTMtrG0RETQwU9lf/NB+kfsbWA4bbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270831; c=relaxed/simple;
	bh=8wyc3RY6uip+bGnwzBR+Cf6kRzh4sj2U9E0OtlF0qCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tyCIehmU1axJHKOrdy/M4TUpn3n/BLxn6MyIKDrVqzChDZRxs72xLhE2kZlJMIGXv1r/1LgBJ/Q5tW64WjtEgxyKLyZnODlt/xluXVFQG5MxJrDkwLA4jgKBSViaomjTMpqf9SB74/VWb/Ji8hZWS7SAiy3ZyYvZUbWzZdwWlSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCcms+63; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCcms+63"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3075ce9c05aso2130019eec.1
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270829; x=1781875629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=;
        b=oCcms+63J96M/UdT3/BFAzTSy10skxeQY2XMP44G97oFlmk2VA3gnwkRTNxXF8rDe4
         aoUYI49HNGERlUOLCdGflU5rt7yaTcg7aej7Qde+ers47NiHyGdXkAID/vY14adFIn8t
         NUM1xsV67rRTtfA/ZTQjmFegtBZMrcAf7xhY9YEGdM2vYwjqxG+Xz677LFAzYCuy65JD
         92G13v5x8Krxv85JlmAiDr2pTdYqtQd+gwxoCiCAiIYSLm910eUHW/bJw+kFHXqAkLUh
         naOP7kMnmj3kw0EhRMtb9CWtbh4DqCXnVBdJwnCf6hc1nuFnZ2gEc0pDM5qQ3EIh7l+M
         7njA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270829; x=1781875629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=;
        b=YuF8xa87se5y7Ek3bEqfiw91H08+ajXk7lW6i9IuJTwGVa+bumNDkOe1LHw1hmlRLv
         aEBHUjOWW8elUgHT9SAzOn0bQzc6Pln+Js7K5QyjWIjrgIYyLL4+2J8ZZ2cFx1DHUKA4
         25oqnEZeIV73NZpZCBjnH67lWMJ89dqK2XqLJ0he3moVKQFXzUhdpluwR4W32X2fSUl7
         0n+fEitvqSMmC0TQRmprOR7yjHpMfXPHcPIc6RrvWr+OrXAlu0BM9xcWY8U0bN3fVWq+
         dIiRqPUWt7Ug8DO9/L+3FtirkmG9B3FuedPfzWwR/SavVGbezdfYSu7PSHS8Lo9N4ct6
         xwUg==
X-Forwarded-Encrypted: i=1; AFNElJ9QeMEVqYIo56AtQyp0j3V9Su2CuLAI+vJqd1zKc9rD1RrNtgdSFrOnrwRL1tfcBj0+hLE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrs5Y9uVCZKHLawx4OqFdG4Fj6ITdRGiSFKFNppHEz9NWyN62z
	o2WWvPpkx70+YHNNZ37/o7bt+rp4tTQel/1fXDU9bdZ/2+RGajbnxY62
X-Gm-Gg: Acq92OESjpnecV9NXRzMg59sipdc99MG44mQAmSn9aF7siRCKl9YCC1JPGB9eV3+kq8
	GA9Vn0xE6l010k4PkCufKzGo8B1V/rfRmbT9OCRdJ67hAHXPxH1XD/PH/1n6K2TMwcHYWsqbnhh
	5r0jAYlv/+AkRQi5UB5g5S1Z+6YMSfuuJXlQrwnzY8nyNtbvSGnfvy5WoZ4o1VvyXnNRRu1e4kI
	ewLgObgkr6OJaAJN4X1on98OEZ1soiJKF5GCe5uB663oGh5X968Q1yVOE7kifyqWQj3yfFwlljI
	Vw7gV2CgQu51IIGMEbMBx8AocElJtijRk2f31Q78sPnBZs752uZdOmkiqGSTy0pbO9ljoeOaB0V
	u0+qSBqp0E2mvAZxxyoBQrWG8M+o9Wx4h+IRAKU5EQoUAutUfaRm+7xU+AJOJT3LFDME4aKD2wI
	yc642uXJkbQFWMqrJcn1Hb14QKLJu5fPNcc7yfwoVhqRqyaaHyRuXIpBimdw==
X-Received: by 2002:a05:7301:fa0b:b0:304:2176:a871 with SMTP id 5a478bee46e88-3081fcdd9f9mr1776040eec.0.1781270829171;
        Fri, 12 Jun 2026 06:27:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:08 -0700 (PDT)
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
Subject: [PATCH 02/11] ASoC: fsl_audmix: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:30 +0700
Message-ID: <20260612132639.78086-3-phucduc.bui@gmail.com>
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

