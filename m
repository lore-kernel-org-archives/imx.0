Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCCF1C2310
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632222; cv=none; b=j7PgqYm8tMMSX72pJ8aSyxc+AWONrKUjcELmlvHUaRsbzpMvRxgm+Ab0NyadEfbNgYZrLCU1K2BaD+WCgJ30SImqFSTILA4TAMY12fO7mjyCx3SY6j/tA17wlxohfLCGGAwVHaQ0hGsF08f/xkd0yUI3H288exI1MmNfNLrCEuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632222; c=relaxed/simple;
	bh=guuqVXSs2s7BD/iWi4IU8Nf6aEgnRuSwwDipuP5iGhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LaY3lexXn0uTZK2NxcNpJuVxerynlge0POpmgeBa4AidrxRyxhCqzFbcXTj5yt1Zs27hjAoscfuNl5r88/X8lkbMyI997WEPbu3y+cotImPeOHmbxZwDKQBbJxxroL5fZgw3bQhuQjvLBeOuK+PemZ+dGrD5nRACAg2S44mDyUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kd0s5uVs; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kd0s5uVs"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-797f1287aa3so342732685a.2
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632219; x=1719237019; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVb/0PilAc52B9kaVfDX+4rlv8WRgZtRLdvIf/r6J1Y=;
        b=kd0s5uVsCb+VXwGz9f2i4i0pAZuXaOjiFnCAHA29LFzGnOJpoxYG1xXEtDmC/JXrOw
         yWrPkm/o/zUtaqnJabyYMKEEDyouks06ikZwEMlr9HxY9Y5Jhljbm0sFjYVkK6/MXt+2
         GwPjTSU8NbircOOVFJR3h+ekOOE5AvxCdkJoJUV/DnZy0wgWAvdnP+h9fNYAZugruCGi
         F2ygCVrtjLmuhyfy7S7kN87CwO4VcxPOYJpEesmvEtXoFQbAwUVW7AIDuURRnq9hH9Vf
         Li8OGpoBJuN3S5AbRS2bT7Y8ONLG26G1r/h2bw+UV8pstTei8xoNgG/PBud0KzAjZXq2
         AKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632219; x=1719237019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVb/0PilAc52B9kaVfDX+4rlv8WRgZtRLdvIf/r6J1Y=;
        b=NQm1wll9+NCebdcZVBUe0l1UVrrnC9kPisrREOvlGUzSmtLYJo+PZ6wa/j0dJH7SvH
         RzyumqBFr4WcuDoJvO80ebjhQzuAa7zxUwAzifVhgDOFfVdh3D7Vsr/gePlB5+zPAR2E
         dO34/7fHnOnfuLAKireFcsOKISYEiEDhMR5CsQbr0o285Nlwoyqog9DtdFNUPo8sQ7S6
         KcPs7wfalzKDiG83rqFe+HJSd8ZvRtkcwyFPmksMDGl7ZbdFn99BdbFiiVpU4vhD4VTK
         PPnSJ6hMh/L8aYxZndXYrifTRQ3FaVgsMqAd2g5ivvCPU3tQD30d1Xqx7vEI9hDiLvOZ
         AyvA==
X-Forwarded-Encrypted: i=1; AJvYcCX/g5z/uzMnIqgoUCFhm3ic5EUiAQxvd0e61Q9u9H3u7pmJuzIIYMZ8HS5ibIjwDeMnZ8k56rQzW5MkF72D7242b4ld
X-Gm-Message-State: AOJu0YzLeP+R1qovv5POS84LvdJTHGm5UXQ2O8zxvIbpfJswYGbHkAul
	aytSAs/vThpk+kywmM5nztk0GXfLXIO7Go9b3kqkcHWLsCzJxTleTyeSVPrBFF4=
X-Google-Smtp-Source: AGHT+IEhAnjjomgk19gOfh4FY6+tmL+ftVg/dpR5n10Qt2NpVGAkWAorRIXV5RllBFaajmvErpGqLg==
X-Received: by 2002:a05:620a:370d:b0:796:842c:77f1 with SMTP id af79cd13be357-798d243aaa6mr1278103785a.36.1718632219186;
        Mon, 17 Jun 2024 06:50:19 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:18 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:56 -0400
Subject: [PATCH v3 16/41] iio: adc: rn5t618-adc: make use of
 regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-16-88d1338c4cca@baylibre.com>
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
 drivers/iio/adc/rn5t618-adc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rn5t618-adc.c b/drivers/iio/adc/rn5t618-adc.c
index 6bf32907f01d..ce5f3011fe00 100644
--- a/drivers/iio/adc/rn5t618-adc.c
+++ b/drivers/iio/adc/rn5t618-adc.c
@@ -137,9 +137,8 @@ static int rn5t618_adc_read(struct iio_dev *iio_dev,
 
 	init_completion(&adc->conv_completion);
 	/* single conversion */
-	ret = regmap_update_bits(adc->rn5t618->regmap, RN5T618_ADCCNT3,
-				 RN5T618_ADCCNT3_GODONE,
-				 RN5T618_ADCCNT3_GODONE);
+	ret = regmap_set_bits(adc->rn5t618->regmap, RN5T618_ADCCNT3,
+			      RN5T618_ADCCNT3_GODONE);
 	if (ret < 0)
 		return ret;
 

-- 
2.45.2

