Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457EB266EE2
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392522; cv=none; b=pU9o+38xbGwYVkL9IDATqYmR/bN2s/mucHk6KjJxegu7s/hrzqEtMLR2M/Rj2pb1m/bRJuXz8JbNWFTca26kEkozLWt4u/irB9jbGOSfLtv/cQtzTFE9RZFhmtNmbdMRNJdFTx83zePwjBjyB72D0NMfciSKBt98ZcWP8Icj3Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392522; c=relaxed/simple;
	bh=2cFJXYo0w8FqSMoLTGOzW7U788xqfufg1/ACcV2UDhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lb+t6K1nFrPPhVRmTQ9vTKb6HugpvHzapEXSYFBgVHamG99xthwk/aa+7f2JOd7e4z4u0S5qMzYi0aCvBqQiSNyL5WuaTbDWsugnmyyp9gJAT68ZGYy5zRNGuwtP8coix/Xi8afOROzBi5FkDXaq3pilGaD5xKP6kJRtCKD4C6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V3JctFYN; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V3JctFYN"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so4230141f8f.3
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 00:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392518; x=1745997318; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jpIbuhGqJno2oGiD2+OmhnBmP+B6R6TyA8FsjUZXAA=;
        b=V3JctFYN34sH8aZoKbE1WvCU2QIK3hdYL9OpQ0Tkc/XjeD2bQ4iEUYf3LDryJDbkm/
         4fSgOORtUd34qVqdpmE7RdxwiUsqA9nm4vqPSTSoZ5t6wE+Ie+8vc9fIKNCnq8sBAhQH
         SmWi0OAR5v6dz77F28VVkyAmogIg2m/ZlsxRP7L0iCWat2wpT6s88+DMQACJOy0LIZEZ
         HrmAcWCMpT9WwCzumw0bTpWVWVyLpl+6MWD9tWpw/fBz5r4LYHtXQbgnszU8TL97CyHn
         h0h3yh1D/fTooH2lePT4a8viMvYjN6ewbkigMD0rJrqHbYHo4EcbOMICKPHJvMZEnGZt
         Ih2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392518; x=1745997318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jpIbuhGqJno2oGiD2+OmhnBmP+B6R6TyA8FsjUZXAA=;
        b=qPdvA/4BlyirraCDte2BveplUlHLfMj+/nadAV+PKpcbgr/BLmapKVrJ0mXyAlAdn+
         NcK0GM0pDWz82Yz8pDKdiR4JCLjPaTfFHQxjXPLeeOPsBEmJBwog52pxiy6Gismz2cIA
         vWxIh9FBus5+FErMrKCIHAUUCiiA2g3VEg7kW8XgjKGS7FetL1Mn7n5UpW9PF4Xn5zMW
         ByYGo6BTl6IaTQuOZ8tBbW7qQ6bdOHUc3lVf12GZtE0ZrkPihGOvTKr7DVFbY2nG1SWY
         g871hBKqGcVNHjwcTp6lArmPsq8PUaSNWayGrfAPsKQjySJuU5nwZNcgK5nL4poPbD0j
         RQWw==
X-Forwarded-Encrypted: i=1; AJvYcCVUPyYz/KXveHNP7O66DJRjx8mJj/8FmvSWSlqPCRNwKquaax+jNqBvrRfLd3NW6PnuIC4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxI9Dw2VcCfMLm85bnD/8CixLs/q1bnEBAsZJ3omMpU7/Ly8GC+
	IGlIaqN8MLLZxMJpwPaWk94NNU7hZoEt+XxJj+2BlCWOuK7sBybz9PKVmqEI+ds=
X-Gm-Gg: ASbGnctTN0n5b0Wq9IkwYCPFZZhIwnf81eNzdxme+C5gMOehjRcK2B7X0F3rWzIuzeK
	PFpN1sMU7TdlQStOEKbBo8EraO6fBJ2Kam3RFGmJLwP+hs7BRZexQiZpO+CjiPgRjtLrVao3XF5
	H9nXPk1sErb5/jLpiTd7X3DunJ9n2A5PN9SqgkwnjUwrQZ1NdTTMXpJX4Qi09M0Vp6ezb0TqADw
	KIHvEHtnva9D5JubXZNYpaBklRSnFWe836ndRch4or+/Zmx8AFunfP6lvuk0Pxox0+c7/GcNkd+
	d5g42ieIkoGlBJ6KxIS2tfP9ss75huv88Q==
X-Google-Smtp-Source: AGHT+IGnUpS9ou6nffd7s4SVUQaTSNl4pQx4m4r5Zz5uifmJEfnPn7s/u9+lgkiPgaAvunq1Xc6dfA==
X-Received: by 2002:a05:6000:4310:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39efba5b778mr13229816f8f.30.1745392518529;
        Wed, 23 Apr 2025 00:15:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:04 +0200
Subject: [PATCH 02/12] gpio: imx-scu: use lock guards
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-2-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MkOnT4yNUZeyHThpCK5EaJBEstX46Cy8bj/Sje8L+og=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOBKq6/ZTVbZPDWRuhYrH8TZUsVagJXdkY5i
 QrnwxvwAYeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgQAKCRARpy6gFHHX
 ckEeD/9l4SbUhQKoQaEIERaYqDCzXTHhqB5KuenMgC5r/g5sYiqxqQjudVfEJavtD4haF+6aS9o
 xBIvX9GLhKUl5ZIikmZsrdlMshgyIY28XvfD/BydQE7ZJUgLGaEW4ZjytZz1E/tb5W1O/0WR0NY
 hshNdM49zRWRWZX1Nj4xFECkTnuriQt6vmLJPjpTRc9vO6lI6hRu44vwjuC1+TrsGWo8E6drr5H
 shZ1C+A2LYp6h2edfZQsuuJb5IDheLLXrvKO4LqnN15DZFRU6Y6wTy/WreZUw6PZm7I0cUftKdc
 0ScZ/KPtiTI0XPv3J5Q/skCvJBb8trn1KYQCEEo4Mr2kmHiKvQbTocvrnd9vHZm6iiCV9DUqHgE
 tZMYBL/xY6sxHdGwez2RZp3AwIv45VDRo9qEEPgDwPAjZSPISB9pOVdqLbIcTQqz4dAWvTiPBb2
 tlYO46y6cpcw+IgSpYcXNJJR69S76gYbbfqTlXnIbrvHyPBN/aFH/dMKoKT5FPIz1PhwVILoE2Y
 6dyGGas9foRrvCR4ndO+4uzKrs8XDjvws3vVumzhIUtsJ0W7NHvpiVOHfg7OW3efAMUSP8oyphB
 byaiS/R0pIxiZ+DHEKog1C2cE0qzDut0dyfGx+V+wagrqQ3BRdYAo1aT06StAe6hSgK/ej4OGdU
 +WVTqdlbOWnq5cw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code by using lock guards from cleanup.h with the driver's
mutex.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-imx-scu.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 403d03f18122..99df95e65820 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -6,8 +6,10 @@
  * to control the PIN resources on SCU domain.
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 #include <linux/firmware/imx/svc/rm.h>
@@ -37,13 +39,11 @@ static int imx_scu_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	int level;
 	int err;
 
-	mutex_lock(&priv->lock);
-
-	/* to read PIN state via scu api */
-	err = imx_sc_misc_get_control(priv->handle,
-			scu_rsrc_arr[offset], 0, &level);
-	mutex_unlock(&priv->lock);
-
+	scoped_guard(mutex, &priv->lock) {
+		/* to read PIN state via scu api */
+		err = imx_sc_misc_get_control(priv->handle,
+					      scu_rsrc_arr[offset], 0, &level);
+	}
 	if (err) {
 		dev_err(priv->dev, "SCU get failed: %d\n", err);
 		return err;
@@ -57,13 +57,11 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	struct scu_gpio_priv *priv = gpiochip_get_data(chip);
 	int err;
 
-	mutex_lock(&priv->lock);
-
-	/* to set PIN output level via scu api */
-	err = imx_sc_misc_set_control(priv->handle,
-			scu_rsrc_arr[offset], 0, value);
-	mutex_unlock(&priv->lock);
-
+	scoped_guard(mutex, &priv->lock) {
+		/* to set PIN output level via scu api */
+		err = imx_sc_misc_set_control(priv->handle,
+					      scu_rsrc_arr[offset], 0, value);
+	}
 	if (err)
 		dev_err(priv->dev, "SCU set (%d) failed: %d\n",
 				scu_rsrc_arr[offset], err);

-- 
2.45.2

