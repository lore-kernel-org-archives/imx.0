Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E11CF3EF
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632264; cv=none; b=aHzyXZQxnmvz/ebBjwmpA+Z8dy/0qofGmdn/5j99cT8s7XXgsvSb+wK2W8tTKo28pt+EbZKxIvF8+Sgis+N3r888c8blLrMJQ16ajH3KN+Z/MWYTD98iDHggrh8yTbrs5TCQmYAj/26OpijZrNiccy85/Jn99tKc8mI6TJTktAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632264; c=relaxed/simple;
	bh=vM1JkJ0x/TYqTHqzgAuZC94s5MJ55op+dR9vjEILN4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lf9n/5t0wKv3rhHUKv49Ce53p+ub9L6h5uZleIhw58v6yGOeOk6UCH6TcZLDDExveyhZiCrT0yqFJFu9zouzHxk1mXkiBHntLLZLdNkYAVS/QlDhkkKFE0KEFRkITe0mlfVlZ7qtnYFSQfmyQ4URWHqwBQOexphQW4aAtU99v7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VDTW4JLT; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VDTW4JLT"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-254d001d03dso2082879fac.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632262; x=1719237062; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Tk27b9u+l0CzDHHIWu0wOizrcdk6I7Pf7l1UE2LHs0=;
        b=VDTW4JLT5V/OSsuHvtkJmgP4gpCxIxAp+6uVNi5hlo+t7bTgrpACfrriInMHybfoJ/
         4+/cUKJYriAYL72udYSEUkxHB+hymlGj/2tpEJpLp9/mnKSsez9covxk+SVtEE1RRSRo
         kFesI4d5bCNWDZ+eZ3NCwADEW9jSzgpznp0CaHK7kmxjidUHjT/WNhCy5WCKZOqcWAL4
         RWTXCJ4gZbvaoN5SDqzeNNkZBHdXfys5T3CeGPto5u6vTAesYdqVgN7AGS3yaXbt3Yrv
         yPEqSlw0npG1q2FWVvsGGMwZSXTlxlZFujU0mXtUNQvpRUVNUsq1+Zm7dG5sZTcY6qdE
         YemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632262; x=1719237062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Tk27b9u+l0CzDHHIWu0wOizrcdk6I7Pf7l1UE2LHs0=;
        b=MhNlRpJRV74hxcY63r3DfhFmO8tDqhBph3forcIn51FkKQ7AdHzeTvxF1P6ojoMToj
         8QsBTLJ387emFckCEskPFnMfsJqYfK2HWggoua4MvFni6NCArzOdHwmfDYsY6uFSwhbU
         zzwGBmPuUVTM0+oARuwJTjhqNprpeBbL0ffnYgiue/RGOdQIC1li0lYQI41dK0rV/X3z
         gFpia8zRgB9k9hhJ0Y6GfGUiNKKRL5tmuZdE4PwDVorr9OWITRuaKtsTefr1EC3n7FHc
         6WxIWlTnLrYZfmnGmEU4lcXfhmpizeK9gJw0t1ZpgdgW6oavqCoPqxPxwRfdmVdsz1OB
         pPjg==
X-Forwarded-Encrypted: i=1; AJvYcCXWXfRgNm5z2WvOBK7rOI2T036hN84B39zrMZBrVERr7FErNFCRDMwxTy+y0rFS95BRacPwRed19z/A20fW3tl0MtOA
X-Gm-Message-State: AOJu0YxrHMIgXcWXhRA2E1f66xDA6EHrwTkUW4UrpWt9Gu/8hj5xorcP
	gB3NJxiuZi2MSGCWyINGBLE98EoDPFtNF2Jg0iQN673v3wjQswTkLp4QdxL7JDQ=
X-Google-Smtp-Source: AGHT+IFPuCaLYR0OC2CKxxs6bVWzV0l0Y4GqKpcVsLYm2jLp2HnQirR7TaXtLxRY2U4vfGwAEVGQmA==
X-Received: by 2002:a05:6870:89a4:b0:254:7471:56b7 with SMTP id 586e51a60fabf-25842853b1bmr11345694fac.11.1718632262042;
        Mon, 17 Jun 2024 06:51:02 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:51:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:16 -0400
Subject: [PATCH v3 36/41] iio: proximity: sx9324: make use of
 regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-36-88d1338c4cca@baylibre.com>
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
 drivers/iio/proximity/sx9324.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index aa0d14a49d5e..629f83c37d59 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -835,9 +835,8 @@ static int sx9324_init_compensation(struct iio_dev *indio_dev)
 	int ret;
 
 	/* run the compensation phase on all channels */
-	ret = regmap_update_bits(data->regmap, SX9324_REG_STAT2,
-				 SX9324_REG_STAT2_COMPSTAT_MASK,
-				 SX9324_REG_STAT2_COMPSTAT_MASK);
+	ret = regmap_set_bits(data->regmap, SX9324_REG_STAT2,
+			      SX9324_REG_STAT2_COMPSTAT_MASK);
 	if (ret)
 		return ret;
 

-- 
2.45.2

