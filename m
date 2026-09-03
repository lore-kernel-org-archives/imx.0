Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B978430CE5
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420715; cv=none; b=WZ8832KiT507SKF6LabVecG3bFbBO5PPgTUMIFKjXrdrF2lJU7qGlCC8Tb1glu17GY7YUoD9JCs3OQyf45sccaf4ENvRYvKGOcm7uljpSZ2e/PeD0puh7vvhYECmmVQF1EuSQQM57gCulPoo3xVYy4CmLnxt/3UZFlGliip06HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420715; c=relaxed/simple;
	bh=HO1YpOsp7AAqKVPegRZIkVg5ChPOPjxhcr+CFObZK4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GrAXPQrFc2l6O/Htrny22rodjxik4FtbZ1YKZWcLJBbd84oYdI8bhkH3p94126A25LAeFAigWGxpUVgWh8BovasbXM2woQwq/cmm2T1JW1oSpQc4YCC5CP6DEF+u1jPB7lTmyAWvvo/Nm7FAcW/sltrp6pNlQXQ3VOlLCytYjLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8dfI2y3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8dfI2y3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso5045275e9.0
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 00:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420709; x=1789025509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGVy22n2k2x8Vmi+YjiPo8Onst4nWhBMCSM53hHrhOk=;
        b=g8dfI2y3gK6x8smoPqPZwJ0jydkP1XJrKVFoXKz0eyjim99ha/WqGSSyYI/6z04O+e
         UOiz+uMZdty97U4RLWBRi10/93u3ANz0rQgTHLAqtjU5R3iPUWyc9AGizMhuR4ORA2iB
         pqlaRuqvdKXcx9aTOKebty2pt6YK3zINzXFP6CzGFGbqofe4QfN9hUDnqSBx+itaenIS
         w7we794+16si66WajeSRVY2n18M96nCDkHUbxeOIlXYKLFRR3Wbs5xe4uz7UGSPDj4Xy
         f3gxFZ4l4RPsTDMXM9b91rPPFSYSKISoyf766091xSZNQSNZdRMM+bCiwqINycWT+ew8
         Og3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420709; x=1789025509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGVy22n2k2x8Vmi+YjiPo8Onst4nWhBMCSM53hHrhOk=;
        b=JKDg/t5BPTvwixAT19i0IwXGChW5w6QjO2ziXyAXUSajqbAZoNqrKmOfhkagpl8Wle
         4Vb9/0BiwphbulaiYVQyWAoFFUiYNymd3e1R8JFiUojQmHTogBYxdtw2lVkE7XkZrPFx
         VH3cWy38k9BzniC0CNmegEN5YbOccdCN/LjA04E/ibLyZ7cEzRSClMejBtSvUHzUSMGk
         O3rfMohNTpzv9D6cPrHveNdXszFwbX0kQLVRQ9PRWJhLCGADCCpnUqts0q4o++qvxfws
         w0OeH3AT5UjlX4k+CEZvJXdDvCPKQCt4j9zYf3dcIN583UwcNf8CmOTp8fzvjfjDbjtw
         GHKA==
X-Forwarded-Encrypted: i=1; AKwUvBwvIC9w5NFHgAu4aGxG6ww15XO3FRfnBzGxeqgzKTH/zdZ8eiIkcLd7CbtF9L1HWxuvplc=@lists.linux.dev
X-Gm-Message-State: AFuF++nNEduyc905+e069s+Uilg+lAnOiL2d3Da7q3IChDq6WCBC6vve
	wKGMW+L+ZtuvaE1NwBYiIfzhR7FkAgrriLsE8/s9a/wQrpsOM6x7XL0d
X-Gm-Gg: AYBFou3Zkmc/aiWKOnLjnTOUzK/+gOh0TWipMX+oRhduvmZdkW6hb0OdMJaI4H98QpO
	Q15ZHsNcrMdKUHIeH39m07gmMzD8uUQ1Hsa01zsV7ziQgBdcjvIN9aZvHEWosMwGtwFY9UFvDQu
	q1zC+JdGLUIzmy5dDEHPlhzvlFQyuvjDkVabcdKxN3kX9bDDH2jYtP0fU08z/pPdzwRe8J9xp3N
	v14q5KL+CvX2OAXXkHdniQhJfr8VFL6FzY37NUglsRBuc0XY+7LTmlcyjcjIoX4vkSJAzyNLZos
	3ULXlOu/tGGyYKTncpcUfNSfF8xgO0ey0/FtDB6BCwmCKohIr8fEx5BKVGit+I5Utl3ypl9dWBL
	QZVnmk9WIsgc9hsM+ElfmWczquu58tGyREOqvNy2NkK8PRxx+Yo6M5nGOv1Wo90ztmnwRHKrGUD
	P9c2Z4Ui5T1sAkrx8jsn5r0Fwq7U+ga2S/bXFlBoCQeVugYLAs8fGhZuusews3xZyhkA==
X-Received: by 2002:a05:600c:348a:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49cf15a3672mr17202235e9.10.1788420709205;
        Thu, 03 Sep 2026 00:31:49 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm69369455e9.2.2026.09.03.00.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:31:48 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
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
Subject: [PATCH v4 3/3] gpio: mmio: track the direction of chips without direction registers
Date: Thu,  3 Sep 2026 09:31:43 +0200
Message-ID: <20260903073143.2068494-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903073143.2068494-1-mehmet.fide@gmail.com>
References: <20260903073143.2068494-1-mehmet.fide@gmail.com>
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
Colibri module that is 21 backtraces per boot.

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

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
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
2.54.0

