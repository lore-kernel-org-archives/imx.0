Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71DA1C8FD2
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632230; cv=none; b=khxbPA5ag6j1gx9jwz6LZ74g6rNfnp1I9oJITdi1jWcqnSbjo09YZC9pgTxMbWcm2zo9jIw7UotKScuUfTIV6c+ePwEwT0RMIAOAWRSmoJUQ/XOkYbFYDHgvVzVojrBH4AZgVUpdD0EI4P2t2sbpp8fl1FgaFlutk74Cxn3k6pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632230; c=relaxed/simple;
	bh=Q7aNKMVQoMCDJLMDKdU1X+EFFJ/s/U4Tzm3jjRZeQ7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BuQF4SJfgPJGatBHUPxhj3mCqPuMrvyNmspSHlbVTFk7udrBMDlFAtVyPW2ybNSCD7nmmTOX2YePUqhDvnq8cuwPPR1MBBNsB7bDouaTR/trldxmdewcENwczi3sNPDV5CRNLkJflqaMDN86TDX2pL5KnryX5yW64pEfP1upVdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gznxWJ/d; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gznxWJ/d"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-795569eede0so223565985a.2
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632228; x=1719237028; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XakTIALlxEv0HYj2MxlbOtZFxZOxjUYZWhXJH4zlh0=;
        b=gznxWJ/dPrhHJ4Gh08fjY+NkzN1Z3kLvTQAvKLXHdQoZX1eV4+H5ekmUojVOZXAElZ
         9g17foXIPrP9gwTUfZyTgvFrZXfkxqCfa+5hRV+gvERSbgl00Zj55LNKNS9F8MrbXXub
         EzvrCSnaLHuoG3zAip0h9KFkNH5SYAoZ40r3PE/CAuw1nmvLbzev1OoX8mx7R1zuuXT0
         AG0JSeeDKQ/NYuAUKuDVMpcI+jsDTeWgzzA2gsDZmDUcnLcroP6gF8idKy92v8BKE54t
         9xSySt2Lsh2mdUWfOeZHIUTGQDnZSQp8MNWGsXQqAw4BZaXLHu0Ef+lg5+g8tx746EIk
         ipTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632228; x=1719237028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XakTIALlxEv0HYj2MxlbOtZFxZOxjUYZWhXJH4zlh0=;
        b=f4jFO0spDO9J6Aij9MVXl6x+vPV2fAxKf6fx7UOz2qIWerdRH+0UjFyIwHlBeJ7aCt
         9NAhDcS57IbMSkc4S3YwqtyFJCNtsxXvllua5/uc8QTUepBbd8bqdvjdSsv9f3ohMRVG
         muj6fxAQeuOYcPyutmW09tnHDL5ax1yuUGpiL2xuTTxmC8pANJqCevD8WNvKzlLV8158
         3InUDY/fDfY3msLIN4WF5bQyftjvCOa8PZmtu1seu/GtczOgXNo1bdRRx8NingfsWJC8
         MFucQGR+e/dXRsIXWF5uGGoI8UarF/frTxNAfSe5t18R1dSj+4d8u7Y4hotxk6sjuxnm
         H4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXGueSC2r2GuP2RmzFyhUQFt6+SAw7PERdyH/iMqlxT0oUEdAaSWDNXZTanIDiiIrjN0ImybWHdsicJUA0PgASDbSet
X-Gm-Message-State: AOJu0Yxs5LKE41YO60aKKTE3Az+FoE55r3JNGcb/Z95+sDNC3SeezTVA
	G3ZAV54nMLY1Yb5xMZjtObdPf4gHIHmQHU6k2vY+MYbq2BgZzUAu5u9iXHsqDH4=
X-Google-Smtp-Source: AGHT+IG8ABD9tEwAKr1/xa6bdVCx92iQnTrVgELPE/Lymo3q9zF8m5xvFoyu+g0K7+PoHeaETQDP6g==
X-Received: by 2002:a05:620a:29d1:b0:795:967d:b1f4 with SMTP id af79cd13be357-798d26b5261mr1162014985a.70.1718632227786;
        Mon, 17 Jun 2024 06:50:27 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:00 -0400
Subject: [PATCH v3 20/41] iio: dac: stm32-dac-core: make use of
 regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-20-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
 Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.13.0

Instead of using regmap_update_bits() and passing the mask twice, use
regmap_set_bits().

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 drivers/iio/dac/stm32-dac-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/dac/stm32-dac-core.c b/drivers/iio/dac/stm32-dac-core.c
index e150ac729154..2d567073996b 100644
--- a/drivers/iio/dac/stm32-dac-core.c
+++ b/drivers/iio/dac/stm32-dac-core.c
@@ -200,9 +200,8 @@ static int stm32_dac_core_resume(struct device *dev)
 
 	if (priv->common.hfsel) {
 		/* restore hfsel (maybe lost under low power state) */
-		ret = regmap_update_bits(priv->common.regmap, STM32_DAC_CR,
-					 STM32H7_DAC_CR_HFSEL,
-					 STM32H7_DAC_CR_HFSEL);
+		ret = regmap_set_bits(priv->common.regmap, STM32_DAC_CR,
+				      STM32H7_DAC_CR_HFSEL);
 		if (ret)
 			return ret;
 	}

-- 
2.45.2

