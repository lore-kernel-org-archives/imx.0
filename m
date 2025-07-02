Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BC4246778
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 09:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448141; cv=none; b=NIrw9rEE/ES8mAYKml9rI9fcj1sDPS96vHJxRNqTWijeC7jgESItDjLaSL/mueAvsuDtu1yDlmv0mTiiGhEbd+DyOu6f8vm1x4PK436h14IXAiE5stOdC0gZfs/WGpJINkLfWkyR3ITKYKYw8aDosMpSq0bzFZ2ZBQOBFBZGEzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448141; c=relaxed/simple;
	bh=0wJ3VYCq+XU4SPkOteN5MXhoBb6WcYnpfBxrVLUCSwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8a2s4FEEQJWBx2ee4r2k3GZmzV91k0jiMNKgJwoowKgw+5bPf1XLB7EHLGfbNF9l1RO57W0yXA4hpKQZhuKqqd3aUl007ymMa3jZkNqAaB24sKPwUSg9c2sOstW9V1DLntvRjefS/qOfXKo5VXJcMwujih7fFqYWm5+gkm+SPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OVt6tcjF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OVt6tcjF"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-453634d8609so46693945e9.3
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 02:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448137; x=1752052937; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4u+FthQDNPLWdi1PhhMWVGkiqdk0HXsbN17pTQh9z8=;
        b=OVt6tcjFo6hAaG9PLJK8VR8TD4BN4nap0TjjTP1rN7jSehEU8ZO5p1Edyu2lamjqND
         H2uQarJ5G60X7fYQSZzBoA0mN5RAVnijRygjW2IylaD/lggEUPHq96oP0IuroISY6vmk
         ewteA3M5srvZOL8khRZhoZvYZIN+SO/uMw+qNhtKsy5YzCStj1U/HyYQNl5Tz/CcKCr0
         HcIIaQsJTgVSemdQ9bl3rMvlvTgxK9evVid6ResTHWstPd3fQB5fzdc+3fDsYfrhO/g1
         fEXG/wgKIxhas/y5mqoPZ8hSH6HBbyXH0yKEv+JNseenookwKkXjXmITDcTVfNuwn6nW
         QuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448137; x=1752052937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4u+FthQDNPLWdi1PhhMWVGkiqdk0HXsbN17pTQh9z8=;
        b=Mnd7gDIG3yVigjKQmC+673HLgT2PDChHu2cAI4QZuSq4GErXX5PDHMrtjuWJoUnTUN
         rSsU4Q4belaPJgFuAsbBWvcyTaje10Lea52CwlHGU5XvqRNUIRqehl2G/grxVQQedhGR
         5ICBaRtMxOxcgZHuXemqc99FraC1pLDwWYbQ+v+MDHK7ud3wJwUUHxu3GmLRNjVQmb6n
         QGSPiebGRZYACYce0wyVYMokU8Rhb/N7tTfenAaYC8fYyHK2UpXtA0nocFSSYi6i3GrZ
         WauX0pzNTVQtoYlFMxZTEjP/5dpsUNS9pUKXhj2L5uR8IeMkz1MLgRZ0z8wYbNBWPmul
         AkCw==
X-Forwarded-Encrypted: i=1; AJvYcCVBqFQ2ra2ke+/QSDubMotA/tKf8ru56uo8mQj2Yv4b9DV9bLxr8wHGVud8+BUgKa+wszY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1Kyb/wcASK4WfGAYQhwtvLZusry8+0YNFqSNYqpWVcIActXC9
	j3djhExKt1rK6r998OPj2VtAWNPHuN7FIKovcLmylkxEr5l9lNuBpPufktpwiEvtC74=
X-Gm-Gg: ASbGncvfqxOMRbfojDQK0kLaeNV5shcz39Da6egreIMxDtJdqggF/EHr+foWw7/CebD
	BcdN1HZKzmdGBDFX/KmhT9JW1Rb/LDxCjyacQYO+tNKeWqdnvSCI3+/012hl8/BkptXmG/i0Znd
	sleKn5Cr/2+w3DFubrCyCoyWOXdyntCSdXPAZAUsf2uslvXAkbNti6I1yLZW2CxT7RAT5e5U4k6
	z1SHLVp1BRplZH4Z/b/L7RlFGg7odlaROaJpzrxz0q29Z94GNSJsk44fAiHICoEsBJUE2m+/7gN
	mRrRm6wohwqhM1OQOTM3Xr2jighqh/s6xBq9Di3FThvqy1gM+vOUnQ+SafWScNJ8
X-Google-Smtp-Source: AGHT+IHbZgnhQJE6hWX8QzU1x6mPMLzGFrm4P9DO+m2Xac8J6ESQfWF51nMTQk2usCHmJA4Ncp1IXw==
X-Received: by 2002:a05:600c:a406:b0:453:7bd:2e30 with SMTP id 5b1f17b1804b1-454a3a71785mr17378425e9.29.1751448136731;
        Wed, 02 Jul 2025 02:22:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:09 +0200
Subject: [PATCH v2 2/8] gpio: mxc: use lock guards for the generic GPIO
 chip lock
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-2-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3424;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Nhj40fNUX1gi865SKkLYi1vu0OSypgr5Gc9r4LLn2tA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpEIGYyx51RBbJ7CzXYFDk/AnkSqzP89dgF6
 L+qchczKKqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 ctL5EADLxOrAEbJSR2Mh80T7Iol3UM1Tdb2AzV5BYhIuzDVEVU7rCgP67SqvrsxLrxDqmIuiL2X
 k22Frcv6RN+XT3rCdfvh8Hkx+TqVkbaAKstzQEkhjFfRe0Z9VJb+R+ql5yd3P3LMQ8hULvdLQHk
 GeQAmaVdeErjT6xzypPJCvsFUS45oUUDQAHlpb4f0EpdVZ6n5r0MtKOJimTPlLSht2YpsODgw4+
 2juaSesJUw5aQXC2Q4fDcjsJarDAZ94aV0QXwJ+x/YFFrQ5/l9ydKgIpBG5iOjFQwqJgqwfJfoG
 M9Pcem2Sz2oTsqCd2qw1eu1kwqZS7EMa+PI6/IHT8dCViyKfTeTU0CAogktbHEc7PK4CNvlJTEf
 IwoJfpM93dcMzElNW57kvB/gJ3NySccCpQEuCrLcrIlP9J1/9n26ugjx97o/Jkr0/iK2p0346Z0
 vMOegy+lHXFjXBrWr9roJpgS6ZAdGmLIfW18LppeFkXAv/lFw1TolYE1FduuKS0YASPNUqn6xRX
 aV0SxpQotRROjkTa34UzpE+zisA06RWWD/Cpf20Sa5kzSUPv0fL3FEf5OOMYvUlPHPd/gKIMyZ7
 7DhDoTCSUfmTf2NlEXl8z1fU4VzSMMAGjfGf6wAiPiwF4waMfPjdZ8E+DrIX7boD38Gwqyit8AL
 /h1jeFyl1o/LiyQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code by using lock guards for the bgpio_lock.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mxc.c | 50 ++++++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 4af5a2972d12f68909dd87d9396921c80445f87c..1c37168c8d0a657d7f93067d9ac95cfbd821f757 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -7,6 +7,7 @@
 // Authors: Daniel Mack, Juergen Beisert.
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -161,7 +162,6 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
-	unsigned long flags;
 	u32 bit, val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
@@ -200,41 +200,38 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &port->gc.bgpio_lock) {
+		if (GPIO_EDGE_SEL >= 0) {
+			val = readl(port->base + GPIO_EDGE_SEL);
+			if (edge == GPIO_INT_BOTH_EDGES)
+				writel(val | (1 << gpio_idx),
+				       port->base + GPIO_EDGE_SEL);
+			else
+				writel(val & ~(1 << gpio_idx),
+				       port->base + GPIO_EDGE_SEL);
+		}
 
-	if (GPIO_EDGE_SEL >= 0) {
-		val = readl(port->base + GPIO_EDGE_SEL);
-		if (edge == GPIO_INT_BOTH_EDGES)
-			writel(val | (1 << gpio_idx),
-				port->base + GPIO_EDGE_SEL);
-		else
-			writel(val & ~(1 << gpio_idx),
-				port->base + GPIO_EDGE_SEL);
+		if (edge != GPIO_INT_BOTH_EDGES) {
+			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
+			bit = gpio_idx & 0xf;
+			val = readl(reg) & ~(0x3 << (bit << 1));
+			writel(val | (edge << (bit << 1)), reg);
+		}
+
+		writel(1 << gpio_idx, port->base + GPIO_ISR);
+		port->pad_type[gpio_idx] = type;
 	}
 
-	if (edge != GPIO_INT_BOTH_EDGES) {
-		reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
-		bit = gpio_idx & 0xf;
-		val = readl(reg) & ~(0x3 << (bit << 1));
-		writel(val | (edge << (bit << 1)), reg);
-	}
-
-	writel(1 << gpio_idx, port->base + GPIO_ISR);
-	port->pad_type[gpio_idx] = type;
-
-	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
-
 	return port->gc.direction_input(&port->gc, gpio_idx);
 }
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 {
 	void __iomem *reg = port->base;
-	unsigned long flags;
 	u32 bit, val;
 	int edge;
 
-	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+	guard(raw_spinlock_irqsave)(&port->gc.bgpio_lock);
 
 	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
 	bit = gpio & 0xf;
@@ -250,12 +247,9 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 	} else {
 		pr_err("mxc: invalid configuration for GPIO %d: %x\n",
 		       gpio, edge);
-		goto unlock;
+		return;
 	}
 	writel(val | (edge << (bit << 1)), reg);
-
-unlock:
-	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
 }
 
 /* handle 32 interrupts in one status register */

-- 
2.48.1

