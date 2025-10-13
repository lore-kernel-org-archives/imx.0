Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7422526C3BC
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364898; cv=none; b=rIwRtOyaETi93P4c1mUPwfaBsmn8NdnTFwSrmC6sNQQf3kuPrlhn+iY3u4o2SZ59HiM7gdUaW9y2JtxsMpOf9QnCpPgu0DTN6bw7ewt5qI13rHLqFw4BwCCB4ZD9WK1Io2Xbv4J1lBvFj+BZm/nSYghjvFPcH50uFYaml6se6gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364898; c=relaxed/simple;
	bh=XGq0AYT0RAu45DkehU73efZ+CKhGLsp22KsMW3sZ7KM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rkx16f0kp+CEsiJrf2F1rU9srm+GHvWqlhIA0nNFfvd9FnyI1taxTZD/OSs4nmWGof5LOXs4PQHqh4bdM32zzLbEQQBN2rUcwaQtjsLJNJECqjdzNSLGIEapHXAltOSnbADw0+I/s7jcS/RLkYdx0oE9JqjGi2Ru/8W4OI7P/1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L62cP/W4; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L62cP/W4"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-579363a4602so5034386e87.0
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364892; x=1760969692; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw6YFePVdJ/w0HUJNx+YTiAEhWK3QpB9xmEBqnhTSDQ=;
        b=L62cP/W4cTzig7fHObGSHDZw3bZqFfRyAvLIZqdz/T/6A+tvE0ioV+3TP7P23xZ08y
         etwcE1xKnJ7rRreAdrgx9IuuK6cmfb2vtfyEOpD+5UlIvLkBzosBHhlNp4W94Q8D7Tf5
         SkW0Eo5izxbYM4Qe887JDlsdv5dN4RMq2v0W0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364892; x=1760969692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw6YFePVdJ/w0HUJNx+YTiAEhWK3QpB9xmEBqnhTSDQ=;
        b=ZVKFs53eGbCOlFamH68At7vO15ihgURHBpJFxhHfIf4mNR6QglQjzXwnAx/09Oux28
         0RG/V8BQD6lHKUEnFijFAKeh+obvrUL2O60A3lJ41jaL47f6JYLxnjj/IjP4PRJ+6F++
         dYdb8JUGJblpNT0y5tksDaOJeEpsSk17v280LJ9fOJ75LaCI8YhFcyqLBI7mtfZitt0j
         dOu1pkfEZIkpk8Rsu6Dq8fi8AIBVcLdb8J8nFpL/dwTTPue9bU27eTVa1nMKWgqUp9/Y
         oGwnANl2dXq/vWGiXqsq9bopUGblmnwwxIYZnOpLKSkKl3N4n5uVxhI49YwwylgNEJMM
         1XiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQF7h+GpibbfbTllrlvpm5XZ7gZhqmr65FBqXaTnvQCO3xk8JZoVArPqeckZ7H68/+k0M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsqK+u6nIlPTAS6g2+/sTdqnwbXMaVqk1MsiONHxEgVzj25yNz
	IB9i3nyZL66Rwv7r4ZZqVV5iQvA4ivzv3e8zd7uYhckCD0/XteBjZWLEOtf4VjTkcg==
X-Gm-Gg: ASbGnctURjr9ba1e8a9HGUnCOCh+Llj+nD6m70sz2RFieR4+v98IU6AJrj+pRcS4vfX
	009VXQZgL8K/hETGlTOvKXkKW2lFmqqQ4dS/OMSQWbqNoUXFjFGKU6bA1KOyubebIhXpmxURAfu
	2gmCZhClDNzPcEbWwvSEHkoKueL16+fjMhgpxA10VttHUbNbl+kO9zD2NMaakJfprak0ahGXHGN
	WsIIHI4OO287Ac9XAQavlXcajqY5KvvAgBnDnGrSxbHmixaGFy/GCmPojuOrumNzu4BjF5bz9e0
	PLjpy0ZyQX7PtQnDjVwR6h72BuaH9/Jg3cua9bBquhDoBQrEEktR0jOFD7OTH0800evUo21ZcrX
	NfGpn8We9NER+aTTkFeaLOI1aFlkzDjcvnGRMR5JiYLwK/PHle818AeK3zYkHdxiRl8v6IjpOKf
	mDUQa/vHAF1t+964PtmA==
X-Google-Smtp-Source: AGHT+IEKVe60oXFEuaV/5sAfkl2vR8IvNhsEsPje9O6F0QVcXOQ4CmYWAzNOjArzbT4yXoFh7KUNeA==
X-Received: by 2002:a05:6512:2309:b0:57a:baaa:394 with SMTP id 2adb3069b0e04-5906dd51898mr4676162e87.27.1760364891849;
        Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:43 +0000
Subject: [PATCH 03/32] media: mn88443x: Use %pe format specifier
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-3-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR()

This patch fixes this cocci report:
./dvb-frontends/mn88443x.c:698:3-10: WARNING: Consider using %pe to print PTR_ERR()
./dvb-frontends/mn88443x.c:713:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/mn88443x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/mn88443x.c b/drivers/media/dvb-frontends/mn88443x.c
index 7a58f53ab9996031e319711a21b1a8f1c13abed4..818c4e67364c7c6ec2bfc17f21e2cac360f6bfb3 100644
--- a/drivers/media/dvb-frontends/mn88443x.c
+++ b/drivers/media/dvb-frontends/mn88443x.c
@@ -694,8 +694,7 @@ static int mn88443x_probe(struct i2c_client *client)
 
 	chip->mclk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(chip->mclk) && !conf) {
-		dev_err(dev, "Failed to request mclk: %ld\n",
-			PTR_ERR(chip->mclk));
+		dev_err(dev, "Failed to request mclk: %pe\n", chip->mclk);
 		return PTR_ERR(chip->mclk);
 	}
 
@@ -709,8 +708,8 @@ static int mn88443x_probe(struct i2c_client *client)
 	chip->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						   GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->reset_gpio)) {
-		dev_err(dev, "Failed to request reset_gpio: %ld\n",
-			PTR_ERR(chip->reset_gpio));
+		dev_err(dev, "Failed to request reset_gpio: %pe\n",
+			chip->reset_gpio);
 		return PTR_ERR(chip->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

