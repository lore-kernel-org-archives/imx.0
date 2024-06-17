Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3E71C6884
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632224; cv=none; b=mC1eHyFdnU/kfsp20nzavJuAS/qENfdjw/YyUqlI0QecAlCz16ZxQHqcCBS2tgZSjIoeeZvCjzu4fdrXZ6v/VTG/4Ed5K+dq0EGu2M45YluVPQp4P4sAys28fs3JLD1ZKsuNRvNQtiikE8Zzfw5tf2eAddTkOdV2QB1R/XKF6vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632224; c=relaxed/simple;
	bh=iX/O4thw4u8jxmjQXCGvy7+RStVKhiFFxFMRaqR3WK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXYSMcwNBQv6iUqGP22r7M4kopHYYs7Ah18IuDIVAuuhBj3hXqlNCJ7VunR1hX8VSXMOlTOccgLIwHXx+2yLsnBzYpsEiEM0NbSBKCFngVuqpco6lqOqknh6WFJIZe6iFBas9nYhJq0nqcjTILBOZ+YKzIa4REp+AF3SBsv9DEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tMQZTnJ2; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tMQZTnJ2"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2508320e62dso2268660fac.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632221; x=1719237021; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pghOqqoUrgqxulm8czqYmTg2ejQ+jCMFTS9OcdLe8gI=;
        b=tMQZTnJ2rl0ZQ2oKFYLFb1zwB8GHuLxIbJ7/ZChOOiOusN3XVlF1Vu0DvqwrdCjbFN
         LovrB4Lw8ie+t3eyzLUYncv0zEVTRG+sb9pB+m99BJKumhmB1EyRl9zPB9eAE1l+9jnL
         4Jqj6CwcDwM36nXDo9NYRvyo0V6QTkN4v0GbkEniD95Dv5hDUSuaUzUrZ0rL61Y7VTC5
         iucM1oazSGP1DOAiATtOnd7BaoCaDnTD+o6jiIpvj7PYRs6AxSHB9jDPrYZwgN8O1ERY
         WAK2jLPEovadnafXSbwdLN6uuIz724pDtWnp7HxhaXbJy+Cop1GmpFvLFaTRincemaqB
         i93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632221; x=1719237021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pghOqqoUrgqxulm8czqYmTg2ejQ+jCMFTS9OcdLe8gI=;
        b=oMRTTYtk1DPSBOfLmkvUJxoVwEb4n/dNUTgKlVemgZCD34WZyyTNRU0omDyGjG4ZKa
         GSCLmAjN5NPycNW6PKv2U2FvFH9dns/AdjMgswqg3yK7TgO5uf3cbhHIsq3odTCNHxL9
         dPp//1Mth9JNIfG4WmeNQ44XzXr/EkGG5HMe8DQFUNFPxDVrv+sMPSsPe4JixixuSQ4Y
         PkzRi9iyVksDQfxJuMF63aOwdWa/J+tNCYwIG3Dm74Sojfih2B+KmjQ96cU3KFGUm7Wq
         6vT/lTIai9JNWkX/FbKv+oNbSMxU4wTF1Wn8SGkwDO/Co1wavvwq/BPv5M8U/1ZVhdKp
         v2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCX/TnFyeS2ITMWPQKItfq7Sdm8WrcRabjceHTSE+4UJ/vSjeB3jYuWUluWXVUJv113CgJc2xtYGJINmK2eZm57HWrV7
X-Gm-Message-State: AOJu0Yw87bp3OTIHMLf3JSf9fnU1RbCtvc0rEwSJRSFe/Y7wbD/aVEx0
	Wuy3prNNUVuDluU77Ig69sKgnkgJ85NaHbBq3stBt21ggkdDHAxnsMo7tOFGO6I=
X-Google-Smtp-Source: AGHT+IHPRFjhQJMl5A95ZWgXFtrQQKsMmXYW6RVDp9V1gMjS9xuHYY98wxPGrZXsyYueeiP6Xe3wcg==
X-Received: by 2002:a05:6871:5c9:b0:254:94a4:35d2 with SMTP id 586e51a60fabf-25842b7af81mr10339918fac.45.1718632221358;
        Mon, 17 Jun 2024 06:50:21 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:21 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:57 -0400
Subject: [PATCH v3 17/41] iio: adc: sc27xx_adc: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-17-88d1338c4cca@baylibre.com>
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
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 drivers/iio/adc/sc27xx_adc.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/sc27xx_adc.c b/drivers/iio/adc/sc27xx_adc.c
index b4a2e057d80f..2535c2c3e60b 100644
--- a/drivers/iio/adc/sc27xx_adc.c
+++ b/drivers/iio/adc/sc27xx_adc.c
@@ -508,13 +508,13 @@ static int sc27xx_adc_read(struct sc27xx_adc_data *data, int channel,
 		}
 	}
 
-	ret = regmap_update_bits(data->regmap, data->base + SC27XX_ADC_CTL,
-				 SC27XX_ADC_EN, SC27XX_ADC_EN);
+	ret = regmap_set_bits(data->regmap, data->base + SC27XX_ADC_CTL,
+			      SC27XX_ADC_EN);
 	if (ret)
 		goto regulator_restore;
 
-	ret = regmap_update_bits(data->regmap, data->base + SC27XX_ADC_INT_CLR,
-				 SC27XX_ADC_IRQ_CLR, SC27XX_ADC_IRQ_CLR);
+	ret = regmap_set_bits(data->regmap, data->base + SC27XX_ADC_INT_CLR,
+			      SC27XX_ADC_IRQ_CLR);
 	if (ret)
 		goto disable_adc;
 
@@ -537,8 +537,8 @@ static int sc27xx_adc_read(struct sc27xx_adc_data *data, int channel,
 	if (ret)
 		goto disable_adc;
 
-	ret = regmap_update_bits(data->regmap, data->base + SC27XX_ADC_CTL,
-				 SC27XX_ADC_CHN_RUN, SC27XX_ADC_CHN_RUN);
+	ret = regmap_set_bits(data->regmap, data->base + SC27XX_ADC_CTL,
+			      SC27XX_ADC_CHN_RUN);
 	if (ret)
 		goto disable_adc;
 
@@ -559,8 +559,8 @@ static int sc27xx_adc_read(struct sc27xx_adc_data *data, int channel,
 	value &= SC27XX_ADC_DATA_MASK;
 
 disable_adc:
-	regmap_update_bits(data->regmap, data->base + SC27XX_ADC_CTL,
-			   SC27XX_ADC_EN, 0);
+	regmap_clear_bits(data->regmap, data->base + SC27XX_ADC_CTL,
+			  SC27XX_ADC_EN);
 regulator_restore:
 	if ((data->var_data->set_volref) && (channel == 30 || channel == 31)) {
 		ret_volref = regulator_set_voltage(data->volref,
@@ -765,15 +765,14 @@ static int sc27xx_adc_enable(struct sc27xx_adc_data *data)
 {
 	int ret;
 
-	ret = regmap_update_bits(data->regmap, data->var_data->module_en,
-				 SC27XX_MODULE_ADC_EN, SC27XX_MODULE_ADC_EN);
+	ret = regmap_set_bits(data->regmap, data->var_data->module_en,
+			      SC27XX_MODULE_ADC_EN);
 	if (ret)
 		return ret;
 
 	/* Enable ADC work clock and controller clock */
-	ret = regmap_update_bits(data->regmap, data->var_data->clk_en,
-				 SC27XX_CLK_ADC_EN | SC27XX_CLK_ADC_CLK_EN,
-				 SC27XX_CLK_ADC_EN | SC27XX_CLK_ADC_CLK_EN);
+	ret = regmap_set_bits(data->regmap, data->var_data->clk_en,
+			      SC27XX_CLK_ADC_EN | SC27XX_CLK_ADC_CLK_EN);
 	if (ret)
 		goto disable_adc;
 
@@ -789,11 +788,11 @@ static int sc27xx_adc_enable(struct sc27xx_adc_data *data)
 	return 0;
 
 disable_clk:
-	regmap_update_bits(data->regmap, data->var_data->clk_en,
-			   SC27XX_CLK_ADC_EN | SC27XX_CLK_ADC_CLK_EN, 0);
+	regmap_clear_bits(data->regmap, data->var_data->clk_en,
+			  SC27XX_CLK_ADC_EN | SC27XX_CLK_ADC_CLK_EN);
 disable_adc:
-	regmap_update_bits(data->regmap, data->var_data->module_en,
-			   SC27XX_MODULE_ADC_EN, 0);
+	regmap_clear_bits(data->regmap, data->var_data->module_en,
+			  SC27XX_MODULE_ADC_EN);
 
 	return ret;
 }
@@ -803,11 +802,11 @@ static void sc27xx_adc_disable(void *_data)
 	struct sc27xx_adc_data *data = _data;
 
 	/* Disable ADC work clock and controller clock */
-	regmap_update_bits(data->regmap, data->var_data->clk_en,
-			   SC27XX_CLK_ADC_EN | SC27XX_CLK_ADC_CLK_EN, 0);
+	regmap_clear_bits(data->regmap, data->var_data->clk_en,
+			  SC27XX_CLK_ADC_EN | SC27XX_CLK_ADC_CLK_EN);
 
-	regmap_update_bits(data->regmap, data->var_data->module_en,
-			   SC27XX_MODULE_ADC_EN, 0);
+	regmap_clear_bits(data->regmap, data->var_data->module_en,
+			  SC27XX_MODULE_ADC_EN);
 }
 
 static const struct sc27xx_adc_variant_data sc2731_data = {

-- 
2.45.2

