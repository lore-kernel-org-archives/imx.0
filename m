Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EB5254AE1
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 21:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999080; cv=none; b=rj1y5e4V8UwBtNqhdxCGT3DJtfnhvrX5eNyrOoJfiQOTBGy7hPgHQgESDPm/mr4nkWH1rZIUphOZ4zKkLCPL+E4o50Jyyj0mY8QTvO3QG5wvPv3IAfFcHz233ABlDdscBk1mGmJ6N2jJhXMsvmfPJckKQ2rrlqimDFykYTIgn0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999080; c=relaxed/simple;
	bh=Z9LTzZRPFLnZJT5XMSZGdfur7lQk3IZ92SFbdqLDh9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATeINjgn8QmqIoaKpdzgL/eTmvrol4HIBzEP8VK0vjKkqjz30fHEKqXGoJ8nZRJlxiSwiSHWxI3P3DSu8IMvlHZXkQ4RQKjv1a899McN3WumwZ4CExbnO+dkrjUmyv0EBDQ6or3Cn7IpA300Pp9Uz8MYVPNks6KBFPvZVjKylJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mZ92lYD9; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mZ92lYD9"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30615661f98so1934421fa.2
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 13:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999076; x=1740603876; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hj7mvcg1AIpuBCAS0OPKw5ndsiDf9b+OHpTi8fYuGx0=;
        b=mZ92lYD9JEz8x7N8AVFKBvBl1ta9WP2sRmF6nRMJT9R24cixwpSN/maqb4y3FmfIKp
         3/uh/yJxyu4+kWQJkR1yQApVWoGvns4QOY+wKCvzmXdRT0ducoFpP4JyM4RPW+z8Za5Z
         wq4zhGlmvfZmjwJ6YXxR+qvLxD2RtWWI+OUmWKv8CdwDPoe19aZZNcsj8q6v074JCxXu
         00Xn3h2PQopzh3xaR4GzOtZ9UP1S6nCl4n6zwRgxH0tA5vCOkUox9meeLr7zEY5A/R89
         gwT1hv/VdONcCnLndTdzdEp5VHWbiIovG6j7zJy+W+eWxyxotZu800IXCwaw0ALhG99u
         wmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999076; x=1740603876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hj7mvcg1AIpuBCAS0OPKw5ndsiDf9b+OHpTi8fYuGx0=;
        b=HdBJAKeoozDG4cEgcCXFaf51rDfvLW2SMpooAZr2BewivVwvCMR4p/Pr5MkTxhPb7y
         QTBieg0ISJaO+SC/VmJCBWlG6uwE8WM2yWE/erTMaCa5B/st4WmugklYpFdQpWn+ul5r
         Tp3Y47YgK3ABbe6qmA+9buwwpNG3jbsA/k/a0wL0+WgzWnbxECN+TyqNiiFTFkegjWEI
         VRC7E/MqMghaiw2vZZajfkiFA5wlztVlp1tehCgxttFtC8oZw6ftW+KeGdxU7+VtO8RA
         327601kTRd2lub2b1I9Dq4DYMxyC4Y69mtb0toRXojH5GeJsjy+uaRTVR6qg+QDpHpCI
         8yfw==
X-Forwarded-Encrypted: i=1; AJvYcCVpybFVmPFS/TeVL3zG5UotBrWqOqsMh4Q+ZDk9Ss8OmNu3du6KsYN7dShhwiaaHPoPw20=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsKnqdP9XucYy6TPuiGJ22/YqgYilwsGiyhd73CemSa7mRwVgy
	hCUpeIEoV8Dcs5sOL7IbI/E5+GHLbemvkOGBOCVNumF1rek3VhMOrJDuBIl1hGQ=
X-Gm-Gg: ASbGnctPNsgkZzAUMuxanOASI3PwSGg2glrjRdZ5zfVP7ipLSulzWAh/gFEAu/amW9/
	X+T6MJpmfWgUk2Kz+uSax3uKF6jAgPWzZe0fYSgFmTD9xNTme+Eaj8BZKsmnM89tj9jvxKmczLu
	9d3Cld9NSNZlTsW0LD7UiXkLu8kXQuduZi/U4qzfI4YQkVfQWM1/8gujUZnLwmm+M1lPLs/vsTw
	+kHB7vKaeWWLkhZkcjq6LKoE/uLqgXyMUWQXaG3l6F7wq3uRQzzpr2yP43/sTK5lDyaxeT8Fcgf
	vPeowaHgWILAci/5Eg4zlu/Yxw==
X-Google-Smtp-Source: AGHT+IH1x9Cw9H9mZw18iHxJ8baZhcFe+Cur08onjNgjMwMhWZd00SLvBi/a5Qy5aAVes7L3a1w+EQ==
X-Received: by 2002:a05:6512:3992:b0:545:2d27:5ae1 with SMTP id 2adb3069b0e04-5452feae86fmr5642956e87.53.1739999075893;
        Wed, 19 Feb 2025 13:04:35 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30923bc174dsm18977791fa.84.2025.02.19.13.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 13:04:35 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Feb 2025 22:04:33 +0100
Subject: [PATCH v3 1/2] gpio: mmio: Add flag for calling pinctrl back-end
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-vf610-mmio-v3-1-588b64f0b689@linaro.org>
References: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
In-Reply-To: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
To: Johan Korsnes <johan.korsnes@remarkable.no>, 
 Bough Chen <haibo.chen@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 imx@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

It turns out that with this flag we can switch over an entire
driver to use gpio-mmio instead of a bunch of custom code,
also providing get/set_multiple() to it in the process, so it
seems like a reasonable feature to add.

The generic pin control backend requires us to call the
gpiochip_generic_request(), gpiochip_generic_free(),
pinctrl_gpio_direction_output() and pinctrl_gpio_direction_input()
callbacks, so if the new flag for a pin control back-end
is set, we make sure these functions get called as
expected.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mmio.c    | 36 ++++++++++++++++++++++++++++--------
 include/linux/gpio/driver.h |  3 +++
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index d89e78f0ead31f30c014b201cca4e32ecb377118..d4f72a0f6ed89878d64055ab28d888a7be08b126 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -49,6 +49,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/log2.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -323,9 +324,19 @@ static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
 		gc->write_reg(gc->reg_clr, clear_mask);
 }
 
+static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_out)
+{
+	if (!gc->bgpio_pinctrl)
+		return 0;
+	if (dir_out)
+		return pinctrl_gpio_direction_output(gc, gpio);
+	else
+		return pinctrl_gpio_direction_input(gc, gpio);
+}
+
 static int bgpio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	return 0;
+	return bgpio_dir_return(gc, gpio, false);
 }
 
 static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
@@ -339,7 +350,7 @@ static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 {
 	gc->set(gc, gpio, val);
 
-	return 0;
+	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -357,7 +368,7 @@ static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
-	return 0;
+	return bgpio_dir_return(gc, gpio, false);
 }
 
 static int bgpio_get_dir(struct gpio_chip *gc, unsigned int gpio)
@@ -403,7 +414,7 @@ static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
 {
 	bgpio_dir_out(gc, gpio, val);
 	gc->set(gc, gpio, val);
-	return 0;
+	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
@@ -411,7 +422,7 @@ static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
 {
 	gc->set(gc, gpio, val);
 	bgpio_dir_out(gc, gpio, val);
-	return 0;
+	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_setup_accessors(struct device *dev,
@@ -562,10 +573,13 @@ static int bgpio_setup_direction(struct gpio_chip *gc,
 
 static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
 {
-	if (gpio_pin < chip->ngpio)
-		return 0;
+	if (gpio_pin >= chip->ngpio)
+		return -EINVAL;
 
-	return -EINVAL;
+	if (chip->bgpio_pinctrl)
+		return gpiochip_generic_request(chip, gpio_pin);
+
+	return 0;
 }
 
 /**
@@ -632,6 +646,12 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 	if (ret)
 		return ret;
 
+	if (flags & BGPIOF_PINCTRL_BACKEND) {
+		gc->bgpio_pinctrl = true;
+		/* Currently this callback is only used for pincontrol */
+		gc->free = gpiochip_generic_free;
+	}
+
 	gc->bgpio_data = gc->read_reg(gc->reg_dat);
 	if (gc->set == bgpio_set_set &&
 			!(flags & BGPIOF_UNREADABLE_REG_SET))
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270a68ddedbcdd5d44e0d0f88dfa785..e867d52daaf26827324f9e17b5c19c55978ed7e7 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -394,6 +394,7 @@ struct gpio_irq_chip {
  * @reg_dir_in: direction in setting register for generic GPIO
  * @bgpio_dir_unreadable: indicates that the direction register(s) cannot
  *	be read and we need to rely on out internal state tracking.
+ * @bgpio_pinctrl: the generic GPIO uses a pin control backend.
  * @bgpio_bits: number of register bits used for a generic GPIO i.e.
  *	<register width> * 8
  * @bgpio_lock: used to lock chip->bgpio_data. Also, this is needed to keep
@@ -478,6 +479,7 @@ struct gpio_chip {
 	void __iomem *reg_dir_out;
 	void __iomem *reg_dir_in;
 	bool bgpio_dir_unreadable;
+	bool bgpio_pinctrl;
 	int bgpio_bits;
 	raw_spinlock_t bgpio_lock;
 	unsigned long bgpio_data;
@@ -713,6 +715,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #define BGPIOF_READ_OUTPUT_REG_SET	BIT(4) /* reg_set stores output value */
 #define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
 #define BGPIOF_NO_SET_ON_INPUT		BIT(6)
+#define BGPIOF_PINCTRL_BACKEND		BIT(7) /* Call pinctrl direction setters */
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 int gpiochip_irqchip_add_domain(struct gpio_chip *gc,

-- 
2.48.1

