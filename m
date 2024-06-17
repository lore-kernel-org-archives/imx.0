Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127951D0526
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632268; cv=none; b=Bsw9yIg3/7HuoK9rsYUX7dIY5XzHtgfdUDcT3O2pvJBnTON37csbRW7dKWEwV5jDGlUDONrnmW6tlosKCOAxJPRSYxW21hw1UQdVF3zDWYM+Sq4bPbJyJp82mhUzhviYROPwM4IYcson8jFpRKKRlQbxO3lwpHJ+hMAvDY56Zxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632268; c=relaxed/simple;
	bh=z9RyjZU19LnLgrucgjYl1CZ1GaGyJEE70HiZ5+JD4QI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0m9RsH5vf+AGXcj+u8ZI648JDHKvdXY3oa9H46smYmKFhEKYtCjebr+ij1zhk38aLCkkaU4WAs6swkENZ+XvciMy14xHTagB5NCxq/RE3y/b67EQBh4WBH2/iC8TY+2PrAhMM6czpHI6hij6B05d+OrAeL/SFIYpQAonvP8ASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IZWv3DmC; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IZWv3DmC"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-254aec5a084so2101324fac.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632264; x=1719237064; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWd9RIrs8wL0I/TcIsG/QAgGB9T5+fxOkhv6E/dAdZI=;
        b=IZWv3DmCgF9OnDcMzHPRv2z3sXrJFbY77BVKsOVV1+6wm9F/7Dqt9G6sS1DbRzodfG
         5G66p7ZwMFvsyo+rZQbHp5mvEnjnH9SL0w+n6cThYEBFJdZ2uISP8R1SDremYQjcxTUp
         8Yuj1jowcGVtuwQssXTnLLJ1BEgEurNJT/2jaVz7kKOqc/ICWtxbXfF96ZA4ZmgyHBWg
         4GugOnrzkIH+nPntxntCj1edYvCX0f6azQvOoFQUEzGcJmrIZmyUIF2mq7GAQpDVKocN
         vZTUgOog3n6qQV5xXXbISuIKa5snAqLqvMsITwTCUYyLGaX4VYduZ/mL+SpYYkNMlOuV
         4tBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632264; x=1719237064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWd9RIrs8wL0I/TcIsG/QAgGB9T5+fxOkhv6E/dAdZI=;
        b=PBHdD4e12u0w1HxpS9NdRPjojUqWqL+kEwP4vLPltkLiGWA8/3JP3lkDr3+UxnXsen
         Uo928mIxkDNoEWrWW7RRXEaYaO7YkSjsaPdtiaSgaHAzW+hrAdUyjxtBHpTtC7xGeN/6
         tG3S1kKo/MOc9WgKT/u/Upsmpq8vd0xc0Fwl7H1zyTOYCViqYta3niMWLIV23EEZfB+/
         S+ht5h31WR3ruCcR1OJRRkcVp9gwizp9VxqGCX2yfVYC3BCnV6hOA5grqTNRDboAFWFa
         kwl/qqhl/GclLcFkcc/6iBR3dfaIeZyX+vViIRLf4/mmG8AK0D3BLq8oClBkUvHY45vO
         O/ig==
X-Forwarded-Encrypted: i=1; AJvYcCWTBO06Vv83/x/WdW4UM6P36qC0194fYQTRGcy62Nro1CdcNEfA6KLg/+gG0/xkAy2KhUhshBYKw0MB1m7VdLRzpQO9
X-Gm-Message-State: AOJu0YzTxaDZ+E85xz22dQhKwz581dCFWwxi639ZM+1WJS/4818sfceG
	emx2UQvq+rbe6ifFR05B841W/AsilQxOUeypiZrIeuBh/hYYp4YyklhD5JgurRs=
X-Google-Smtp-Source: AGHT+IH8uTWV+X4VQg+Hvv7+Ss0V04PvnK1VdmrqhUaV/+VFOL4UdwUlA2xHiJMwUxJKiw4xuPCudA==
X-Received: by 2002:a05:6870:15d5:b0:254:8bb9:d0bf with SMTP id 586e51a60fabf-2584298505cmr11157462fac.32.1718632264185;
        Mon, 17 Jun 2024 06:51:04 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:51:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:17 -0400
Subject: [PATCH v3 37/41] iio: proximity: sx9360: make use of
 regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-37-88d1338c4cca@baylibre.com>
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
 drivers/iio/proximity/sx9360.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 75a1c29f14eb..2b90bf45a201 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -672,9 +672,8 @@ static int sx9360_init_compensation(struct iio_dev *indio_dev)
 	int ret;
 
 	/* run the compensation phase on all channels */
-	ret = regmap_update_bits(data->regmap, SX9360_REG_STAT,
-				 SX9360_REG_STAT_COMPSTAT_MASK,
-				 SX9360_REG_STAT_COMPSTAT_MASK);
+	ret = regmap_set_bits(data->regmap, SX9360_REG_STAT,
+			      SX9360_REG_STAT_COMPSTAT_MASK);
 	if (ret)
 		return ret;
 

-- 
2.45.2

