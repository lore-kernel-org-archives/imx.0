Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6EA1D0F49
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632269; cv=none; b=MQVa8U8ODurcBrbGvDaH3/y48pNHwDs97JQRweyrejeGJ5UYZQV6glhpQ/X384vB8xItLZcLJw3dh/1CRebUICGte114Km7DND6Qi6fC7oUEzInXLtRTO4HtATEu4ZMin6U+cHOOb+Iv9BFO3HPcly+SeCU6AFTQy/aVNKk5oCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632269; c=relaxed/simple;
	bh=Sz6h2pKfKvBPze6AioYNagC/2euAAaKQFjYWGhnXEKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QsLpJfe/whHqN6fG5AB3LCb7X2sLjoSUp3IbIUIk8WSRrEvFe81EpBeO36DBvQ6dFBnsCUQFEsy55VjKJ/OQlgNSQ7E9cGT+QovmUIsBdlFIcblROgszN2O19FrT5CEIbuAcjLCuTL/w5HAwi5YHIOn0Xci31QfSL3VVg1YOsAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KQAd0JGn; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KQAd0JGn"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7954f8b818fso290940285a.1
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632266; x=1719237066; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79Hx9GfOVVYusy8xA5eoh/JX07K+FfT35u2XbTC3DMc=;
        b=KQAd0JGnJwy3pflNn4XR4GMSVq/0CHuRFznBqw72SMPmmShD+0t4z0G51XSFcQQyms
         2jbC89tMQ2d7A8WlX07KoQqWWHueZSY2s3+vAfeF2z2ZAC7j/jpqAlLaZrTx3vMO5Ldo
         BC0pgYmcDfqHtbImtCft3zEshI4ZzPjJ5ZMbMx2MYchiPiAS7zDkhDvyZpoYaE58QmXm
         ajc9vRzEf3H+cAkfBfXi/dEjiIwR6zgyX8yVm3GcfX0ASvH2YAo9BRnsR9uFYOWPNOYl
         pvoanB1M1EwwX0/ncuzPAWRkHlM1FqBSSYOXLvvZIM50FcrqIBY/79QDDmU04MBFCpZ8
         8S0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632266; x=1719237066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79Hx9GfOVVYusy8xA5eoh/JX07K+FfT35u2XbTC3DMc=;
        b=orczv2IxFbO9+am1EmzxesGfir45PcurZj2m3uyi0Ss8ps7EKhXf145m+1dEQGXJMP
         glAI+6s2uAOEVqp7vOdC4u6B0Q+2POI/ArBuNu7ZiVVYWs67FZaP6xnUx0DzmgltUADa
         0X4QlC5TUejtoDMAue8sf7lru9Kwfmp1M+g9O5isP/4zFe28d3msu43ZZNN/ryqsd3gZ
         /TqoinZFzOHwUVe16knWwxYPUuDnvXZQLrnJeM9qYS5y8qQAQ0MdlwnqypJJs+LI45jh
         DtIJ8c27m31872o+91StVmFWtJt1S54cKcdG6GgbTxxnVZf08Wrm6pGz1I9Hu83/fYiD
         aAmw==
X-Forwarded-Encrypted: i=1; AJvYcCVawH3BLgoOMrTuHv2U5dpthPYkiDOZcFFPCC0FWN1nc/1xkh0TV62IZ05foZVmeKUxIltHOr0vOX7/GHlRf3vEZary
X-Gm-Message-State: AOJu0Yw+ub3AC2rlwqS6fMq2CYhceeqtg2+7aF0P54PMT5p4S3Xci8CI
	yMwBf+gEZ2J24vBqSZA7hR9VxB6lEKvOsR1rbBMxMNqxkreDZ9ySRZ71ktUDi5o=
X-Google-Smtp-Source: AGHT+IEx2KbRAk7Gdof/baHhrw8Y3qRBi2Hyio6LTg74NUhbwR1HRET1Zcy3yDqPrTQiSKqEfswRkA==
X-Received: by 2002:a05:620a:1a86:b0:795:5d6f:8bbd with SMTP id af79cd13be357-798d26a4644mr1303274985a.73.1718632266285;
        Mon, 17 Jun 2024 06:51:06 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:51:06 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:18 -0400
Subject: [PATCH v3 38/41] iio: proximity: sx9500: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-38-88d1338c4cca@baylibre.com>
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
 drivers/iio/proximity/sx9500.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/proximity/sx9500.c b/drivers/iio/proximity/sx9500.c
index 550e7d3cd5ee..49f4ccd8a5c4 100644
--- a/drivers/iio/proximity/sx9500.c
+++ b/drivers/iio/proximity/sx9500.c
@@ -209,7 +209,7 @@ static int sx9500_inc_users(struct sx9500_data *data, int *counter,
 		/* Bit is already active, nothing to do. */
 		return 0;
 
-	return regmap_update_bits(data->regmap, reg, bitmask, bitmask);
+	return regmap_set_bits(data->regmap, reg, bitmask);
 }
 
 static int sx9500_dec_users(struct sx9500_data *data, int *counter,
@@ -220,7 +220,7 @@ static int sx9500_dec_users(struct sx9500_data *data, int *counter,
 		/* There are more users, do not deactivate. */
 		return 0;
 
-	return regmap_update_bits(data->regmap, reg, bitmask, 0);
+	return regmap_clear_bits(data->regmap, reg, bitmask);
 }
 
 static int sx9500_inc_chan_users(struct sx9500_data *data, int chan)
@@ -795,8 +795,8 @@ static int sx9500_init_compensation(struct iio_dev *indio_dev)
 	int i, ret;
 	unsigned int val;
 
-	ret = regmap_update_bits(data->regmap, SX9500_REG_PROX_CTRL0,
-				 SX9500_CHAN_MASK, SX9500_CHAN_MASK);
+	ret = regmap_set_bits(data->regmap, SX9500_REG_PROX_CTRL0,
+			      SX9500_CHAN_MASK);
 	if (ret < 0)
 		return ret;
 
@@ -815,8 +815,8 @@ static int sx9500_init_compensation(struct iio_dev *indio_dev)
 	}
 
 out:
-	regmap_update_bits(data->regmap, SX9500_REG_PROX_CTRL0,
-			   SX9500_CHAN_MASK, 0);
+	regmap_clear_bits(data->regmap, SX9500_REG_PROX_CTRL0,
+			  SX9500_CHAN_MASK);
 	return ret;
 }
 

-- 
2.45.2

