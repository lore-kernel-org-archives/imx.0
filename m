Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B357267700
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392523; cv=none; b=ENyinpJs69XpYZktXLP1xwFfa6By6GJfCy04IZtzTWhdnyhgFrXeQKHe3wIPwDHJ75Caww8QWr/wlLC1Jdw2MoxGXYPRqfjAnQOF2o0jbX+GL53RSDmvvHlMvXdkHz+6rP5k3oTYCRaYxKWkTBI0pcxbM+FQx2Dk09Ac6Mg4L2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392523; c=relaxed/simple;
	bh=580JJg8Ww3ZiyIW4O3yV2fBLgEg8aiONXpvmsEP9WsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLQiYS6WOx2oUaZH4ruGGPVQhdVu36XTDsqiDTq78dzWozF98Sx8TyKgxMqT92ZCvsOXxyKUmI4iDjzvl0f1DMH3EQQfttac9f4hmOjfipcEd5DFXkxdnpIC2IaGEPyqcDXjyu4Kp4KeM+k8+mHFAU2bh0X/9WyvhTx4pzZSrY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QaFWDVX/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QaFWDVX/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0618746bso45761755e9.2
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 00:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392520; x=1745997320; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2qxZ5SNufiuhH2/QCBic5ml0Ty+5BazjFOvOXbBOTw=;
        b=QaFWDVX/k6/4BsDqQY+dA+ee6AA99xO4MkiNIEv7KncHTvWkbRfeSADSNdDolMRRaR
         I/Btb+Cy6lqQ5WFuIRBvw3utZGFQEzLDdNDDHHgZsDc9MILpXin1L8D/a4F+F8NrDADf
         WwxqPLafEYaTpGtRKc6QKSdvuQiRprPrQGoDoa/CWIvxCYy2/wN+OOcjFuYhOvorCbBJ
         DjcXO+aIxgWSeBpCcSNnc/Mas61iMkkh+iy5Z9UdL+vZc8n9nVF1stdg/b4T04c0lvBI
         vDgL4PMDduL57nD1H2qRlcvTAN1sHrwhY+aDFFFmciwa+ygExgy0iMHvZj4U5i4p+uUd
         hjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392520; x=1745997320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2qxZ5SNufiuhH2/QCBic5ml0Ty+5BazjFOvOXbBOTw=;
        b=lsI85/jy2oA7rI9hNSaoyCq2NjPOIGWbkdR2KVecl3BH3/dtTByyA/6Ip5E1CU0XtN
         PdhlUen5zd6Z2QlYdXV/wHRkge2Dm4mFrLWU7Wuv4HF2zJdR+x0tG0YOS+TRdUP3Tvdz
         3Qp8HFyoMVWcqZ4KHqwp/nPIrs0DLtUV5CyClX3bhWBR6W3T3tEef3kfSbRWES09Uckl
         hB9SoRSh0CZwdJ0CEZaKJ1wi+HfuLtII4kGYvPaI+9WJQn4MvJOHH/lY+33L3SjaEY6S
         C671BFJsO0VqXLSldvYbvrWl5BOyMBhyG0zQHWZ2S5Eu/rgStlPorky9OelcBozW8GFX
         wkag==
X-Forwarded-Encrypted: i=1; AJvYcCUfBGIk+HkDsSsvkDlEW1aNpjhgBWPoI1y7+3A2gAyNa+WAW1Q2vwWb3eDB/ANN0uy+Osk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGpsPxA5ICo9sB4l5QA909ZGVng4XTWUTPTxWVVZRWXAWgfriP
	4tKZYDgt8AVzLvpVFcbnj8oHoDj+Qf3FjtCHeUKBRjdTmaXw0mEFOTEsJgV5a/E=
X-Gm-Gg: ASbGncsSHu+5qppHuNGAEkPrwj5NMfqcj1odt3dJth1yJjjAFtXVH78B1jCuL9nMVuI
	8ATe3Wwu2qUsH/SX8+wa8keI1q9ESdm5223RxWAYH8GGx4lNu35pLe3cZ0PAMp5smDNfFsENUXt
	ntXnCEq9Eo5zeR/7QtTgXJ/tt7vYOrA5/z1i80jftfgE4DHhxIh17iMYMBvjYDzuWZL33gcfafP
	Q91GJj3bknB49Anoet3dcAbNVT2yeg3wycnilOMmqkgBMKtnWVNlB0qXL0U/bd9llhb2Embkz75
	HamDGICLRTI35Mnt6XRyXKHE114+m3bXQQ==
X-Google-Smtp-Source: AGHT+IGX9aP5FGs6mIYBjE2Fy/Cf3MYPL+aEO76HfSyqqWsd5X9AWMYdMfxaiJI4eGNh/jiqHeIceA==
X-Received: by 2002:a05:600c:4fcf:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-4406abb245cmr171540525e9.15.1745392520323;
        Wed, 23 Apr 2025 00:15:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:06 +0200
Subject: [PATCH 04/12] gpio: imx-scu: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-4-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FRmNocCMgDCqyKK3swLP6cODkyyIC7OT79L9GAY0bjI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOB/Ov6sr/uWpQe44AZ9kTd5SkCbX39gaQdU
 ccSZyRED5+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgQAKCRARpy6gFHHX
 cggXEADC9I9dAp8L1/RZQY0dK85ZOpEVf6XAJMrSnBsXrkLU6zw7OZw5gZkWmuoJf4VcHq/ObGx
 OOhgSlr0WVXDo6p+71iJY1PXUy7IXdkfl3o8/f7H3TRHoczV9Tlc72JuZl/EJopVg3cpI5xRoPS
 zq7H8TZvPbwH49XwIanfFJCXAORxh8P8YSWVm1rn/oqrMUM35wIXkPe5Mvqq8DWJYWbmHgh5z3L
 /tq3HhHxfZGOGDZRbGsT1shgiAcVugWAKTafplG8JXQ93NdJjlrlM4Lno+p0DWjUd9JLjleYD+r
 ZochpLmjlXyaxqH1xATLYR4ZZDAMuji1wbopYnOvFT7HxoAqnRxFkPTSvkBS39wNw8TwsG5XuOO
 5TlTkSEfB4W3GyMmWqhv4AvCnIyll2p7V0/2Vkq8OfR2fHJEpKwZfwsWdfBeCFK6BsLwiTZge23
 bDWGLZfvXivk+h26DY325XhI+4ZtK/PJaabjA/YAF40tVztEJgXYxNx/7SGj6vFpKTj9MS1hlFz
 NkdXl9BY3YDy32+JDNv7DYgBWB0L7/hVA1cEX9nz8gQDN3Nq0+toSuigcaC02VYkZgp/cCKC4ZH
 bgMWCHgNflrBiDi5V/EsYMZBTaQQiiaoYLijx72aN++D6tnudp9Y0o/dqxjScLYfu8xNbjfcupu
 LRcbpKCJb1Q4l3g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-imx-scu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index cf98b948f804..1693dbf1b777 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -52,7 +52,8 @@ static int imx_scu_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return level;
 }
 
-static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct scu_gpio_priv *priv = gpiochip_get_data(chip);
 	int err;
@@ -65,6 +66,8 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	if (err)
 		dev_err(priv->dev, "SCU set (%d) failed: %d\n",
 				scu_rsrc_arr[offset], err);
+
+	return err;
 }
 
 static int imx_scu_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -99,7 +102,7 @@ static int imx_scu_gpio_probe(struct platform_device *pdev)
 	gc->ngpio = ARRAY_SIZE(scu_rsrc_arr);
 	gc->label = dev_name(dev);
 	gc->get = imx_scu_gpio_get;
-	gc->set = imx_scu_gpio_set;
+	gc->set_rv = imx_scu_gpio_set;
 	gc->get_direction = imx_scu_gpio_get_direction;
 
 	platform_set_drvdata(pdev, priv);

-- 
2.45.2

