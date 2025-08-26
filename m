Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C02334396
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200929; cv=none; b=XqwgYr3GJX/dlCPO2MLM9/gksBnKawE9UNHOTiy3H9QCYfpCFdsBp+/5DFiQKAwh6Z23Kgbi0++7XfhGrvkJrqrvDeQZSdk58VDmkj8wxg+v6FYIldNpE2JVFmsqwRRlSWv2/Vicji4YHHnRXXJOQ65Z/ZMZx0Vr+sT4Z/fBefQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200929; c=relaxed/simple;
	bh=HE7DS3ZBNcH1Lm217c5EvpLZs9j1mvQjPNTZnIFPPfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kUZbh0JdeBp3wYgDG8liSNAFdUXtMgw6FUyCE7dkxjRMBeUfSPGf0HTzOYE3LzyLKhXgPCGbp29mAOk6HkGUucb9hvhqVfldEDA/mOPD1ZVyZDwgwHFVeVMKobgMoUmy69Z5p5Xu6e5xQieTtu7cSGKRi6CxR6BdPb0QFcNA0eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IeFxzoHA; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IeFxzoHA"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3c8fe6bd038so1047942f8f.1
        for <imx@lists.linux.dev>; Tue, 26 Aug 2025 02:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200926; x=1756805726; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4SIaXVWUkg+hHGv+4ixu8kbiUSIjwYzUEuWT5aiHX8=;
        b=IeFxzoHAqSmXWIlkP+lpfUlp6zQtdr7SXEH1h+UzVr6aDHr+vGQfLThnp0ut21urQB
         uZyLO7NKkxsnei4Vz7Ycih2+kZPOCFU5DTCuxXg+FDHYeoDhdNccjEhAHFlqZnrh1/e/
         K/jdZhrx0YgHLHe4HYZD/YZp53p3ccDiTCZbd8nuPnT1YXOwnmjA4txLBXh/X+4QIFSI
         MA8lXzCU3cdHA2Ebr8aVlxRcZ/wgGQNfeUAMYuVTyVIK03PtxlnOMxe89PJmB+S+cOnv
         ZLxwr8/j5fATEiBMgcGajswR5b04dg+amvQTTUtQ3YqEWucWJDjC0yqeTKNP9XwV3jPL
         TnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200926; x=1756805726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4SIaXVWUkg+hHGv+4ixu8kbiUSIjwYzUEuWT5aiHX8=;
        b=fo1GeA54beUj1LJanMgViypfwkwOIQP2t6meveHFAAnukdpbgjQGxmNTwPaIaI3SAr
         o5YazKuglTuVvnKwlApltjQF4X3R56dj+WelGwkiZ/j4XZQc4pyLjvJzm2SGU6xTmtEi
         KaQgTt0P4RoV74x0l+32Nkn9l0beIIIgjuBZ+RLLE+ODOlj5QxcBD2htTnQ+MBpKhUw0
         NMMZiUh0h3H0OgPkwDHJOYT3uA9qK+t9PJrmgG2J1Inl2+Fv3aXJF9W+/qh4cTFupd38
         Gi//FbGaFj9JgyYjD7TGTfVTmniblwSGv8gx79QdliDvC1TjK0bPMIGxizMhUUufGnw2
         nNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOQHOHIT9DVIPDGLLyw0aPHs/1aR54RY3oxweMs+oLmdghd9HAo99+rBDlUb31KLLeoWs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYGo8XJO4/HwDlMVcdhpeCybqre+AXd5NvryDKK8mucY0Ccswl
	ezOkCev1rJUDaXFR4xU9lsQPaa+PAkUVZCBeEPOvioNDiq7QeAJuHwIygLo4FiyFQJg=
X-Gm-Gg: ASbGnctfloTB/58g9imAuc9DPDXauqr5e1InVt0e9qJXKrKiHHZiYx6PVhlmyaBX8CW
	VBaFskp8W01EsVnkgRk9+NOAPESI1HVaXNdWHylzkmjQXDPfeVAvsKmxS7BDFCpkXDIkZvgGY3G
	NWht7RcfLuoE5sNHXpbDSvvnByT4Dh5r6K7BZveIPh/y12ibiCjA+GbnVXmWxUeodHFn3vNvPp/
	2ounKiac5uqT4l1J8ydMKsmCcZHdogrsNPOTCnYpsoI+e3FEFB15ob5Jv4RayvrgaHYVtnhUh7x
	oPHwffkWt4gO0WG3nNIzivEKgIRvE67SaAYdcPAGVix0H8EvWqOBqMdNtUuibj9748NTUzgVXjK
	/w3uzlOtj3e7IJqPnHzBqxlJKw9A=
X-Google-Smtp-Source: AGHT+IHIDohXLZAKff1GENvVq+fM/lMjSRZvIzBycvaCqcgyGD6B/NWZoIVvZstUWc4ib8hSnjpLpg==
X-Received: by 2002:a05:6000:2304:b0:3ca:ad45:6363 with SMTP id ffacd0b85a97d-3caad456a18mr2848159f8f.17.1756200925783;
        Tue, 26 Aug 2025 02:35:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:13 +0200
Subject: [PATCH 12/12] gpio: visconti: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-12-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lIkE26fimxtLsnv6/OivS6nB6z654zlY0oS9FIX70Es=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/Og0nbErzpY3vQ9xVhUwQ4iNVAKpRoHYsW4
 LZRkjgeVXKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zgAKCRARpy6gFHHX
 ciDAEADY4ihEtR9Q7yOEPZRGqxwnfxfrHl7l0+5fiDRcc1FroXh2IHJ0vTwbvBV7qbzrH2dM4Gl
 8H6mb/ToQaz7wQ05T33kB9KO4dkt80hapLHLqKrM/UJ1jgw/IE/bhrUGaAL5fy+thOMcPxUjNex
 pIJjwJHspqz1osilDW+2yP/wIgStol8GscbIWtdYoClTuoUzuj+/f3dgatzmAbio/o0BlycLE9P
 sRf2gMSwmzK+eOIvekbtPm7BfuVWzUJMavw78rz9zV66o2o5uBy1VmVmsb+Awq3/5W0QJEtE6VD
 gFSdMXDLO5UsDo0OaA2OWuZvallu5BvMqG2jhOcxkUAm3H3jzOrQy7AccA71Uza8B20IXmmxoVc
 fFJxXPABvFwfs3S40Y/WG/oG8mTHgB2ExlW8WBPtkH0jWTYjVrSZx9WjVL1f4zwX1FSCCaZkx96
 vrtYoPCC2YZSsJMvo8ys9sy0zH8RsbvydG0cfeFJHkaD4hMAeb/kxMzwRpYmj48mlxnfKpYyVii
 UXfCElyNv81k8MIzqisClidhmWj29NFXds2XVhdz3R1jXiLd3aNuhh6FRld6OgzLAg+pMETjfjT
 dUwaD/eNJr61h83U8iT3Ox7OCZLB/4KcjQGC6UCas/qCDtvDLtrG/8Cz8auDUmkQKajQQnbB793
 3E2mpLwnP78CEMA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-visconti.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-visconti.c b/drivers/gpio/gpio-visconti.c
index 5bd965c18a465f29884cbe56711b25d7e755df2d..cde1581a91033e0ffa855e6cab0a36fa01f2baa1 100644
--- a/drivers/gpio/gpio-visconti.c
+++ b/drivers/gpio/gpio-visconti.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -32,7 +33,7 @@
 struct visconti_gpio {
 	void __iomem *base;
 	spinlock_t lock; /* protect gpio register */
-	struct gpio_chip gpio_chip;
+	struct gpio_generic_chip chip;
 	struct device *dev;
 };
 
@@ -158,6 +159,7 @@ static const struct irq_chip visconti_gpio_irq_chip = {
 
 static int visconti_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct visconti_gpio *priv;
 	struct gpio_irq_chip *girq;
@@ -189,19 +191,22 @@ static int visconti_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = bgpio_init(&priv->gpio_chip, dev, 4,
-			 priv->base + GPIO_IDATA,
-			 priv->base + GPIO_OSET,
-			 priv->base + GPIO_OCLR,
-			 priv->base + GPIO_DIR,
-			 NULL,
-			 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = priv->base + GPIO_IDATA,
+		.set = priv->base + GPIO_OSET,
+		.clr = priv->base + GPIO_OCLR,
+		.dirout = priv->base + GPIO_DIR,
+	};
+
+	ret = gpio_generic_chip_init(&priv->chip, &config);
 	if (ret) {
 		dev_err(dev, "unable to init generic GPIO\n");
 		return ret;
 	}
 
-	girq = &priv->gpio_chip.irq;
+	girq = &priv->chip.gc.irq;
 	gpio_irq_chip_set_chip(girq, &visconti_gpio_irq_chip);
 	girq->fwnode = dev_fwnode(dev);
 	girq->parent_domain = parent;
@@ -210,7 +215,7 @@ static int visconti_gpio_probe(struct platform_device *pdev)
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 
-	return devm_gpiochip_add_data(dev, &priv->gpio_chip, priv);
+	return devm_gpiochip_add_data(dev, &priv->chip.gc, priv);
 }
 
 static const struct of_device_id visconti_gpio_of_match[] = {

-- 
2.48.1

