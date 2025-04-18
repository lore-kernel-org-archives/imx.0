Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8E8253324
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 20:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006406; cv=none; b=XQybYQPs6pUFiMkLppW3nTlTZc1lHIdAGnQbDKcuvHT6nAvKA8AIVWkfgVrjLVd9I9n+N4/Pp57E//VP4mArHH6uMDiMsKivOqp/8JUxcFLIboxNbKZnEN22xf3bd/Ca8g1VuVMVdcl7Q2MUhP9WRD25xjFqsdX74Q3Xwqz+Ri4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006406; c=relaxed/simple;
	bh=SKCpF0rSJSY06g0qoJ4XgXpVJV0JPJb8oLvnwY1CUvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGUyD9Ip1/kuPm4bLqHj6jKp/KIIFoMz+/ObhNF4wWZe+mPSuw2MBdmH3tKJcIaxXVHgwQa7lrwb47GmSNGh3PgKW3ScPS2CkY2jiapxDkKiyn46BBl3YhXdG0OY7/TrFrUZANLbfH4EeVNhT99HO4srtm0IVzINqb76RNL8sMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CDaL38UG; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CDaL38UG"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2cc44c72959so1281708fac.0
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006403; x=1745611203; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwEV6MZFJIchPoMNTCpHkxpHxz93usoOxoRUm2ZA0bk=;
        b=CDaL38UGhG1cZ96inr2oH7CkNRCKn+LF56OFUgRwStZEr1iW9kuZ+7k0u9436gF1O5
         Kf4S9tpEzTuDZ03zKA13V0yb5ELQWCfXiEBISj8uMOfBowG8mXxmQjaRUIQ9D6P/W1Yj
         Az9mtBUtcEdWsvYRY3qIkEIt2727yJADNz3cAQWAVeusJShzD/Y4ZRmmnmvHguammykQ
         MB8iY6EyA6EIh7+2x4depmx/T4kz8Kjx5WEw7Z2lu49ZoMoK2euE57Ks6o2uULgPajZ7
         wPqT+aUbmftLDUXiwfSDU33d5vfY+1Fz2tkc/u+/bQZzzJs6borcLeZs4hOucGlElXa2
         irdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006403; x=1745611203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwEV6MZFJIchPoMNTCpHkxpHxz93usoOxoRUm2ZA0bk=;
        b=ubswj3cgAflghZsv5SogXKE1m1vGV0pckfjpSHJ9ITudUhpQTOcQCsevYyT/Plrs03
         qZ83sVvpX/AUgOJXlSpE8AGhtbMeftcD0JpRcmSgMgKc/0OPTnGotZrPiaROBEtyTcP3
         0x2hPoJc3Yj7elKVCnaltJG7MGd5d7EhDQD322D2WX1MeJ1lREV/ulQdrHE+yAAYXhEJ
         kprHWw+1g572DhuSp5ViwFA7wB0e79rNO34K/4OSq6ocE1B5BFIXqMbbrL/xIaoPyM01
         2mVXLhB13wGwuGVqjAbekf+jid1VgDDliwOa0iw7AE4rVPICwFbkeEGS5TvWvYkwWdaQ
         QhCw==
X-Forwarded-Encrypted: i=1; AJvYcCVRABMY5gpHIlEWaIk5caYlbw9bmthEFkPHzRbj8Kzd0C34JceCxHRPeJ8JQcgXodP2+4k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNyyM18H4gJJB7lKe9u4PoDF4KgUss/2Vmr2/5Pin60Fc6KHnh
	2Z2lbaup8p9c7nr5U6hbMmw43EodZIsa3wpFm3SlZh/hI8mQ1t5snFPPBELB8Uc=
X-Gm-Gg: ASbGncvCFFITAfAVD9LozKwHbsQShqABkImSv8dTAuUGr1Y6lCmTxG8m0zoWMvhdhGL
	sJmdKTA2JhbHLqmyCYeY30Tlmzqowb0E+uTk+a9Vb4XXC7tjQJHEdGdFZMOPDZ6J5ZbLrrQADWV
	JlJ4qOMo5kmZ4k/n8WwIUO9PWCktr6x5VmxgiWZyZ92+mDWraE3g4PDf76Kh33ybi/+te8F/StT
	OIBc2LWTjxaNPv/7xu0kEZJ8xRuYXV89j+/HDVqfRwU4HzQM0Qhy4MsLnghB3ti/CFNjUKcRXnR
	/FKSyhQzePhaYzgnBPgoHQD5todnIQs41ptTzPboULlWh0E=
X-Google-Smtp-Source: AGHT+IGOnbfbgHvkykmuoWWumpe/zQvoKx6ZttBWLA1bqT+37tvAXi4z2gJDa6nDw9JVR42V4KG3Zg==
X-Received: by 2002:a05:6870:aa9a:b0:2c1:44a9:fc16 with SMTP id 586e51a60fabf-2d526ec9824mr2328947fac.38.1745006403477;
        Fri, 18 Apr 2025 13:00:03 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.13.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:00:02 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:27 -0500
Subject: [PATCH 08/10] iio: adc: ti-ads124s08: use struct with aligned_s64
 timestamp
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-8-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=SKCpF0rSJSY06g0qoJ4XgXpVJV0JPJb8oLvnwY1CUvQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8ZpjC92ceussgPgpBKBLXA1tO4DdY6Pfv+q
 jbN1Cv80eqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvGQAKCRDCzCAB/wGP
 wNhbB/419+xS1/MlezzwDnTGWqQSMnAh1Q2CLkNfdMRF68px0+3K710C9xuAgCWfWqc+HY4d/gd
 0Z6Ek4aSyCx9NVF+d9REpdeTCbkAjzL0yt1UBHDq7hsMFQOylHBCYJFxtxStm16dSE9AByAHWcp
 ztS2vlc/Dgu77OXzBjdmjGD0dhTrhCxBJHEAVudLPfh/WAoVrFRmc5QXkl5E57hP1EQoHD1p8CV
 iob437dhuhV1doZeSuFDEMRKbhsa1awJs7IRtPIZywjnzRwZ9s4wgjSYJSr0o+bYCyQ6Y1y1JLq
 bo67Oufp7S8gpeHG7/yyq/tHcStfArgOiFqPlRhGWaoDoT8L
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads124s08.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/ti-ads124s08.c b/drivers/iio/adc/ti-ads124s08.c
index 8ea1269f74db09427a4a8d434ba1d63e7c63d038..ecaffe83fcc911f99afbeae7ef51440d150bef73 100644
--- a/drivers/iio/adc/ti-ads124s08.c
+++ b/drivers/iio/adc/ti-ads124s08.c
@@ -98,14 +98,10 @@ struct ads124s_private {
 	struct gpio_desc *reset_gpio;
 	struct spi_device *spi;
 	struct mutex lock;
-	/*
-	 * Used to correctly align data.
-	 * Ensure timestamp is naturally aligned.
-	 * Note that the full buffer length may not be needed if not
-	 * all channels are enabled, as long as the alignment of the
-	 * timestamp is maintained.
-	 */
-	u32 buffer[ADS124S08_MAX_CHANNELS + sizeof(s64)/sizeof(u32)] __aligned(8);
+	struct {
+		u32 data[ADS124S08_MAX_CHANNELS];
+		aligned_s64 timestamp;
+	} buffer;
 	u8 data[5] __aligned(IIO_DMA_MINALIGN);
 };
 
@@ -289,7 +285,7 @@ static irqreturn_t ads124s_trigger_handler(int irq, void *p)
 		if (ret)
 			dev_err(&priv->spi->dev, "Start ADC conversions failed\n");
 
-		priv->buffer[j] = ads124s_read(indio_dev);
+		priv->buffer.data[j] = ads124s_read(indio_dev);
 		ret = ads124s_write_cmd(indio_dev, ADS124S08_STOP_CONV);
 		if (ret)
 			dev_err(&priv->spi->dev, "Stop ADC conversions failed\n");
@@ -297,8 +293,8 @@ static irqreturn_t ads124s_trigger_handler(int irq, void *p)
 		j++;
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, priv->buffer, sizeof(priv->buffer),
-				    pf->timestamp);
+	iio_push_to_buffers_with_ts(indio_dev, &priv->buffer,
+				    sizeof(priv->buffer), pf->timestamp);
 
 	iio_trigger_notify_done(indio_dev->trig);
 

-- 
2.43.0

