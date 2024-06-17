Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B451D47A4
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632242; cv=none; b=h86VyAXi0HoA+O9AuGcQmqePz0NLqR1zbBzrxbkjhhxQAQ6I14zo/ekNDrM+X1m0I52yxeWQK0yS5qL9SgKZfdqND/byKmv/tZNWm0lx01WhVn59MD4ieGuV/L935+pwfY44QfjNdM2FnvwBatwAJr3hH3/YlF3JIwnEol6JuPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632242; c=relaxed/simple;
	bh=l1cofpntirPxR2Ec7wzKzI6J9yRh6+FgHHryvnvZtdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SCFowbzzlEKsn8RuM1D9tM7kQqx14IgzS8cx8vlerjh73auMO5DL+8N7Og9fe0wOD9tlj5CGxQQU/zVPzDuUcr9gQdPKGF3FhYRNdc9bwJU9/vaB1bBDl25hLYVVsqCyeuWYT/gdoJfdMX6+qlea83x9MNYtudSX+EPzfOsXD1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TIuRJV2v; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TIuRJV2v"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-797a7f9b552so306641485a.0
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632238; x=1719237038; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7n1vQrJKdah20S8ZMrVRWoElzUuvEAd8XeagF8Tz1M4=;
        b=TIuRJV2vY9FtP9+6ESXAZ+PDIGY5Us9DIyKYpRXVtnitbzYQafmbT7Lb598oc+arh1
         M0nbNLjv6kUooX5Ksc8A5ACi1cl0pCto1302EgL+foa3WzTWoa+c/Z/m8uEgiozRihb0
         xeXq6uX1UC3RYT5NXriI1JCdEZiC2z8mfSWmmzuBtzwLKq+SuH+ibsKBaSqwX8I2C3EY
         GnkLybLvTgBgwLD28xEOZLiTVcXitXHtOuHcQr6Z4wNn8pSg6TX6/BT7p+Ts2QU6Tcun
         x+tUejW3S7d0NvFPvcV84iir1YH0ZdM36TvVxQ4L2AvjWfRxd+K+7Usl3rIbWnLj1uV3
         C7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632238; x=1719237038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7n1vQrJKdah20S8ZMrVRWoElzUuvEAd8XeagF8Tz1M4=;
        b=RHJrCPI4r9MCOxSE8DjZXfW4xlfV2c3RKk2oHl503liV/ahDfEJR7XS8aXfTQ6kfwT
         0jHnSJ6UNO/0CBQ3HevHjb16L4kKcdEQ+bvM6y9INX/8SWyASOagGmDExIwOH6J3EOMe
         9p2oSwrco4BXosyrBVlOC9aCH0Y7czM/5i5ab8OPshMivmP1x6mUjbyRr7Vb99Jlzokj
         WghVOj251qEWtfyxkgwGDbrNbBO330SQ5J7AhfSle5AfJOQ+C0amEpT3DQpTdeWveEIs
         LTSOqkEPn9y0aXmCk27WmxrGFEzsos2YlbDeQMX42OCVT56dGRdtBlFafcZZzTBus3fk
         A5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUxOoa+DAI1E1XDFPAFTl3LpJMxUc0OsT3qI1OrmFGTUzNojkzn2CPTuuxngEdqSlSlJjN+jdR5hpKpGiPNNoArXJTl
X-Gm-Message-State: AOJu0YwxhBOeuSSwAraTU+OFay7e1wOKSSGfPQMvE4jdGtN1ipRxFn2i
	jv8JNd+XeJm5eFhFexWrWqRPaToLa8aPqknHToB7SOkuZrCfukMFxrF2w1Cpt+4=
X-Google-Smtp-Source: AGHT+IFPBsXk8OC1fXhOsjN5sQEyfL0NaDJoRNSti0BCnQHlNJa0XX2KPq4TD0tgoqruv2mBvc8G+w==
X-Received: by 2002:a05:620a:2947:b0:795:60b0:3f5 with SMTP id af79cd13be357-798d2430e27mr984123785a.34.1718632238585;
        Mon, 17 Jun 2024 06:50:38 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:38 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:05 -0400
Subject: [PATCH v3 25/41] iio: health: max30100: make use of
 regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-25-88d1338c4cca@baylibre.com>
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
 drivers/iio/health/max30100.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/health/max30100.c b/drivers/iio/health/max30100.c
index 6236b4d96137..c1867c2ef8e2 100644
--- a/drivers/iio/health/max30100.c
+++ b/drivers/iio/health/max30100.c
@@ -363,9 +363,8 @@ static int max30100_get_temp(struct max30100_data *data, int *val)
 	int ret;
 
 	/* start acquisition */
-	ret = regmap_update_bits(data->regmap, MAX30100_REG_MODE_CONFIG,
-				 MAX30100_REG_MODE_CONFIG_TEMP_EN,
-				 MAX30100_REG_MODE_CONFIG_TEMP_EN);
+	ret = regmap_set_bits(data->regmap, MAX30100_REG_MODE_CONFIG,
+			      MAX30100_REG_MODE_CONFIG_TEMP_EN);
 	if (ret)
 		return ret;
 

-- 
2.45.2

