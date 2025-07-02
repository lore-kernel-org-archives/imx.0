Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A49246BB9
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 09:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448142; cv=none; b=mOGrJa8WvJVltir2aDokNna4/OaEX70aGGTUrl1eimy9C8TsmcUteFM/RrQoUOlumpziu1y8Egg1fse5ez+F2wuWu3pKMwRjhqxTeZm+B4b34PleBAEowbDxE+7trgQFVHcyuxkQvu+Crbu9i6CXFj1SDraQLK1wMVCwz3p8sDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448142; c=relaxed/simple;
	bh=jOLiWRKl/BnasF3kEQJEV/oHXlo55WDgn/DTu4UWOcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OITgJEm5K1XZcbw8rC4QuA4beIaPeujuV0i0mXondQ9wXoc3YmV8DXiw5Q8q/JiSmiZOKW+YptVa3gIPrGi6idzRdFttNDWGWJf77e5aTz3Yphd4rLWFG5ZNqQYnMWhwPEXMYWcMe3LB5BzKFBNoPyaHvgmBOUGmJX3Wxd/HMNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ak4U/sWu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ak4U/sWu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so55249415e9.0
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 02:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448139; x=1752052939; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4z7uLdvG+/iHUHRwUBjtv9RcP8yTkbhvtYl1/Q8RRI=;
        b=Ak4U/sWucjhha7Vl/JTjBdIiET3IVDKjRfhLCWWW2R/ZLY1UZHLd0lSXmT8LdWBl6j
         vk8D8B7XeUA3+ys6x55zrrUa2IsTspjvqnh1/nO0NA5gDH9oahimOU9PkfM7aiHlIvF7
         UPkNwDyvXOo5EdQLMXx/FZe3MtpoxYyzRXGTfI2FhkcaKXfTriT5EQ0YJa8rRxULJQ36
         Fyj4e6/JosvCms+cmu98yRypMK/v61yVq8yXPk8dpEiJqCTN6ontp3x/CCsoIp+1IYJw
         Z3SZA/t+Rjjxssa5HrXX4JI55LnMsWBsUGdNQ2wSOcQ6snR+Ruy4LejF4nQWC8IdryxZ
         XQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448139; x=1752052939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4z7uLdvG+/iHUHRwUBjtv9RcP8yTkbhvtYl1/Q8RRI=;
        b=WeTCBdp93o4iGxhj5KXGPh5qHHWNm3Y99NvC2KRBO2NZPceeS2ypd3hlpWh74Mo0J1
         i9MElvdOMO9k11PS3IxV3WMJ1UVaWvsnUc49LWLW5udj7EgVPZ/JqD4RX/eCPiln1kn2
         jJstsE99wwISlyeuDJ+lAseqTmzS6WR5exwj7hfWfl136u/buwXxa9FTLstOqnspwR55
         MSwhFUOWTXey5rTXCAWVai8wtLxBnBuUTS/JY793/OwESIOkfbhDJ+B+Er56GX68jrmF
         no5wodnXF/juwwYIm9//UBJySATQKhMxUfXChATWf1jrkxV5J0kdKYFwFRFevvDsdPSF
         T/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsTYYN0vbQ9QVd/Okv8WboxVtK7o3qYNu50hg+5EtUkZM+ybBsvyASGQv5VyRTi5Tbr3Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGZ+v2X05kYQrF69fmvjbikz783rFapaH6XXzMbMQ2b+buYkS3
	RtTIp08FE1oFojarifrraclHCutB+t/5bM1RTZjmpV9iA3DhF5bX6eKNlnicDNznfI4=
X-Gm-Gg: ASbGncu0Ee7YkgkH9iSUsr3Dk1YC9Iuj56efdm76jJB+fB4DJdngP4bmoD8PX9BBOM4
	NkktolDULTV8tZiVfiNXDLe3FxEwwfgrb4bcMUTTQ32hQU6jkdOY5e5YYUsNugoaUIkwr1CPpUE
	ZjGNxPGJE5GJ5mB9i4pEN4cRhzNI00XhGICvLE4nEmmjzQLeRn8sRk8Ib3HE7JpB9Y+k+6H1xeQ
	qwpHCnirp4OmxYitTfawUxJv3l9OachxZR5679mbBcRTuHT8xgZZKrg/oyT5zybwr45ffsHTRAi
	2abAxX0worBsvGKD1UAJXBWDYbT8PIPW+/ierkLoJyDWBXSNwX/2OQ==
X-Google-Smtp-Source: AGHT+IHBXvE7b446X64FYR5qJVVdlVXFYhv2VtwqkK3inSCOodlHyO04CC6RTEHbQPm8wwAvG7hKEg==
X-Received: by 2002:a05:600c:b8d:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-454a3726701mr19897745e9.27.1751448138880;
        Wed, 02 Jul 2025 02:22:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:11 +0200
Subject: [PATCH v2 4/8] gpio: clps711x: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-4-6b77aab684d8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2481;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1VKAdAKKIoL9buozcarUr5qCb4Dsa0/LBFXC4LmZLHs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpE4+oOICtUp+FSaA4fJrpU6lwXsLCylgffQ
 z9f02V0pbGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 coKlEACz8yJTnbagZm7wSx+ar/VBtkbPGeTQLH3onIRqkVA55DttopeidlxnERomP/YLLzMNape
 F923qXs8eDJBz/SC3gHrOKQptACBL9Oyg99fbXuIQrhVWtFdM7ZEq9mD1I9ChioOehf+2+C3FPI
 H1Gr4emOk3uUDreRP9GX5Q+HdPwJxBEqEow5SuDvkISSMC132pbZonfSOlu+ncFLK2oWQJaR7NF
 tY1q5cEvv7cyWqbqG9ZhI57J6SZlSPHrtfBdeUsj8H+SLgZZyK0gMkCde7anLZMs5Eigzj4mBcf
 jMZmlt4pReLvYejapfEQALgacsFQsZODdhaQsWYS3Jq0a0cQt1G32JXJHE7LCNVsXLdkaZ4cYYU
 zvE3UK80VfdFLGLirYISO8mSc/RF5P0foFaIV/kW1UP6WexYiSRpl55knz43Br5z+Dl06scoI7p
 5gLyrPzx12ZUjMfb/Or2RLnk0SjX0mJQhP1pneZwGX0yiI/umEbd51GsCWu5DMdWCkhRVczrPlB
 pm1Po3R3M4Gf5Pk3tpSXZEN7Fd+JJRAoJhgjj6un9LZSbcJmvZHJoRcSI+QuTKGdSRW1YwGcCzp
 TMybDr69MmHi/UzRfNEAstUg/tExr6NtSqNcEe9GcRXwWBGWBgSjhpWRpRd5NH63REsSjlZtoOM
 wvG0YPPlgAlu8RA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-clps711x.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index c0c8d29d0dce7617c240daab6597692118b348cf..24ff2347d59974c5b1b43595a157d190e7fb4864 100644
--- a/drivers/gpio/gpio-clps711x.c
+++ b/drivers/gpio/gpio-clps711x.c
@@ -8,13 +8,15 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/platform_device.h>
 
 static int clps711x_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
+	struct gpio_generic_chip *gen_gc;
 	void __iomem *dat, *dir;
-	struct gpio_chip *gc;
 	int err, id;
 
 	if (!np)
@@ -24,8 +26,8 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 	if ((id < 0) || (id > 4))
 		return -ENODEV;
 
-	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
-	if (!gc)
+	gen_gc = devm_kzalloc(&pdev->dev, sizeof(*gen_gc), GFP_KERNEL);
+	if (!gen_gc)
 		return -ENOMEM;
 
 	dat = devm_platform_ioremap_resource(pdev, 0);
@@ -36,34 +38,37 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(dir))
 		return PTR_ERR(dir);
 
+	config.dev = &pdev->dev;
+	config.sz = 1;
+	config.dat = dat;
+
 	switch (id) {
 	case 3:
 		/* PORTD is inverted logic for direction register */
-		err = bgpio_init(gc, &pdev->dev, 1, dat, NULL, NULL,
-				 NULL, dir, 0);
+		config.dirin = dir;
 		break;
 	default:
-		err = bgpio_init(gc, &pdev->dev, 1, dat, NULL, NULL,
-				 dir, NULL, 0);
+		config.dirout = dir;
 		break;
 	}
 
+	err = gpio_generic_chip_init(gen_gc, &config);
 	if (err)
 		return err;
 
 	switch (id) {
 	case 4:
 		/* PORTE is 3 lines only */
-		gc->ngpio = 3;
+		gen_gc->gc.ngpio = 3;
 		break;
 	default:
 		break;
 	}
 
-	gc->base = -1;
-	gc->owner = THIS_MODULE;
+	gen_gc->gc.base = -1;
+	gen_gc->gc.owner = THIS_MODULE;
 
-	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
+	return devm_gpiochip_add_data(&pdev->dev, &gen_gc->gc, NULL);
 }
 
 static const struct of_device_id clps711x_gpio_ids[] = {

-- 
2.48.1

