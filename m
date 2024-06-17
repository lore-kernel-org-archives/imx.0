Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FB71BBBE8
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632201; cv=none; b=QbU3IuAWvRoL7hKX2hpZUA8LXhLnex/hauDunn5cy1SR7BaWJvEg371pmt6ugnGofa/Ol5PnXuuHQoxT3+G+uKIokAgP/L7uENKxc5GvBcEWkN7dNAoeze017TVjbDnhOpnRT818zZwUZct5AFknyh3MwZOz1UNbGdk38EQPUCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632201; c=relaxed/simple;
	bh=UCswPzc07ScF6/5JfvW+wgRVfrWxtjhgBr2M86YwQWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=biJBVEC/my8fBhkeTsmlEb4cKB44uTh7cYRW5W2Cu1DprRxqTT4fx2EHLrmIJeBHJ1OOyHbh5tU89nM4Ttprj+3ECfiniRUoJ8Bd93dAmmj2cyhyl2DlMxq+EKJgojHu/Iw7Sd0Bktx281yFVtUNTrrCZcrrYygQnbSR2CoeUBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=feQfbKEg; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="feQfbKEg"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-48c37941349so1596107137.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632197; x=1719236997; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6UQvfPsoXnGJXINmWjQmEBO62NliLdepCpDJh/A7YM=;
        b=feQfbKEgcTslk0JZfYZT96lHl1XI0zx2QRfXq9lNnLZqNKvNm3qbUkw1zy0SfuOABC
         5o70XD34o/sxMAxJjsvuPaSnaoqxSkL3bs9pVE0aNDPo5k9uWDXE+J9s8p917pQsxD/T
         am32I0gqFzifGA1FhOA88Av9NlegI0Ogb6sLIx1LlZblp/CXtgMmNOoiNkpPMfalv2TQ
         k0CNRqRd6EiRTL6ecUrCGznLgVw3/xXdkfiDV56lNANeiOpa4f5R2H+Gy2xUQ3se1oyG
         qXgBhAjfPleMVT2XE74GoVUGoL/dnHBjk7L71OSjthhHOCeDUhBK+GQvN3glYt0XZVWB
         IjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632197; x=1719236997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6UQvfPsoXnGJXINmWjQmEBO62NliLdepCpDJh/A7YM=;
        b=ealuOm2RKR4Mrrbxb1LOzpqOm+MEyjv3A0pQYIuUB67MhUY7o0ZPr4lc1ecT0obpsl
         uV5Or0suj0nn7VCWwmLikN1luHIyVzaAL3I0frPM0cmUIXwFOJxc/vAoMpcBxylE0V1H
         DUiJtJQtNrqK0gtrcRGtrdTrzl5FDPH9vFTjQ0BeW4bc6GYy7kh+9ZGbLJrPop9Yzt7E
         emsvV53p/b65n5Yha9kDt/2y41WwH0rzRITOIStib7U01T454FpwqGwPAQVgWU9jcbFB
         c8fDDBDn2qvPnnvYPfqiMaa/AQXhgp4STC5mNfGy05ihVcYwD7vDsqaf1M4F8pIEjDXk
         el0g==
X-Forwarded-Encrypted: i=1; AJvYcCWiEsGloQ8izsFqLlCKbueM+Gj50GpzFA/PTi9tnKNp5X63JqatiUKMJWewQv6gDo7lytvI8eN/7tn1Cw6yH5Y7CxQ6
X-Gm-Message-State: AOJu0YyHpniAfuT8WrHPDEA3ZxnqtDT2Nl17u1lMX8rgSYs2VmTuHc/q
	X5jcDdqQ6cwsbGaIwcm7qqCA6MXQTxRMpiKbX3eFBe7FFnwNA/WAQ5n70dDJAoM=
X-Google-Smtp-Source: AGHT+IHh1rKlzT8+664YalrD1JcHiwA7k7yzEL0kYz4H+P2//V4FMw+RVSrpyNsoJMn06TFOuuRyhA==
X-Received: by 2002:a67:f452:0:b0:48d:a159:dd80 with SMTP id ada2fe7eead31-48dae329fbdmr9819998137.12.1718632197524;
        Mon, 17 Jun 2024 06:49:57 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:57 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:46 -0400
Subject: [PATCH v3 06/41] iio: adc: axp288_adc: make use of
 regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-6-88d1338c4cca@baylibre.com>
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
 drivers/iio/adc/axp288_adc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/axp288_adc.c b/drivers/iio/adc/axp288_adc.c
index 49fff1cabd0d..f135cf2362df 100644
--- a/drivers/iio/adc/axp288_adc.c
+++ b/drivers/iio/adc/axp288_adc.c
@@ -247,8 +247,8 @@ static int axp288_adc_initialize(struct axp288_adc_info *info)
 		return ret;
 
 	/* Turn on the ADC for all channels except TS, leave TS as is */
-	return regmap_update_bits(info->regmap, AXP20X_ADC_EN1,
-				  AXP288_ADC_EN_MASK, AXP288_ADC_EN_MASK);
+	return regmap_set_bits(info->regmap, AXP20X_ADC_EN1,
+			       AXP288_ADC_EN_MASK);
 }
 
 static const struct iio_info axp288_adc_iio_info = {

-- 
2.45.2

