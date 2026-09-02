Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74844A92F7
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363940; cv=none; b=d8ULHjkjICUQPRCJxKeaVlu0DwxsiZOtbmFMcJAyWRffzio+Abbg2ZBFOAkLg1qKqWIMZuwt5axx+3NyRC2SQeNtI+WrhB8jh4FPNtz41vUh37Sqpis0+tfbtXRDAgKpA92N96eHaSHdNodrulTNgxiH6P5t6IvvwQXWZN/5m4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363940; c=relaxed/simple;
	bh=2cVQm2hyDOussy9LNB0Uh8MJoeGRDGhTixY4iyHbvQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6F1y1thRBNHNGQ22CuU54SfA1zgTjDBtFoM/gBUOZo/rR6qVB397qnBVY+ODMqd/YZ4fIxSyvTcHiLmNCK4LJljWh4eVai+z5DPg0r/BVkFCr+KF18Mvki804J4tfS8Fx6LL8J/37/g1oOJrqvSLE7FyhSNgSA8wf0aCs6w2Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wkh/SWbh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wkh/SWbh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso18015195e9.2
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 08:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363934; x=1788968734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABWq6yl6RmD8WKfldYZOiTpcwQ6GawnJnekuHKy7JS0=;
        b=Wkh/SWbhJ0ON0n5lDIMny2v2X6ks62WD3EgTI11Pjj4HK832Syii+pyTLk1ambjgbw
         bQp2JxWYSMdh/K065rP4H84GCLgVjZTr2G048mwoOXe6c1BoOSDWvJ750DHkVQxaVU7N
         v/iPwPInVE/XMa2eymVtcAtjZmEtnrp9xofvFy3S0H4s2R0W4r9J/rpUmK2XGo2gJ4CI
         sXjePR7RrQ0x0LBmnSyI02SJgyt1pA+6WI0Vg0oguZLjrVnRQgH0cqee/kNd1D8pZNJL
         AozCmm5rv5ZY3L5Xz9ffeDdBPD2yYr/vafSzL12j19CEPmzCm9KkTmlrBp482mj6YrN8
         VMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363934; x=1788968734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ABWq6yl6RmD8WKfldYZOiTpcwQ6GawnJnekuHKy7JS0=;
        b=EjizGBGXG8SeNyOhFxLTEMWoRersJjfW+G67q8dk0nZTPABATafMxLAmmVU502Ahj9
         UXPqsc25eOtLGteUlBhwy6PEmW+cXpmfLDn6CdZeHqAbactl609GfLGLJmz0qkPSk6la
         bY68a30cA4mSPxXFJHvGBb81CPYUisdZ5QGryqjziGk0BjP7JJ5LdnLRedwJOa/JL3R2
         i0Y1Hy2S7XVCIa18qe0QaIYPh/bv3eNqBZ1dRNDMafZFlyZRLxPClii4DrziDL2y4voD
         mxZSddLQ6b7as78o7eeQwmkjxmkyAFE89F30xaJ4dqy2V29h7VQsrm/nC4aLJGU6hIRu
         rNPw==
X-Forwarded-Encrypted: i=1; AHgh+RrqxzvxC1bj6iKd0BogxtZaJfD07u6gp95yjNBKmGzjr1YfsEAde9enWyhYJYMutMTxo0I=@lists.linux.dev
X-Gm-Message-State: AFuF++k4gC6twNEG5lJQWUyGvsKdtYC9Mhw/nKicdSAr7JBN53O2l2Bp
	UDaZ5fX0RjmEvrVvPQNa8alWmM+k1eliojJX/SgjvUSXHLeMQbsCFqjj
X-Gm-Gg: AR+sD10m5Bz2K+bMfYg0QikWTa/mKsh5gBxgO6K4bTtK9lXnvyvBUXuZNS1mhYsMvSI
	sNcoaG70gsJE5X7fMbaowgtl1Tahv7USTYX5JNWs39GGAQClzsheXJmJ1WXjAsaWyuTtwU05Ar2
	EjYCgpU2xl59n3njW6mcc8no4ZhapPUTwg4JeSCwQEqO+KhHYSVagOEfKILsfIC58/jb9agMV/w
	fOY3DPPSMAA5waugDmK2iJJiNDjLUtNios8voiiaW0qlfPNOud3P23kYpOc++GZQXpFXeJjC1yP
	2nuvd7nwpjawOxlO/dmdNul+uYtXy7L8gf1wMbEM9JABoeHoga+lid6dK82COknDLulcv5ZDrb7
	ylx7VnxdaY29GNuJxLXT1iHZ+1l4stzS98bq2SxN6usbDvK1InTiFz6JVj8nN/DDxaZHStf1Uoe
	+M7bbPzX/fBRNkcxx0mVX8whqvMQBj5kHL0sepMTBVVwxrdqvjSZp7JAryBeykiVd2E1Y=
X-Received: by 2002:a05:600c:6296:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49ce581635bmr118401635e9.3.1788363929530;
        Wed, 02 Sep 2026 08:45:29 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e686fsm530655e9.15.2026.09.02.08.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:45:29 -0700 (PDT)
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
Subject: [PATCH v3 2/2] gpio: mmio: track the direction of chips without direction registers
Date: Wed,  2 Sep 2026 17:45:25 +0200
Message-ID: <20260902154525.4090276-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902154525.4090276-1-mehmet.fide@gmail.com>
References: <20260902154525.4090276-1-mehmet.fide@gmail.com>
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
new line, so the shadow is seeded from PIN_CONFIG_OUTPUT_ENABLE there and
the line reports what the pin controller says. Lines pinctrl cannot
answer for keep the input default, which is what gpiolib assumed before.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/gpio/gpio-mmio.c | 59 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..987285c33f45 100644
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
@@ -601,20 +622,50 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
+
+		if (cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND) {
+			chip->dir_unreadable = true;
+			gc->get_direction = gpio_mmio_get_dir;
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
+	if (!IS_ENABLED(CONFIG_PINCTRL) || chip->reg_dir_out || chip->reg_dir_in)
+		return;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	if (pinctrl_gpio_get_config(gc, gpio, &config))
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

