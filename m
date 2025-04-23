Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD1D26A1CD
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392532; cv=none; b=HZ4BC0sTcvtV7F7voOs/aenbprWJhYuo3QeicMBD/y0SSflgvPTviHvYgK0+SMWrov1Wv9CnA68jggyR1SzSD4TJpSt950h9aBLbQPflOypQMrFe+8knV1hq3sTUDeYMU1zFouuI6RTBjVv5Jdi15LimE74GNYKPeqeFlx25aXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392532; c=relaxed/simple;
	bh=sl1wLB7qfa5cmKKEREVGzg9gBscjJ57jgLR48mBriYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omzehrFcWSCv2SU6xrG2byulD2TajOCskXjFzf6svJpkFoLeXbtEJb5WrW7urJLAzsrkU++I+qyEK7iCeOS8cGGprV0blK8MsLapIxB6IGDsIzab3Pc845BHoOa7ieRdn+u+iXzPkh6+Hw/lP9ja3SApjQLHsaae14GGdNusMBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VKwOEchv; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VKwOEchv"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso4365895f8f.0
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392529; x=1745997329; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDPnLb9e7MtlJKq+kitIrFY2UoRe6RaLIN9ni7aHQLA=;
        b=VKwOEchvo5I4c+J1qsDR4uCAgpbZCKSNUY9G+ZRtuihC16rR/5FWfd5IYDddbo2b6F
         OT01TMQmtx6hYbjjVzW7oBJMHIXTZv5ZG1QRJkp079lNxdX/Pdqe8eQDAD5JIOuq2ngP
         RDIGpaZdLmfD1wsVFAUwlyq2z1inA/oGU8TJqZxmKHNJY6xsrmyQrwWta0jAHKSOYncT
         2i9deN0E38LRP6vY6PdCYP5G91i2q+mStjzFClpHBsUU3fRkDsnOZdxzf1CHcpw8T32f
         HoqJhLoJLOEdXmW4DSw8wFR38edHgHErgZjcPMUjMiQzp5gu+BDakFLeY1XiomconI6C
         qFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392529; x=1745997329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDPnLb9e7MtlJKq+kitIrFY2UoRe6RaLIN9ni7aHQLA=;
        b=ZZFNjZz1x4s2yTxmt3F+ZsuxtwCir/F5xJNJTFCBjYhS3yb68uPfp9TRBomE+Ti68C
         Yp+BQawy0PtFFZWkzLWLMy3NGqHGiUEtWBLrEc/u1kHbnw3M8BTsrUryWnKo4QZyW0l8
         StQjt81aoe0MHEh1odZ9g3nEdgNprMgzmFGiBzbIDtOvzpfkvr5t9ZFMOe/RTeQRlT1Z
         9GNkMCCbat3BrTlyUlTOJBeiywuqP15r4r18zPpAv60qU6YrFmkczG5adhcMii2qqEh3
         NI1HdfYSa15sqTTJWPB21Rn0TsjKN+PfXEz8La3Z7WmBrxWBeKQjG0zS/4drHh5heMkp
         ZV5A==
X-Forwarded-Encrypted: i=1; AJvYcCVmx445rsMI0/+d8c4GrCIe9U1N2eXGPVDajFnFzyS4lYjm/YHkYHF45R++ukY0TCPsyps=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRz8kfQ96e9TgC3iBrdVocVFROrm7VMHnGTovGnTVSZChs8sBz
	1+kQK2w69fzVgwVI3yFHIfrUPBmzVM9DSKpeLriYJPmZ6bkU/7sUDk/4idKF5oM=
X-Gm-Gg: ASbGncunwC1QJzVnwWeO09szbuRKg6szD7tjhwacCPpl6vGm5/D0oKX1+8ABDijAMh7
	kUShIhdRyVFmXh6ceTrpgzlHG/Tnuxiqo8pB2TLNAHJu7P2JBpOAsvEmoGRuAWqZxwDyUc5weTM
	2jhyFrMfFUWgAEK8j6iypYY9cl/62+aRv3w8F/3RP51OOMPO5sT9aSoD8L5/qHpiwpGzywfMQKK
	AdBKSsaxlqzGdC6vgrYaHgtxEK5plfRvONb1omv9oouMVvYHwCxC3qEd08P+7D5tsLKSQd+WlIG
	qU1TlODkBshhm7hOsyCXusFa+LTt8FaiUQ==
X-Google-Smtp-Source: AGHT+IG4ElSHC7IwlTsGTLIS8AFpJo6V3IEFvD0t8DPJXLGCbfVBAFrUXLFfWQ80OqkPgdRhHCCGkA==
X-Received: by 2002:a5d:47cf:0:b0:391:3b11:d604 with SMTP id ffacd0b85a97d-39efbaf6f60mr15814842f8f.54.1745392528677;
        Wed, 23 Apr 2025 00:15:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:14 +0200
Subject: [PATCH 12/12] gpio: lp3943: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-12-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FKv0jedtK8ZiOafLuePhziFUAqITUizBRiw5s9uuJh4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJODsx6BmS5Uu3epYT6N1MlKACyMV3s6UBiz6
 5RntwZ/tcOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgwAKCRARpy6gFHHX
 ckvDD/9EH2Cq8MY5MoOXZTt6EMH1AEYUaKFr0FsHiSrhY9sp8VAZlwuAebQrfiTazzJ54yI1HAA
 zxk/F2yLuHJo5SxVJs7u6h+/0wf5MNJhKNr05ZJQdTzhn3M0KsE2MJDCzvf189nXA3B5BlBysbF
 KLaDTCGPJBGO9DjOm3BakFKHwT+YN53PZFKNlZkpjg2q9EkmGgondq0BFDC21gw5BDK8NCpBYwd
 YEYQ38fp/o/YGTlg4Dia8DPwYwmzI2mzyG7H/HnGGlWbqd/OqaHf4zx39t+kcKq6JQtdnn0s9SK
 1/SEkXmveDecJYUqkS7ckKP3EUD7nZcEReypoLwPhYn8Gi3veJVeEXns3Bfz9tnQororc28L1b5
 z+ZS+HTK2fV2O2HThQThzilNSepFKOq6Q23mFIiRnP7JpEKRRd27GgfknT6+xC6Dya2e4ZZ+KKO
 +UuGlTDBQFU48+cNeuJVfJYXNZroT6fbFjMpPUAZ0B/FU622qgWCjtX2Okt8O5bHdu9l88Xv2wV
 FHf/+EB8a06+atxP5WHtqCSfEv48CirSDeUCg1w+qeQicvBiJ7JmJKXm/u3OEGPAH3toIq3ktI8
 KTWWXlFIIUkIlVM15leFB/hrsHmBZgrOaLWx4zbAy8YNfAKZh4e3P9pPkKNRtXI58kWPncyMps6
 vqDvC+FesU7V9xQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-lp3943.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-lp3943.c b/drivers/gpio/gpio-lp3943.c
index 8e58242f5123..52ab3ac4844c 100644
--- a/drivers/gpio/gpio-lp3943.c
+++ b/drivers/gpio/gpio-lp3943.c
@@ -147,7 +147,8 @@ static int lp3943_gpio_get(struct gpio_chip *chip, unsigned int offset)
 		return lp3943_get_gpio_out_status(lp3943_gpio, chip, offset);
 }
 
-static void lp3943_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int lp3943_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 	u8 data;
@@ -157,15 +158,19 @@ static void lp3943_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
 	else
 		data = LP3943_GPIO_OUT_LOW;
 
-	lp3943_gpio_set_mode(lp3943_gpio, offset, data);
+	return lp3943_gpio_set_mode(lp3943_gpio, offset, data);
 }
 
 static int lp3943_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 					int value)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
+	int ret;
+
+	ret = lp3943_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
 
-	lp3943_gpio_set(chip, offset, value);
 	lp3943_gpio->input_mask &= ~BIT(offset);
 
 	return 0;
@@ -179,7 +184,7 @@ static const struct gpio_chip lp3943_gpio_chip = {
 	.direction_input	= lp3943_gpio_direction_input,
 	.get			= lp3943_gpio_get,
 	.direction_output	= lp3943_gpio_direction_output,
-	.set			= lp3943_gpio_set,
+	.set_rv			= lp3943_gpio_set,
 	.base			= -1,
 	.ngpio			= LP3943_MAX_GPIO,
 	.can_sleep		= 1,

-- 
2.45.2

