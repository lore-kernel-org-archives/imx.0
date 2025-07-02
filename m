Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C130A2472BA
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448143; cv=none; b=l4SZgzekZHSPUATlnsM7PL0YOLl5m8C1n95sv04P7Yo+bG6KbV6Og9JAQYnwjauCa9x2R7BFmPo0GUCeQngCF6TPkyt67cbdv6KyonpCPqdv0/hhl2B4vifSUW4mlkbIK9pcCTBxFC19AjrFs43TT5H0A9maKjVlGGM6Rbz7l/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448143; c=relaxed/simple;
	bh=tyJykNA9JXtsEmAKpbmxVrsK8pxuyPX22uRvQ3leZaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ja6XU4S+X84Y84GM3Tuu2h6wBICJpISKdC+5teFos8i8hBlagJNFwIqUuCjnLf6jocPvu3ISlE4oxQkIP19kJbGZF+GBwiMX1ZE5s1/44C0nf103cnyTl1o+XZLv7Naju3+oscgefD9jTnKuo4BDaN4Q5OZrEYDeyph0I5NRFwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PBU+yWry; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PBU+yWry"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d7b50815so31081565e9.2
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 02:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448140; x=1752052940; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6eqgDwzB97RNtxOPadXoAPBhDLs6Dg7JTwhUz1GvgpY=;
        b=PBU+yWryCK4NbCPbqKm840PdF9buNzsVTKvl1xvExPQ/FILYpa7/TsS5H31/FgFFvQ
         g2fHliJRLYbggMRizGel5ym+2z2tOzKUz3Ayr+8d/cVQIzq6MmKee/xO77WgL6o0XiK0
         RJ7/oQ6KpESXBHp99Tmum5sExuxtI0HnWi1ZajzLDWizVopZ2Q61GA5Iof+NVBzPhaSG
         l2UO4EonKtWa8HG0BZfboVkqaAFr/cDCMmseCMAj2czsZkvphyX70bKShAXYRaHgCjXZ
         9FCWQoggYC9wb0yCPKRBZwAUMSy5R0OWkg/aEStilMVbI8e/7DoWCiMpwaSLkwbNLE8V
         PZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448140; x=1752052940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eqgDwzB97RNtxOPadXoAPBhDLs6Dg7JTwhUz1GvgpY=;
        b=X2rz7h3vrCS83yNGzyBE1LHsabbSRCZayVUpV4wdBo0PiiMK6CSgeDAx5hv67EMS03
         ojXdJOIfPr7tKYtI5/cxs4vn3jnjz0nZ4FOL+cOoVnxPjCDO/8Nd3arVNnA7tSOv3XEg
         xBIoE6Yo+C2TexmiwUNNNetVND5v/MgM436C1fhEraB6GfvLVK3MUJJEuZTyBxXqUh4O
         72YjyICpHQd6pI2tJI7JFjCON5QC01rnHgK4nMbHSzUE2ob8/dbYfA6mKVUqZ3iLHfNw
         k8+KhJB5pN7k4NCnhzbXOvJ2vpRddTht1W0+mhHFdlVfNCLwrY+Vd2gwSMa6iSkjSTIF
         sY+A==
X-Forwarded-Encrypted: i=1; AJvYcCXb7vephEitsg1SKwFGGUAB6pkTIUDNVd9lWejCQqC5GBi1zFqkJj64OlGWYeuadzwGmYE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyROS1Crj5ukWPc/Fpr1Vuzl19vw1JD2mXiu6Do2Ho6GsZOGgkR
	L+CL/GBRaksP5zm6J31uapgDXOV0DNaVCZSWUrBqBSRF7mDKGG8ZmJ/CXNF8LHnUTC8=
X-Gm-Gg: ASbGncv4Tq3nXVZZiZ6qScMIoQW4yYT3gYMaONR5HKddA+01agYGY0gSGlpqgsCpwCe
	WN9JAjoLhdOAfEvFH/R5BE7IQWziePPS1wIG62UZjDhFUHa/2BXGMrOD2pfIXIX3w5a99QF4MBI
	KaSNmdtH7Fsa/WTUmy3tZ/ZsygD7ICPJGvFrG1+S031TfQNgN1qfywz/+1AMyrWGv5xStYe/K5Z
	oOaX6RZozg2nNpp0OyjZRuPKMC9nFNw9fI1JptlOcQvTLXbmiuDnBze9ZDJu0HXO7heO6Y70rGl
	omNuz3yKc75omc5CE+SS6gWOVh4rQIAMnI7wXAg7qjoDgmskRQ1dGw==
X-Google-Smtp-Source: AGHT+IFJrU/ikcBRx1Xx3y3CO3Xl5EZm1K/9rmg09Re30z7P2KS1UPvPZTAXYcN+r1p0EvB1jatrfQ==
X-Received: by 2002:a05:600c:1d1a:b0:442:dc6f:2f11 with SMTP id 5b1f17b1804b1-454a372e257mr20008535e9.25.1751448140059;
        Wed, 02 Jul 2025 02:22:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:12 +0200
Subject: [PATCH v2 5/8] gpio: cadence: use lock guards
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-5-6b77aab684d8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bk+ifnf5IeXV0G/nLqnGxGzgGzg1ByJ+7XwxWcaWlmY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpEg9KNgCFhZ5UtYv9wjTJ3eMXjUODBpO+wb
 PCt7nnTMAeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 csNAEACkpQv7m/AU3g7yjr1wp65de2B0s4Lm1cV5TrvXTlGYDwOuPfXVk5DxB/Em3KcTEwtlE/4
 RWA9JpR93rPV1btwtVrx/82hueypt+EsY+xMyxJrCmuoxwa6syx8ULjU0GJ+iptb9w9RkweOQEh
 fDTaCS8WmmKhKNC1m65+eg3G0+c3jaRQ1FXE/C6wqeYILGRNS9SWb6ZGiadv3AFB4WaBdiTsjn9
 JfTcVepzX9vT7aSsgY2Kz3ZRAnXZshGxm+tP0+rq025yE0SoxO9+yALIGcTY61qunZePr7fHjuR
 bzCoJjJ58D4g0DDy+KLy8nqkbogviMcEpQvfJHQm79Z3ApgVzOwk4A9Mh+4BvG+7ojJo5fvk3Dn
 KCbIH0AXYQhMnQ1rjNHJCPC3fLWE1E9BMT3xwfJWDSzqd3OGwPECW/+Nh+/ziLuY4ya6lN48/+/
 Re7tql7R9ONudhsB1UuOri15XRayJJm+MynOps/0P9d5VyafpYN6hfOyHpbrAbfn1eys7aTuHLc
 yuHH4CLFwXbCmclamn2uCj0lASs9cN3LBr1yIzKCI5BEPfG8ghfAu7VnGD3NL9cBcT8TS6WZumA
 h1GKK9cFtnaVYyg5ZwvNGesJn4tci8QKpBqcg/6JfNq8c2x8P7krZL27a2E4GOvLJ86c7NI/bWy
 BzYw07XnOr3jksg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code by using lock guards for the bgpio_lock. While at it:
move the gpio/driver.h include into its correct place alphabetically.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-cadence.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index e9dd2564c54f879cf1d49442dfa3db0004473d35..e6ec341d55e9047b2fa8718799ba72d54624388e 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -8,8 +8,9 @@
  *  Boris Brezillon <boris.brezillon@free-electrons.com>
  */
 
-#include <linux/gpio/driver.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -38,29 +39,24 @@ struct cdns_gpio_chip {
 static int cdns_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&chip->bgpio_lock, flags);
+	guard(raw_spinlock)(&chip->bgpio_lock);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) & ~BIT(offset),
 		  cgpio->regs + CDNS_GPIO_BYPASS_MODE);
 
-	raw_spin_unlock_irqrestore(&chip->bgpio_lock, flags);
 	return 0;
 }
 
 static void cdns_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&chip->bgpio_lock, flags);
+	guard(raw_spinlock)(&chip->bgpio_lock);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) |
 		  (BIT(offset) & cgpio->bypass_orig),
 		  cgpio->regs + CDNS_GPIO_BYPASS_MODE);
-
-	raw_spin_unlock_irqrestore(&chip->bgpio_lock, flags);
 }
 
 static void cdns_gpio_irq_mask(struct irq_data *d)
@@ -85,13 +81,12 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
-	unsigned long flags;
 	u32 int_value;
 	u32 int_type;
 	u32 mask = BIT(d->hwirq);
 	int ret = 0;
 
-	raw_spin_lock_irqsave(&chip->bgpio_lock, flags);
+	guard(raw_spinlock)(&chip->bgpio_lock);
 
 	int_value = ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE) & ~mask;
 	int_type = ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE) & ~mask;
@@ -108,15 +103,12 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	} else if (type == IRQ_TYPE_LEVEL_LOW) {
 		int_type |= mask;
 	} else {
-		ret = -EINVAL;
-		goto err_irq_type;
+		return -EINVAL;
 	}
 
 	iowrite32(int_value, cgpio->regs + CDNS_GPIO_IRQ_VALUE);
 	iowrite32(int_type, cgpio->regs + CDNS_GPIO_IRQ_TYPE);
 
-err_irq_type:
-	raw_spin_unlock_irqrestore(&chip->bgpio_lock, flags);
 	return ret;
 }
 

-- 
2.48.1

