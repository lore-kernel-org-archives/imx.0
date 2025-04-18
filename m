Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E686DCE1
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 19:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006386; cv=none; b=e/zDyyPP7KBzfLEDMdq2d5QHtksZ5VqzVgOxrRy41ln8vKGMitau7sHu/W1fMWM2Gf72TWSo/O+vKDCe6wU3TD9Xc/AmeQ5iGz3g6HbssEpOG+ITJ7Y48OVXANxZ3wCRrcwYkk2kIdvPty5P6jBpY0NCDKiJeBDUTwVY3y1bJTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006386; c=relaxed/simple;
	bh=UBqn5bW8JlebHL48mzy3xeZcYGQz9C2ibThs3AwnfeA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WKsOtZs4JVj/caFI46GwCNWHIr5eQ33Rd8GhdVdEgalhxVuKZHz4TezmzEiKWoCXdUs/7LoC08696WobKdmzrp3L1jRhedKNVR859VVUwxLCXZXi2JmGI7mmmEyPp03lDchIE2cwf+5aVXdOIKK0FeSbqMOGjzeBoL6isATIEmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=n279C1YB; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n279C1YB"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2c7e5f7f0e3so615391fac.3
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 12:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006384; x=1745611184; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YmmSWVD/KnfQRR0lXdQfI2NY4p1aeZqi5eQuD3R6P3s=;
        b=n279C1YBcKD/dZNO0vG7/jspPAJUJSJVRUjo4RzMrS3zkZrcosVaweU0FkY/JJEgRW
         HbuKb8Ms9B1C3PoR4MtsNT4JQ2pfSE5e2FBeM0DO+CR7DvQM984LHGi2DuXOSdh6lWre
         CDnTbJA3vsLVOC49qoohWXbUgseZ/xYu0FuYhiM2SgiQR7OVy5I/cG7dYhgZDhOeT2H8
         bjM7uCxe67OyvOEqZ7cRgirYOEh/xPPonPhO6s+X/GRfe3tfZo7Dnb23JPgTQxr6KHEX
         A3kN6CgU0hvtTyMVV1MUSJ9EWNYeMEzG/W1h8GmPpfXpvkQkmpOk9nWijR+0a8akCHdE
         qpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006384; x=1745611184;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmmSWVD/KnfQRR0lXdQfI2NY4p1aeZqi5eQuD3R6P3s=;
        b=Bq2MYCg7usiF5vqYFrS77a5RvEPPcuWp5Stj7uF6dBuzmhpTm4e//HF0O/1ZqyydEN
         N1iRxJ1fEicKN1OTbkugvTx+QqNOBrmALgilhETjbLPpeN2UvRU6Koh1O7SCsYUYx+uy
         081S3PvmQ4IgZSdjMsV9qADV9b2byf9TpQ1r0ieZ9JfhqIDsvv8mQFUDESAYf9DFh8Gu
         CW1H+caBxpNlyGWiwssMCO5EkPermM5RUsvSkHRfhjMzYY+HxfG5zRi2fwrKhaTfCrhQ
         RwezaTE/FAd5yp0k3szIHrzUpgvzMu7X5XlrqDulMQBXOxjTY6LYZa1l1jgl56EmT0Tc
         kmew==
X-Forwarded-Encrypted: i=1; AJvYcCXWOJZM9TbbpAlxH5Sc8W/gnEKTN46gNnugpEXljy/Vp64YdHA5nQ5Ktn2xN0yCo+8aHPc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtpLnzBTRoyORmFLijB8uciDfhFejTAMJKpX0hDUQNOZfTT+u9
	ZFlrlQoPlUiSMoxeYPeNVr6AzpMW9GwP5HIAnf90ROogBBOZfqDATMyFiHpYDik=
X-Gm-Gg: ASbGncuFWX2zrriEM8pSYZop7cO3jVnqpjZufjevylXhiiOC9YH3zTOX/vUKtrmF1M3
	Qr2+/gCR/fCBq++dBSy3o3qIdnhWlUmkZ1kLgA5tzBHDr5mS7pc758YgzBODEyjmLFiVZ0txCt+
	aiD/nKM2eJIKMwinNG/11bCRQ7bMjLjO788BQ99R2L1ElL9JldCPt1PQq6SEsXovxtE1x+nxWZw
	C49vX11K0JQFb6kqaCQFaZdTIre4gIF9ka04wpI81/e5IwgyIEzIG0vCqtEJPwUAxXkyiORuSA3
	zDNC5vL7q7ougUcGjBsFIrK0BrJG3MSgu4+6M6MOXeLf1oKvHXlXFKs3KQ==
X-Google-Smtp-Source: AGHT+IE1JV++hrIuNq9D0jBDQ/Srd/Ed37K3O3K1ORXsYIsyBfKxhQg+AMkCv8MVywxJHp/QiJCrhA==
X-Received: by 2002:a05:6871:d80a:b0:29f:97af:a1a0 with SMTP id 586e51a60fabf-2d526e52d74mr2078884fac.24.1745006383679;
        Fri, 18 Apr 2025 12:59:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 00/10] iio: prefer aligned_s64 timestamp (round 1)
Date: Fri, 18 Apr 2025 14:58:19 -0500
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANyuAmgC/x2NUQqDMBAFryL73YUoiUivUkoJ+tQHNUpWpCDev
 Wk/B4aZUwyZMLlXp2QcNK6pQH2rpJ9jmqAcCkvjmuB83Sm56pYxImt8c0oYXtZ63bnA9rhsOgK
 tRx+Cd0FK5ifz8188ntf1BWOJoylyAAAA
X-Change-ID: 20250418-iio-prefer-aligned_s64-timestamp-fee64ec55405
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2604; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=UBqn5bW8JlebHL48mzy3xeZcYGQz9C2ibThs3AwnfeA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq7iX3vVh6HbKghORnQaUNUs3qmv+Z7Wgd/GA
 jKkcJhJyz+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu4gAKCRDCzCAB/wGP
 wNK7B/oD9hYWgmMum8g2S3GqXecVvn47S0oXLC6LbK6795AZQkuclOHHYnzART6dICtWW+OsbU/
 53u8n5rr4nLwY1M0qnPWJjrh/SQnett1Z58YOW+zbajkwDAVxnnkb+PA6KC1QdLPRHlwr78+tFY
 RiBokIVauO+51eK8ktGUgxF75cdFs9iIPKi3d46uRh7RrpMzgC+vpVOH32B6m6UUY0L3S+EU9tj
 FIpn2YwXXei8wmFT15vzNiZ8YB3xvPCwILzuirKOJ0aY7WZTBA2hx3G/2FixxUc9vWOrcquoKy6
 IEo4Q3X5jLyvWmhxPiUfP7nxQqNqrrTNO4DD+B+TRc3Lv7Fp
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

While reviewing the recent conversion to iio_push_to_buffers_with_ts(),
I found it very time-consuming to check the correctness of the buffers
passed to that function when they used an array with extra room at the
end for a timestamp. And we still managed find a few that were wrongly
sized or not properly aligned despite several efforts in the past to
audit these for correctness already.

Even though these ones look to be correct, it will still be easier for
future readers of the code if we follow the pattern of using a struct
with the array and timestamp instead.

For example, it is much easier to see that:

struct {
	__be32 data[3];
	aligned_s64 timestamp;
} buffer;

Is an array of 3 32-bit, big-endian raw values plus an aligned 64-bit
timestamp than:

/*
 * 3 words for actual data, 1 word for padding for correct alignment
 * of timestamp and 2 words for actual timestamp.
 */
__be32 buffer[6] __aligned(8);

There are plenty more drivers where we could make similar changes, but
this is enough for one week of reviews.

---
David Lechner (10):
      iio: accel: sca3300: use struct with aligned_s64 timestamp
      iio: adc: at91-sama5d2_adc: use struct with aligned_s64 timestamp
      iio: adc: hx711: use struct with aligned_s64 timestamp
      iio: adc: mxs-lradc-adc: use struct with aligned_s64 timestamp
      iio: adc: stm32-adc: use struct with aligned_s64 timestamp
      iio: adc: ti-adc0832: use struct with aligned_s64 timestamp
      iio: adc: ti-adc12138: use struct with aligned_s64 timestamp
      iio: adc: ti-ads124s08: use struct with aligned_s64 timestamp
      iio: adc: ti-ads8688: use struct with aligned_s64 timestamp
      iio: chemical: atlas-sensor: use struct with aligned_s64 timestamp

 drivers/iio/accel/sca3300.c         | 18 ++++++------------
 drivers/iio/adc/at91-sama5d2_adc.c  | 25 ++++++++++---------------
 drivers/iio/adc/hx711.c             | 11 +++++++----
 drivers/iio/adc/mxs-lradc-adc.c     | 13 ++++++++-----
 drivers/iio/adc/stm32-adc.c         | 12 ++++++++----
 drivers/iio/adc/ti-adc0832.c        | 15 +++++++--------
 drivers/iio/adc/ti-adc12138.c       | 12 ++++++++----
 drivers/iio/adc/ti-ads124s08.c      | 18 +++++++-----------
 drivers/iio/adc/ti-ads8688.c        | 12 ++++++++----
 drivers/iio/chemical/atlas-sensor.c | 11 +++++++----
 10 files changed, 76 insertions(+), 71 deletions(-)
---
base-commit: aff301f37e220970c2f301b5c65a8bfedf52058e
change-id: 20250418-iio-prefer-aligned_s64-timestamp-fee64ec55405

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

