Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480D01BA899
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632195; cv=none; b=Sc8GZbwHdv9zhKxnzsQ7PgCmOb2QTaesFxPgX2zEFmmjrQqIQHFH9CnW4FVnFsMTipx0J/G7ARFVbde3wbPNkMSfvDsY625yyfE7qIhFxVKb++CU8UmO74Ynx4SPJQBm0iICjckWmBevRLGtkcu0f1Ic4Xbl9YaDBh1o3wKTRLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632195; c=relaxed/simple;
	bh=F6edunFIUcDZTIb1mqBjURHwGYYpBYudXYPFSJXncC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uuT6ScRok6iBP4aGKGgWDedJhKutUUs/KPztvFZ5p5yA07vqyKTlKW6G0ywS59HAHEcBgtqvORIw15ULp1xetUHyjTRIzAs7eehzH8W6oUAr1TrjfJLEmz1v4ZTJMFuny9S2+KeuRK8P6k5cMMn3HjEimsQASDbS7YUq51RWEBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1vvY9CNG; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1vvY9CNG"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-24542b8607fso2288428fac.1
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632193; x=1719236993; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcLjABCmPDgHOzLEYjNK5DROGA4JTxd15k6kwWpFoxg=;
        b=1vvY9CNGvgS2pGKQxnsbkSmxABvf0k2buYXWoNXDDI8cNWhOIp2UBzI/HL92vXskP3
         DN3QBzs4KnMiBVbwnLbCkGIgtxI68cokzKGVXZazcdOg1qa8UKOCq90mp/ouKC0l/jW1
         noa6UgYak5+w+e1LYkUDcZg5zp606MCyVppZPo+5vCK8YSf8iIyah5CJ2Xgzhaf8uk7W
         d9eqYMb2sQa5xj3lBfWr5Fzq2jiPqBdcwdVNT71z6qXHuBvXsaulLjGXz+bSoEEyHJqR
         lA0j5HZP4T5ER2ffDe5a+eWKZUtGqUUT0LhfZK/J9pauuZaRYTqsZ2PtZ9fDTyhlC3Zu
         G1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632193; x=1719236993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcLjABCmPDgHOzLEYjNK5DROGA4JTxd15k6kwWpFoxg=;
        b=MJx9g7vqfI+Ma5hHxvsHLF+Na8pgSSL/j5kpkqmull34GO4EMz+2Ln754nJZ6BF4J3
         nZ6b6GCO+G7qceDhES/MCYOydy8wmbig0fE5Y9MAeFELYvfMQXGdemd1CO1Sbe6a5hYr
         3nimHmtipITpE8uuHPiQy+EToFT2pCweAedzobc4z7PPcM2o7BZ9Y8sJufypIaYkl9Fw
         YwItSZpxKpT6MAlZ3b3o7lCfG2Ac2cfv5F+lnSQiMiorzUpV91LY89kT3khle9zrku1D
         n369Mjs/g2fVn+v2KFifwmix5PVbsrmtYASQ0kZv4pD4D6G/ZKHz96LfjViElprWOEug
         5s4w==
X-Forwarded-Encrypted: i=1; AJvYcCU16tkNeFe5TYRbz1uoHRkVwZ9z58v2wUB6WhkafNZk7eaiCxcg/wYRyTBGugi0zhRimLvO52wri3cEQ8xQ98L7VVjY
X-Gm-Message-State: AOJu0YxpCN/XKbMYaAxl/7aIqSdQdfT5DFezBkIBa2hROXvROTZ27TGB
	wo8+44cuzSz/Q7aCBWP5fgoBMvEZAuTkl253HSNfe5RtX1i1NhplZWT8jGy4xU8=
X-Google-Smtp-Source: AGHT+IGzXK8LLO+jQf8g3iL5MCifYqjIipjPlFcW7eDQk67H8aKJxfmuoG4FYBXo33Z8PvtltK6jug==
X-Received: by 2002:a05:6870:4728:b0:24f:d9de:3bed with SMTP id 586e51a60fabf-25842b793famr10756815fac.41.1718632193273;
        Mon, 17 Jun 2024 06:49:53 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:44 -0400
Subject: [PATCH v3 04/41] iio: adc: ad4130: make use of regmap_clear_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-4-88d1338c4cca@baylibre.com>
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
 drivers/iio/adc/ad4130.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad4130.c b/drivers/iio/adc/ad4130.c
index aaf1fb0ac447..e134d6497827 100644
--- a/drivers/iio/adc/ad4130.c
+++ b/drivers/iio/adc/ad4130.c
@@ -1883,8 +1883,8 @@ static int ad4130_setup(struct iio_dev *indio_dev)
 	if (ret)
 		return ret;
 
-	ret = regmap_update_bits(st->regmap, AD4130_FIFO_CONTROL_REG,
-				 AD4130_FIFO_CONTROL_HEADER_MASK, 0);
+	ret = regmap_clear_bits(st->regmap, AD4130_FIFO_CONTROL_REG,
+				AD4130_FIFO_CONTROL_HEADER_MASK);
 	if (ret)
 		return ret;
 

-- 
2.45.2

