Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8711D0F7C
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632270; cv=none; b=sxgoi6k4djDsj0c9WAXP/7saYIWXCLzyWPvz90ARqgpvbvQuaaemzDd7vRqjlnUB/r6fT9siZNoH8akjQH3cjtAjhOLHZ1AtP5aeot4Ua0PI46H99tosqqek7e+HqQlIeyEQ0qgAk3LOxcaBlpqATOdgVAmIP7EUN6YCWg/XBt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632270; c=relaxed/simple;
	bh=lrT4UVJxbYPigfpUfvDqNd6ndl1eVcIzUfVJ/1QCCbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gexd6DaQRSmu6B0nW0TMi1C+InTI4G0Ylhd2sB0np1XYsZKILuKPfBaKA7IfoxgL2bz/WAF/MUMHPpxl95KdhkeHiBhF7wcjpVpIXipZl/hP1cTaOTJYWQrIoBX0E0mFDx2PtQr7esU7d+dWtyCdZ9mPqljtLRWCRSP4S4YwrKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uhrf5dnT; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uhrf5dnT"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4405743ac19so37286281cf.0
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632268; x=1719237068; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tvabn+RMpG3uovvK1+JaZOuuhTQ0Y5v5qxh3XvN8Rq8=;
        b=uhrf5dnTx3rixb8Cg7Q6gyozegVsF9weTzhR5HTPOSO8zZJRljUamPoXtsZ/vRoIu9
         wfWrzXHwr8oOKCH3hIFF/lT+JkxLq++sj1/nYr94M636+Vl+U7vy1c4MSBU9SAMHf+7Y
         e9JBBJMhnZXb3RLLwsWJOemlBKXwonx3IWyrnVSW/ZRi7UrmanfFuhF8wuFMpOHQ/fh6
         ZviXu3oAENTyZUn/9QrKDpfoXvoPTKbPqFIeVlrHE6/UthVJF4I//I/r7wIobNzN5u4z
         hkvO7RRS2J9/YCSJ1cXZtvJDu+BZfKexxnu/V4H26kwNnxeaKn6f0cCBziMJgGQ5TPIt
         q4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632268; x=1719237068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvabn+RMpG3uovvK1+JaZOuuhTQ0Y5v5qxh3XvN8Rq8=;
        b=jlI13QKM0NapINE0j60I1mgiul/FozxXgih3HHwXlad/vlDi73KHbTLJZyYnGFzQfK
         HTCovl393XiY0rztnFcvhVgzeDV0CXTOf6K+8sBpinHDjZBd5bGH1meeyHXjAWkSi5QB
         ure3ZJpWNjOb0cJTJ2fnR4757BClJuO3Zb5CPrTvUbKRP9Kx5mz2rmbriqqCvANddziw
         kceUGJ1JL8k2d+qQTsc+/eDzYpke66FjxF+sYWLGIFtltSSk2DsJutNwf0iJ/o3dc/jw
         iv5U4J543I7JikyLn9yTAJXob7DWErdYz0uTaQllObwBF/FBuJH7Vj3YOH9IxvPLhj2G
         SUjg==
X-Forwarded-Encrypted: i=1; AJvYcCVB86gc5lZ3BfVFWJ5Mm+b87C0PH8L/DeJ1tpYucoivaofoB0Ci3Jc33kBTNpgM5pkOKQcbbMiB9m8Y0gNx+doe1wt4
X-Gm-Message-State: AOJu0Yx0tfozmjzCcBs1a9C0bF4FZYacUZqUp95KrP4b4cdyQMwLSmXs
	wwIxtZVHqPpOsjoHQtUuOF4oMV9qqR+EFI2gxqnm7v3Bkd7Wb+Fa5kBx5bVd/2I=
X-Google-Smtp-Source: AGHT+IGCNTX7XI85nrdMwm8HgjdhSBF2upAbofRDQ4N0lo0/7MseIEDdacRNTzR/tFRJhwns3PxO2A==
X-Received: by 2002:ac8:71d7:0:b0:442:198e:cb9 with SMTP id d75a77b69052e-442198e0e4bmr132788711cf.27.1718632268400;
        Mon, 17 Jun 2024 06:51:08 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:51:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:19 -0400
Subject: [PATCH v3 39/41] iio: proximity: sx_common: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-39-88d1338c4cca@baylibre.com>
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

Instead of using regmap_update_bits() and passing val = 0, use
regmap_clear_bits().

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 drivers/iio/proximity/sx_common.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/proximity/sx_common.c b/drivers/iio/proximity/sx_common.c
index fe07d1444ac3..a95e9814aaf2 100644
--- a/drivers/iio/proximity/sx_common.c
+++ b/drivers/iio/proximity/sx_common.c
@@ -111,17 +111,16 @@ static int sx_common_enable_irq(struct sx_common_data *data, unsigned int irq)
 {
 	if (!data->client->irq)
 		return 0;
-	return regmap_update_bits(data->regmap, data->chip_info->reg_irq_msk,
-				  irq << data->chip_info->irq_msk_offset,
-				  irq << data->chip_info->irq_msk_offset);
+	return regmap_set_bits(data->regmap, data->chip_info->reg_irq_msk,
+			       irq << data->chip_info->irq_msk_offset);
 }
 
 static int sx_common_disable_irq(struct sx_common_data *data, unsigned int irq)
 {
 	if (!data->client->irq)
 		return 0;
-	return regmap_update_bits(data->regmap, data->chip_info->reg_irq_msk,
-				  irq << data->chip_info->irq_msk_offset, 0);
+	return regmap_clear_bits(data->regmap, data->chip_info->reg_irq_msk,
+				 irq << data->chip_info->irq_msk_offset);
 }
 
 static int sx_common_update_chan_en(struct sx_common_data *data,

-- 
2.45.2

