Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3BD3B6BE4
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 08:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459514; cv=none; b=YX+vshaIH7Zdw+AiNH1OyXZkKvGkqLDSneLJNtnus3XkirrNNjgxDsdF7j70un+Jc1EgaXfebTEvyGbiO+LhOgqtocZcL78LY290eFwlyn2dJ38V78O0hgkn/rKcX1Cw+GvsvhP5fsCM97iPJoOsJU20579OaPJpRDjIBQUKY0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459514; c=relaxed/simple;
	bh=+kqeTqpcEjn+LLVVihM/uu8q4NnBEHCrxafwfSxU/xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Et97Wzje8d0R0SJv8VSX7fgNby4JDVn2VB0InU7rxiHiBx/o7oep4xYE61sozyje1HC5TGhiS78DsZIXdyonyrODWq6Og1wmtjfVSbIvHFNNB+X4htd//WWuCKykSKgysIuUzKvGXT3lXYEiacTa7UrGN7XWI251WuqwKDNTOKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9MdGYJk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9MdGYJk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so11860775e9.1
        for <imx@lists.linux.dev>; Tue, 15 Sep 2026 01:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459508; x=1790064308; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H137qfG3h8enrbCR8FlT5MD3WdEANP9LGcr88jAxASI=;
        b=Y9MdGYJk1Y9lBhm5/dMwSY+zAhwGk/Qypn2WqC8HfR2ka1bQf8bLFsBSo0eYN4V7ks
         1kGOJpnI7+MepeikoD269xAkuzip7a0j3H2LjxongO4tkog7Nw8MTr196aEed+lem39g
         k9t/zWl2n8oiTeirMTvFmAkNe+I0mxGeDiVz/KVhGVpO/8QaYa1jH0qcq09gE2bsVqpW
         VNkslA3NFwKhTA5+BEG9QU1BRLvITOH7pykmBbOXVkraSa/xPeDf9yfWOGpzTdjLKl/x
         k8fhKzddRYdVVAW8mLZsv6Wc4oEQiyKgKrJNP9rC1MCYHxep1mB7Nc60yx3dovIvmOBh
         yZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459508; x=1790064308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H137qfG3h8enrbCR8FlT5MD3WdEANP9LGcr88jAxASI=;
        b=fbBYEpPPFUb3eFbA5D1kwKdos658Cj2w2WxAgWab8rKiIry4a1Blteh19itWukJRuo
         alRyylUVqFhmL9nc1NHAXjfimtSmqiNsYVJX6HGk439CjM130DTQhReAmlqA2lbj5/cW
         /ciJ8Dgga2aeKv4JGsxGr3ZoriimrYIjFlCPNXWFhrpcNA1JL0BgJfW06Le+zzoY4xJC
         8WWTTsgOKsKEwYQWFxpj0QrUKh/SU9ZP1esPdWr2QiJyZXD1e8miYKEIWMhGMKBXi3Pi
         ZK+BUnOaWeLeTJEsemuGRpA6k68xQ9zapaXHaoUq1m2RiB9IV/my9ide+Eh19SGo+eqx
         DuHg==
X-Forwarded-Encrypted: i=1; AKwUvBzOtGsvRhnD6rua9cVLbu64ZTXjTT6Czldf/2UbJmu/OviLmKNdHlXzaRc7obIia4YRYLM=@lists.linux.dev
X-Gm-Message-State: AFuF++muO7HAUAOimf1GRwHZT5v6pr7bSukIo/QKErGKkRIVeZ0ojtwi
	VlCiRf7ZXmMl/SnNNPRYIwb7yYkdkGQaGQZjPcJJ3Rw2SlQI+BEUpd/6
X-Gm-Gg: AYBFou2WsbRHTD9HUCsdVDmhxFW3JXz31uKgm5LQBsGEEZdOKrV1uOEL5y2XWg9jsfj
	T7Out7rMYv7C2pAhmgBxaApB3GH4bSy5oAI664uE2pOyeTWR8AbAupCnjfUYJS9AMqIgi0wOD4c
	7IJe9B8JPmsLPhOgPNbT6zRsX9dd7SHEW2VSJJ+nzcQrRusu4QYtsJuLrBuBBhypvNpRjMHLLCK
	MvUZTP+8PrFK1IObIMBc+GRAe19R9Sqj/FwX2sD8f+HU2Wy5e3pT7LYJ0XTe1+1sNldNvUzjQmz
	4qfHBaDibbimZTeUtDhcHOSM1uRS8PFM6bik0hYXO9P3RjT/QqZZVa6QvuS2cQmt7TUJ4XVu9ES
	Cgnm17Ig1uVcC9iQOvprwmzSn+SEIace4moQmDmOUohMfqkoGGouMTbjTuUJoLVIde0B+Eueizj
	PWyWpPBGycrLkHYThB5wcX8PLPF21m51+p6K0nHfxX8S1vDrw4VWIRqnrjG5qHIPBloryyldkP2
	dzf
X-Received: by 2002:a05:600c:3e10:b0:49d:2936:8ad1 with SMTP id 5b1f17b1804b1-49e7d722aa2mr32668075e9.1.1789459508063;
        Tue, 15 Sep 2026 01:05:08 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:07 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v6 4/4] gpio: mmio: track the direction of chips without direction registers
Date: Tue, 15 Sep 2026 10:05:01 +0200
Message-ID: <20260915080501.329424-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A generic chip with GPIO_GENERIC_PINCTRL_BACKEND and no direction
registers sets the direction through pinctrl but has no get_direction
callback, so every gpiod_get_direction() call trips the WARN in gpiolib
and the direction gpiolib reports is whatever it assumed. On a Vybrid
Colibri module the i2c core, asking for the SDA line's direction before
bus recovery, gets that backtrace on every boot, and so does any other
caller outside gpiolib.

Keep the direction of such a chip in the existing shadow: the direction
setters update sdir under the chip lock, and get_direction() is the
shadow-reading path already used for unreadable direction registers.
That keeps the callback usable in atomic context, which it has to be:
gpiochip_lock_as_irq() calls it for !can_sleep chips from
gpiochip_irq_domain_activate(), under the irq descriptor lock.

The pad's actual state is read once, in process context, when a line is
requested: gpiolib calls request() right before get_direction() for a
new line, so the shadow is seeded there from PIN_CONFIG_OUTPUT_ENABLE
through the chip's get_config(), which is gpiochip_generic_get_config()
for the pinctrl backend, and the line reports what the pin controller
says. Lines pinctrl cannot answer for keep the input default, which is
what gpiolib assumed before.

dir_unreadable, so far set only for GPIO_GENERIC_UNREADABLE_REG_DIR, is
now also set for a pinctrl-backed chip without direction registers: both
kinds of chip have no register to read the direction from and serve it
from the shadow.

The answers depend on the pinctrl driver decoding the parameter. On
Vybrid that is the preceding pinctrl-imx patch: without it
pin_config_get() returns the raw pad register, which would seed every
requested line as an output, so this patch must not land ahead of it.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-mmio.c | 60 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..0709ffaab4de 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -49,6 +49,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/spinlock.h>
@@ -372,7 +373,17 @@ static int gpio_mmio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
 
 static int gpio_mmio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	return gpio_mmio_dir_return(gc, gpio, false);
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
+
+	ret = gpio_mmio_dir_return(gc, gpio, false);
+	if (ret)
+		return ret;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
+
+	return 0;
 }
 
 static int gpio_mmio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
@@ -384,9 +395,19 @@ static int gpio_mmio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
 static int gpio_mmio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 				    int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
+
 	gc->set(gc, gpio, val);
 
-	return gpio_mmio_dir_return(gc, gpio, true);
+	ret = gpio_mmio_dir_return(gc, gpio, true);
+	if (ret)
+		return ret;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	chip->sdir |= gpio_mmio_line2mask(gc, gpio);
+
+	return 0;
 }
 
 static int gpio_mmio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -601,20 +622,51 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
+
+		if (cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND) {
+			chip->dir_unreadable = true;
+			gc->get_direction = gpio_mmio_get_dir;
+			gc->get_config = gpiochip_generic_get_config;
+		}
 	}
 
 	return 0;
 }
 
+static void gpio_mmio_seed_dir_from_pinctrl(struct gpio_chip *gc,
+					    unsigned int gpio)
+{
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	unsigned long config;
+
+	if (!gc->get_config || chip->reg_dir_out || chip->reg_dir_in)
+		return;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	if (gc->get_config(gc, gpio, &config))
+		return;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	if (config)
+		chip->sdir |= gpio_mmio_line2mask(gc, gpio);
+	else
+		chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
+}
+
 static int gpio_mmio_request(struct gpio_chip *gc, unsigned int gpio_pin)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
 
 	if (gpio_pin >= gc->ngpio)
 		return -EINVAL;
 
-	if (chip->pinctrl)
-		return gpiochip_generic_request(gc, gpio_pin);
+	if (chip->pinctrl) {
+		ret = gpiochip_generic_request(gc, gpio_pin);
+		if (ret)
+			return ret;
+		gpio_mmio_seed_dir_from_pinctrl(gc, gpio_pin);
+	}
 
 	return 0;
 }
-- 
2.55.0

