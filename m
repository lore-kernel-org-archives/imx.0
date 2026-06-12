Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A8137CD31
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270826; cv=none; b=dKwzimtcP09WAjZtYV6L+Uk0ANOA4UFwdJqjWMcof8uYCyxLASOQMXghJ0/7Sv4i4+KP5P7VPgOMRGfOZp8YLrdiZiBxP0Ffj2H9delCUgZYEzB9iP5d1qKcjeWQjzkzgYQ4fynCsWtbtlvjZaojOFFivhLLoWX62vGE4vnnmlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270826; c=relaxed/simple;
	bh=a8q+/xYdawHh02h+UnPjMJx9XTz6+kkAdJhtry5V5R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OP1fRKKYNXuPGmbUj6aRcJlypqtBNwnkhBhbgizvTevm0rMZIblu9H/vuvzOdek5xl/qba9KL9mUoRNT00OdluGWbZ9lpLSJPwF48IiX+jYwTrAf8XxPk3r2OmnJve6w2+f/4l3NILa/MkO3l2O7dK1O30PnP2gm8hnbx+5qmTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/MOqT5e; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/MOqT5e"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30749947917so2923263eec.1
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270824; x=1781875624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=;
        b=Y/MOqT5eZY132X0NpM4vPOncw6flVsKaC2sgvWq0DJNTw9ltFqTjM/5wlzBH4gyP7t
         ChKF8Bv3fuj2SE7IoPWQamsv6vN9NINzmey1n1J8LZ3aILmVzjHliiL/iBcrEfXoxiI/
         5/Y3kesZVgA8MrHAgGcpbVu1ZaTjVCvl08nwcJpYLZpk4yMMQytp15VG0Kt8udg3ZE0/
         JFlYuiOwmKKifG66Xh3irZPfIb3lGIDUHPQVx1Q9t30ZKvsDLSkTfSF9a/HPLOFrEbGx
         EN1O3EVvAAYcr043FPV3vvSzdp9fdqfPqVyi48v1zRfBhZM1T6VA/wAOd+e4Sp2sR8JZ
         wZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270824; x=1781875624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=;
        b=X4xr1kHXKCCg4FxA+cK8bafbWfFd3moA1FRp9dV7ZaGL2JFnT+CkSw4ZFto9rn69Rs
         G8j4qT8iEPXB9xVhtoc4L0raSqOs6CK2CeFVXaCztPwY/42YCcskaaIvPMnatfGrmc6w
         hQrO3me5rCbJWh/dvQVtJlk9Zel6kD2dQVMvOtWS+j7mHTdkxv+JBEix+Pie3G6LPy2o
         Wzo5Sewww4bF6DkYx2Ab+TOvsmCieHsrYhfbEn5ucNmSkMH1cKMzC7XVID5sek3cEoCg
         QNjyQzteStYmL+viWehWTJCvu+cARy4B1Z3mksTzy3oQou12m8YfOtgLglzew33Gd3kF
         eZiA==
X-Forwarded-Encrypted: i=1; AFNElJ+pVkJYrvkP067l411vu69vJ+K9gAUX39cvezGHpKiVn6USA/QKim896nRFLf6esNBD/Rw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1RkWJDerM+1DhkKhQF73lyfjjFw4+4LN4BT+yhLuLQB+SiiTU
	FnjvYtD+nJCWnkMLJHHznvmWYiVLQYM31pP+hh7xCcjwQZwftbeURTP3
X-Gm-Gg: Acq92OH22sjN6Ycg6hs/WICVa0Fab73bD3v1dSyucP+zn2HtL5HOX4IAQa5vB+hQMvb
	N5LWQuRliJ7Hhznfl0NPzdtZrH49yiFlyjG3hn5rcCnRab10OAjcnXDXOECICF2rNMqQo0RyhXR
	b3Eq16MfnbYj0eDLXbSxxlP6mzULsPt8mTKga+K1kwP9JC8NWVS80WLKOTsiKzC+gcEGZb7AL4e
	gqGLVw9/46dbsIzJJkB3bZ2C4w6Ap7jOcm9/TlZCmGTxMari9/WEFZg3xt+dj0l6urV0GVtYVqr
	V6K95NXELRJVPBcGcYugufGfvbEL7TLHL/3rc4evBh9GgAwOTMuv4XmnHX3kvZQL6wzIO/2YDbM
	yW69fDnGtlUMDADZhbKDONkfhtooT02tIflv+umT3le0TkSwG5kbxJwRl+4gZiiCZwWD9023YwF
	dI45lBh6/069TcmUnyDZe9Bm777j26Uqf+CJeyjzJpZsMJhOaTPYI4PgaCDA==
X-Received: by 2002:a05:7300:3c1e:b0:307:91f5:9377 with SMTP id 5a478bee46e88-3081ff945bcmr1832507eec.9.1781270823971;
        Fri, 12 Jun 2026 06:27:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:03 -0700 (PDT)
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
Subject: [PATCH 01/11] ASoC: fsl_asrc: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:29 +0700
Message-ID: <20260612132639.78086-2-phucduc.bui@gmail.com>
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

