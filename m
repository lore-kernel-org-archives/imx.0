Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A81CF3C3
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632260; cv=none; b=pwTaHx/EP7xp8hTxM1ublgRgpLaz+hRambmc+sNIBMoAA2JBTcpUrbE4QZLsqi6oJRngxRrmoAAkM5HasFFou8wCv/6OgV1EgG4qo+AUjIlY9HwG0tt8HboUMZwJP+QyUN82OA4oYiHvxdUSq/2uSHRJ/SXVYjHbPhHNfbvwfqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632260; c=relaxed/simple;
	bh=iu06Agy4gwP3mD/XsHj6uJ5NOzKIr+fvZxk9qZQspyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b9NHLDBwy3yLbC343Nu1hYSEpOWw81eWcMgtLSCMVAh6yFzFkV7pQFhYXI32MFOW41b392BLSRp1DKJFt3ChZz9PBsNgqSdfrVfIbRrgU/pC5BukOQHCpLvcKUMubakkgyIUlzPbs0J7DkdquPPfryTDqJS99jZA0mHmnfrViNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g9h9BIlB; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g9h9BIlB"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-797a7f9b52eso343352785a.2
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632258; x=1719237058; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bd9TIH+WbKUd6xwGH770DEQhZI10Wa7zRAAyumCALaY=;
        b=g9h9BIlBU0M5AuB9h08RVsM4NM7/YbSMhmIT+p26nAruTXHl6/zpoz0UU3mUSh/bvj
         +5BtDd0FTb+SSnEkrF7ED9+kXrYRpM/rGln+MDZ8LwlsmeLL9OCzgVTWSfEThO8Nw/KP
         MS+Ot8FHsYKx8DHznjSgxqF11k4cClcFKFfp4Yme/c5UGe5YG7TlCs+oKtlS6riFL1O5
         dAuGt/rbF3aKHav1mXMAU7QCvUox05i9hEgOtCJ5gccmgYJlCr0DOfeXt0/qyKqQ8jdR
         m/6GLGFN4RgUUOfKQCp1bGfNYXYYJ2CZOpJ4cyCAq7xh6tY2dXDJC3oAxcWYkOL3IAaQ
         azpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632258; x=1719237058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bd9TIH+WbKUd6xwGH770DEQhZI10Wa7zRAAyumCALaY=;
        b=XoqPiMCpMtheUr+VBTRnmlTGpnVuoJ8Iyll8ylEBIyZJqS3KkNNtPEyTG9OJyDlyMe
         yLBvJd0AsGGZE0uRLhgGocIHotMM/cAJlbz+OVIUIhUneGEcqPDKNsVi8USZFkLHAH6m
         qRv868meDdtNCcjxjLqcqFbbqQhF2braoBh4HmFGUeUJxLaD8cM5X/qNlOrMUDRB/LDW
         cO2Bl9o3NXumjWzrSp3DGouZOORsWYHR6Bv+HIZf9THh0zx8aWb2xXG/T/QJlL8LqUDo
         plVxAlWmYz4wcrm7Cb5KWTSHu64FHJELandY85SJ2TZ4qln1p88LcMGfDSktEFhbqpWh
         NiVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9dmwsBXxobBWDoyE8NBw3Qt4P/jJ47c0O0PFpwR1FHvvePuwNx8V4WXDZH5KKC9MtiRpnpeZiFifAcYLIIAPjASCc
X-Gm-Message-State: AOJu0YxO9kVzoTkADXS6KtbApveqNduChKLS4oBammOXl6uWup6FruqV
	wHAsX7hp/q4IoUIzTDTrgJojP4NNQ53X96J6+eaTt19+qgVoVFpTY1sM8OwKraE=
X-Google-Smtp-Source: AGHT+IHIgplKyy0pftg/5a2SG9pITo7fxr5SdNNjpCXiI/wTi4jbCSV+DPabl4pWpKgzNJgkUownfQ==
X-Received: by 2002:a05:620a:2684:b0:797:8ee3:9f01 with SMTP id af79cd13be357-798d2437ce1mr1017310785a.34.1718632257705;
        Mon, 17 Jun 2024 06:50:57 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:57 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:14 -0400
Subject: [PATCH v3 34/41] iio: magnetometer: mmc35240: make use of
 regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-34-88d1338c4cca@baylibre.com>
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
 drivers/iio/magnetometer/mmc35240.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/magnetometer/mmc35240.c b/drivers/iio/magnetometer/mmc35240.c
index 6b9f4b056191..ec35e9543a96 100644
--- a/drivers/iio/magnetometer/mmc35240.c
+++ b/drivers/iio/magnetometer/mmc35240.c
@@ -186,9 +186,8 @@ static int mmc35240_hw_set(struct mmc35240_data *data, bool set)
 	 * Recharge the capacitor at VCAP pin, requested to be issued
 	 * before a SET/RESET command.
 	 */
-	ret = regmap_update_bits(data->regmap, MMC35240_REG_CTRL0,
-				 MMC35240_CTRL0_REFILL_BIT,
-				 MMC35240_CTRL0_REFILL_BIT);
+	ret = regmap_set_bits(data->regmap, MMC35240_REG_CTRL0,
+			      MMC35240_CTRL0_REFILL_BIT);
 	if (ret < 0)
 		return ret;
 	usleep_range(MMC35240_WAIT_CHARGE_PUMP, MMC35240_WAIT_CHARGE_PUMP + 1);
@@ -198,8 +197,7 @@ static int mmc35240_hw_set(struct mmc35240_data *data, bool set)
 	else
 		coil_bit = MMC35240_CTRL0_RESET_BIT;
 
-	return regmap_update_bits(data->regmap, MMC35240_REG_CTRL0,
-				  coil_bit, coil_bit);
+	return regmap_set_bits(data->regmap, MMC35240_REG_CTRL0, coil_bit);
 
 }
 

-- 
2.45.2

