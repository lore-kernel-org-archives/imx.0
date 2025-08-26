Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A7F334723
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 09:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200927; cv=none; b=bpaAz5YS3AgrQCt4ukkRR4I56QHSMQmrg1sBcCMlTwyN4+Q6WJcFVrKvtRdzvLwoGF6litRh7/Yd0L9rOOEftYoR3JyD1Q1HGootTcVEDCx/1UUOjskO151m+ZDxhK7ZDn1dTkl9pgS2Y11j7zixccsRsVL0mKO6RR2Vpdqr3P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200927; c=relaxed/simple;
	bh=89XO/cSDlDrqvDiy5hnnSyv8S9ENOfSPYBciHEOYcmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onOkyI8a/CY4tGjwMSXzbUpbJ6fG6LaIBIyUhOT4HJM2RJwIuRXEk1UM7KKiJm3bKtx0Rautr3tMrheXplPBwdUsUHRUl8eXLcr9z9UeanBD3eyglQi/dhSHT3VYqPPYNZGywK1Uv8xTy5f744dnsIVsKRWpVaeZc9WoTzZ7mMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IJsz5env; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IJsz5env"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3c8fe6bd1a2so742946f8f.1
        for <imx@lists.linux.dev>; Tue, 26 Aug 2025 02:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200923; x=1756805723; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9/kqdJdxWIzIpzlajuvcdUTzcyLVthHgSoaB5kX8CM=;
        b=IJsz5envhyZvLhA4t20iBZlutP7bc1kw9YBhS0Xf1ybSRD/8BpFoOKXb46/maiiCUp
         lE/hBanBK9w2HQGSKlQ3WxwVNjd9DsB/0DCqnq5GjKNHNcBKfHqbNsAe7Ni3Sz80sRgq
         P9tO8uM4TEKmAE7EeOSBaTVw+7mpDpIVuh4fFjUBQDkTfZiklWUz1CVKc9NCElRI1Gql
         yOK9HULP5ANPnSL85xdKb/hfmy8NA+XWTk/uP24QINnOhZ/fzI9K3TguXF0Xb3Zqj/8D
         /MLO+Z1KnYIgE0xkQjtkiNWOOfD/IuQ4xldKajHL4uLwFiwV050Me5Z5z4p/YtEaMrBw
         c8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200923; x=1756805723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9/kqdJdxWIzIpzlajuvcdUTzcyLVthHgSoaB5kX8CM=;
        b=BCRsPaVbA8yxpmIXATVOpLP6Dycmb2FqushR9LVKWL6b9L6yujphjrNKS45Hrlt5Mx
         MZ7vC+T8ICUCZlUO2eajPTH8ci9CLIIKsaDQONgN9T2Az02ZkZt+T5DUVUfTYPpZMJHP
         W2EOMp551L9bPJTj4CheKDiP5GaMxAImSTipW4vLfEgS+KpvBmYTChS62BwSdAmJnSir
         cIlxWJhUnol85Jb6HCV4Pz5xKADw/bHxbnBijwzPR4Sf2jwhP6M9PP9O+nKFWnQFkell
         z5k28f92yt47EGaZAJI0Kp984UnsGUekaoJs3BFJSIkh3a9gx0D/tjjmJSvx47PDeT6J
         i13g==
X-Forwarded-Encrypted: i=1; AJvYcCV17WPZqeGPXVN8omdXbivg8ejT60vSAMXCrX61TQ4a8ji/h0puyjyWbKG9KJKv7T33me4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8CR181s+DFFWsbjT2/0vm6iZZmToVF4aRmlQpbkbNC3t3hOQu
	mMZSrRN4aHevuAJENRbhy8TDjLF7LTpq/ZHWlwxvOqs7S4zybDoq3qOZMOWLbdoC3rk=
X-Gm-Gg: ASbGncuWTxJCNWjOM/2RnCOeWQlC/35t7eDQUEdq0msPkZnzNuF9qtrWHhXfjk9x0+u
	Qq6MgoKbEkwp15iBYeGuoO1LaLCDNBQhQi7RtTP+lmxKOC76lWhLU3HwvaOK2rMeYd8PZI7Jkaw
	AcLsH9HmfBjjyfzOieOqxJKS8F2DsRz0ApbhrJfPYyKBW2peWcOvo1U7Dl3xpIRcFzkQS32BhX1
	4hL56EooeAPZbzrojFU5R2AogwpApZ5r0/us8YD9MIh1KRHSaaSdDM4AliRyBAUjaLZmPjZbFkL
	VwoMtYY8eETW6bbDeBxhzyN/PIAZZXpAx3JkmYq2QjLJ4RmY7aaCftq1WsQxb9chHd1IBUyrQ4s
	U+XdNPaKa/ja8lvf9ehKiJqWB58o=
X-Google-Smtp-Source: AGHT+IHhqCZTTh38nJ9OEB6j03N/ymjt8499IA6NoJIW3vQyaWoOGjFqqoGaQBY7r9K6SnO7/9Dt/A==
X-Received: by 2002:a05:6000:1ac8:b0:3ca:99ad:5191 with SMTP id ffacd0b85a97d-3ca99ad5743mr2771250f8f.8.1756200923181;
        Tue, 26 Aug 2025 02:35:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:11 +0200
Subject: [PATCH 10/12] gpio: hisi: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-10-f67603e4b27e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4915;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6Mqj30ZaBzEYO/i4p5Yuij8imY9alsKREk3LJC3mQCk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/OZLkAi3tbz0g8kZe2iQka9yX236eZwcXpm
 zN2K0t6BSaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zgAKCRARpy6gFHHX
 cjfBEACYtgt9Zss04cf7kKQJ93aA8/2Cm03zXtnSWIt0g9bpYwn5i2vaR1XPPEqvm0ANtUgonUD
 QkebsSs384De1FePWsu6S2QSAF/500qGclluBNfJZmKvUVCAFNVGzNtWXSZi2li3R59ArLWGT7G
 80w1Bk2KszNtKFRglzYv9VWn7hljzpxcwLzcv4WqcITYT0lG0G53JDhQh+8GSzh0FyQw+q/e8w/
 dip4YjPllUjQoQAOQvNovjWRbXNDukdmIq8k5z8vvS27EUd5ZTlR61mrYh2FV3MaVhThCEiQapm
 CfYZe5EW/LtyRlRrnun0qGjTF43hTNTX5sKc8n6VKcRwthxMwvcT/dvIeQFnKrGjUPelo9s4aLu
 OcXio2M5QpnRTK/g1PsIPc54TB/VGmh45AAc2YvH2R7fk1bJl42hc8bAAn3LitQIFXyRUH4fXTc
 Nh6immFsHmAZbCv7dqFPUf0L/dqiTGaZfu0FJ7b1NWeMIU/hH9pUvVl4MyyXzCmzMbpOLhTCjjy
 SuueZkprVyEnwcKoWcq2Td8MNjueS4+rSci1rDm7+ciVhafAYVeWCqkvA0tjYUR0SujBnjsT3Dp
 GeU2U7ViG44dNjlsE7f2TsdLL9OndQnibEDdm09J1XhED7CO47HaVIYhGMQlWAxwYHP2/jMHJRb
 54f5EVCVEzM9flQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-hisi.c | 46 +++++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index 6016e6f0ed0fb80ea670ebb575452d9ec23976fa..01a99ac613d94e933d30f782520776693f048d1c 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2020 HiSilicon Limited. */
+
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
@@ -33,7 +35,7 @@
 #define HISI_GPIO_DRIVER_NAME	"gpio-hisi"
 
 struct hisi_gpio {
-	struct gpio_chip	chip;
+	struct gpio_generic_chip chip;
 	struct device		*dev;
 	void __iomem		*reg_base;
 	unsigned int		line_num;
@@ -43,8 +45,8 @@ struct hisi_gpio {
 static inline u32 hisi_gpio_read_reg(struct gpio_chip *chip,
 				     unsigned int off)
 {
-	struct hisi_gpio *hisi_gpio =
-			container_of(chip, struct hisi_gpio, chip);
+	struct hisi_gpio *hisi_gpio = container_of(to_gpio_generic_chip(chip),
+						   struct hisi_gpio, chip);
 	void __iomem *reg = hisi_gpio->reg_base + off;
 
 	return readl(reg);
@@ -53,8 +55,8 @@ static inline u32 hisi_gpio_read_reg(struct gpio_chip *chip,
 static inline void hisi_gpio_write_reg(struct gpio_chip *chip,
 				       unsigned int off, u32 val)
 {
-	struct hisi_gpio *hisi_gpio =
-			container_of(chip, struct hisi_gpio, chip);
+	struct hisi_gpio *hisi_gpio = container_of(to_gpio_generic_chip(chip),
+						   struct hisi_gpio, chip);
 	void __iomem *reg = hisi_gpio->reg_base + off;
 
 	writel(val, reg);
@@ -180,14 +182,14 @@ static void hisi_gpio_irq_disable(struct irq_data *d)
 static void hisi_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct hisi_gpio *hisi_gpio = irq_desc_get_handler_data(desc);
-	unsigned long irq_msk = hisi_gpio_read_reg(&hisi_gpio->chip,
+	unsigned long irq_msk = hisi_gpio_read_reg(&hisi_gpio->chip.gc,
 						   HISI_GPIO_INTSTATUS_WX);
 	struct irq_chip *irq_c = irq_desc_get_chip(desc);
 	int hwirq;
 
 	chained_irq_enter(irq_c, desc);
 	for_each_set_bit(hwirq, &irq_msk, HISI_GPIO_LINE_NUM_MAX)
-		generic_handle_domain_irq(hisi_gpio->chip.irq.domain,
+		generic_handle_domain_irq(hisi_gpio->chip.gc.irq.domain,
 					  hwirq);
 	chained_irq_exit(irq_c, desc);
 }
@@ -206,7 +208,7 @@ static const struct irq_chip hisi_gpio_irq_chip = {
 
 static void hisi_gpio_init_irq(struct hisi_gpio *hisi_gpio)
 {
-	struct gpio_chip *chip = &hisi_gpio->chip;
+	struct gpio_chip *chip = &hisi_gpio->chip.gc;
 	struct gpio_irq_chip *girq_chip = &chip->irq;
 
 	gpio_irq_chip_set_chip(girq_chip, &hisi_gpio_irq_chip);
@@ -264,6 +266,7 @@ static void hisi_gpio_get_pdata(struct device *dev,
 
 static int hisi_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct hisi_gpio *hisi_gpio;
 	int port_num;
@@ -289,26 +292,31 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 
 	hisi_gpio->dev = dev;
 
-	ret = bgpio_init(&hisi_gpio->chip, hisi_gpio->dev, 0x4,
-			 hisi_gpio->reg_base + HISI_GPIO_EXT_PORT_WX,
-			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_SET_WX,
-			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX,
-			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_SET_WX,
-			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_CLR_WX,
-			 BGPIOF_NO_SET_ON_INPUT | BGPIOF_UNREADABLE_REG_DIR);
+	config = (typeof(config)){
+		.dev = hisi_gpio->dev,
+		.sz = 4,
+		.dat = hisi_gpio->reg_base + HISI_GPIO_EXT_PORT_WX,
+		.set = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_SET_WX,
+		.clr = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX,
+		.dirout = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_SET_WX,
+		.dirin = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_CLR_WX,
+		.flags = BGPIOF_NO_SET_ON_INPUT | BGPIOF_UNREADABLE_REG_DIR,
+	};
+
+	ret = gpio_generic_chip_init(&hisi_gpio->chip, &config);
 	if (ret) {
 		dev_err(dev, "failed to init, ret = %d\n", ret);
 		return ret;
 	}
 
-	hisi_gpio->chip.set_config = hisi_gpio_set_config;
-	hisi_gpio->chip.ngpio = hisi_gpio->line_num;
-	hisi_gpio->chip.base = -1;
+	hisi_gpio->chip.gc.set_config = hisi_gpio_set_config;
+	hisi_gpio->chip.gc.ngpio = hisi_gpio->line_num;
+	hisi_gpio->chip.gc.base = -1;
 
 	if (hisi_gpio->irq > 0)
 		hisi_gpio_init_irq(hisi_gpio);
 
-	ret = devm_gpiochip_add_data(dev, &hisi_gpio->chip, hisi_gpio);
+	ret = devm_gpiochip_add_data(dev, &hisi_gpio->chip.gc, hisi_gpio);
 	if (ret) {
 		dev_err(dev, "failed to register gpiochip, ret = %d\n", ret);
 		return ret;

-- 
2.48.1

