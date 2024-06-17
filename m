Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908621C8FAC
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632229; cv=none; b=rM1gl/olCmka8A4nZzZvon2UGxvgDtJGuTPavVzrB896Shz9sEBn3RkTguTFHlL4zefUJvxxAPbQi6ZWGp9jxfCFgjys/jS5nlwVVld/Wt1j8Al4NMGu2HPvE0kjry7ACPNE0ITq9vqEMsFDscDIq6rU3v/+T3y8jv92C5A7rFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632229; c=relaxed/simple;
	bh=vF9eCSFK9zsl5BTxl6iZi/Jw5sWK8MiJQHD/bb1xgts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FCDZ6Ft71g2pL1ZQPdwb25wJMt8QlztT1bKlMGzaHYTGayqE76MBvSEgizwJY2QakoTraDgRdrGTEPi6uSlrYeIrgrGcDFa8Lx6a4Pg2dPwefgOHQBikiKTQPtDcI9qAvYVt38gv92SRpTMffPIC8vHiEHlJTc8Tz0smxkCfZBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vVcGtlBa; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vVcGtlBa"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5ba1f60eb96so2547296eaf.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632225; x=1719237025; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsjL1PDi95mMX5sXzypBRu5MAqP+mGu/27hW1rxKMDQ=;
        b=vVcGtlBaQG5lUOTjA7cvDVrboXLZZFwFxm8QfD1GKVYqMfhX4V9Nyrm3jmkq0AeJFQ
         ieW0a6E+AK7aHNv+cz5Fv7YewK7Zl6kQToWzE/Wmmbrv+OXRX8CoXp30a1bEPlQntjHi
         qm5jqNEB7WPJibalbs6eOQfCbJbc5weSD9OFru6KEbB5T4QGtWMJy2ZUKfr5PHm6Z+N/
         O7Y1o2XJuxLMh66sdoFUQEAOEc01RA6Nc1Y7fw2OI1UedN16n2BFFP+9erF1V4zlSmyc
         bHpy5Z0tVs5xcKOKq4tbod6lnqI10Fpy+7JoQQsiHtk7jcgFe5PEmrBSmG6HSgolbvIJ
         n1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632225; x=1719237025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsjL1PDi95mMX5sXzypBRu5MAqP+mGu/27hW1rxKMDQ=;
        b=FkDSN7UpOcPiw1FFXoJQpugZIIlfp5LgYUMpOdVfJ6jM5sVzsvGApeePHNUpEkTJLo
         /alRCImyziDcH9gs9NW6LHaCKoqHUJymfPUfSeUMqTD2YWed5f8CcDkjLQZjgNxAKkyt
         yJQB00xvyHncdIPV7iWzMcEjGuMu5n+X1dB0t3Cm7nYdaAoQwDyRlefwxOC9wuYNaR16
         AXMOhysivEt5jemGA3nYe+dw3QPPghKkwoqYcLtZ8NzsiWUziN93CMI2AUy+qZnglBzU
         glLf7FK5K6qY9YN8lWrAfnT2obrmVJmCfzBkw8Y/0ajPdFVvVu3o5IkXM7ZJE6H0B2Ky
         snfA==
X-Forwarded-Encrypted: i=1; AJvYcCXMKlwmirZ+jaQnEHOxbtCj/DrtzytHcFe3/IGIwLc9kvkhKQmIZYgQnKbah83h4n3eUZ+26AAdLNW/lV2OuhfOlTYl
X-Gm-Message-State: AOJu0Yxh3lm170vthzfvapP4J3Rw6CU5tvYNskpKI2VJDCEPKca603+3
	kkQHj0ompCVo9gxCd/Kpw5800sOeYbKw6vvmGBQmRAGTVBcN81IU2D5pIKksBtA=
X-Google-Smtp-Source: AGHT+IFvblxIubOLu7csKqd2DaYsYhFE9mHOS6tHSYRNjsfIzum/J8kKl7oiGVOQ0fHTuqtXTzPk8w==
X-Received: by 2002:a05:6870:d383:b0:254:ac99:1152 with SMTP id 586e51a60fabf-25842baade0mr8855321fac.58.1718632225631;
        Mon, 17 Jun 2024 06:50:25 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:59 -0400
Subject: [PATCH v3 19/41] iio: dac: ltc2688: make use of regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-19-88d1338c4cca@baylibre.com>
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
 drivers/iio/dac/ltc2688.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/dac/ltc2688.c b/drivers/iio/dac/ltc2688.c
index c4b1ba30f935..af50d2a95898 100644
--- a/drivers/iio/dac/ltc2688.c
+++ b/drivers/iio/dac/ltc2688.c
@@ -860,9 +860,8 @@ static int ltc2688_setup(struct ltc2688_state *st, struct regulator *vref)
 		/* bring device out of reset */
 		gpiod_set_value_cansleep(gpio, 0);
 	} else {
-		ret = regmap_update_bits(st->regmap, LTC2688_CMD_CONFIG,
-					 LTC2688_CONFIG_RST,
-					 LTC2688_CONFIG_RST);
+		ret = regmap_set_bits(st->regmap, LTC2688_CMD_CONFIG,
+				      LTC2688_CONFIG_RST);
 		if (ret)
 			return ret;
 	}

-- 
2.45.2

