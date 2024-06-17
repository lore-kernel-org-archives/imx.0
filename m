Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850BB1C68AB
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632226; cv=none; b=kMYxvGmZVBpjYQY/3vB74ka3Z6AIG2EgmrvlKjQZVDEQKBOJBNNUQsrBLuW3HUFN9o9r/uMUXr4leSjN1PMN4woOxVpU2ao1EC/WmH5ovZopXfOPbWgzowAdN+P4AxcaIK+sKRYxMHPErG5Mq2+JWcojcsxGPjWYrkyPQtSQLqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632226; c=relaxed/simple;
	bh=6WpzNw/7O6Bgfvz8lndloRTTgJyhcPEVJA0wYoY3R1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r4KPmOh/v+0gTfdLogdgN6mHq7+c4kDrWk4JYnM1Lfd73lNfP8wf0ncGuISkkrtGbJi3DixICkVlHC6mWvDafVAav8yWqedPJvDW1P8zd1aPCAGuwH5nC0LCtC0UTP6p8EF03dAt+z6Oyl2oXo1einHB9gwhold2/LTWNMOd4O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CogdSTqX; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CogdSTqX"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7979198531fso327514485a.0
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632223; x=1719237023; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l19FGmHt7cx9Y1e6lJcD6lg62Kq+f+HHsekNkW7FIwQ=;
        b=CogdSTqXkwYOlOyjXNX/q+UZn7xZC3HSIgso9vz75vwJYkyewwDbC3l3MoZ+TiUAxQ
         jpr4BHfPwdWpaJTW2gfUSqSmMgh1pwSGci75DCXzMRPYTpJx9F5gUhZklU8tRaJFVCuS
         Wrntua1vHKGOhauK58v2JXbo7CqTOk1nHbZBR2BgC76RoywmHgOtPghoT0XYnm/mpxsm
         C5oZWxcCwbxEEuFiXPo+ec3NypLAg87yF6QQTXFxN13KHeldya3Y0VqBhg6V5h9W8hLU
         Gb/vvwEVSlILfe3dDW72hGceqF8lUmcotKpfnq7invMz23/7G/ffY/aTihINhTaTfePS
         PmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632223; x=1719237023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l19FGmHt7cx9Y1e6lJcD6lg62Kq+f+HHsekNkW7FIwQ=;
        b=AD99/SdvEppaaEx2NMTLQ06RGQG9AwGiMEDXyT3C11ic3fLnVX6tqcX56ePBuQfEwe
         SPM9/3n+Pfe00eNNLsb/Z9gyTpxkvHZWRO0ZGUGoRDzv4m1Npxud+KlfKi9hD/HDAQqa
         MnY2snWIZO7wky3OrbQq3Yw4wnUlFAwDK6JHd5iVi0qxNVLaRrXfU2Ax04apGsu2rUll
         YFv/KwRGWx8oeMB0FJnwT6NKaGC32a5mcLl1mLaHiKkK25z72ZaQMmQ5WLipbE+EohdN
         jSLkYZ3lMt38VqbCkiyhy9us5nC3t6MvEXO764XrPjD8wrwC9UNqnomc9wlP9f0bkpOs
         WpNA==
X-Forwarded-Encrypted: i=1; AJvYcCX1Ojf1ycSyqojOegPfIeqY9/pxpFWK2l/KqYT1QWnwBGSKjQNpH5ThjrbY0zimAvm9E2pN4HfW7DFGaYDBvg+nznHE
X-Gm-Message-State: AOJu0YynkroFKmfY9vdFnuBOluuWp+/evD58Z7Dsp/0a9lu/NCIZ2ssA
	/+ztLKwcLKbg8Lq0UXH3viVTsCYhCvC6aJI5Dd9JgcYJJ+h85dukkpqgGQzfn0U=
X-Google-Smtp-Source: AGHT+IEh7KDprGK33BeeaVNTDiPQqvpWOrx7hEFjzf44w52REiEzqTJNM1IGPx8qlAanIRK9VBBUsQ==
X-Received: by 2002:a05:620a:4101:b0:795:dca5:e9b7 with SMTP id af79cd13be357-798d26b4948mr1182835585a.69.1718632223483;
        Mon, 17 Jun 2024 06:50:23 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:23 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:58 -0400
Subject: [PATCH v3 18/41] iio: adc: stm32-dfsdm-adc: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-18-88d1338c4cca@baylibre.com>
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
 drivers/iio/adc/stm32-dfsdm-adc.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index 9a47d2c87f05..fabd654245f5 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -759,8 +759,7 @@ static int stm32_dfsdm_start_conv(struct iio_dev *indio_dev,
 	return 0;
 
 filter_unconfigure:
-	regmap_update_bits(regmap, DFSDM_CR1(adc->fl_id),
-			   DFSDM_CR1_CFG_MASK, 0);
+	regmap_clear_bits(regmap, DFSDM_CR1(adc->fl_id), DFSDM_CR1_CFG_MASK);
 stop_channels:
 	stm32_dfsdm_stop_channel(indio_dev);
 
@@ -774,8 +773,7 @@ static void stm32_dfsdm_stop_conv(struct iio_dev *indio_dev)
 
 	stm32_dfsdm_stop_filter(adc->dfsdm, adc->fl_id);
 
-	regmap_update_bits(regmap, DFSDM_CR1(adc->fl_id),
-			   DFSDM_CR1_CFG_MASK, 0);
+	regmap_clear_bits(regmap, DFSDM_CR1(adc->fl_id), DFSDM_CR1_CFG_MASK);
 
 	stm32_dfsdm_stop_channel(indio_dev);
 }
@@ -951,16 +949,14 @@ static int stm32_dfsdm_adc_dma_start(struct iio_dev *indio_dev)
 
 	if (adc->nconv == 1 && !indio_dev->trig) {
 		/* Enable regular DMA transfer*/
-		ret = regmap_update_bits(adc->dfsdm->regmap,
-					 DFSDM_CR1(adc->fl_id),
-					 DFSDM_CR1_RDMAEN_MASK,
-					 DFSDM_CR1_RDMAEN_MASK);
+		ret = regmap_set_bits(adc->dfsdm->regmap,
+				      DFSDM_CR1(adc->fl_id),
+				      DFSDM_CR1_RDMAEN_MASK);
 	} else {
 		/* Enable injected DMA transfer*/
-		ret = regmap_update_bits(adc->dfsdm->regmap,
-					 DFSDM_CR1(adc->fl_id),
-					 DFSDM_CR1_JDMAEN_MASK,
-					 DFSDM_CR1_JDMAEN_MASK);
+		ret = regmap_set_bits(adc->dfsdm->regmap,
+				      DFSDM_CR1(adc->fl_id),
+				      DFSDM_CR1_JDMAEN_MASK);
 	}
 
 	if (ret < 0)
@@ -981,8 +977,8 @@ static void stm32_dfsdm_adc_dma_stop(struct iio_dev *indio_dev)
 	if (!adc->dma_chan)
 		return;
 
-	regmap_update_bits(adc->dfsdm->regmap, DFSDM_CR1(adc->fl_id),
-			   DFSDM_CR1_RDMAEN_MASK | DFSDM_CR1_JDMAEN_MASK, 0);
+	regmap_clear_bits(adc->dfsdm->regmap, DFSDM_CR1(adc->fl_id),
+			  DFSDM_CR1_RDMAEN_MASK | DFSDM_CR1_JDMAEN_MASK);
 	dmaengine_terminate_all(adc->dma_chan);
 }
 
@@ -1305,9 +1301,8 @@ static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
 	if (status & DFSDM_ISR_ROVRF_MASK) {
 		if (int_en & DFSDM_CR2_ROVRIE_MASK)
 			dev_warn(&indio_dev->dev, "Overrun detected\n");
-		regmap_update_bits(regmap, DFSDM_ICR(adc->fl_id),
-				   DFSDM_ICR_CLRROVRF_MASK,
-				   DFSDM_ICR_CLRROVRF_MASK);
+		regmap_set_bits(regmap, DFSDM_ICR(adc->fl_id),
+				DFSDM_ICR_CLRROVRF_MASK);
 	}
 
 	return IRQ_HANDLED;

-- 
2.45.2

