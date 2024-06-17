Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638851CE0B1
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632253; cv=none; b=Qg9pLW0CAb4POvj7KIf9bjGtLZ8N2MZaeqwlm6Kq0F1mgOYsQSxLDsoCGxWszeB9AX4ormI1M9ZtlZof6KM2s+tkQ3lNkB1bXIhpVOT1ng3huLZwqefqFSCO3dexDaFhWMfZgFczpE71Pq58ebYZ7BRb7jMe0PNqqNb7aKb5VEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632253; c=relaxed/simple;
	bh=ckMo8AE5ydYAYNgqLQ5pfM8APLagaTP89WYb9paKWrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfRp00ANmiwopKycizZC++yudrVa4+Rw4ht4m1nrGd2r/2BA55ozW17dum/Cz2eyVCnt18XgNTuVh/zTMz1iHDeuXAl+migvNiIbcf1rQIESnLDYq4KrZNoJaI0MJMlytPHtd0uUEn7JHf0nvDjRAznQXUSpIrX8K2/pBvn0Sz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mTI3JbQo; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mTI3JbQo"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-797e2834c4eso366755185a.0
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632251; x=1719237051; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+ymucZ3m6lrJGr3WTAeCvzidHKg4xOe2grvPyQxJhA=;
        b=mTI3JbQox6AllYwJGtQG1E1NoD8JUuvthxDm4wUWCu5YaQftmEsEWppEYDizPC4d/x
         Yspjj0JkQZTH1j5ftF2P+o/i77UIxEf/lvIrrlg6KMaFyLFLkSRhepKJoSU/mXbiZFcn
         OX8jkCSL/4mqgXe6Plxp23lpg7qgSuzYxSfkPhMBIrbbVELnrVSthvavmKSQtuNLQKA7
         BGHpGnu4kGUquGq0k++5o/LB6H/elEI+aFRK1K2TVHECSuq8b0M0D1nq2Id25qEJAwaX
         ZRT40cpPzow9jEzweDu8dbvRGs4d2eYO15sfJ3JaSPq9lpdwLcDvbsCgn6D9kn+SzijK
         ZgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632251; x=1719237051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+ymucZ3m6lrJGr3WTAeCvzidHKg4xOe2grvPyQxJhA=;
        b=Uifu0KzyzccTyd5OJosdW25ZsK1OP5sVbPliRkXC4eP5J62uL2/YsOEm5HG9D+AI6H
         1FyoW29aQA3jX1J5OemclGfkM84UuoVh6pfsOV24Ljj3XOYu+C/lJl8a7T6+6Fbi41wW
         42YmtJhAip890pU4PXXnNpm0mgzzM3Ff69j3J5261FBKTa6Ua6lqhjF68UT6e9z1JjJ4
         R87GIi8T0xYB5fTCxYkXisZpL6iHjQwI3TTSAvm84RC/Dz7jhgMfkkXYuZ7TzeJSyDYU
         4S8EgThcYkjUvKtYligJUrPxW6oAzmsmkkl0S1Trk8ceigtJXL/KhtvnnGoN16VS1gp9
         OgfA==
X-Forwarded-Encrypted: i=1; AJvYcCXDvSRN8u4Nv6Dcxnx1PTKtJBuexPDtoq1AHPpoLC96QH720FOIzIgKFMTU8VjznwcARJ3e7V0+8h5uOc63HtwHmneL
X-Gm-Message-State: AOJu0Yx5lfkX4bhSIrZM4Hz8pqeyLpkqW/Nwl/vICIngvLjxlISmHoT2
	EoIitgdzxKtqU4zsYyV/o6NHxC4CMvXseBr5tJDVdcymWqmjRUJ839kt5Rvg5c0=
X-Google-Smtp-Source: AGHT+IFhD2JefGeiJgsg6Ae7QRIe/BDndSP0Z/WiCRPC91zIn6+wpqBzLsiQzn3/JIP4kN+hagVe4g==
X-Received: by 2002:a05:620a:4056:b0:795:56a1:6c0a with SMTP id af79cd13be357-798d03b78c4mr1852443685a.30.1718632251285;
        Mon, 17 Jun 2024 06:50:51 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:51 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:11 -0400
Subject: [PATCH v3 31/41] iio: light: st_uvis25_core: make use of
 regmap_clear_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-31-88d1338c4cca@baylibre.com>
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
 drivers/iio/light/st_uvis25_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/st_uvis25_core.c b/drivers/iio/light/st_uvis25_core.c
index d4e17079b2f4..fba3997574bb 100644
--- a/drivers/iio/light/st_uvis25_core.c
+++ b/drivers/iio/light/st_uvis25_core.c
@@ -330,8 +330,8 @@ static int st_uvis25_suspend(struct device *dev)
 	struct iio_dev *iio_dev = dev_get_drvdata(dev);
 	struct st_uvis25_hw *hw = iio_priv(iio_dev);
 
-	return regmap_update_bits(hw->regmap, ST_UVIS25_REG_CTRL1_ADDR,
-				  ST_UVIS25_REG_ODR_MASK, 0);
+	return regmap_clear_bits(hw->regmap, ST_UVIS25_REG_CTRL1_ADDR,
+				 ST_UVIS25_REG_ODR_MASK);
 }
 
 static int st_uvis25_resume(struct device *dev)

-- 
2.45.2

