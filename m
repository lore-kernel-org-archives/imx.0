Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97637263C8C
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 07:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392525; cv=none; b=mgs99H9riYqqi3qyJ4zM4R7eqlvaRNGL0YzOdfS/DGu3YfXE9KzKmHiLoVmGJyD7W4R3cTxOBHFfZN+WRwaK/iBiUW/aqjV1/VyGIRi9zLuiQiNRDAiWH3KlFaDgBKAACeAgimMiv+pZKYTwYVICtgIK8eJPAKwF/4P1fC/BXGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392525; c=relaxed/simple;
	bh=XZ6xojvd/sruxF+mCw9vlXl0QAMDn2VLNkwr1xB5uWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwprv1MSVzi4edvnleRmulNTBToa+WHHIzj2TfLa2ZvrIKchEc5nfrQj9fipBdq69aobUDeSvlHMOxVAJVoChVZLKsNfzPCPEZ8uqE2TxCiyTIgcZ0myoVdQIqkOsbXJPp23bJaKeebxNfu0kboqxYqLrxxYgxgcjM1D4AakjWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pKQrov8L; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pKQrov8L"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so4136029f8f.0
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 00:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392522; x=1745997322; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFMUXD1U+4Z14AqM+HV1w8wuHug1ZmPE1i35Sl+Hm6o=;
        b=pKQrov8LwchWoKUbOD5Q+jlNLvCTH/LoL42zU1xDYz4nAhRbs4/eC4t2lLwdng8UC4
         1UyfQydLE5xR5xIVygk6Kd4KsmbQdJrh4JmJmcStQ0CGiOXrik4GLvFDQMEcIcqiZpAj
         2jPcf5nnuRTVcyu8u0g3hZchCtU1WVoMRt2Us4Rx1Dm4FHgK9cuUwDKBtLwaUojMfrEn
         OIZXxP1F1ZdNsRjJ8mxEqEXADn/gtyohTXrYiEfDO8EXkvAm2gd1AvI+T3aLVR5G+xwx
         0JvCVmqemCOjsB3Ukgn4N/NtuGfQsQR6zw9T4j9KTRGwRJ0NEQxWxodpWW723WZz9wFV
         9M8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392522; x=1745997322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFMUXD1U+4Z14AqM+HV1w8wuHug1ZmPE1i35Sl+Hm6o=;
        b=THjFQQLrq61byD/3EptbP72m+0bbIqiSAIXpI3F/9QiYhE+c7kTpKGdGfgcl178D04
         z52j1x0Q3hxPYRw9JSznWyN9rnYNqLpyqA0uidrKC26Rj4B0VYVO2diJ6TB4hBT6gvTf
         G4kT0DOoXREnp7jBDwlXlHkBI+ENxkc9D4o6FUd4uXQWT5wSK8ORdm/RdXTRj8Hyxwee
         NwWvUZv157u9Y7Z8LoOGjfekdzhoo2qOROHkprkbtQzYI9W6n0ennsUYM6nX3jSqwU7f
         RFdGtIEr4aRAvojZ0U/qJ0bcrTUGkmjgHksIIVILJbDy21nZsh+XYme8NMtGQJAtMvYk
         J33w==
X-Forwarded-Encrypted: i=1; AJvYcCXxmlxgzagJCUsXXp6SMPvw1V96yfcKT3/bnc02mLdJN3kfUpdBIMfJSHs/rynojYKDDjQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBRupzFpG8/zlahKAEbyazK+RHTQPDRYNF72c8JBlv3pnNOZlJ
	AklV+5MdrsB5wWkdRfja5nsR3WaTb+GYSWRwmTJrjKLq7r7GRCElstwAoBPTDII=
X-Gm-Gg: ASbGnctBhnC5WpNwfO/omCIcz1YIpT4PYJm/Zt/5mtD4QvVUc+Nu08v+9Uc54War+DM
	zfhwyc4+iNqoHEsnB94YHM28oFcpvUXRYnFikpzdJFp21lbKyk3lE4btA616iJ9sRM3FbRSbOhr
	+vxg9IeQmP/QwwedQlYKAE8Z2rC0BaO3OyK7SIm9PA/7c85B59OuWhWVjELdtrpsuEctOoDtac6
	Nw8HyRbFz4cAV5CUZe9MWPKq78bxbE8X0+Ppp0mwn5fSAt1c2TdGIILj3AcA76f0pJVqwtnVQog
	7Aqju6HS6qd4fxgG7RNGY91vlLPv9GvwAw==
X-Google-Smtp-Source: AGHT+IHvsBcpeDWfBI/J2ZFwFCxrj5c1G/ZijldBOLJ+QHGBhSPa+tWadnMgTQM8cXeS6fsrFI6NKQ==
X-Received: by 2002:adf:f94a:0:b0:39f:6e9:8701 with SMTP id ffacd0b85a97d-39f06e9871dmr8041245f8f.7.1745392521822;
        Wed, 23 Apr 2025 00:15:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:07 +0200
Subject: [PATCH 05/12] gpio: it87: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-5-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yQXPOqcv3YdoDMJN26EWQWwmF6WtRyLx2iAMkZ4jR2Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOB/2C4C8bp0IytZf1fZVlthvBDEJeTwZpbU
 1xYV3YMLBeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgQAKCRARpy6gFHHX
 cvFCEACywxkvcnWQIWdFASec3Bgy1BDbBkOwECogN+Tf0BW6jjjtMhLaYlakK70ThJwbwhpvbUk
 uTcNGfW73G5dusyRfhVo8jV864P9WLKJRvPWN4fY6POTOmkYS8HuSB8y2ySIFdhkY11wIAMaWEr
 V5GFNUiFTHl5LpHdBfU/iA8u0VAq4PkvdFd2P6sC8l6QPnQK2yRAjaXgtw7l0oDscOTrwr8nkZb
 zpD3HIqIbp+4DW5XLnmZPFlpv+5GOiIJzKjY4VP38iPJltW3gFZthDg730+RrKm2dYY9dT8XMKX
 t6veqXdJwNvyWBDvwMj6jlzOMSHcoKL9EI/GN2LQnHD8K14P95f4wN6nJdjzkhIp8kY8NMvAG0M
 vGDY2MmLZFfx/viAY9H/jX5kELjO4upTXGb0HMpsMNlvPiLh9Obee+3BMN1we/axJVmGCCa5qgp
 BJTAqJAQWupVylYmsGyeIrDN6oVny1bg9T9J3BXIRKbRFeGY4wLeYXvTICsl3XDDyMyupOjltOI
 Rt9Z/iBdMS3P0O7JYIvMdF7U1hKFuabfVoQymeyQEgm5dc4F6zOt2WPSJHbUub145QgCVOorCXL
 K5zAKoQuqxCtTJYGPyTlNwNei70stMpgj1yXWSLNJ7/RNuvDZy0IHUkeqD2TGsRE6ZRsTp5vgV/
 xluig4eEUuGwCzw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-it87.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index f332341fd4c8..d8184b527bac 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -213,8 +213,7 @@ static int it87_gpio_direction_in(struct gpio_chip *chip, unsigned gpio_num)
 	return rc;
 }
 
-static void it87_gpio_set(struct gpio_chip *chip,
-			  unsigned gpio_num, int val)
+static int it87_gpio_set(struct gpio_chip *chip, unsigned int gpio_num, int val)
 {
 	u8 mask, curr_vals;
 	u16 reg;
@@ -228,6 +227,8 @@ static void it87_gpio_set(struct gpio_chip *chip,
 		outb(curr_vals | mask, reg);
 	else
 		outb(curr_vals & ~mask, reg);
+
+	return 0;
 }
 
 static int it87_gpio_direction_out(struct gpio_chip *chip,
@@ -249,7 +250,9 @@ static int it87_gpio_direction_out(struct gpio_chip *chip,
 	/* set the output enable bit */
 	superio_set_mask(mask, group + it87_gpio->output_base);
 
-	it87_gpio_set(chip, gpio_num, val);
+	rc = it87_gpio_set(chip, gpio_num, val);
+	if (rc)
+		goto exit;
 
 	superio_exit();
 
@@ -264,7 +267,7 @@ static const struct gpio_chip it87_template_chip = {
 	.request		= it87_gpio_request,
 	.get			= it87_gpio_get,
 	.direction_input	= it87_gpio_direction_in,
-	.set			= it87_gpio_set,
+	.set_rv			= it87_gpio_set,
 	.direction_output	= it87_gpio_direction_out,
 	.base			= -1
 };

-- 
2.45.2

