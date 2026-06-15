Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACC83DA7E0
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516437; cv=none; b=Ayhfi6GqGJww5lMJV9X+tDcYqzGZtDn6ouLwIgHidezBl7xQmSJTpdwS4xciyfHXP9hpF4mMqRoCR71tS3C569fylkc4xOO/s7BLHARUmBilGfDB9lyQvn4OsChQpFT7W2Xz+xsfeORYLl1Le1ZikNOWLBb0oBJRVgltT+60QnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516437; c=relaxed/simple;
	bh=8cF3HebG5op+ITs1XJRWMhmy9A1xc6/hcMM+4iQxiIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mxLxS6SMkTKlwtTxUhDGRoIdy3w7o+dyNxTNGTPr/KIJK5WJU8TsjMZmAwquMypNdMAWP/U0CZaXhnn8wGp3PjAynw2hzzz2hypc+j+Rw+8GwK0+gXObWc0bqG9LyuzXx9hDccrvpdmxfXEEmpM+LMY4TJybN5E6Aj1qOoOAQ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2yVYtdO; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2yVYtdO"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36da151a152so2155048a91.1
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 02:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516436; x=1782121236; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=;
        b=G2yVYtdOtByVSU1x1hKCBg+gcvM9KfshUQKELq3bE4C27J0RQjRjfv1s+6NqZUG5/q
         FnvmHeNCL1qauaLTVrQYYTkczBdejyAHVL7l5dbP5K8xHz/ron3591GBEasar2TY7eXe
         wLmUqgpjE9kKKzagkFLu8Gn69OgcWGK7fLVxuMM9OgxqimGkQeLo+An16tDbFRGk+FZ/
         NjWK+NU78jDS7jHxc58FkOs0wIk4nee9t8YuTLZza1QMf5sQ0tSz0zSkyh3xvMV1Y7yd
         RM/8u4NmAdqB7NDrH7CkWKpC066Mdafs9+JYbwNBHYJp7WIKsV05W2xB/s2ttuRfQDKo
         0CBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516436; x=1782121236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=;
        b=oEOf3uE8/dQz5BMs1SIgD+MXB0bnLH4oTCNQzAah5UHcAsKOMehXJj4YMA6Yg9a2sb
         xJAAVg/SQX8F+5E8smHa87TrekS6SvrswdVvCJ3T3CJS8OqWPvgB0nQyyJX8K/4dxbK+
         ROaPNtpeh/41/1YwugG06RhnP/+Xv/T8NmPeCkzV3SvwOv9tlExSfxEfX/bgHr7ETrcA
         Iac9yAY/H+BZG10OVU7UWVOE2n7r9Wj3xZ+W3sizP2lUh9EHHdWcuK4ddLqQ3pln9xUD
         QVqC9YQpB7tuo+VyB39XUGfHHh43gJZJALLCtjSuczOi7dUk9tMKXMqkuhos8aYZBwqH
         lbQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HZipUQQERN52BzWtG9UmG6bV0b4MnIE1hCR64/e0TDe+OlOKIxGAfAErHdvGQbw3kSZc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9DsFF/y443ldEdo/vUJ5TOn54JPV7TJoqE+NsZR8wYs8gRpQk
	HS005bPg+0PMaUr/U83+gYmGK3taPe79F76asnYgsUHcZw7V5Dcbn15A
X-Gm-Gg: Acq92OEoSfWXF30V/ydQE+oeofY6moAFp0CklM9/RYo7kKBLtpOQAHwTExBQfmm1wMs
	LWGzrLQNlumoTQaAyvnYyEmfKUY/m1HomcTyFZ5HDtT+7G5bovzLM1KtNbuPieFP54U11I7m3Xg
	+T6d6SHYv2ph/Efumbma0lRbXUl/yLbQAuhFsx6tSGH/WvTy0oe9nCYrzamlgLkMazalQGbmfD4
	X1LCWpTXJ/Tgl8l63iQw+7vQuFTLGGjE+eDW+PtToQAG1R4xjdv8UqxGyx36jBtPfSv3m4Cq0R9
	tfqF975LmIMZ65SWxakO7Bk2APTcok9MpgGo3FdxlcPFkOvAxcmNpnfa83lA38+Oe/RStqmn1Wd
	GOzAIe7mVXWJ23irbcij803nOeK+0w9VD30R9iM3hx8nO4RM5uzG2+00Te0KNo2Xk0BP9FG0G+e
	asB9S+ScFHXR6YrHBsQbccMb8x9ljeo4W4PrbuG9x2sDhMXMCHgplUYY7r6A==
X-Received: by 2002:a17:90b:5623:b0:373:c536:6fc2 with SMTP id 98e67ed59e1d1-37c2bd5a9b0mr10221623a91.22.1781516435860;
        Mon, 15 Jun 2026 02:40:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:34 -0700 (PDT)
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
Subject: [PATCH v2 06/11] ASoC: fsl_ssi: Use guard() for mutex locks
Date: Mon, 15 Jun 2026 16:38:19 +0700
Message-ID: <20260615093824.115751-7-phucduc.bui@gmail.com>
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

