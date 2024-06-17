Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90591BBBCC
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632198; cv=none; b=kUN2NasGs+Oh/K+2N1NlzAyJwVG3Rp7ObRN9rn1lUOFcVE9L4ny1Gj6h3QNRTA2fNNaGhLiEWqq3YMgjbXpls5JQgsSqUFzbzFYa8FP02z32sqwJMJHtWnMoaF0PkWRDT4o/p8JtwaDes0LhCuOC3YywWOXPkycl38QziyP9FZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632198; c=relaxed/simple;
	bh=tZD2LK0TsNQLeO1PQXlfQAFGl//p991fLtVre5bjIaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B6WT0DhKYwOsasoU3wwz6kIqF8iV4djIJA+kl38iVD8xBaGm4wb3eiKPtXFFCtCcALlKL8zdGT5xdEQwtzQsMiKJEjgew3WboMKMo/Anj9SUujam1Q2WzQ9168I2GrHao/hWe7kuYZQfKJF3ehEKggaa4GEZKFLYZjFO0HGsOnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ppwVP6GD; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ppwVP6GD"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7955841fddaso361866585a.1
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632196; x=1719236996; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sTXUSoBs+YlsgH71N9X/wOixyDVYk1BR8pUCCabPaI=;
        b=ppwVP6GD64EIaRKp7pf0XC1CrgRYKlT8DaBfAR3k/pUrH3j7NafWjk+RRhehdH7/+/
         x1aIGEqWxvh+I2txOuwe3oZ19bjkYuTFGD4pkN7pvtQaJAuvXSA8DQtBl0/yItoFbflw
         fPi0J5BhdP170Ct5xvjTn9ITW0zYIs9Fu1Duvr12wvU5C7WCBBSua/5ySu2wRjyuK0JO
         OHE7IhGWlnqWAHj7lwwO2OR2FJPcGIpfxyvQSEwcxIAcYXIg2agu+VuvqtjNZj5yjwVX
         17Cho3I8K3sbBSbw8Cpb12eWEL0vwMiEgcOhYyooflphsAPxzHZMBySwtf4f1EtdNbwH
         +8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632196; x=1719236996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sTXUSoBs+YlsgH71N9X/wOixyDVYk1BR8pUCCabPaI=;
        b=CkLH7nko7lmvhIItFHGlWAEHwqCwxVWQcufGITWZqRKOgxMcsjjdvdiVn3fVQgCW1G
         pI5bHEKUeqnrgKyLytHVI5WT+ugRW3PlN01r1cZsVqpM+KjLH8sBQsWpzYyboJ80xMHz
         JMjiQvoTB4JDpwIcDMtM0ND4Nq+oh6hcVCZWPxbnIV7fe76sVNMVvjHGXJqJIcsJEbJB
         ewsUOKPe9CCAIZUX3Cvh7Qv3wn9cvmP1ZuWFYakT6Yh/HzRN24G1Dm6aV3ibyU96NLK9
         af5m46mUYzaj98TEQ9RsUMuWNozYYmhTvHIKsDyhM21UwKIlBphu71qIZ7wMRUIYMxhx
         CAVg==
X-Forwarded-Encrypted: i=1; AJvYcCXcy+Gn7o8C/DiXdhnIzhFvWpWV8CvkfIeu0PGowvQ8YbkVLwDW2HMpN/UceYPUYj3L3S6AlFOGtNe3tuaX9JLGzo05
X-Gm-Message-State: AOJu0Yyl7+KLCmnGy7SZh7vwRpJdHVK/55hycLIj2GWT0C2hNuzRQ32z
	1j/7rav8wFRKs8V1fU82Rm0v+TWvBabjh1jLR5iVv7eW88bHa2vUlWJRt/saJRU=
X-Google-Smtp-Source: AGHT+IGjHbBOrTl20NthbniN5xVzM8rCge08JoanAoI0amw+zX4G0dqtT7iYT1wcjjqa5iiFtvInEw==
X-Received: by 2002:a05:620a:44c4:b0:795:5b00:edcb with SMTP id af79cd13be357-798d0243396mr1793084785a.21.1718632195400;
        Mon, 17 Jun 2024 06:49:55 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:55 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:45 -0400
Subject: [PATCH v3 05/41] iio: adc: axp20x_adc: make use of
 regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-5-88d1338c4cca@baylibre.com>
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
 drivers/iio/adc/axp20x_adc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/axp20x_adc.c b/drivers/iio/adc/axp20x_adc.c
index d6c51b0f48e3..00c1a01cac63 100644
--- a/drivers/iio/adc/axp20x_adc.c
+++ b/drivers/iio/adc/axp20x_adc.c
@@ -712,9 +712,8 @@ static int axp20x_probe(struct platform_device *pdev)
 	regmap_write(info->regmap, AXP20X_ADC_EN1, info->data->adc_en1_mask);
 
 	if (info->data->adc_en2_mask)
-		regmap_update_bits(info->regmap, AXP20X_ADC_EN2,
-				   info->data->adc_en2_mask,
-				   info->data->adc_en2_mask);
+		regmap_set_bits(info->regmap, AXP20X_ADC_EN2,
+				info->data->adc_en2_mask);
 
 	/* Configure ADCs rate */
 	info->data->adc_rate(info, 100);

-- 
2.45.2

