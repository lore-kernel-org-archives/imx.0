Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D81B5838
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632190; cv=none; b=B5HEL6fm0ALW9RNCOTGwqgtgCbD7vaTZdJFAd2PrhSIMPUOd0ig0vQvTY1Wbu0AThgi6YwUdEoriGrUJqrmJYMumEIKQeo2XtV4vzhYcBK1qKbo7DETRD/DACC93JArr6zNQMTuN/tSdoXwGZi/usINB6+ZQyGcLk0SakiA8Ye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632190; c=relaxed/simple;
	bh=V5OVdhy+qCvjDRbv3yGURnLSWDE3JAmTDMZiE2ZFhuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vj+kjy7PEIWvQ+ryieK/xG8zW8OiUPUyFdLMDtvipAmNrJDhxKUGQvH1NAMRDgQjWQqO+XRCSkv5t+i23/jYuu06mRAX954uWcYAQj0S3GnthWFGkdCqpddSsyq7arsMdqVGO9xF5CUNdNNQIgGTiw49qNW+H86fZ5/NqwrnfLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=21WOSPy5; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="21WOSPy5"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-250c0555a63so2163741fac.1
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632187; x=1719236987; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOw9ZuYF7yVVJfGh3LeTM6VDPH42QqBSzznALZp99zM=;
        b=21WOSPy5jOdGHEa8ADN9MG4UcBEILK1wwG2VcOe3knogcZMhJTh6jDgoL78jlGCrJW
         Uh/tchRQTysTgKA74FYtIxxD9+f5m+n9YbewPILIbzlLLd+3YYX+uuvFmeIZsuHg7vWM
         MZqZmZW++1zCFcOntD1aiT6Rrs7Nqy4UBPD6SSBA7BbVmCt86XsPHZhq1SRWHk3uJcqw
         xoDDJXJwFQgSflxoM+6vENFY7hvkKQz+ZNoLQG9pAxF4jsvxv05RAGdLddb0sFOj++yg
         s8mufBlhmZ4CJ66BkWzrVa82n7eVr6wtrFFEpcLUqOeZ0msfnbaVxDwSQ2CWuOR95i47
         lE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632187; x=1719236987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOw9ZuYF7yVVJfGh3LeTM6VDPH42QqBSzznALZp99zM=;
        b=Qk5SNvIKgav4vtezH/frtF/tl36Fk6PJNRRLpHCFWRr/erFu2ova7S/Bn6lECNvqiC
         P7pmoRp97XD3CJ8dKsWvfoqzqeXzGnEJafdUGLuj/mLaIEv71S3MG6LKokRKuRMTxChk
         iNbAK8CTksgYTl7XEvc9u2limjXlgeiue9ifATlx9ab84vF0RDLpgBlVfSQxH8rzemWQ
         W6pVt7YLdWxOlbN2b7FVtdT1GGrOTzi4yGQA+o2nMcSHXaYPzHZjecdqRdKGf2o1hkkq
         004igh4a0Uav+YHYpGt6vM7fNcxdOkeLOJHu+VSJS7Y1kHOzZC0YGr/TMyhTHJeeJ+PY
         ygMw==
X-Forwarded-Encrypted: i=1; AJvYcCVQY8vkjp4JPpaulBOE5jhLAy//rFBIjGS/laSz7JL8F2gB/BcVmPl5AXSB+c/J343YJ2scMG9cfdsFqfXXxqM13v5+
X-Gm-Message-State: AOJu0YyWZ03EYMQJStLftlcfyMkcrz3RUYoDSHIplGHzAbVml+ChSn3r
	HGEnAfqjmUi0WDQuueE/cSmuYNlGq0xqxy5TpbOE/myjAlP7x3Zb6V2f21w76vE=
X-Google-Smtp-Source: AGHT+IFJGSJ8d0p4WXCzz2NyljOfF1k3KjSXOWFFs3OCSrxLmfdmtEDsU18y1hD0hfEhjyu+NXEwMw==
X-Received: by 2002:a05:6870:8188:b0:255:1bb8:85ec with SMTP id 586e51a60fabf-2584288e46bmr10661973fac.12.1718632186790;
        Mon, 17 Jun 2024 06:49:46 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:46 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:41 -0400
Subject: [PATCH v3 01/41] iio: accel: fxls8962af-core: Make use of
 regmap_set_bits(), regmap_clear_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-1-88d1338c4cca@baylibre.com>
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
 drivers/iio/accel/fxls8962af-core.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls8962af-core.c
index 4fbc01bda62e..d25e31613413 100644
--- a/drivers/iio/accel/fxls8962af-core.c
+++ b/drivers/iio/accel/fxls8962af-core.c
@@ -228,8 +228,8 @@ static int fxls8962af_power_off(struct fxls8962af_data *data)
 
 static int fxls8962af_standby(struct fxls8962af_data *data)
 {
-	return regmap_update_bits(data->regmap, FXLS8962AF_SENS_CONFIG1,
-				  FXLS8962AF_SENS_CONFIG1_ACTIVE, 0);
+	return regmap_clear_bits(data->regmap, FXLS8962AF_SENS_CONFIG1,
+				 FXLS8962AF_SENS_CONFIG1_ACTIVE);
 }
 
 static int fxls8962af_active(struct fxls8962af_data *data)
@@ -785,9 +785,8 @@ static int fxls8962af_reset(struct fxls8962af_data *data)
 	unsigned int reg;
 	int ret;
 
-	ret = regmap_update_bits(data->regmap, FXLS8962AF_SENS_CONFIG1,
-				 FXLS8962AF_SENS_CONFIG1_RST,
-				 FXLS8962AF_SENS_CONFIG1_RST);
+	ret = regmap_set_bits(data->regmap, FXLS8962AF_SENS_CONFIG1,
+			      FXLS8962AF_SENS_CONFIG1_RST);
 	if (ret)
 		return ret;
 
@@ -830,9 +829,8 @@ static int fxls8962af_buffer_postenable(struct iio_dev *indio_dev)
 	fxls8962af_standby(data);
 
 	/* Enable buffer interrupt */
-	ret = regmap_update_bits(data->regmap, FXLS8962AF_INT_EN,
-				 FXLS8962AF_INT_EN_BUF_EN,
-				 FXLS8962AF_INT_EN_BUF_EN);
+	ret = regmap_set_bits(data->regmap, FXLS8962AF_INT_EN,
+			      FXLS8962AF_INT_EN_BUF_EN);
 	if (ret)
 		return ret;
 
@@ -851,8 +849,8 @@ static int fxls8962af_buffer_predisable(struct iio_dev *indio_dev)
 	fxls8962af_standby(data);
 
 	/* Disable buffer interrupt */
-	ret = regmap_update_bits(data->regmap, FXLS8962AF_INT_EN,
-				 FXLS8962AF_INT_EN_BUF_EN, 0);
+	ret = regmap_clear_bits(data->regmap, FXLS8962AF_INT_EN,
+				FXLS8962AF_INT_EN_BUF_EN);
 	if (ret)
 		return ret;
 

-- 
2.45.2

