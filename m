Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5E814A4F4
	for <imx@lists.linux.dev>; Thu, 25 Apr 2024 15:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714057417; cv=none; b=tPN6ZGfZaBy6pDdcMlz2fc9awVPEcqE7S679kFLxoyJukp4wr67J7gj1FKSrUOQqQY8ECxEGYoQG98jm2bmL+jPgndvMCKS13HXDWwuizpGRw/saQGxq1rYTpmwdLNAz7c0oxeHClSQt4bpDOCKjs7QkuPyNp2tizB9t0c1npxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714057417; c=relaxed/simple;
	bh=Tsa8/Wzig6FNUfuFlRIUELjsQKPsOH3Pulp9FrfGw6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nnPK+F6YTr6AFVRogf4W5evm/GUNWofhZfYfwjOcyEl5EePfEYZronmIqBVg39IOTBTY9ZJZo5WObZlieYs6g8AsrEJXBX8/9n8zBEZ75dGTqodIAaYpkAhfumafPxsZLAy2JZ9N5SU+p4WswjvNs047lGSiU6rKvrKtDzjKt+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SPM1uHex; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SPM1uHex"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-23333ef4a02so682902fac.1
        for <imx@lists.linux.dev>; Thu, 25 Apr 2024 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714057415; x=1714662215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHHT3V3NAkn80zT3ZwzVgbMDW8DV/51JYCXCI4YMBAU=;
        b=SPM1uHexnEBhOSVWka1X0eqblTuy3ykmHmW+JiwgDQaKeedbL2p/xyRAsEdVCiMygP
         qt6HmtQRXY8Os4U4A8d8PtKVgaBm+yU8T3hclaMV1kch4U9wb5m4/wHOcoX80JF2j+/7
         fgCqiR1BdK8k7n1bBhHTnlfAAYJPiD0LhGrHX25XtA1aTgZxpppNRr2eWUmSDNu/LVmt
         gwaHjolmSRBPpvkyXLOZ3ObaiBDJFldQ/P3Kbf6VszGydijQr+Cad52OLjpNBKjC0ET3
         KmpwnhAQwLWP9KxkK3DDq4PZmXzfjZeMm8KzMJ3QO39LlrllPrAs4tEYVHiT3hKJj6Xg
         de1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714057415; x=1714662215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHHT3V3NAkn80zT3ZwzVgbMDW8DV/51JYCXCI4YMBAU=;
        b=wLEjAmh7iJkVhCdINl/7VUZE46LUtIjpZcpUEw22MhrQh0QL3kXUlgNY/9v/RRubKI
         i3QSI3t9r4ZcFUmF0uJvl8Wqq/W6PsqZShOzolCFDahnu+wpCC67hIM6nKxMpTeM7Qeh
         /bgMzPtVyH5NFRAGPlnzOUk9sE9X/xggwogEIMqSbmlenKjtDPH53wZAX5V7waPH22yr
         zqIA7j1inQm/U68XfpJH00PP/F+rf7Dx3D2V0iV/jCgRB4scn9vk/agL7DWbWEBw5iIu
         /KoDIhidFPMhSqvQp+jYtiWDvUvb9ZgIMf8Tt4EkWyi+ufnO4V27tiyHfyaj0l5vndru
         MEFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+OdUQLL061Ffav7U9MLuyo3OacEDlP1l5+17eo88z9avQddsY4fK6t4mHU362It7Viru9PL4I6zNsqVadv53X2/+Q
X-Gm-Message-State: AOJu0YwWrTfTZfUy3P5S9U6n07dTisJyxNQLBysqMmlQIP+/VDFHqZVt
	yaLIgXLSQuUQC7dMreJT8bU69dnCOQgmkryhgWM/1SFMyd5tR7qkzsi8EjzYQiU=
X-Google-Smtp-Source: AGHT+IGKUzbiZmA4xkuzW4Obu31RHZOeYQIUKpUb81CCZ1vyHCvuVjk+AQ/mnzT8PDS0gPeY3MKOiA==
X-Received: by 2002:a05:6871:b13:b0:22e:c787:5fa2 with SMTP id fq19-20020a0568710b1300b0022ec7875fa2mr6465784oab.58.1714057414871;
        Thu, 25 Apr 2024 08:03:34 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mp2-20020a056871328200b0023b6d4723edsm166739oac.14.2024.04.25.08.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 08:03:34 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] iio: adc: ad7266: don't set masklength
Date: Thu, 25 Apr 2024 10:03:27 -0500
Message-ID: <20240425-b4-iio-masklength-cleanup-v1-1-d3d16318274d@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240425-b4-iio-masklength-cleanup-v1-0-d3d16318274d@baylibre.com>
References: <20240425-b4-iio-masklength-cleanup-v1-0-d3d16318274d@baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

The masklength field is marked as [INTERN] and should not be set by
drivers, so remove the assignment in the ad7266 driver.

__iio_device_register() will populate this field with the correct value.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7266.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/adc/ad7266.c b/drivers/iio/adc/ad7266.c
index 468c2656d2be..353a97f9c086 100644
--- a/drivers/iio/adc/ad7266.c
+++ b/drivers/iio/adc/ad7266.c
@@ -371,7 +371,6 @@ static void ad7266_init_channels(struct iio_dev *indio_dev)
 	indio_dev->channels = chan_info->channels;
 	indio_dev->num_channels = chan_info->num_channels;
 	indio_dev->available_scan_masks = chan_info->scan_masks;
-	indio_dev->masklength = chan_info->num_channels - 1;
 }
 
 static const char * const ad7266_gpio_labels[] = {

-- 
2.43.2

