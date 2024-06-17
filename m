Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39AB1C9ECE
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632234; cv=none; b=a0Ad3PEilDDEHQ9LrobFbO5qrdJqgA3qMO5T2ANu7h0LEL3REWuhdpQZF7SyatlhFfRhWhbnWUDek4kv3VjYKTh5SHOZi8jYYSdyAMaB+f7y5m7YLAGyJGJHOkYGPAyfQj4GVElSdNgVjsDftW5YurCeyt5nL/HdsNsfJ6dBR98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632234; c=relaxed/simple;
	bh=QPP25hzXGRebbNyApfbw/ePtiR6pqeVKltbiG7kR1ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvKg1F1Y1mQ833RVbrvk29jEEqQUOAySw7J6jRhRCPPKFeG4swkPwOn2C4YXgNsBPAl6YwjmcLjaWxIfqty1p/SwZPMKDdII4EqA/KevllxE0A0PiF8S40g4Msf2mAwt02gkxcTeQfxhuJLP3+eIytJ1829NQsM0fsJXH2AI3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=veY7Eqav; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="veY7Eqav"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-795ca45c54cso246595085a.0
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632230; x=1719237030; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DerxFnnoYXb7MP4GOUVN2xlgxjAao77OyLSOrDCydO0=;
        b=veY7Eqav0akW6jsKdF3r72Us5iVW/gYA1pbtamlJlrhHHQWG2xQomRdmVMEueRZUvg
         N1YvH5X+tXIhu/vL8M27NzOpE9l+nHNpJW1r1FIQRn5UHJrQk3EEuWSiBEDBLzQaDblP
         SFQS/ETq9mvrteOSOYUEz+t4/b82YpNxBhO3tevrQmWYr1WpQdTh2EvgheGGMBwNV6me
         9T76NRQ195XfbdRYDgndj1BBcGSrHNegbT0ZjyGyrwqXpDbYjCUBfalSZZgU/MkoDsO0
         NFfMRFNNV/rxJ1PHPKkkgzO1adUp8EuPamqHxZwklxUZjsGAeBnUy1DYI85JWYf+K36b
         Z4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632230; x=1719237030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DerxFnnoYXb7MP4GOUVN2xlgxjAao77OyLSOrDCydO0=;
        b=cR2TprlrdQhoIjHoIQ7HDVFuRLkfMqCaSAWEZxe7UNOcEMhRLMOudAmvPphbTOXUov
         NO/iMso6ymMoFIFXMooV0zt0pToVQBdBJhpgYDVz6W+zwWOVgUQ4GHZlbPSdgKz1QQeB
         m0BsfNay7oNJtxtZXBFIrINDuT/k9M5qjFcubIL0ZagVW69ml8g1cJA9LcdCdr0dBYsK
         klR2L5KR/y+RhgJko1lrX30+j1jPb/Z5sC+57jCsJuUrDeeLeTjBdn0FOpmcGg9vk58J
         LNYUhDnMzHm4eyVKfInr9/Ao2zsofXqHUzQ0FgyMG4wlokIBhV0F0CLBm3Av4j+DLwqh
         wgZA==
X-Forwarded-Encrypted: i=1; AJvYcCWqM6dmBbJbfOcBlw1YFCFNwkUAxRAk/hGTS9iY84++lB20Gcut3zpwWtwwGF/7aV+bwruVtOsotOWyaLKOCIAfD6Ta
X-Gm-Message-State: AOJu0YzExw355lz9XYG/zOM+fZDY8PiWtcOo+5AfryIjSzXR5RmdXbnK
	1SBxoRiGWR+fuT4mMWyI+QVP9IdOIY7CpjgyR462+IogdDWtC2YpJHpuvAr8XY4=
X-Google-Smtp-Source: AGHT+IHxtzkdFJwlDchh8tO2N+M/GUfc/zgUMeSNzO08CBN63HSCP+uPJVwg8RWxzdMRcwiKU/TPZA==
X-Received: by 2002:a05:620a:2443:b0:795:4e2c:eabf with SMTP id af79cd13be357-798d240dcf1mr1259752585a.26.1718632229931;
        Mon, 17 Jun 2024 06:50:29 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:29 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:01 -0400
Subject: [PATCH v3 21/41] iio: gyro: bmg160_core: make use of
 regmap_clear_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-21-88d1338c4cca@baylibre.com>
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

Instead of using regmap_update_bits() and passing val = 0, use
regmap_clear_bits().

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 drivers/iio/gyro/bmg160_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/gyro/bmg160_core.c b/drivers/iio/gyro/bmg160_core.c
index 0e2eb0e98235..10728d5ccae3 100644
--- a/drivers/iio/gyro/bmg160_core.c
+++ b/drivers/iio/gyro/bmg160_core.c
@@ -285,8 +285,8 @@ static int bmg160_chip_init(struct bmg160_data *data)
 	data->slope_thres = val;
 
 	/* Set default interrupt mode */
-	ret = regmap_update_bits(data->regmap, BMG160_REG_INT_EN_1,
-				 BMG160_INT1_BIT_OD, 0);
+	ret = regmap_clear_bits(data->regmap, BMG160_REG_INT_EN_1,
+				BMG160_INT1_BIT_OD);
 	if (ret < 0) {
 		dev_err(dev, "Error updating bits in reg_int_en_1\n");
 		return ret;

-- 
2.45.2

