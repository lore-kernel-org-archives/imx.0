Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF231CB30E
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632234; cv=none; b=VglthG+Rb7lBOibVz8HZCW5R8/bndCG0cq/LaKnXiHEr/ubeya9nmzicN+WIL6I9RTYEsSBvX0Gn1HDwg6mBqquCLfryofhKFg5ZJxqr1glWRtXwPYB7EHzdI5wWu6EQxHRdvz/stbUahywy3/Al4C8/XzgV6SS8tHDSH6ha/Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632234; c=relaxed/simple;
	bh=vYvxwaeOXd9WIOr0jyiodES08IYnBg0cNG1tIcDEAbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrpxP1Lx3YuJqA8fs2aO57OqsEyk5EDr0H7N5zqrxDfBwJN7xQO8hPIxXErbXQHZ/qyQzn6GsWgebMmTIPNknfjv++VE78JD44CTy5PkWZgf0KcoPDWUJMu62RnVd7ACXnvIh4Un0M9et7VcfYxA2i3d+EDlji0n4RVM9aUFees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=S2GCEZSY; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="S2GCEZSY"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-24c9f6338a4so2178492fac.1
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632232; x=1719237032; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPhEFIEI65Agzd+gTNE/8pf9Wc0auEQHD6gWw+Mp2Us=;
        b=S2GCEZSYlRoQPL8LssNEmU8rYcM84lAskkMtzEJOhlx/ELKhDJ4ZJb9bYtCzimPNtg
         J5AYNQn/KMax9SyfqOaD2bY4yh2167Yugpl5I6dnEiMjrPykAC25b/HtKzcspYELQ2s5
         dopGJyk6doTrF7GaRiV1+SD8cu/OvaIvFHHxsy4qSPfGueDh8HwjQkkXTt+onnpmLkF1
         ySjaSYEbwPcC410R4cuIIib3GSkdnbgWlxgkb9GbzoP0N8E57Uj2D1aeOsT8vGVULIUX
         NyhnQGPBg4dKSkBojS5EZ31IyscVpQDy3UcoUye2Dw8VjNaYv+8miDJPD6Ku+CHAhaCg
         o/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632232; x=1719237032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPhEFIEI65Agzd+gTNE/8pf9Wc0auEQHD6gWw+Mp2Us=;
        b=oYNjnqGHIGk8AjzmoS2gFB78xcT+g+zDPaeWePLZRUzbXnyWWfGXxg5YeLVPa/VjdE
         fOIDGIdEXcCht91hOoLy0nrgZyFVviD7Ioxgwjwfn3O9gJvCcW6nUjn1UoHs2I9bdTEy
         lO36UU8amzIEAb4c5VUrXei9GQ0N2xMqA0gjl+ySnrRCpVHKNqLyNNWsuwslLbDKcG1+
         pDOxGy+2IiO1TyZ1z9qApmfoKioqMs0r5Z7MI8ZefKnmKiHualBMgHrtlUkUpRX+fswF
         7iTBkgoEF4TVGSF4HJwkQuLiXWpjZgww5HyI3Ni5ZYQBnmLtVRsmfFUIHKH20TK1/8nz
         lZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCUKEn37F7AfkTejlO+DY/Gbi5Orto3H+Ul7/O18/vegFm0BLazbLQ+eBVRpjbK+a80gu/ViKvMe7zPNKgHgboNblFdT
X-Gm-Message-State: AOJu0Yw3mHT6vHMtYm/iDZC8gYzZOLP5ETCSnkmVV6Ir4WhyKjbXqAim
	2bCl0TEk9P2bubAVxwzZbywNE9gK+/0GDCJPONTIdYB7TfwAMBW/uP80OyYJa1Y=
X-Google-Smtp-Source: AGHT+IESOlQlf6WzweXkTkf8MrnVQGCcG3xC67OqCrm+RTbQElgJSgw2YCA/KexywnTT/s9UGGqyWA==
X-Received: by 2002:a05:6870:c1d4:b0:24f:dd11:4486 with SMTP id 586e51a60fabf-25842ba209bmr11672904fac.36.1718632232087;
        Mon, 17 Jun 2024 06:50:32 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:31 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:02 -0400
Subject: [PATCH v3 22/41] iio: gyro: mpu3050-core: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-22-88d1338c4cca@baylibre.com>
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
 drivers/iio/gyro/mpu3050-core.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/gyro/mpu3050-core.c b/drivers/iio/gyro/mpu3050-core.c
index a791ba3a693a..ff1c81553045 100644
--- a/drivers/iio/gyro/mpu3050-core.c
+++ b/drivers/iio/gyro/mpu3050-core.c
@@ -197,8 +197,8 @@ static int mpu3050_start_sampling(struct mpu3050 *mpu3050)
 	int i;
 
 	/* Reset */
-	ret = regmap_update_bits(mpu3050->map, MPU3050_PWR_MGM,
-				 MPU3050_PWR_MGM_RESET, MPU3050_PWR_MGM_RESET);
+	ret = regmap_set_bits(mpu3050->map, MPU3050_PWR_MGM,
+			      MPU3050_PWR_MGM_RESET);
 	if (ret)
 		return ret;
 
@@ -513,12 +513,8 @@ static irqreturn_t mpu3050_trigger_handler(int irq, void *p)
 				 "FIFO overflow! Emptying and resetting FIFO\n");
 			fifo_overflow = true;
 			/* Reset and enable the FIFO */
-			ret = regmap_update_bits(mpu3050->map,
-						 MPU3050_USR_CTRL,
-						 MPU3050_USR_CTRL_FIFO_EN |
-						 MPU3050_USR_CTRL_FIFO_RST,
-						 MPU3050_USR_CTRL_FIFO_EN |
-						 MPU3050_USR_CTRL_FIFO_RST);
+			ret = regmap_set_bits(mpu3050->map, MPU3050_USR_CTRL,
+					      MPU3050_USR_CTRL_FIFO_EN | MPU3050_USR_CTRL_FIFO_RST);
 			if (ret) {
 				dev_info(mpu3050->dev, "error resetting FIFO\n");
 				goto out_trigger_unlock;
@@ -799,10 +795,8 @@ static int mpu3050_hw_init(struct mpu3050 *mpu3050)
 	u64 otp;
 
 	/* Reset */
-	ret = regmap_update_bits(mpu3050->map,
-				 MPU3050_PWR_MGM,
-				 MPU3050_PWR_MGM_RESET,
-				 MPU3050_PWR_MGM_RESET);
+	ret = regmap_set_bits(mpu3050->map, MPU3050_PWR_MGM,
+			      MPU3050_PWR_MGM_RESET);
 	if (ret)
 		return ret;
 
@@ -872,8 +866,8 @@ static int mpu3050_power_up(struct mpu3050 *mpu3050)
 	msleep(200);
 
 	/* Take device out of sleep mode */
-	ret = regmap_update_bits(mpu3050->map, MPU3050_PWR_MGM,
-				 MPU3050_PWR_MGM_SLEEP, 0);
+	ret = regmap_clear_bits(mpu3050->map, MPU3050_PWR_MGM,
+				MPU3050_PWR_MGM_SLEEP);
 	if (ret) {
 		regulator_bulk_disable(ARRAY_SIZE(mpu3050->regs), mpu3050->regs);
 		dev_err(mpu3050->dev, "error setting power mode\n");
@@ -895,8 +889,8 @@ static int mpu3050_power_down(struct mpu3050 *mpu3050)
 	 * then we would be wasting power unless we go to sleep mode
 	 * first.
 	 */
-	ret = regmap_update_bits(mpu3050->map, MPU3050_PWR_MGM,
-				 MPU3050_PWR_MGM_SLEEP, MPU3050_PWR_MGM_SLEEP);
+	ret = regmap_set_bits(mpu3050->map, MPU3050_PWR_MGM,
+			      MPU3050_PWR_MGM_SLEEP);
 	if (ret)
 		dev_err(mpu3050->dev, "error putting to sleep\n");
 
@@ -997,11 +991,8 @@ static int mpu3050_drdy_trigger_set_state(struct iio_trigger *trig,
 			return ret;
 
 		/* Reset and enable the FIFO */
-		ret = regmap_update_bits(mpu3050->map, MPU3050_USR_CTRL,
-					 MPU3050_USR_CTRL_FIFO_EN |
-					 MPU3050_USR_CTRL_FIFO_RST,
-					 MPU3050_USR_CTRL_FIFO_EN |
-					 MPU3050_USR_CTRL_FIFO_RST);
+		ret = regmap_set_bits(mpu3050->map, MPU3050_USR_CTRL,
+				      MPU3050_USR_CTRL_FIFO_EN | MPU3050_USR_CTRL_FIFO_RST);
 		if (ret)
 			return ret;
 

-- 
2.45.2

