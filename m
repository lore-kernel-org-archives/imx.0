Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F172C326C
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771672; cv=none; b=R1M8BUPmmpTPaQdg20RKs55fx+CUQ63rllEfRFloJ3POpBOvWChntKPaDp5ZoxziDhMQi2vFArq2CWUFl/CzacYFB6P7NvQ7IXP4nDLaWWjOrRvP972WFxBY5lglc9/DWpRoJwexu1TQ2pEGMJGlzqm9lQk2MlW4XN5nwnCD0p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771672; c=relaxed/simple;
	bh=bWZ1u1STZp0yQIfYwwSw+kW7LNE5faGgyfS27qTRHKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SBdqIm3DQSMpbQPOAe8y+hPW5eyP62EAIbyz83w+2q8XB5TNp70T6U/FRVgIQN6a146MVwtv4BDgugurwfum7PstJLKMNSHck6B2TKHF0ZsQNRPK1Xq+qezNQdaNAkk0uuCoeamqfMj3WRtUs/Vh0aHw40Ph6W1mlM06Hv14FiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HWNmcMVF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HWNmcMVF"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d3f72391so48825385e9.3
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 06:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771668; x=1751376468; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yz5UgUcfJE5/vvcmcGQA+0Z6POYK3b+XtNUBsVCQb4k=;
        b=HWNmcMVFAKgkEpPB2s/+GtfG/jlSE5lU/wQxV3pvmYDtIlQPURNzjwM/hXTcrh8DNI
         Eh8Tq9+s2xWnCzImuU7ydIHfX7PqkvSo6+VXt8b5mQwmW9s3mghoSDmt54aDcC4xQOOX
         +7PFUqXo7er6yN5e6REtMrebU64zvNOXlXyxWrmhxDQY63BEIzn2mzjAO3o1vCkwCZgY
         N/TIyzfMzszfZUyyIMbnXPfO2E4fQ6HuZejI3hf6qFmhxwx0LnI188veLQCrubBweVWg
         56Whns6xd6V2F+dWavwZDn3uGxOT/OHAHiNW+qU3A2hfhM1YjZlTODJwunDkI5sggdTi
         hmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771668; x=1751376468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yz5UgUcfJE5/vvcmcGQA+0Z6POYK3b+XtNUBsVCQb4k=;
        b=I3aIZlN9gRxJJMkjJ34ucf+GQhLsR9ll+ldgdD/gLQCQVLY0Nws/eabTKkDGEKA6pu
         r4dHtWkpiklYhH0uh8/QbefKoD/sdEX0Ug4FtLeyNslYjLnta7J5si/sO/1P4tYLYq5a
         735JBB5MQLAppRud2GZ7/PRwLT+EonuV2qdlCNuMRFEvhpfocwdOaH2Z2kUgaNPoJv2K
         J8sdgpQXIu9v9MhoJmtmEGXn6UXaM/V9LA7A4194hyurVDZJ+/hRLDYrSCnGs2XhsCVv
         aOD3hbTFEO1OkLtHDBZRLsTRKWIF+Bm/RFhFZPaWoRK3lX0NJTKSjJQiYA6VAisDGKye
         vfAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcYy4MP8EQEUVJf5ooI0pcoh3NAeAP+6UpL+FNUqUj5/xcLB+cxQX4RXcbboq6cC3326U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIoFKfZyzukE9gwvF75OLT8d+AZNYYuqgSSpx9lNcAaLV1HuML
	O2VMHo5m6rejDKCGNS9MXMENLahCVkmQoxT6l90V56ipRJ2H1iS18bgSo+Q4frkQe4IdlE4FDTC
	M6UInpM0=
X-Gm-Gg: ASbGnctA7S1UDiPWq5R8MKOWc4rUmEbRbRoWjG9Xf0fxSacOIsS+zIfn674FwNeb2T7
	cBkYGE3q4HMNEL2HT+MCPoEhSJDGqfUMp/Pfh52VHE+z3gZ4nFbea+kx+F1ZOr0wxK5EMZrQu8G
	1U6ihd182O1DiOyRGCTEL6cfDRjN8wFqyDjxVyReL9IZ3uLBWLKiazml/lopz/5cd6yUShBoOb1
	c6ZvoOcJvih3NlYxyTy1wYVVU4+TcKMb6cRhht8zkVwI4azIXBEyiMBkUCYBTppRRW7gTIC5aOq
	yIelvjaPLn8pDSQ12Fwclaa5ESeYFRn79JXclntNMATcWAve0LRrRgc=
X-Google-Smtp-Source: AGHT+IG/rMIA1tRjVdj3q4SOViQlyMWTekKDIwuSgQnLjsVI8uTdmmUZ8XoTL0DwczoQXfHr+oFANw==
X-Received: by 2002:a05:600c:4fc5:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-453659ee9famr163886375e9.16.1750771667661;
        Tue, 24 Jun 2025 06:27:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:36 +0200
Subject: [PATCH 4/8] gpio: clps711x: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-4-aea12209d258@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2507;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OkRIBmYFSPotnoBgPQDP6/8HKcnoOvUDc41iS6fYioA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfMbPu3QHXEoC8paJDXYv/gt/g9kEj7UXkyU
 u/AkDzJ9XyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzAAKCRARpy6gFHHX
 cqvQEADRUtAfEOV7Ay2ZXGRBZi9QFKTOR5D69z+0IPw3vm3QCtGQZRlJ8JDtArb68wwxcn8W9Xl
 bhesTMoqW8ZvfiB9SwP1m0/MxRR4ur7gidUJir2mToNygsd2gZVzc1FiqtO7x5me/mGGdmR50jm
 AbhJMd74VIf8ONYDGvoR8+U3eaERIjx+FXy/ejzHQX0UYqSRyDMYYDC5n/Hsr+Su9Yi9R12eaoi
 Hnl8sa1QLcOO5vMmtjPkAQxkW8qKb3j59l7jv5w+6V5I8vlrb+gh5hTTMoIwuPwi79puS9eayf0
 AfL010thQXzq4JCkj3VnOpVabnqPMLND3RChr/ia906jXkX+A7IsE05MJcgrp0/be8cdSsvDcAu
 QrdjcI+YcElqlb0waB/hQvNub7yYf+TOlrKYpalE0O1Pfyc/8OdTWoPbzjQjXGoXHpDZUSxgtN4
 PGDp1IW/2933ZGNBxSqcHVaCIuOVTk5Cd2Su+YrheH83MGWIUgXVnufHgv85OTKuuK4ZTpq6SZ8
 4lI8d3sYUme9PeKZUPwbjh6p/nZGIDS3bpbENzlhuW8kLayIz2Ej4Rxe/fpY+GFgplPQDtJc3mp
 rKv/wXaVXbZGFr3G+dBjmdGrNM4B1oCPPb68byPwhd1GCP0/Z4jbqdK+TXRfwhUuINbZ9BetAMh
 PE1c7oyln4QHdhg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-clps711x.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index d69a24dd4828975b4d62f66b011964456976bfa6..397b347ad6e8b036edbfff75b6a31f2170334f66 100644
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
@@ -36,35 +38,38 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
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
-	platform_set_drvdata(pdev, gc);
+	gen_gc->gc.base = -1;
+	gen_gc->gc.owner = THIS_MODULE;
+	platform_set_drvdata(pdev, &gen_gc->gc);
 
-	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
+	return devm_gpiochip_add_data(&pdev->dev, &gen_gc->gc, NULL);
 }
 
 static const struct of_device_id clps711x_gpio_ids[] = {

-- 
2.48.1

