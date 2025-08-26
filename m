Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509AC3376BA
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 09:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200930; cv=none; b=ABvl7kQxsT2iCnmXsKKne5vgq7EGX9y00sNbUazzWt0DTdMfPoxrm0SowlQ/ZcBx82Ove1RH72dgAu/4paVY2ig+BfFLyUdSdMKDM2SOqLAdhl2KIxJUtifUKpUP1OtGJLa22IENIf49Gqh0yDjqv/nReHoEuC739OD5DYt9K5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200930; c=relaxed/simple;
	bh=DFFDgVkLa4W7E7BZ3IJ6QJgOfdfZicVeIkHeCt4e49s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vhnzh70rLZotYaWvf91mq8Wrq0+3SVYElfwA9nks391MxO7UwditE9fFxpDU3oQoT1qBCvSlPSA3FXxiKuwX7wcEeXBSsEhcMIRccFBtDka2ywYulBwQ+lZxlunMo5NbOpG83b5eL0ZU1zpQFHMP4I7vG3qnoK3mLgosjUBHDkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uJBIJ6gQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uJBIJ6gQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so30458325e9.1
        for <imx@lists.linux.dev>; Tue, 26 Aug 2025 02:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200925; x=1756805725; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+IgadMPCpUC/++KjLm3bCMV9ciEZYRAzPqmSLRp9gI=;
        b=uJBIJ6gQfXf1oErbKg60EFgbV5+xef+Va2sgwFil6dNqE4oHLenjhRAewhy1KI5knk
         EIPTU9//qH4fofrXU+fi/UtoFird4URrl0FYb5J4zwu2ITfHwRM0honUCIz4M+b7sTVt
         zuMkjJudnw+WRQp0WyF3PfB8oRBpMYAwkHbfBymP9tQC3DXMmyG8AWKy3bAGY9bnUKFd
         aoXIli99JW+bs+iZr1Mfi04+SfAc+DY2CsO88JOBmB4m0nOMU4/5mDjF0PrexGsFFE5k
         KGNb1DQbiZaIPW6I3dYRW8uA2cjxwFqUvpsCI6RxTfd+n4ItKNBTDsktRm8qcO7enoAN
         eTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200925; x=1756805725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+IgadMPCpUC/++KjLm3bCMV9ciEZYRAzPqmSLRp9gI=;
        b=UE1gr/xECrjKF2SWrP0kOiDg++j8ZxSu1/Je0Cwep/mgFbIcKIU1NHj3JJXGHzvg4c
         H1pVoxK5WBf5n5RP08lLjssz9lUq8Q9D9NdR42lDykn5h3XkEyPdN2o17j8NIV6Na2X0
         p8YnfCfofgq2ck5p6pPO/ngt5rt1traPbep1Zj9Vre/KUNgpKTyxX+wyRPAF5GpwBChi
         Aj2wXpmnQCeXwQB+OBCEiqLo96l/Rb6m1gefeNkhpgukKVIVbDXcsdQX06kiYTZzebDS
         OVjerkNAlxOPQndWQCtoI6q7Uhg0GelbM5nJCnCeYKBaNzZJFSuzu0VmxeXev91LZqSA
         3zNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK0l6kTrMUqpVm71Ozo/Yi8ZxIZItlwcgnB8P+tX9RRliFkG5oLXZYG1zQpdwvonhuPmY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi78f1iSp3b/9atATRTZ+9zGqEtrPUQD7Mve+vqAwTx2HgKhEV
	sAfqRuBxCUsH0QbsZbENFvszObdIXNmzTBpBoP111AcXrulr52HujFoBxaW3krcQdm8=
X-Gm-Gg: ASbGncsaRLtJwat4pSXkF5oecVEXUjIJLZkN6MV1O0tgC0pNFsUcglZc3DMyf+GHhf0
	w+54I+m7ZXUV8Dpr5Jqtqf7hCVSKocHN1u1HS+2ke/tvuD2vCG8kGM8qE2j3I/XWunu/7RSJCAq
	w4lWzMIBTaxDrOkZanODbdzYsmx4t45rA4g6RVxK1qVRZ8fGJoClky86P+hp5bASvM2F8f45N6B
	HRSFJ5DWjUjE/XI1updeMSuANt5id1JYbli/s8nOP0fIT5j6o4RgjV4QEPv0oa2h9olVs9wYzgY
	QJl8uM4zUn0EPKqs7dslDY2nNr1+3tEBS/GrdzXv6tbl8o6MoRRkaQmsQda5aI/1e9ZGbKT2BjX
	zC62m0DzTKxW8Ku7qPx0WQi4dtwE=
X-Google-Smtp-Source: AGHT+IHavDr4lrXb0tPvaZh9I0fsnzNfSPDgciGk3rvyy+vJ1h8FkIwM72xQkP5w3hRvc6eVrPvNXw==
X-Received: by 2002:a05:600c:6304:b0:445:1984:247d with SMTP id 5b1f17b1804b1-45b5b8c69cfmr66389295e9.7.1756200924523;
        Tue, 26 Aug 2025 02:35:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:12 +0200
Subject: [PATCH 11/12] gpio: vf610: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-11-f67603e4b27e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2652;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xP91+sQmCcnIVqvhAypk/fFTL3DNrTmtPL9RCwg4XCs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/OhdHiQnRyfyg1vUekmEHI/tZKgXv2KYL7g
 N6Wbnk0GbKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zgAKCRARpy6gFHHX
 cvLqEAC0h6J0iS+i94SQVe0tR2djzaG6SV6OY3nkavsLHUwPZyT0UUZkLXuVBLSpjWPh/hQWloA
 uqGBhuuWOBldA2Hq4s+bd1eaEgaGrf1+0I1ov5j/z45ySprWLwjQqkLf/u5Cux1idHlYjizwhBD
 0dNt/F3n238/pM2ItXXbI/U4ed1VzzgZblWGLIL2V9U4XGYetHrQmh78gETOJx8OnuJZ1yjSSRP
 9roWryAijuw0u4FS68iUCa01c7JfS4JAkPUoP8wrCBWt1nj/NYF0hfmfhPUhVdAY7IP6sBwDpcq
 Hq4+4C4LdOM2URb916kFJeyFA8zxzitKezkAVt1wM2MORyLjsPUlKiK/85TeCVAXMyHt4n8mTsm
 Ntd8RLldBDqAfuFqY9LZHTv2yljDouhsIeAg5q372A1/rw5/K2VSba62S5uqlrGsGeKkwz3uVHf
 /k947P0Kyq9ci2RLaMMCTMMcMXkAeOY6wfCPIBSYGtCbrMe9Qn665b2RO2ZHgxUJZjCb1jU7hMb
 UcqvmUXSELXpCc5Xd6LjFfze335frTNuIvoFLPeyJRlQhgc3wkwCOUdysCJ2OHwTgkWw/l6pf+7
 6HItvyUMUdHIDgR3FIUSSuqJjcjF/M/qPXh2g3lETY2dboNExiHDcKNzthpzbfpWDeJFfJXqoR6
 u+gOUvpgQdcJDWg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-vf610.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 7de0d5b53d5604784a84def54f284f263a9e12dd..fa7e322a834cc2afbab7d4948cd41465867aa4c8 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -28,7 +29,7 @@ struct fsl_gpio_soc_data {
 };
 
 struct vf610_gpio_port {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *base;
 	void __iomem *gpio_base;
 	const struct fsl_gpio_soc_data *sdata;
@@ -108,7 +109,7 @@ static void vf610_gpio_irq_handler(struct irq_desc *desc)
 	for_each_set_bit(pin, &irq_isfr, VF610_GPIO_PER_PORT) {
 		vf610_gpio_writel(BIT(pin), port->base + PORT_ISFR);
 
-		generic_handle_domain_irq(port->gc.irq.domain, pin);
+		generic_handle_domain_irq(port->chip.gc.irq.domain, pin);
 	}
 
 	chained_irq_exit(chip, desc);
@@ -214,6 +215,7 @@ static void vf610_gpio_disable_clk(void *data)
 
 static int vf610_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct vf610_gpio_port *port;
 	struct gpio_chip *gc;
@@ -293,7 +295,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	gc = &port->gc;
+	gc = &port->chip.gc;
 	flags = BGPIOF_PINCTRL_BACKEND;
 	/*
 	 * We only read the output register for current value on output
@@ -302,13 +304,18 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	 */
 	if (port->sdata->have_paddr)
 		flags |= BGPIOF_READ_OUTPUT_REG_SET;
-	ret = bgpio_init(gc, dev, 4,
-			 port->gpio_base + GPIO_PDIR,
-			 port->gpio_base + GPIO_PDOR,
-			 NULL,
-			 port->sdata->have_paddr ? port->gpio_base + GPIO_PDDR : NULL,
-			 NULL,
-			 flags);
+
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = port->gpio_base + GPIO_PDIR,
+		.set = port->gpio_base + GPIO_PDOR,
+		.dirout = port->sdata->have_paddr ?
+				port->gpio_base + GPIO_PDDR : NULL,
+		.flags = flags,
+	};
+
+	ret = gpio_generic_chip_init(&port->chip, &config);
 	if (ret)
 		return dev_err_probe(dev, ret, "unable to init generic GPIO\n");
 	gc->label = dev_name(dev);

-- 
2.48.1

