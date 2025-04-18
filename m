Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA3D253351
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006410; cv=none; b=rY/TatkaBV1VDbgz7NGIp9gAKTSTi5ALeVun6UZnkACv5NUOcSFVtuic67bbMO6irP+TCaUtA9Rs97bQi+lT0eSnf0SKFUC1dVXohh8BhtBFy7mUlIyKR7Y0Y8SUuSBEVjxJM3Xk/K9cYFneuPoGhr1XcvYjeAfq3KGsnLIrUAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006410; c=relaxed/simple;
	bh=ARIVPfAYjojNb4iBMLsUhX2LD/OFISQyTpJFmR/jUmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mxaSeoMTDEodXlsKIiQwh/v/z1VARoEeTMn45e9dOgEoeeC6HUYELIfGrCgcmbM9KovLU7yqdQ4Ieg/rnlov2ox2EKxu8jU+VUuJATnDSbF7sWszK6KdzYFitF+qJR7chXonAyNNiZkf/Y9ezgsXhdQiQ9igevo3LSp2r1FTjoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GrAx9riU; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GrAx9riU"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2c76a1b574cso682144fac.2
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006406; x=1745611206; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDqqSLn17t5025nkyBHLLdQZLsyBrfKDeHjL9m8bNdc=;
        b=GrAx9riUNQbQqKYp/wjgjAqpfs3esL33l5pqeV5XXYYFWgK90H42EhVmFJcoaVqHad
         eDKXJP5hpZTyHrKN8AeAgyHJ/UY0y8wkezE8Zrxp5JSUFpGTbPAnMYzYde0qEAkV1ujM
         yYWHqQVmJNBbmcp5y+hMXEUYLAX/XmTYxNG438auNrjnzugdtV0wWy3DDxrQdbAPeM4T
         T/aVLRAdbAx3Cwp1ROmNLRPzZy9SrlXMSfQ3Qt2oYlYsrpeLxiAtC93BXoPEASS+A31Q
         OllooJ0qCqJYytynuyeBd44Yxd+qm6aB53L5o5V9uqMFYc0bzORPoP6Avof8TpoHbh/i
         7/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006406; x=1745611206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDqqSLn17t5025nkyBHLLdQZLsyBrfKDeHjL9m8bNdc=;
        b=TgwHkBSZk6XzXEYk/QFosOTmofoGYg9hz/dUgA9jxOgesODwUTpaoQ2fnT3UhXi4yt
         NgUal/VqepSnJtoF0nXSN5xXPz4V3tBFvkn4YT4mz2sal8OmcehtDqM7GHM2eiXjwuOo
         E9CCgWiL6Uu3zgIf7zptxwYfJzMwl21yqLm3vfrE1Q8Ms4I4ifimUbcD2j9mQwGL9dXN
         GaNu7sVLBykallnHxQLwLsLQvt7M0C/CMyjE2xBks4/PZljqn7VWLp5d8S2Q57nNlNlI
         1n0WwOIVccEHRjCGkqK/py7plgojXlkfKetWN6QCMKgPW9IU4/nEfYzLgSXXM+yUTgrS
         83xw==
X-Forwarded-Encrypted: i=1; AJvYcCXtmKQS6g4ija62tmN6TbqbJ4n0UOWKQ5HfwBcvbxtMlmazjnob0R9Mne5inyhMlbxcf2I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+KAp9ZoQwi5SZAsGABzPeVQmPw7GpaWol10sM/4o7WQ4ENnOF
	hVpeMyGRjNjG6SYrN9NxeAnHKHbVVIk9G/QXAH5ZFONf8xGsmn0kWJJ33W0CgT0=
X-Gm-Gg: ASbGncuVtf4a5YHcs/PVrzSp0dtMDgfZKD+/AiL9XJDdVaHbyHnRTU8lqn3sQ9ev1pX
	/8UVu+xNDVMI4Vd4eL3n4peQapNhF64zhKOMz5n+rHJg+dad7p0qFQV7ao3OaneM3L3ekv/MLg0
	+5F2Ke6qeJVa37zsiudqrlj/MbvUdk0yI4FKRR3Qk9+qXR+22zV9XWlQRAek17VYzD5nWjzbXot
	IVWrWB39jUlV3mXkgXs4EM7GcD3gJtP7tk6cBrw4QLxLYq41kPrrYFjrm3B+lnfLbhx4yAmH+Yu
	Abc9N89+gmG50CB64qGKhgtGMGxJNZHa9vbdo/SA8nDPlBZgtd+qQzh0pQ==
X-Google-Smtp-Source: AGHT+IGyvAhFlRCsX12Lhwr22tKkpHolc2Tt6LGi5+wwx4p3gTPOGLhHmLju7HF0T94FQvgvVlBiHw==
X-Received: by 2002:a05:6870:4413:b0:29e:6547:bffa with SMTP id 586e51a60fabf-2d526af61c3mr1982271fac.21.1745006406486;
        Fri, 18 Apr 2025 13:00:06 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.13.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:00:05 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:28 -0500
Subject: [PATCH 09/10] iio: adc: ti-ads8688: use struct with aligned_s64
 timestamp
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-9-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=ARIVPfAYjojNb4iBMLsUhX2LD/OFISQyTpJFmR/jUmA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8gnMqNGtdNT2ZIPYnYVdyTTiuNmSwk6ytsh
 TVb3PrODfaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvIAAKCRDCzCAB/wGP
 wBNxCACdVaOqC9XUOO3XNtkEYvq9VgXfioFD1KTARQagGK8F4RZ52Ql+vvMTIfwlpvJZ2gt1C6p
 2H95DFKR9LUWM73Oc2uor9X8qIw+B85vCeAZAV4Ux5UDRP16K0Q7Ick+F/d72GPdBKSM3cnPUAq
 wNHPB/7otHliUHUsABIkKUC45xghvbM3+0JbwXMEuLAcC0xgu3XU2XGzKcuqbj39kBioJKPOLje
 7uhR6CGsgbp8xEjN+n3V/Q9CdEC0y1JBy7RPnbUXTJkQiccRgPr7kgv7T+7V2Qm3YGDkxz7YnDa
 0zhX+IsfH+cnM/RBIpCAFz6Fa+Uz/hbt5JnBiJfw2/EJvSyj
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Changed from struct initializer to memset() in case the size ever
changes and there could be holes in the struct. The compiler generally
optimizes calls to memset() anyway.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads8688.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads8688.c b/drivers/iio/adc/ti-ads8688.c
index b0bf46cae0b69eb1fe8d7734c8a32ac642c5d0cd..2a9cb7d9bbfae4b282682d755992acd47fb88b99 100644
--- a/drivers/iio/adc/ti-ads8688.c
+++ b/drivers/iio/adc/ti-ads8688.c
@@ -380,16 +380,20 @@ static irqreturn_t ads8688_trigger_handler(int irq, void *p)
 {
 	struct iio_poll_func *pf = p;
 	struct iio_dev *indio_dev = pf->indio_dev;
-	/* Ensure naturally aligned timestamp */
-	u16 buffer[ADS8688_MAX_CHANNELS + sizeof(s64)/sizeof(u16)] __aligned(8) = { };
+	struct {
+		u16 data[ADS8688_MAX_CHANNELS];
+		aligned_s64 timestamp;
+	} buffer;
 	int i, j = 0;
 
+	memset(&buffer, 0, sizeof(buffer));
+
 	iio_for_each_active_channel(indio_dev, i) {
-		buffer[j] = ads8688_read(indio_dev, i);
+		buffer.data[j] = ads8688_read(indio_dev, i);
 		j++;
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, buffer, sizeof(buffer),
+	iio_push_to_buffers_with_ts(indio_dev, &buffer, sizeof(buffer),
 				    iio_get_time_ns(indio_dev));
 
 	iio_trigger_notify_done(indio_dev->trig);

-- 
2.43.0

