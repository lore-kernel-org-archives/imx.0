Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D9A269818
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392531; cv=none; b=d9Cl5jzQTyDBtdmEraErHUS8YJObBvLTkybFxdAmXnqc/EQHNyTsdA9Kr+SYH+9H7xFypI7GTWORFk5VcUnpeXt7i4FjZJsP2n7KZt4Zq6MBnGbxf3qMxGDP3Vwc0IjJNOExTogmZgeJka7d5ZGMCfQwXoAoEss8DbeRugBpDwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392531; c=relaxed/simple;
	bh=7C+LNsVab5vr5HZgHbL9vCFP4eASEkV4s77Udtvpj3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0G0So/D/dBprEbQd+WAujRJgIf8i9t3IGX62WRSYUWAH5I2GRq7hzaxpk5Whj2rUbD5oRlvWtPBPDhroLLAEU+tZHz27xBbLniJsiatMVGZ7M8XljB7akIApo69U/uQXHuLH5f1AUUXmFuj8DP3lP0GvT7JVQCiWDYQ+cektHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vn6HVuot; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vn6HVuot"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c30d9085aso4532520f8f.1
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 00:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392528; x=1745997328; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MPclfNXGHsV8MZaXGNXPoIUNkZUY12DESp/EGnzFtA=;
        b=Vn6HVuotz8W9Wt56Eb0piZWSYdYsi2k9WDXdnzx5H/iX6RvvHQ7sNWvIM0V6gERo8C
         MRuQbkE7HLFNHYCS/eoIi+g2NAJhpTwOIaF8Kc8+LSnn2qcVmjonbK+7T/fL+1oFdbQ3
         tjz0/u/73SHKhUWrTZGgcwJkjdgoPuKgDgQ1/PqLhK9G8WJ5TaZh/tGT2e/ZqVcRC5Ar
         Pi3OXQUR6xcC6giSSaREgiS20LYe01NkUOQsq2lF3S7VGQFsd1o36L/Hs4GyJ6PO3uoJ
         CfC2on2LMn6LR1IrP6TU2oFQDjibzfkim95D2YULF3QwgeW+BwfWgRRR9v4DCPti8ltv
         2/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392528; x=1745997328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MPclfNXGHsV8MZaXGNXPoIUNkZUY12DESp/EGnzFtA=;
        b=cUtOWUYEY9h3xPx8GkWXVgaJ2j5gyX2h1OV9Jb5BRtPEj38G3b4XGD+jMoYnOjKNM5
         vX/PtzYeM5cocALktNPaYKd6GS8acmtvk9a8RdaM8PjT6toedls7FLXAIyDXdJ/YfQ+3
         JsC8vaHNDCYowsJ+l9YjsAuRbbDxtrkMO3S39UaIhL0WvKcmmVpvKYT59Oy5vxwC6r34
         MoeCyh2ena2yiubW2kDfSz737zjMP+K7RM7Wtrwk1EM0LqeHM1oQOaCK/9tABeA7pVvw
         ohWFWs3F0Vveu+V9Mhll62KuIjVQbvUZa2vfu6lOkivbym4um6egZqxELbBfBIMMh+N1
         A6BA==
X-Forwarded-Encrypted: i=1; AJvYcCXPnM0pvQjYh+MlVpI//a925GwDVFFTEdX/JlK2zPf+se5xF+hWgU4qFLyts0AoXKxGGCU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0oZkCtGw1VgfN6dnI+TORl18QvZGDICCdlSA2iXWxXfbCmHal
	mswsp24V9B/CRBPBN7gcJ2XVNS/btMCoYvqPut18zxiJ1JdQvSD5hHaFBCFTzIE=
X-Gm-Gg: ASbGnctOsjO2DjpmQkq+abc5y9mpOkALeW8Q9WsF6PKNjzghlbTK83f8dTMSB/0YcSh
	eeOmllvMZ4k3fVjLaGnQBkXYrUPElwB9I2maIHU4AmwQmEume4Bc3C70eEiwViz0b882rsA/w6t
	7S+ORYWKr5d9TYzOCFkg2uFcVoMZil2RVjWLArjQ+iuSfTaGjQsHeQoABz/UJW/cZohiypD9O/r
	xhdmjbBb//VOUUCjQzbpk0HWDWXGYY/Ab9j480n96Gy0V+Tn/ppfI7WKOBiUzEBwRIIfrbbF0i5
	AuH2w9IgiGXFD4ZQD40h6YpWahsRxZHW7w==
X-Google-Smtp-Source: AGHT+IE+EYnrfW54icqKEGRQVESmbeO48iqpEBpeyStDk2tewi09mNWNZhnFX5SLcVdwpUyDg1P6zw==
X-Received: by 2002:a05:6000:228a:b0:39d:6f2b:e74d with SMTP id ffacd0b85a97d-39efbae02a8mr15795824f8f.39.1745392527777;
        Wed, 23 Apr 2025 00:15:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:13 +0200
Subject: [PATCH 11/12] gpio: loongson: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-11-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=99W25ILmVjnRf/yi2U9/4v/maPAhA/fNyMvWAd93oJw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJODuW1HwT5L1heIPW8u0acldNLxdbYmai+QB
 lCwyKbDCsqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgwAKCRARpy6gFHHX
 coNPEADBSAcxIsHdv3O6rLXDUMyohTqVcWNFYAMTwTqpb1HtgvRkHOabZqgoyERJ6y2hD9u1xeT
 LH5bBYVhdTXqAJSrMktvY/zTtO4hBbdFE1xgJLwB1qE+SsxnNL376z1PEoIWyJ1NZv6ZvhepPJH
 h5ckAt+F9XLL3pD03wOQXRXl7sUmsEbXEb72stmtgYIs2XE7o/5QRHWvmORaLInPdeCCV64w+NO
 pE1nmuWlRyZcNJ12iMJcmDeI93N+N/rIk0Wr0z4rk7gjiv2wsUvZMgKicQMeI43XEhfcsgdloQa
 vQ1KjIPR69EU42UH7WjYSlhdcn0nvU48In+PnIzDTk1EY5X87IEnShhQD8rCfiV8QYdfyQq9dHb
 2iSyRO9phbOJmQu8kfNbUuQrlwqJtvs6k9BlCVJ863HuyqBFhB0hvcxchOjIKZKhobV1in6uSxi
 lNxKCwfcmT82uYTDXRo8xvU6OosAsEg3jdNbREVJ19+WFQaQXSpGxKoW8VyNC1FFEWckucx4j/R
 UN/ChK+jIEeoK9VbnyYII9PSqWi9f63XZrDfA0WmATPC7zWUoRJ5AiyOQZgLWfjEJYTvxXyOWqp
 qvTPJyXN6SalFAOVDoHuVF1QdSMM0BV4ey6hVpSqGNN/BDvOZMQw7aqCot8ow8ftgamkYh/zsOP
 pxsEDKbDN+/kk4g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-loongson.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
index a42145873cc9..8f3668169ebf 100644
--- a/drivers/gpio/gpio-loongson.c
+++ b/drivers/gpio/gpio-loongson.c
@@ -48,8 +48,8 @@ static int loongson_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 	return !!(val & BIT(gpio + LOONGSON_GPIO_IN_OFFSET));
 }
 
-static void loongson_gpio_set_value(struct gpio_chip *chip,
-		unsigned gpio, int value)
+static int loongson_gpio_set_value(struct gpio_chip *chip, unsigned int gpio,
+				   int value)
 {
 	u32 val;
 
@@ -61,6 +61,8 @@ static void loongson_gpio_set_value(struct gpio_chip *chip,
 		val &= ~BIT(gpio);
 	LOONGSON_GPIODATA = val;
 	spin_unlock(&gpio_lock);
+
+	return 0;
 }
 
 static int loongson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
@@ -104,7 +106,7 @@ static int loongson_gpio_probe(struct platform_device *pdev)
 	gc->base = 0;
 	gc->ngpio = LOONGSON_N_GPIO;
 	gc->get = loongson_gpio_get_value;
-	gc->set = loongson_gpio_set_value;
+	gc->set_rv = loongson_gpio_set_value;
 	gc->direction_input = loongson_gpio_direction_input;
 	gc->direction_output = loongson_gpio_direction_output;
 

-- 
2.45.2

