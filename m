Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FF6269830
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 07:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392530; cv=none; b=NeuClJSVn0TARC+lz+iJQhyc7cnzjwgReYmBartxtH5Tp7PqDuwOxNxpxrnwUIAZ9FqrmfJKzepMduJiHESNDuKuVsGV/JIKfzYeaagMe/k6CmUUPK/cA6LBUXr9DKFUPRlbX0sv2U0LxTR8pK+YRaYEg//FPhlfUMoBdDpsDqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392530; c=relaxed/simple;
	bh=dRmgJRa861MmI7blzQlLwpGi6JFHMnyAWY0K50sqM2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZ8yUIsUfV2u0CJoqIe4nS+4IQa0pZlEkUB9iKeZyLiBvi8OhGnAvzxXFfL27kYTyCVHPvJZTWgO6XohmbWIELAttI1ZazEQh0+MA8gAEtZyjXTxFlRIpCxQX2pHxuWFDXSev+QrnWtvO1aqfIXwslgsCp9kDrpgWaJoEe9d1Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jQpPgovu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jQpPgovu"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c266c1389so4467056f8f.1
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 00:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392526; x=1745997326; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ir3eyI8qcGGsO3Ggl/orTJMx3W1xOxCUBEIWWxHP8U=;
        b=jQpPgovuVo+bedPd+kGVu66ekpPq0F4/wExz06h3GEqLb7nqOd3CTjYres5cWYMpOg
         UPHT1h0TK2umE3TK6dOFlZ/dE0sM9HHlEYkFYOjMKtO58gueVdPnYHDDxgt4j4era0G8
         oBD8vuHkDKhkbgh0gDulK2IMQ1MA5bACVi2/cYj4b9+acZiMTIg9vYbXtj8NwE/VVA8a
         BgCSZB/93EzEQs86MysIkkBDG9ac6RPgls1Sv+Za80We6IRFlwIlkY0z0sHj+dbgQ+On
         8jcV6VVeHeP07WHJnsSlRGxwQfiFsWR+Xty/FG4912jEbLuw0E1XMhoh63OihU+k6wdM
         KI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392526; x=1745997326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ir3eyI8qcGGsO3Ggl/orTJMx3W1xOxCUBEIWWxHP8U=;
        b=UobCMoYbCOB8QwrpIs0N1JQ+fjklaBL6VLOmIBrO8QltztroKpk/3HwsizSX4noYBK
         8dJQ783/P1xE3Ts0EgtUbHHoYLkjqYj0FdS59opDE1kKp9Zn/AceDF6bRHWUZ/v5da0A
         qmVWbYJGXa1Y+7OY1Mnz2BI8oiEO26GwWDZPvwEZ1nLhFBa1B3FPBYTNVnr35ihwYNNQ
         yOz77ApdPCPabJDQNdkrQ5oc+oSSdbwzaICtE3wmy7bhen3CTo+vCCqSwe5kmaJFeMie
         r671/RSnnu2LiAQacCPoJ8xNPzdZaxHX/H7R6YMr8hqGa4DGPC19QxUF1mZbkHZDqKct
         xgxw==
X-Forwarded-Encrypted: i=1; AJvYcCWOSLbZ6DZw1T8g1w9/QccaxT7UqbQj6yzSz15zFI6+ZSvhDJ5fRSG4Qjwb5GgqLB0Vfik=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj0hz0joNheo/bdwqsafCN5KjYhdva/x4lAwZTNTad+GmT99HK
	zlnLVU/S1oJidHwwUJNTgkMJl8r/5VnYeG4mQMVSwxSROMQspvRb1e4EE9d5dgY=
X-Gm-Gg: ASbGncvMJkick1YHdZAY1ixrQ/di7JF50y+bVhXka+Py/YVkm6xEFo4gzEm0A6QG4QC
	ia+YqROjH3xUcbMPpKaj8pqHZ9MrMXmsvyXDF4kOz9TCLdkjEiPLHZ9+PaJFz23iD/s/DembxYM
	S2L8AsiiAbuCxk8tcMmVvC97gvXm2vUNmVCo44+PP0BHJd/vwk32gceNNl8GsgdkS5yE+2AvAcu
	8rk63x+ziTKSWCvHWhtWOEYgePM/lQ9Er/V8gl18j/kIrBa5YVIuj8oSRVQnuD+kLEgUu9WqCsP
	mO7TXLe/FS/7AVPcyvTpPOQunDSFe5/Raw==
X-Google-Smtp-Source: AGHT+IF6SVfs8RHa2BnADJcSY6J1I9halvCK1KnXR67dc661aBEXTvglED7nQaJPJMMIX/l2j+WJCw==
X-Received: by 2002:a05:6000:c08:b0:3a0:65bc:3543 with SMTP id ffacd0b85a97d-3a065bc358amr1886761f8f.35.1745392525708;
        Wed, 23 Apr 2025 00:15:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:11 +0200
Subject: [PATCH 09/12] gpio: logicvc: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-9-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1906;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uEXyapUiU2zuU+gAX/AtJAOANlE8Iy85z/xFY4aI4tc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOCCFWE0JSqUtSesVr7mzuU1M/ku4tksaurU
 rUbPU9KQmOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 cmecD/oDvN3BKxrxrluO97/IgXHtepSYXO/eBzaKqLSk46iZdLfN1ELs7wHsUUCRmq2Hcej463z
 TxWtZwr07ZL908O8pz8zRVVcnJO1yFup+nI+BE7cZ4T7/Pj19/VGw1ho5Th1IVliSLTPDxKv3wE
 UV75Y1wlMk68b6hXi8hM23v4fz6OXZgdEVCnYPAxYhtntLyBaB4BtG+ThkjKk6d4ss+PUJ17Gdk
 EyPqUiuMp1mEwIusQp7OsSs4yIpAHNJhCDzNJ/uRmyPQ1f2yXkEz2FVHWApJJxXonw1VRWvpFLq
 ZG8F8Bk+K0XoBf++3dofAzsCvMyggHSEyAewsW0QmB8skAO926oR8QpVD9gstdjpzKls8ei2q9W
 Xg9m3Lcquv19Yw9wnZFpRpnNn+XtgJ4cj+83IztRU33NvxcbvFbB9Z9XMNcBj9sz0iAgA6txYgw
 h5wILlAHqzeoFU7ibGssNASTrg8bH0JSP0ViL5PctN/ye5/i1xGUryRXb650M4S6KRQCSjgL/VK
 i0RmEiBUqd0Dvr2K5qGV16O1j39J7oVtu60wglI9huydbBqbJG3pMQvi8Bae5FR1Zdj6/a+GLdJ
 Lcqd053up9xLuw11VFAGN9he49iS8D/z83e2oMdox2G/EHa7hq+p5yQKWQz9+oNDKRmkWne24k1
 NSW65Qz796zVw2Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-logicvc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-logicvc.c b/drivers/gpio/gpio-logicvc.c
index 05d62011f335..19cd2847467c 100644
--- a/drivers/gpio/gpio-logicvc.c
+++ b/drivers/gpio/gpio-logicvc.c
@@ -61,23 +61,22 @@ static int logicvc_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(value & bit);
 }
 
-static void logicvc_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int logicvc_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct logicvc_gpio *logicvc = gpiochip_get_data(chip);
 	unsigned int reg, bit;
 
 	logicvc_gpio_offset(logicvc, offset, &reg, &bit);
 
-	regmap_update_bits(logicvc->regmap, reg, bit, value ? bit : 0);
+	return regmap_update_bits(logicvc->regmap, reg, bit, value ? bit : 0);
 }
 
 static int logicvc_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned offset, int value)
 {
 	/* Pins are always configured as output, so just set the value. */
-	logicvc_gpio_set(chip, offset, value);
-
-	return 0;
+	return logicvc_gpio_set(chip, offset, value);
 }
 
 static struct regmap_config logicvc_gpio_regmap_config = {
@@ -135,7 +134,7 @@ static int logicvc_gpio_probe(struct platform_device *pdev)
 	logicvc->chip.ngpio = LOGICVC_CTRL_GPIO_BITS +
 			      LOGICVC_POWER_CTRL_GPIO_BITS;
 	logicvc->chip.get = logicvc_gpio_get;
-	logicvc->chip.set = logicvc_gpio_set;
+	logicvc->chip.set_rv = logicvc_gpio_set;
 	logicvc->chip.direction_output = logicvc_gpio_direction_output;
 
 	return devm_gpiochip_add_data(dev, &logicvc->chip, logicvc);

-- 
2.45.2

