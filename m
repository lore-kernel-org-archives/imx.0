Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB17211A14
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516431; cv=none; b=ZUQacqgwFDT4JR1Ox4lm7TZK4UWInpX7xj7lxJoJ7J72hwo7v3tHc6WzFnSzbw7SgAJW3UZRKHJjWJhLR254py2pSeWDCHIWiJDSgRSx0H93aB17P1mQXAqe/yKUGjxFFiicvALUSBoWQhX13rYpDqk+Vy+gKuDRrYbzw7aLDLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516431; c=relaxed/simple;
	bh=AZ44qVbwhbS1ciYLL9/k/0g6G9OnLSH1+z05vvyIPcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRyQ0ZcSfN3/tMu8ONnhdWy0G5F/AI0JQ+p9vYozWXdMXXPh5an3voIlzrzHFzpx0+iEPDjB4nTb1FzkDMNcCD8BlcshjiKOXYrbqEqlwWSXsSTSZvM7WsbHIg4/ne0wOkLSvnqROMYajXma5fli2Cl2GQLihtjNa2r3L/13bdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXkQ0Ss2; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXkQ0Ss2"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36b8d414666so1890678a91.3
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516429; x=1782121229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=;
        b=QXkQ0Ss28weyyBMoia92jfm0bN+0b9ENBOni4U2i9/dxf1Xm/q1zLQ3fEYGgnI+c3a
         uyt/7hdFC6UUvkxsmgTNF1gQvzChkGuNB0//02sAzJoR8xFwc/bDG7PCV4voRvljz3nE
         M2jGlSieWCioIE0d2C2Rt+YW7Ii6VtlESPP0xfKZuv+MHLxKumLBXNK2Cx8oIAPj0MW2
         XXkqK3HrWVww3XvcRK2mXY8YiQEMdlBqimYkDmjInzE+Fn846ZL3hdK2XLGn0I7xmQvz
         5E19TOcQ53B0uuQ+aQLGUYsVsZ0k6w7cMT3abWlRnHAbcxSlLkW3JeddGRwq5Gb8gFzA
         DaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516429; x=1782121229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=;
        b=UA0rgpbESMQ2Mr2z84dPoRkdSZusUHlECZNp7mT2Z6DTZzIZmashNaCzEyHZ3NxnWG
         EPGpAj9NFFy/WeNOTAlLrYNWa/lVHWU3o1+e12FqgR4/rtz787wqlzEWRvHyO7iUOecL
         J9HdCmSb0jLLoSGuBlRYoWdOMzlGD5ZhnvLJNXtCmhJJNmogQZ6IYZlZg8pm1RVvU7zP
         u7ALKGNaxyvPYIVDLqdo8stt2zEGNTxEbjeiJYV2M7Q1JFnpwa1a4z1wORYIRPCcn3oN
         VuwDqss5vDAJcIfopDtfXLeAksLFsTFSMlISTdFrYdZxNaYpyAQJa+056BXVdr0STgvm
         /u5g==
X-Forwarded-Encrypted: i=1; AFNElJ8SSgAZyhwRAAwshpqNR5hMYbnWGrt1BHuQ2rAck5Ng6YQAfWKPQFHUtiah1qJp19wQylE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxI9PXQG25e9I2/jASOfABpJUa3rXNSG6nPiCArhjhxRdKPTea0
	PNWK0h7m51D8f6XjmTT4XqivsHM9qgd5C17dPsDjRlyyHzJV28lvtXiJ
X-Gm-Gg: Acq92OGqaLPTA2Chc5djFeU2I4oKd5WWNzDWwt0ePuPUh65yBxgkqoBbwzt00vD2/vI
	utsydgDmQkMj5mHgDZACCu61WyIdK8FUS3whUPfHHmyWMLTj2v352pOLw1shsRvIX/Fm1jhwRd8
	4irrJFg7yQt+ZtxmBtAfTntCL2JBTAJzP47MgSPwWF/7wAOALQ/bDN+AZzfloFkD4uhe34YBBp6
	s8uC3YxWweL7STF4hW1PWiUwsNQF6VlRzscOCn9Qry8GV6FgejitzgcFKpP8kE+gWxge76F4aww
	vmoIU4syuAFzzZkeX1kgApcaLHQLo/LfryIqsZfx/uCv4nuZWYuT61Cfbc9LFqTdXFyQotUG27u
	PQB8Gy7geiaxbLxyXvxpcQiA1a5ozcyMVfg+7tXYvBd+mBuqZE305XO5LyO+bOawxTXe/AMPU8+
	hiWS2ZHMeJev40NXt0ZoFy6Z34c7YgJ50Awzdg1dlJl7Z3pH/BTbEwoBjC4w==
X-Received: by 2002:a17:90a:c890:b0:36d:b680:3029 with SMTP id 98e67ed59e1d1-37a01847858mr14328244a91.1.1781516429578;
        Mon, 15 Jun 2026 02:40:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:28 -0700 (PDT)
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
Subject: [PATCH v2 05/11] ASoC: fsl_spdif: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:18 +0700
Message-ID: <20260615093824.115751-6-phucduc.bui@gmail.com>
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

