Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55DE1C0DD2
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632217; cv=none; b=bAt09glAj1URij4q0/2/W0Q3m5hzE/qT2OKLJFUTP4Sz2nQbuXfGA3KCY/CeWj2yJmp1bqzOvMuSqxHcaXHnWqVaHrBuHO0fUXrdUUInnxvB+PD+XcrOjaDfpwAS7V1NJm6iH42Sl0kDSW5mwQI/ZOksWhIOOkvgRm/CXIJ2zbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632217; c=relaxed/simple;
	bh=fzPzUYcNz9V2ID3qrrApafMZGiDVZpy6ghrI0nU92Lw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gr5cjXQb0zjDHvzXd6uoZmJlibASta4KP2mPT4e4mflBtjBEjr5YtcbInF54Gn9flAYLA6czG7jc7e8vhQ00r7ZgHlH7cgQZPgdn8ZWWN5A49iy57nCGN3txIEMxwUKb88qGAQb+odrxnO1Je83oZ0qDmDWvUGG+aS/TXRBfEOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FR5emlIV; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FR5emlIV"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-795569eedcaso228709585a.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632215; x=1719237015; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GyaMuqBhP7o7wmqZwNnsnkbTtRp5AugJ4lcsefsATFM=;
        b=FR5emlIVR5/gTeE96016BCtEuqObXY1YISSBXYIiEsCGdXJl9CPm0oEXZbHmNCjHxI
         YMWkyHCNR15SeHuZwus/vd88ws8Vu727rdHaAUilEADfKe/yGTXUCRI9+RwaACo1+zgJ
         XLMwxG1Ep4gDY3JA4FwM5elVcOJ8ifntqIk+hYAWuAGWzOj5g9xSkPae8IID00E96I0n
         S30waO2zjyJeg/b+Ctu4cPdF2fQU0XIUaBWLzDDJNyew0vdqjBBkAXHIAc5b2z3+5eed
         847YscUjzC2FS8YkS5C0JIE6LO0XgaxDwY322oNzaLWzkQ4P++1edbG8DoBYiBkiLtqb
         7cBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632215; x=1719237015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyaMuqBhP7o7wmqZwNnsnkbTtRp5AugJ4lcsefsATFM=;
        b=pG377fVxTesfmmTxJyJM77FuuerXaFmH4xsPcvrCl/g60XlQd/ye8eeQKYVhnXx1su
         9F0Uq9vY4SczNzaafqqs9BoB/3xaOuMiYdSH7ecGqu958iN18GIqz6c+B3/GfgyPYL4d
         aNmnMUac0Qq2OJwgjBlJo7GiLGFBxWDI0A4t97E/Vebl5XbnIBonRI5a/G3Wghe9J0Kx
         wXHqr/sfoZphyesLYQ+cJeqzYe7UZeodEcJZ7JFcT+XXIRe+Sm25E4+bchkCg8cXR1nK
         C+5/wVqiONT88yt20jLwCJZIGnsnVg/1N8VNppHSGwW4Qs+y6NV7agZAkE7IwDE2Zm7q
         NIXg==
X-Forwarded-Encrypted: i=1; AJvYcCWHCd04Mz+bna2t6rZfm1y4Y2sNfCftPzsiScJVf7sbPlAfQ9glh2OKCp4Y6KjbEm1ZRMws384M8ismQSyLSC/tVRxi
X-Gm-Message-State: AOJu0YxSfhxipmTGhpM2pfL4vfB+2yZH4ZlBQi4qOWsaMWNUl01B5+J5
	XW6UXmwnLd22o/mRrnuDZedoqeYJBvzz8CmeJNV7ZzJBqLJ8KmCdcm08NBolsZk=
X-Google-Smtp-Source: AGHT+IG9rvLxXHys5yM3fiDf+G14AWJNmGoLIu5wSpeGGOXNzHBF3wjPuE24N3ncETdlUUNQNA6oSA==
X-Received: by 2002:a05:620a:45aa:b0:795:4e64:dbbe with SMTP id af79cd13be357-798d1f824a7mr1191474185a.0.1718632214915;
        Mon, 17 Jun 2024 06:50:14 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:14 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:54 -0400
Subject: [PATCH v3 14/41] iio: adc: mp2629_adc: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-14-88d1338c4cca@baylibre.com>
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

Instead of using regmap_update_bits() and passing val = 0, use
regmap_clear_bits().

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 drivers/iio/adc/mp2629_adc.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/mp2629_adc.c b/drivers/iio/adc/mp2629_adc.c
index 7c66c2cd5be2..5f672765d4a2 100644
--- a/drivers/iio/adc/mp2629_adc.c
+++ b/drivers/iio/adc/mp2629_adc.c
@@ -131,9 +131,8 @@ static int mp2629_adc_probe(struct platform_device *pdev)
 	info->dev = dev;
 	platform_set_drvdata(pdev, indio_dev);
 
-	ret = regmap_update_bits(info->regmap, MP2629_REG_ADC_CTRL,
-				MP2629_ADC_START | MP2629_ADC_CONTINUOUS,
-				MP2629_ADC_START | MP2629_ADC_CONTINUOUS);
+	ret = regmap_set_bits(info->regmap, MP2629_REG_ADC_CTRL,
+			      MP2629_ADC_START | MP2629_ADC_CONTINUOUS);
 	if (ret) {
 		dev_err(dev, "adc enable fail: %d\n", ret);
 		return ret;
@@ -163,10 +162,9 @@ static int mp2629_adc_probe(struct platform_device *pdev)
 	iio_map_array_unregister(indio_dev);
 
 fail_disable:
-	regmap_update_bits(info->regmap, MP2629_REG_ADC_CTRL,
-					 MP2629_ADC_CONTINUOUS, 0);
-	regmap_update_bits(info->regmap, MP2629_REG_ADC_CTRL,
-					 MP2629_ADC_START, 0);
+	regmap_clear_bits(info->regmap, MP2629_REG_ADC_CTRL,
+			  MP2629_ADC_CONTINUOUS);
+	regmap_clear_bits(info->regmap, MP2629_REG_ADC_CTRL, MP2629_ADC_START);
 
 	return ret;
 }
@@ -180,10 +178,9 @@ static void mp2629_adc_remove(struct platform_device *pdev)
 
 	iio_map_array_unregister(indio_dev);
 
-	regmap_update_bits(info->regmap, MP2629_REG_ADC_CTRL,
-					 MP2629_ADC_CONTINUOUS, 0);
-	regmap_update_bits(info->regmap, MP2629_REG_ADC_CTRL,
-					 MP2629_ADC_START, 0);
+	regmap_clear_bits(info->regmap, MP2629_REG_ADC_CTRL,
+			  MP2629_ADC_CONTINUOUS);
+	regmap_clear_bits(info->regmap, MP2629_REG_ADC_CTRL, MP2629_ADC_START);
 }
 
 static const struct of_device_id mp2629_adc_of_match[] = {

-- 
2.45.2

