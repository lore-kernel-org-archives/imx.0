Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12D61CCCB4
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632243; cv=none; b=ExGHrM/DDqi2qQ+wDqRSFI90Q7bPhjBlZ9ypBDDsYQqUSxZrzTudln301Ya9LZKBj3l4lbmXh5J8C3uStby9KPW4GMc1LQDHmcO48/LAdq0a+0mI0U4fbOx47NBojArxUtcVp/WaqScnuSEMUHw8PpeZr5Y4g7IN1VTcpcJSEmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632243; c=relaxed/simple;
	bh=hNgP/6iNEg0nlsLXnblRZQOFGnL8J5KYM7/zOiP/Ot0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APENY0QFN3N8dYeZun5SB3U+or4TSm/oiaAkLn0BNTfVCoFJokpyV61oRClE1K9hvwlIwv1RQtIBVLIU4o+sZ97kiuWcfl5w3nMffbf4eCkufXxBU+dBGnpr31X37ABzzQrF9XNMvKVd809NqmnoFw5+skFwoPCoUIO2zS9eXK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=I3iouGma; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="I3iouGma"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7955f3d4516so481905985a.1
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632241; x=1719237041; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9IxtXAJpg0zoHi2O9sRGBPOMzr1DfcZ9EisZFYQElQ=;
        b=I3iouGmaLXdpresWg5VsnBYOvfFAkMa6c14Rd/mcKp2yg76a1gWap5l9JCqxnF3gUI
         lLR4uhHo/JwJRtRarXym4GYk3m8hWhsd6eKDWk32zdSkdKA+A4leqHYdxoxZQmrjZDX7
         nCeKLoTu5j7UDLwlbrxGQIAsaKXSujs+QwByvnX+nBkcakTRgO8hgJ2XJ6M+jE50TiiE
         t43kLvz8YW3BT414Gq3vqbitp1adz8kLmYkayiyAPUC/CDrYuQZEZWuLCtpZV5IUusBH
         EQlHljrDvPPaHpI8RdRxidk/MrDm8qQ6YV3XjgkUWAmG/GcmRsKU8LKoe8yDEbfAnGoK
         hfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632241; x=1719237041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9IxtXAJpg0zoHi2O9sRGBPOMzr1DfcZ9EisZFYQElQ=;
        b=MJTCtAZjbJeK8I+SE/X86Xi1821/F2Vu+QgrG+JOWQg8ce263Knvdo76MRdSAEUXHo
         i5rH6CHdFw2e1XCDJEXVmZ5S+aUhCw03CODKsHT6p8qWD6H65yeACD+wJ5fFAiRVbbjx
         ivJIZG13ON57yXkUCRRJs3jXiXZ+5wDsrHcF/UWwIH9Z6iAX6dvy2q4FpJujPDsyldPs
         Jnl6y4TxKNl8Y/tJnWv+gUHsNT6F2PJGIDyCGPS/bSMnr3RHZcTBN8SG7imxfpGb6aM0
         7BdpZiGV6m2LXxbVlVeyu3hAteOm3xkO4k0aNZ7MeNQg/bXhpeSxa2diZrDdU0JJ5jtO
         wDLA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ05+3zwOuorhNjn1o629OaG2zA23AFVpcL8R6A5MTnrE35/f5180ruWnqG3Rmi8pbqVyR7ON1RVltGEmvbfoIx2r0
X-Gm-Message-State: AOJu0YzG4eUiSi238PKabGpR+bY+yJB5J8CLTYUJCPhvrTJOjriOnSid
	5/tJbV5DDI3RqqXIn9FRxAUUDZoiB5KC1vczxu7nLgZrhItKMPvV8sngY8s1hsc=
X-Google-Smtp-Source: AGHT+IEvNWEsHTIz+Kh5SLMDJk99l/NCyLAOM78IKPUk0tI5a9ZCslYv7WlkhqmAtTcQfPh0VS34pA==
X-Received: by 2002:a05:620a:2981:b0:795:5469:1b32 with SMTP id af79cd13be357-798d0242f64mr1752044785a.18.1718632240726;
        Mon, 17 Jun 2024 06:50:40 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:40 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:06 -0400
Subject: [PATCH v3 26/41] iio: health: max30102: make use of
 regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-26-88d1338c4cca@baylibre.com>
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
 drivers/iio/health/max30102.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index 6616729af5b7..07a343e35a81 100644
--- a/drivers/iio/health/max30102.c
+++ b/drivers/iio/health/max30102.c
@@ -448,9 +448,8 @@ static int max30102_get_temp(struct max30102_data *data, int *val, bool en)
 	}
 
 	/* start acquisition */
-	ret = regmap_update_bits(data->regmap, MAX30102_REG_TEMP_CONFIG,
-				 MAX30102_REG_TEMP_CONFIG_TEMP_EN,
-				 MAX30102_REG_TEMP_CONFIG_TEMP_EN);
+	ret = regmap_set_bits(data->regmap, MAX30102_REG_TEMP_CONFIG,
+			      MAX30102_REG_TEMP_CONFIG_TEMP_EN);
 	if (ret)
 		goto out;
 

-- 
2.45.2

