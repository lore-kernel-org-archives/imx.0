Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB6030BB9A
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 07:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489158; cv=none; b=YQqBmCSRCytqRJwmKEDE+w+f9P87IOGcAywXDvHKWL1lJ4HSqf+H8G8mXl6gSJe5pi3qH1XcNdHopO1aLS6/9oB1803L53q+wZw242IJ599HMS3PCra8duMXx/ybJrnaGhsf5vstkslT5fsw6ot0bxvDToVL2bTVtqp8bVeeoxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489158; c=relaxed/simple;
	bh=D9ez0nF/AD/xyC1E5Wwsz6yorBDIICwhysLILiMrVFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5OD8vfJc2RF4BI8ZUkeuhHlPSQJIyRqf358gYyrJDPjnvVDjzkP2NsJstlKzGCp+EWqQQvBIWsVFm/yO9B4foxAmuPYGrxTv43xxtXSi38Q/ah/Ea+DSl9Wh6P9xfkzy4SeUY64zHH3SOM0yRrUP1dPs+7ZZxYMSyNQzVvKWXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=R2KdrTKr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="R2KdrTKr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dec026c78so20464935e9.0
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 00:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489155; x=1758093955; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGe2kCYyrBIF4DaoEyXhe9vc0rRZs52BhYtoGcoY0gY=;
        b=R2KdrTKrEp+xaEadQNNkiIKBTRXxVYlBpEDZkI9UXd3Dd2iVOtz+TUTs3HAe1An+aK
         MJpw15fRW/jP447dYcjt/nKmFAkwTlRj/kUGoRDL4ZKHzrW1a8dRbK5NDCoIvb3rVvRf
         JXdYXsRu96kQYRYVZLODbCfY2QQIstuthpTTrLnHnV2n5Z/IfKh8v/LPREMO9k6TmJ+d
         7m3h6VXNnzGhzepZq41ekocu4QSqxbxU3MTyhhB/Ja2lbnjQ3HlSnckbMIExp4ajFnIS
         UOX47D481ju2LWy3v1W6SvVIWKkCaMMsJhLopHwMs9xbOggGxnHPekqBerxqj6S9i5gm
         MbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489155; x=1758093955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGe2kCYyrBIF4DaoEyXhe9vc0rRZs52BhYtoGcoY0gY=;
        b=wtMX6CeNKEYjVz7Xg3uM4rqJvB+rwET84jX4HgFtXyR5uwxLST6nUAjs0wdGcao5/V
         SwZonIX3B3mnfCISwREIDkXTRGIOI8oKoZ5AGdUeqG6VVjVkkSczEhF4UGLDOsMe/oPC
         Tr3zu5/wJHrtbafjf1ExOe+uadhWJfPoQMTj4IPbd7l6+8h8TRX1JUf1EzwtEa++cutP
         S4b4FMy71v0620RpmOz5eapBVdzQ6pzqdDTeergHtPPU1ID4F7X50HbartgbGZiqNXTe
         39tY8WQ1b0UrGDvIpLKO8QOSp0hCyFNObSlaRkYqPhQUZNgNCOa6qEpwjp4C9Bg9LeNB
         K4ew==
X-Forwarded-Encrypted: i=1; AJvYcCVLM5Xb/R1izPOPSJJDKgt4E1ouaLN6LZoHYklL/RsV698m5HJVDcLa+gZfMGLpsdihixY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxujzMWEfBsMOd69yjES4Mms4bk6S2TFAhmTo10R9ku7HlVO6NT
	/kT8yqICMXEFkr1IYmoBs7QIaIsLmUSMNXBXhvCfOVkvw9QaF0x7VGGrRhz6GzjqSt4=
X-Gm-Gg: ASbGncuQZThMuUnpzTEb1BnMNlP0krtdpJSE576IR0uSkhP/85vuLYUFgFlNFEYb5CX
	f+K8qnPZhpRtaXDqO1L/rz01P4AdrQR1UwO5plRKt3cKzxMK88aVv37l+dcpQrWenSYXq7ipQOj
	N5K+JX0rSBZe+og4LRCPBNGTF8zhpLQ/F4+YGJNWRuTdtHzbWveQnYs7sXvC0H0p9bX7zP08LXC
	8r1Cx/PSjvthlxr7pesrSj9+tGQ4f40h1rGx4Kz7U99pH1SXSDDd/7KVMTZsNMjfifO2eGuqWUO
	q2e8ahjLJArTBlPSbFTLS11VhJ35MZXDYjDW35ZRkUm1XpqH6iUIvY+BbnSLdDU+ylAycC3TgEu
	pKZmNockaH+All2zn0cpHDFVHkx9L
X-Google-Smtp-Source: AGHT+IFKukxuWQbV3GQkjDT5tJO7ETqBsVAR9QXCb3Q6hoLg7Ipuas1CKAmh+SOgrGuDOECJ9CxThg==
X-Received: by 2002:a05:600c:4ba2:b0:45d:f650:376f with SMTP id 5b1f17b1804b1-45df65037a8mr16159965e9.23.1757489155474;
        Wed, 10 Sep 2025 00:25:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8236428sm16729825e9.24.2025.09.10.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:25:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:25:46 +0200
Subject: [PATCH 2/3] pinctrl: use more common syntax for compound literals
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
To: Lee Jones <lee@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Hoan Tran <hoan@os.amperecomputing.com>, Yang Shen <shenyang39@huawei.com>, 
 Imre Kaloz <kaloz@openwrt.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
 linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3691;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tWDuSmRqjBxh4PCbBXZnSady6kuFU8Rp72hLJEvwTyY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSf8QZSyHCR/xAEwQhF3yXvsq3FFB2Sm0TpBi
 tTuwCsYkxeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEn/AAKCRARpy6gFHHX
 cjLEEADOrejKydnAO7p85xcuEBK/60vbBbndYaZrZm7VhXvcHChD6etGR9x/gUym2NKntRzIFsL
 hAXVhRuugK9dp6StaYPOv0NzNg2DHcw92GeNV1ULDNv/30mZ9sw+dy7U36UDGUF/KoiRIAm8iba
 +5A4dTlF2MpVWXQ2GwUyGaIareKlqy3x20YM/2GK9plb6g1DEexAqB49SWARBjv54DYfFP2IRu8
 2fwwsm62dpHpqSVvggXPlROV0Q8f7t4uHPGU2pXh+8o0BG1Ajkg/btvLzTMjCCcK/jRyQp9IbEK
 /JBENsMRS1/eBdlhuZJDv9okaKfAXrSadQlX2eGOZ7J5/9MjqLU8C6uO3xxT4NIP9H8H/Do7C/0
 5FskCXqtSsbFOlbGaDuFD3c5GBgoYSX4bzC45Ulqmdu/oBRgtjFtjalSE/oil8BkOnp0fNYY2L4
 alFoFFiKMyRYIv4AQN6JH5r+KVvxbCOLCQnjHkYs8E7KAYKIbd4YgSYOfqS5YMhNhcUyfU6RmqP
 KSBeRYlyoKiaeo7oU7kZid60qvH6K/JPXDowfDz6OhK8a7ptCBzSF5md7/9/z0huGOcZB7nimGk
 EdU2rJBoEaNl4MGY9Md2JqQEkgsF2omrEVhjvDKeAQKX0ALrzTW7a1k3U9SLIK/rulrTObN7XHB
 yIXBeQDJ0g933cg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The (typeof(foo)) construct is unusual in the kernel, use a more typical
syntax by explicitly spelling out the type.

Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
 drivers/pinctrl/pinctrl-equilibrium.c     | 2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 7f45c2897c3f270430ef7ac34ef064b2e2c58abc..4e8b5e6d1e4d48acba85e8c14e79dfbff6e6f6d7 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1836,7 +1836,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 		if (!pctrl->gpio_bank[id].base)
 			return -EINVAL;
 
-		config = (typeof(config)){
+		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = 4,
 			.dat = pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DIN,
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 920dd207792596055d6f6da9403a9b7516531277..fd4270a8fb734e1452b30dad390a80a50072fb61 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2329,7 +2329,7 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		if (!pctrl->gpio_bank[id].base)
 			return dev_err_probe(dev, -ENXIO, "fwnode_iomap id %d failed\n", id);
 
-		config = (typeof(config)){
+		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = 4,
 			.dat = pctrl->gpio_bank[id].base + NPCM8XX_GP_N_DIN,
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 4dd8a3daa83e44b0e2780fedb03ab11fa46a4b7d..ef569525e9c6b00add773258f81b57db38411738 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -1064,7 +1064,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 			flags = BGPIOF_NO_OUTPUT;
 		}
 
-		config = (typeof(config)){
+		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = 4,
 			.dat = dat,
diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 7e655b0444b359906a6b62e38873d740e1ce26ea..2d04829b29c9976fdebbaa56e6c1407eafa121a9 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -241,7 +241,7 @@ static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 		}
 		raw_spin_lock_init(&gctrl->lock);
 
-		config = (typeof(config)){
+		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = gctrl->bank->nr_pins / 8,
 			.dat = gctrl->membase + GPIO_IN,
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index a8a4c2eee837ad90581d35822d49ab8e4708a8e8..22d9104499af674c489a5d265c4d7b8ef0edb44e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -642,7 +642,7 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 	hdp->gpio_chip.gc.can_sleep     = true;
 	hdp->gpio_chip.gc.names	     = stm32_hdp_pins_group;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = hdp->base + HDP_GPOVAL,

-- 
2.48.1

