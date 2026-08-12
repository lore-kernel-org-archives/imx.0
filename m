Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F2541DE19
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529692; cv=none; b=ERlgEcB+r5UYhmcn8bAFbkT0/5lZ68u65Qcu+8C913sAyOk2V9XGxg5AQydzGE8YKIQHaJ562oEp5qIhWD/WU2FyP3v5dCeBxFx36qddN9Ypt8IiDANBg7WQVG9vDu2otOIwfg4Gk6sg8Q/RFyDSzpsq2Uyv26mLQWWyD3vIfAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529692; c=relaxed/simple;
	bh=+c4KOpg885WRYyFjTjqXfoNfJYMaRRXl16T1yy+yDUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtiSxNhJF4T+VBFMMdZj9JjaIi3t5l8/IAibaqFvXlH/y3CnMUuIcGOWptV85Nt9zsVa0xZqPvRVZJ42cpfgsf36qYtmYdnbSEnKHagrw8A/J5E3w0IpjxaSwnvuvr58HgFp8Qy/Xr1RDuCWi9KdOeltU+CxwtvHpWZBZaEo5dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9N0I6bD; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9N0I6bD"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cee9b74ee1so7256855ad.3
        for <imx@lists.linux.dev>; Wed, 12 Aug 2026 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529691; x=1787134491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmlgcPwHF5jOxRxD1KT11UbnHWOCjsQAdwUgZ3L+zv0=;
        b=k9N0I6bD2d+3FGgSTGC3qvADmkl3yn9zP/AK81V5FTPzGTHXpSZ4iLNZLd5Nz58vhE
         IwDfVL2EB/5PORubekpcuBhyvCPAoGmGy4dkZf+An7jd1X3PKez5oQBT3dBMzj7tk1ia
         pTRA8q7sYtQBww0g6cGwFHGhXLo0fffLzOZ7h8qrhFARM6JHh2+Ztjq5GDuT6I+EFRnD
         BipHxPRp55RJOR3BLS1c1DHjreStRnb9d1ypU+tSRvLxZd4uHsFfXbnC5f9y9ikCVobw
         vQKjbA0i+lZaLt9evkTlXO6WOmR7Z7IO6GtBp/3pa1oacSm3BaxY3zZrCbHJZ2J0pSa3
         5LjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529691; x=1787134491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hmlgcPwHF5jOxRxD1KT11UbnHWOCjsQAdwUgZ3L+zv0=;
        b=saHG6c1nCNpyqw8bD5awFVHEoM1gh8cMuveJOzgk6S/VvM+OKbV8x5aVkk05RJdfyr
         GCgi7b8O0xOYn7Mi01ucyrDl90GFTnFXKrSnnpPS+2P0mFM2YUjUGuVly2qCqQZkSE3Z
         lSyVeoGljgvUQ+m+XsCPMMhIKej1OA/9t3wQDveSws8FWGc/wReD9F7JkU7gWVJvRxMM
         KpCpJSdGT+JEB7a2/kNtSrPFOvhnaP448D9ZJMLpXIo6mP6hafUAtlavrvnHwOLW0mF7
         l5AqCI/VAwBgGfStTisEr33mRWo9chL7Sq7Ezfgwu5MR5NBTgOuQth0Jnfa7Gtn2h/Ss
         3Vcw==
X-Forwarded-Encrypted: i=1; AHgh+RpIDEknM3mTa6qrQVEwCRwxFxZ/Y9qJvKmNJp7OFECg3PYW/IQcuvlfevufnaYWo+gSpjA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMCZeME5iPf9TczBqMfX1/YfqKUkpSdDK/zV940BVK/Y8hav9O
	KwtWafEHofINLd37YNoeL122oJwsWnsPU6BpZ70fNZPJs4FBvJGFExi8
X-Gm-Gg: AR+sD11rShMQCDbpb83vDBhDMPgWjMR1k8N8QQEcC4vXcIXl/aqfxKFc1krq56Jazjj
	lSfMt9UBAsa/uLASocdqjKgFg3U/NICTsuxjTfzcjyGdw7HBVCLBxT1oMLygDgQsbfCbs82eu/A
	a+yb1iNdfeurWopAdD0BtrMKiNIFNcMq/4elObaJUureRd4hsSnPYnVeG25bgGNZ7ZSswepjBEN
	CXahdpyI1A8WuI5zWaV8ayZtPeI5HVS9zHqWu6P9R6AF7DXSeoTRFgOaIlq8nnnMeZPEpGtbuWm
	f8m8QPbxMyBbdaxAsHDZ3Aq2xWyLMK/ji/KtqavSYhWTmh3GuuBH6XBDHz4kJepW9gAZQQprQJP
	o7vWjQa3XtEsYv81DKjowhlYf9+iDYKTUKYx2VgUgUCwg00m0VdaBjAK/C22BI4Ce4mdBkKHKM9
	SfNqmmWb249bfC2OcBB1/n++uKLewfTWboCTbXGm9BUNRXoQBgOBccNyFzt/TSaR7ux8fqq7AWm
	Koi19SLyX/uaB1IY1hMwsuUypMPsD+qk7mKZXDTF03fBM0H+Z5zQdpDVM1FrB4giGYvrt401u6d
	UMvu
X-Received: by 2002:a17:903:2383:b0:2ce:9c48:22d3 with SMTP id d9443c01a7336-2d34569b01amr47085155ad.11.1786529690806;
        Wed, 12 Aug 2026 03:14:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219d91dsm4159645ad.51.2026.08.12.03.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:14:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Frank Li <Frank.Li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: mxs-saif: Use dev_err_probe() for error handling
Date: Wed, 12 Aug 2026 17:14:16 +0700
Message-ID: <20260812101418.37966-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812101418.37966-1-phucduc.bui@gmail.com>
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mxs/mxs-saif.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index a01a680ad4d7..b877c978a04c 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -826,12 +826,9 @@ static int mxs_saif_probe(struct platform_device *pdev)
 	mxs_saif[saif->id] = saif;
 
 	saif->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(saif->clk)) {
-		ret = PTR_ERR(saif->clk);
-		dev_err(&pdev->dev, "Cannot get the clock: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(saif->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(saif->clk),
+				     "Cannot get the clock\n");
 
 	saif->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(saif->base))
-- 
2.43.0

