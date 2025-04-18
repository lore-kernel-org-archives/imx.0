Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A237022D789
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 19:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006392; cv=none; b=TqNSVdHBb8TgBRUxHtkeHZBEybOMoXMcpnRM61rl+6+xUC5z5LMO49lqP16S8GwIZmB8JY1vMzZBqw7BkzypGJUFUV49dGW6JF+KNb7hkMxlsaIT65xw0tl5agNcWihzZ8ziGOgbY2HccTxGhYDBzY+mI3bU+GAbTLWXYBtUlQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006392; c=relaxed/simple;
	bh=uGEGli6agFbSIEZPgrYVG1FE8mDYaDMCfJyp/lazgiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZTNzIYn+3BElxY7TDb1zH+16tGM/a0cKJScrOcx5Imjlp6gKg+iImF2nTiJB08gnrMILhayIcLHRMJwfcDS7WegADeaMoWXFi1WW6xExvucmj+EvugVRqr6YAMNACL28urEARNabfemR+oyS39iK4aN6couSBqSRAabSkW6p4q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UrqIF3GZ; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UrqIF3GZ"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2c2504fa876so586691fac.0
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006388; x=1745611188; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ksSqxXQXgKq3MEdL/jjg1tyq7wfP3KlJsiMdvfm/kDA=;
        b=UrqIF3GZTQ67CuZtZSmjdfJqMz2gBpkYirk+o8RVJckm0+6L74OP53uffkjCXeu+DL
         WQIZAw92tJIyG+UkcTqjV2tcplnTC+hBoz4dydcenFyh32gVwWl/OWttqNBBkkYBZHLo
         oBTFL8Wa6NNLZYlZSXHmPRbg52jdhla9R7ISm4kbee2sTqvT2E9p8ZPgXKhVJDJc8Bug
         /pjVfs1XsrZ9WYkX86iwz6jWYGyGXmfY+Pa4K2Ub4ZuNVbXvdJ7nVvkd+/Opx3YJN4Zm
         QKnE5BGSA5+ZGD7NM0Ww36+q7Z1UhENLQv2JRgdDFDr3l252L6txrmPM2tAbblpzCiLS
         bczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006388; x=1745611188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksSqxXQXgKq3MEdL/jjg1tyq7wfP3KlJsiMdvfm/kDA=;
        b=d6nUBiko0/umwQWF20SYrEAlUB76z4QLpLH9RjpqxIvgWh77yWOEJgOK0LdUfTxmPE
         5wRFeg2SZcRaxZ4qZiygcUdgnZ4X1muc5yfQw3EZmt2i+ww4J6UYlAg2AzWCa5YoH15y
         hxG3qEGdPOxrrMrutiZWpQq+hmlGf8KPYr6UDCIzXWoU87dAVDRWqwNsKHf6rm9gbL0U
         bifSKF2FGE3syP3Duszzmj6hzihreC1DwUmSrvHu7O8YLM3q2eGq3iU6WvXbvAhCfT78
         1MTDHyDi9vsZnRjhkgJzamaxEIBzx9vPW/I0aRlAg4JJBhIGtG2lez0lXNUA7RyEa9Mm
         CZww==
X-Forwarded-Encrypted: i=1; AJvYcCVaVHf5l0ksdWB6HTgz+tYwEegXVfBlTXnAE+Lf3Qh/8PiKoqgt6KeE8eBuBwow+1ntSb8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyllJb1I4HsAx7j7eAXqS8YNZFQttnoPP+tBgyFhFclvsDenhut
	wl7dgdoCsO/shqwRe3zIvJ1d1ImFLSXZFijS0Zss2S7gbCmvUSlH+/DpZ7r8WVcVGVGcVXup6u6
	GpJ4=
X-Gm-Gg: ASbGncvZvCTT3NnXMUbjiiaOSILpzpIoJVk6caojtktxBKP9WBAxtqRX238xm5Bq3j1
	haonmIH+zMdyNFkK+NYOKIG3GeCGeKhJIlCAsdO7qH6BA47W7GRSaWJ58Ht03VIQUolbGCEhUJf
	svekI1XTirrQM1LcHtS9AK27NwAGHcQO1L2BmbfADujsyvDFRKXBLYfiPN56X0DAyUi2U3Xg5N5
	9G+NROOIA+SCuFMEshI+PVM2VI+6d1ENqTiwA8+0ABXwdA7iibjLfSUsnYbfu59/UE0eNbSG94K
	BBSy9lN54fNAUOSqB+BOTkoinRV0MLgeCCfR6Ns20w7UtEI=
X-Google-Smtp-Source: AGHT+IFj8rQZMZvtPmVYvlswaBgMb9r1fm1cQCciAYKz5X9YEKQwhLXdNPStKbPWJNkdDXJj7/qY+g==
X-Received: by 2002:a05:6870:9e0d:b0:29e:671b:6003 with SMTP id 586e51a60fabf-2d526e0b311mr3083100fac.32.1745006388641;
        Fri, 18 Apr 2025 12:59:48 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:21 -0500
Subject: [PATCH 02/10] iio: adc: at91-sama5d2_adc: use struct with
 aligned_s64 timestamp
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-2-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2897; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=uGEGli6agFbSIEZPgrYVG1FE8mDYaDMCfJyp/lazgiE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq7vX8GGgAAxPwrJ/N9bdFji+tUrDObD7oWs0
 DvLOxngo0WJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu7wAKCRDCzCAB/wGP
 wPcDB/9Rn9JB9hcWF+vXoNFbgTyeYaeIohNCTpSNvM8pHIkYDyV+bTUeYPRDtYP+ubhiUNbAVy3
 3VZ841HJG9nqewSUOCOlBAE5AkziGAUm5bSrkL5ifXr3DSLzxkPnrQ3Ao3AiutbhF1sclOUJ3ye
 nheGCoAyzEluF3FJD2g70v8IDaD6bh6vaEe2yMQL8BSBuuaP5NZQw8HIM6Ek1xhsC1GWZ86urbo
 8Xxzad8bX2Qv8/zWuuH7qTCszseLNJdsXQXnyGDF5WJ/xCTvHU0VOpfaB/PB1RPj58Y97aA9QDD
 PTkAvQX6xnNlTfsPVMqA6uDJtbSh6vQzTQnrXLTEGHqPBUM2
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use a struct with aligned s64 timestamp_instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 414610afcb2c4128a63cf76767803c32cb01ac5e..07ced924f7a6ae36fe538021a45adbf7d76c2e69 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/sched.h>
+#include <linux/types.h>
 #include <linux/units.h>
 #include <linux/wait.h>
 #include <linux/iio/iio.h>
@@ -586,15 +587,6 @@ struct at91_adc_temp {
 	u16				saved_oversampling;
 };
 
-/*
- * Buffer size requirements:
- * No channels * bytes_per_channel(2) + timestamp bytes (8)
- * Divided by 2 because we need half words.
- * We assume 32 channels for now, has to be increased if needed.
- * Nobody minds a buffer being too big.
- */
-#define AT91_BUFFER_MAX_HWORDS ((32 * 2 + 8) / 2)
-
 struct at91_adc_state {
 	void __iomem			*base;
 	int				irq;
@@ -617,7 +609,10 @@ struct at91_adc_state {
 	struct iio_dev			*indio_dev;
 	struct device			*dev;
 	/* Ensure naturally aligned timestamp */
-	u16				buffer[AT91_BUFFER_MAX_HWORDS] __aligned(8);
+	struct {
+		u16 data[32];
+		aligned_s64 timestamp;
+	} buffer;
 	/*
 	 * lock to prevent concurrent 'single conversion' requests through
 	 * sysfs.
@@ -1481,14 +1476,14 @@ static void at91_adc_trigger_handler_nodma(struct iio_dev *indio_dev,
 		if (chan->type == IIO_VOLTAGE) {
 			val = at91_adc_read_chan(st, chan->address);
 			at91_adc_adjust_val_osr(st, &val);
-			st->buffer[i] = val;
+			st->buffer.data[i] = val;
 		} else {
-			st->buffer[i] = 0;
+			st->buffer.data[i] = 0;
 			WARN(true, "This trigger cannot handle this type of channel");
 		}
 		i++;
 	}
-	iio_push_to_buffers_with_timestamp(indio_dev, st->buffer,
+	iio_push_to_buffers_with_timestamp(indio_dev, &st->buffer,
 					   pf->timestamp);
 }
 
@@ -1643,7 +1638,7 @@ static void at91_adc_touch_data_handler(struct iio_dev *indio_dev)
 			at91_adc_read_pressure(st, chan->channel, &val);
 		else
 			continue;
-		st->buffer[i] = val;
+		st->buffer.data[i] = val;
 		i++;
 	}
 	/*
@@ -1691,7 +1686,7 @@ static void at91_adc_workq_handler(struct work_struct *workq)
 					struct at91_adc_state, touch_st);
 	struct iio_dev *indio_dev = st->indio_dev;
 
-	iio_push_to_buffers(indio_dev, st->buffer);
+	iio_push_to_buffers(indio_dev, st->buffer.data);
 }
 
 static irqreturn_t at91_adc_interrupt(int irq, void *private)

-- 
2.43.0

