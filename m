Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA83321441
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200923; cv=none; b=o4qroTQf3p4yDiVyyFc0IdvptagXg8Lmjqd/97MtOs/CmR+jVhj6sRwg2IukMySADEwJWCmNMAeW3uWUcEvpRVgc9fmgGxcpTNI+eTldZ5wjAtgi4ZIc2x9G+LIjLjt7Ut95/1aNDp0R+QBjz5I+SWReNp7PdCycQCTYV10aHIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200923; c=relaxed/simple;
	bh=NCDmR8VrFkSe2Rau/GRG0O7l/vHPKCnQury/GJvGAig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8B8WWQN0Qxo0Hxl4nHNe91ju/DU1q0rWKYkSFrUIdnY95cglRafEwL2PjxEMiKXaxKNB+OLoNMshnurnmc0kHcOJugYdXR4QJrxUKGek7ifF+15cf50oqq5mKki8a0o8Eg5nwW59Uh7LkmdjItvTtaJ40pglI2qYO5iOm62G94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Alo5znLz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Alo5znLz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c68ac7e238so1820765f8f.1
        for <imx@lists.linux.dev>; Tue, 26 Aug 2025 02:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200919; x=1756805719; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdMjE/IUNg9nUBZWSwSrF0HUJBl5tL7A+dP3nDcIACE=;
        b=Alo5znLzUaoAhUxGiEQeGMwQeQWsSdoNs4i/KUXrzsgcK8v61ghmaHBhH1ELx53z8w
         qGzSmRFy6EEklen3RdLEDTey58pcdl+UmAW1Cez+i8EHH3a0zKpimhpBTiwVIgQF3gWs
         LjfTHz88w5Sj/B6vjqZCf/8KlHPgTldxY8uj9DfAJG3Ch++55OFgZAiYdKyahKxCRFIV
         fLl/0Nu7YjUk0XD6RhTQEit5D+yVdgN2SaRxnkmFpfzYhroXkk8FNHfH2eKYlmad1Amd
         TLCDaGjlHHJSgB5TBTlWIqrX3YqfuXqmqodHzH2vb000hrfipUiLmkdn6YJvB2yfaWBu
         jLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200919; x=1756805719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdMjE/IUNg9nUBZWSwSrF0HUJBl5tL7A+dP3nDcIACE=;
        b=KHXvVtxCEH1QQUwGCNSaOgvc+FUm5R81Wt8+oIGAaS+JS/q5f4XUDVv9J8YPWzExCR
         haevA445AZDIt9LcVg0CHmOwtnB1LQac9MvV/pl2T8Q1yGeBjgvqkrVZapZ10DhFEIvT
         KpB51g+UfVWa62ORMlssRME8vXfLif+7Y/AUJldn2ECs47u7Em3SAMM3AhBPYUiVYzas
         KGj+yJyHBDDYV+Pt6PCM3YWTg9+RO1P7Jt1mBs7sYNGMQ/KxcdqyrSPpxFrsAjCqGqj8
         FHh4+OyTYDFDraCJLAwD+QqTXvmqNxPaCkKs2AYNd8RPuf3Ps8QhGWeFra0g95geB1BN
         LaWg==
X-Forwarded-Encrypted: i=1; AJvYcCVlpSGL6XDMJhH316czuH+V88Vtw82+73Qxfr3SiFS8HWmqF+RGvQ30kHFFxbsmBB5dAas=@lists.linux.dev
X-Gm-Message-State: AOJu0YxX0pNab0XwrnzM+DKAjc/bkDHRJ6v2wrxnTZE6A4m2sodLk4QA
	LcLTGZfjRvxjG6+0sSZq96Sn9f+0q1Q4ca7qV6mNs4hkcCgvr6K72Z4yBS0T9bUHUIw=
X-Gm-Gg: ASbGncufURxnyR68GEldgMjMXd5djlES8TtyE5cUBisdaAoYK6hYZZNJpSdCv52ZkrA
	ayx93eFjV9KiR3z2cMdDBZt6SbXCaxrXRhEjEphXhf/avDX0aPJfv/UqroIc9pWrjgceZRlTl+w
	FiGrf1c2ewtQDWW7aXX63bVkUN7yRolj/PFhIah7gRy+hF9V2f5ERasZylSwaw33YmMNMgxIEcu
	mIvFbzqT4gPZA03qLw+nKP5OrIi2BzhuqXwV9Y8JNp2/+7SfE3gSLys/STMxkvJcj1l7NvSDaxV
	1EG3069t8FDpW0dgTZ3i3XSW6rD4Z8MkkxZ7VB3GkB9/rW8bSq1lrbHwkJKO0nZH43KDIqQTSCX
	68GUK32qMjKlZwATtInnm1qz5Jlg=
X-Google-Smtp-Source: AGHT+IGFYppzg7ppfW2qCUHYBmIKcwWqnK+38KV0dVpWZJbB4VXKyNsvmKpRrAApETlF5QIhTbSsTw==
X-Received: by 2002:a05:6000:220f:b0:3c9:b8b7:ea3d with SMTP id ffacd0b85a97d-3c9b8b7ec0amr4709288f8f.51.1756200919352;
        Tue, 26 Aug 2025 02:35:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:08 +0200
Subject: [PATCH 07/12] gpio: ftgpio010: order includes alphabetically
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-7-f67603e4b27e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5rbP7dwhRhfDrSbAgYMHtgCgxy4erM0JGqfIF8jsC5k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/N9SEBtr9CQED5vzENsLuHUQqYMiCsah98i
 +4dFAPqdECJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zQAKCRARpy6gFHHX
 cpDiD/4801Pac5QlHO6D9jKqnSPRvfkYUesEBYjOQoRoQO7T3lf+1NnMxw62VB+bKhsMavf0Pbm
 hO4Nf/NyHZpSXp3pPIPf9G+kVN6fcNQ5qBrs+gvi7JsR0X2JGRgfZlxh91Vk12yRTsW+NDErwPh
 JmL+8+8nQeFJ6q3ss63UDHJvgZILjabTP5RSIH0wb7M50VPU+8QwdjAhENUEiBirB8f9QNC6jNb
 goJ5DFK2XnM7sIEvMN5gTAz9sbtGbRZCKyoI/HbhHu+eITH4TGjUPJPRuPmZHXqnRFoa8nz0T7E
 cVm1uU1U7CDvOl9ovupCoxm+qdoi4XfEqjtS9aOP6J8pXUCn+WHqJTSDseqMZwEEy8x9eN1gYKE
 GzQRnaSgDGQdZmp5eheDhiV8FTP+ayHa9JLVmpT+Z85XPGz3YPLU7c/nrRHKNlM+n6XO7w3wqrs
 B4BGQ9Bnzs1NMsnAQ4IbStfy/yuv9BJrt64xwx96w2WkgjmViYp7gMuz+DfAprX7CHwjoVvR8Zz
 inkriWAohdiEy6QdfmfNRMyyzE8mbYJDNdWopcB8mztbZOHe+frPa5b3pRbzTNFsFcxOIedt0b3
 k2dPSKvKi5mp0nqiyLBCC+x3tg02ix1A+UI421kKbUVpGS36GNX4S99VMZqQFJwElEDaiuX68Md
 6dX8YoVapsqzaew==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For easier maintenance: put includes in alphabetical order.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ftgpio010.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index c35eaa2851d8533309fe04a3e6265d9a7947606d..56666ca8889bc92b91b160751728b65e287b0123 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -10,12 +10,13 @@
  * MXC GPIO support. (c) 2008 Daniel Mack <daniel@caiaq.de>
  * Copyright 2008 Juergen Beisert, kernel@pengutronix.de
  */
-#include <linux/gpio/driver.h>
-#include <linux/io.h>
-#include <linux/interrupt.h>
-#include <linux/platform_device.h>
+
 #include <linux/bitops.h>
 #include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
 
 /* GPIO registers definition */
 #define GPIO_DATA_OUT		0x00

-- 
2.48.1

