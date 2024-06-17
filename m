Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D10E1D18E9
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632273; cv=none; b=sl5/kexv0rC7UpE25S2kNlOuRFWbNqYaQTFztOMCgBpO0KqV0hrsIjvMazuO3ATqROj2KOh6iPK8UBVeRwtOe1gFbLnwVuarYSHGXZmaP0+reHYQtxa8dTG/0TdxDNOONhww60aJcEmXYLUuKaIR286XoS9LgBFz6lXAdZtIlV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632273; c=relaxed/simple;
	bh=/iTmUukNGLPGvGh+5363cpZBdKYe1qLwwMB3hsIs3J4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EykoAq29jn79nRJNPUJjpQ3ErHQg2XVyISJS1FicRq5/ctr4e0eKGSa6scswdlUzmb3JnD9mo5UW6X5VEly+HqYd38TGbg28S/NYwC2wzFNpoL0b7SdRyJqGhRqCrgBlphe12iIsG2yQ0sY+elJf/CDmq4V9/RT1hxjuZhyYdxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=w9yfTBbb; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="w9yfTBbb"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-795ca45c54cso246640985a.0
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632270; x=1719237070; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYef8rADT2ijxxEcxYPLN7/oRY6yNh5EaRUGzmb2a/I=;
        b=w9yfTBbbTmJgJ1ByDRTwqtbsDBIMo1PrNCnBYGtpe3NOJQlNen1vS5CsUr9IOxsadW
         8S/GSa7vIz9zzi1LofG/Wpv121iqGSNG/8gfSDzxIrELsZrWd047X5b0HrS/pKtAAv1N
         sT5bpRJaJ0cJEAlsm0XVVdNqHOJpCkCtjanse3t8qDEDS0w1rpAVWLpKw8p8fpyIIZF2
         l4ZfMgn/cBSRnS4qr5Tnewc5XrvRz7ZuYJ5cpxlBpEtgdlxuWqu1kBnWr0l38rRDQxpg
         ommfHQBl62FqbtAqQjfGk+YQhME8pkFYrnxJUqvQkQDJ4HP1Af3ftc1clgF4YFbF1Ldh
         qCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632270; x=1719237070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYef8rADT2ijxxEcxYPLN7/oRY6yNh5EaRUGzmb2a/I=;
        b=vAgeD7jk7A91ZUZ/k73PBHqUBGPq84bAxjZZsBEsaYhMtlVR4ZkW5LBFFuN1wdh/aR
         CWWXUsOY7XAU/aH2uhKowFocz7qA84jmuW3C785qrQLCdkCEZwfi5xKbwOT8ZVmCgVBp
         AuuNUz/uchYAW9qU7ekIsq0NCOXlTv59G6Lx0b1x0en0Sry6xlnN0evZyyN2uRWzaGNd
         u+X1p9TVUYhOHk8j6w5VOMpt1OGx2vtyNj2MOOY6eYeVfXMteqHsbJ6mIZfXS6Yy2/tp
         5Z4pZ670gKLSWnSkvp6LVtJFpuFlTl9o7ZvRoJAYonno7NnCDrfX2u0LTU1d85E6NqK6
         XXCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSEJNl8S3mgflU/Ocjn0YVpw953LKtDU8cVNPT/yfVvC1Cz650HLOzT9cDajdjQckA6KGP8FyR39TvfYx/9yVBjxrr
X-Gm-Message-State: AOJu0YybC36S2btS0NC2Uz7KIs7ncZN0Xa5Ezb7udxRLTRIj7YlIuB7g
	/hcnWrxg9AEUYPRA+ropDg7OO6LnaM4cKF8Je0tlXb/RWmJt4SHFLszPMoqCccA=
X-Google-Smtp-Source: AGHT+IG+NTpXbmfTtgLV5kgHRYZJqicJgvBNrkkmD2PI5YKClqNlpZ4QFEOEqllRaBP9Jcn3G+Ldqw==
X-Received: by 2002:a05:620a:24d5:b0:795:50ef:4030 with SMTP id af79cd13be357-798d242f345mr1050763085a.41.1718632270523;
        Mon, 17 Jun 2024 06:51:10 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:51:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:20 -0400
Subject: [PATCH v3 40/41] iio: temperature: mlx90632: make use of
 regmap_clear_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-40-88d1338c4cca@baylibre.com>
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
Acked-by: Crt Mori <cmo@melexis.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 drivers/iio/temperature/mlx90632.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/temperature/mlx90632.c
index 8a57be108620..e7de30f613d2 100644
--- a/drivers/iio/temperature/mlx90632.c
+++ b/drivers/iio/temperature/mlx90632.c
@@ -334,8 +334,8 @@ static int mlx90632_perform_measurement(struct mlx90632_data *data)
 	unsigned int reg_status;
 	int ret;
 
-	ret = regmap_update_bits(data->regmap, MLX90632_REG_STATUS,
-				 MLX90632_STAT_DATA_RDY, 0);
+	ret = regmap_clear_bits(data->regmap, MLX90632_REG_STATUS,
+				MLX90632_STAT_DATA_RDY);
 	if (ret < 0)
 		return ret;
 

-- 
2.45.2

