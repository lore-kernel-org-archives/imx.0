Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF24372B5E
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 06:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330239; cv=none; b=bTjEE7enRGV6zyLlS3JcH8wJMuQLBTpc5nmYPjmyerT/F4Vh2G4l1/ehXG9CFRyyDroDqexpu5Wda9fHS1piS5tTlOGqYZIg+MH7DJsy6+s1f4FfRXZ6Pr4AFx+yCWnHemqrEphDquBW1+GaGbI7/xJCQwSvaxV8eBqp2Q1inpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330239; c=relaxed/simple;
	bh=HMnn5aVJ48OtNSiTS+brlOGFOOU4wR55y7WucMsEbHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjLuYe8YgkMzp2VZyGHt3OIDV6Cbl8d3H8Zd5GoRqRUBHRJrNE7VO+X+pT4uISrAqSQsYsTo2WayyGub7nB0VHGRLBc9ACT14SW8KwkKjNessAfJNZWqh+AdGhPKvtGkKEVl0RRXiX28LZw5OhpkVqHRtOsIbUKjT3+MOQm6nVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cb5P4Qcu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cb5P4Qcu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso4063635e9.2
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 23:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330236; x=1788935036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHOxVIY41WkMlz245AOFHdi0BnFepDxV94FL1AiaZ/8=;
        b=Cb5P4QcuF+ulb//HLMGpF2SBbiKIOrL/BjrByKwEYOBj5ERreLBoVjIz3eFl2Xv2uQ
         5dulRpvjhh5PUOzRBLziU55hUppOL9Tg/kBmq7fFf8xQk2ibfQXgXZPIRQfI8ItaIyj3
         SYpMUoMRaM5rp4mI+KTg961HO5liWokp1hLIOpbrOh2WY+W6eV+wHQiw9fHPbd/LTGoV
         FBkxCfCOaUkFEedUbk7u+z3li38BbzfPZX78zIAxrcBqCKKGNdgVn4odvYkRRarqaQbm
         NSBYfV69K/k0qDgCLmbUL0/hgWZVRWbta++Ahg12VjTV+xfDMT8AQF1/u/LprxQe+k5c
         q4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330236; x=1788935036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHOxVIY41WkMlz245AOFHdi0BnFepDxV94FL1AiaZ/8=;
        b=TxJzf9U0dUtugmrT6FlQnHSw2ZOAbwT3rt8hBaMxGK9GL7pgfhKH4RRm0frg2oQ7/n
         vTPOmTc+aiMWQgwj3udOnth+4Zt3UAc7dqPNfedvA1edQp2CCLUnL4mVHtmqabOAdCLg
         ADxXyWmvvfC/VR8RpBtNyEZKa65IrNnVqgAKB99lqFE7Wj7RFn1CjJ5cPqR1G5GzyPQr
         UpZoymrJNm22LJ5I6Uq8n4mBZm9xi7Bk6zUfyg5xHBmIJ1yryj+B1fXCrVX8mmrPUVL+
         v1zXGiezPxq8J74k5ESksmHYHcTF18UJrCnt4GOqE1zCJotcCMa9OM+YGXw0NDHdQk9d
         aKuw==
X-Forwarded-Encrypted: i=1; AHgh+RoUQVJR/xMwCA8SZF2+EhIw6tbizK27k28TtL1OSj3QqxLqvEOTuWhx+ziPjzRF+Rix0Sc=@lists.linux.dev
X-Gm-Message-State: AFuF++n6paaFyibBypBn6ntTV+cS5x0v9JMHQi//Kj3WI9jwTuHM/Bx0
	LenwO9+2uQbfe/sqx4iXn2+AsnKkoptAC1vYj2golvq+68N60kjghacB
X-Gm-Gg: AR+sD10Q7EXThEOhhFm0JPLy1JhzVOddcbWE61/yndE6rC/qy1VZHIBySD6GKNNyZpm
	CfclDY6PNDbNvfh56QDNyGG1thDuG7qgpiWREFZ/yK8O8kZx65ft++rIOR1Wpxo5qUhqbUeDiyP
	NZEK9bkX2bZ4WE0s6zOHZn6OkY1Es4sy1GzP8T/jiWuFQvYOgPTyUTlsyAdA7wzXQMaGCQD4J+O
	/JZEPvw3HpfQWuUIxDdaDcG8J2Kp+g1iwq/9rY8kxn77HbKUuLAopdSU/YS+k46P1wWQdGBD9Nf
	EYtDZ4o7GZ3ADKv9Yo+KmvFpGurU4OHtI9NbYX0YrNFG63b+vZTTUKt5Db19Sf3STdhKfXV10qU
	E7SciZ+dvV+Rv9Ohn9OVynu72BxlIBMkma9UMI2qnLn1kj/wjAOv+vMdLIodN5FyEUUyXfV9Nze
	hAftdp5s0A6N2k7OQkXatA3oqI98E17yFdYdRaMSWuZlKLcvh0rWkLftocS1IdxgZsUg==
X-Received: by 2002:a05:600c:1d14:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49ce583e94cmr33712895e9.10.1788330236108;
        Tue, 01 Sep 2026 23:23:56 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4776131sm49735335e9.11.2026.09.01.23.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:23:55 -0700 (PDT)
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
Subject: [PATCH 2/2] gpio: mmio: get the direction from pinctrl when there are no direction registers
Date: Wed,  2 Sep 2026 08:23:52 +0200
Message-ID: <20260902062352.3600368-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902062352.3600368-1-mehmet.fide@gmail.com>
References: <20260902062352.3600368-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A generic chip with GPIO_GENERIC_PINCTRL_BACKEND and no direction
registers already sets the direction through pinctrl, but leaves
gc->get_direction unset, so every gpiod_get_direction() call trips the
WARN in gpiolib and the initial line state is guessed. On a Vybrid
Colibri module that is 21 backtraces per boot.

Install a get_direction callback for that combination which asks the
pinctrl backend for PIN_CONFIG_OUTPUT_ENABLE, the same way
gpio-by-pinctrl does it and mirroring how the direction setters are
forwarded. Pins the pin controller cannot answer for report -ENOTSUPP;
gpiolib ignores that when requesting a line and in the debugfs dump, and
such pins cannot change direction through this chip either, as the
setters fail for them too. The one caller that does not ignore it is
gpiochip_lock_as_irq(), which now refuses such a pin as an interrupt
where it previously had nothing to check against.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/gpio/gpio-mmio.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..b2aa74a734e4 100644
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
@@ -365,6 +366,28 @@ static int gpio_mmio_dir_return(struct gpio_chip *gc, unsigned int gpio,
 		return pinctrl_gpio_direction_input(gc, gpio);
 }
 
+/*
+ * Without direction registers the direction lives in the pin controller
+ * (Vybrid: the OBE bit in the iomuxc pad), so ask pinctrl.
+ */
+static int gpio_mmio_pinctrl_get_dir(struct gpio_chip *gc, unsigned int gpio)
+{
+	unsigned long config;
+	int ret;
+
+#ifdef CONFIG_PINCTRL
+	if (list_empty(&gc->gpiodev->pin_ranges))
+		return -EOPNOTSUPP;
+#endif
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	ret = pinctrl_gpio_get_config(gc, gpio, &config);
+	if (ret)
+		return ret;
+
+	return config ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int gpio_mmio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
 {
 	return -EINVAL;
@@ -601,6 +624,10 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
+
+		if (IS_ENABLED(CONFIG_PINCTRL) &&
+		    cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND)
+			gc->get_direction = gpio_mmio_pinctrl_get_dir;
 	}
 
 	return 0;
-- 
2.54.0

