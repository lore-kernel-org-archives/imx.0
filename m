Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEDC214A66
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 21:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999080; cv=none; b=OacXWOTS8EjW9Zc//sGgZGKBxQN84s7VOQmct+hn7iLov8cucxxvenhjYsJHa3TMuTR6Rt2Vny7c4r6HXb/uXL52bZLstMcm5Go4vBfljeLmbvZlOVRL5hsUcAIeNrOEktH/Z5kPbSt2mBUA+NZvGnr75YB8DmLHSdF/LpJwfp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999080; c=relaxed/simple;
	bh=A8x9FoulB0qO7ZVapx6YGb2PHWmE1NctNUq1P6ElhqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C7r3vlVMwjbdct8dhBuOHFc9YaFZl+j3s1UHu5rW7u1S+rsRDTSxlWiCyFKKZhAxt4hrh0PDxwL2Bl02Vp11u1ROXwtiD3w7iZDq8LLH5V4P+jy1qjIlfH06rn7wgKpG3tTE/NLqSdStdHVwiQKGcjPFslcmtGypWNxkKaeol1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aNxSepoS; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aNxSepoS"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-307c13298eeso3305151fa.0
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 13:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999077; x=1740603877; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WQUsfVoD6/Fdkp9DOW01eLqUyLmcJrGZ/ECjWE6h4A=;
        b=aNxSepoSDuJiHKHOy6MyRl7pFkbAZwNqCB6HNMd+tqxM+MdaxCwKt3Ew5OQCouQMJ7
         txdtK74Mj25wyA92DXyhgLxNs4445LswwhP7oaM+S+eaRHV59BMZH+Eiqw0Ukt1l6COS
         U/e11DshzUYBT/WllxRrCCXDduHmD6VkBPZpKRysvYOnA3HT0w8ELXfcTn8/sYG8k+yc
         hXe+MR8oAqS31b6gcBR9CqfZOsFyJ2RJADY2ZHswfb6wvf8HiLPxQZykmXeQ3Pl9+8QV
         PzySqDFZ3E1sRorDRmwu/RpWQIy+mz8AQ1URREOQvJTe2yhCOwW/PkjQN9Z/Gt4CEWpK
         10SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999077; x=1740603877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WQUsfVoD6/Fdkp9DOW01eLqUyLmcJrGZ/ECjWE6h4A=;
        b=c/5AAzeHIfu0tZ5Mos+YkhimFIKNqWzO75jhHy+be6NhvC9xtYMdMnNm5wWKQN8F4x
         xUqPKlUG/S6f+V0ulp0ZfpqV0AAxc8v8dHA2pAMo+pqLrT8BgksMqm0nhvHlLLca/FSU
         Mb4qWaZNoaTwnFn0Z9u7XpIGxEH0Kbt8X2yV2U8HDQzHnyhwMy5hTywsmIJuEMl5saTU
         5fTa1k4V5rsDbFv/e6kIhC8fwsXa4ENbyTCBjfUOB7Q54z5yTUJfxlQq4bt0z6xVsXC/
         VwteaOKTYFE68fQ3EvoEZJb2By+lS1iSKnEnEmDFVBL4wPIYsEbFr8PianTEWYjPSByt
         pAug==
X-Forwarded-Encrypted: i=1; AJvYcCWZ8W9hlaaHfZyg7HSAFLvQz1D8g2EbLnV2vBiase1uO3U40qmds/RGNZUz3M55MAlaLyI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpzxA7uyLViq98smQ6qdnt6Fa78OCRx4PzQBsw4ucfUs2X9h0q
	INlfUiss+LHXB/RhYRgz4VPqh/6yIAg0Q2uZHsj8Sfjq+hT9nYBhBeWs/KGRwcw=
X-Gm-Gg: ASbGnctp22XvCKqxw+ntvAYgr4tPm070rM/geFJQoSJX96Vp2VPpXd3ZvaNotBo5Bzh
	1xJ5AG6y7IjY8IKUO6hEGy4XwyBd/gN7l5vTs7fAg888PhHqhtTR2x+zVY/TXh/ykWR9T1GtNIB
	cT9ulGdrjA1ir9xZkC10N6jbBCjr4hkIs8bz1M6CS3GOnFV2DXmLX+714XjmGhlMDEpnP2lOuwJ
	Spjaz39awMX1+8XzQmqPJ1lRDhp1lvi3yHkqqtGeMGYgQqJbclzU1Rv/ybS/amHWGbDcvGnPlRj
	DZtnfEI4+4KlBnM95Hso9cYqFw==
X-Google-Smtp-Source: AGHT+IH1QwRIaK8DxoUIf+sciYqhNMbHbxL8RHUrvxFp072qsaD1fklzBdxkAF94XpqtsgJcebhOTQ==
X-Received: by 2002:a2e:b4a3:0:b0:30a:24bf:898d with SMTP id 38308e7fff4ca-30a5065136bmr2500051fa.18.1739999076562;
        Wed, 19 Feb 2025 13:04:36 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30923bc174dsm18977791fa.84.2025.02.19.13.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 13:04:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Feb 2025 22:04:34 +0100
Subject: [PATCH v3 2/2] gpio: vf610: Switch to gpio-mmio
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-vf610-mmio-v3-2-588b64f0b689@linaro.org>
References: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
In-Reply-To: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
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
ChangeLog v2->v3:
- Use the port->gpio_base for accessing GPIO registers.
- Specify only GPOR for setting/clearing/reading the
  output, hoping a RMW on that register works with MMIO.
ChangeLog v1->v2:
- Use the dual input/output set/clear registers for output.
- Provide the BGPIOF_READ_OUTPUT_REG_SET flag so the driver
  behaves as described in the commit message...
- Drop the now unused spinlock (gpio-mmio has its own).
---
 drivers/gpio/Kconfig      |   1 +
 drivers/gpio/gpio-vf610.c | 105 ++++++++--------------------------------------
 2 files changed, 18 insertions(+), 88 deletions(-)

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
index c36a9dbccd4dd5415ed3b90b87afb47e7634c025..4dad7ce0c4dc6a3f412081c7502c0ce6dd5740da 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -36,7 +36,6 @@ struct vf610_gpio_port {
 	struct clk *clk_port;
 	struct clk *clk_gpio;
 	int irq;
-	spinlock_t lock; /* protect gpio direction registers */
 };
 
 #define GPIO_PDOR		0x00
@@ -94,78 +93,6 @@ static inline u32 vf610_gpio_readl(void __iomem *reg)
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
-	u32 val;
-
-	if (port->sdata->have_paddr) {
-		guard(spinlock_irqsave)(&port->lock);
-		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
-		val &= ~mask;
-		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
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
-	u32 val;
-
-	vf610_gpio_set(chip, gpio, value);
-
-	if (port->sdata->have_paddr) {
-		guard(spinlock_irqsave)(&port->lock);
-		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
-		val |= mask;
-		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
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
@@ -291,6 +218,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	struct vf610_gpio_port *port;
 	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
+	unsigned long flags;
 	int i;
 	int ret;
 	bool dual_base;
@@ -300,7 +228,6 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	port->sdata = device_get_match_data(dev);
-	spin_lock_init(&port->lock);
 
 	dual_base = port->sdata->have_dual_base;
 
@@ -367,23 +294,25 @@ static int vf610_gpio_probe(struct platform_device *pdev)
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
+			 port->gpio_base + GPIO_PDIR,
+			 port->gpio_base + GPIO_PDOR,
+			 NULL,
+			 port->sdata->have_paddr ? port->gpio_base + GPIO_PDDR : NULL,
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

