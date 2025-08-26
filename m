Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2A830F55C
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200917; cv=none; b=DwYga3xCjp0JUEfZOssJN3PuK8tTnIWRdxzmNETlUL9aQVtpyZC1oudRCuVv5xVLpzEZrT/ugJ7iJwUKWsLAPtdNfzkui58rQSfaRZVNrT3/WfLLHjwY1zs/K8g4ysfRSianbyy3J50uDY/IvZub/LB2PNtTOl8YW+dqB5700ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200917; c=relaxed/simple;
	bh=iMU0rNgXbMpWcmAeYjzIqLI52qcL5///qyanpfM4ZAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fmxh/6lK/2KskWScW+qZ+4GLnIzfSzPdXqncSzON8TiEklJRfpbzcaZ+VbIZgy3HX3Qt9xDrT5tpcoWB62m3eRzcbGLKVFi9yoe34JuOVZTN0+SX7+EqzGEkqCKKcqiYYZV8lCCr0UPwmjDcpGtmxWy68VVkQ14CoQJhouMQVWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E0By+MSs; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E0By+MSs"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b05ac1eso29258005e9.1
        for <imx@lists.linux.dev>; Tue, 26 Aug 2025 02:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200914; x=1756805714; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGtfsW0w1WiZlRd5nd/Re/Px8c+YGmOHA/Ir0hFEdro=;
        b=E0By+MSsVoXe37n2UX667sB/gPykhawUOvCYeVE73cM1J8MY19HP0mfit/ifrQdH4a
         7Isxf8uZ0RQ4rQQz6XtrCQoDNByQ9hBuSpnjd725zZkD/WKbu25wsiyNlOt6KSe4f7gp
         tRLWpVnPEp5PbyE/x0+UOrqsCfqcziCa146yscYKtYxMt4bWxKRBJEylf4suQ8mRJmNr
         J+jrqsbD8NbcrNNd1KXxOWukfeFoYEJiF0YbRwwSkid7DbYRiT5GiGIchMNlOfxZWbR4
         Z2nK9elj8vvf4nQjmLxNijlXzUK63SK6Jo8nNQ8T5zCSS7U7DUlGHQOQjD/Jx0tRH7El
         DexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200914; x=1756805714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGtfsW0w1WiZlRd5nd/Re/Px8c+YGmOHA/Ir0hFEdro=;
        b=T2s213rq29PbXvMMlDvga5AjzfTCQbLFKrlVYVRM1zpwfnnWAvymN3iHm43ZRocBkw
         lr8GR//9bnRIvpU5LuOsx2d+BUO8z8ZumkpiFGX+8JxdqwBChN/oqVfFlRQo2QwpbfQK
         IMzET9FtDiiQ+m1p4x4itdPzPcOuRvJym46EbzI23HeK4Vb8oG4bdX4UfdC0Jj7nngX/
         BIrmetxGb+CrcjlwMj4CV3l5lA4PLUmEZAkfXiGgnJO+s0MteL0d7ownXrvzqxo3Q3bl
         A7q9VSvMEXwO4FjC3+tfA0c9xv9YzAj0lp4MApYXWrAOem21kvq8XT8cruJdq5nFyOZ0
         4v1A==
X-Forwarded-Encrypted: i=1; AJvYcCUNx2SkP5pOLDjwVhQxAc1/n/AOoqVG0tNQzZw846juxj49nAt90LXMhtzmh6IXgTRzId4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy12UdoTtNwN1UelVuhQmwFGfNdYKrd2kZUOZgoG5xHy6Aw94FS
	X/eHVM4q5/O2TBtqPsp7jc7hUqPMK7Dnjj9S1z/rG47jCqqZmKqFeYrVkKM+7f2sGW4=
X-Gm-Gg: ASbGncv/wpRipyLnnxj2CoVKdK8hfiaXWvrzP1NuJJtj37pCSSlQJMY25+NYotHIeLb
	7j82MIa5VO++74V0IIsm++J+c77bvNy/9J1OI1i2MtNzQwIkXg6HYhTha0HjO9TqxW0kmamXiYj
	cAYyrNr/TFx6x65aya1hCBE6bhg/oWGzPI1qJQ0dQQgX414IgfsnwG8GcKRz/IdjM2McBxd7s8z
	TPGz0EYgOUJSTwrf+lc4/1CztYDFJHPO6ursTvDCiI7Jlldkq10qsmHOFKJ+zUrt+cUrtUOWrdg
	WLGvPtGUC6KhZZm1Vjx4qyPCjcItoCE/M6OlcxE+UlMUI0LkOfaoO4RTCPE9R7zwjYMvFU6CkhY
	EY+LChSmc8tr+ffoa
X-Google-Smtp-Source: AGHT+IFCT8K43FmYf5m1ztIgvX2Fjw+GEW6Ck53Etdpp26KgnKp00bfzhvxPN07C+xOfaCd/tjuJQA==
X-Received: by 2002:a05:6000:43cc:20b0:3c6:aa87:d959 with SMTP id ffacd0b85a97d-3c6aa87dab1mr8425016f8f.26.1756200913910;
        Tue, 26 Aug 2025 02:35:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:03 +0200
Subject: [PATCH 02/12] gpio: mxs: order includes alphabetically
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-2-f67603e4b27e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/ZPycHZAJYq+cwPqjcUCTodGjlR5/fbPuBgY495SbXQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/MPuJ13oy7EJTZgd9B5mOUZ3BPJXtY/Ws7Y
 pBLB3iReFSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zAAKCRARpy6gFHHX
 cn8jEADiVhvactMnyVz0TLK/1lSYmKBQ0xCRvjBYVtCD5N/B1mqD/GKrYpGqbIw3KQrvl3LKs8A
 27a7sIyKR6tBNLoCkoHvIY3HtaZKYOs0wPuc5DMAtpCdJef3YJXOVijtKqzvIFxhcjOutGehOEv
 4hwpFsovmfK8YTOTUCr0blyP7zatckLDZsbIHo7WHlvlzAr1Pt53ZvH8Tq1HgiOmL7gVeJ/5UYN
 0GiilKgYrait3IrZKIRDqSfSpCcTOt7IYT3cEpWeKDVFfAm2pjkSpFa4/56RfzakYQ5uTbKT3xa
 jusqrQnLH5sdbPQ3DfbJizcsiy7j7bfQu+n49ak5dE3t1G4wX+BeUmUnI+d8PPm+YRdbhoXEllx
 BW1WnatXpWTjs9wUZ4ykXy6bPYjq1rXiqkoK2Rt8EEZFWcVO2TWSW7vxX0FNpJqPiLkbPX1ab/B
 dL6SxuxnPr462roWGxmp8yHz2Je8M20fwveLsi4Kth9CYuPQLdm3Wx7DLqlbwabVn4av+xuU+ip
 NPM0fLfjeUB41nXy+JOA+JXeoXkBSoJiourNZKsKLtWjKTKuW2nKHLGfGxnZo8+aqYGDXF3C346
 7yUTWG5BrVSV/lJqO7w0fretAVTMEcSorYpsFpSz2wQlii1NbmTe2MnyUgns+uG7Ja+/9ehF912
 y/G7Vqn+VCST8tA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For easier maintenance: put includes in alphabetical order.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mxs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 0ea46f3d04e128bc8e70941e26c618c0378ab9ae..bf0c97f589c96a5dce37dc140babda5998d5e365 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -7,17 +7,17 @@
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
 #include <linux/err.h>
+#include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio/driver.h>
-#include <linux/module.h>
 
 #define MXS_SET		0x4
 #define MXS_CLR		0x8

-- 
2.48.1

