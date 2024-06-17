Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667651CE9E3
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632255; cv=none; b=lpu1MVdiS5Ign30SKJD3W7celsl0MZyfvctBZxbHa6ZwdzNBJvIf4eFep9zLJb6gvDn44w6yaCRVyerFahm37Aw8gGcmZPTb0sjzMd+TrZ2c15IW4vcTWOXq79yziIM8bpOBDoXtRzmeziygDJz5d8mSWd2FMnMGMhtfikjkeZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632255; c=relaxed/simple;
	bh=9Ek5rCXvCt90Gabaa6g12uHkTZTPMxmCN9hdijlBa5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Si6hs8oFBgDM46kOAsO7lwa5+Mz/7bL4jjc8f1TcXyEXsuif+2XVXmbN0AU4CbEMKw09oAURA03JlYl6zqiUndTmDZFiyLrGrYtxZrnv7x+Odyi/syPsfpp0qCGdqeQeMgvctOrVGSimLtoR1sd2DHo6oSoezvX5qq191PEJuOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VqNdoGo6; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VqNdoGo6"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-795482e114cso363679385a.1
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632253; x=1719237053; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+9CxU2CvbNCydIwkwVi62wLJsPjXvn/mOpa7x+p1k8=;
        b=VqNdoGo6MK9kXq3dFLGc/LxzOH/wV5LxIrhKXJvm7jUUr+kpf3nLB8vHny/GFtLsWn
         pR+DTxwg4x50yY5SnCp7ofHehV8UEcuOeS2DubOsyvBWSJIZKti2Dy1uVxyNQfZ2Dnry
         vo0FsVEqpWkcM7Y03zmWvKTRW56zkRoq0D1tlPf0fk56fklzrt6GFcpdqoLEtnjbGpc+
         O3RtMtxzMqBhzP0m/JBjbmLul8x8U90yxbcPORiLcxacFq2yWqa1tUOg+fyuHmuwZlwc
         XzRwg/gbG41nGnBTOSmspkIPFcGxMpI8jUkytNhEGA78EtBI2vUzOaFBfp4wO6FdYmuK
         gDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632253; x=1719237053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+9CxU2CvbNCydIwkwVi62wLJsPjXvn/mOpa7x+p1k8=;
        b=D/NgnMYtIW7+anEHS40m16rNfrkx0JKxG1vKBcLwkP3qVSyC3+IQZYDX4uf8DZ0TWN
         HYBpTiPNe/03UexHtqfEhcLH6C4lPd0rNtwjgDnKWUw8/Xix9znH+bc5grsBArd3s/RT
         acnVWJraxVeqjlykXhNphTtN2gKli+vmKF0cktBk+y8Fc+k4kRckYgddAGo9tLXvp+UU
         340eRsaLsMkC0XJyHYHzGui0IhOKPHj7pClv9836oIPUqsEXsKMOSZiTseIdqGRwQOGY
         DhLLCHLMRaXgPQvR4qk3JSvKySgpprECmJrBso6zM/VF7HXr7vHeXJdMNlMW5T7au96H
         a6wg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ0ZHvRuyReaQ7AvIby5ijDBdkf1erXxru+uHflIRYWg8NiNzXS2ld7ST9hLHM1EHR0p0Jg08kH4vOr413nzqWQ0XQ
X-Gm-Message-State: AOJu0YwiSAHOwy1lLX5Aa79EeRn+mHDlfcNZv+RA1pxONwCHKvSz4FsO
	Lso4M5a+ISjxoU4MD4Khj4pmGZtbd7fC/zVq4L1YP6+YZtlLx9nxMjLbN8l8g1s=
X-Google-Smtp-Source: AGHT+IF0QBpD3doG6Fp1c+vnf+YJQ81FC5gB6//3DNzmC1F9GzI4GVFvf6U3tYk3LEdICO36nL3YKg==
X-Received: by 2002:a05:620a:2a0a:b0:795:5c3e:eb45 with SMTP id af79cd13be357-798d2531f98mr1137480985a.34.1718632253384;
        Mon, 17 Jun 2024 06:50:53 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:12 -0400
Subject: [PATCH v3 32/41] iio: light: veml6030: make use of
 regmap_clear_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-32-88d1338c4cca@baylibre.com>
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
 drivers/iio/light/veml6030.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
index 043f233d9bdb..f7ccbce45f38 100644
--- a/drivers/iio/light/veml6030.c
+++ b/drivers/iio/light/veml6030.c
@@ -144,8 +144,8 @@ static const struct attribute_group veml6030_event_attr_group = {
 
 static int veml6030_als_pwr_on(struct veml6030_data *data)
 {
-	return regmap_update_bits(data->regmap, VEML6030_REG_ALS_CONF,
-				 VEML6030_ALS_SD, 0);
+	return regmap_clear_bits(data->regmap, VEML6030_REG_ALS_CONF,
+				 VEML6030_ALS_SD);
 }
 
 static int veml6030_als_shut_down(struct veml6030_data *data)

-- 
2.45.2

