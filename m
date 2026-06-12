Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAB83EDE43
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270852; cv=none; b=FRdbo0DBF0Fmj5uVIJQ5K3NSErpHgnACK5u/SOM4n7MBX/9Nh5uL5SKv3p3kMl/znEl56zXkPVzBv0jvObB6oR1EvtynM84/NveTP3tV48S8pVMY4rDiTvGGQ/XXoVrmYroYMhVUbVJyMmRE45N49ApBkB1G8cSnjkwVA7ryKIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270852; c=relaxed/simple;
	bh=8cF3HebG5op+ITs1XJRWMhmy9A1xc6/hcMM+4iQxiIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+gsYMKzQ4qm8m95K1nWQNV0Yf2bZ3430nlk7VIyTP84plpd4LopjuRIo9h2E7psAaJMan+6Q8bLYL1l4GjBahPSgsp0WgvoHQoi3p6B8BRUZCjWYyCq5OrLwBP+xyIwjvSkOm30OxqyKFfm21zPtrUjxf1A1dBHTfUg8KvlFUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AR8JBB5j; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AR8JBB5j"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304df7ff4c2so1249777eec.0
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 06:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270851; x=1781875651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=;
        b=AR8JBB5jaDWDWSoB7QkCiRylGgw6ZAZFdbMtWDCfLpLxOAN1Q12er1vefr4qeFBQte
         zFeU9Z6eGBJ3um2DRpNQPpzFbYdkStjs5h2boKAOSOskVDkcWRcJEJuPmIKyAREEedDM
         xfl1U42fk2ynJKHYqXRN4qfYmJpe8VqEpBeWGTcu7iBWeo1whO2EPsBqBHlEPKMkIrwS
         xccvXDBNQKIw5TQOVzkHqeJNNq2JUvjGECL900ahEYv0Oz7LalS74jv4WNzL4mzXuHgT
         1GOopxCOtX5JVGIpqlxEYOp76M/Wgu2xjL7yo4R72I/5KzpVRR2ej4D3BsMKsyiCiKb5
         2hZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270851; x=1781875651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=;
        b=azJeutB1CjDy2j7dVc86szo6Xu9Dgwb457/nVCKJPFfEUPOJfNh6VKIWYm6jY0QHKf
         iHwIIfEZRviAo8Y0BGPuO8/g+t/w6Y0ivDoPblHGmJF/zd7xDaI0auPDmMoCaQIRA7IP
         aR17Ws3ZpvQGDNpUxkvlYCj4bOxs8+yZgZzIAZYRpLTRIp2v2Y+0C5Jycw5KuDNLy6Eq
         hDk85mhvholCwIgi5AFnLFcTe5Bvoo8XaSHUhiObIT8g9/tP2i1KNIYl12/oeT58WWOg
         V8WcEUiXnGj9DzAXZGq2SjYt3Tjq4invl0c+Ecsz99BKuMG7BCtH/t8CvqHD+TQ0ojf7
         7gwA==
X-Forwarded-Encrypted: i=1; AFNElJ/nxARUCenSll1NHSiRhSCVqNLTPiVj7GvlXbLCFbsy1mgtzA+weBKjvi+8HwhfOQcpFjo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7WrgeWqycJwh2WGVX3lzCBitH4xu3jTd+YpqSl/QhCHmzWMj+
	rcGJhWGjHrHGM8ZIUosli+BYI330io7m/qVYx/Qwk5xwi/pt523a5wgl
X-Gm-Gg: Acq92OFXQ59YFHV3GTnsKwGvrcTQQZbO97QvCuLUeIJqMP6WGNaAjLuUKIV1e6G2uyh
	pDynwhRai2vWi/rU78KVUFUO6MZ6alDr18hzdpuW5+8d+vcp/UZmpenF8+Oklba01BhsznJGSnc
	/D7x8FIr3CM49aPfQmcqp5eFxqQfBkwAX6t8+cKloO3wrXmD0iYVd7/Q1L85tdV5mA58Disysp6
	vItfXuR5WyLgpSHAYYdZLQH2p/Kkur+d3Lau1Y7/YiLA3wpW1hFMCftptPG7Ft8MFTT2qsLmDFU
	5gebG/ufdhQbQY+JlYWLxU/5c0hNw96lPXKPCFtg8YrigyFZIwIK3meVkfCPv3VE6qSzTeaIb9m
	yrNIFhc6SYphUwk6Aoy5vlrKmLC598bwu/SZvChwQKzN3Teli39Tgm5IKvGIv3hE4utVHTk9uMm
	F99IVYquXkr9Pa4Q1nLQvdLQog+yLcjUfkzojiIf3amRK7p9Koe/nnCOHuAA==
X-Received: by 2002:a05:7301:9f09:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30820c2d782mr1373677eec.6.1781270850611;
        Fri, 12 Jun 2026 06:27:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:30 -0700 (PDT)
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
Subject: [PATCH 06/11] ASoC: fsl_ssi: Use guard() for mutex locks
Date: Fri, 12 Jun 2026 20:26:34 +0700
Message-ID: <20260612132639.78086-7-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_ssi.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index b2e1da1781ae..dc022976c982 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1218,13 +1218,13 @@ static void fsl_ssi_ac97_write(struct snd_ac97 *ac97, unsigned short reg,
 	if (reg > 0x7f)
 		return;
 
-	mutex_lock(&fsl_ac97_data->ac97_reg_lock);
+	guard(mutex)(&fsl_ac97_data->ac97_reg_lock);
 
 	ret = clk_prepare_enable(fsl_ac97_data->clk);
 	if (ret) {
 		pr_err("ac97 write clk_prepare_enable failed: %d\n",
 			ret);
-		goto ret_unlock;
+		return;
 	}
 
 	lreg = reg <<  12;
@@ -1238,9 +1238,6 @@ static void fsl_ssi_ac97_write(struct snd_ac97 *ac97, unsigned short reg,
 	udelay(100);
 
 	clk_disable_unprepare(fsl_ac97_data->clk);
-
-ret_unlock:
-	mutex_unlock(&fsl_ac97_data->ac97_reg_lock);
 }
 
 static unsigned short fsl_ssi_ac97_read(struct snd_ac97 *ac97,
@@ -1252,12 +1249,12 @@ static unsigned short fsl_ssi_ac97_read(struct snd_ac97 *ac97,
 	unsigned int lreg;
 	int ret;
 
-	mutex_lock(&fsl_ac97_data->ac97_reg_lock);
+	guard(mutex)(&fsl_ac97_data->ac97_reg_lock);
 
 	ret = clk_prepare_enable(fsl_ac97_data->clk);
 	if (ret) {
 		pr_err("ac97 read clk_prepare_enable failed: %d\n", ret);
-		goto ret_unlock;
+		return val;
 	}
 
 	lreg = (reg & 0x7f) <<  12;
@@ -1272,8 +1269,6 @@ static unsigned short fsl_ssi_ac97_read(struct snd_ac97 *ac97,
 
 	clk_disable_unprepare(fsl_ac97_data->clk);
 
-ret_unlock:
-	mutex_unlock(&fsl_ac97_data->ac97_reg_lock);
 	return val;
 }
 
-- 
2.43.0

