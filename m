Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F22FA59
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392521; cv=none; b=m+PD5/Bjm6y7H/R7TWJL3dCrLFIvBANYv3OJmocvqMlPVIkd0V7yBAY9q6d1pSqWUfHHbXOCBpjJl5yHCHm9gAKfzCv/MeDYK86UWgHFoO4SoK1FlfTXC1DkOjrlFTpUUZwgpHrAfsogJB46V0qGBXxwdC8xiNm4mqn5tYw6520=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392521; c=relaxed/simple;
	bh=GkZqNijLEREjgRCyxLO9ZWn6Syhz3Qs1P6LxUc7FAUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QdBId31elchpRkT9Dh67vtOZc9IEMomJFh89sLHwY1zRrPkUwT/XW+X08c3U8iCmMR4HqwRNd5YP9HcB3aooCu81WN168BYjj8e3J/Img1IJ/eHDiMyLm1eGgPwwpt1zHlSvey7aVryEdAkitltC7wh4LoszNpByyuHLu0TDR9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MFgd+55/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MFgd+55/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so4497805e9.1
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 00:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392517; x=1745997317; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0bNDTv+LkOZiuFXKOWgCql95LZI/mk8z3mrtaxkHEY=;
        b=MFgd+55/Sfn6udGxUTVbtXdMGTMpP4Ic9i29nBjSAwV/8wo4hawgYtzTphAZyOKdVj
         8wLOqU2wJZC8VZ1o2ukzVJeMMXMocblJwH8zbhQf39SId/HW63I1XCFJ8K3UH0aaLPaw
         lnnZ0DZIrVBI9ojFD/KNHRaGcRwF3l+sITcQWEpYO+y7CZeGoLQ1sPlb7mUyKKokVsK4
         RcnYJ2LDC3TatScLdac082LWC+cUFU7eL+gwT9Zjobt6KBkzQBiCdfX+JTqcPgw9oyCl
         SLlwA158W+9+UTzHJTroah34TByuPpoS75d3NlZksKRIvT0gMEG1znhAM8fIF1AzoYwe
         istg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392517; x=1745997317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0bNDTv+LkOZiuFXKOWgCql95LZI/mk8z3mrtaxkHEY=;
        b=oj8LSwPe7RLMsfcpOKkRGrQT8LywbvrsddxecnDzaFs8ueyMj+/xOUqd//xETWdszA
         i7U6ks5ODvgoR8RTWItdryRaMO/YgZeL5R+lVS7uirpn1bL46bK5wcpsl7nnNFKiaUH2
         pp29SCSUrWcaNtZGyZjsO9qtFgSrWffshcBA80tyDYHH4F09aI47t1YOzmFN+Gh73niM
         7hDW35B19rjPLERGafipEgyf8SUjfVKKCJJfYt7W2ke69sIk3B39ekEOtQMcrxX15g4C
         XK1NqKpbPNhWKWcUhE2n0bTBzAV+O5rw7mgnUhA9gNRPVkVxemT+tMN8efBtELne5AWT
         3XBg==
X-Forwarded-Encrypted: i=1; AJvYcCVzmMxLKSck9a9+wBUWYLa+YoSJFjwE/0cINuLOEbAu/5Io3peXEfWiR9YpjkJoAS47PS8=@lists.linux.dev
X-Gm-Message-State: AOJu0YymETx9R0SwXzC5mobU0s3+zMoJyuoiVYx4LSdJNNtAc9irdqDG
	RkJe0K+LxXhha+3JJsSIBlJVYppXFAcp3SOV4dbOATPJNx8kmrMZ34zw6mBfJlc=
X-Gm-Gg: ASbGncvv0TrNZQ0OfhdAkrG4UC6BRj71Ad1/sB6ZiiKyk9XMdnDGN3CRKzU28RXjgsM
	BhoUoyzCTUvZztDfa75T/vbxbmWQYUhpC69HnLXjv87kLxInhcTV6Y9da4Fey7TnfIV7rgqGFPn
	3M5d7mkDGZEMaYZkzhQRm0REyKPxwuVFZ7J9nb7ljFkD4WrPaZqS1Kh7Rv4V7k3ZkkNjKxuBVaZ
	gSnCaZV2qvHDtqy83Glg28rCY+zlxRos4PVvxI/vnRHXjrUgqKunKv4YGR5GEqNPtrkxRP7rwPE
	Fg2iDv0oyWOtVv0ZjjnDGCW3qrgFjs2R4w==
X-Google-Smtp-Source: AGHT+IH9m7S47Z/jCJ7Q3TFpGFMrRhaPorWIcAZkoI6/0ohfBThJXsrLnX1OsA7yjjcCF0WIrr4Zhg==
X-Received: by 2002:a05:6000:1a8e:b0:39f:d0a:5b23 with SMTP id ffacd0b85a97d-3a067243e1emr1216191f8f.17.1745392517460;
        Wed, 23 Apr 2025 00:15:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:03 +0200
Subject: [PATCH 01/12] gpio: imx-scu: don't check the GPIO range
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-1-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sDwXikOtbtT66flaRPMOQLEk1wgtXlmWPUc5xrs2aGM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOAJtVfy51LcVaIdW/Da1I0wLQ4NQEa0Ef9t
 G5TUun9q2KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgAAKCRARpy6gFHHX
 cle/EACTYLfKBloBbJL+EzHJRUixJm8o1vusIAehFajv6F5jqFGdV1ieqz/FHdEKoul2HSfpboN
 B/VwA/JclRFH+9K71ISjvlxdHUOXVWAeC79M8RCXb2sjR1SL484Vi7SATqK1heYF6HyqgLi5DU9
 x5I+yC8SJhMmPkzCqsxF+6jMOZJamDy7JMJpu+6scjGlhAJRpx+mtulebQRcP1MzXS1vxOzfwQh
 3HSHO5/1pxJBi8sKMdmSJC0CWJkNWvPbFdcU9QHZTd4QgQjKnmLXo+vSp1zDwt8ZKveMOMkEfuw
 tXCYwfV6yDWn6AzenUdyisI7KrqI7jPLO573nh25LJpw/XODieasvx10z4wEKC4Kxru84R27Rko
 4cxtTyxZ2PaXsKERURrnq573AU1Utt1jpkAazgPp7UCOqwJ4hKBWEz21qTP1Mz+EqupY8X/pgC/
 4vGCUNQ3VMb9eo4dDzS9X0LPH8yzcpC9or77pBIvatjwyn86D/o3wFctdvh+vFuZVDMyA3/MSPH
 /0vY5IpKOzCtFt4Ba2qHVQ4SnprInqtEYD0kNt3RnB12yFauaAuFcMXTTGlAyheOUDHN68AAIn8
 tSoCKbhVVSrrbS2ctGybfv148pl38wC/byXGntzu5EwOvAca2IlqfIyzzJoMBEBZYlA0yeDQhpi
 DDM1nncdH9HwCPw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Core GPIO code already does this for drivers, no need to duplicate the
check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-imx-scu.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 13baf465aedf..403d03f18122 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -37,9 +37,6 @@ static int imx_scu_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	int level;
 	int err;
 
-	if (offset >= chip->ngpio)
-		return -EINVAL;
-
 	mutex_lock(&priv->lock);
 
 	/* to read PIN state via scu api */
@@ -60,9 +57,6 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	struct scu_gpio_priv *priv = gpiochip_get_data(chip);
 	int err;
 
-	if (offset >= chip->ngpio)
-		return;
-
 	mutex_lock(&priv->lock);
 
 	/* to set PIN output level via scu api */
@@ -77,9 +71,6 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 
 static int imx_scu_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
-	if (offset >= chip->ngpio)
-		return -EINVAL;
-
 	return GPIO_LINE_DIRECTION_OUT;
 }
 

-- 
2.45.2

