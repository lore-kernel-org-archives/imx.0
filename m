Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D031BE251
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632214; cv=none; b=ZM+pON5XwPIXXrUOazC8dJr2iNMkk4Po+OanQ8IdCbGoBDspLrpj1xyix9cefxra+rLB1dTdd4um7IRVOKP+z88/mlEGJniIjHnX2xw8TnZ4LhQHYEFTEK3JLYAcP86lX+4sznWvVrkY+KWQ1OJTP+mDhLtq2D+My/wcn7lg43k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632214; c=relaxed/simple;
	bh=38T/q5mgwk2j8HZtXOQWhbPXZHF8GM5UZOsgQFkjGgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ADQ6ydBUyBtGFGPpjKqstFnpCxtxUpSu/bZkgwuBLQEQ+gUpLtQNhLFMNpO4+0YSmsX1QvT2XLOR9sOI3THCMsAUIrUT2rm/CHV+teWE/e4+OasjZ4rdScBVGjRpcztzGrqE4JMlaeI7tW9tNAt1JUMogquvlZ6eNbKvvukdgAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nW2tcAEN; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nW2tcAEN"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-795fb13b256so419698985a.0
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632210; x=1719237010; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyBlb3Ba1k/jlth0MsPpVigCEg60zHZmfggBIvSR+YQ=;
        b=nW2tcAENVEBHC/1gauVGo39DPWdQ/pwdQipa+VqZUW6UaguTikYn4BGDmIiqxw4i3Y
         joXyzOmT4QNHpZuD3gIqvbzBq8UsWPKKew2xIFze2Ox94NVBg6nBdzWHG2KQ0/2HWNoX
         MgdjxoXxmZ0+GQ2eInZfZ/rmsiG+Np4OEn37UxwnG7W1/KHQXnLVytU5PNIjwWdFi5xr
         lmjs2a/TxB2Gm2sU6EuojaTEcInCUBeCtdpQxhHBxaXKIzARXl+KVaOFHeTuEQ0VYz/5
         6jGhzgcfJBEl1YhTO5t1PbtNRnUY+madsaxO9PYiZk2sGjci9T63W4SrWUUh76sG0Twj
         b14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632210; x=1719237010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyBlb3Ba1k/jlth0MsPpVigCEg60zHZmfggBIvSR+YQ=;
        b=nahdY86f1DESMRZmsdzsvmN0s6IPuSSa4ajXlydz95219vdMn48WutTO4LDQVOsWF+
         xnhBOK+4HXT0xgnCTIB8cVVYSPuM5NTyMVCWM+/WdGx2WsDvS0PzAnY375RYlshbxQBg
         S7ikGuIZKWGcbe4UIYdMnOj30kAUUFKjPB/1QTJiUNBi2sXnJ+AK/aYR6Y6iN0rzgsSL
         vlpJDXpMjQBLXFKH8UioaDT2gb+TY6mZlpfWELNXfkGNb2a6IQsZH2DDnqclVdHh85r2
         LK6KbptF1lUpuWPpZixcILZ7hvdFXjwHwIPAGXzspg30P+x5Uegnhq3dRqaWhavodkkE
         NX1w==
X-Forwarded-Encrypted: i=1; AJvYcCVgyug8YiuGuVhNGvG0mIT/LntqrXBgygcwHULFAH45OyGo2nlIUHOXLKk0H8Xn5zRaiNNM/k+4kmkuQjm1wqKN6srb
X-Gm-Message-State: AOJu0Yx/mvk4UjzKvMamc/qlhgxEal4QBxABWBraVaQYB2odRPwpmYtA
	W1pVGn/3wPSCUeP/vLSnYi46DFN/c8qLAJFCv7EZGoyEtxviAquHZNqGcGUvbZ8=
X-Google-Smtp-Source: AGHT+IHWmg+UOH3erM5jeRd6l80OV3UNPvKSawdtaAa099apOKn54lBrRboJnTNNmboBsmxvynve5Q==
X-Received: by 2002:a05:620a:408a:b0:799:b171:b1fe with SMTP id af79cd13be357-799b171b5f4mr1409403885a.14.1718632210646;
        Mon, 17 Jun 2024 06:50:10 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:52 -0400
Subject: [PATCH v3 12/41] iio: adc: intel_mrfld_adc: make use of
 regmap_clear_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-12-88d1338c4cca@baylibre.com>
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

Instead of using regmap_update_bits() and passing val = 0, use
regmap_clear_bits().

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 drivers/iio/adc/intel_mrfld_adc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/intel_mrfld_adc.c b/drivers/iio/adc/intel_mrfld_adc.c
index c7f40ae6e608..0590a126f321 100644
--- a/drivers/iio/adc/intel_mrfld_adc.c
+++ b/drivers/iio/adc/intel_mrfld_adc.c
@@ -81,8 +81,8 @@ static int mrfld_adc_single_conv(struct iio_dev *indio_dev,
 
 	reinit_completion(&adc->completion);
 
-	regmap_update_bits(regmap, BCOVE_MADCIRQ, BCOVE_ADCIRQ_ALL, 0);
-	regmap_update_bits(regmap, BCOVE_MIRQLVL1, BCOVE_LVL1_ADC, 0);
+	regmap_clear_bits(regmap, BCOVE_MADCIRQ, BCOVE_ADCIRQ_ALL);
+	regmap_clear_bits(regmap, BCOVE_MIRQLVL1, BCOVE_LVL1_ADC);
 
 	ret = regmap_read_poll_timeout(regmap, BCOVE_GPADCREQ, req,
 				       !(req & BCOVE_GPADCREQ_BUSY),

-- 
2.45.2

