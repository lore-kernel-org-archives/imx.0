Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE3A1BD51B
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632211; cv=none; b=guxtDQXRm8AaehjZ7yGp6Y+kjOEZSLT+y/nlpfFuJvYtHiYif/CdmGZAI1MXrgfjX5c08DXmuifG3xy7Jtv4eF193pmCKi5QA8wc5NAxEaKWNZeh/T602i0rcU+sgNgmLSvTxkh4ISYgbWz5QW06nCKZJwQEtt8sZcCcYsDFZO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632211; c=relaxed/simple;
	bh=5OuEWFVCpArtZhx4z8JpNnfTVTHf4ULROK8X14+lutQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eo06vRFVyY/Wv5wpfsF/6vsoWX1rbWRisEe13MjFbUBx/SKEQMzmUf/HO3rwBeFcqTQHlmcpdR0tm3PQ5kFHpd5XQIJdfqibpN7ZD/f2vDF3xo5w8iszzefpMLWNxp5tdrws7ZvIxjRmC/Bzi6S05Pkv342DW0Ch3Kt64dTtuUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cjKuFXcE; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cjKuFXcE"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-48e56ae9ac7so334470137.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632208; x=1719237008; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SS/VahdjQ8SKQC25MQPNc7rg+KDijJeHwUtRITveNmM=;
        b=cjKuFXcEmtNbxK8GgdFutnGoFfalqPn67urmHzXtE3ybJ7NwNhZ9SK2FqvOpzdY12/
         9ogZYiKrasqPHEFMRkWE+IZZPZTnpVLaA+X3wLEvtLKDowHFm/I6EipbsV56wgdvEVj0
         +Fk5DJ8MHKBot7Htlibx0aAnt6MRVab+rZKry6QXWVY1APjX32+XygZFofMGj8H95BuX
         mLoISZK+ekL3rvrmVzZpflRD5LfpnJKMFbHeeciagSoWJ9QnMGc5uEwlV/S46hxifIeh
         2kW3j6We7qEdgpHxpiPW8EP7O13+XdXe1BHuZte3h9xirUdVqV/VDfDiSKkTHTPo+qd0
         0DKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632208; x=1719237008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SS/VahdjQ8SKQC25MQPNc7rg+KDijJeHwUtRITveNmM=;
        b=j5LqB+n9uurTj6gOn5XVyw/RX4Hp0KE5bkUFXJ056TTIggMZWDxJYkN1VgkX0YAZhJ
         nm0dRhDhnvG6l8NUAH/0xpwSs8YemWYIRO7XfNebgyv258dhtwXfzJ3U7ZJEEqujpWY7
         y6yUBmn2ukitE6W+nokRzBWItIdyrYsaL3Ldey7j021+CkJwIDQpxLMwhoHFfSJN5C+j
         bSv12VxQdRJvo/BxxQiYaMfkF8+JSZKbqjn0Fp/HAmBhvKNA7eLZY1XHDPSsd3r0EhGK
         0SzkhuPyEHJWA7QLZUWtDSqfCZ8fFzsNGRaWnbLA+KxmPyaNFRWBnmZgzpigt29FJ6AC
         I6jA==
X-Forwarded-Encrypted: i=1; AJvYcCXEVDIccj135CGkfEA7lNOvFt1YHxeDKsGp007UcrI7KInBHqWOOmxLNGNjTmB8A6xjqlzn7QihqB5AgfKhJU1VrGhg
X-Gm-Message-State: AOJu0YywFzR2CUgYOf1FQzn1Z06oHGKXElgR4lZtT4/esDmNHcZ9B2qY
	Nb1eF3EO+WYTFRmNwa6JPwO2jN/qbDNvlbFQLw8vOkWaZvJlDJxyCBxBATzAyP8=
X-Google-Smtp-Source: AGHT+IExs5o6BBy2GiVBbRbl5RTcmAHYS/6pj70WZUFQ8c7/pJkIjoippgtnc/biSc9YFfMmt2B/ig==
X-Received: by 2002:a67:f783:0:b0:48d:9b03:3ff4 with SMTP id ada2fe7eead31-48dae3e1559mr9042383137.28.1718632208483;
        Mon, 17 Jun 2024 06:50:08 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:51 -0400
Subject: [PATCH v3 11/41] iio: adc: ina2xx-adc: make use of
 regmap_clear_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-11-88d1338c4cca@baylibre.com>
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
 drivers/iio/adc/ina2xx-adc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ina2xx-adc.c b/drivers/iio/adc/ina2xx-adc.c
index 9e52207352fb..727e390bd979 100644
--- a/drivers/iio/adc/ina2xx-adc.c
+++ b/drivers/iio/adc/ina2xx-adc.c
@@ -1046,8 +1046,7 @@ static void ina2xx_remove(struct i2c_client *client)
 	iio_device_unregister(indio_dev);
 
 	/* Powerdown */
-	ret = regmap_update_bits(chip->regmap, INA2XX_CONFIG,
-				 INA2XX_MODE_MASK, 0);
+	ret = regmap_clear_bits(chip->regmap, INA2XX_CONFIG, INA2XX_MODE_MASK);
 	if (ret)
 		dev_warn(&client->dev, "Failed to power down device (%pe)\n",
 			 ERR_PTR(ret));

-- 
2.45.2

