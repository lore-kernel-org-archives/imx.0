Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D7B1C863D
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 07:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392526; cv=none; b=q2glPF73ahABEmARgdj3ouxN/BLP3PIbkeJ/kjbPhTwU6tLDhsdkysjcrKE9UUbF+NB1AW9omv6dGcJP5lnaJGuEIY84Y4iSlXPh4q4Dhfml+i7TJBwsCudMYtQDhtdiT1tr5EiQrYPLY2KTaP3fDr8n0irPwoYXeVprc11UHag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392526; c=relaxed/simple;
	bh=Yz8WOxIm3KcX8ffshwPSeQmdmfycny0IGC1PIWIi2Ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfnJ59E49Mx5RWijjmz5Kr9p64DqmRzN6CbIctPuBov8bkAJrSQgkWcWKucWSqo9Hzt5/1rEuixSUxH+plo93o+P9HriSwRMbAgz/FYhHhUZ3l0SNmpHNcTvpeXs1zo8ZqUF775XV8GtLx3QcompZqLVZiQr2810By21gHvanHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bIwvHhIs; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bIwvHhIs"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4947223f8f.3
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 00:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392523; x=1745997323; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOrKi22/dqfrB3rRPsto8GuhAZh+Tay+I6m8tbaX9ss=;
        b=bIwvHhIsvK2yM01Jr+V6ZhTDlcL0Ok6tGmIgTgVXmcONKo0EOyEFegIqgZV1MisHyF
         G3xGXVT2DQV1gBGf65suLj3iAIQ9lbMu6DhVUDBLJs6j4La/mbzhaTlNoe/jTIEJ7A6d
         5/Kj1Vutnd+Nv8wFiZgSvSntoOCrUjypwOqCRR4cHbfaoKO1wW68jJnlyFpvvC+/mL1d
         E8+2cBUI19ejljj2VYi1WQr7poqud95tJ58iLWHluqCU8DqtXCNDznQMjCu4c1CeHZ5k
         9LxwM3LGRRwFdYqMMQLmPcKU1T93fn0ScohnBqthfSEbLQnudAMW1ost+6jNv+mb/JtQ
         Tnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392523; x=1745997323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOrKi22/dqfrB3rRPsto8GuhAZh+Tay+I6m8tbaX9ss=;
        b=YUd40iuY1ZLx4hPc8uDD8KAWLZtJ9SluQh3fQbPDUCWfOTMK3MKowg8JKVdOZFYNpH
         EVtXkvHL88VxWUbYmQzJgUBgd793qw4Aeoc28Yz64PQaThwEDnjW3ApAF29XBDxa+HUF
         quChOzWDa3VGJSr5Z6AjRtEEy2DA3WMrjPstORFdu23i9QoZJzXfCfF4qJh09Y5FIjhr
         iXfSf4croUKRj3wbwjb/lN/KhHnEHbVb4hI2RqWpGcZkiJY2epGZWXux7mARl1UyfwkE
         iO3C9kcPyc5Dn3z14v5E+xz7Gt76o7vsfuBiCfb3XPiYzs8T4nrYfkhDhsaHLJbrzut5
         cr+A==
X-Forwarded-Encrypted: i=1; AJvYcCW9Dn6PLaT7E95btEIJO97vL70iVM7hNfDV9hKrHA+8vtvSj28ECjmTPYF0xqL4cEWF9pw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBjC8Ud1wC/eA6zEb5C+Bo/fOHzPthwHbkXfpw4N9X0ZqHiZBg
	KTfDBGnkvPOoFuxB3+qPxrJj87lySEWdp1/fT6XC8ZtkUamWS+PadeceRcV3x/w=
X-Gm-Gg: ASbGnctpX4eIov+JkYTviJEs82IJMZRljXKx4f6QS4jjESFPOIhdRDNbv283xurVZxY
	H+bG3ezVnP2ZqFSG4E7W6iB5PrtCG08vv4USj8hI7zldunzaMpmA90TyUBVgxka+Tnw1TfDiqlc
	GUdnRW8onlg4A/tEuZPb6OC8ZX2uKqkoSSPXKK7FhvWiHJtgcKjVRfhMh1HRWh4KWj4bgbKv1Wh
	4lAPXWKTm97Nn3pK2T/9hyf2U83xwwADI6c0W+NDBKSvv/dgr8pYjCGA68FG9BoxeX1LtgdM7zM
	mofzPXH8Yu1zYmkjBtt8OXufiiMZ3JDLl2qfomt7rPNX
X-Google-Smtp-Source: AGHT+IHdkGntLIJpgevULhTBulmEF5ptbiFqEcKnuw1ZYC5LO7PfKcAh/nJQn8PlRTrDNV7n7jcsNA==
X-Received: by 2002:a05:6000:1ac9:b0:39b:fa24:950a with SMTP id ffacd0b85a97d-39efbadeb66mr15392672f8f.36.1745392522799;
        Wed, 23 Apr 2025 00:15:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:08 +0200
Subject: [PATCH 06/12] gpio: janz-ttl: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-6-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=oGCmkNdKxO8RV4qMx171fBCKku3RxsPW1rRe6wl5k5U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOC3ZB4v8rJEF242h0kCZt7/M/4vNi5Q9Irc
 rSkGUQUQIuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 ci9aD/wMJoqanBDyhWyV2ciSgT4vnvNazG6/H6xjmAw90A83pI0LeE/uBgMTjVvQcXkJ5sq9IYL
 pMQSAJDO+V6stHMm3pb8C6op4t6h3Uc3VyntOGzonCdXOhYHjtd3z7+1O1AgceR1Sfh+XqzK8Ap
 RDabrPY6r0T60Q66e9DKH6C/GuUq++t7HdI6+p8bK+4hyg1KsZ2riCv/y6Jv9RDUwkDHeAgSPMi
 n+xeuvQH4kpG2kutaopWhLWTNt4QLNFjzcR3NR6t7PXKfsVZmXpG3wGWmCs1pazlZaoVTuidua3
 JPPn+8N1sO/TF+0t1fMuq7nmhzaXJy6wvGv7qUVzk4yVVZYqHd0TzaWfpTdXmtfcrTyGKVM1zQh
 WpNYEX+OG/GZqgllUCdo2g2HfGMcvoyyOtsArAdwuUMDRgyasslD5iMmf72CTQBi2h0boA/y5HD
 JAcVLK498gmhcjsDh8Z2B3G2OWMC4JnTWtyh5nR7PXGa+bL3h23eyxp58LPtNBE49yPAfgYZnkH
 EYbwRzldFMMFKj+1mPfhV0R4xDhTYuItjYD0wgpt8WkyqXqstGuhJJmEXA71c5ieMeTYtvYPDba
 LmT0B9ncjdETBR3ARAWI6mdFerI79rP7ovhcgTOb0S2D4kUYBribi4KtAcjp5K+gjNU5ZXZAJ5i
 2pDfSwy4Bdlnp6g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-janz-ttl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-janz-ttl.c b/drivers/gpio/gpio-janz-ttl.c
index cdf50e4ea165..9f548eda3888 100644
--- a/drivers/gpio/gpio-janz-ttl.c
+++ b/drivers/gpio/gpio-janz-ttl.c
@@ -76,7 +76,7 @@ static int ttl_get_value(struct gpio_chip *gpio, unsigned offset)
 	return !!ret;
 }
 
-static void ttl_set_value(struct gpio_chip *gpio, unsigned offset, int value)
+static int ttl_set_value(struct gpio_chip *gpio, unsigned int offset, int value)
 {
 	struct ttl_module *mod = dev_get_drvdata(gpio->parent);
 	void __iomem *port;
@@ -103,6 +103,8 @@ static void ttl_set_value(struct gpio_chip *gpio, unsigned offset, int value)
 
 	iowrite16be(*shadow, port);
 	spin_unlock(&mod->lock);
+
+	return 0;
 }
 
 static void ttl_write_reg(struct ttl_module *mod, u8 reg, u16 val)
@@ -169,7 +171,7 @@ static int ttl_probe(struct platform_device *pdev)
 	gpio->parent = &pdev->dev;
 	gpio->label = pdev->name;
 	gpio->get = ttl_get_value;
-	gpio->set = ttl_set_value;
+	gpio->set_rv = ttl_set_value;
 	gpio->owner = THIS_MODULE;
 
 	/* request dynamic allocation */

-- 
2.45.2

