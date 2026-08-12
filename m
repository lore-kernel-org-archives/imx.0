Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5734218B6
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529698; cv=none; b=HihLtoLyZBtxvTnkKm0Xu7LvFM5fo1W+3BFnGbmIZtFcaa+s4J+nEAYL+liH9NgHcLF+h758fnc9k7yq5JIq7rBGCa4faynU7UIQ5GOQJwCOJ2m01eZgqU3IxSGBUyXEhAB9FZgIXfhs7HH3bR+nmrm2w61RXDTVYyqas6rFaMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529698; c=relaxed/simple;
	bh=Ux4bCOBYVGBrqL2r/R2tCBb2b8i1x4Gdjs+9pr0KioY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjxoSnCitVCNX+1jGMCoBHDPQJafLOhgoDfc33hi46ztxkkdfNh5Th5xEjSgQ/NvrNMz77d9lxKUKbxYY82+xfjHEKsKVvPnCqWj4Ts5jRkn5+LNXY7+nC6rFYthUTBrVFeGmL8gImTwj3g7FolquknTFqOvNInhBKOo1N20Res=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zp4H07Yb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zp4H07Yb"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e88b60121so850742a91.3
        for <imx@lists.linux.dev>; Wed, 12 Aug 2026 03:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529696; x=1787134496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QjQRdpjgs+LH9OPR1KHqpvjYOEdNhIXBhMpxvHX/HHY=;
        b=Zp4H07YbBm/EhH0TsMWC76tDfb9EEf2oYxXyoP1diJWpREmKt3wOWIrLaRlibRghJN
         YTyNIC9If2lRPcirabk/90FQyAVUla1evHPpTDXkPvF0EwfxmrZbDP56pA4CBd7UooDa
         Sp8/YhqoXrKK5MemfaQfkaWhEiOWA/muVJQFdNh4JC2/6sQj0H84ttw6Jl1q33/FMhsx
         xwf8hke3ZP9A7ECwRvxKKUy2XZ/M8ivco0Y1o+w7FNyJovBcvflSeIKDNHVClFuXNnua
         zMaM7gNRrS8GmBbGdVe1JACFySHOUiFoKR2cw89GrLP8YjfjvMdj8phqkigwCh5FxrGk
         jY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529696; x=1787134496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QjQRdpjgs+LH9OPR1KHqpvjYOEdNhIXBhMpxvHX/HHY=;
        b=pkvbbmcIKXDOUF23oo7N1LzrisQMXRGGkJVhZsaktbaw68tGGwwpF6JLPkIXJGfjEA
         gDJFyd6GIc0B77cgRZkX7ExJevj/KnCTxXQD3074D7hbnNG5tejPxYNjRDr/p9dX7bmX
         tutqHHyEf5D4MXyc8y/fYZoUHFkwymtFs6LPpFHWxKX15/ybaTqqkzOloSBSSDIoxtb/
         FPDPML0xYEwlZZVtg1VistzgmnDTIpJXEuG0knoQWV6BtD4HrI3bW2Wq3ieew/8FpxrP
         RuzHMkzEcxb9kHhf0wDBodbVv9CfH3dEZL9eGmQMeh7mEcLqUd32uoUjVK5P/2urcqhq
         WcdA==
X-Forwarded-Encrypted: i=1; AHgh+Rri19IPEl3CejSNzIJffs6lfeO+CF24L0dnAWeVOvmaQ3YPm0QkxAgvpLKpy2CR1oAV2Rs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNlP/vowgPe8kvI3tHwDCfewwT3OvmHDhaZiUuwmZZ7pDsM1ef
	pOwNASMzYnk6v+RDGsRYG8v9W2dtC5LGp3QA1FJ9vf8R6x748CuYCDkq
X-Gm-Gg: AR+sD10Hl5+rYYIufDoRXKMCgKq1Vynoe96cPKN5sPdwmPG2rA24K4/59OE13E3VNCc
	dA0Xq9sgalzjLIvgdV7B1kBHxEZnlbkJHPSg8Z756pijwX3UERWL0aLrUEwoqxdt/DTqdkPyBnW
	3BpBO9ZTQTvs48lIV5AnFJmBL1433Hk3daqMeHZGXMNxmX1we1LblAqhLryuvlqYB/mm6D9gNLM
	qAdDq3G9JUULczyuo4FAhwlxVzSf8bMSxfAA7hxgqUXkiaqDxtLUKXNI994Fk7Zt/3nKwReUEC0
	SLcxgXEV6En9RSoHwir5kQ/IRd9X9Q9vYuawkWvKFZQBTzI/6l61aRxICe1fV0FErgq0/AdCO/R
	T61cTiFrKveut0C0k2rV3ZDKO9vGjn6nM/ovzlZpNQpTfY5YuLO5NA/kh3j26KLXry5YCnLEGzs
	XXtjhjQ98Q6f/FnYyPMYKBpYAOatw35b94MqhEgfgzEd/u+d7SPrT0rYuks0C+Byld4khDCNjXH
	RiLO7/PKcBKfIiK+47AOGdBfdfMglGuyZWYp+P8ZcNwKoK8moPUg9/oD+ZoBRbq02G+qMjqq2UC
	k+fQ
X-Received: by 2002:a17:90a:d610:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-393014be1eamr4231403a91.10.1786529696244;
        Wed, 12 Aug 2026 03:14:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219d91dsm4159645ad.51.2026.08.12.03.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:14:56 -0700 (PDT)
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
Subject: [PATCH 2/3] ASoC: mxs-saif: Drop redundant probe error messages
Date: Wed, 12 Aug 2026 17:14:17 +0700
Message-ID: <20260812101418.37966-3-phucduc.bui@gmail.com>
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

The functions called here don't log the error themselves, but the
error is already reported deeper in the call chain, so the dev_err()
calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mxs/mxs-saif.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index b877c978a04c..a77cd516a1bf 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -841,10 +841,8 @@ static int mxs_saif_probe(struct platform_device *pdev)
 	saif->dev = &pdev->dev;
 	ret = devm_request_irq(&pdev->dev, irq, mxs_saif_irq, 0,
 			       dev_name(&pdev->dev), saif);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to request irq\n");
+	if (ret)
 		return ret;
-	}
 
 	platform_set_drvdata(pdev, saif);
 
@@ -857,16 +855,12 @@ static int mxs_saif_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &mxs_saif_component,
 					      &mxs_saif_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "register DAI failed\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = mxs_pcm_platform_register(&pdev->dev);
-	if (ret) {
-		dev_err(&pdev->dev, "register PCM failed: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.43.0

