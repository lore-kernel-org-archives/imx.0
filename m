Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316DA3EA96F
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270847; cv=none; b=tyZJivZMl5g0wNjHi4pIL9L6/tFgQFGz0s9/q9YhTJN7EyBByx9yLkgEzpJjduOjuLy1S8X57qZpYzE9TL+rrU8v1ufazzCsWfA2V6shqV+z6ceNc4SSGX+bsL3S5cEga4H6CIl/l9acNx38OYGrXWkuyVhFMMM979gkEN/36/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270847; c=relaxed/simple;
	bh=AZ44qVbwhbS1ciYLL9/k/0g6G9OnLSH1+z05vvyIPcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b4967MepEjlQoo4OnW84Xu0HsKP2Z7sog+EDIVjyRslOYkRgaMrYYbyklzYWqGUOVFWCPy1laA75Opx1diA4APLGkqqqLi+TNfdfYVN77m9Tqz/7ELmwOvlQwF8IzfZNJp803K7mUTxvwvGEmHCirrNxxXP+wC4qkh+5iWrC5xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLqqE51A; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLqqE51A"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30759632453so2066213eec.1
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 06:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270845; x=1781875645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=;
        b=CLqqE51AU1A8TExdroSP+O4s4dQXkV+yY0Cn3fPPYSk2e52Od7xpriGGLvgnVCmd2P
         Ah9PF2fAo6EFe1ZCR/xlkWH53vRIT41e6bMN53o/0WM3HmP9wMQ4FUru9rWqXqxtEbkx
         xDeUQSsH7Ay5wwGnzPCIXs3K49WrsmhrLYel7Rnyk/rMAOaR0pVl+bMBMhdxm2UeYBHF
         0Hky3+iGIBiy0QemKKAwM3tJPlOeMRsRdweqWE8L+0D+LWnrrE3dn5D+OQkXf/wZO8At
         fVWmsf5v6xSiqpiFXIALVBIUC8KVa6wdPte7QV241mCKU3rk5eCfrkVJSXzG6XtBN4tU
         0OLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270845; x=1781875645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=;
        b=MQ2TyO2XcG3F/nFZr4hHNeh3ntzwWxN2tX0XQpJ6j2SO+fYzQ4S8DAJOdiO7U9IUtA
         uhOdg6rQEtlKX/VnjN/pVWMLxYCRZxjK0d8bWofVyQM6yjm5g7vN0BEo7WGeQI9QWMjY
         aOLcvvPY/CyTnTiI+4ePmFYfxjoo4C3j6a1RZwjOPo8lczVywh4b5XTg7Kynm0Shb9hi
         CkyjhvrwHBRys9aSIVgik2tEzNgRY8hk29dCtcYUEKsEq0Qeyg51B6d8SEFtciwyC7C6
         y0z7YDWiPGZsia6kVZxx1fQJO7rdrZIqOfX+rJyfJYBRLB9KW6Pg/7eN3QFPqSpr2Wt5
         pvzg==
X-Forwarded-Encrypted: i=1; AFNElJ+aRY+SjpnKkYGWh4BBoWKUWpZfKfLiXZqf2YtEhkxcfjGiYqMaOFBt9gBEwfYCFY+rea8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyDwe4HJ2HmffSTBDB6frxxmQ7YM5U0JJo/kpIFNOg+ZKY4SEH
	O3VwvsvOI+/ZCEfQd80306oaVvkc4rA3pR6n/6j+bhOt+T4THMqX5Vlr
X-Gm-Gg: Acq92OEBPwdWlgLqXA9ng4csnh7nmcUq/GDBxvW3vpqvIy9oa9wG5IJzHTGWwFXq/ZF
	EleRdQvcphMbpUJlPLZYJ0zJpT8M0LDGaS8hITY34wBCosnTXDRTNptW+7pbt8Xn2Gb7njE5gQm
	KCiN40H6u8Okyp2YoA3hick7/IV9s0EMwz2v0PIod89Pv4zQnRT79TayrBGWKeoE/hD1AeW8KLp
	UmpjoT2h8If4uQHXcBapF4T8MT6UZieAdYm4pp8eOgSAJ3TBiBqDgNQnxek3T8squGQemSgT4yO
	lszrFtjoVxqLuYNs8LxV7utw2Q+OmI4nwGYfLNdTyLm6mKsQHrlB9IEkmM1LhCj/SbAqxMPd6Nh
	XY/5IG+WY+7JbJwsVHeWFuo6SrAwvcUlDsNSgWgunjHc5RllGqtMPem3oGd5jnfbamqLZJl96cw
	VVd7NLMePju5IADVL3M9SPgpfw4hY0DIOaz+Nnnu5M6mlTLOQBRNMUFqOjeQTN7xvJaRDg
X-Received: by 2002:a05:7300:2148:b0:2f5:5dd3:1fcf with SMTP id 5a478bee46e88-3081ff97b78mr1839542eec.10.1781270845378;
        Fri, 12 Jun 2026 06:27:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:25 -0700 (PDT)
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
Subject: [PATCH 05/11] ASoC: fsl_spdif: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:33 +0700
Message-ID: <20260612132639.78086-6-phucduc.bui@gmail.com>
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
 sound/soc/fsl/fsl_spdif.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 1b9be85b34c2..ad1206ed9882 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -853,17 +853,15 @@ static int fsl_spdif_subcode_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
 	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
-	unsigned long flags;
 	int ret = -EAGAIN;
 
-	spin_lock_irqsave(&ctrl->ctl_lock, flags);
+	guard(spinlock_irqsave)(&ctrl->ctl_lock);
 	if (ctrl->ready_buf) {
 		int idx = (ctrl->ready_buf - 1) * SPDIF_UBITS_SIZE;
 		memcpy(&ucontrol->value.iec958.subcode[0],
 				&ctrl->subcode[idx], SPDIF_UBITS_SIZE);
 		ret = 0;
 	}
-	spin_unlock_irqrestore(&ctrl->ctl_lock, flags);
 
 	return ret;
 }
@@ -885,17 +883,15 @@ static int fsl_spdif_qget(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
 	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
-	unsigned long flags;
 	int ret = -EAGAIN;
 
-	spin_lock_irqsave(&ctrl->ctl_lock, flags);
+	guard(spinlock_irqsave)(&ctrl->ctl_lock);
 	if (ctrl->ready_buf) {
 		int idx = (ctrl->ready_buf - 1) * SPDIF_QSUB_SIZE;
 		memcpy(&ucontrol->value.bytes.data[0],
 				&ctrl->qsub[idx], SPDIF_QSUB_SIZE);
 		ret = 0;
 	}
-	spin_unlock_irqrestore(&ctrl->ctl_lock, flags);
 
 	return ret;
 }
-- 
2.43.0

