Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D756C1BC091
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632204; cv=none; b=eL8BX+8Gmb2P+CVnhhriL3JheBAN33Lx2xJS4sZk0oetSViTsbntvz+TzE9C6emYa2q8t5OBrWM5Wvn1Ph8634lhebm33cOl/oWEOjVw9q6raHDqYH1heq4J1RH8zuRJGxdmBKhFUXOA8BItAAXUf2pePW0Kdr53EGMI1SQcHnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632204; c=relaxed/simple;
	bh=ut+W8QUP8tQabPWzbyke7d8OEC6HNxiYzZgFQhQRoBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/EDuSVc8n79kR2lmBwaKEn+Ns5S7TwB+TtSyMNNM16UvOuyn3yZRb0atM80DEoHq2hi/L1XrxvdYx+DVyfZGLHPlpqLl7zr8lb0zguzI/qzWRLFPAKKYH9BUiZYeNClNF9o5SLRwroaB4AtL4P8LXrcV3vnVTPfFg8TYgXC12E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=A0e1Dt7M; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="A0e1Dt7M"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-797dcb558ebso286407085a.2
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632202; x=1719237002; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/J+uii6o7EZaRWTf6fwT0Zq6b6sr2oRr59Sqisc7RFA=;
        b=A0e1Dt7MLvlc/bGOcBqTNQqY3UGuqa9z2cD+f/cWkEAK2uBpuVsifs3biV3rPiCyGQ
         zQEz4SY2nBN4cinTynaI18huo1bkzvJAe21ZuSIyCCEsKBCp3P6jULMLG1g6po/+L6RE
         S8GUlir5TexIxnG0Neu6ZzwcTvmN0yUdylayF9/myliDJ1K6Rl6v2DCvDgbwdBU9Ik6O
         tjYUXLnjupKMg9aqhayQeKFrneu6gEoGRj7bn7cDYcgSBdOqYqGnJy+9PYFc5k7r4LyN
         H0ZrHpQJrYEng0vy5nghc2lHo0zS+8a5McN8skzhDDhbpHqSFROG5fUPbbtg9y3C1FOr
         pS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632202; x=1719237002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/J+uii6o7EZaRWTf6fwT0Zq6b6sr2oRr59Sqisc7RFA=;
        b=bFH5zQip+Jc5r/zaYDxQAkbkcR2b6qMVoo0En62h70LCsUXm63w9VW2D3EYgrJpQvT
         sri1kaWzAg9MlKtt5d6ZNDeO+D+hlVv3hsR+Y5ugzDbRzE+exgHT9K5G0lYNK8+tNwDe
         /VES9KOm22FV30tCcGl4iJaRvCkGlFmZ4bREga2MJeS/feHybDoYK+RGPNGLQWQfiNq1
         +RIf0Vffd1dmiqTq4tiNzV2zVuJlUSWXeZ3l63MLIqW3Aa0fYFGU4Wz+AmLgt7VBvcxH
         EGSqw2mqI30BNOO58ACOtMpqVu34+tSMXpgvIkCwEh5vfr+pbdaTXGvej/K+OiKZEWll
         +Bng==
X-Forwarded-Encrypted: i=1; AJvYcCUZbUU+bYaaQUXGk1FFpk9crKGp4+GKsAcDSFlh4mwOGowKxZexk8irD+XKZmFwR/jGpaEEj6ntmxyivECP0wENuEuw
X-Gm-Message-State: AOJu0YxhOkKnHhOFZiNZg/bwzR06MEMvjC5wtun82AXz4UFkTjYBmpB2
	IUdXvBkc1Rr2utR+t7r/7AtgwPGmnD4fHkW+9OvP4++xi9C9knYfDvgulG3Jb6w=
X-Google-Smtp-Source: AGHT+IHQO7lDiG1TVDzbCtPAbJI8uHKSdU2/yIiDIlagRddBfJsOkXoStyLOw9TY/mBvF1osZeRq9Q==
X-Received: by 2002:a05:620a:2955:b0:792:c34d:482 with SMTP id af79cd13be357-798d2413b26mr1228938285a.25.1718632201881;
        Mon, 17 Jun 2024 06:50:01 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:48 -0400
Subject: [PATCH v3 08/41] iio: adc: berlin2-adc: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-8-88d1338c4cca@baylibre.com>
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
 drivers/iio/adc/berlin2-adc.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/berlin2-adc.c b/drivers/iio/adc/berlin2-adc.c
index a4e7c7eff5ac..4cdddc6e36e9 100644
--- a/drivers/iio/adc/berlin2-adc.c
+++ b/drivers/iio/adc/berlin2-adc.c
@@ -129,8 +129,8 @@ static int berlin2_adc_read(struct iio_dev *indio_dev, int channel)
 					       msecs_to_jiffies(1000));
 
 	/* Disable the interrupts */
-	regmap_update_bits(priv->regmap, BERLIN2_SM_ADC_STATUS,
-			   BERLIN2_SM_ADC_STATUS_INT_EN(channel), 0);
+	regmap_clear_bits(priv->regmap, BERLIN2_SM_ADC_STATUS,
+			  BERLIN2_SM_ADC_STATUS_INT_EN(channel));
 
 	if (ret == 0)
 		ret = -ETIMEDOUT;
@@ -139,8 +139,8 @@ static int berlin2_adc_read(struct iio_dev *indio_dev, int channel)
 		return ret;
 	}
 
-	regmap_update_bits(priv->regmap, BERLIN2_SM_CTRL,
-			   BERLIN2_SM_CTRL_ADC_START, 0);
+	regmap_clear_bits(priv->regmap, BERLIN2_SM_CTRL,
+			  BERLIN2_SM_CTRL_ADC_START);
 
 	data = priv->data;
 	priv->data_available = false;
@@ -180,8 +180,8 @@ static int berlin2_adc_tsen_read(struct iio_dev *indio_dev)
 					       msecs_to_jiffies(1000));
 
 	/* Disable interrupts */
-	regmap_update_bits(priv->regmap, BERLIN2_SM_TSEN_STATUS,
-			   BERLIN2_SM_TSEN_STATUS_INT_EN, 0);
+	regmap_clear_bits(priv->regmap, BERLIN2_SM_TSEN_STATUS,
+			  BERLIN2_SM_TSEN_STATUS_INT_EN);
 
 	if (ret == 0)
 		ret = -ETIMEDOUT;
@@ -190,8 +190,8 @@ static int berlin2_adc_tsen_read(struct iio_dev *indio_dev)
 		return ret;
 	}
 
-	regmap_update_bits(priv->regmap, BERLIN2_SM_TSEN_CTRL,
-			   BERLIN2_SM_TSEN_CTRL_START, 0);
+	regmap_clear_bits(priv->regmap, BERLIN2_SM_TSEN_CTRL,
+			  BERLIN2_SM_TSEN_CTRL_START);
 
 	data = priv->data;
 	priv->data_available = false;
@@ -284,8 +284,7 @@ static const struct iio_info berlin2_adc_info = {
 
 static void berlin2_adc_powerdown(void *regmap)
 {
-	regmap_update_bits(regmap, BERLIN2_SM_CTRL,
-			   BERLIN2_SM_CTRL_ADC_POWER, 0);
+	regmap_clear_bits(regmap, BERLIN2_SM_CTRL, BERLIN2_SM_CTRL_ADC_POWER);
 
 }
 
@@ -339,9 +338,8 @@ static int berlin2_adc_probe(struct platform_device *pdev)
 	indio_dev->num_channels = ARRAY_SIZE(berlin2_adc_channels);
 
 	/* Power up the ADC */
-	regmap_update_bits(priv->regmap, BERLIN2_SM_CTRL,
-			   BERLIN2_SM_CTRL_ADC_POWER,
-			   BERLIN2_SM_CTRL_ADC_POWER);
+	regmap_set_bits(priv->regmap, BERLIN2_SM_CTRL,
+			BERLIN2_SM_CTRL_ADC_POWER);
 
 	ret = devm_add_action_or_reset(&pdev->dev, berlin2_adc_powerdown,
 				       priv->regmap);

-- 
2.45.2

