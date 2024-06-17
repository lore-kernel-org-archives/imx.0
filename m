Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE671CF3C4
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632263; cv=none; b=FgwwLCOjaMcEezqgQtixlNlmj35jeqWDzSBLeRQz1yMnpFC3oWqu0Dm/4zhdPj3AMpq746nNKR48wvErJwkUMyoi5g8jy8+5eiqjOXQROEMhpo/NA4ULbraS5dQCryhTDELljcB+AwzMromuILRx1y9pwt7xr+Ghs9nb5jSwdlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632263; c=relaxed/simple;
	bh=NDx/K6ep/W55tpcxMxrlQJ2+ADx4bn4sLDv234tkO70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ODe/eR08gKPdB7BVfe7YNDvxk4SGCSd2icjf19QVZPB5QbC9Zjg3IVu6J74fCJ/Of/b4NLHS7HC8C2qiZW2lu8zrFblRthDOLPaKqjfpLfyeLUVAw0b8SFJpjeBL4ER6iUv2uk7i1W7Z3J62XPKelwZRR+zxXrE+NFu3yNAWZ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OQm5iUxr; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OQm5iUxr"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-795569eedcaso228741785a.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632260; x=1719237060; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCh+HIY0adNQEnDSauX7K8bw5POFZegMypjkhgGy1wk=;
        b=OQm5iUxrRj6uXTUisqBJxOlEQ/wQzKa5RvOWgRi0Ct5UcSBKFESXJJF3hbkcUDDRvt
         Ft5peYiHxS+b2+KfIGBajBYXybwmXxn1xo6JMF3mTW7ES+RrBip6QxDuCuTIprN1jXGy
         Fv+0KUZEXUjkhaoX2v5x9PaoxSFvyTxubOtYf6UEdFinB6gWsBFsS+PM51BEuFyVglXQ
         9M8v10AE3XMptSLaRFHdFz9z0V1X/mlgpgRsiT3miBN8dzhXgTTgAUQiS1n/NTo2muoZ
         RFGO0eqlBwn8nt9vuJr/CId+Z2x42dWJaGVU50AHLjdHLdczQk+FaTSe/dYbTMj5LajM
         NMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632260; x=1719237060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCh+HIY0adNQEnDSauX7K8bw5POFZegMypjkhgGy1wk=;
        b=Q/S8qdFaN7e/bS1ojm9Ikx8ONnmFs3pTAAoztG92hoVy/PQ1XoRxZs1CxZMwtc3eJj
         xZ8MLAnhY/KrfkrwikRU1It/ARxQwLHiWevlUe202TmvcdXMSlsKuZFLEmz9HQfRFyb1
         y6Y/PIRTXV6ZU1Nf5TzeHhSE9eJGEtwsCQPyBH7xBsQBp0fKbVJYBq7urY6YP1ViDTrO
         krSVWqWQSgBv3Y7HLrmPl8JXF22dQtDX2DoXGSPhB3O/IoQlxb446nAXF8Jteudgmy01
         ZTh4SxLfcYFEolXH9q+0B3+MAN4U3n6llR5y+zh5Tn2MD8zegRpc3EdsicjLjQC5D6GA
         f6nw==
X-Forwarded-Encrypted: i=1; AJvYcCWIgSsROUCuAAIZRYt9qATysrAAflePJBXUnWO6eWif1bqqgkK0kI6LK2TzbyWzw1rTBIZhcSCm1Lf6xtqGSwLavTeW
X-Gm-Message-State: AOJu0YzaVn58SHHgMX45a38eYk3zg99Fro7KBBRYiC4GsopKdkAUA4gl
	8muKcRZ9vMMFK9n+XdqVDfd6sBEJBog3wp/8g8pmjgB3P0ZEcl2vOp9UcYETdD0=
X-Google-Smtp-Source: AGHT+IENId7QjpgihvaST50kcENjvnWyxdiSnte4lhDV+Skn20e41tG2cguOi5hNHA7+JrD8WB9kUA==
X-Received: by 2002:a05:620a:1a29:b0:795:50fa:c0be with SMTP id af79cd13be357-798d243ab42mr1258423585a.39.1718632259895;
        Mon, 17 Jun 2024 06:50:59 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:59 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:15 -0400
Subject: [PATCH v3 35/41] iio: pressure: bmp280-core: make use of
 regmap_clear_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-35-88d1338c4cca@baylibre.com>
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
 drivers/iio/pressure/bmp280-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index 09f53d987c7d..ef7f546839e4 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -1566,8 +1566,8 @@ static int bmp580_nvmem_write(void *priv, unsigned int offset, void *val,
 			goto exit;
 
 		/* Disable programming mode bit */
-		ret = regmap_update_bits(data->regmap, BMP580_REG_NVM_ADDR,
-					 BMP580_NVM_PROG_EN, 0);
+		ret = regmap_clear_bits(data->regmap, BMP580_REG_NVM_ADDR,
+					BMP580_NVM_PROG_EN);
 		if (ret) {
 			dev_err(data->dev, "error resetting nvm write\n");
 			goto exit;

-- 
2.45.2

