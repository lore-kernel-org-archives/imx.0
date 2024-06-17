Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19781BD01C
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632206; cv=none; b=l3PCtdPmmp0YurvjFuKln8IwwhUesw/kUaQzALARVI5QsDNy8Hu16VG9Dt+oXObvidABH5T/59mp8Pn6OV1oQklaFEqB8uSl6xutxGjkJbY0xISQAoon32dLioTpV7fcMYZCDw3oEnnmtCrNy2FysDiEYr+IVkqRcTdvukXPDnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632206; c=relaxed/simple;
	bh=C6gfMUeKRh6vNiJAqdCzmX2JzDDgIvBqfFNnNfFuGtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvHEaDZ0dEfPPzYQg4KXsPpUqQsZdfWtZ8sJu5U/WfVTSQLo0hTTaQ9S4DJItu9VrrOh5d8or/OVbTQY6RGQXPbnW99/mjChSB0XspOpS76ofZvz9rBB8aXE1SKtHRzQYnqiB9fWO7zq93Df+q/Vp8tUGrrngI9IdTOKemQN4As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tBxBhg93; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tBxBhg93"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-795ca45c54cso246567185a.0
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632204; x=1719237004; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClhrI/fyo1cx6bZjSpXIGRy7tTTxclMqWX7+F4JU4yY=;
        b=tBxBhg93PegvN3+CjqfY9NxlsMW+8T00L8u8y63pw/mGMb8yFHv4Vxla7wLgxTyEdA
         5wO+rowcF+0YQm8u5lavZkBmITz2Ox2EwiVixlUQBbPxvOY4P1zRe7Vzm5G11P1sMODH
         tBz3oo88pUvo9Ec7IghR37dLnLkL2beS8g6b8LthsITh53u7poLrcwrU+xzG9lnSnd3T
         zoxWtB6h4s9vPEdNfM0VYhbh8Q0PmS5eg9tCUY3rVTVcxhy0wcwAB2sJEqpgCQPx733D
         YVp+Br2KnZYKj5BOO8Frc7eOkXvIyx1+XWSu7HpFMje0hpz4790gnviwqKHG3QrP68P6
         ZAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632204; x=1719237004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClhrI/fyo1cx6bZjSpXIGRy7tTTxclMqWX7+F4JU4yY=;
        b=AMxmnbm6cItCxezJ678f9Y1N/OLyyDYaCD9xlMEF73dB0PWX5l0ATuX3y/S0QJkxLX
         H77TRlcMxrz+pqtbCx+1eDaHhidinzPh6vNXtPtUUqIybosW1V/zczvLskYem/cu/hw8
         TVixDavbVF/F9Whk4Z2Ll0U5kKxaEJ7gD8gUJtkzkODFrVSBb1mkRtkY7MZw9GVV19Ho
         hqDmh3ZDpkytbytBXKs8VWDMrV2tNsOcAem6ChaojKmM1ctKMnYmv7ZU2WSDdV5cd935
         R1m8seXhpboekiQM0rLdDL0fyyau0sKHLEMUes4qs+bYdKGfMI327GA4eLymcrjphgTn
         R8ew==
X-Forwarded-Encrypted: i=1; AJvYcCUWtkGZ5ewGP4XdVnCJYRHA5DGEYMu1Zw6EiKDtV+/86AibrNKyPoXB2ud1TE/BE32WWLj+rxN/nKs+jeZuZZib/CGi
X-Gm-Message-State: AOJu0YwsIqM1dyTJzbTpy7qIwcmAV0SNxJsXtO8JLoCDdglLOb1cd7KB
	ElfZA3MHDaXX/Uzo2QOS/sOY2Y/Wca87u/vXrrEMo4L5rE0stX3EkyWxHqabAiE=
X-Google-Smtp-Source: AGHT+IGEJP+y4ORB/qQsSLGS1aQN67uw6XFJYR5D2HpTVdZajfNzX+EcKLbp10S7XC6/Qne2Ev/fMQ==
X-Received: by 2002:a05:620a:4721:b0:795:55a1:9dd3 with SMTP id af79cd13be357-798d23c4382mr1195766785a.16.1718632204033;
        Mon, 17 Jun 2024 06:50:04 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:49 -0400
Subject: [PATCH v3 09/41] iio: adc: cpcap-adc: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-9-88d1338c4cca@baylibre.com>
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
 drivers/iio/adc/cpcap-adc.c | 46 +++++++++++++++++++--------------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/drivers/iio/adc/cpcap-adc.c b/drivers/iio/adc/cpcap-adc.c
index b6c4ef70484e..c218acf6c9c6 100644
--- a/drivers/iio/adc/cpcap-adc.c
+++ b/drivers/iio/adc/cpcap-adc.c
@@ -385,9 +385,8 @@ static irqreturn_t cpcap_adc_irq_thread(int irq, void *data)
 	struct cpcap_adc *ddata = iio_priv(indio_dev);
 	int error;
 
-	error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-				   CPCAP_BIT_ADTRIG_DIS,
-				   CPCAP_BIT_ADTRIG_DIS);
+	error = regmap_set_bits(ddata->reg, CPCAP_REG_ADCC2,
+				CPCAP_BIT_ADTRIG_DIS);
 	if (error)
 		return IRQ_NONE;
 
@@ -424,23 +423,19 @@ static void cpcap_adc_setup_calibrate(struct cpcap_adc *ddata,
 	if (error)
 		return;
 
-	error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-				   CPCAP_BIT_ATOX_PS_FACTOR |
-				   CPCAP_BIT_ADC_PS_FACTOR1 |
-				   CPCAP_BIT_ADC_PS_FACTOR0,
-				   0);
+	error = regmap_clear_bits(ddata->reg, CPCAP_REG_ADCC2,
+				  CPCAP_BIT_ATOX_PS_FACTOR |
+				  CPCAP_BIT_ADC_PS_FACTOR1 |
+				  CPCAP_BIT_ADC_PS_FACTOR0);
 	if (error)
 		return;
 
-	error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-				   CPCAP_BIT_ADTRIG_DIS,
-				   CPCAP_BIT_ADTRIG_DIS);
+	error = regmap_set_bits(ddata->reg, CPCAP_REG_ADCC2,
+				CPCAP_BIT_ADTRIG_DIS);
 	if (error)
 		return;
 
-	error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-				   CPCAP_BIT_ASC,
-				   CPCAP_BIT_ASC);
+	error = regmap_set_bits(ddata->reg, CPCAP_REG_ADCC2, CPCAP_BIT_ASC);
 	if (error)
 		return;
 
@@ -455,8 +450,8 @@ static void cpcap_adc_setup_calibrate(struct cpcap_adc *ddata,
 		dev_err(ddata->dev,
 			"Timeout waiting for calibration to complete\n");
 
-	error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC1,
-				   CPCAP_BIT_CAL_MODE, 0);
+	error = regmap_clear_bits(ddata->reg, CPCAP_REG_ADCC1,
+				  CPCAP_BIT_CAL_MODE);
 	if (error)
 		return;
 }
@@ -602,26 +597,23 @@ static void cpcap_adc_setup_bank(struct cpcap_adc *ddata,
 		return;
 
 	if (req->timing == CPCAP_ADC_TIMING_IMM) {
-		error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-					   CPCAP_BIT_ADTRIG_DIS,
-					   CPCAP_BIT_ADTRIG_DIS);
+		error = regmap_set_bits(ddata->reg, CPCAP_REG_ADCC2,
+					CPCAP_BIT_ADTRIG_DIS);
 		if (error)
 			return;
 
-		error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-					   CPCAP_BIT_ASC,
-					   CPCAP_BIT_ASC);
+		error = regmap_set_bits(ddata->reg, CPCAP_REG_ADCC2,
+					CPCAP_BIT_ASC);
 		if (error)
 			return;
 	} else {
-		error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-					   CPCAP_BIT_ADTRIG_ONESHOT,
-					   CPCAP_BIT_ADTRIG_ONESHOT);
+		error = regmap_set_bits(ddata->reg, CPCAP_REG_ADCC2,
+					CPCAP_BIT_ADTRIG_ONESHOT);
 		if (error)
 			return;
 
-		error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-					   CPCAP_BIT_ADTRIG_DIS, 0);
+		error = regmap_clear_bits(ddata->reg, CPCAP_REG_ADCC2,
+					  CPCAP_BIT_ADTRIG_DIS);
 		if (error)
 			return;
 	}

-- 
2.45.2

