Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8663DA7FD
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516372; cv=none; b=RdqAwO09YlJslvJR55meftzzx2Naf6dXznQA1k1Deou61yc11rdFyfQRtUTiBtOdnlGFPCTLZcjvS6KZEX7XyaFUH7cTK4wWrqbkiPRDw4S90Ml614OoSSBVztqrzm4Jat/dSgVxTM2rKTRXb7SSTp99cjpuLEzgBppYeaOiPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516372; c=relaxed/simple;
	bh=a8q+/xYdawHh02h+UnPjMJx9XTz6+kkAdJhtry5V5R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHukCeoZHxOPCWsb6IJ3lysdZl/DQ5WkW8Yi0Mu2IECAF2a/spKd24CCL9EHv5ofU7Hney1iSr/C7FqkhRu/6pCNingvg1816u6pKLn2LMP1ByL0rZoqWFPpfnRMF3m1SySb/KFx0+u5K/8PFdVWGsj5RBgAhDb1nfJ447N+Bog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpTUj4Ns; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpTUj4Ns"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36da151a152so2154530a91.1
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516371; x=1782121171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=;
        b=EpTUj4NsN85ofwHfEmVUsnTRKjaEq1Sz4eNNwWzoGHuw+v/F2Ff2Rh/QxcaDZCcPzc
         SMAIKM5n470rrN7tUdp/DRx1N8Vnvwv2Ln26Fj1kd1P3pW8Vjsc0SdhMw+Dg6LRBTIVL
         Mwbx3+UI7ogi8p7UlMRiZ4OXVfsu8DaWJA/UHhvn+yibobtxp/4jtu8sg6qc7i7e5JOa
         KH302FpoB26eQBvrpMAyhKur+gcTJ3M6WGmcmUIE+im1pmSvdl4XmtyR1MMRV29nISQv
         FEP50+IwggA3yQHeVXDDQle3zjRV+Cus5mCaN2iOPdA5by2ZsRqJmZDSOrwEUhJMpfTE
         pCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516371; x=1782121171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=;
        b=ElTfrtvSo9YN75SOhilNQCfKMDcSi5YRADry3BWJD9Wv6Xex1CF9CbSIQMsOt5rTJF
         NcnL/itOzzKHLycm2NisL9KwBRtmCnCLBuLG4tsQ/CDX9uLPHlEHgI6y+Sy7an9IzCAY
         KyHQwJVduZLAWvmfDoZomwimdvK61ibZgjAqRg8WgnC9FiW4xUCDwqRNyVgr+GF+Gq9y
         JMGh46uLi9tHBHscMtAHFr4FqooMIzn+kCqAbmNwgtPgpcXYG85tfaLfyXTZDanB8Aiv
         StBaajQiHsggRbWWv1LrHZCdq25B+32k22ULELXE5ebiqNyEwQzzFDnPvvZRSafKe69f
         sYCw==
X-Forwarded-Encrypted: i=1; AFNElJ9fYakxQBseomW3aULSYzXQ9fRwdARF72UViEdzt9BOUhu5gL6Ld210zWTBdflw1VP6WDs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHYiir3jtRPiQwIuujX2xangYxgoanfsjYzGVU4Px2mMsZC8Yf
	s9m8DInp2/0YO6aLImsA9L+CAWF6MTa8+D5WiOIryDGlEblFgGz8FNzs
X-Gm-Gg: Acq92OFQBG/PiJ+9ALPGZlWrSJbEMt7+3EYknWiwQ0uoKmLic5ACwag/qjykBT4sY5I
	+dB3j9Kq0Rv8vkAHkLwGUerXAICZFSBvT0IXE2MxH/+xV/4+CW+rb6xE8bFAsbCASbYHlaDxBe+
	7CWOmoReACH2wh1ygOuDDMUCWA+uFOW5pRAtwQnODOyncQl4Dhr/rdK79+h7DFNQioVigCbkIei
	kVL3jKajop4GQD7rI2jm76Gfh5a4DP9zmflJLf5MhIBlJnpDcGvRugvjSgKjHK+LdULj8R6Rm0y
	FV2/yY73LJT+FYMwfCwFAA0ICZEJqsloVl/xOwqxTetOma3GPBeyTPTXKZZZ0/u85WNQjUwHilL
	kHHtMQrFeQikYg0BwC/8c2TMFC/0QSpdSlk4/c1+y+chmLmThxhY0705kRazeW6RVVyW6uScQ3x
	qUyhyr8AkpNqgXtDUru04h81X8o3s6gXFN3RPJLKuILNjyzTVZFw0H9Uvvdw==
X-Received: by 2002:a17:90b:5685:b0:36b:9798:4f6a with SMTP id 98e67ed59e1d1-37c2bc86b05mr10709031a91.10.1781516370882;
        Mon, 15 Jun 2026 02:39:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:39:30 -0700 (PDT)
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
Subject: [PATCH v2 01/11] ASoC: fsl_asrc: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:14 +0700
Message-ID: <20260615093824.115751-2-phucduc.bui@gmail.com>
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
 sound/soc/fsl/fsl_asrc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 5fda9b647c70..0b28bcfa47fe 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -222,10 +222,9 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
 	struct fsl_asrc *asrc = pair->asrc;
 	struct device *dev = &asrc->pdev->dev;
-	unsigned long lock_flags;
 	int i, ret = 0;
 
-	spin_lock_irqsave(&asrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&asrc->lock);
 
 	for (i = ASRC_PAIR_A; i < ASRC_PAIR_MAX_NUM; i++) {
 		if (asrc->pair[i] != NULL)
@@ -250,8 +249,6 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 		pair->index = index;
 	}
 
-	spin_unlock_irqrestore(&asrc->lock, lock_flags);
-
 	return ret;
 }
 
@@ -265,19 +262,16 @@ static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
-	unsigned long lock_flags;
 
 	/* Make sure the pair is disabled */
 	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ASRCEi_MASK(index), 0);
 
-	spin_lock_irqsave(&asrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&asrc->lock);
 
 	asrc->channel_avail += pair->channels;
 	asrc->pair[index] = NULL;
 	pair->error = 0;
-
-	spin_unlock_irqrestore(&asrc->lock, lock_flags);
 }
 
 /**
-- 
2.43.0

