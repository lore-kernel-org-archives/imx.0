Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF5725E824
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364895; cv=none; b=bwN+2r7NDW/z8EBT5dg1IvWERQ5pBOcFfgTTalIw9EKpy1YldAVurRJhRJ0WoYm44pz9InqwdukuePiYvIKDKSMAzjyyXzMFzYhSu1pLpZB/iRqWbb20o15Emj7KVvEUUWwoYg8Ut3aDRR+mQ4uT4+SPmws3M5V5zQuRFJGZc3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364895; c=relaxed/simple;
	bh=zXe/wxZ6QqQI33wXbnF9l5/N0aHMRBU3Aplzl5QTEmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYz76Z70BWOaN8lWw9I3KJU/fJu2zFbJiN6W2XraOs2sKyRsoEoAXpiUs3jBxxfv0HTgB3BVjCETbU8rtzg37zKsBDsFFNa79usyvjt0ynI1gMCR+O0UVv6ZlvGvAJa1aEQ90ClOsuGQcWGAUJSaZltllYWvDfm6snUe3otjPQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B8QV2EUU; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B8QV2EUU"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57b35e176dbso5140117e87.1
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364891; x=1760969691; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+YhCU9BSkNGYIn59ygfcOhebsOBGxL8NqrMakgbz3w=;
        b=B8QV2EUU2WJJGBgiYgZGwcM+zWzreaCBwdXTX4ShYs/aYwpyYYR8IJM5gUm70Ed18c
         4OCGYnYCTir0KFaFScrjpC7Dam4f2pLkWkV0SKe00uLFXSMxgfa8YYm/eDti0SWuWBOL
         Kkh70klUmI4kPjB1ADhvzdFzsTBW0IsVwtsQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364891; x=1760969691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+YhCU9BSkNGYIn59ygfcOhebsOBGxL8NqrMakgbz3w=;
        b=nUkgrZw7UfV3BK9snjn9An66WK/J8kiAr06YLhm3LYoMfSs9gRl17L29xsYxk4ZZbC
         fbSRxAVlSBe2OI7Id0JMXkGy2CCirLglk9whaDQSDBU0ndohjBacT79n+hXL0+yM7g1a
         PGNhaWIfKJOMszHdhbKWg3M5yfV9oUJWcM3t6/3b9hEWALMAzk70LMFU81CwF3Lj1XMv
         zKWA51EKHL982h4RIfH4AkBvQHDas/BMd9tXbbNVOmAdV7Q5Crlf+fN0gTbQ2C9xmVh1
         Hbb8HqanYJnVE9Mtp/oHr3y/gzFjnefpFu79jh/sdwNAof367/773lilxFtMPEoxZZtF
         WTUA==
X-Forwarded-Encrypted: i=1; AJvYcCWPM+SnIVywVldaJsFpdZ9qarvyVH3hdmQj1LOrB6bwlINws535+TZyx3ReUAHKXwOUn0k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9Cxz0/BMvotprDbTUFDQpqyw0jMDGr9BX3V5umejKHqo7XwP0
	E/1Y5aE1dqIEkB7DTGZgKZR5zWnr86cPPYpPPttvd/2+iNNZpbEcTKGq5qjtS5kcWg==
X-Gm-Gg: ASbGncu5ZSK4E421cxBO0UZ0Z5q1Yq/tkxhhn61uJlDCOLUN0UbY9y3x92Gd43CJ4qP
	tcKc2aVMxfkF8hTugmOQoIvWmTyHL3oSrOVDiqFThkW6O1Z2uo2TdA5vohBINVnxsqGmMMDXdKE
	kUG4RV48h7F1YMp67Fwqoo2YAhK0RUnhjcOt9lqm/gLpX4xXIdBf9gvibsQrQ/eq6tPuD8sopW8
	rgxVeUOGj9jOzrYU+nenxH5h9YwZN/zDbvApMLzEKtCwLm4RPhxtFXFi2PErfL1LnR0nf7LsMgf
	Fl7bNEhI5QYtBZSb8HXUWNjbkCzY4wjq+dRukqpkJCJZmiYOLu/xVNQ3LCqFPhmDyOSMoysuGRJ
	elhiiCqk5sZLXIWiYGI0wrk1vEdy50BrkzG6dB2s1/PLOmEsZPxf+bWprjqJzs7PQjLcKuDKCrZ
	oItvMxlgUEeUm/TyInbaaNXlYA79yv
X-Google-Smtp-Source: AGHT+IG2QYB2+56krLBk85ko6pGpX0D4THrfkt1zz892JTpjDOUAww9G2kctwSbBGnVpsEQJrH5Ywg==
X-Received: by 2002:a05:6512:3f12:b0:58a:fa11:b7af with SMTP id 2adb3069b0e04-5906d782160mr6219748e87.14.1760364890722;
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:41 +0000
Subject: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org>
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
./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/input/touchscreen/cyttsp5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index 071b7c9bf566eb0b58e302a941ec085be1eb5683..47f4271395a69b8350f9be7266b57fe11d442ee3 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -923,8 +923,8 @@ static int cyttsp5_i2c_probe(struct i2c_client *client)
 
 	regmap = devm_regmap_init_i2c(client, &config);
 	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "regmap allocation failed: %ld\n",
-			PTR_ERR(regmap));
+		dev_err(&client->dev, "regmap allocation failed: %pe\n",
+			regmap);
 		return PTR_ERR(regmap);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

