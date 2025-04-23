Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774AE269CE8
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392530; cv=none; b=F2X6XgP5OLg6HkGCbwxAvG9u/DdNN6wta7e3yjEcpaNIMMcgeUDTMu2CSbN85gyqxc/f6C2ZqAdubYeijTFqKOPFhJxs07HAPWUNd6QX63jtnWDdC0pvK0h1pL18z9g9hSXXK26naNuGGByvSSgV1bNfDahVlM/O9X2PRtjTXqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392530; c=relaxed/simple;
	bh=3YefCFbAihyHh6K+CQ9C1No+vZq4v8zZ85pWhxL3XB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMoWAHUFXczS1MdAMuPYss63ylx5Cq8kKg7oYkykr2OWEXMANSQyg0KR4ji/t21BncDpCoYU5M1QIsn7e3uStYHHoJcM+63HizWTvMyL5gRJGDfx2rF5iQsQZPqp2NXj3RfJh/K+DlPiQNuqPuWopm/gNnhpDgDK/zjOzVncaFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Eq9zerYy; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Eq9zerYy"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso395249f8f.1
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 00:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392527; x=1745997327; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuO8LXLaj6tGmiK61iwiXl1Q+QX1pLUQ0uBHuTCHujA=;
        b=Eq9zerYyXcUbFW6oxAAVg845jyGrOk4utTb7NK/eSGK3TH9Ny45a0jIrj87XpOabvy
         ZsNHlxHm/tL3m0YE6m5ORJOxSyacNBP/7lwklOZvm0B7G6RrIcvz0mi0IjD11Hrni1+F
         u6EPv/H3jHrsc1Y8B5dNkQDhKFhW4LbS5d/lpXDkrXy6Q7HUj17NHHcWWx5IsdJ7d6k2
         Mkg5C43Y268pICAxEzkuRIMPiQcG30CPr4NChzS3/xWTK+vjt8iFof54tolTmLASaDqm
         IBn4kfqO68E3OtunN3ycmEJFrtNtw7hQhbcaXITZhBw1rYG/LcVNxSKjVdeHsdEY6wpW
         uA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392527; x=1745997327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuO8LXLaj6tGmiK61iwiXl1Q+QX1pLUQ0uBHuTCHujA=;
        b=kW+oupRtAxu2Btb4qKIFmTpEL+qXza1FS9Co/PbXWj/Pd958zObU4FOgUgA8LhlldK
         jdOX1+Q1ZjuzgfcVrDfHr8YZkohcio3i79TY4rVSN2IppVJFD415PQd62vHP7p3vXZ+1
         Pa5S3z0NxivDdoGwFhy9WZQzjSSxHF19Qxv/GjMFkWRoCi5J/PlPRrdzcFeFoOeZT4fd
         owZ2uqgE8qkT1crn5qdQGzjYu/xPfWXwneIlPGj2/ih2RogeyP1szvzUWW3SCyKD3bH3
         j7cYc8mzxvfPrhVgsy5KOD+CuAXDkqiIVpVFFnp/40XCrdQPhJZR7ASXhnaN3+rOhBzH
         2uLg==
X-Forwarded-Encrypted: i=1; AJvYcCWrMC5eoju1ywd7xbBzxOoCEyAM+I+lrxJn8JTty3GN2JHT/k4soBE+7CrS7+FeuTFOvQk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwabGnH1KaEcYlmN/CEDNZe0Y4lJiiheGCRXp5YxvG3+scfmnmG
	zDbVOh/Hcg1W2geemhh0NWcK8OR6oE4KZ62XEyT/w/zG9CNBdIsU+i2q6bCFFm0=
X-Gm-Gg: ASbGncvfsY2YdYsXexEOp/XXxj+E6A5nFntyDgc0q38q6SklrZi/QxynBG7hDKTvePm
	tqntTF/6nR68est0KS5nDd+KHVRsha7caCAhLhqJvEi0jK3cW4P3d9PagyFusXuq1Upe1UZ0xQx
	0m5e1wsaS04YPS9Rr2qw8Fd9+FfdzyzNIQzErUSIYsOn9svsLEBWyQ+tMxTVZgTXcCx2Nr1vLi3
	8j/om9PvNW5rm6ejo3zTuCpM33lFvKigFQFX1hSbLHIkaqkbnzxxLZl2hgeI/7YBMQEXHljVfUa
	meiFtVHmNHwdVOh9zBLLB6l3h485KA1F+A==
X-Google-Smtp-Source: AGHT+IEJRBYVe9vXo1X/mEloHEs7WsK7MXg+lLpQw/AFSEfrHU1wIu1UQhzy4bP2erJ227bIHP3Apg==
X-Received: by 2002:a05:6000:4021:b0:391:952:c74a with SMTP id ffacd0b85a97d-3a06723a77emr1339241f8f.8.1745392526817;
        Wed, 23 Apr 2025 00:15:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:12 +0200
Subject: [PATCH 10/12] gpio: loongson-64bit: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-10-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sigjjIPTEY3ikG0qReuX5eSm0UPDZcBac77WahmCDlo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOC4b/5tUNY2cHVsO6pHKhqejDv85KHLO6gw
 b2r1E71uD+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 chWAD/9un4OKo68l/qCfaj3bETsvGglEXhCUTJemJZqJFSZuU/K+Qldmd41zqaqM+EkjJpwS2BR
 cy1gvC6hQF5drLpuYsUOiQGdjyoDKrNObRhJQmnC2IhOrvyu1bUPl81+e4j+lvq3tIKqM5dtgZU
 9zgjBrcKB2gTl8SHuyLswt0FYgUshgyLQ9O4McyxSF4diZjdC+5c2gIhKKtdlhQjZmlBXqY9UWn
 35S+Xm81VR+EzOSPUaTiLS9vvOyg4JZjmgaaaUrsNWf7+tmAUMMg2HwaC78AMqVgIsbfNXApPM2
 +k/535/Cg1jNF76IFdB3/lfiK7P3WLjMOBbPG66lqwMc48NEmKwrkjDSHwdhH7gHqrcy9bB8P19
 wzP0WrsER1d+nNz3P74oJFSO2KDf5F0qkl59SGD0m47YvV54m/byQMrVM0wz9k6+aMOlJjSAONZ
 gyusViuBzXKGErs2QWF7i1s0Cn3gGi/9LZo7UhiTBZDL7aoKLbJCoZjmHoCuQEXoibNzf5lWRo/
 m1vj3a6HQsGSe6c5P3oA6OSFznrzG9HBXR9rRF+5wOegFmNVzy6AdRp6zF9uOcol+30SbMglzu1
 tT37Iuw5qBsxXN0tB40X+ZW/WZ0uOF1Qh+USPi2u062RO8LVv4bLaasO/UGGAuI8v5FJmpgUR+9
 kUvTSREDdS8oLoA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-loongson-64bit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index a9a93036f08f..26227669f026 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -105,7 +105,7 @@ static int loongson_gpio_get_direction(struct gpio_chip *chip, unsigned int pin)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static void loongson_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
+static int loongson_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	unsigned long flags;
 	struct loongson_gpio_chip *lgpio = to_loongson_gpio_chip(chip);
@@ -113,6 +113,8 @@ static void loongson_gpio_set(struct gpio_chip *chip, unsigned int pin, int valu
 	spin_lock_irqsave(&lgpio->lock, flags);
 	loongson_commit_level(lgpio, pin, value);
 	spin_unlock_irqrestore(&lgpio->lock, flags);
+
+	return 0;
 }
 
 static int loongson_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
@@ -155,7 +157,7 @@ static int loongson_gpio_init(struct device *dev, struct loongson_gpio_chip *lgp
 		lgpio->chip.get = loongson_gpio_get;
 		lgpio->chip.get_direction = loongson_gpio_get_direction;
 		lgpio->chip.direction_output = loongson_gpio_direction_output;
-		lgpio->chip.set = loongson_gpio_set;
+		lgpio->chip.set_rv = loongson_gpio_set;
 		lgpio->chip.parent = dev;
 		spin_lock_init(&lgpio->lock);
 	}

-- 
2.45.2

