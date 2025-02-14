Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0A71FCCE5
	for <imx@lists.linux.dev>; Fri, 14 Feb 2025 23:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739574773; cv=none; b=E9wJWUdhln1g4VXQxn76ZpUaaxYC1n2aOtv8gxDNl/b410teSopuJjDBIUdV8aDmtkztgVwDSdALMCx9IOL0XCATGhzJK+38xSePuzqzEIRrfOqzY56bEsfVplNDgmfCuaaZw9Ac1Bz6JhMe6DZGE+2ZnN1x8eu5lbuRcIvc/Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739574773; c=relaxed/simple;
	bh=cuhl++Eyo/qWEdI+HlBE6Uho06BsrNfrptp+HT6udsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s2aNnyzwv6AteZ6LVsWN1ILCOMEoyBABy/vU9QYmCwUfW85bsgTQEZXs4HqWhnIEon++pRRml5spQO8b14tSCDs/hW3tFTycoKI6yv/Fi3BBzodvUiRSvl0y63Is80K3XpW6EE0iXowXMYB/dFjnuEDK8ShQAb7KriYchPeUYQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yUJxsCYa; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yUJxsCYa"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-545284eac3bso1299650e87.0
        for <imx@lists.linux.dev>; Fri, 14 Feb 2025 15:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739574769; x=1740179569; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ek6NvBPszR8V6i4FwDin84fMqwnP1H0VyLQiYB0Bg0E=;
        b=yUJxsCYanh+1DCadjAlsYfxl2SQPES2zoAEYWvCeRZmBp2UiDCjPUamtmFXqTa4rZu
         S3irh8HXD3da6eF+q/LRK18WPRkCiH1xJ5C4zD2pqM0QBjwLkqFB2JUi9Veo+NxdkwyV
         9IwqQlBM0ZXnNPNOaxcdF8D/K5h1vD1hSNTra2f+/hF0HdsTImgX79MKfLtPTzlIvZnj
         N1FCs92IrkosxtJpF7Xz0FrJAg32PU/IBHW9nNcVtTn/srODUnIu3FkPbdfcpIvEob47
         Dt2e3wGMPxFqMSmDVNGW7h/UB9IBP/bTqXv0giG8VMnmTh7+gUsVZ5kwRqXP5512Ndgb
         st4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739574769; x=1740179569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ek6NvBPszR8V6i4FwDin84fMqwnP1H0VyLQiYB0Bg0E=;
        b=IWrqBs6DkgPbF6bJgtAJoAcgGEDUAkr5C9ihkAkQ6ev00n96AFvnP5Tv3NlSWv4Ija
         s+XG6c9t9N793HApoFH848mfokCYU5M2idX8ixmKc3zDf8iigK1p89TZSenc44xEKdLA
         jGw7BSCDOLsKUxUv53oR0UT23zJ2y8cFOLAWswRM5GsZ2oPuiua4AG6tcwVu+7K0aGjf
         cNXoDEa0pt8hXACJFqfRSQoZHFCiqUn0qb9zfdzbeOA55l/M5KAOgGTgCK6vkdQZIUuk
         IoHiE1MhjdD5CpAhqPrwkbzKs3OiVhtBfCC9ce6W3PANEcrSPG7ZCm1gQQcOFXzuqfMT
         qTVw==
X-Forwarded-Encrypted: i=1; AJvYcCWusEjE10S8q/2CzE1Hh4uufLrg9IDo9S658rFUCz0XbBDXH0VU1wVKCpqUw47RGnTmYn0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLyDygFf8BlqPao7p5XzkyeLM6h0zQk5c6hJpemhQbGzZT0m7v
	7KDPoGnMO2PpBoOYTOPMJ4w4oDYZt2mY4tlGnAgHYbjTvxd3foxyMWwbJDXzyy8=
X-Gm-Gg: ASbGnctwgCDtx+SMR/LKIsA3M5s7+8nAA18d3Rg1w4UsFMXCvE6YvggETnfmgdXar9P
	+hqkBEO9ZBq/zjTu3+gV83ur6nAlJ+fhlVOl1QATX2PQV0JmRT3pH/FPr+Ki2AiSNL6tZWOX2id
	+eKgfwOqzKQo//MZSrFEWGUS1oJlx5CG7o9aE397im8874ivXZ3Rasxg7p3I1g4HykS++WvLQ7N
	tfPVCrN3fX3cSdXUAHOXs1T/wZZD4t3PFrh5B/yRMEqD/S14m3xn3uEONx21s0CTEOnFWJ4UBRr
	rVarzAQ63VX7RAXID/BlPD8bBg==
X-Google-Smtp-Source: AGHT+IGiOMBB2u+MqncvLemR46Vdhf8U5YlleypLkibqmqpHv4xVyBgspHJatjQXnrsALf51494Nbg==
X-Received: by 2002:a05:6512:1249:b0:544:ead:e1d6 with SMTP id 2adb3069b0e04-5452fe8076dmr326534e87.38.1739574769328;
        Fri, 14 Feb 2025 15:12:49 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452f676aa5sm158515e87.50.2025.02.14.15.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 15:12:48 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Feb 2025 00:12:46 +0100
Subject: [PATCH v2 2/2] gpio: vf610: Switch to gpio-mmio
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-vf610-mmio-v2-2-4a91f8c8e8d5@linaro.org>
References: <20250215-vf610-mmio-v2-0-4a91f8c8e8d5@linaro.org>
In-Reply-To: <20250215-vf610-mmio-v2-0-4a91f8c8e8d5@linaro.org>
To: Johan Korsnes <johan.korsnes@remarkable.no>, 
 Bough Chen <haibo.chen@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 imx@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

After adding a pinctrl flag to gpio-mmio we can use it
for driving gpio-vf610.

The existing code has the same semantics and the generic
gpio-mmio, including reading from the data out register
when the direction is set to input, and it can also handle
the absence of the direction register better than the
current driver: we get the direction from the shadow
direction registers in gpio-mmio instead.

Since gpio-mmio has an internal spinlock we can drop the
direction-protecting spinlock from the driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Use the dual input/output set/clear registers for output.
- Provide the BGPIOF_READ_OUTPUT_REG_SET flag so the driver
  behaves as described in the commit message...
- Drop the now unused spinlock (gpio-mmio has its own).
---
 drivers/gpio/Kconfig      |   1 +
 drivers/gpio/gpio-vf610.c | 109 ++++++++--------------------------------------
 2 files changed, 18 insertions(+), 92 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index add5ad29a673c09082a913cb2404073b2034af48..ab104ce85ee6cef1549d31744625bcc625d75179 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -756,6 +756,7 @@ config GPIO_VF610
 	default y if SOC_VF610
 	depends on ARCH_MXC || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
+	select GPIO_GENERIC
 	help
 	  Say yes here to support i.MX or Vybrid vf610 GPIOs.
 
diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 3527487d42c8ac3ef39c3be468dd5177c85f6b44..4aa80dae9badbe8a9cc7b2adacf321ed237c3b57 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -36,7 +36,6 @@ struct vf610_gpio_port {
 	struct clk *clk_port;
 	struct clk *clk_gpio;
 	int irq;
-	spinlock_t lock; /* protect gpio direction registers */
 };
 
 #define GPIO_PDOR		0x00
@@ -94,82 +93,6 @@ static inline u32 vf610_gpio_readl(void __iomem *reg)
 	return readl_relaxed(reg);
 }
 
-static int vf610_gpio_get(struct gpio_chip *gc, unsigned int gpio)
-{
-	struct vf610_gpio_port *port = gpiochip_get_data(gc);
-	u32 mask = BIT(gpio);
-	unsigned long offset = GPIO_PDIR;
-
-	if (port->sdata->have_paddr) {
-		mask &= vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
-		if (mask)
-			offset = GPIO_PDOR;
-	}
-
-	return !!(vf610_gpio_readl(port->gpio_base + offset) & BIT(gpio));
-}
-
-static void vf610_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
-{
-	struct vf610_gpio_port *port = gpiochip_get_data(gc);
-	u32 mask = BIT(gpio);
-	unsigned long offset = val ? GPIO_PSOR : GPIO_PCOR;
-
-	vf610_gpio_writel(mask, port->gpio_base + offset);
-}
-
-static int vf610_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
-{
-	struct vf610_gpio_port *port = gpiochip_get_data(chip);
-	u32 mask = BIT(gpio);
-	unsigned long flags;
-	u32 val;
-
-	if (port->sdata->have_paddr) {
-		spin_lock_irqsave(&port->lock, flags);
-		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
-		val &= ~mask;
-		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
-		spin_unlock_irqrestore(&port->lock, flags);
-	}
-
-	return pinctrl_gpio_direction_input(chip, gpio);
-}
-
-static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
-				       int value)
-{
-	struct vf610_gpio_port *port = gpiochip_get_data(chip);
-	u32 mask = BIT(gpio);
-	unsigned long flags;
-	u32 val;
-
-	vf610_gpio_set(chip, gpio, value);
-
-	if (port->sdata->have_paddr) {
-		spin_lock_irqsave(&port->lock, flags);
-		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
-		val |= mask;
-		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
-		spin_unlock_irqrestore(&port->lock, flags);
-	}
-
-	return pinctrl_gpio_direction_output(chip, gpio);
-}
-
-static int vf610_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
-{
-	struct vf610_gpio_port *port = gpiochip_get_data(gc);
-	u32 mask = BIT(gpio);
-
-	mask &= vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
-
-	if (mask)
-		return GPIO_LINE_DIRECTION_OUT;
-
-	return GPIO_LINE_DIRECTION_IN;
-}
-
 static void vf610_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct vf610_gpio_port *port =
@@ -295,6 +218,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	struct vf610_gpio_port *port;
 	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
+	unsigned long flags;
 	int i;
 	int ret;
 	bool dual_base;
@@ -304,7 +228,6 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	port->sdata = device_get_match_data(dev);
-	spin_lock_init(&port->lock);
 
 	dual_base = port->sdata->have_dual_base;
 
@@ -371,23 +294,25 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	}
 
 	gc = &port->gc;
-	gc->parent = dev;
-	gc->label = dev_name(dev);
-	gc->ngpio = VF610_GPIO_PER_PORT;
-	gc->base = -1;
-
-	gc->request = gpiochip_generic_request;
-	gc->free = gpiochip_generic_free;
-	gc->direction_input = vf610_gpio_direction_input;
-	gc->get = vf610_gpio_get;
-	gc->direction_output = vf610_gpio_direction_output;
-	gc->set = vf610_gpio_set;
+	flags = BGPIOF_PINCTRL_BACKEND;
 	/*
-	 * only IP has Port Data Direction Register(PDDR) can
-	 * support get direction
+	 * We only read the output register for current value on output
+	 * lines if the direction register is available so we can switch
+	 * direction.
 	 */
 	if (port->sdata->have_paddr)
-		gc->get_direction = vf610_gpio_get_direction;
+		flags |= BGPIOF_READ_OUTPUT_REG_SET;
+	ret = bgpio_init(gc, dev, 4,
+			 port->base + GPIO_PDOR,
+			 port->base + GPIO_PSOR,
+			 port->base + GPIO_PCOR,
+			 port->sdata->have_paddr ? port->base + GPIO_PDDR : NULL,
+			 NULL,
+			 flags);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to init generic GPIO\n");
+	gc->label = dev_name(dev);
+	gc->base = -1;
 
 	/* Mask all GPIO interrupts */
 	for (i = 0; i < gc->ngpio; i++)

-- 
2.48.1

