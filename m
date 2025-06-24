Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B372D1F55
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771676; cv=none; b=p/4Cl+e5tLPkqvXloyPrJ6/BtTTxbqn7Gm2qhhX2RXcbPfP+aEnMTituiMlIEttU6ILgory4iBO9vtYQs+EX6STTvJ81v08kcjsFKkgUGomDDTvdI9tyQ0p2BXNrlfjcRUowNokobkTJfPw1PjAN0wUlpE8alCUF3CmX8ZQGxfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771676; c=relaxed/simple;
	bh=R+PEDJ0Mv26hKQ/UhrohM2KU4JOPq3DqNEqRcM1cY8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FNvI23VwLBnJeOQlBGsWpzhDDE6vAnSGrh7wGFVTeiN3eIvT1bot0QcfuU6gQ1VT0otecVv9r/jZ0EGZy7+/Gh/vxl6wMCFGzrxehL9Sx6I2hN1kV36Zg4dWfm/CmDAbM/V3ofn7IieR3yixJ/uSSrkCseNFQfwCDtLv9yPSrN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1L3E6bit; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1L3E6bit"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so29205315e9.3
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 06:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771672; x=1751376472; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kQaxyBIjK8VEwym/mLAJe8Z7aaiwFK7Iag2ch85G3A=;
        b=1L3E6bitfCEW2RqUYJriPW2YjiHAhDSXL1Tqg7hTA+7GoKQHwVnlfSKvuCCZb+lX0B
         Gj77zzP1Hhwzwi3DwnFL5t2w6S/x/ZH2R4utLaxDpKGHT/w+0dDYx+hK0qNck8tTu4Ro
         x7Mj9dpWImcCjUmEfMRAzcgl4S9ZTYSOHA2b5O9DBwX4xFPJ72VpX4IF6XWgJqXKsCI2
         XhlrvqQB6OvmbVjwYCGGm5FoOeLzSRx6BT5jRLFzikd2MGUmDoqzmJOsVpbekBZiSYu9
         xBPXa4AwjYntNFONhzmO8n4H9r3ojKmxVZoXDpDjh71OyZdVsmSUSqiq9xHY/9LHV3iJ
         riYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771672; x=1751376472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kQaxyBIjK8VEwym/mLAJe8Z7aaiwFK7Iag2ch85G3A=;
        b=nLEhat6wJORaw1jqSxqo+bG/THhikDuK/WmhzuOrCOKJGWqt9p38weprrZH3ZSzciA
         V2wIkFn6zk4iQ8I+lQbuYBvQFn5iEFSqwZMcYSNqNdNk2f68WUIoocmbTfIqbDNT6ZOI
         MBgEX3GE29rEayar1SgWb0XwXn8I4/6n1C2DwSbDLSiQyrfFrrX8NQqa7kw5Ho7MpiQL
         +6mjevIbbVaLAi2HI4Gusl7/wMH2JdtXxCxvOtJqs2mNnrORBDkIshyTU1qWXWyGo/JS
         OiZhKeOJ1PhgVrrD6QUnIuvbuShmt0BbX4gkXCrlnjJZOHf7D0+tlFtU1hdx5gzhh4Uk
         wVCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfbUaKRqJyIGP5zJIKUfGklBSM+6Tuv4ydp/co1SL0GPallhxEzRuiCyPtQ8a/+qM3/wE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOQmnaLXqApAzgE7RTz1xRPaYsR4Pdha4dOw5HpVC9Ch8nt+sQ
	e4Si9aZw5yBRgwoqftrPO09+J3o+Ks6d38JZfSmoUyp78c67fzD3tiISQn9HrAEzbYsKfM4IhdE
	+D2vcCTg=
X-Gm-Gg: ASbGncv1tmy4OwodQ4nN3rNg7iewgKSUV3DsxYzErzhgBOmADg2LxSzX8hfcMZwpcPU
	A7bAIQKQg81ERudfOuyiokr2dSnezMc7GwEYQjlQLDXCpZhRzkiAXqBcZePvhDsl7Xrg47goiIe
	FlgQ8qa6eJoHZcIE2l4vg/1x8Fha3LYIgCVAL5wOE25fHldyRL4HhdtPyNR/glWRruClgYRphFE
	inFlERXuCUeMQ8wIWWH5Sn2ncq9oI70js8qQu7dctaK+2d1LMGYDblx3KDJTjZT8miqPuf+8mip
	+zt6qnTId6rd+dWHzoub023jaAQoyU35yd92Abcm3MlJoOiuhUBDm8g=
X-Google-Smtp-Source: AGHT+IEPTDzwLXIM3Xph9atHSvAHfYbq+2JUrc/xQh3stYwnvBg1/yvk8jivlT9igvBuM/YtgbIgpg==
X-Received: by 2002:a05:600c:6211:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-453659f5828mr132853075e9.26.1750771671769;
        Tue, 24 Jun 2025 06:27:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:39 +0200
Subject: [PATCH 7/8] gpio: 74xx-mmio: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-7-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dUd8T2o5opExyjr3ESy2M3JllSvSI7yIu15ScqE/S2A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfN8G55LTaf9eBZt1P84/TXiIGPUQWZadRM0
 uyhNgVY3DuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzQAKCRARpy6gFHHX
 cmSAD/9YkjgnB3SuE3z5/gI6W0O1DNNnL31sikzurphtycOsPnuH0nx+xhHn7lENI7Lf5aKAkvS
 auPZhFMyAdNnnsBfZlP5FCFdp889Uxrgwl/QyQUn4doBf67v0gI8dv32BYDGw7ZcGe+4tJVjQ+5
 YStPY2QLQJwGmsm08MSU0i09S2O6b0exvICbSSNBe84p4aF6mmtBZU76dXKjsp3k8CfhnUTcQw8
 IqAS4TZ9P18ky4kxYrUcmuqskngqV/ugdcGRFhULphctmF38OTU2UNW61zWI+tq5i2xtHPYNNvx
 xwcHvDJzw7Uy9qH1V/EhKNOwbbR3xBv39S4QSZMiid5r7o+MQXsCypqr7uXNmOERi30Hltv9ucB
 WEfHQNK8YynKQR5NmyDUtO17ndT3MELJyjduRo4AZGHt0/NNy+L5J/G/MFTDbpTpdD7iyU9G4YM
 7nWwyz4dhN8TSnc1qHEXO6fT/E2TtOEnhoQU/vOt9Wpm5IoAElYIOrEPOQpunRaOQ3JN5l3ezDp
 iiODbsrAFEnZ9fNsBZ4nMCfdCAd+SWTHR0S/aMT39+fDkELXA0ICxBZz5RPkwNWvaAEeQlqfE2A
 l5zctvRNx0NhhJE7mzVrVSrmVk2TqNVNvcppwFKy6YXlDdGdGf4wOCbUT5MM3/TxNw7nNDxESjL
 nWWorj9IzX1A5Ig==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-74xx-mmio.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index 3ba21add3a1c669171578ceaf9cc1728c060d401..bd2cc5f4f851650a499382b050a556506f4c5031 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -8,6 +8,7 @@
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -18,8 +19,8 @@
 #define MMIO_74XX_BIT_CNT(x)	((x) & GENMASK(7, 0))
 
 struct mmio_74xx_gpio_priv {
-	struct gpio_chip	gc;
-	unsigned		flags;
+	struct gpio_generic_chip gen_gc;
+	unsigned int flags;
 };
 
 static const struct of_device_id mmio_74xx_gpio_ids[] = {
@@ -99,16 +100,15 @@ static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
 
-	if (priv->flags & MMIO_74XX_DIR_OUT) {
-		gc->set_rv(gc, gpio, val);
-		return 0;
-	}
+	if (priv->flags & MMIO_74XX_DIR_OUT)
+		return gpio_generic_chip_set(&priv->gen_gc, gpio, val);
 
 	return -ENOTSUPP;
 }
 
 static int mmio_74xx_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct mmio_74xx_gpio_priv *priv;
 	void __iomem *dat;
 	int err;
@@ -123,19 +123,21 @@ static int mmio_74xx_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(dat))
 		return PTR_ERR(dat);
 
-	err = bgpio_init(&priv->gc, &pdev->dev,
-			 DIV_ROUND_UP(MMIO_74XX_BIT_CNT(priv->flags), 8),
-			 dat, NULL, NULL, NULL, NULL, 0);
+	config.dev = &pdev->dev;
+	config.sz = DIV_ROUND_UP(MMIO_74XX_BIT_CNT(priv->flags), 8);
+	config.dat = dat;
+
+	err = gpio_generic_chip_init(&priv->gen_gc, &config);
 	if (err)
 		return err;
 
-	priv->gc.direction_input = mmio_74xx_dir_in;
-	priv->gc.direction_output = mmio_74xx_dir_out;
-	priv->gc.get_direction = mmio_74xx_get_direction;
-	priv->gc.ngpio = MMIO_74XX_BIT_CNT(priv->flags);
-	priv->gc.owner = THIS_MODULE;
+	priv->gen_gc.gc.direction_input = mmio_74xx_dir_in;
+	priv->gen_gc.gc.direction_output = mmio_74xx_dir_out;
+	priv->gen_gc.gc.get_direction = mmio_74xx_get_direction;
+	priv->gen_gc.gc.ngpio = MMIO_74XX_BIT_CNT(priv->flags);
+	priv->gen_gc.gc.owner = THIS_MODULE;
 
-	return devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
+	return devm_gpiochip_add_data(&pdev->dev, &priv->gen_gc.gc, priv);
 }
 
 static struct platform_driver mmio_74xx_gpio_driver = {

-- 
2.48.1

