Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFD12505AA
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 20:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006403; cv=none; b=WDPiqn4g7D+bJ3WOZTtqR4AX2lqdBgAw+NWvM5jWU+CLF7VkACT2fOUYyDq0R0CBij3MQvX+HiTJlRI4zv/gVwOMSpWJ8o40ASqCT490g9Oxhs19/51Yg/laiqmTqnw/an9iqSnLMsdS21rCasBwbLvdbx/Hr1RdyVh1NKqz0Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006403; c=relaxed/simple;
	bh=s4l8P5OcPMgo24O003DNQ+152ZESYZRIhpn5OwsYUsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sT8oKBgmxFhfhj+jZBld4l0LTd7Cwgg9yOoMUiffhoHciXaAFeFP4/96W2zE9ZtpJ6TX2wzb7VyYx5vWUKJzzW3CnE/R6fFw6UJTixh3fvV4pu4rTS2x10vikg+/6tUc+cWVCbc3oitoF6HlR+wWz19NpN+wEHAX7w9hZF0kuaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KY5AdWPI; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KY5AdWPI"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2c2dc6c30c2so588828fac.2
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 13:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006400; x=1745611200; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rBDR1U//AMtHVJOkZ/ynz5adiM1MIpFrbiMNuOexx0=;
        b=KY5AdWPIbmkhROwfOh1ssFXm9ddv4bnrDAnP/JGRHvxAEWfNO1vvcD6Tr7Uq4Mes26
         die/9d+x3MImjz/BcTT91+I37SMzhRREcVK+7CPS6LA2RIS29T+rvrFn4rZTPVuHvdu9
         CTQkZSY1lAAb+IjbbOPcztdRIVQoyUumrOPo9qdSVK1F7OVXK2FNNDkCg1Nv9h4xuyAq
         l20YY0pJdWZfbykvdedVbaTNwbp8nA5DcIW/9zWoWyu8WUQn3mxg519MplZzlFIJQiWr
         r5SsVbJy5qBKKkZqazQrraJqAru/iAwndsoEz1IIcHzqS6ouyC3wI6TAK3wApZNLjqrA
         N2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006400; x=1745611200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rBDR1U//AMtHVJOkZ/ynz5adiM1MIpFrbiMNuOexx0=;
        b=wiVS1RacDMcYlKXh9vHvJHhRDlVYcL7WAwmp5TUgZsTqtI5DSV72OKBAuNN9fQghIQ
         uSdw3lUrC6txOqL9imT5nLM4Z7WXNGaHV+ajmF66l637uR9R3WMRP1haRmbqVp7AYQrF
         EIiX4TaOo3TmokLQBAuwUyOaUD3ozIWtCDIiXwrShdMPoKcllaU1AAlgqZil8NisuUgN
         4hcDPDlUlxuYOecIPergHy08beZlOQaqVZPcXGsgE3rwBZagMcRF0yp2+IlSGWvGrNCI
         bOsQKYwLJ3t8BU2hpBd28VVEwAO+maxssfrKenaQ5IrEgVqv1BiotBeqVSHVWcH127Zm
         e9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWMH3pHS6A7YiGp4xBUN+aP/VOiyQLBtM7r2GuaMNDwpMxEcKY5Mwd62qXN9NzkowzINl4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLMs/BLzpRvIQuZK/9FE4vWLWnCi2jn4lZa6OXjLhrhZiFylsJ
	kNDUgMtvZVk9c+6ze06MCeA+AnPBNWqrtLiyvX6zXYkJ3ueDDiH+IhYLsOg9rcw=
X-Gm-Gg: ASbGnctuFViIqlnSq4biyvo2i+F9sVsAcjB0jRuZTlo0x3jNTtaB7mr3ep6/w/W6mRp
	amhCJVyFKkytR6Qgd7Kdw/ueLF8dt6C/GV2X54ULWt6ZLzIVdv2DoiSMyjin79WFSPNQvwwbYup
	80aMg5MGPRa+nkH7QkahKvt+UVugFYC/IynicMLHlMWP5Vu5kz5cPitzT37MSOoV2VZgM6SSxnZ
	EpLmFpRFZ48cmUtjE/6ITaOhtoM06boT4ie18lNRHDwsJcSC/oOL6A+le5mDYBt5UqUplTaHWyF
	3hze0/Tf3uxO0aGprICxEvG7qFvF4AN1f4+3QuBJgNg1SxY=
X-Google-Smtp-Source: AGHT+IFESQi/ZfA50kegJe4RtMSS4PZyQ9d46ZiXlLlHIdLoF/HU+gKoBW8lEVWEJo4/bW8fFvnACw==
X-Received: by 2002:a05:6870:ac10:b0:29e:2bbd:51cb with SMTP id 586e51a60fabf-2d526d6e952mr2256820fac.24.1745006400470;
        Fri, 18 Apr 2025 13:00:00 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:59 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:26 -0500
Subject: [PATCH 07/10] iio: adc: ti-adc12138: use struct with aligned_s64
 timestamp
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-7-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2220; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=s4l8P5OcPMgo24O003DNQ+152ZESYZRIhpn5OwsYUsI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8Sfs2AclmrDLeJi56Pk//ih6Hw7R97L6d4q
 buJJAK8DOyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvEgAKCRDCzCAB/wGP
 wNv2B/9ot5lFQsMp+EgjDd/QqmcvuIydEgfUNbhAvAbPepUmk89W4MY9JTUT4zxZqWE11B6m2F0
 3zIVrrIDDZ3e56OlvCdt+U/BqUKLhOsnt7igGBmtKpP4ySz0oU2RYl8BXUeKuguiIw3XupttbFi
 Ud5X97R0RJStNPy0+C0JjSr57E5J3u491cFFhlTvKsUyIMaK6HYbPkpCBGv6hdWrAhBbiabbSc6
 alXYEmMVK+RiMRZLEJr6bRGjTVLLmbdbPxrlSC0y8KZMqtcCsp066Fsuz9VN4sGrWXrTyiwPLwr
 dyjbqaoUlUuymOoPka1GF4PxTtk/WfwzI4cG7/T/LHnfv+HX
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-adc12138.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-adc12138.c b/drivers/iio/adc/ti-adc12138.c
index 9dc465a10ffc8d9f596e34215af685999235d690..27cafc2954e8956fbd674eb2bc32c59980ffb746 100644
--- a/drivers/iio/adc/ti-adc12138.c
+++ b/drivers/iio/adc/ti-adc12138.c
@@ -19,6 +19,7 @@
 #include <linux/iio/triggered_buffer.h>
 #include <linux/iio/trigger_consumer.h>
 #include <linux/regulator/consumer.h>
+#include <linux/types.h>
 
 #define ADC12138_MODE_AUTO_CAL			0x08
 #define ADC12138_MODE_READ_STATUS		0x0c
@@ -53,7 +54,10 @@ struct adc12138 {
 	 * Less may be need if not all channels are enabled, as long as
 	 * the 8 byte alignment of the timestamp is maintained.
 	 */
-	__be16 data[20] __aligned(8);
+	struct {
+		__be16 data[16];
+		aligned_s64 timestamp;
+	} buffer;
 
 	u8 tx_buf[2] __aligned(IIO_DMA_MINALIGN);
 	u8 rx_buf[2];
@@ -351,7 +355,7 @@ static irqreturn_t adc12138_trigger_handler(int irq, void *p)
 		reinit_completion(&adc->complete);
 
 		ret = adc12138_start_and_read_conv(adc, scan_chan,
-					i ? &adc->data[i - 1] : &trash);
+					i ? &adc->buffer.data[i - 1] : &trash);
 		if (ret) {
 			dev_warn(&adc->spi->dev,
 				 "failed to start conversion\n");
@@ -368,7 +372,7 @@ static irqreturn_t adc12138_trigger_handler(int irq, void *p)
 	}
 
 	if (i) {
-		ret = adc12138_read_conv_data(adc, &adc->data[i - 1]);
+		ret = adc12138_read_conv_data(adc, &adc->buffer.data[i - 1]);
 		if (ret) {
 			dev_warn(&adc->spi->dev,
 				 "failed to get conversion data\n");
@@ -376,7 +380,7 @@ static irqreturn_t adc12138_trigger_handler(int irq, void *p)
 		}
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, adc->data, sizeof(adc->data),
+	iio_push_to_buffers_with_ts(indio_dev, &adc->buffer, sizeof(adc->buffer),
 				    iio_get_time_ns(indio_dev));
 out:
 	mutex_unlock(&adc->lock);

-- 
2.43.0

