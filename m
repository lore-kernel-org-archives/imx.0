Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238002C1595
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771673; cv=none; b=qoxttD0NdJRgUytTFaSCdCvbZ1ntH6McRKoVF+kCXM+/wrhjzWqxrRww4sfeIvStfqGEjtQlI723R5KZTcfEt8fKT0G/S2VZQV0zj8yklsL4Xp2VJSb3VO1KU71xpUGgy9jSjrIqLCoCPqIeQYM6vxZd7yQGu7cF6UFq3WBKU3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771673; c=relaxed/simple;
	bh=4sAXU9caGg9f/DjHncEPIA7KaN/pWf+xDxVR7QJuIB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0ODmsBnjh4rFzAs1tmIlaySKBKgBFThEv9LpUPezcEROUfeb/Xt1reBK7T4F6qotoSrYGGobqjj/gQFIsJ1WCL1dSVszX4qPa6sk86247nvT6fu0y4M1axOsQ0QPR/TBzsMHIoBopMuW/Jle/c4KvAaaMd5ZGOZhbQvrq9ON1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DmxycHSm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DmxycHSm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453634d8609so3621535e9.3
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 06:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771669; x=1751376469; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BZNYZ4uzmMTmFUY45XO1zgtp9A/k49xGz2UfsvZ/gw=;
        b=DmxycHSmHZTlX6oTxGsRXLJlK7n8X+HE3bfoKYm6pqLJSd66hlkzaulwk05bZsoSi9
         lnT9naGumE0LZ6W3NuUjZL0OPDUFpjyMQM0bgjwmIPnVLpoDXkR2FWZouYeOYT49HebD
         5VYaD3BCt5/jmodq51kCyWDfHEmfRq3xFDlOqn/GQS79hgVvMiCvQ76CXP5+2sRLQS1+
         T9UYpwFrdGluWyxp2R4eQz1+AiYwOqk/Dv1UDbUPoRck12WHfd/Pcyhqd2z7odqKMEsj
         vYGuKqPPNn51Dj8DRio9j7F+/ouv/LLuRMN3PS6CRTdJzcTDv89sYa2dIipphe8gjzi/
         /t/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771669; x=1751376469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BZNYZ4uzmMTmFUY45XO1zgtp9A/k49xGz2UfsvZ/gw=;
        b=nj4XL35DnJdER/sIZBW73bTn9VR97EvEBypKB6bCjFNxc8LVNBQknUHg4Bk/l38Ezg
         4V2F3FYd3+erzKujVzOxZ283W3O3XSNhVpDj/NaAgqtWWSkKEDbrYD/D+7AQ/wU9aSLv
         WuaiXNY/j58aNPYWk9uDbK3F59uLefJAuRz/pqO6Bz4XpM17ayURU8rZFvDhYXNzYbY8
         uCUgRTDHDbOcfHOu7nHZJykR4cWEzWNN6MDy1sx2+TgTAaFC+w+FKocRAF5U3I/zxr9U
         LBtNR9AFDUVCubQLi9JqAtgC+C36G9knTgtLNgP4Puex6siGbFanS6YuXvOvsfQnMPhz
         JvwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY6EMLBTrp0g2HfwVIG+OdsnPMocvHcth+fqR8TxSPNS2ExEZOji/DMNOtZhXcQTry1xk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDTbVsj0ogDd52J/rhb1PZ4O6PCeAwF7QLIvFPn7SahN+LOxp5
	wVnFqaAgUARY/jwqQlEsuRveHBO2E3eeLMz+6VxfG+xkHzZLqsIHU/POVF/scHDpBpwHGyUMWki
	SXS8ZKgo=
X-Gm-Gg: ASbGnct1atmv4fnAK8ZWyYhZ694mJJqOpzaeHOeoQYtKrI2aqyjyoWNsDQNDBSDEtMa
	1ql/FnI1/Rnflu9sq5T90JcTgHCT8A82LdEKEqTMrT49R+BogYQs9R+c+OBBhcFgZgIep28xIZV
	Vd1Q35l0MExEK5vZ0lMd/fAsgJRUS/48OL4sVcHh8T7oJQ6q/fcM7IBsk+7+pVxmQZNHuIFq1qV
	3Mf8DhRHPmfY5gxIKTj+y9MMFZBvEYoVr2eGUu4Bj0IvLx3hZgKFzjlBgUAutKn4oFiQzUe75JS
	zVdafoUM+nY8qmbdHcNQ+d7kHuunf3uCG1zdPHxoYirsmpdHxtatIL4=
X-Google-Smtp-Source: AGHT+IEUbPKcWbn9NN2y6f1Hc3c97b8DvrWEquHy3uhBBn6lW/jObv1Sw1EXdMfJS/xPuPKek3QNuQ==
X-Received: by 2002:a05:600c:840f:b0:453:c39:d0d0 with SMTP id 5b1f17b1804b1-4536539c48cmr145546035e9.13.1750771668863;
        Tue, 24 Jun 2025 06:27:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:37 +0200
Subject: [PATCH 5/8] gpio: cadence: use lock guards
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-5-aea12209d258@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2927;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=untPBAM91123AoBXnC7kV8/BRVDDOFFauDcUW0X87cQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfM13Dq0oK+m+cELMPgv/E6/IQGi1X/lJOCc
 a2U5/8yD9CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzAAKCRARpy6gFHHX
 ct7uD/sGNCGk7mdxy9ZfPSIWzM1QufC2JrgdiT1Y4C0v/JOJlMDMByILNEMjNuLqPvYwu4UsuXi
 YaTQmzyJRfcrSaMpBo3MLw6yTsNjpbfEj3f0tc6JXKuN63anO0yf/GAHqr8QwbT0pwtHlqQ2+8+
 dao1qn7AP5NrxRlsb4M0FZBu3aTN32jv/7T/s7PL/ccIhaXy9QCmZ2rPYvIw5s9tl3ufYMQewpi
 wfwRzY+d5/hTin8rVg6a2EHUhzg6lSdwlgmXHUk800A9HoObSpf0bu7te+fsVPL8H4LQJkhgf+w
 8dJhcLVkwQGUbJ4lQf3l22eqiC6H6ypmYV3/kdetNm5+hUzZjw/eeqHr2ZxboZW3S2DJPPQJUVX
 nZw4HQTJ+ifS7tPp8XKWk2bn5l8zQWL6E3S/XmPvhLc1SYXKoz9I4V3U8XB4NVhZYme2ZQQ91HC
 LkgmBLKRb8LTDwmM7TVxVpqxrFl93lY0E9JPkuKOirXbPyWFM4zp+ru9JOa4Ldd7YwFcYaL2CXy
 3CIQUTblBcFwqb94o+y4qAAWyBzUzjD4QEhX81FS2YtbI2QHT0Iy2hRWsqsVgirNrDi0zoQined
 bpUiuzHCs3kz55dzOzWQLeCyWnEQqPosBKqSmfTwwzXF+BB0ITuGzOHKFwOOCj1n3valTMFGx8x
 i/798StF+aw8Erg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code by using lock guards for the bgpio_lock. While at it:
move the gpio/driver.h include into its correct place alphabetically.

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

