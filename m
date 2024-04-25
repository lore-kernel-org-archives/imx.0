Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A3414A616
	for <imx@lists.linux.dev>; Thu, 25 Apr 2024 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714057418; cv=none; b=G8o66b01FWRoEHWE5XkwPCYdG1KVyImZM3cuwqMYJ5fizmO4S/ob11jmHsYhTImgCzHfGtmQQi0hcqO/VUXcdXZT8uvo7O9WYG90A0rrTDFXBd64yPSI09rEYz6M/UU2hNg3mCgeA4snCn0+zwtfdksZpy8Ji4x7wZyz+5+tPWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714057418; c=relaxed/simple;
	bh=c0UVqkjMuNtarShlxI0bIDMYPsBOuAUJ6QeQyiAWEuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i7J+7WOQY+2tdd1YWOSzNE4ec0CDpoAFxPQ83ztNVyLTTMrB+cGaw/vHzSqMIc954DlPg+R8/KQ+IFB9XfBT47vVy1TXU6dsuv5x6L7qI58mcYkBlBJGKPDmizK10hK484B/FOK5MckpEPTY0MtvNd1GMzQlxs80sAv0TrcpQ08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Xz/BHl4p; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Xz/BHl4p"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2390335b67cso355549fac.0
        for <imx@lists.linux.dev>; Thu, 25 Apr 2024 08:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714057416; x=1714662216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuUgN+eqDnD1TSwHoUcLirGapuP4idukeuGNZ2DNfLI=;
        b=Xz/BHl4puv74JoTQXRE4A5mi2fAv9wAR/WXhblrI9t6cWmM+C9TDqykcWrDhO6gQp0
         IGv+iqMnznDDqZclmgpVhHjEQcQObkwGPS69KiFvuRjhnizcgkidmlQywBr+pVjaw2YP
         0AD6wmZ8NdWewmNjFG+gVPdoIY0RtG0IWgERi1IpZDnKnz8GPs9sXUl8CXcjgq7C+U6+
         WjrsM1qrhVM31LHZq5CWu8cudPmAg+4Ze4frAqnv1aV00RpsAQ9ENvrJADkw/qGiJaKP
         lS6RxCSaTIgp0j6ukGv0Hb/rVq9wCVMLH/VKywRN5COXX9GaS/yScXXuVKK8Eo2Nrs5W
         8NAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714057416; x=1714662216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuUgN+eqDnD1TSwHoUcLirGapuP4idukeuGNZ2DNfLI=;
        b=Gjd3gElFqm5roPZkmoAIwGbQFowyVxeOQsj6H8LZDWSQX70HgMTx3F/+PF0xcHy+Yg
         HVQ1hzCZk/L9TzCkpHiNtph4od+EIv44K1r4SKaq0VIFqQ/57J/QHtb5I8bhYUeunRWq
         IjwFOkHWbk7UI/ndVwJNNWbyz+aqURnMBKpXX4mHcjo7itxFg9LisiqPhelKdfLyKcnC
         p3l24MP0coq8qlLmKiw2o5OxwywWn4iZlgaAh8+p+vKVYQGoU9NYsp6JroU1SjDZPavn
         Z3sDsPIXgCaUf4eAzCMSnleijL0TYGuYACuSDsPaesa8H8v5LPB+3U8GavjsGHB29/uU
         DduQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3WcZbUz0kH0ok/YEBVoRfBWCcsbFMws5ij5M99M3vZ7nepwxJj8LcBvMc+M+PwnUfPosz4sijPJ5QjQz5s8eBnL4D
X-Gm-Message-State: AOJu0YxjKVHC1gM/jYfmEiceTf499mG9vyJqO0O9Hc5IMM9cJLOFAxfP
	hkDGFxE8LpgjdDE1putdfwUUapxODxyTwwUP+c4TOB1b+6G+cjDxfDMTKeWrJqM=
X-Google-Smtp-Source: AGHT+IFvAtaidOO7h0zkTLuuS0Zuix9lqDgu9+DKxThfm0jLTYtjgYSEE2bX05vg7lHkXPUfguF9Bw==
X-Received: by 2002:a05:6870:9f86:b0:22e:de21:e084 with SMTP id xm6-20020a0568709f8600b0022ede21e084mr7083274oab.9.1714057415874;
        Thu, 25 Apr 2024 08:03:35 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mp2-20020a056871328200b0023b6d4723edsm166739oac.14.2024.04.25.08.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 08:03:35 -0700 (PDT)
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
Subject: [PATCH 2/3] iio: adc: mxs-lradc-adc: don't set masklength
Date: Thu, 25 Apr 2024 10:03:28 -0500
Message-ID: <20240425-b4-iio-masklength-cleanup-v1-2-d3d16318274d@baylibre.com>
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
drivers, so remove the assignment in the mxs-lradc-adc driver.

__iio_device_register() will populate this field with the correct value.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/mxs-lradc-adc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index 2e60c10ee4ff..8c7b64e78dbb 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -724,7 +724,6 @@ static int mxs_lradc_adc_probe(struct platform_device *pdev)
 	iio->dev.of_node = dev->parent->of_node;
 	iio->info = &mxs_lradc_adc_iio_info;
 	iio->modes = INDIO_DIRECT_MODE;
-	iio->masklength = LRADC_MAX_TOTAL_CHANS;
 
 	if (lradc->soc == IMX23_LRADC) {
 		iio->channels = mx23_lradc_chan_spec;

-- 
2.43.2

