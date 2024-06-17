Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE72B1CEA0B
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632258; cv=none; b=it2b9Aj9ynSeqe32y2K/JtSEtwgPOIj3BkXIweUCo3LyjXFa5G8HRR3DIocCpvPalw+vIWkjz6gqj/U712nQHwZhqwDaepdKreRrlTYdoWW8RTHxquZVVpbDN/RzrcLB9f6GLNa+qsfsztubceIQo00n2BIZi3ygrC6ylCUVEMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632258; c=relaxed/simple;
	bh=f/zX3HOWeL5TET6xFFyDUq7zdBoOXuLX6VMmAIvmM+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQtZYEXdN8KNXJVWbOzzivkwVHad0tE8gmNcPFoOjsz3V5aaQJvZiLF0AHyR0Cc7zCDnCEcw1q2btMn6eFmQMBy6dogNRgn0hIlam95nlHRWgs/KbjoJxEGUV5/zKLyijeUgzCwWIRgDZVMdiwpXfp0w8gFFNKEHvWC/JuATSmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lDDuLErN; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lDDuLErN"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7955af79812so246269885a.1
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632255; x=1719237055; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ia4Z2qLqqNhVaFO8MtaqZtGEmhpmvSbj7T0WFgyfsq8=;
        b=lDDuLErNS9/NmqEhtXzSYiVKtw0z+AXUcsj98s/tKDPF1/zbsFlhfkpMSUH2KBrcy2
         EFgruxVxXKch5V1jZrnZXwXxC6PIQhvCY9csIhz/D8cPXgNf3YpCdRQAwfmCkaDr8i+i
         Uq9zkhgJQ9LUOEh28jlm2qx3ujypVHTlnymyvKov8THvRo0Z8XM5gbfI4TEFaXhDdYbv
         +a2gzBi6vAk5INPx2130//IbUE97dm4oFmDgx5BXMCFDA/pToaoyUqb1PbkzQvWo0DZu
         2DO/Ch5jTDHW3yASj+hXvt7QO6zIFKY3OvcZUJsGTP0OyEd4ob0efEK4Ihg+lBDDmJft
         pMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632255; x=1719237055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ia4Z2qLqqNhVaFO8MtaqZtGEmhpmvSbj7T0WFgyfsq8=;
        b=gaSdQGk1MVYh2fLJkrVr8OxqmOCho2Fn9pfFW/tu17R4GgOEdFMXMwzmn0LeJZMFVZ
         Vs5AQhm9c9Ji33mVUyD6kK8Ttn2UMXiPDaniO6gtQ6RhIF9MzgGcWvq5Xnki7j2bDXjQ
         scjoRY5C0QsY3Awgd98YSa09XllcdDp3xtDHhwQhMMdVox1NI0J5zWPB0ZHZVV3Etfp8
         +cMSdCTbMCY5jUBOTwUdZwxOTideP+IiJ+Tj8VGKWVj1+IXYVYYnC+dc3WWn9t1vzElC
         uEt5fdIUdydPFIspreHbNRqfCGGdBayYLRiF8qT4hCbcFaI+cuNLf0j7A4J/FUJPpKgD
         qmRg==
X-Forwarded-Encrypted: i=1; AJvYcCXEAk9AKP2+1dOqkza53f+1MyDlqlq/ElU3VonD6QzQ+SI3IZLVSlwfqPOoRca5eQ5qh56ZPRdKRynyIShYXYSw8BJ1
X-Gm-Message-State: AOJu0Yzus/ifFen6xd022VAqClIwvnwA7jVEwoiEPJfmfKERaT4E7KEQ
	nwJ/a+7GiIJQptFDGBXk7ET6eWWWW9OUEQsArJz2Z7sEtMzFDjEvDYYSZwMI8gA=
X-Google-Smtp-Source: AGHT+IEp5RQjN3OqXqNMmTgCMp6Y0MDh6HV8RUCzW71+lzqdiGZxksmwSY5WI1Xptssn8y0vJEqwfQ==
X-Received: by 2002:a05:620a:1921:b0:797:74ba:8ab with SMTP id af79cd13be357-798d26b4a64mr1132760985a.73.1718632255523;
        Mon, 17 Jun 2024 06:50:55 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:55 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:13 -0400
Subject: [PATCH v3 33/41] iio: magnetometer: ak8974: make use of
 regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-33-88d1338c4cca@baylibre.com>
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

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 drivers/iio/magnetometer/ak8974.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/magnetometer/ak8974.c b/drivers/iio/magnetometer/ak8974.c
index c74d11943ec7..70172b918e16 100644
--- a/drivers/iio/magnetometer/ak8974.c
+++ b/drivers/iio/magnetometer/ak8974.c
@@ -327,10 +327,7 @@ static int ak8974_trigmeas(struct ak8974 *ak8974)
 	}
 
 	/* Force a measurement */
-	return regmap_update_bits(ak8974->map,
-				  AK8974_CTRL3,
-				  AK8974_CTRL3_FORCE,
-				  AK8974_CTRL3_FORCE);
+	return regmap_set_bits(ak8974->map, AK8974_CTRL3, AK8974_CTRL3_FORCE);
 }
 
 static int ak8974_await_drdy(struct ak8974 *ak8974)
@@ -438,10 +435,8 @@ static int ak8974_selftest(struct ak8974 *ak8974)
 	}
 
 	/* Trigger self-test */
-	ret = regmap_update_bits(ak8974->map,
-			AK8974_CTRL3,
-			AK8974_CTRL3_SELFTEST,
-			AK8974_CTRL3_SELFTEST);
+	ret = regmap_set_bits(ak8974->map, AK8974_CTRL3,
+			      AK8974_CTRL3_SELFTEST);
 	if (ret) {
 		dev_err(dev, "could not write CTRL3\n");
 		return ret;

-- 
2.45.2

