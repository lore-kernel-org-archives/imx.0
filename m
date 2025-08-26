Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FA8319848
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200918; cv=none; b=IEIr/VjGOxWoeXL5P+X36d2fBUSr+/z3mFZSpyF1R7skGqRUbMSLkG6Uymajd+dwlnsNJkwDUBKelD/NLAiwM7dZYGMuq+/sE6IeKL+KJENvCTMb6npR87tuY3LJCCd0YokOnSJZnJAJdwSbkXTog7SsLMPC+Ynv8DoMi8YuGn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200918; c=relaxed/simple;
	bh=Gfv9Ago94CXP5utBaw4fU+EZTbz1Kj7tHHZOzfPLbKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=maUyEIbKgkY9Wkt1pAzENX7s/RU6BIJFppMbPGVb2OpMVWLH7fLG9WLIgLKx+cInud4tgaatpYTxhDgiZBESSDdFcRRTyHAne4NiNYdl0Rl9p+vlouFgn1loEf38HDu+uSMZk+Bb5nKnlfPTYUNrVa/yiHZhgsnFRJN2FkCiuB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LigEOyxL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LigEOyxL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a286135c8so32164885e9.0
        for <imx@lists.linux.dev>; Tue, 26 Aug 2025 02:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200915; x=1756805715; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVtjQaO9FUN7/XwM1xAPJnZOqE+/4XCsmHPSuPjcvYw=;
        b=LigEOyxLHKRSFa4fJDQnAX5Sax8SEfxZRZzFEYEAd6IH9L0Y9WZRkGDngbYXy38+jO
         C8wKbnvTWYBNshvPQLU+TN/2TyaQTr4bEChCrZu13LMzR+WDnnww8OPGVj+gPgqNVgTC
         agFRaHckZ4dUSfZFy8Ewn8JK2kf9c61GZHXeDxOHkFq9Wa+wupJ04QOn/iaTnMoJ5wqK
         b4dEAn9ny8qpLPKx28/XDMWGZamTfyLbD9k+X9mX7OQ8YnFUu9DZK/9CV4/rKHckiChg
         1aT75xDoR+c2K3A8dNIpUdgHK1Di0dTxUQFUOvVzXunpFEMGR+8sQP4DbUx+NmzipxbV
         2yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200915; x=1756805715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVtjQaO9FUN7/XwM1xAPJnZOqE+/4XCsmHPSuPjcvYw=;
        b=UZh6YBkAYLkJAU3YyrNF9kuK5TomwcAzS7r7HaNZkT00anS4ZA7katxVaCjcsc4L7I
         Gwoy1xU8hUH/qTXweOOottIbwnwSiUY7zexFdpPQTMqSuN0xrHNOntjO4S0EvLwX9w83
         nce8fHsRr5nAAlYuK5O5jSsdn20OaVQH+Dv5ES9ZAGEAQi8aPOkL/72C5SIIUn67aKSL
         dMV4rtmy/IUvPESBYEWSPbfvrWFF1MhOXH6U66yEGVu0oCjAARej3cUYQoKkpx4M8Ubv
         6lt6aFUu4PTiYCJiC0gfmS6KJGYNHbbZkDpnXs3CzITjMXGHykYwsnjDVu6fZt7WIhwV
         07Mw==
X-Forwarded-Encrypted: i=1; AJvYcCX3ERhlo+eVoEVNPXeM39HQH7GI/qHnubTh7qESC0pHyKu26rQO5n90J/F77z6VLpUlrbU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnyGeld4mj53YaATNCQnIRW5Jm0LTKkd+Yq/c/+PUD8Pfet6DD
	gTozoXz49RbdV8UKiaVujf9QBszXT2irgpPEWTTsbmPWmF4gQi9hlNDH/n7dJMCfioU=
X-Gm-Gg: ASbGnct1INwC8XpRkMJyCjy2cPbgmZs7Y5pygUtGMZUhBRoL01d9qZomufowHrXkO2N
	3cOz2F/IY22BuJePLKiH1qa1HKlWuqF8QeZhY5IdIe5a0axei6pQJCudiKZxItqKW8sjP9jybqQ
	XtWwcDP6jHs7+fVfFV/jrhqegGjWTm/owm7yfkEX254XRNaa5fPk3gw2Pbxp8MU1JaGVVAWJpue
	FOxDknv30QSo6FY4p0UiC2h3Y7vTyD0/2MkgQU/bRf8PnSLUqIuAFmHna+kVI951Yt2l1bCDnS+
	EtbBTdnaMqJyYcKMW7NVF15TVw24rHfvQXnTTs3H1GbJPfiFYo/MxlUGhmOKS7nUpB4Q8GLxiT+
	TmpNVCOlW6ig6hJ2t
X-Google-Smtp-Source: AGHT+IEcoJsgmjphkLaCY8z1x0fKRWtSW7NIH2rbVg0Bebi0KJdLdeLAxxGphoPes56w3cIWmHwWUQ==
X-Received: by 2002:a05:6000:2212:b0:3c5:91be:2abb with SMTP id ffacd0b85a97d-3cbb15cb064mr776761f8f.13.1756200914980;
        Tue, 26 Aug 2025 02:35:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:04 +0200
Subject: [PATCH 03/12] gpio: mxs: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-3-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2419;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9MCYThfKCHi9V3LmNZZ162FlxVao+jUCJlB1GFrLa1U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/Ms1es94ApzC2OU6uJvsfb71RsumjFI0ECG
 asyeGyiBViJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zAAKCRARpy6gFHHX
 cpKbD/9XhCYwy0uO9HF7kjT7iMcsW+OG0CBIKIZNICRSe2gz9bxqp7ZkzGEFy75ZhruK8txyRHM
 1QljkZkUlMc4VHZzUDaTn0kmO0ZjZJj/UmWeLrjYxVZbScxHvwnXdUeoJCehxXtS1cAdFtdAo9j
 sIIQtC29Lvp3zyYgs/BvkqBz6uBHnlLUjrj2w0zpLYN2kA2xkMrCCP5RimnAeR0j8MBegwta1Hy
 l3c3S1WrVTF1umKHxWJsxC+8q57se+Sxzk6IIikNDu7M6aPAMZdFpaDVgkiaL0OMfRvemNNWa9S
 zIpJIt7g+l1NOBFXKsDLTWCbgpmS6YX6eNBgm2MX5Yv+MtmXitZL79GU8VNYNFkXaj1wS6u5UFn
 qVrUTfFWrnZ7ZoIU48RtQDHnN1pptQShtsKl2EPelamaZsPdPIRaslXV3N9YBf0Rr0z69fmAXXX
 PSqOBLuvaylNBGIq6RzxslEZ1rvVw60+LTt4/fmNiTsVt3cux6Lq3brvc1D+uWALEa9SF16ewWY
 b11ayAUAoiSCVWDX2uuSMQ/KTcFlW1qr4qce4u/2q/UjRxSIMf5xyDLtDJVtyYB6DJsiLrPX1pA
 /wdqeFK3IhPoU8Oy6rnINzo7Rk+u3uCZuefbHiJrOQv+IbOEZRsBgX0mZGtkwhT3pMQKcM85eoE
 PDNXJixR2NMtbxA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mxs.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index bf0c97f589c96a5dce37dc140babda5998d5e365..af45d1b1af6e049899ea6773bed92fb8a84a0dff 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -8,6 +8,7 @@
 
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -48,7 +49,7 @@ struct mxs_gpio_port {
 	int id;
 	int irq;
 	struct irq_domain *domain;
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	struct device *dev;
 	enum mxs_gpio_id devid;
 	u32 both_edges;
@@ -258,6 +259,7 @@ MODULE_DEVICE_TABLE(of, mxs_gpio_dt_ids);
 static int mxs_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
+	struct gpio_generic_chip_config config;
 	struct device_node *parent;
 	static void __iomem *base;
 	struct mxs_gpio_port *port;
@@ -319,19 +321,24 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	irq_set_chained_handler_and_data(port->irq, mxs_gpio_irq_handler,
 					 port);
 
-	err = bgpio_init(&port->gc, &pdev->dev, 4,
-			 port->base + PINCTRL_DIN(port),
-			 port->base + PINCTRL_DOUT(port) + MXS_SET,
-			 port->base + PINCTRL_DOUT(port) + MXS_CLR,
-			 port->base + PINCTRL_DOE(port), NULL, 0);
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = port->base + PINCTRL_DIN(port),
+		.set = port->base + PINCTRL_DOUT(port) + MXS_SET,
+		.clr = port->base + PINCTRL_DOUT(port) + MXS_CLR,
+		.dirout = port->base + PINCTRL_DOE(port),
+	};
+
+	err = gpio_generic_chip_init(&port->chip, &config);
 	if (err)
 		goto out_irqdomain_remove;
 
-	port->gc.to_irq = mxs_gpio_to_irq;
-	port->gc.get_direction = mxs_gpio_get_direction;
-	port->gc.base = port->id * 32;
+	port->chip.gc.to_irq = mxs_gpio_to_irq;
+	port->chip.gc.get_direction = mxs_gpio_get_direction;
+	port->chip.gc.base = port->id * 32;
 
-	err = gpiochip_add_data(&port->gc, port);
+	err = gpiochip_add_data(&port->chip.gc, port);
 	if (err)
 		goto out_irqdomain_remove;
 

-- 
2.48.1

