Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86122D789
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 19:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006389; cv=none; b=ojxhcmmyQS5GRq7EimekGn19yZw9YWYzbVqaxwHKZqKpKOaC5V07s187dSuSFXC/dPxOpzHUJ2NpsX9zzGjH/tugATcRGyVjh6pBC/dS6sCWCEHifn6MrOwuBDxQ40VqQMcawc4kvfd8rEti1oRhoszS1Nov6wWvWEnLwSkVHZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006389; c=relaxed/simple;
	bh=atzk3KgpYuN7DI/cmia/uI2CCnJShxRg4I1+4wGuxyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1ddQ6O9RvkxvvA//T+iIvyB9voTmPw8tVuZdE+rZ4lWqXNkytLaY0mPlBxbnLyGN41aXoYbkGvT20EPiFvuIwJxznbV/ZIxgPcjFJ2z3aNklOzVpicW0swxPSbNRlASCuIkb7Wq/9xyCAYGE2W1DfX6uFfq6wqUramrKLrLFtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PF7RcPuj; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PF7RcPuj"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so1719505fac.0
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006385; x=1745611185; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlDI/QLmlPJuz1yS/XHu6VU6BQuOeAxWmCMkkw2CqXk=;
        b=PF7RcPujcaeprHtOr70SbKcPbfNBQ2IywdA6MGLdeybCh1WIineAILo1/Wrp2j1rNF
         N2y6dQfGf/b3bVYwMesYQVLNkjk5y224n+pXGiFUQpHzRtS+anEMfh1svYV8sIPteHCF
         uNYKCUmzgoIlXSJyw1odmVvgr1z7UAVo/ezN4tqfhfGOArsPKEyO0vC5NzP1HaebibXB
         WnqWWW6ubmOzu4bgKfDptsTJomxMeb3Lnj7f/IJ++t3vEc8Ao5248LUJyJ6LXcO9Ojf1
         gBKEuBrxCDL4Gt75CGFDNr11TuBp2n6qxucq4fMMM4t0ZYeBEyFtVMAJV8Fg5IPr1SRZ
         ylKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006385; x=1745611185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlDI/QLmlPJuz1yS/XHu6VU6BQuOeAxWmCMkkw2CqXk=;
        b=gNt25FECB6ACxWNg6kp8IulUJWe6LLKUCJnzn9q0Ax+7S0jc7wkI1zDOm9qevTgPln
         iExeoh/lVipM9fgaRBuddzLwVZOE3btwDl9/5Im5Td67K8wSGEZ8PrXV6bbe9qp7B9KH
         x+I+XFBiydF53q5lHWE6N//YAvJOXdmsXXxDNQKXLCGQFyTXQ66Aq71gFMp4dVoXsTiQ
         EAcVvIGx4GO+7iRvIiutG75VHGMQBSUbF4Cat4JrkwADRTwoz0dP62rkDF3m69b/dOTA
         q9YXakTZ8U6lz6coQPctPL8JEyz//bt13E56EfmQcdwnVrf1/W4XY2SnWx9VKqnrpn6c
         aJJA==
X-Forwarded-Encrypted: i=1; AJvYcCW2P6xTnmZw4JjOayBhi0/Va/W9yWWuqCnDmObGxJSacdS+6WbEluncw+1qvSJ0w/Bv+0s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyP2WDKyB4o6zxV1DC3RGCr0hXJRVfI/Mt6BjLs7OqcMzCqTWPO
	jXJQC7fRFwExP9Zu6SwbelVfBLyU3xzy7bQmtxyX/2UqIEXjObuE4DQ4621ladc=
X-Gm-Gg: ASbGncszwr0gJO5FMyQcp9c3Rx2NEagRsFLGouuROx1NQhnOUqYJdbc7dEJGu5Qk1iF
	ODYXQkl1bz6jwjYfxNNGgxSLhOYALTXhrR3z1MHYQgM0MGQvbIR9GXbWAAAUd3IGikh0QruVEQu
	f55KBWpcACTq/+txs4z4U+vBTqaaLfhSDMvrYKrYATY8wCbPlY1BPO+2veTEwConzKRF7VDSufH
	kBzprMaO09AgYITAMBKMEXKE+uz9Ijz82Ui+4px38i3ChmMGqe9R6IPKBMJrohVoDLEy/pu5E9o
	MRrqQTYBrfoVA0FdTBpyjcPYGNx62DUi+dI9apFMJdt09ZA=
X-Google-Smtp-Source: AGHT+IEZLt8vJ+Vea+VdNW6U5TrIwsCbEZj5notcgMOj7WZyAPb2+50/gNm/PtPTqMubaQMXt78WIA==
X-Received: by 2002:a05:6871:2208:b0:2d4:e101:13f1 with SMTP id 586e51a60fabf-2d528764a94mr2112473fac.13.1745006385694;
        Fri, 18 Apr 2025 12:59:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:20 -0500
Subject: [PATCH 01/10] iio: accel: sca3300: use struct with aligned_s64
 timestamp
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-1-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=atzk3KgpYuN7DI/cmia/uI2CCnJShxRg4I1+4wGuxyE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq7pqs36/Uewg4GkPF0PtQe0BngPZ5CQYydvA
 pwIa4qdyciJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu6QAKCRDCzCAB/wGP
 wHfFB/9GtQnD4PldNnD2VgoEGzk7DgDePLxDOrYU32KN2nhp0QWkAaDNoNEYBhYQt2fv5gWVB9Z
 Xl15hL/X0IiIWQRQz0YQHmodc+DHZYkKl1DEl0fSOPzAHfvCGvbpGgRG+4Oi/RcZfLmeN1kcldK
 n12hAhtHqetBeEWIcKRs0mmQ/CiOAiWdd0XKJcRXQqdrIl578xkTzRhW8ZfgcDRJhO5REY+r49u
 G03D66fWWIAFlreYa769SW1MC9WJgtmcWExTXic/L5+NbF5GDRVAxt6cFwEUAnayJNtp/F1N/Z1
 EH5T41MtVfiXCOUB9ErI3MJ7H+yNku6IF9i6ZOXG3mKna/oO
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use a struct with aligned_s64 timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Changing the array part to s16 insted of u8 also lets us drop the cast
when it is used.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/accel/sca3300.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/accel/sca3300.c b/drivers/iio/accel/sca3300.c
index 1132bbaba75bcca525fac2f3e19f63546380fd4f..f04ad523f48abd598b1b2df37c51da894c0ce796 100644
--- a/drivers/iio/accel/sca3300.c
+++ b/drivers/iio/accel/sca3300.c
@@ -58,15 +58,6 @@ enum sca3300_scan_indexes {
 	SCA3300_SCAN_MAX
 };
 
-/*
- * Buffer size max case:
- * Three accel channels, two bytes per channel.
- * Temperature channel, two bytes.
- * Three incli channels, two bytes per channel.
- * Timestamp channel, eight bytes.
- */
-#define SCA3300_MAX_BUFFER_SIZE (ALIGN(sizeof(s16) * SCA3300_SCAN_MAX, sizeof(s64)) + sizeof(s64))
-
 #define SCA3300_ACCEL_CHANNEL(index, reg, axis) {			\
 	.type = IIO_ACCEL,						\
 	.address = reg,							\
@@ -203,7 +194,10 @@ struct sca3300_data {
 	struct spi_device *spi;
 	struct mutex lock;
 	const struct sca3300_chip_info *chip;
-	u8 buffer[SCA3300_MAX_BUFFER_SIZE] __aligned(sizeof(s64));
+	struct {
+		s16 channels[SCA3300_SCAN_MAX];
+		aligned_s64 timestamp;
+	} buffer;
 	u8 txbuf[4] __aligned(IIO_DMA_MINALIGN);
 	u8 rxbuf[4];
 };
@@ -492,7 +486,7 @@ static irqreturn_t sca3300_trigger_handler(int irq, void *p)
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct sca3300_data *data = iio_priv(indio_dev);
 	int bit, ret, val, i = 0;
-	s16 *channels = (s16 *)data->buffer;
+	s16 *channels = data->buffer.channels;
 
 	iio_for_each_active_channel(indio_dev, bit) {
 		ret = sca3300_read_reg(data, indio_dev->channels[bit].address, &val);
@@ -505,7 +499,7 @@ static irqreturn_t sca3300_trigger_handler(int irq, void *p)
 		channels[i++] = val;
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, data->buffer,
+	iio_push_to_buffers_with_ts(indio_dev, &data->buffer,
 				    sizeof(data->buffer),
 				    iio_get_time_ns(indio_dev));
 out:

-- 
2.43.0

